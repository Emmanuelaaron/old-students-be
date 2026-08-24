# frozen_string_literal: true

puts "Seeding HCLV Old Students' Association…"

Contribution.destroy_all
LoginOtp.destroy_all
Member.destroy_all

admin = Member.create!(
  first_name: "Moses",
  last_name: "Okello",
  occupation: "Secondary School Teacher",
  date_of_birth: "1988-03-15",
  tel: "+256772100001",
  address: "Lira Town, Northern Uganda",
  gender: "Male",
  email: "emmanuelisabirye9@gmail.com",
  approved: true,
  role: "chairperson",
  joined_at: Time.zone.parse("2024-01-01")
)

admin.role_histories.create!(
  role: "chairperson",
  started_at: admin.joined_at,
  appointed_by: admin
)

grace = Member.create!(
  first_name: "Grace",
  last_name: "Atim",
  occupation: "Registered Nurse",
  date_of_birth: "1990-07-22",
  tel: "+256702200002",
  address: "Gulu City, Uganda",
  gender: "Female",
  email: "emowprinters@gmail.com",
  approved: true,

  joined_at: Time.zone.parse("2024-01-15")
)

david = Member.create!(
  first_name: "David",
  last_name: "Opio",
  occupation: "Civil Engineer",
  date_of_birth: "1989-11-05",
  tel: "+256785300003",
  address: "Kampala, Central Uganda",
  gender: "Male",
  email: "david.opio@example.com",
  approved: true,

  joined_at: Time.zone.parse("2024-02-01")
)

Member.create!(
  first_name: "Patricia",
  last_name: "Abalo",
  occupation: "Accountant",
  date_of_birth: "1991-04-18",
  tel: "+256756400004",
  address: "Jinja City, Eastern Uganda",
  gender: "Female",
  email: "patricia@example.com",
  approved: false,

  joined_at: Time.zone.parse("2025-01-10")
)

Member.create!(
  first_name: "Robert",
  last_name: "Ogen",
  occupation: "Business Owner",
  date_of_birth: "1987-09-30",
  tel: "+256714500005",
  address: "Arua City, West Nile Uganda",
  gender: "Male",
  email: "robert.ogen@example.com",
  approved: false,

  joined_at: Time.zone.parse("2025-01-20")
)

def months_from(joined_at)
  months = []
  cursor = joined_at.to_date.beginning_of_month
  last = Time.zone.today.beginning_of_month
  while cursor <= last
    months << cursor.strftime("%Y-%m")
    cursor = cursor.next_month
  end
  months
end

def seeded_rng(seed)
  s = seed
  lambda do
    s = (s * 9301 + 49_297) % 233_280
    s / 233_280.0
  end
end

[
  [admin, "2024-01-01"],
  [grace, "2024-01-15"],
  [david, "2024-02-01"]
].each do |member, joined|
  rand = seeded_rng(member.email.bytes.sum)
  months = months_from(Time.zone.parse(joined))[0...-1] # exclude current month

  months.each do |month|
    next if rand.call < 0.1

    year, mon = month.split("-").map(&:to_i)
    paid_at =
      if rand.call > 0.22
        Time.zone.local(year, mon, 5 + (rand.call * 22).floor)
      else
        nm = mon == 12 ? 1 : mon + 1
        ny = mon == 12 ? year + 1 : year
        Time.zone.local(ny, nm, 6 + (rand.call * 18).floor)
      end

    contribution = member.contributions.create!(month: month, paid_at: paid_at)
    if contribution.has_fine? && rand.call > 0.45
      contribution.update!(fine_paid: true)
    end
  end
end

# Annual subscriptions for the current year (UGX 50,000)
[admin, grace, david].each do |member|
  member.annual_subscriptions.create!(
    year: Time.zone.today.year,
    paid_at: Time.zone.today.beginning_of_year,
    status: "approved"
  )
end

puts "Done: #{Member.count} members, #{Contribution.count} contributions, #{AnnualSubscription.count} annual subscriptions"
puts "Login with email or phone — a one-time code is emailed (chairperson: emmanuelisabirye9@gmail.com / +256772100001)"
