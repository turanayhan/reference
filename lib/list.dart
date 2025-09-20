import 'package:view_ref/model/leave_data.dart';
import 'package:view_ref/model/leave_model.dart';
import 'package:view_ref/model/payment.dart';

class LeaveDummyData {
  static List<LeaveData> getLeaves() {
    return [
      LeaveData(
        id: 1,
        days: 3,
        startDate: "2025-09-10",
        endDate: "2025-09-12",
        description: "Yıllık izin",
        status: "rejected",
        employee: Employee(
          id: 101,
          name: "Ahmet Yılmaz",
          email: "ahmet@example.com",
          role: "Personel",
        ),
        company: Company(
          id: 201,
          name: "OpenAI Teknoloji AŞ",
          city: "İstanbul",
          district: "Kadıköy",
        ),
        leaveRule: LeaveRule(
          id: 1,
          name: "Yıllık İzin",
          description: "Çalışanların yıllık izin hakkı",
        ),
        approvalFlow: ApprovalFlow(
          id: 11,
          status: "rejected",
          steps: [
            ApprovalStep(
              id: 1,
              stepOrder: 1,
              status: "approved",
              employee: Employee(
                id: 301,
                name: "Yönetici 1",
                email: "yonetici1@example.com",
                role: "Manager",
              ),
            ),
            ApprovalStep(
              id: 2,
              stepOrder: 2,
              status: "rejected",
              employee: Employee(
                id: 302,
                name: "İK Yetkilisi",
                email: "ik@example.com",
                role: "HR",
              ),
            ),
          ],
        ),
      ),
      LeaveData(
        id: 2,
        days: 1,
        startDate: "2025-09-15",
        endDate: "2025-09-15",
        description: "Sağlık raporu",
        status: "pending",
        employee: Employee(
          id: 102,
          name: "Mehmet Demir",
          email: "mehmet@example.com",
          role: "Mühendis",
        ),
        company: Company(
          id: 202,
          name: "AI Yazılım Ltd.",
          city: "Ankara",
          district: "Çankaya",
        ),
        leaveRule: LeaveRule(
          id: 2,
          name: "Mazeret İzni",
          description: "Sağlık sebebiyle izin",
        ),
        approvalFlow: ApprovalFlow(
          id: 22,
          status: "pending",
          steps: [
            ApprovalStep(
              id: 3,
              stepOrder: 1,
              status: "pending",
              employee: Employee(
                id: 401,
                name: "Yönetici 2",
                email: "yonetici2@example.com",
                role: "Manager",
              ),
            ),
          ],
        ),
      ),
      LeaveData(
        id: 3,
        days: 5,
        startDate: "2025-09-20",
        endDate: "2025-09-24",
        description: "Tatil izni",
        status: "approved",
        employee: Employee(
          id: 103,
          name: "Ayşe Kaya",
          email: "ayse@example.com",
          role: "Uzman",
        ),
        company: Company(
          id: 203,
          name: "Tech Solutions Ltd.",
          city: "İzmir",
          district: "Konak",
        ),
        leaveRule: LeaveRule(
          id: 1,
          name: "Yıllık İzin",
          description: "Çalışanların yıllık izin hakkı",
        ),
        approvalFlow: ApprovalFlow(
          id: 33,
          status: "approved",
          steps: [
            ApprovalStep(
              id: 4,
              stepOrder: 1,
              status: "approved",
              employee: Employee(
                id: 501,
                name: "Yönetici 3",
                email: "yonetici3@example.com",
                role: "Manager",
              ),
            ),
            ApprovalStep(
              id: 5,
              stepOrder: 2,
              status: "approved",
              employee: Employee(
                id: 502,
                name: "İK Müdürü",
                email: "ikmudu@example.com",
                role: "HR Manager",
              ),
            ),
          ],
        ),
      ),
    ];
  }
}




class PaymentDummyData {
  static List<Payment> getPayments() {
    return [
      Payment(
        id: 1,
        employeeId: 101,
        companyId: 201,
        category: "Yol Masrafı",
        amount: 150.50,
        currency: "TL",
        taxRate: "18",
        receiptDate: "2025-09-08",
        description: "Müşteri ziyareti için taksi masrafı",
        skipApproval: 0,
        notifyEmployee: 1,
        isPaid: 0,
        status: "pending",
        createdAt: "2025-09-08T10:30:00Z",
        updatedAt: "2025-09-08T10:30:00Z",
        employee: Employee(
          id: 101,
          name: "Ahmet Yılmaz",
          email: "ahmet@example.com",
          role: "Satış Temsilcisi",
        ),
        files: [],
        approvalFlow: ApprovalFlow(
          id: 11,
          status: "pending",
          steps: [
            ApprovalStep(
              id: 1,
              stepOrder: 1,
              status: "pending",
              employee: Employee(
                id: 301,
                name: "Satış Müdürü",
                email: "satismudu@example.com",
                role: "Manager",
              ),
            ),
          ],
        ),
      ),
      Payment(
        id: 2,
        employeeId: 102,
        companyId: 202,
        category: "Yemek Masrafı",
        amount: 85.00,
        currency: "TL",
        taxRate: "8",
        receiptDate: "2025-09-12",
        description: "İş yemeği masrafı",
        skipApproval: 0,
        notifyEmployee: 1,
        isPaid: 1,
        status: "approved",
        createdAt: "2025-09-12T14:15:00Z",
        updatedAt: "2025-09-13T09:20:00Z",
        employee: Employee(
          id: 102,
          name: "Mehmet Demir",
          email: "mehmet@example.com",
          role: "Proje Yöneticisi",
        ),
        files: [],
        approvalFlow: ApprovalFlow(
          id: 22,
          status: "approved",
          steps: [
            ApprovalStep(
              id: 2,
              stepOrder: 1,
              status: "approved",
              employee: Employee(
                id: 402,
                name: "İK Yetkilisi",
                email: "ik@example.com",
                role: "HR",
              ),
            ),
            ApprovalStep(
              id: 3,
              stepOrder: 2,
              status: "approved",
              employee: Employee(
                id: 403,
                name: "Mali İşler Müdürü",
                email: "mali@example.com",
                role: "Finance Manager",
              ),
            ),
          ],
        ),
      ),
      Payment(
        id: 3,
        employeeId: 103,
        companyId: 203,
        category: "Kırtasiye",
        amount: 250.75,
        currency: "TL",
        taxRate: "18",
        receiptDate: "2025-09-05",
        description: "Ofis malzemeleri alımı",
        skipApproval: 0,
        notifyEmployee: 1,
        isPaid: 0,
        status: "rejected",
        createdAt: "2025-09-05T11:45:00Z",
        updatedAt: "2025-09-06T16:30:00Z",
        employee: Employee(
          id: 103,
          name: "Ayşe Kaya",
          email: "ayse@example.com",
          role: "Muhasebe Uzmanı",
        ),
        files: [],
        approvalFlow: ApprovalFlow(
          id: 33,
          status: "rejected",
          steps: [
            ApprovalStep(
              id: 4,
              stepOrder: 1,
              status: "approved",
              employee: Employee(
                id: 501,
                name: "Departman Yöneticisi",
                email: "depyonetici@example.com",
                role: "Department Manager",
              ),
            ),
            ApprovalStep(
              id: 5,
              stepOrder: 2,
              status: "rejected",
              employee: Employee(
                id: 502,
                name: "Genel Müdür",
                email: "gm@example.com",
                role: "General Manager",
              ),
            ),
          ],
        ),
      ),
      Payment(
        id: 4,
        employeeId: 104,
        companyId: 201,
        category: "Konaklama",
        amount: 320.00,
        currency: "TL",
        taxRate: "8",
        receiptDate: "2025-09-18",
        description: "Şehir dışı iş seyahati konaklama",
        skipApproval: 0,
        notifyEmployee: 1,
        isPaid: 1,
        status: "approved",
        createdAt: "2025-09-18T08:00:00Z",
        updatedAt: "2025-09-19T12:45:00Z",
        employee: Employee(
          id: 104,
          name: "Fatma Öz",
          email: "fatma@example.com",
          role: "İnsan Kaynakları Uzmanı",
        ),
        files: [],
        approvalFlow: ApprovalFlow(
          id: 44,
          status: "approved",
          steps: [
            ApprovalStep(
              id: 6,
              stepOrder: 1,
              status: "approved",
              employee: Employee(
                id: 601,
                name: "İK Müdürü",
                email: "ikmudu@example.com",
                role: "HR Manager",
              ),
            ),
          ],
        ),
      ),
      Payment(
        id: 5,
        employeeId: 105,
        companyId: 202,
        category: "Telefon",
        amount: 45.50,
        currency: "TL",
        taxRate: "18",
        receiptDate: "2025-09-20",
        description: "Aylık telefon fatura payı",
        skipApproval: 0,
        notifyEmployee: 1,
        isPaid: 0,
        status: "pending",
        createdAt: "2025-09-20T16:30:00Z",
        updatedAt: "2025-09-20T16:30:00Z",
        employee: Employee(
          id: 105,
          name: "Can Yıldız",
          email: "can@example.com",
          role: "Yazılım Geliştirici",
        ),
        files: [],
        approvalFlow: ApprovalFlow(
          id: 55,
          status: "pending",
          steps: [
            ApprovalStep(
              id: 7,
              stepOrder: 1,
              status: "pending",
              employee: Employee(
                id: 701,
                name: "Teknoloji Müdürü",
                email: "tekmudu@example.com",
                role: "Tech Manager",
              ),
            ),
          ],
        ),
      ),
    ];
  }
}