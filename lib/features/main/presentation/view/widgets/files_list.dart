import 'dart:io';
import 'package:file_manger_app/features/main/presentation/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'custom/file_card.dart';
import 'package:path/path.dart';

class FilesListWidget extends StatelessWidget {
  const FilesListWidget({
    super.key,
    required this.itemCount,
    required this.entities,
  });
  final int itemCount;
  final List<FileSystemEntity> entities;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      padding: EdgeInsets.symmetric(horizontal: 10.w,),
      itemBuilder: (context, index) {
        return FileCardWidget(
          entity: entities[index],
          isFile: entities[index] is File,
          title: basename(entities[index].path),
          onTap: () {
            if (entities[index] is File) {
              OpenFile.open(entities[index].path);
            } else {
              context.read<MainProvider>().directory =
                  entities[index] as Directory;
              context.read<MainProvider>().getData();
            }
          },
        );
      },
    );
  }
}
