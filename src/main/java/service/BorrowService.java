package service;

import model.Transaction;
import java.util.ArrayList;
import java.util.List;

public class BorrowService {
    private static final String FILE_NAME = "borrowed_books.txt";

    public void borrowBook(Transaction t) {
        List<String> lines = new ArrayList<>();
        lines.add(t.toString());
        FileHandler.writeToFile(FILE_NAME, lines, true);
    }

    public List<Transaction> getAllTransactions() {
        List<String> lines = FileHandler.readFromFile(FILE_NAME);
        List<Transaction> transactions = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 8) {
                Transaction t = new Transaction(parts[0], parts[1], parts[2], parts[3], parts[4], parts[6]);
                t.setReturnDate(parts[5]);
                t.setFine(Double.parseDouble(parts[7]));
                transactions.add(t);
            }
        }
        return transactions;
    }

    public List<Transaction> getByUserId(String userId) {
        List<Transaction> userTrans = new ArrayList<>();
        for (Transaction t : getAllTransactions()) {
            if (t.getUserId().equals(userId)) {
                userTrans.add(t);
            }
        }
        return userTrans;
    }

    public void updateTransaction(Transaction updated) {
        List<Transaction> all = getAllTransactions();
        List<String> lines = new ArrayList<>();
        for (Transaction t : all) {
            if (t.getId().equals(updated.getId())) {
                lines.add(updated.toString());
            } else {
                lines.add(t.toString());
            }
        }
        FileHandler.writeToFile(FILE_NAME, lines, false);
    }
}
