graph TD
    %% Start Point
    Start((Start)) --> InputAuth[Input Email & Password]
    InputAuth --> ValAuth{Valid Format?}
    ValAuth -- No --> ErrAuth[Show Error: 8+ chars, Alphanumeric, or not valid email]
    ValAuth -- Yes --> CheckEmail[Check Supabase: Email Exists?]
    CheckEmail -- Yes --> ErrExist[Show Error: User already exists]
    CheckEmail -- No --> InputBio
    InputBio[Input Username, Phone, DOB, Height, Positions, Photo]
    InputBio --> ValBio{Validation Pass?}
    ValBio -- No --> ErrBio[Show Error]
    ValBio -- Yes --> CalcAge[Calculate Age from DOB]
    CalcAge --> TeamSelect[Select Current Team]
    TeamSelect --> TeamHistory[Add/Edit History of Teams]
    TeamHistory --> FinalSubmit[Click Submit]
    FinalSubmit --> SupabaseAuth[Create Auth User]
    SupabaseAuth --> SupabaseProfile[Save Profiles]
    SupabaseProfile --> Success((Registration Success))

   
