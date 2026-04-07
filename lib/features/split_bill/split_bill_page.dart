import 'package:SalesMo/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:hugeicons/styles/stroke_rounded.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SplitBillPage extends StatefulWidget {
  const SplitBillPage({super.key});

  @override
  State<SplitBillPage> createState() => _SplitBillPageState();
}

class _SplitBillPageState extends State<SplitBillPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    if (cameras.isEmpty) {
      _initializeControllerFuture = Future.error('No camera found');
      return;
    }

    _controller = CameraController(cameras[0], ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [SizedBox.expand(child: CameraPreview(_controller))],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(220, 0, 0, 0),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await _initializeControllerFuture;
                    final image = await _controller.takePicture();

                    // pakai image_picker
                    print(image.path);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedShieldQuestionMark,
                        size: 40,
                        color: Color(0xFF5BAE1B),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    // pakai image_picker
                    // final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedCamera03,
                        size: 40,
                        color: Color(0xFF5BAE1B),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    // pakai image_picker
                    // final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedImageUpload,
                        size: 40,
                        color: Color(0xFF5BAE1B),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
