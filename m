Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8611913C3F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 01:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764640756; cv=fail; b=k3ATrot8LCEt/itHVbf7+wj6Ehyw1C45SsN3EFC11DidwTMJGj5xhC4GJmjWwNRpeKcu0Ws/S06DIiX+qPR/dTYL31WhI2O3RoiiE7HSogSuraG37cyz/nhc673lWuqKGMG5J2z3gijnhl7o6J/y8aEk7hykdfGfSRHW8vjTxys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764640756; c=relaxed/simple;
	bh=MR2g3EiiBHl8Gaocsm0kJLD0wsaUl8HQczq71Ti/3zY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qd5jr64VdZxtRl6SlUnLA57AkwSfOPhLNwO7J4OhOVgeIfhYk+wHfRVb0kBZ5K5VEH3+q5JDSEN3eRcMrKUpiaJPxo+ZtqnnjFjoAJQBsvsuiKmyWzAmapg6qGi0A/WHF3pJLqtgIvQZIc/ph9sLdhzeMAv/LFNzt83aMT+uys4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvO0CrDb; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvO0CrDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764640755; x=1796176755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MR2g3EiiBHl8Gaocsm0kJLD0wsaUl8HQczq71Ti/3zY=;
  b=nvO0CrDbvZ1OA8l8MhtsXcGMWM+5/qqiELHsbw5hCN7HUef1i+wt2+7I
   JNFyoYS0dmNNAQzDGxsWhm0OP6rFNLoPTorbzFKkzJUhSnWnm7MXfR1OM
   Ma1Fbl3BbfHGoqXWgODjtNkTg8HyBWGy3kR1eerx6cHSpmRHuE3dXPchH
   0d5A6G2qOsGCYPawkWNzvCU82YyneYDQHHEavHn51dPcEeEHxnHn5QjDq
   /FAfoMcmlhoJ+j8himUo3VUwRR8BFOy6HAhFD92o5MIlddlWjW+1zQOZr
   4n+pjCGDbyDxELlFaqjpMZUbedLpDSl5iwj9xp8tXpCbwJOoNEf/I0ZPh
   A==;
X-CSE-ConnectionGUID: lTQ9tEtdQQ2WSKzAVMWtyw==
X-CSE-MsgGUID: MSsGMtZdQzyvS8NegX865A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65598104"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="65598104"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:59:14 -0800
X-CSE-ConnectionGUID: PUPc9EbkTraJMHLnIDouAA==
X-CSE-MsgGUID: Ic0DCUapQj6SC4PrbRAPIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199169566"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:59:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 17:59:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 17:59:13 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 17:59:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jx+oAbmr/bGpkGs0GdX5Bok/ailh/e4Kkepuil4iUQmTiebHWDi+po9GFDWLqHWYRNgyTK0CrBundC9pXTGOhceGEP4DVzDyw5hUOtdtjOMc0glpxVP19q99Wx9U/DMy1DaW+InPwGedwOrDQw7qJbG5+dRQ7NzGYbM3UlZhKBNbSlkGG0bhwZcEgFFPzDw8KXIxZUNYPpCG628wfN45iwBN2yHBywT4bsaQolwpagwgXDTWAT1AuuPqU7ZU+JficPJu5sASd3Gi9zg1WTMP4ktgEAmAvkLPT7DITvF6qFBbF+4PAE2lewZ1HmCJ4Az8o3OisHq7BCcWl+i0N2jnew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB8y47ygdUCiwLIFqxKkM6pKY1QgoWwbfcLtekOqZPw=;
 b=dheWoBAP1h2JUz9vAJKRR80WSD1Inu+8xcSO4fRbdHEkco5/NvJqTf0KQIHLgi2jscLJP9mrWimpxX6YQFH4ELQSH5jNOm9yaDEyvS9ECAaZyW3q5sqKGddqxEuaxWKC6Ko+hi4EdY6hN04/oztY4aNZRNZXSKEqfcZzWKLDmwMxH3T7caHDbcza29QI/UKmxTksWpWP1KOMNWbpi8/LmnDZNeZ1O8u0sbjp+CuByRxzXAKfMFQMwfxzwHjX7m05JO0ZMa9dT/Npd9IbwJiKWnQzBhTbq5ux6ediCjTjr6l8a5aSSIFqG1GD8hXbLJFg84yxAWP1f3d+o+S7rS1u2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:59:11 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 01:59:11 +0000
Date: Tue, 2 Dec 2025 09:59:01 +0800
From: kernel test robot <lkp@intel.com>
To: David Matlack <dmatlack@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, Alex Williamson <alex@shazbot.org>, "Alex
 Mastro" <amastro@fb.com>, Raghavendra Rao Ananta <rananta@google.com>
Subject: [linux-next:master 12705/13171]
 tools/testing/selftests/vfio/lib/iommu.c:92:2: warning: format specifies
 type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long
 long')
Message-ID: <aS5H5VTVaBLI1oY/@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: 6efba03e-c77a-4480-27b2-08de314662e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RBQFBCpj+HXV7bpJpALPuUD8l9uhy34XUHIcYpSm681XcQt5kMdMWP/8lI4u?=
 =?us-ascii?Q?GbkCIwSumWs+nuM2KW5P9KRIYL1lA2vEjMyNfO/pwuhiee6wcc9mvDuEh1lj?=
 =?us-ascii?Q?ZOyaHiXKwZOVsN6PemX/hTRC3l6lg0aJeonS99l3F/1R84whq7HsuqVU+G/d?=
 =?us-ascii?Q?sC5r1JVv0Et3MxYXfDqp8KDizuUkrRpC8VzalNJiuHe6NP8ISB4xxizlj/hX?=
 =?us-ascii?Q?5/PHug4RFWT01nm0PUGiryehyp6kMEO1gSuTDPzn0UPE+C5YBMlAZXXmF6cI?=
 =?us-ascii?Q?IAc9ikdEyW6Qua0UIR/9vAHoekDPh04knWTWBak9q0axbqM/LIGZNkbvQV66?=
 =?us-ascii?Q?DbwBb86JR60/uPAl/WD4xcV1Ckp7TwzzAQtg3rSoCbGg9+XYMNfJoB0sOXi2?=
 =?us-ascii?Q?XZkNMVTlTbN5nITBMLoUhEwtIllX7LDGkWlLTcAv4GJAFflQrg7+oT/PCac/?=
 =?us-ascii?Q?npxLZOYtUgJxb73ghEf4whfcyYki7tnrBniour1uKoybUnCaz2NoRuwaP33L?=
 =?us-ascii?Q?vCM4GdjKD67Xt/B2I9iSmkGOjqKzgCrxBW+sGyefeTu3B8/Wt2D5A2Ntp1ma?=
 =?us-ascii?Q?SuCPUbv73//dSTTBtBUg83kRfZD2MSHO/sPjLuVUY6xVsUMj9oImhSIcVxHu?=
 =?us-ascii?Q?mYnJ4TFaQTuVjw0RlZNNOvB5KuTd/h7oJ3Dp4WkGaxdO0yrNm+okLVN16cXl?=
 =?us-ascii?Q?EwiPJhEt6/D4XAADXeq/UBQFAV/3K+4NnSL7J6bI9juIgFllrQJozHzKFGoC?=
 =?us-ascii?Q?uuDJ22fTG/N1L0KpKEgmmTUVJGdqLe447YL6ap3KRYEc7YO3b9VMq/jjIFGK?=
 =?us-ascii?Q?oPYKqguVmig9uWC3EvYCzTLPuwcvCxjWFmThOpRmoHCD6lhpm0U2hh9DRL1S?=
 =?us-ascii?Q?DrjnTewZr1DrSvZIIIu7RtYgFCEDM51QVrIV3OPnvOcybI51oEleOGb8jLpR?=
 =?us-ascii?Q?vJ6QUCT1Sa6cE1eBvlCnYK3sCs0Q9Bhfn9f5PRfLNI52v1rvub1x5fHw1AMS?=
 =?us-ascii?Q?dyI/XAZvyt1CoVVdo8Oyg8LfgRTtez/wp5eG5KUI5ETwja86HjvAhyLIRYl6?=
 =?us-ascii?Q?LEltWJD3kX1TiNgvB1LLZEUy2D2GkVgepN+pKYu9wyQ7r8tgkey0orA/Fua8?=
 =?us-ascii?Q?EwNAB0/SysCTjD9fcePBnja4OvQO7TZ8r6qECEOaOF9H5fkcjJuzLI8OAc/k?=
 =?us-ascii?Q?d4J4RO/8RLlU9vcZH+ifzmTatoyscnSzNpSnIam0Nf7BNCyL8oZX7c3waipE?=
 =?us-ascii?Q?YfTfqE6/o34O984dUOUyToBXn5n3/vcPvrcNUuVo5/osl6YhWj3n+2J19B6F?=
 =?us-ascii?Q?nDKOkxVY0WWgngWy7RkRMEtLPdQVm55oIx4+CZ/9lXgEJkZZYN0R0rr4uBno?=
 =?us-ascii?Q?fRIsqv+xVp5G+mBaSYtjYcjJsBJLmnYD3PDAUrerp2fm+AMzFLMgqNEgKvDv?=
 =?us-ascii?Q?BliYynCk4dUCS06M6pVvUgV2J5N/k4nMq2DDCGAlJMfjRZS6e890Fg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iFPfbpHggmvVudEqWhlrxXBsNDkPHg0bP+lQsgI7vnSgvX2/jdG+Rr7hWYt7?=
 =?us-ascii?Q?nFU3RSNWT7AjK1WrdALk6uBknlwRi7907nN9YtdTJSpswCvfb6+OvvV+ax/q?=
 =?us-ascii?Q?TH1mfgMRs8nZyaMJxqn6Tuf2JXkXFgvhI3FUucgLatSLviWzBd/wlNfrxt0w?=
 =?us-ascii?Q?xA/8zHjwx3BiUlf3s5OGnw6jiONF7YAgHCYMeWDFgpGPf11U6Mmu/T2zePXH?=
 =?us-ascii?Q?JQjX+7FUdLkOVXe+IR6dd92CpCMkexr9WoVIXbYtNPdHsGxLKKSCAjTG+9dk?=
 =?us-ascii?Q?WZuocAhV6qYBYoo8aue0rKi8uNYEsRjW43xIaERK6e8TxY4j51Q1uFekqlvT?=
 =?us-ascii?Q?sovHevr1G+gyEUY70l+nWtH0WLGcJHiKAHTK60DordgpJZt8cJrLB8CPa/JV?=
 =?us-ascii?Q?bvPCutY/FkbZzQ95HBkrXhhDjWvxHOieG3GVNGuLKYLUSnb6BgCY6gRCklLR?=
 =?us-ascii?Q?tAi5FO9C8nvANR0/0uqpx0aOGeafxGhJ5gKQDPx+2f28EWRuacPyTaDEqNXk?=
 =?us-ascii?Q?cAucJW1DjSTk/cjFslPN0TKWED1fXBTu37JCviDd3eX7NEHWewheM7b7NEje?=
 =?us-ascii?Q?sP6Q8yy6WVjvmru788PiZX44h6d+LtkWQNknMMC/RpLtQSdrlyuWa1QEIqrE?=
 =?us-ascii?Q?2jfN8VpcCdLC7Ov1nOzSOpVaVEHB4CXv0F++zY+DeHHP01bmqsqG6YZyHd1x?=
 =?us-ascii?Q?Q6iHczOhmleec0jAUc/LrRRssw5N6oUCaKnUi4QWnIrCzKdA67vCImKcN9lH?=
 =?us-ascii?Q?8R0xgmbH+HDJVx7DddU43r7JwJnuRKFYEux9J6vBXFiAkz90ddp9vqjctlPr?=
 =?us-ascii?Q?0Aunpa2zY8KqKjbWjJILpn+r1PzgiNYb+7DcF5Fl71BeWcK8pVscbbzP87/n?=
 =?us-ascii?Q?QcTc6W2EORG0efD+eG4ZevVWIN1rSYyC2P8/Ml0chTOeFHpRBlJJftlsy0v3?=
 =?us-ascii?Q?8WTwXxx1qJbPC7XpC3Q8GS5SzeEYhRP0xzwB4vsOghsrz6EOO8psjyeUqeHN?=
 =?us-ascii?Q?QIlfVLoaA0XMl74legI9ebef8h1wZBgokt9VGCjSDVH/cKJkcG4C6VWD2NOt?=
 =?us-ascii?Q?PQxApE22MZwmWQAhLRIQtzJfzSz3sruN2twBQo+PBWNpJiov6u3cEcIdkg/L?=
 =?us-ascii?Q?A4/+K9RetDrsi+9zCngRDeUWTWsIQdIjixRtgfKm8TLkTLhYNNXuMFbU7OAJ?=
 =?us-ascii?Q?TKVE7mmmZR4AeIXtnyBdCa8Of3iH2P9j3eL8FIglxycFo3Jul2i7/ite2rap?=
 =?us-ascii?Q?88rNgJlPV5D3M/tHEe+rvo1qOt9XvCJ6mnmB4BSqFFGz/CKayKZLkgPIcGCX?=
 =?us-ascii?Q?Gd+UWiqQ9niRKgqtBhPpwZctisVn4Lwnl0R73IqDUWu0/hGMetI9Oh4eYcuU?=
 =?us-ascii?Q?2pn/YTKQqO4E80bQpm0P5WKdDlai0ze1Agth7w1ZybulibsuYukBRFk9F0Qo?=
 =?us-ascii?Q?SnRRKPiGTX8HLSEGRCREMOMSNV0ZlH+herfr4aI7IXzC0215RCxiFTzx2gQw?=
 =?us-ascii?Q?VKu355Dbxys8H3QFTKe93Pv89fzxz/vChNDM+kcBEtHTek7SD+X1c9zsI4Tc?=
 =?us-ascii?Q?OqyFZ9vGKTWlOsh7dWukzL57ymFSu3C62hLrY7G/WW4y9MEmQRq253Qspkz5?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efba03e-c77a-4480-27b2-08de314662e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:59:11.2840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QKxQb/SWUkQsKVPVgZ4Vuvkmxfm9E6yl0tqIKAuhysAltO9Z1kUpEnhyztu6twMPHZOmn6hEZorAu0ZN7xRHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 2aca571089b2cc333ed5ad0ada4902aa6f7c0d3c [12705/13171] vfio: selftests: Move IOMMU library code into iommu.c
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251201/202512012145.pWEX2HHE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012145.pWEX2HHE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512012145.pWEX2HHE-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:282:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     282 |         VFIO_ASSERT_EQ(__vfio_pci_dma_map(device, region), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:295:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     295 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap(device, region, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:295:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     295 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap(device, region, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:306:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     306 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap_all(device, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:306:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     306 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap_all(device, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:341:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     341 |         VFIO_ASSERT_NE(r, -1, "F_GETFL failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:341:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     341 |         VFIO_ASSERT_NE(r, -1, "F_GETFL failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:344:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     344 |         VFIO_ASSERT_NE(r, -1, "F_SETFL O_NONBLOCK failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:344:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     344 |         VFIO_ASSERT_NE(r, -1, "F_SETFL O_NONBLOCK failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/iommu.c:92:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      92 |         VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into IOMMU\n", vaddr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/iommu.c:92:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      92 |         VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into IOMMU\n", vaddr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:245:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     245 |         VFIO_ASSERT_LT(*cap_offset, bufsz);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:245:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     245 |         VFIO_ASSERT_LT(*cap_offset, bufsz);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:246:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     246 |         VFIO_ASSERT_GE(bufsz - *cap_offset, sizeof(*hdr));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:42:37: note: expanded from macro 'VFIO_ASSERT_GE'
      42 | #define VFIO_ASSERT_GE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:246:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     246 |         VFIO_ASSERT_GE(bufsz - *cap_offset, sizeof(*hdr));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:42:37: note: expanded from macro 'VFIO_ASSERT_GE'
      42 | #define VFIO_ASSERT_GE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:266:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     266 |                 VFIO_ASSERT_GE(cap_offset, sizeof(*info));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:42:37: note: expanded from macro 'VFIO_ASSERT_GE'
      42 | #define VFIO_ASSERT_GE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:266:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     266 |                 VFIO_ASSERT_GE(cap_offset, sizeof(*info));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:42:37: note: expanded from macro 'VFIO_ASSERT_GE'
      42 | #define VFIO_ASSERT_GE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:272:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     272 |                 VFIO_ASSERT_LE(depth, max_depth, "Capability chain contains a cycle\n");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:40:37: note: expanded from macro 'VFIO_ASSERT_LE'
      40 | #define VFIO_ASSERT_LE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:272:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     272 |                 VFIO_ASSERT_LE(depth, max_depth, "Capability chain contains a cycle\n");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:40:37: note: expanded from macro 'VFIO_ASSERT_LE'
      40 | #define VFIO_ASSERT_LE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:287:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     287 |         VFIO_ASSERT_NOT_NULL(info);


vim +92 tools/testing/selftests/vfio/lib/iommu.c

2aca571089b2cc David Matlack 2025-11-26  86  
2aca571089b2cc David Matlack 2025-11-26  87  iova_t iommu_hva2iova(struct iommu *iommu, void *vaddr)
2aca571089b2cc David Matlack 2025-11-26  88  {
2aca571089b2cc David Matlack 2025-11-26  89  	iova_t iova;
2aca571089b2cc David Matlack 2025-11-26  90  
2aca571089b2cc David Matlack 2025-11-26  91  	iova = __iommu_hva2iova(iommu, vaddr);
2aca571089b2cc David Matlack 2025-11-26 @92  	VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into IOMMU\n", vaddr);
2aca571089b2cc David Matlack 2025-11-26  93  
2aca571089b2cc David Matlack 2025-11-26  94  	return iova;
2aca571089b2cc David Matlack 2025-11-26  95  }
2aca571089b2cc David Matlack 2025-11-26  96  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

