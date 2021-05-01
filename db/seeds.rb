User.create!([
    {
        full_name: "John Doe",
        email: "john@doe.com",
        password: "12345678",
        password_confirmation: "12345678"
    },
    {
        full_name: "Joe Smith",
        email: "joe@amith.com",
        password: "12345678",
        password_confirmation: "12345678"
    },
    {
        full_name: "Jane Doe",
        email: "jane@doe.com",
        password: "12345678",
        password_confirmation: "12345678"
    }
])

JobAdvert.create([
    {
        title: "Developer",
        description: "A front-end developer specializes in building the front end, or client-side, of a web appkication.",
        employer: "Vennage",
        employer_email: "maki7.mk@gmail.com",
        category: "IT",
        expiration_date: "01.06.2021"
    },
    {
        title: "Project Manager",
        description: "Responsible for planning and overseeing projects to ensure they are completed in a timely fashion and within budget.",
        employer: "IBM",
        employer_email: "info@ibm.com",
        category: "IT",
        expiration_date: "07.06.2021"
    },
    {
        title: " React Developer",
        description: "Build new features and improve existing ones of our client application and website.",
        employer: "Marriott",
        employer_email: "info@marriot.com",
        category: "IT",
        expiration_date: "17.07.2021"
    },
    {
        title: "Bartender",
        description: "Person with passion for service and passion for creating exceptional guest experience.",
        employer: "Dallas Restaurant",
        employer_email: "info@dallas.com",
        category: "Catering",
        expiration_date: "25.05.2021"
    },
    {
        title: "Chef",
        description: "Preparation of traditional and international cuisine.",
        employer: "Mademoiselle",
        employer_email: "info@mademoiselle.com",
        category: "Catering",
        expiration_date: "25.06.2021"
    }
])