class Node<T> {
  T value;
  Node<T>? next;

  Node(this.value);
}

class Queue<T> {
  Node<T>? _head;
  Node<T>? _tail;
  int _size = 0;

  bool get isEmpty => _head == null;

  int get size => _size;

  void enqueue(T value) {
    final newNode = Node(value);

    if (isEmpty) {
      _head = newNode;
      _tail = newNode;
    } else {
      _tail?.next = newNode;
      _tail = newNode;
    }

    _size++;
  }

  T? dequeue() {
    if (isEmpty) {
      print("Antrian Kosong");
      return null;
    }

    final removedValue = _head!.value;
    _head = _head!.next;
    _size--;

    if (isEmpty) {
      _tail = null;
    }

    return removedValue;
  }

  void printQueue() {
    Node<T>? current = _head;
    int num = 1;
    while (current != null) {
      print("${num} : ${current.value}");
      current = current.next;
      num++;
    }
  }
}

void main() {
  final antrianBpjs = Queue();

  antrianBpjs.enqueue("Faqih");
  antrianBpjs.enqueue("Jovan");
  antrianBpjs.enqueue("Fahmi");

  print("=== Antrial Awal ===");
  print("Jumlah Antrian: ${antrianBpjs.size}");
  antrianBpjs.printQueue();

  print("\n=== 1 Peserta Memasuki Antrian ===");
  antrianBpjs.enqueue("Jep");

  print("=== Antrian Saat Ini ===");
  print("Jumlah Antrian: ${antrianBpjs.size}");
  antrianBpjs.printQueue();

  print("\n=== 1 Peserta Dipanggil ===");
  print("Peserta dipanggil: ${antrianBpjs.dequeue()}");

  print("\n=== Antrian Saat Ini ===");
  print("Jumlah Antrian: ${antrianBpjs.size}");
  antrianBpjs.printQueue();
}
