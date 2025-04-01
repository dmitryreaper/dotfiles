public class Main {
	// Общий ресурс для синхронизации
	public static Integer commonRes = 0;

	public static void main(String[] args) {
		for (int i = 0; i < 10; i++) {
			int threadNumber = i; // Сохраняем значение i для текущего потока
			new Thread(() -> {
					synchronized (commonRes) { // Синхронизация на ресурсе commonRes
						commonRes = 1;
						for (int j = 0; j < 5; j++) {
							System.out.println(Thread.currentThread().getName() + " " + commonRes);
						}
					}
			}, "Thread0" + threadNumber).start();
		}
	}
}