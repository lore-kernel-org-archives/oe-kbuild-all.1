Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793924542;
	b=H3s/8veJhutSO7AKBkaF/hwOj/eGu+dx/wbwj17S05V9TFk6UKJJ44AtefDOwymObDBK
	 rH62I9HQFNAQu1k5jDG/OT+TrtxTWG98jjMRcoCROtjmj9mCZaTt7DH8I9oaZHcVZGnyR
	 G8BDirmPEuxCaPQmJ57pZOIo0KB62R9KqtCycjfqCvFe+01Pzqe3x5vHb5K36vNFMiKh3
	 Co0K5sFeODT/1O4dkKfr5eh+GGqNCx73bETGF1VhLhb/q7CwwuzGhQBQHw7EK+yEkd6Nw
	 +dtFUh+ATVWrS5sV4p9pk/rtdOgAEX6DEnGIqutvUhr2Hb5MndyKOG8pvLFvhJcSc6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924542;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 Content-Type:Content-Disposition:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=njYOQoY7SuzHzrFzMRaNHjIBiArT1sImVAypF0EsJos=;
	b=SL9RA2FVMA6HSj35phsAizK0Meehjx1MrSRUcbciEopmIGno4wP74AtxmHuA3N7ftrZr
	 AZfntZ8wzRMMjP+jos998vOleCjy6Y2+kGPsoh/dMsk89Opi2XxRPePQNzgBupB7uj3Ac
	 wTIF3uxtbtjKz5/pfWgBZLLLfaJhUQZP57/FPRV5xzdqSq9r6nqUYJQGMgHDe9pms5IAw
	 mFZxUTSn9AdxhwttuJGbU52xneaks3eh8l0NeeKaBjbKQfaE3vlSoaPlLzLUwtBdmagZ2
	 CC4DJ9lbmjxoCEd4I3wR60wcnIjwC5Ye07Dtpsf02OjxdNXlEAx4pG+ORfVqjI+8OIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bB5SQGes;
	arc=fail smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31FF606A337
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 00:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31FF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bB5SQGes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793924541; x=1825460541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJw0+DNJQAV2vJlpB9X3Fvnj1QwBH82FxKn6nS7SgCc=;
  b=bB5SQGesga7F3suD8f2FQmavzpjxS/0Rk942W+P7pWAwIeGr75ne+LNH
   3RD4B1UIt5aNej3tf4f5OfIQ0P9GKOGd0QPHoKbYDS+9I3Eg8QXjO9xRU
   secOz+e4E9ex6xXqjw304b/TvlcvcJ0KCW4z7r8Y5SYsrZuUoLgtsc2yW
   /yRATDVnCKWJttBDBSUeV8f3i5/4JXydxFKa5JcVyNUZupiHKyn2FSvvU
   Wz6gFEf7fGef7DZfSlXnrEC/10REURrd4GJqmCnqrbrmIZ7G4JPafD9dQ
   +dy6LbnvP8W+8o786qAOKUuQkAWBbTRuLQjbzjtVV3p21hQQzEj5BT/MO
   g==;
X-CSE-ConnectionGUID: np1qKP7/RX+5Fpw3d76caQ==
X-CSE-MsgGUID: RkXXzqBCQC2nUnOGOIOxlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2606807"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2606807"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 16:22:21 -0800
X-CSE-ConnectionGUID: tCVhqyu5SjKygXc4uQ+7CQ==
X-CSE-MsgGUID: nLG2oM5IRyS/MlRId10vzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="9023407"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 16:22:20 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 16:22:19 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 16:22:19 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 16:22:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DffbMkzORa9cHo7zW40itc9LUUGS7OjEyIvqUyTPen+W/D4IrrGQ068CDNMGu9qs0ZtQ+C/XVdBYOrsAdMSPm+DD+hkxTaaDdoT495w4zkEEL0h+sI8SX1g4f/E9HOgA1DNogdMrZcdsqnG0lbR1nMshr3U4ymTOUfAAgqX+byd0Vy5RtRTmmMZiQ1T5oznhEUVyJ1GskQ3EexqWnC7gg/y/L8aRQ0vj9oucYsTpCyUkyi3UFCOMww+i3AhAt9BnRAqWLYguWQUNv+rUq8RYzGXbaLntAwFu3nF0lLSOyIKArHR7Bpv+x2QKBpOFRAI7t4P1pqTYYJPDVeQ+GorZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njYOQoY7SuzHzrFzMRaNHjIBiArT1sImVAypF0EsJos=;
 b=JCOvFn/igdZsEhHhzHBY1O2IQSm+PKpXFr+GSmNMoFhUh0Pj4GtnHw3nI7oG2Rh5RiuD3S2HJwy9GHftoJDN4uWoH25NXHvPWXXDIRh9Dhglk/nPnQDMAimuvJpJHOpjTQYlStkeXJFnyONu3yRschO0AB5a7Ob5xwQmJzZKtsOJ4IcnuSQA7tSY+9+dhjpSZyX7ybXFJeHdHk98Li5rgTlYIVHVCj9iGB4nCp/n1dnUHPaLBVUyDddnaFklNuxdjH6mvfi7Cw+LleKMIPU4zAMittpAneZ2RRyJKIwh/MJA6tIf/3ebR5T6t3UoFVpgD80vv2KnbMzwR5J22PEhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by DM4PR11MB6552.namprd11.prod.outlook.com (2603:10b6:8:8f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Fri, 6 Nov 2026 00:22:16 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 00:22:16 +0000
Date: Fri, 6 Nov 2026 08:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Flynn <david.flynn@hammerspace.com>
CC: <oe-kbuild-all@lists.linux.dev>, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:kernel-7.3/jflynn-io500-canary 1339/1462]
 aarch64-linux-gnu-ld: fs/nfs/super.o:(__param+0x138): undefined reference to
 `nfs_idmap_cache_timeout'
Message-ID: <au0dsP7WWlE5K70l@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|DM4PR11MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: b19dd4e2-f394-4650-0a9b-08df3b9c030e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925022911599003|260925021911599003|260925021311599003|261026121527099003|56012099006|11063799006|261022075727099003|261102124527099003|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: YA3I+hq5Zn4Xxlw6vbLArKjLzAGakb2wH14j3V5j55sEVZiNVhJyjARjBfqawibzHSpe69oW0DZG277YW9dDPu92V7gIuE0xQbmjfMQw4sqmg8gUBGV2gMdk+6n3WegDu/AwoKWELi4db58wvmaD8uED3AAxGbiI9Dt4YnW5+o5uCqvOtSKFF5psZuE+hWmRK5gt3NIuiW7d03Ljuo6AjSDDTY2Cg5FWQJROyP8zozOxGZDRxQZw7fk7dAkr2lQAUPzBVXl5u3mD345yZOSSSkWdFy2Czn5vlB4Qk9kYIBGSPwXl9MrRJuvOit1gtRwKvfjLe2w09vQX6Tt5NpqYui5IGiuFrTHqy/HfI7yU/9Y1JByuWtMTPtpt2zzEhIqGGknf4QGyhg/DlpHosjZPjwf8i9BGcpTHdnXctOnGqx/WiCG9M9MSGYBOYpyP57VUmXzxD5UuAYTS++p2qX55zGNbxdSZiM6OVGwqzjuWNh7VHd9SxItuHkx/brpaeLbKso4rvSHENJmRMu8h98ibCGV7V6H80RzRCqhNTRQrHBTpBWxuJwDbwrP3+i5tjSaTR4IILTHbxujulJtVIxT/9I7JAhrW2P1u1TSGhQs0xe4m+zpl19xqm6MAAaZOdcrL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(56012099006)(11063799006)(261022075727099003)(261102124527099003)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3imrT5f3F/1iSqpS8seHUUiUGzgPQKM3Agaj931rm3EFiJ11uWiFupLoTe6P?=
 =?us-ascii?Q?MDZUdpz2o4ohqIEJCREijG7FqKW3rLJmmFt43KrOhLedAIFSJ77CwDEkR25h?=
 =?us-ascii?Q?urvrBhRB4e81xgtFzmYv8eEsqa7shob57DdHJS38IhAH4Fdnf6fHmzTh2WzJ?=
 =?us-ascii?Q?72OxUS+1nXsACResFs6L/Vqa46UExKZj8gIE2oAGpKRtlIQ4ztwSHpChlZPy?=
 =?us-ascii?Q?epwZ0QfjegIUzyp3CZKhaxvpW191en0VJw8mijguatcEa6zrr/uWg0bhIl2u?=
 =?us-ascii?Q?KYfUfpqECxdm3e/s6scsv8z2tus5wWDgi6ekHEMf+3Gg8a+FhEhgTpLWSmfH?=
 =?us-ascii?Q?gTBMFyfF8ChPCOewlOFuq+UL5ciHSqhhMjV6rXeM9Tkk782YWVDH33h25rOD?=
 =?us-ascii?Q?NOqVv+dVU+1lEKAqoWGbQPS8ugVGVmRo5UvPxTXKThBCRbe0udDWWwhWHRcr?=
 =?us-ascii?Q?CK3waspcjmLdxQ72yf6toUsCP3Qk3shgTzznMjVli2ZRUJDgENbQtgLXvVFz?=
 =?us-ascii?Q?P5fOtjhyTILWYacRW8vfr17z/JjfirC9FriZAg8X5ZRJ4yYttW2pHf8WEY68?=
 =?us-ascii?Q?TV+EXmNNtb1KJz2HN0vcXN8RvtBa7odR+EfIgeLb9fsci9M1y2P2pVF/1pQV?=
 =?us-ascii?Q?r7M5Y2UsqJ+/0qEziVkDNowF9NU7Z6p9DXObmgewAPCHQmxApG1woMEyyuFK?=
 =?us-ascii?Q?/1YpSPwuRdTbvxtbmSddOjq6TgLYIi9W4VyDU/+0vel/kXFhykgK9mCKuunK?=
 =?us-ascii?Q?sE2m4HOwuSEpfz/DNnz3tPTgsCnQGhhx7Zz7NFMzLwyBERmv+LYB1lK1LArq?=
 =?us-ascii?Q?XirbgTK4KYMmxxaqHn1Q3QebCnH87JmcEKkGCDoBoJqzby1U/lUvNgjpU32L?=
 =?us-ascii?Q?yXLh1xFWZLj5kPrybMcVp7mgo6nI5/uQo2uaRShFI5wMfezIqP7fwpzU9YgN?=
 =?us-ascii?Q?OUZ/GpxXTOAsitcfzNAnCP0gKasVKiEOMiBgJceEqFoI1oa/HhlqD+pKDOvd?=
 =?us-ascii?Q?Ew+sPCcilCd9Leu5ZQqnpxJ5iUHBRUVj4BLGivndnjz6sXss/tOEh8rqdCNa?=
 =?us-ascii?Q?3QjwE6s5txJezQ7OX4MiA6HSHonTawHRwMrqSq2MCyAHr8+44FQ9OwTaSuas?=
 =?us-ascii?Q?9tDp40LCg7fnHSc5CaMjVkdNl8hJmgC19OVQZ2MHpLsswUn/cn62X60LYtTj?=
 =?us-ascii?Q?elOdSKbUpdFa/DQbdi1lxeN5kJlRnR57H9q9BVC5Mw/RdHxA7ATlwzd6G3Rd?=
 =?us-ascii?Q?wR3lY4cxJsNwMVzab6pZHS9ndh6R62OyMmiVri4IhYoR7Xsqtp8QHZtyIWVd?=
 =?us-ascii?Q?GzXgT1a9Jx6FmlVBO+reLidPYpcKYCxvLRkp1JoK0Z9vpaSIjdgoxKeQPOgs?=
 =?us-ascii?Q?NKSAm2CQ8/+8GKNOVmXPitYNmbpM4RgtzCSDow5CU5holXAHjIa/cnVLlfjC?=
 =?us-ascii?Q?QZ/xC1U6wA67RQXP3f2OBbwixLwqO2edsULBd4vrDNUfiKYileQJO7ODuhwP?=
 =?us-ascii?Q?L2aMsbic1H1eVgvow95lhqrj/yZSbrqPOFvRA53Bh2wYiCG1dVuvIVsqtArw?=
 =?us-ascii?Q?lRVXu46x33nWtL9fX7N2AgDM7+a67fJey6VtNfBkFw9AREVOO5GrRZUloqvi?=
 =?us-ascii?Q?luQAzV3AWtVB3WdvnVJSk9qBr2mKV3irJCdlLcDVrsQaOo3mcpZaXSevTiOD?=
 =?us-ascii?Q?n93kXpzW+VaBmv7m6Qd0FPJd1aiGuyn6+e3yjagGO7JtRxJPMeGOi/OBxX0t?=
 =?us-ascii?Q?QMIdc80j9A=3D=3D?=
X-Exchange-RoutingPolicyChecked: utzR1IIyskD1lNwaMdNFXVYoQ/8RZ6DQwxcdhnRCXOVPXjyXWD0tHAZ4Zi8M3hspurxuUjrC9Lqc0ja6Xvup5nTzBBKcKRmaA6yzqOzdYmnnYCJmRTTEJ4PeBXgvEnN5eyAXYZihyC6TwYmvnMO+8BIJhUi2AOhTEWwdxknTI+Z5/lfXN/5AWSBwhVlh9isT1XKg8KFasT94h5cPK7exI2EPyBrPm6FA5db+NeENiWEtXRSHM7dLOywcJOZm+ECzOzGl7+rsRkgTtO9h+6h96MMiLHOIlAWrPuaHnbi3H64oFeDyDz2q+3lyTp1EKAoeY+HdsVWK9zk5heRGN7N1mQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b19dd4e2-f394-4650-0a9b-08df3b9c030e
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 00:22:16.5163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXpomfVe6x4//z1BtiXN3sdS94KEiW+2E+IqdAiqoVZOnKpevkT5ZKJ9AmwnVMRIYH2CSrFv1rciUz36nGVJ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6552
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/jflynn-io500-canary
head:   a0f5f04a3920835767e24c944e54a676d5aa32b8
commit: 1bb07fd5eb81675b74c94d750b57d01f34768f8c [1339/1462] hammerspace: private extensions (O_NOMODE, mkdirat2, NFS client/server)
:::::: branch date: 22 hours ago
:::::: commit date: 25 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261105/202611052229.z1eSAQlm-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052229.z1eSAQlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611052229.z1eSAQlm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-gnu-ld: fs/nfs/super.o:(__param+0x138): undefined reference to `nfs_idmap_cache_timeout'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

