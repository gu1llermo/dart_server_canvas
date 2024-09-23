import 'package:dart_server_canvas/models/offset.dart';
import 'package:socket_io/socket_io.dart';

int contador = 0;

void main(List<String> args) {
  final io = Server();
  io.on('connection', (client) {
    contador++;
    print('Contador= $contador');

    print('Client connected ${client.id}');

    client.join('canvasRoom'); //

    client.on('canvas', (data) {
      // me dí cuenta que los clientes cuando usan éste canal
      // siempre mandan un dato, así que no puede ser nulo

      final offset = Offset.fromJson(data);
      final dataJson = offset.toJson();
      io.to('canvasRoom').emit('draw', dataJson);
    });

    client.on('endLine', (data) {
      io.to('canvasRoom').emit('endLine', null);
    });

    client.on('clearCanvas', (data) {
      io.to('canvasRoom').emit('cleaningCanvas', null);
      io.to('canvasRoom').emit('endLine', null);
    });
  });
  io.listen(3000);
}
