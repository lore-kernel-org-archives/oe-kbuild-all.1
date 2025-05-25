Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A07081F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 02:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748139151; cv=fail; b=lf6ntOnl5izbnRGjav5WpmlL63CSxAxnfEfdjRs/kBhzhKu4WYBFn81hw5CLR+E5jzelR3j2zvm3N/oUko28Qh9lv76SPwy/jfLcRePTkVgX3C82sVAnQdAJadrRT/GGQCmCEMGrGiJkB3FewIy1/xhNin1w8dUbEwToWVh38nU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748139151; c=relaxed/simple;
	bh=3oyA8q9xtDK1sC57rFlmla8H3Lw3+86b5poB3Ep2RKs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WPHD1SPqkKMC73gzFd/GUeIvPoZr760Xyudtzzdiwt6LyBARPhAMhblFlFgd9jc7nMr/3IyjGnPGkOYicpmdXBUn8BqQ857W5lpCrSo8p+bWW6KGk37X1lx3mNhYXF81m4NXqngtZvQGJkGmhSnsV3Zj1Rl4Cp0/baktnWBJZ9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGGM6psR; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGGM6psR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748139149; x=1779675149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3oyA8q9xtDK1sC57rFlmla8H3Lw3+86b5poB3Ep2RKs=;
  b=jGGM6psRJKYnMsDM7q7JfKdSgmjmlFWn6666TqrCqs6l9T/BCRMMJG02
   /QU+gYeXJ1mYh6OUGIpQCN9mO42R1DJWUK0FD4JIc2ZF5FamB4bNactgx
   TMjftSBD55zeCM1f82vBrQtUQUIDHek4kO4m8503vDJaOvlSRMuYEwzMU
   1Vope4/vaWxnFvCacqXgfNXj32fuSksdCc8fmSh+BfPCKFJOpPcfTb0/I
   0axvp1GY//gBUvqY//yDP2ke1NBpdP83W6nwYIFizy6szk0LFCwTz+ROl
   QxJCmmuyTaizbtUxsuqYpSdI2rMZa2KxUB5Qr40x6zAD74d3gaW/SWppl
   A==;
X-CSE-ConnectionGUID: 4St80fJ7QhOgdOdhEzLTNQ==
X-CSE-MsgGUID: zJnRJ468R+2hG8Inaxo7dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50072204"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="50072204"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 19:12:29 -0700
X-CSE-ConnectionGUID: 5KSeivkTQZypsHu+AA8X2Q==
X-CSE-MsgGUID: 3DGFarUASaqe3nNmPr588A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="141799856"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 19:12:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 24 May 2025 19:12:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 24 May 2025 19:12:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.51) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Sat, 24 May 2025 19:12:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2rJqfUryGqGbbB9o7nQW5dc7Dl3wTUCntyOylllnhETJXDDPKxRTQKuWEkNi4P70ov39YaWQuCWrUta5ibIvDV/129VZ/X1RNlHqFf6by0In90WgYsa4Vu+BPvgBAK4E9uc2tvJXIkejmDFftlWljnZ4+KU52+MalWXP+RPVd3fjmRsHKXzqK7Zip3NSVS5bxhDw8Ntp8JIkiPIxgANv2R84JSoUeGUwvnhujuju/05aFfImHQ+yfwkNJclgseAjhUKfjlHOteFai/o6PFsHzjfJxkfTqca1b1xJD1luHa8Kqzgg0SIsY+XNLCGqZ1EZ7F8VwIHlmGdFytfTDFORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZvVXzdxaS7RGMO1Lb4G/aeWVIbfmvuHir6+f0eK6jA=;
 b=UeB5jj7R+Y+Q0Ev89pZtEgvDkkaywPGKHF6Vy2WXycfn6jut4eU6rpHQdO7da7O9OhBykoLvppHCHZbGGCjODo2PSWY8eVfg3IC6pwxM0d2vm5IFZI59tLhUq4g5AkswHlmZ90TCyG3X5Y5OaOaMBZpLScN0lFNEz4PQ7LUAw2TByfRWrVg3yMcp/skLMKAz0v+ZxLb6Zw4gCgvPIClgB7p26JFHsucQmeR9nEn+X0AAhgEOo1aS9Npi403pKsMeyFoq8ia47+xZzUeF5nXqLUysGXGQGOrLg7omMmMtwcOTf/SvI7+hqyfchMyyey/6CRsqIUG6Q268nxaG40Jzbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Sun, 25 May
 2025 02:12:24 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8769.021; Sun, 25 May 2025
 02:12:24 +0000
Date: Sun, 25 May 2025 10:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: Somasundaram Krishnasamy <somasundaram.krishnasamy@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>, LUCI Bot <vijayendra.suman@oracle.com>,
	Jack Vogel <jack.vogel@oracle.com>
Subject: [jlayton:uek-localio 2095/2262] clang diag: warning: unknown warning
 option '-Werror=frame-larger-than=2048'; did you mean
 '-Werror=frame-larger-than='?
Message-ID: <aDJ8fu/mf9OPewow@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|IA1PR11MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 657d73f6-aae8-479a-9cdd-08dd9b31965f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s9scYIRsmvTsNvHodOL7bmzEgAX2JZHP9Y7B22VJBF7bCiskX3c4Fx8ltGYj?=
 =?us-ascii?Q?6rD7UzG71Os7dBhoEBI0aIalNRH09FymSyZPNqSNWa+eJpJpVLj71XIe1daJ?=
 =?us-ascii?Q?33+tJcilvBmkfsV+glSqAWF9kscVAxhYsvPtQ8fJb9mCmMQJLe+lls4dLQMQ?=
 =?us-ascii?Q?m4WMSIM9ijCT6RulqUGRzW0JFsXc49HXB5CuwiEzv5NTDhNtzrM36miAkvQ2?=
 =?us-ascii?Q?9ginJjA5D7LY+ef6tBpsXgCOJyYfYL/G38v6CUuE1v1SSK7cg7w/YhAeTuIy?=
 =?us-ascii?Q?AoCHRtfsa7NByHgDrW7sx3ZUUCSTj1wsOdulYt22hxIdtBHoo5VxTxEKFNi7?=
 =?us-ascii?Q?Mj1ab1OaNG53IdO0zqYMRZ54VbCJEDJPyFysM49MR/DxYLzvzyQ9P6EatMtv?=
 =?us-ascii?Q?KUszfhLIhINSXl+Z8fFMt6jcL9XtZqcYEp83sl5RKMOEwhIg4ipfZjpBLW7P?=
 =?us-ascii?Q?RbYari80oDeKDDeIcM0Yzx2KGW6MCfR79WGmplY9FD4jQd5Np4QXfrzz7qVn?=
 =?us-ascii?Q?f5n87547GYZsE3zpnbp6CProDbM11YcTGXqSJsH9dLyysDg2GqGh3fNqXcLR?=
 =?us-ascii?Q?Ett3a9kLdJ3oY2lC87QFwSnrJYT9sXNSJIdg8tMapkAvgkSZWMQGJsDBRZy4?=
 =?us-ascii?Q?0WveMltufMTXGUI/zpBXH0leeWtQx+L3O3TfmcZA/R3KNqs7tR8AN06jM2yI?=
 =?us-ascii?Q?G2D4CBclXWDA5vQJ304shp3bOT40wwlDS+4BiQPLC0glGYuORda82Pm9LZlv?=
 =?us-ascii?Q?FdVXbqtaVBOsk0h2dtqdxqlV1/g9AELoVMBoD7YK/BnGnYKkJzUTPuuzQ/UT?=
 =?us-ascii?Q?GFrQTm2sN5SQy9+1s1jSaFVQCOmNrV9mh/CWPZwFubllfk7FQv8R7EEFQucE?=
 =?us-ascii?Q?feIvKgutebEa8/Z0A/X10RrnruMlagsBWL4uuOafAQjhbRBOvoQjYkdXZ6Gm?=
 =?us-ascii?Q?1qOTQhxzb2daSZB38TefsgkaRwJzf+TqRykdnSQxsgZL0BfsIJzFcqJuWnoZ?=
 =?us-ascii?Q?HFv2kAR8XMBbZfmExlQPLaMO1umpmjoDau4WNPHIuoB7t3rqqW1Dja6G6ggz?=
 =?us-ascii?Q?jUYGJKAihpMpnwT9pV0RHM89rJ8hIK5o3urDhtCBiGaPdYmNOKX8Hux0nutQ?=
 =?us-ascii?Q?itGnAbqbIf52OZjJqLLxHPYD/0stfBU17IRlK8ibBju4ibqv7//2D6Nz5thq?=
 =?us-ascii?Q?Qi6f+CVY3giKLQbG/0FdTrC6p7MO07tULy1xs3OhkfsF6AOknHDbXBnwyP5Y?=
 =?us-ascii?Q?Z9Yhwxx6PjGY4lvDOM+jlalulStXXvFnpkqwpYu3fptLHqabtMhXKcC2xZ6B?=
 =?us-ascii?Q?00lo2MKS+r7133OW2Pvz8cLfrZWk9AgsbwBWNiuvuOG6ywX4EOkco6CTQLcF?=
 =?us-ascii?Q?ox9jCwzD9yaWcGnTONOc/QSO9NSj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5NOOGNlDxaRp3v/ijuyuOo0tTjOZCwlnzHXcIPID0M7OgT8qIZsrD2QtvNXP?=
 =?us-ascii?Q?Z6VCzvbX35knku2smf9LSxk8QFPpSP2lS3XG0uqL02zKatfUUJcdhZB7TWY7?=
 =?us-ascii?Q?6QujI8FUeKAJ3vvV+SYT+k6Y9YeAcQ8iaTsySP4LGtPBh94enjhrJ9d92rhq?=
 =?us-ascii?Q?dRf95NX76M/KH18s1G5WN2/RUu9D1+85ZwEHAROqYTqM5KUJYrFtTs7gS2gN?=
 =?us-ascii?Q?uvOpU+HTVTx4adq3fBKy9RT6+8kMubxyptRx9xelncagD1pTAVlcAkiLAVsM?=
 =?us-ascii?Q?tGgE1gROz1EpNHGSBJ3183DDzWNsQeCA+49LMaId0X73zsisC2j/BJ3rztlf?=
 =?us-ascii?Q?xheQAOo6WOHsalfxJv9mAO1wi5jdo/49gGrGJy2eM8Kah6s+uTG1LG5VY6SN?=
 =?us-ascii?Q?39wzuP5dtXcQ8+A4qFG/U1DkYDGSO2sizQnI+M+2h+WrAl8KA3HOQMHzYguu?=
 =?us-ascii?Q?jT3tKOvfM2Dm4TrZrk0Gv7OHfudfqiy4cbT9M4VXaIFiD7oC+yUPWlV/6010?=
 =?us-ascii?Q?QAvo9ji20KArHXp+UxeLYgKhWrsXk7OGzZ6QeNjbMqh3dV/4OLIJGyq4NXZT?=
 =?us-ascii?Q?WLT0UcFg2EbIXboKs0m6WfqV67+KQfKAmyLlO9U7Z90I0mMc7oRb3qGQLPIF?=
 =?us-ascii?Q?G2cdECC57zYf8zzrsNQx5GgqJXh3hBfCASMEYkxcptK1nrniEUIxfCcHPyc1?=
 =?us-ascii?Q?1sZ3J/GIzjWPsLaXbLJoL059K16tB6GkmOaVxfHXXNxThlA47jL4tDRbjGJa?=
 =?us-ascii?Q?lC4MnIqfPB/qBd0tsgFuchp+4Bb548aO1XyIaeVMoydIejxRoRz/fPl3ySfH?=
 =?us-ascii?Q?87L5H3ZcBrbcbhKRkAgIUOE3f1bmbPWEkBGkY3pl4ESatxO+j4A8WPbKvMms?=
 =?us-ascii?Q?Ytx7KQl7FbbHPakzMglFYsyS5w/gapWgmr1AkmtbawUwoxGUU9ggQjRA/qrg?=
 =?us-ascii?Q?49IBvuo9tebbkEIuQaMbFDeLmOSTZuUGHePXql6h0xl0U4gftYbitl/fAG63?=
 =?us-ascii?Q?nKfeOG22Opb5K4ncBDWwbdrWRRrxTfautXs5MzyJaiQ++lg9Qg7zFhPoHP53?=
 =?us-ascii?Q?1w7t7fHGTq6aXUCI46Lu6j34TEmUHAPnhVKx6aRWyPzvRMWrbV8tEJMUaZCN?=
 =?us-ascii?Q?9op1RmXArvX7bJvdZLainNJXcwuk6UF6+CBPXGqHLx4Gef/IU4JdjJTB1EVg?=
 =?us-ascii?Q?3jSDbYFXpZJ2sMFN3P87ian9ALdwRevVBnjJRndnU2oMR8RZSXMHYkJwHLe5?=
 =?us-ascii?Q?q/i8UOLddNrBFn741lACOYB9hBvUMwrT1DdwVBytGXjMY/WPIB9wsPT9ARR0?=
 =?us-ascii?Q?3PDzqoV6h+I/8TmanxeKgq17nD8mseZXhey3eJ72VbHVXFO5HNhA/qJleFGj?=
 =?us-ascii?Q?1up7EtffXAP/3FSUOaEI6bKA2+eQqXgrAnfj2Fy7iztsQx10kjbxpFPDZxZT?=
 =?us-ascii?Q?nwZfKlW5Us2s8OeULpazqC3tl29IGv7hMwKwf0H7RfoleIRgYNfKSyTHAWUU?=
 =?us-ascii?Q?Sds9ygMFq3Pi2ngbVwzfaVMjeQup9Z49CMOE0WMFPXwK/wVPMm0gkjvaRr7R?=
 =?us-ascii?Q?rmcAHQGKSlGNZrCtle4HNaYSKxyApjisQEychhSR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 657d73f6-aae8-479a-9cdd-08dd9b31965f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2025 02:12:24.0419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbpNoBY9vbifM+sIaxEuAwEvRHg6ehphPgVxAr3PVQG/Y03Dr0fQpxHnjfnSu9Xjq/p5tN4qqeltKwgkncVBNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6418
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 489bb69303b3421ba3e8af23d77f998ebfbbe698 [2095/2262] kbuild: Convert stack frame size larger than warning to error.
:::::: branch date: 24 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250524/202505242337.1y2UM9bX-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505242337.1y2UM9bX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505242337.1y2UM9bX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   warning: unknown warning option '-Werror=frame-larger-than=2048'; did you mean '-Werror=frame-larger-than='? [-Wunknown-warning-option]
>> clang diag: warning: unknown warning option '-Werror=frame-larger-than=2048'; did you mean '-Werror=frame-larger-than='? [-Wunknown-warning-option]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

