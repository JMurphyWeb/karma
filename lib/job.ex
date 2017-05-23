defmodule Karma.Job do

  def departments() do
    [
      "Accounts",
      "Action Vehicles",
      "Assistant Director",
      "Aerial",
      "Animals",
      "Armoury",
      "Art",
      "Camera",
      "Cast",
      "Construction",
      "Continuity",
      "Costume",
      "DIT",
      "Drapes",
      "Editorial",
      "Electrical",
      "Greens",
      "Grip",
      "Hair And Makeup",
      "IT",
      "Locations",
      "Medical",
      "Military",
      "Photography",
      "Post Production",
      "Production",
      "Props",
      "Publicity",
      "Rigging",
      "Security",
      "Set Dec",
      "SFX",
      "Sound",
      "Standby",
      "Studio Unit",
      "Stunts",
      "Supporting Artist",
      "Transport",
      "Underwater",
      "VFX",
      "Video",
      "Voice"
    ]
  end

  def department_with_jobs() do
    [
      "Accounts": [
        "1st Assistant Accountant",
        "Accounts Assistant",
        "Accounts Clerk",
        "AP Assistant",
        "Assistant Accountant",
        "Cashier",
        "Construction Accountant",
        "Dailies Payroll",
        "Financial Controller",
        "Location Accountant",
        "Payroll Accountant",
        "Payroll Clerk",
        "Production Accountant",
        "Set Dec Accountant",
        "Trainee Assistant Accountant"
        ],
      "Action Vehicles": [
        "Carriage Master",
        "Coach Builder Carpenter",
        "Driver",
        "Labourer/Driver",
        "Specialist Finisher",
        "Workshop Supervisor"
        ],
      "Assistant Director": [
        "1st Assistant Director",
        "2nd 2nd Assistant Director",
        "2nd Assistant Director",
        "3rd Assistant Director",
        "Base 3rd Assistant Director",
        "Base Runner",
        "Co 2nd Assistant Director",
        "Crowd 2nd Assistant Director",
        "Crowd PA",
        "Floor 2nd Assistant Director",
        "Floor Runner",
        "Key 2nd Assistant Director",
        "PA",
        "Runner",
        "Set PA",
        "Stand In",
        "Stand In/Double",
        "Stand In/Runner"
        ],
      "Aerial": [
        "Aerial Cameraman",
        "Aerial Coordinator"
        ],
      "Animals": [
        "Animal Wrangler",
        "Assistant Horse Master",
        "Department Supervisor",
        "Horse Master"
        ],
      "Armoury": [
        "Archery Instructor",
        "Armourer",
        "Armoury Concept Artist",
        "Armoury Model Maker",
        "Armoury Trainee",
        "Coordinator",
        "Firearms Supervisor",
        "HOD Armoury",
        "Junior Modeller",
        "Leather Worker",
        "Mechanical Engineer",
        "Mechanical Maker",
        "Metal Worker",
        "Modeller",
        "Painter",
        "Senior Model Maker",
        "Standby Armourer",
        "Trainee",
        "Trainee Model Maker"
        ],
      "Art": [
        "Art Department Assistant",
        "Art Department Coordinator",
        "Art Director",
        "Art Trainee",
        "Assistant Art Director",
        "Concept Artist",
        "Coordinator",
        "Draughtsman",
        "Graphic Artist",
        "Graphic Assistant",
        "Graphic Designer",
        "Junior Draughtsman",
        "Junior Illustrator",
        "Model Maker",
        "Production Designer",
        "Researcher/Consultancy",
        "Scenic Painter",
        "Senior Art Director",
        "Set Designer",
        "Standby Art Director",
        "Storyboard Artist",
        "Supervising Art Director",
        "Visual Researcher"
        ],
      "Camera": [
        "1st Assistant Camera",
        "2nd Assistant Camera",
        "Camera Operator",
        "Camera Trainee",
        "Central Loader",
        "Clapper Loader",
        "Data Wrangler",
        "Director Of Photography",
        "DIT",
        "Focus Puller",
        "Steadicam Operator",
        "Stills Photographer",
        "Trainee",
        "Trainee Video/DIT",
        "Video Assist Operator",
        "Video Playback Operator",
        "Video Trainee"
        ],
      "Cast": [
        "Actor",
        "Actor-Double",
        "Cast Assistant",
        "Cast Chef",
        "Casting Assistant",
        "Casting Associate",
        "Casting Director",
        "Chaperone",
        "Dialogue Coach",
        "Performance Consultant",
        "Personal Trainer",
        "Stand In",
        "Supporting Artist",
        "Unit Driver",
        "Voice Coach"
        ],
      "Construction": [
        "1st Yr Apprentice Carpenter",
        "1st Yr Apprentice Metalworker",
        "1st Yr Apprentice Misc",
        "1st Yr Apprentice Painter",
        "1st Yr Apprentice Plasterer",
        "1st Yr Apprentice Rigger",
        "1st Yr Apprentice Sculptor",
        "2nd Yr Apprentice Carpenter",
        "2nd Yr Apprentice Metalworker",
        "2nd Yr Apprentice Misc",
        "2nd Yr Apprentice Painter",
        "2nd Yr Apprentice Plasterer",
        "2nd Yr Apprentice Rigger",
        "3rd Yr Apprentice Carpenter",
        "3rd Yr Apprentice Metalworker",
        "3rd Yr Apprentice Misc",
        "3rd Yr Apprentice Painter",
        "3rd Yr Apprentice Plasterer",
        "3rd Yr Apprentice Rigger",
        "4th Yr Apprentice Carpenter",
        "4th Yr Apprentice Metalworker",
        "4th Yr Apprentice Misc",
        "4th Yr Apprentice Painter",
        "4th Yr Apprentice Plasterer",
        "4th Yr Apprentice Rigger",
        "Assistant Construction Manager",
        "Buyer",
        "Carpenter",
        "Carpenter Improver",
        "Carpenters Labourer",
        "Chargehand Carpenter",
        "Chargehand Electrician",
        "Chargehand Machinist",
        "Chargehand Metalworker",
        "Chargehand Painter",
        "Chargehand Painters Labourer",
        "Chargehand Plasterer",
        "Chargehand Plasterers Labourer",
        "Chargehand Rigger",
        "Chargehand Sculptor",
        "Chargehand Stagehand",
        "Construction Coordinator",
        "Construction Manager",
        "HOD Carpenter",
        "HOD Machinist",
        "HOD Metal Engineer",
        "HOD Painter",
        "HOD Painters Labourer",
        "HOD Plasterer",
        "HOD Plasterers Labourer",
        "HOD Rigger",
        "HOD Sculptor",
        "HOD Stagehand",
        "Labourer",
        "Machinist",
        "Metalworker",
        "Mill Labourer",
        "Modeller",
        "Painter",
        "Painter Improver",
        "Painters Labourer",
        "Plasterer",
        "Plasterer Improver",
        "Plasterers Labourer",
        "Rigger",
        "Rigger's Labourer",
        "Scenic Painter",
        "Sculptor",
        "Sculptors Labourer",
        "Sculptors Trainee",
        "Stagehand",
        "Stagehand NVQ",
        "Storeman",
        "Supervising Carpenter",
        "Supervising Machinist",
        "Supervising Metalworker",
        "Supervising Painter",
        "Supervising Painters Labourer",
        "Supervising Plasterer",
        "Supervising Plasterers Labourer",
        "Supervising Rigger",
        "Supervising Sculptor",
        "Supervising Stagehand"
        ],
      "Continuity": [
        "Assistant Script Supervisor",
        "Script Supervisor"
        ],
      "Costume": [
        "Armour Fabricator",
        "Armour Supervisor",
        "Assistant Breakdown Artist",
        "Assistant Breakdown/Dyer",
        "Assistant Buyer",
        "Assistant Costume Designer",
        "Assistant Costume Supervisor",
        "Assistant Cutter",
        "Assistant Tailor",
        "Breakdown Artist",
        "Breakdown Assistant",
        "Buyer",
        "Chief Cutter",
        "Chief Textile Artist",
        "Costume Assistant",
        "Costume Co-Ordinator",
        "Costume Consultant",
        "Costume Crowd Assistant",
        "Costume Design Assistant",
        "Costume Designer",
        "Costume Illustrator",
        "Costume Maker",
        "Costume Manager",
        "Costume Prop Modeller",
        "Costume Supervisor",
        "Costumer",
        "Crowd Costume Co-Coordinator",
        "Crowd Costume Maker",
        "Crowd Costume Standby",
        "Crowd Fitter",
        "Crowd Supervisor",
        "Cutter",
        "Dyer",
        "Dying Assistant",
        "Head Milliner",
        "Jewellery Assistant",
        "Jewellery Modeller",
        "Junior",
        "Junior Armour Fabricator",
        "Junior Breakdown Assistant",
        "Junior Costume Assistant",
        "Junior Costume Maker",
        "Junior Jewellery Assistant",
        "Junior Leather Worker",
        "Key Breakdown",
        "Key Crowd Costume Standby",
        "Key Standby",
        "Leather Maker",
        "Leather Modeller",
        "Leather Worker",
        "Milliner",
        "Modeller",
        "Principal Costume",
        "Principal Seamstress",
        "Principal Standby",
        "Principal Trainee Seamstress",
        "Researcher",
        "Sculptor",
        "Seamstress",
        "Senior Costume Assistant",
        "Senior Costume Maker",
        "Set Costumer",
        "Sketch Artist",
        "Standby Costume",
        "Tailor",
        "Textile Artist",
        "Trainee",
        "Trainee Buyer",
        "Trainee Costume Maker",
        "Trainee Leather Worker",
        "Wardrobe Mistress"
        ],
      "DIT": [
        "Array DIT",
        "Data Wrangler",
        "DIT",
        "DIT Trainee"
        ],
      "Drapes": [
        "Drapes Master",
        "Drapesman"
        ],
      "Editorial": [
        "1st Assistant Editor",
        "2nd Assistant Editor",
        "Assembly Editor",
        "Assistant Editor",
        "Assistant VFX Editor",
        "Associate Editor",
        "Editor",
        "Editorial Apprentice",
        "Editorial Assistant",
        "Editorial Runner",
        "Editorial Trainee",
        "VFX Editor"
        ],
      "Electrical": [
        "Balloon Technician",
        "Best Boy",
        "Chargehand Electrical Rigger",
        "Chargehand Rigger",
        "Chief Lighting Technician",
        "Desk Operator",
        "Electrical Rigger",
        "Electrical Supervisor",
        "Electrician",
        "Gaffer",
        "Genny Operator",
        "HOD Electrical Rigger",
        "HOD Rigger",
        "Lighting Chargehand",
        "Lighting Technician",
        "Motors Electrical Rigger",
        "Practical Electrician",
        "Rigger",
        "Rigging Best Boy",
        "Rigging Desk Operator",
        "Rigging Electrician",
        "Rigging Gaffer",
        "Supervising Electrical Rigger",
        "Underwater Electrician",
        "Underwater Gaffer",
        "Wire Rigger"
        ],
      "Greens": [
        "Greens Chargehand",
        "Greens Person",
        "HOD Greens",
        "Lead Chargehand"
        ],
      "Grip": [
        "Assistant Grip",
        "Best Boy Grip",
        "Crane Grip",
        "Crane Technician",
        "Dolly Grip",
        "Flight Head Technician",
        "Grip",
        "Grip Rigger",
        "Grip Trainee",
        "Key Grip",
        "Libra Tech",
        "Scorpio Arm Operator",
        "Stabileye Tech",
        "Techno Dolly Operator",
        ],
      "Hair And Makeup": [
        "Crowd Hair & Makeup Junior",
        "Crowd Hair/Makeup Supervisor",
        "Crowd Makeup Artist",
        "Crowd Makeup Trainee",
        "Hair & Makeup Artist",
        "Hair & Makeup Co-Ordinator",
        "Hair & Makeup Designer",
        "Hair & Makeup Junior",
        "Hair & Makeup Trainee",
        "Hair Designer",
        "Hairdresser",
        "Junior Hair & Make Up Artist",
        "Junior Makeup Artist",
        "Key Hair And Make Up Artist",
        "Makeup Artist",
        "Makeup Designer",
        "Makeup Trainee",
        "Trainee",
        "Wig Trainee"
        ],
      "IT": [
        "1st Line IT Support"
        ],
      "Locations": [
        "Assistant Location Manager",
        "Assistant Unit Manager",
        "Location Assistant",
        "Location Manager",
        "Location Marshall",
        "Locations Assistant",
        "PA",
        "Studio Unit Manager",
        "Supervising Location Manager",
        "Unit Manager"
        ],
      "Medical": [
        "Construction Nurse",
        "Medic",
        "Medical Advisor",
        "Nurse",
        "Nursing Advisor",
        "Paramedic",
        "Unit Medic",
        "Unit Nurse"
        ],
      "Military": [
        "Military Advisor"
        ],
      "Photography": [
        "Photographer"
        ],
      "Post Production": [

        ],
      "Production": [
        "Accommodation Co-Ordinator",
        "Assistant Production Coordinator",
        "Assistant Production Office Coordinator",
        "Cast Assistant",
        "Co-Producer",
        "Digital Archivist",
        "Director's Assistant",
        "Environmental Steward",
        "Executive Producer",
        "Franchise Production Supervisor",
        "PA",
        "Line Producer",
        "Producer",
        "Producer's Assistant",
        "Production Assistant",
        "Production Coordinator",
        "Production Manager",
        "Production Runner",
        "Production Secretary",
        "Production Supervisor",
        "Runner",
        "Rushes Runner",
        "Script Supervisor",
        "Shipping & Accommodation Coordinator",
        "Travel Assistant",
        "Travel Coordinator",
        "Travel Manager",
        "Unit Production Manager",
        "Wrap Assistant"
        ],
      "Props": [
        "3D Modeller",
        "Action Prop Buyer",
        "Assistant Property Master",
        "Chargehand Dresser",
        "Chargehand Dressing Prop",
        "Chargehand Prop",
        "Chargehand Standby Props",
        "Coordinator",
        "Drapesmaster",
        "Dressing Props",
        "Dressing Propsman",
        "HOD Prop Modeller",
        "Junior Modeller",
        "Junior Painter",
        "Junior Prop Buyer",
        "Junior Prophand",
        "Junior Propman",
        "Modeller",
        "Model Maker",
        "Mould Maker",
        "On Set Props Master",
        "Painter",
        "Petty Cash Buyer",
        "Prop Assistant",
        "Prop Finisher",
        "Prop Maker",
        "Prop Painter",
        "Property Master",
        "Prophand",
        "Propman",
        "Props Buyer",
        "Props Buyer/Researcher",
        "Props Co-Ordinator",
        "Props Supervisor",
        "Props Trainee",
        "Sculptor",
        "Senior Model Maker",
        "Senior Modeller",
        "Senior Prop Hand",
        "Senior Prop Painter",
        "Senior Propmaker",
        "Standby Props",
        "Storeman",
        "Store-person",
        "Supervising Prop Hand",
        "Supervising Prop Painter",
        "Supervising Standby Prop Hand",
        "Trainee",
        "Trainee Modeller",
        "Trainee Propman"
        ],
      "Publicity": [
        "Stills Photographer",
        "Unit Publicist"
        ],
      "Rigging": [
        "HOD Rigger",
        "Rigger",
        "Stunt Rigger"
        ],
      "Security": [
        "Security"
        ],
      "Set Dec": [
        "Art Director",
        "Assistant Buyer",
        "Assistant Graphic Designer",
        "Assistant Set Decorator",
        "Concept Artist",
        "Coordinator",
        "Draftsperson",
        "Drapes Supervisor",
        "Draughtsman",
        "Graphic Design Assistant",
        "Graphic Designer",
        "Location Buyer",
        "PA",
        "Petty Cash Buyer",
        "Production Buyer",
        "Runner",
        "Scenic Textile Artist",
        "Set Decorator",
        "Set Decorator Assistant"
        ],
      "SFX": [
        "Assistant SFX Technician",
        "Breakaway Supervisor",
        "Breakaway Technician",
        "Coordinator",
        "Floor Director",
        "Floor Technician",
        "Lead SFX Technician",
        "Lead Snr SFX Technician",
        "Office PA/Runner",
        "Prep Lead Senior Tech",
        "Senior SFX Floor Technician",
        "Senior SFX Technician",
        "SFX Assistant Technician",
        "SFX Buyer",
        "SFX Buyer/ Coordinator",
        "SFX Electrician",
        "SFX Floor Supervisor",
        "SFX Senior Technician",
        "SFX Supervisor",
        "SFX Technician",
        "SFX Trainee",
        "Workshop Supervisor"
        ],
      "Sound": [
        "1st Assistant Sound",
        "2nd Assistant Sound",
        "Boom Operator",
        "Cable Person",
        "Key 1st Assistant Sound",
        "Production Sound Mixer",
        "Sound Maintenance",
        "Sound Mixer",
        "Trainee"
        ],
      "Standby": [
        "Rigger",
        "Stagehand",
        "Standby Carpenter",
        "Standby Painter",
        "Standby Plasterer"
      ],
      "Studio Unit": [
        "Studio Unit Manager",
        "Studio Unit Assistant"
        ],
      "Stunts": [
        "Fight Arranger",
        "Rigger",
        "Stunt Person",
        "Stunt Coordinator",
        "Stunt Department Coordinator",
        "Stunt Department Supervisor",
        "Utility Stunt",
        "Wire Rigger"
        ],
      "Supporting Artist": [
        "Pay Direct Extra"
        ],
      "Transport": [
        "Minibus Driver",
        "Rushes Runner",
        "Transport Captain",
        "Transport Coordinator",
        "Transport Manager",
        "Unit Driver"
        ],
      "Underwater": [
        "Cameraman",
        "Coordinator"
        ],
      "VFX": [
        "Compositor",
        "Data Wrangler",
        "Junior Draughtsman",
        "Lead Data Wrangler",
        "On Set PA",
        "VFX Coordinator",
        "VFX Assistant Editor",
        "VFX Coordinator",
        "VFX Data Wrangler",
        "VFX Editor",
        "VFX PA",
        "VFX Producer",
        "VFX Producers Assistant",
        "VFX Production Manager"
        ],
      "Video": [
        "Video Assistant",
        "Video Assistant Operator",
        "Video Operator",
        "Video Technician",
        "Video Trainee"
        ],
      "Voice": [
        "Voice Coach"
      ]
    ]
  end

  def titles() do
    [
      "1st Assistant Accountant",
      "Accounts Assistant",
      "Accounts Clerk",
      "AP Assistant",
      "Assistant Accountant",
      "Cashier",
      "Construction Accountant",
      "Dailies Payroll",
      "Financial Controller",
      "Location Accountant",
      "Payroll Accountant",
      "Payroll Clerk",
      "Production Accountant",
      "Set Dec Accountant",
      "Trainee Assistant Accountant",
      "Carriage Master",
      "Coach Builder Carpenter",
      "Driver",
      "Labourer/Driver",
      "Specialist Finisher",
      "Workshop Supervisor",
      "1st Assistant Director",
      "2nd 2nd Assistant Director",
      "2nd Assistant Director",
      "3rd Assistant Director",
      "Base 3rd Assistant Director",
      "Base Runner",
      "Co 2nd Assistant Director",
      "Crowd 2nd Assistant Director",
      "Crowd PA",
      "Floor 2nd Assistant Director",
      "Floor Runner",
      "Key 2nd Assistant Director",
      "PA",
      "Runner",
      "Set PA",
      "Stand In",
      "Stand In/Double",
      "Stand In/Runner",
      "Aerial Cameraman",
      "Aerial Coordinator",
      "Animal Wrangler",
      "Assistant Horse Master",
      "Department Supervisor",
      "Horse Master",
      "Archery Instructor",
      "Armourer",
      "Armoury Concept Artist",
      "Armoury Model Maker",
      "Armoury Trainee",
      "Coordinator",
      "Firearms Supervisor",
      "HOD Armoury",
      "Junior Modeller",
      "Leather Worker",
      "Mechanical Engineer",
      "Mechanical Maker",
      "Metal Worker",
      "Modeller",
      "Painter",
      "Senior Model Maker",
      "Standby Armourer",
      "Trainee",
      "Trainee Model Maker",
      "Art Department Assistant",
      "Art Department Coordinator",
      "Art Director",
      "Art Trainee",
      "Assistant Art Director",
      "Concept Artist",
      "Coordinator",
      "Draughtsman",
      "Graphic Artist",
      "Graphic Assistant",
      "Graphic Designer",
      "Junior Draughtsman",
      "Junior Illustrator",
      "Model Maker",
      "Production Designer",
      "Researcher/Consultancy",
      "Scenic Painter",
      "Senior Art Director",
      "Set Designer",
      "Standby Art Director",
      "Storyboard Artist",
      "Supervising Art Director",
      "Visual Researcher",
      "1st Assistant Camera",
      "2nd Assistant Camera",
      "Camera Operator",
      "Camera Trainee",
      "Central Loader",
      "Clapper Loader",
      "Data Wrangler",
      "Director Of Photography",
      "DIT",
      "Focus Puller",
      "Steadicam Operator",
      "Stills Photographer",
      "Trainee",
      "Trainee Video/DIT",
      "Video Assist Operator",
      "Video Playback Operator",
      "Video Trainee",
      "Actor",
      "Actor-Double",
      "Cast Assistant",
      "Cast Chef",
      "Casting Assistant",
      "Casting Associate",
      "Casting Director",
      "Chaperone",
      "Dialogue Coach",
      "Performance Consultant",
      "Personal Trainer",
      "Stand In",
      "Supporting Artist",
      "Unit Driver",
      "Voice Coach",
      "1st Yr Apprentice Carpenter",
      "1st Yr Apprentice Metalworker",
      "1st Yr Apprentice Misc",
      "1st Yr Apprentice Painter",
      "1st Yr Apprentice Plasterer",
      "1st Yr Apprentice Rigger",
      "1st Yr Apprentice Sculptor",
      "2nd Yr Apprentice Carpenter",
      "2nd Yr Apprentice Metalworker",
      "2nd Yr Apprentice Misc",
      "2nd Yr Apprentice Painter",
      "2nd Yr Apprentice Plasterer",
      "2nd Yr Apprentice Rigger",
      "3rd Yr Apprentice Carpenter",
      "3rd Yr Apprentice Metalworker",
      "3rd Yr Apprentice Misc",
      "3rd Yr Apprentice Painter",
      "3rd Yr Apprentice Plasterer",
      "3rd Yr Apprentice Rigger",
      "4th Yr Apprentice Carpenter",
      "4th Yr Apprentice Metalworker",
      "4th Yr Apprentice Misc",
      "4th Yr Apprentice Painter",
      "4th Yr Apprentice Plasterer",
      "4th Yr Apprentice Rigger",
      "Assistant Construction Manager",
      "Buyer",
      "Carpenter",
      "Carpenter Improver",
      "Carpenters Labourer",
      "Chargehand Carpenter",
      "Chargehand Electrician",
      "Chargehand Machinist",
      "Chargehand Metalworker",
      "Chargehand Painter",
      "Chargehand Painters Labourer",
      "Chargehand Plasterer",
      "Chargehand Plasterers Labourer",
      "Chargehand Rigger",
      "Chargehand Sculptor",
      "Chargehand Stagehand",
      "Construction Coordinator",
      "Construction Manager",
      "HOD Carpenter",
      "HOD Machinist",
      "HOD Metal Engineer",
      "HOD Painter",
      "HOD Painters Labourer",
      "HOD Plasterer",
      "HOD Plasterers Labourer",
      "HOD Rigger",
      "HOD Sculptor",
      "HOD Stagehand",
      "Labourer",
      "Machinist",
      "Metalworker",
      "Mill Labourer",
      "Modeller",
      "Painter",
      "Painter Improver",
      "Painters Labourer",
      "Plasterer",
      "Plasterer Improver",
      "Plasterers Labourer",
      "Rigger",
      "Rigger's Labourer",
      "Scenic Painter",
      "Sculptor",
      "Sculptors Labourer",
      "Sculptors Trainee",
      "Stagehand",
      "Stagehand NVQ",
      "Storeman",
      "Supervising Carpenter",
      "Supervising Machinist",
      "Supervising Metalworker",
      "Supervising Painter",
      "Supervising Painters Labourer",
      "Supervising Plasterer",
      "Supervising Plasterers Labourer",
      "Supervising Rigger",
      "Supervising Sculptor",
      "Supervising Stagehand",
      "Assistant Script Supervisor",
      "Script Supervisor",
      "Armour Fabricator",
      "Armour Supervisor",
      "Assistant Breakdown Artist",
      "Assistant Breakdown/Dyer",
      "Assistant Buyer",
      "Assistant Costume Designer",
      "Assistant Costume Supervisor",
      "Assistant Cutter",
      "Assistant Tailor",
      "Breakdown Artist",
      "Breakdown Assistant",
      "Buyer",
      "Chief Cutter",
      "Chief Textile Artist",
      "Costume Assistant",
      "Costume Co-Ordinator",
      "Costume Consultant",
      "Costume Crowd Assistant",
      "Costume Design Assistant",
      "Costume Designer",
      "Costume Illustrator",
      "Costume Maker",
      "Costume Manager",
      "Costume Prop Modeller",
      "Costume Supervisor",
      "Costumer",
      "Crowd Costume Co-Coordinator",
      "Crowd Costume Maker",
      "Crowd Costume Standby",
      "Crowd Fitter",
      "Crowd Supervisor",
      "Cutter",
      "Dyer",
      "Dying Assistant",
      "Head Milliner",
      "Jewellery Assistant",
      "Jewellery Modeller",
      "Junior",
      "Junior Armour Fabricator",
      "Junior Breakdown Assistant",
      "Junior Costume Assistant",
      "Junior Costume Maker",
      "Junior Jewellery Assistant",
      "Junior Leather Worker",
      "Key Breakdown",
      "Key Crowd Costume Standby",
      "Key Standby",
      "Leather Maker",
      "Leather Modeller",
      "Leather Worker",
      "Milliner",
      "Modeller",
      "Principal Costume",
      "Principal Seamstress",
      "Principal Standby",
      "Principal Trainee Seamstress",
      "Researcher",
      "Sculptor",
      "Seamstress",
      "Senior Costume Assistant",
      "Senior Costume Maker",
      "Set Costumer",
      "Sketch Artist",
      "Standby Costume",
      "Tailor",
      "Textile Artist",
      "Trainee",
      "Trainee Buyer",
      "Trainee Costume Maker",
      "Trainee Leather Worker",
      "Wardrobe Mistress",
      "Array DIT",
      "Data Wrangler",
      "DIT",
      "DIT Trainee",
      "Drapes Master",
      "Drapesman",
      "Lead Drapes Supervisor",
      "1st Assistant Editor",
      "2nd Assistant Editor",
      "Assembly Editor",
      "Assistant Editor",
      "Assistant VFX Editor",
      "Associate Editor",
      "Editor",
      "Editorial Apprentice",
      "Editorial Assistant",
      "Editorial Runner",
      "Editorial Trainee",
      "VFX Editor",
      "Balloon Technician",
      "Best Boy",
      "Chargehand Electrical Rigger",
      "Chargehand Rigger",
      "Chief Lighting Technician",
      "Desk Operator",
      "Electrical Rigger",
      "Electrical Supervisor",
      "Electrician",
      "Gaffer",
      "Genny Operator",
      "HOD Electrical Rigger",
      "HOD Rigger",
      "Lighting Chargehand",
      "Lighting Technician",
      "Motors Electrical Rigger",
      "Practical Electrician",
      "Rigger",
      "Rigging Best Boy",
      "Rigging Desk Operator",
      "Rigging Electrician",
      "Rigging Gaffer",
      "Supervising Electrical Rigger",
      "Underwater Electrician",
      "Underwater Gaffer",
      "Wire Rigger",
      "Greens Chargehand",
      "Greens Person",
      "HOD Greens",
      "Lead Chargehand",
      "Assistant Grip",
      "Best Boy Grip",
      "Crane Grip",
      "Crane Technician",
      "Dolly Grip",
      "Flight Head Technician",
      "Grip",
      "Grip Rigger",
      "Grip Trainee",
      "Key Grip",
      "Libra Tech",
      "Scorpio Arm Operator",
      "Stabileye Tech",
      "Techno Dolly Operator",
      "Crowd Hair & Makeup Junior",
      "Crowd Hair/Makeup Supervisor",
      "Crowd Makeup Artist",
      "Crowd Makeup Trainee",
      "Hair & Makeup Artist",
      "Hair & Makeup Co-Ordinator",
      "Hair & Makeup Designer",
      "Hair & Makeup Junior",
      "Hair & Makeup Trainee",
      "Hair Designer",
      "Hairdresser",
      "Junior Hair & Make Up Artist",
      "Junior Makeup Artist",
      "Key Hair And Make Up Artist",
      "Makeup Artist",
      "Makeup Designer",
      "Makeup Trainee",
      "Trainee",
      "Wig Trainee",
      "1st Line IT Support",
      "Assistant Location Manager",
      "Assistant Unit Manager",
      "Location Assistant",
      "Location Manager",
      "Location Marshall",
      "Locations Assistant",
      "PA",
      "Studio Unit Manager",
      "Supervising Location Manager",
      "Unit Manager",
      "Construction Nurse",
      "Medic",
      "Medical Advisor",
      "Nurse",
      "Nursing Advisor",
      "Paramedic",
      "Unit Medic",
      "Unit Nurse",
      "Military Advisor",
      "Photographer",
      "Coordinator",
      "Post Production Supervisor",
      "Accommodation Co-Ordinator",
      "Assistant Production Coordinator",
      "Assistant Production Office Coordinator",
      "Cast Assistant",
      "Co-Producer",
      "Digital Archivist",
      "Director's Assistant",
      "Environmental Steward",
      "Executive Producer",
      "Franchise Production Supervisor",
      "PA",
      "Line Producer",
      "Producer",
      "Producer's Assistant",
      "Production Assistant",
      "Production Coordinator",
      "Production Manager",
      "Production Runner",
      "Production Secretary",
      "Production Supervisor",
      "Runner",
      "Rushes Runner",
      "Script Supervisor",
      "Shipping & Accommodation Coordinator",
      "Travel Assistant",
      "Travel Coordinator",
      "Travel Manager",
      "Unit Production Manager",
      "Wrap Assistant",
      "3D Modeller",
      "Action Prop Buyer",
      "Assistant Property Master",
      "Chargehand Dresser",
      "Chargehand Dressing Prop",
      "Chargehand Prop",
      "Chargehand Standby Props",
      "Coordinator",
      "Drapesmaster",
      "Dressing Props",
      "Dressing Propsman",
      "HOD Prop Modeller",
      "Junior Modeller",
      "Junior Painter",
      "Junior Prop Buyer",
      "Junior Prophand",
      "Junior Propman",
      "Modeller",
      "Model Maker",
      "Mould Maker",
      "On Set Props Master",
      "Painter",
      "Petty Cash Buyer",
      "Prop Assistant",
      "Prop Finisher",
      "Prop Maker",
      "Prop Painter",
      "Property Master",
      "Prophand",
      "Propman",
      "Props Buyer",
      "Props Buyer/Researcher",
      "Props Co-Ordinator",
      "Props Supervisor",
      "Props Trainee",
      "Sculptor",
      "Senior Model Maker",
      "Senior Modeller",
      "Senior Prop Hand",
      "Senior Prop Painter",
      "Senior Propmaker",
      "Standby Props",
      "Storeman",
      "Store-person",
      "Supervising Prop Hand",
      "Supervising Prop Painter",
      "Supervising Standby Prop Hand",
      "Trainee",
      "Trainee Modeller",
      "Trainee Propman",
      "Stills Photographer",
      "Unit Publicist",
      "HOD Rigger",
      "Rigger",
      "Stunt Rigger",
      "Security",
      "Art Director",
      "Assistant Buyer",
      "Assistant Graphic Designer",
      "Assistant Set Decorator",
      "Concept Artist",
      "Coordinator",
      "Draftsperson",
      "Drapes Supervisor",
      "Draughtsman",
      "Graphic Design Assistant",
      "Graphic Designer",
      "Location Buyer",
      "PA",
      "Petty Cash Buyer",
      "Production Buyer",
      "Runner",
      "Scenic Textile Artist",
      "Set Decorator",
      "Set Decorator Assistant",
      "Assistant SFX Technician",
      "Breakaway Supervisor",
      "Breakaway Technician",
      "Coordinator",
      "Floor Director",
      "Floor Technician",
      "Lead SFX Technician",
      "Lead Snr SFX Technician",
      "Office PA/Runner",
      "Prep Lead Senior Tech",
      "Senior SFX Floor Technician",
      "Senior SFX Technician",
      "SFX Assistant Technician",
      "SFX Buyer",
      "SFX Buyer/ Coordinator",
      "SFX Electrician",
      "SFX Floor Supervisor",
      "SFX Senior Technician",
      "SFX Supervisor",
      "SFX Technician",
      "SFX Trainee",
      "Workshop Supervisor",
      "1st Assistant Sound",
      "2nd Assistant Sound",
      "Boom Operator",
      "Cable Person",
      "Key 1st Assistant Sound",
      "Production Sound Mixer",
      "Sound Maintenance",
      "Sound Mixer",
      "Trainee",
      "Rigger",
      "Stagehand",
      "Standby Carpenter",
      "Standby Painter",
      "Standby Plasterer",
      "Studio Unit Manager",
      "Studio Unit Assistant",
      "Fight Arranger",
      "Rigger",
      "Stunt Person",
      "Stunt Coordinator",
      "Stunt Department Coordinator",
      "Stunt Department Supervisor",
      "Utility Stunt",
      "Wire Rigger",
      "Pay Direct Extra",
      "Minibus Driver",
      "Rushes Runner",
      "Transport Captain",
      "Transport Coordinator",
      "Transport Manager",
      "Unit Driver",
      "Cameraman",
      "Coordinator",
      "Compositor",
      "Data Wrangler",
      "Junior Draughtsman",
      "Lead Data Wrangler",
      "On Set PA",
      "VFX Coordinator",
      "VFX Assistant Editor",
      "VFX Coordinator",
      "VFX Data Wrangler",
      "VFX Editor",
      "VFX PA",
      "VFX Producer",
      "VFX Producers Assistant",
      "VFX Production Manager",
      "Video Assistant",
      "Video Assistant Operator",
      "Video Operator",
      "Video Technician",
      "Video Trainee",
      "Voice Coach"
    ] |> Enum.sort()
  end
end
