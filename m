Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B3621ABBB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 00:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763772288; cv=fail; b=ZMMcKmkFQsNQfqxLJZWBoP28oHBqVePiY1O49UYRNRXlLarY584RMhm3h0FWYQpsL6OJOh9GNwsjqaWnkZU/uh5wVwAdxPYMEM7I1REiwRXAjD84eDsOOs4B6FxCsO90qJH/qKI1MVXM90R6QyWCY+uHL5J4+tC4pHQUHJuQ87o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763772288; c=relaxed/simple;
	bh=fmSt0RmdoM2bToqIUKX2A5h3FmH6uI//HINbHRt/I3Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZT51IVwuh/ENZesb6OgpgoOEK+iPB0HlqUj03AoY58I5/XyUqat/ZutSTyt/84i/GX4y4zRbFSlReze3uzaq/JTtDMLsleCUayteo9ZtN9FW90an0ikbKiNTAn0BetPRnLwSfNJ9phiEz7tVgc/qL1BjJwU1nCTCNsqmQRkA8a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3ROaSnZ; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3ROaSnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763772287; x=1795308287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fmSt0RmdoM2bToqIUKX2A5h3FmH6uI//HINbHRt/I3Q=;
  b=P3ROaSnZUSgIoN3Bz/rrswFe/WzqtFPI6wW4MkUI9pDiP6U3rzYsZ2yb
   HufYmsYTZx44YfyjDfrJKqiwjKfFypiINBgMe7oVIjqHbbGB/stETzSOf
   aVGw0dfopFwYxX/2YFxywvxL1gJrf78lKjNKIjWA3f8DZfsE0PPLVzqjp
   sARBKOKWeEkfZ6LlfDdO/GU28YNm1DguY3fXB2bCiUuvE+HavHTfse63r
   jHbRq8RtIVxOk6q6o27/R6vQP4WYydHp5aIdBQO3uOtrvdEWWs4O03dGG
   I7vA2bJQaqflBYkoGljhpJ6OLRR79JNn/OJ7sVrYKlKDAawSePodhbYrY
   g==;
X-CSE-ConnectionGUID: C0wvKFGlR6WbNx6W1lvXiA==
X-CSE-MsgGUID: BLM/vqJlTDOcsrOp/FTZtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="83494003"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="83494003"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:44:46 -0800
X-CSE-ConnectionGUID: p0DsK7zHT1aFNv3gE95EEA==
X-CSE-MsgGUID: 6SegakvNQziRRNVwp5wxGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="191125558"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:44:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 16:44:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 16:44:45 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 16:44:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0tj+zdNUeBt3LRAzbJ0GWv+mL+CuZUCsEM9zEn/ECjTbyYOGd2G3LGrtX4EeTn4v8z7AAyWD2eWgpRyFfYa2V4d0LklVbKbbGDcEkGjU1ldMXyyx8gytEjIoUwlboyAvZFVNSjOAbdekI7Fd+MIQBWD5hSgPYXkcpleXwg8dDBqmneuGR4q1MLQFK/d1JauEywspBce7auuLlcbD24RtZ9pFgF17Y77yOrY8ehtZsvyRw6DCY71+BVPZUVzywZoXtWy7t9GjcxB0EdH7UNSKqm3E4pu++VtbhnDhQ6qjS7MShblmsmijeEGYeRDlIq1zAm1lfjozc/6WgSqzw4PsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4x8HSs9GPiHrtRSBc3hENs4k1p7UESxgj54/CFdyoA=;
 b=Hiflu0+JVh5bn3d7B0w8wUyk1H6fK652TrLIkvhPG5o8vXndWJ6xyqPP5LPWpkc5Qk3PQOUIvX2BAua0y0rmXjD8JEBafGz7oHL8jizC28eN3/SJ4+gwIqBMPOHf3dYrD/2F3dQvRO/w4sx5KO3kimiEpNPVKUeyOcSRNfMLssKU2AMUf9v5MYfXSG3EvM9zMV8bCMvgnmUb5ir4cd5j/LS9N4Lg9epFCiXe7QrJ2c9MgJVWH0Nzke6Xze0h9+axp/SCe1ktz1qQkA6seT5+pDPgQlqa0JQlaW2r/32cVaxd4K0Ng3FvicNqqhsdVVLnNSepRkX94bY/N5c+xYlIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 00:44:43 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Sat, 22 Nov 2025
 00:44:43 +0000
Date: Sat, 22 Nov 2025 08:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Mastro <amastro@fb.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Alex
 Williamson" <alex@shazbot.org>, David Matlack <dmatlack@google.com>
Subject: tools/testing/selftests/vfio/lib/vfio_pci_device.c:249:7: warning:
 comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long
 long *') and 'typeof (size - 1) *' (aka 'unsigned int *'))
Message-ID: <aSEHcgqCQTzB+fLU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|BL1PR11MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc584ee-4793-41d1-6c4c-08de29605374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NWIDIVD2jybqJueLTr3xE7Panq4wDC/tGoet1nbGbSIPXK6Ac2P9mxXEhiEf?=
 =?us-ascii?Q?C8PX//b+tc2fMzxkfdG6y2yDiDm4ibIDCOVabW+4KJ5603UX0TvZifQi0jCO?=
 =?us-ascii?Q?mE3mEo/+LQgueSW8/RNo1iz8gwOPMlSLDlI2xP9euNX1Xww1bf8hbDfjiTt1?=
 =?us-ascii?Q?MYXGVi674hETrut2Fiu04aFO8adt7RFhO5DsiKdUED9L/f2myCQ2KLAwYwHU?=
 =?us-ascii?Q?gWmg//LBWiALdNMeamVITxsfctERG+hhMrxePt3CM5wxN27lvrEhNYcIAlgt?=
 =?us-ascii?Q?nyIOMObcCfEX5c2Mg6RnMn+qsPMBobD7vlGOMwHXfUL3jqG1aIN4WAh+nJPg?=
 =?us-ascii?Q?ltmDibH/K7lrOtYLOFoJ++LfeQi1visoRTi+uH53FE9T5k5Gsp/7xf3CPZrF?=
 =?us-ascii?Q?SiUPTWs3qgFnojATsRavQnGolnwBLko/9Xfoq5k6Sxm1xpsXrxPO59DuJ3TX?=
 =?us-ascii?Q?YOjGY+hGsvE6K8roNf9rRhmdHQ/H34O26gHX/GGzE+cuGk+VGglOu3fjQyZR?=
 =?us-ascii?Q?YQO5umLSOQUCEVsL1ssNIHPViZrctadefchYZlG4CHgMnP5sdFVx6gPJLNM2?=
 =?us-ascii?Q?7KBwmztCS8cvctV1MiUjHDdY0qWEsOIuSFcmj9NI6H5ORM1UBwQs/YyCXLLX?=
 =?us-ascii?Q?qysUXZXoTef1mPK+XB8k6w4+VwMt1+w9fcIMwO/o818//l4K7H60pvZrggH0?=
 =?us-ascii?Q?0T6zhSaV2zpUkMcgoiA1Z7lXmGhfSo/pkb8rBTK8FL4e76YcbGw39swOqL3Q?=
 =?us-ascii?Q?M5g5/YTMlQ4azPqeCvHO5ssHZqS1Jitwocj/WU5ymUYRUgGIypUzHr6bcYGs?=
 =?us-ascii?Q?Au+IyVMTVsU6d6wrTGTvcWECpagYX8v9lNVzcGSDK5TES2R8Ooe7qSIWAiAu?=
 =?us-ascii?Q?V8nYftUynigTSfVEhoXHO3+2WrZbxYal/z/7NsiEnWRi2RRCbAjCO/j79kc0?=
 =?us-ascii?Q?ytwk3KJ67UU8RIfnNSDiIjJg0Ild0vKs4R9adKx+UAH7zmqO5k0YkS7s12Vb?=
 =?us-ascii?Q?Mls3qSUi/uhD4oQV/TcDYkzM0Ltjm1OAdGnd6cyiVSKYhjnkpQ0J4r8E2G37?=
 =?us-ascii?Q?a+DOPhh9+CGLRvrITe6FhhzR/+OSa86nBnJncEmUPSLh7tZENAexnO7cbB6g?=
 =?us-ascii?Q?rYEOTahG7RZw5LjzniCfDYfQ1/2vFlYWgGMJA7fW/QMlYyuq7t19UlDORCT2?=
 =?us-ascii?Q?DpkersjNNm51H6Lojh4pyTqJ79X8psjWj0ZiYuDwrUJvIYyD82t1/XbxAM5c?=
 =?us-ascii?Q?V1VQZrnru0gKufFehayWMqDdILESYZ6tAjyo1XBrt/qv36lry5dYUZx65Zej?=
 =?us-ascii?Q?h0tRLzrWuAmVJ5amE1iUN23RLakZURMDrJ5voRhlnmcEpk9V065MVCPhMEgp?=
 =?us-ascii?Q?B0iwKuZKHKzFztc652hDgHC3SXwGwLzE7kGDnYDukHteS3x+62UgNvVh138E?=
 =?us-ascii?Q?pmzHxwz7uuRJ+sDUyBn0mZgzDdAa5UaE8AvntSCJ5o5xENp2SgmzCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jbm8DosXEg6YBVdH8iUZyOtXJtliWQ/1tCnsSne2CPPmc+cV7nxHTkiEc2MQ?=
 =?us-ascii?Q?BbJ4RdRvSC3PeBh9p+DueeI35mCBU8N037PsGg7sB+Lpcgz8Te2w2uuESmX7?=
 =?us-ascii?Q?VvqOAA8WI82AhplX+Qbl4fvCPnbi9qQGgLF2YXLdE8JFwZO2wEvtpFm2AQoY?=
 =?us-ascii?Q?u2GFopJWuU4tFA9OwMei0foYeFGZD1BkDrOEKKMwKADdhsa05H9iYZd0jd8T?=
 =?us-ascii?Q?zt7uFd52BE2ogvKzBHUx7O4tRZ8l1SrclZD/vL8PaOm74BRRNCbml95JOUA4?=
 =?us-ascii?Q?Mc8gTMpBhbaHFZGzZkVpUYetQumfeC2i21Jw3iBqRSSoKI5/y27dddi5ykzE?=
 =?us-ascii?Q?7chmqN6wSuG+TJOXbCtCWREFnq4eMTwJogc+u3wTA4pwOiqUCIsM0SLrBiij?=
 =?us-ascii?Q?RB3Y6+wXCNoLCbe2wqzH+5JQi/koWXEyyopNfoOOkWTdX7/daW9rjuIF7V7q?=
 =?us-ascii?Q?7JHbJjBZ3fCj77o+Hqi6rRReH/6RhNXMd44jhklMhRmYkDPf82kfFWMk4eNg?=
 =?us-ascii?Q?S51DYSSq4BQOP2Lqw513MJyLbjptKfeuiMe6t9XW5+fVtMVbmg3OBjEqMmr3?=
 =?us-ascii?Q?fpcaSWktGMJHDcc67dZNJ7swBNaLQP3jJeH3u8UMmvyHc+xmbsjU6UNMgaMe?=
 =?us-ascii?Q?c5yD4IKd3APlso+IltmaatECZ/61YAo+3O2ojxOXA44W/JnCXsHviHcXICLD?=
 =?us-ascii?Q?Qs17+78UNHEGx1pqO1UAb6kABrFr7ZEVeAe1+TjDpQ2/mQnr44qFFSN1Flhy?=
 =?us-ascii?Q?6lk61NUn94aIa5fZyVRB6FRs+nPndo2uaF8HGErFGb5ig3ZIM0wtu6F/FIMC?=
 =?us-ascii?Q?qqgqfNyLHcPDRkQqlvbU672fRkLG/4IPUv5cwkXU9LNNt7nWoB+/YVhNVgzP?=
 =?us-ascii?Q?f+eLEGHjkgKlyww5py10a4CXM92jJCzMQJFt5goIppKdYRfDCh79GmMSIrc6?=
 =?us-ascii?Q?UhBehBTpb68YF+Ja3fhe9w5fwvmavuLSSZf56x608WXEjARJuW5aUgton4dM?=
 =?us-ascii?Q?b+c9Fkp/1Sq/TChfPp9MDSc9hx17teDOYrgDCgCk4QkGEKrNc9+raz7rZNya?=
 =?us-ascii?Q?n3qQVULP5yyO3mE2Ue+XOrKL+9PMsmtellKtiUt4pEhaRWPVQyS1p3dY8C3W?=
 =?us-ascii?Q?hL5T2LeS8oS39DchWgDlrOc14Fo/0ToI7ejjJwgyKQQoRddjkcYM5QVuZTV5?=
 =?us-ascii?Q?GGHlvlBE5rLG//6Y+/Mieie7gl438D3OSl2OiX3z5Qu6LUmiEit7drZBa0S4?=
 =?us-ascii?Q?uvHsM3CyBNLM10BdZYSEmLi25Ex9OOeuImlC9GHoMndItdIsizI46QSEYBe+?=
 =?us-ascii?Q?Vsq+g0OcbRaoJqAo3UwsWGJSux8CyML7F16QOlfBkKmP8VsMqkYvWkC3FO0B?=
 =?us-ascii?Q?0Uah5GyIWBz08U3941rl92InvtjdTs9LAV6Ja4xxBX1XdYP/7usrpsvUT2uz?=
 =?us-ascii?Q?8pESUKHh2fM+zdjzPLVeS1mjo8Wj1x8owWvaY3knzeitRzXj+ighYM+yFW9x?=
 =?us-ascii?Q?kzXbvjqzTxjkGi0qH+XqKwXvw0VURg5YsZ4MYrJhWil7EC9ixh8daYDIDbe2?=
 =?us-ascii?Q?HTasRlz6J4E870y4EsfV++PwIouHkKV1k5DZH22MzKa0bLpYhaL6598uwxRJ?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc584ee-4793-41d1-6c4c-08de29605374
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:44:43.1478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BDm6Ae8CNFZ17UiGNTnZqhl5hwzF98xaAbc1dG39ZUdzTidOXNK0Dm1JqQFNjewNmXxqFIMnyesHA2DmxjQGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: ce0e3c403e00e9e03e80aca6570bf936a44279e2 vfio: selftests: add iova allocator
date:   9 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251121/202511212039.RbypLd55-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212039.RbypLd55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511212039.RbypLd55-lkp@intel.com/

All warnings (new ones prefixed by >>):

      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:215:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     215 |         VFIO_ASSERT_NOT_NULL(allocator);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:215:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     215 |         VFIO_ASSERT_NOT_NULL(allocator);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:235:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     235 |         VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:41:37: note: expanded from macro 'VFIO_ASSERT_GT'
      41 | #define VFIO_ASSERT_GT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:235:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     235 |         VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:41:37: note: expanded from macro 'VFIO_ASSERT_GT'
      41 | #define VFIO_ASSERT_GT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:236:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     236 |         VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:236:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     236 |         VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:242:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     242 |                 VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     243 |                                "IOVA allocator out of space\n");
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:242:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     242 |                 VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     243 |                                "IOVA allocator out of space\n");
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/vfio_pci_device.c:249:7: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long long *') and 'typeof (size - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     249 |                 if (check_add_overflow(iova, size - 1, &last) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/overflow.h:48:15: note: expanded from macro 'check_add_overflow'
      48 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:257:7: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long long *') and 'typeof (size - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     257 |                 if (check_add_overflow(iova, size - 1, &last) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/overflow.h:48:15: note: expanded from macro 'check_add_overflow'
      48 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:298:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     298 |         VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into device.\n", vaddr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:298:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     298 |         VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into device.\n", vaddr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:323:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     323 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:323:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     323 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:336:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     336 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, &irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:336:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     336 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, &irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:342:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     342 |         VFIO_ASSERT_TRUE(index == VFIO_PCI_MSI_IRQ_INDEX ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     343 |                          index == VFIO_PCI_MSIX_IRQ_INDEX,
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     344 |                          "Unsupported IRQ index: %u\n", index);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:43:35: note: expanded from macro 'VFIO_ASSERT_TRUE'
      43 | #define VFIO_ASSERT_TRUE(_a, ...) VFIO_ASSERT_NE(false, (_a), ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'


vim +249 tools/testing/selftests/vfio/lib/vfio_pci_device.c

ce0e3c403e00e9 Alex Mastro 2025-11-11  232  
ce0e3c403e00e9 Alex Mastro 2025-11-11  233  iova_t iova_allocator_alloc(struct iova_allocator *allocator, size_t size)
ce0e3c403e00e9 Alex Mastro 2025-11-11  234  {
ce0e3c403e00e9 Alex Mastro 2025-11-11  235  	VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
ce0e3c403e00e9 Alex Mastro 2025-11-11  236  	VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
ce0e3c403e00e9 Alex Mastro 2025-11-11  237  
ce0e3c403e00e9 Alex Mastro 2025-11-11  238  	for (;;) {
ce0e3c403e00e9 Alex Mastro 2025-11-11  239  		struct iommu_iova_range *range;
ce0e3c403e00e9 Alex Mastro 2025-11-11  240  		iova_t iova, last;
ce0e3c403e00e9 Alex Mastro 2025-11-11  241  
ce0e3c403e00e9 Alex Mastro 2025-11-11  242  		VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
ce0e3c403e00e9 Alex Mastro 2025-11-11  243  			       "IOVA allocator out of space\n");
ce0e3c403e00e9 Alex Mastro 2025-11-11  244  
ce0e3c403e00e9 Alex Mastro 2025-11-11  245  		range = &allocator->ranges[allocator->range_idx];
ce0e3c403e00e9 Alex Mastro 2025-11-11  246  		iova = range->start + allocator->range_offset;
ce0e3c403e00e9 Alex Mastro 2025-11-11  247  
ce0e3c403e00e9 Alex Mastro 2025-11-11  248  		/* Check for sufficient space at the current offset */
ce0e3c403e00e9 Alex Mastro 2025-11-11 @249  		if (check_add_overflow(iova, size - 1, &last) ||
ce0e3c403e00e9 Alex Mastro 2025-11-11  250  		    last > range->last)
ce0e3c403e00e9 Alex Mastro 2025-11-11  251  			goto next_range;
ce0e3c403e00e9 Alex Mastro 2025-11-11  252  
ce0e3c403e00e9 Alex Mastro 2025-11-11  253  		/* Align iova to size */
ce0e3c403e00e9 Alex Mastro 2025-11-11  254  		iova = last & ~(size - 1);
ce0e3c403e00e9 Alex Mastro 2025-11-11  255  
ce0e3c403e00e9 Alex Mastro 2025-11-11  256  		/* Check for sufficient space at the aligned iova */
ce0e3c403e00e9 Alex Mastro 2025-11-11  257  		if (check_add_overflow(iova, size - 1, &last) ||
ce0e3c403e00e9 Alex Mastro 2025-11-11  258  		    last > range->last)
ce0e3c403e00e9 Alex Mastro 2025-11-11  259  			goto next_range;
ce0e3c403e00e9 Alex Mastro 2025-11-11  260  
ce0e3c403e00e9 Alex Mastro 2025-11-11  261  		if (last == range->last) {
ce0e3c403e00e9 Alex Mastro 2025-11-11  262  			allocator->range_idx++;
ce0e3c403e00e9 Alex Mastro 2025-11-11  263  			allocator->range_offset = 0;
ce0e3c403e00e9 Alex Mastro 2025-11-11  264  		} else {
ce0e3c403e00e9 Alex Mastro 2025-11-11  265  			allocator->range_offset = last - range->start + 1;
ce0e3c403e00e9 Alex Mastro 2025-11-11  266  		}
ce0e3c403e00e9 Alex Mastro 2025-11-11  267  
ce0e3c403e00e9 Alex Mastro 2025-11-11  268  		return iova;
ce0e3c403e00e9 Alex Mastro 2025-11-11  269  
ce0e3c403e00e9 Alex Mastro 2025-11-11  270  next_range:
ce0e3c403e00e9 Alex Mastro 2025-11-11  271  		allocator->range_idx++;
ce0e3c403e00e9 Alex Mastro 2025-11-11  272  		allocator->range_offset = 0;
ce0e3c403e00e9 Alex Mastro 2025-11-11  273  	}
ce0e3c403e00e9 Alex Mastro 2025-11-11  274  }
ce0e3c403e00e9 Alex Mastro 2025-11-11  275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

