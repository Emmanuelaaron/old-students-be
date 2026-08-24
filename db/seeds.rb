# frozen_string_literal: true

puts "Seeding HCLV Old Students' Association…"

Contribution.destroy_all
LoginOtp.destroy_all
AnnualSubscription.destroy_all
RoleHistory.destroy_all
Member.destroy_all

admin = Member.create!(
  first_name: "Moses",
  last_name: "Okello",
  occupation: "Secondary School Teacher",
  date_of_birth: "1988-03-15",
  tel: "+256772100001",
  address: "Lira Town, Northern Uganda",
  gender: "Male",
  email: "emowprinters@gmail.com",
  approved: true,
  role: "chairperson",
  joined_at: Time.zone.parse("2024-07-01")
)

admin.role_histories.create!(
  role: "chairperson",
  started_at: admin.joined_at,
  appointed_by: admin
)

members_data = [
  {
    first_name: "Ibanda",
    last_name: "Samuel",
    gender: "Male",
    email: "ibanda.samuel@example.com",
    tel: "+256700100001",
    annual: 50000,
    contributions: [
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-06 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-08-06 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-07 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-11 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-12 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2025-01-14 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-10-24 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-03-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-03-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-04-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-06-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-06-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-07-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2025-08-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2025-10-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2025-10-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2025-11-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2025-12-15 10:00"),
        amount: 90000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Ibembe",
    last_name: "Isaac",
    gender: "Male",
    email: "ibembe.isaac@example.com",
    tel: "+256700100002",
    annual: 50000,
    contributions: [
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2024-12-09 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-11 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-15 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-10-08 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-12-07 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-08-12 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-08 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-02-26 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-04-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-05-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-05-30 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-07-01 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-07-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2025-08-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
    ]
  },
  {
    first_name: "Isabirye",
    last_name: "Denis",
    gender: "Male",
    email: "isabirye.denis@example.com",
    tel: "+256700100003",
    annual: 50000,
    contributions: [
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-25 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-24 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-16 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2024-12-23 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-11 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-07 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-02-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-04-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-05-03 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-06-19 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-06-19 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Isabirye",
    last_name: "Emmanuel",
    gender: "Male",
    email: "emmanuelisabirye9@gmail.com",
    tel: "+256700100004",
    annual: 50000,
    contributions: [
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-02-11 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2025-01-09 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-08-16 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-11-10 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-25 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-09-07 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-10-15 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-06-13 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-06-13 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-06-13 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-06-13 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-06-13 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2026-02-14 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2026-02-14 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2026-02-14 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2026-02-14 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2026-02-14 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2026-02-14 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-01",
        paid_at: Time.zone.parse("2026-02-14 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
    ]
  },
  {
    first_name: "Kamira",
    last_name: "Eric",
    gender: "Male",
    email: "eric.kamira55@gmail.com",
    tel: "+256700100005",
    annual: 50000,
    contributions: [
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2025-01-19 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-02-18 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 12000,
        fine_paid: true
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-06 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-09-09 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-06 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-10-15 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-12-12 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-07-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-07-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-07-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-07-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-07-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-07-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2026-04-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2026-04-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2026-04-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2026-04-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2026-04-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-01",
        paid_at: Time.zone.parse("2026-04-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-02",
        paid_at: Time.zone.parse("2026-04-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-03",
        paid_at: Time.zone.parse("2026-04-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-04",
        paid_at: Time.zone.parse("2026-04-17 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-05",
        paid_at: Time.zone.parse("2026-04-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-06",
        paid_at: Time.zone.parse("2026-08-08 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-07",
        paid_at: Time.zone.parse("2026-08-08 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-08",
        paid_at: Time.zone.parse("2025-08-08 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Kyesiimira",
    last_name: "Noah",
    gender: "Male",
    email: "kyessnoa@gmail.com",
    tel: "+256700100006",
    annual: 50000,
    contributions: [
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2024-12-22 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-10-22 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-10-10 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-23 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-18 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-23 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-17 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-03-03 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-04-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-05-03 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-05-31 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-07-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-07-31 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2025-09-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2026-02-27 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2026-02-27 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2026-02-27 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2027-02-27 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-01",
        paid_at: Time.zone.parse("2026-07-17 10:00"),
        amount: 110000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-02",
        paid_at: Time.zone.parse("2026-02-27 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-03",
        paid_at: Time.zone.parse("2026-07-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-04",
        paid_at: Time.zone.parse("2026-07-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-05",
        paid_at: Time.zone.parse("2026-07-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-06",
        paid_at: Time.zone.parse("2026-07-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-07",
        paid_at: Time.zone.parse("2026-07-17 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Maganda",
    last_name: "Bruno",
    gender: "Male",
    email: "mbillbruno@gmail.com",
    tel: "+256700100007",
    annual: 50000,
    contributions: [
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-24 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-10-07 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2024-12-17 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-17 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-24 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-19 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-03-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-03-29 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-05-02 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2026-06-02 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-07-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-08-03 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2025-09-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2025-09-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2025-11-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2025-11-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2025-12-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-01",
        paid_at: Time.zone.parse("2026-02-02 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-02",
        paid_at: Time.zone.parse("2026-03-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-03",
        paid_at: Time.zone.parse("2026-04-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-04",
        paid_at: Time.zone.parse("2026-05-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-05",
        paid_at: Time.zone.parse("2026-06-17 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-06",
        paid_at: Time.zone.parse("2026-06-17 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-07",
        paid_at: Time.zone.parse("2026-08-03 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-08",
        paid_at: Time.zone.parse("2026-08-03 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Mukani Peace",
    last_name: "Mary",
    gender: "Female",
    email: "mukani.peace.mary@example.com",
    tel: "+256700100008",
    annual: 50000,
    contributions: [
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-22 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-13 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-25 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Namukowa",
    last_name: "Kaloli",
    gender: "Male",
    email: "nkanthony2@gmail.com",
    tel: "+256700100009",
    annual: 50000,
    contributions: [
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-10-25 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-10-10 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2024-12-25 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-21 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-24 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-11 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-09 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-03-03 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-04-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-04-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-06-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-06-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-08-03 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2025-08-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2025-09-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2025-10-29 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2025-11-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2025-01-06 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-01",
        paid_at: Time.zone.parse("2026-02-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-02",
        paid_at: Time.zone.parse("2026-02-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-03",
        paid_at: Time.zone.parse("2026-03-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-04",
        paid_at: Time.zone.parse("2026-08-03 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-05",
        paid_at: Time.zone.parse("2026-08-03 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Namwanjje",
    last_name: "Rahuma",
    gender: "Female",
    email: "namwanjje.rahuma@example.com",
    tel: "+256700100010",
    annual: -59900,
    contributions: [
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-06-26 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-07-08 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Natukunda",
    last_name: "Racheal",
    gender: "Female",
    email: "thakhel.natukunda@gmail.com",
    tel: "+256700100011",
    annual: 50000,
    contributions: [
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-12 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-23 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2024-12-07 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-07 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-20 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-10-07 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-10-18 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 6000,
        fine_paid: true
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-02-25 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-03-25 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-04-26 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-05-27 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-06-25 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-07-28 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2025-08-30 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2025-09-29 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2025-10-27 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2025-12-01 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2025-12-22 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-01",
        paid_at: Time.zone.parse("2026-01-29 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-02",
        paid_at: Time.zone.parse("2026-02-25 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-03",
        paid_at: Time.zone.parse("2026-03-27 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-04",
        paid_at: Time.zone.parse("2026-05-03 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-05",
        paid_at: Time.zone.parse("2026-05-24 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-06",
        paid_at: Time.zone.parse("2026-06-28 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-07",
        paid_at: Time.zone.parse("2025-07-27 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Sanya",
    last_name: "Edwin",
    gender: "Male",
    email: "edwinsanya83@gmail.com",
    tel: "+256700100012",
    annual: 50000,
    contributions: [
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-14 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-12-12 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2025-01-16 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-09-16 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-11-11 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-19 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-21 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-02-26 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Tamale",
    last_name: "Denison",
    gender: "Male",
    email: "tamaleed7@gmail.com",
    tel: "+256700100013",
    annual: 50000,
    contributions: [
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-25 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-09-06 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 12000,
        fine_paid: true
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-11-09 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-07 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-08-20 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-06 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2024-12-15 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-02-12 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-03-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-05-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-06-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-07-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-07-04 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2025-09-02 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2025-10-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2025-10-29 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2025-12-03 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2025-01-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-01",
        paid_at: Time.zone.parse("2026-01-15 10:00"),
        amount: 90000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-02",
        paid_at: Time.zone.parse("2026-02-28 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-04",
        paid_at: Time.zone.parse("2026-04-29 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-05",
        paid_at: Time.zone.parse("2026-06-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Tasibula",
    last_name: "Delibert",
    gender: "Male",
    email: "delbartsam@gmail.com",
    tel: "+256700100014",
    annual: 50000,
    contributions: [
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-12 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-20 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-18 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2024-12-11 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-10-08 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-08 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-03-01 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-04-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-05-02 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Tezikuba",
    last_name: "Arthur",
    gender: "Male",
    email: "arthurtezikuba@gmail.com",
    tel: "+256700100015",
    annual: 50000,
    contributions: [
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-12 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-10-12 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-08 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2025-01-20 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-23 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-10-12 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-08-15 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-03-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-03-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2026-02-12 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2026-02-12 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2026-07-08 10:00"),
        amount: 110000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2026-07-08 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2026-07-08 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2026-07-08 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2026-07-08 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2026-07-08 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2026-07-08 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
    ]
  },
  {
    first_name: "Twisa",
    last_name: "Diana",
    gender: "Female",
    email: "dianatwisa335@gmail.com",
    tel: "+256700100016",
    annual: 50000,
    contributions: [
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-02-18 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-10-19 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-11-07 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-09-09 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2025-01-09 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-11 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-22 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-03-04 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-03-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-04-30 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-07-04 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-07-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-08-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2025-08-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2025-09-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2025-10-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2025-11-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2025-12-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-01",
        paid_at: Time.zone.parse("2026-01-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-02",
        paid_at: Time.zone.parse("2026-02-28 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-03",
        paid_at: Time.zone.parse("2026-04-18 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-04",
        paid_at: Time.zone.parse("2026-04-18 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-05",
        paid_at: Time.zone.parse("2026-06-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-06",
        paid_at: Time.zone.parse("2026-07-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-07",
        paid_at: Time.zone.parse("2026-08-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
  {
    first_name: "Wamutinyi",
    last_name: "Jason",
    gender: "Male",
    email: "jasonwamutinyi99@gmail.com",
    tel: "+256700100017",
    annual: 50000,
    contributions: [
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-07 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-01-12 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-10 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-18 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2024-12-20 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-11-13 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-11 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-02-05 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-03-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-04-11 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-06-01 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-07-25 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2025-07-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2025-09-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2025-09-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2025-10-15 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2025-12-02 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2025-12-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
    ]
  },
  {
    first_name: "Wanyama",
    last_name: "Emmanuel",
    gender: "Male",
    email: "erisaemmanuel@gmail.com",
    tel: "+256700100018",
    annual: 50000,
    contributions: [
      {
        month: "2025-01",
        paid_at: Time.zone.parse("2025-02-08 10:00 10:00"),
        amount: 80000,
        has_fine: true,
        fine_amount: 8000,
        fine_paid: true
      },
      {
        month: "2024-10",
        paid_at: Time.zone.parse("2024-10-11 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-12",
        paid_at: Time.zone.parse("2024-12-14 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-11",
        paid_at: Time.zone.parse("2024-11-11 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-09",
        paid_at: Time.zone.parse("2024-09-06 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-08",
        paid_at: Time.zone.parse("2024-08-23 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2024-07",
        paid_at: Time.zone.parse("2024-07-22 10:00 10:00"),
        amount: 80000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-02",
        paid_at: Time.zone.parse("2025-07-04 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2025-03",
        paid_at: Time.zone.parse("2025-07-04 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-04",
        paid_at: Time.zone.parse("2025-07-04 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-05",
        paid_at: Time.zone.parse("2025-07-04 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-06",
        paid_at: Time.zone.parse("2025-06-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-07",
        paid_at: Time.zone.parse("2026-03-02 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-08",
        paid_at: Time.zone.parse("2026-03-02 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-09",
        paid_at: Time.zone.parse("2026-03-02 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-10",
        paid_at: Time.zone.parse("2026-03-02 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-11",
        paid_at: Time.zone.parse("2026-03-02 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2025-12",
        paid_at: Time.zone.parse("2025-12-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-01",
        paid_at: Time.zone.parse("2026-01-31 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-02",
        paid_at: Time.zone.parse("2026-03-02 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
      {
        month: "2026-03",
        paid_at: Time.zone.parse("2026-04-06 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-04",
        paid_at: Time.zone.parse("2026-07-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-05",
        paid_at: Time.zone.parse("2026-07-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-06",
        paid_at: Time.zone.parse("2026-07-15 10:00"),
        amount: 100000,
        has_fine: true,
        fine_amount: 10000,
        fine_paid: true
      },
      {
        month: "2026-07",
        paid_at: Time.zone.parse("2026-07-24 10:00"),
        amount: 100000,
        has_fine: false,
        fine_amount: 0,
        fine_paid: false
      },
    ]
  },
]

members_data.each_with_index do |m, i|
  member = Member.create!(
    first_name: m[:first_name],
    last_name: m[:last_name],
    occupation: "Member",
    date_of_birth: "1990-01-01",
    tel: m[:tel],
    address: "Uganda",
    gender: m[:gender],
    email: m[:email],
    approved: true,
    role: "member",
    joined_at: Time.zone.parse("2024-07-01")
  )

  m[:contributions].each do |c|
    contribution = member.contributions.new(
      month: c[:month],
      paid_at: c[:paid_at],
      amount: c[:amount],
      status: "approved",
      has_fine: c[:has_fine],
      fine_amount: c[:fine_amount],
      fine_paid: c[:fine_paid]
    )
    contribution.save!(validate: false)
  end

  next if m[:annual] == 0
  sub = member.annual_subscriptions.new(
    year: Time.zone.today.year,
    paid_at: Time.zone.parse("2026-01-15 10:00"),
    amount: m[:annual],
    status: "approved"
  )
  sub.save!(validate: false)
end

puts "Done: #{Member.count} members, #{Contribution.count} contributions, #{AnnualSubscription.count} annual subscriptions"
puts "Login with email or phone — a one-time code is emailed (chairperson: emowprinters@gmail.com / +256772100001)"
