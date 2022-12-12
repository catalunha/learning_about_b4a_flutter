import 'package:flutter/material.dart';
import 'package:fluxus/app/core/enums/office_enum.dart';
import 'package:fluxus/app/core/utils/allowed_access.dart';
import 'package:fluxus/app/routes.dart';
import 'package:fluxus/app/view/controllers/splash/splash_controller.dart';
import 'package:fluxus/app/view/pages/home/parts/popmenu_user.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            "Olá, ${_splashController.userModel!.profile!.name ?? 'Atualize seu perfil.'}.")),
        actions: [
          PopMenuButtonPhotoUser(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomeTeam(),
            HomeClient(),
            HomeExpect(),
            HomeAttendance(),
            HomeEvent(),
            HomeEvaluation(),
            HomeEvolution(),
            HomeInvoice(),
          ],
        ),
      ),
    );
  }
}

class HomeAddEvent extends StatelessWidget {
  const HomeAddEvent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AllowedAccess.consultFor([OfficeEnum.secretaria.id])) {
      return Card(
        child: ListTile(
          leading: const Icon(Icons.event),
          title: const Text('Cadastrar evento'),
          onTap: () {
            Get.toNamed(Routes.eventAddEdit, arguments: null);
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

// class HomeSearchEvent extends StatelessWidget {
//   const HomeSearchEvent({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (AllowedAccess.consultFor([OfficeEnum.secretaria.id])) {
//       return Card(
//         child: ListTile(
//           leading: const Icon(Icons.search),
//           title: const Text('Buscar Evento'),
//           subtitle: const Text('Por ...'),
//           onTap: () {
//             Get.toNamed(Routes.eventSearch);
//           },
//         ),
//       );
//     } else {
//       return const SizedBox.shrink();
//     }
//   }
// }

// bool AllowedAccess.consultFor(List<String> officeIdListAutorized) {
//   final splashController = Get.find<SplashController>();
//   return splashController.officeIdList
//       .any((element) => officeIdListAutorized.contains(element));
// }

class HomeSearchAttendance extends StatelessWidget {
  const HomeSearchAttendance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AllowedAccess.consultFor([OfficeEnum.secretaria.id])) {
      return Card(
        child: ListTile(
          leading: const Icon(Icons.search),
          title: const Text('Buscar atendimento'),
          subtitle: const Text('Por ...'),
          onTap: () {
            Get.toNamed(Routes.attendanceSearch);
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class HomeAddAttendance extends StatelessWidget {
  const HomeAddAttendance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AllowedAccess.consultFor([OfficeEnum.secretaria.id])) {
      return Card(
        child: ListTile(
          leading: const Icon(Icons.view_compact_outlined),
          title: const Text('Gerar atendimento'),
          onTap: () {
            Get.toNamed(Routes.attendanceAddEdit);
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class HomeTeam extends StatelessWidget {
  const HomeTeam({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AllowedAccess.consultFor([OfficeEnum.secretaria.id])) {
      return Card(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.people_alt,
              ),
            ),
            Column(
              children: [
                const Text('Equipe'),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.teamProfileSearch);
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class HomeClient extends StatelessWidget {
  const HomeClient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AllowedAccess.consultFor([OfficeEnum.secretaria.id])) {
      return Card(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.personal_injury,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Paciente'),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.clientProfileAddEdit);
                      },
                      icon: const Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.clientProfileSearch);
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class HomeExpect extends StatelessWidget {
  const HomeExpect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.punch_clock,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Lista de espera'),
              Row(
                children: [
                  if (AllowedAccess.consultFor([OfficeEnum.secretaria.id]))
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.expectAddEdit);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  if (AllowedAccess.consultFor([
                    OfficeEnum.secretaria.id,
                    OfficeEnum.avaliadora.id,
                  ]))
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.expectSearch);
                      },
                      icon: const Icon(Icons.search),
                    ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class HomeAttendance extends StatelessWidget {
  const HomeAttendance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AllowedAccess.consultFor([OfficeEnum.secretaria.id])) {
      return Card(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.view_compact_outlined,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Atendimentos'),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.attendanceAddEdit);
                      },
                      icon: const Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.attendanceSearch);
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class HomeEvent extends StatelessWidget {
  const HomeEvent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.event,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Eventos'),
              Row(
                children: [
                  if (AllowedAccess.consultFor([OfficeEnum.secretaria.id]))
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.eventAddEdit, arguments: null);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.eventSearch);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class HomeEvaluation extends StatelessWidget {
  const HomeEvaluation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!AllowedAccess.consultFor([OfficeEnum.secretaria.id])) {
      return Card(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.add_comment_outlined,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ficha de avaliação'),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.evaluationAddEdit, arguments: null);
                      },
                      icon: const Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.evaluationSearch);
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class HomeEvolution extends StatelessWidget {
  const HomeEvolution({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!AllowedAccess.consultFor([OfficeEnum.secretaria.id])) {
      return Card(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.health_and_safety,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Evolução'),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.evolutionSearch);
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class HomeInvoice extends StatelessWidget {
  const HomeInvoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AllowedAccess.consultFor([OfficeEnum.secretaria.id])) {
      return Card(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.inventory_outlined,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Fatura'),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Get.toNamed(Routes.evolutionSearch);
                      },
                      icon: const Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        // Get.toNamed(Routes.evolutionSearch);
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
