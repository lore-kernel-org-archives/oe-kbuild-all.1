Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794878858;
	b=wAalOfSuaEJ56ucS5TGgkUlQgrfX290YaQDR8Yn9D8Wc+mfj+u3g4vljzh2X6kIbYKWl
	 3sH/9RKjegTts3LMn8vpMoZJ2As7UEKo7kx/DnVa04HQ9l06+BFSlBx4EXhgOqzHuTAvN
	 C0K982NsGcEKORJ/Tb3yrLAaGMitL6PeVcfYNCyaq9QPiHEJy5uAwSDruBq/LjLex+Ar0
	 OYuo/ypJMZMfl9wEsHzy2lbdJc3dXtU7SERthMsAQU2f4DOfOxU1s5qZF8IFYjGtw6Wuq
	 NXrU1dkrxlrdLBn5A178hOMNCZAXJ4yJ3+90/W5TWu+LCI2dzxXZGKW8yLWlFK/WY5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878858;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:Content-Type:Content-Disposition:X-ClientProxiedBy:
	 MIME-Version:X-MS-Exchange-MessageSentRepresentingType:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=JNIPmgJhKwGrj/fbrvTUg/CGUxosrwzSTogpzZGMVM8=;
	b=E+tR7QtsD6qoyOQvdWmlfeXaouTzYTkfvhp5SL2LXOPCqpgrkeH6BAV5UsTkVrWjoSHp
	 Rw7O644FL28B0COjVExlMXlo9Sccf7/t1OeFFbz/I7Ru2wd4IBOdr+Kh7gqYuBUBZ1u0j
	 Mtc05DY/XpxN8+q+HKEqpjd06zPbKk06VuydMZpE76dd+sXBfhMbTa5ZO+a3CExDNe5hr
	 eyrJWWJW8rFipUzNsmlhHV+yHKqrMcq5CmQLW2tESx9yGTdxPUFcMqA++fwD+ZXnN/VmC
	 HRKEvtpZW7v6TTT0yBSKBhjxPrcx2Xnh5Qz0esHH2ZC5l6rYoN6qoQ/bWImHSr7HkUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GNqTg71o;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=nMU4jTrC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690FF606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 01:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GNqTg71o;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=nMU4jTrC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794878858; x=1826414858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+rWzOvvPwMiXAdA/vm5wHgJd76qDe9L0eReOIwZAuE=;
  b=GNqTg71oxeU9zGk/JExUc+peYyhQwkVg02UBj3u7HcqYWdhqhcULnsYO
   qZC7bdNFjLhUoaYWGzS1NaMlHwxYkfd8An931ziu7lte6cFPeIceb2ZM6
   S9uInn0Ca9cZpT69l00/q9sUtFuEiXcG+9+LT5UG8tIqEBJ5rJ72F9asJ
   Mgq2fJ36JNUQl/iCpzsbVd19TjqAd3Y4KHBPcakUt4Yveng39JKgkmr+2
   RFz5WCh44cwxCldDFKrPjhTkwr4DSU3TNNeo9vgZdyh7YO/MJJ4A9R6IW
   YK8mmgwa7THmV7taXR7CepOuv+F6BnOXOKcjGGdveay/fuUGWGDWq+YKM
   A==;
X-CSE-ConnectionGUID: RxZgC/YAQoSpWIYxoQvR1A==
X-CSE-MsgGUID: YDuk2M9iR0a4I1TyRabwMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3714538"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3714538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 17:27:37 -0800
X-CSE-ConnectionGUID: v6bvoVS6T4CRV9lMvssXLg==
X-CSE-MsgGUID: LZdoLLOwQ8Wynh5Pw0flng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9944255"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 17:27:37 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 17:27:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 17:27:36 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 17:27:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcp26xoAH0EBf3ePvJmxIBvmGkis4KT7LXkFwp6pGE9bsOMm7GXewNW8aTUlLbF7ULzy5tbxiQILLS3Gws3/yipTXzNbrqFCpnTCmCLaJv+pFKBnHDkOH2SMUskO+zaJ16uSU4rpW6PSfnQvpot6afxkMhIVPkdoLtkE/uZQNTBeRszZYY5WR71YSnSrdwP4hARwcoX4OetsU8ktETK81kuyePkK8ybOUirgGe3VP4dt+3OBZsUpGLXPdsfm06Dtnmkt8zYR/j7Hk8EjXYuqTIRBHzr/vnetian8V1LGY7dRwk2H7cAib6GorZK1XHccO7gPGUTtNLnjNrurK/yIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNIPmgJhKwGrj/fbrvTUg/CGUxosrwzSTogpzZGMVM8=;
 b=OY1fOtg9sF4t+Vu80qpjw3zMz9aEzJrzN9UjecGFmDwC0v/sJhVGoJLp3b0lGcoSi7EY2sgwFP/ZNI9wdYbVjf7jzQ2rffK7aGrhyVB6I5dzFxhh2rMU4daEMUOF0hfL8c24R/HvjUr8O4MexwXpUaJ7Xmzy0rNkXOYCVnskbHYI8t6nNsRwpXsmSTJVCaUZQK3Zz4kL7BMxG9lni2ywDqfbPswuwczvfmj2XjjzcLK4BFjcRumkRs40nwvD2NpgduVlyTToxIUzukco8NACchoLWgAcEbANM2KzFNTSneGUq6Yw3ZpMqT7xxWcEj4kHblF/ruq4kgPj+L4Am6wLqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNIPmgJhKwGrj/fbrvTUg/CGUxosrwzSTogpzZGMVM8=;
 b=nMU4jTrCbzFKBlg8I2gdl/D4QheyFBB15byUSf4GiDjR44UveKO2Aj+ybSRxf50441Un9hLa7e5IPDBPZVUpapZl6tkpqEOQNGJ0qgp/LvAQ93DZ37SyI13caHbt157xYeePl5PYCOK3H8ann7cp0kq9xX82v/PK9/CQmgh+zqA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 01:27:25 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 01:27:25 +0000
Date: Tue, 17 Nov 2026 09:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android17-6.18-lts 318/318] unix_listen.c:26:10:
 fatal error: kselftest_harness.h: No such file or directory
Message-ID: <avutdfsnQNxGkp7X@rli9-mobl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:195::22) To DS6PR11MB362586.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 240a5f33-73f4-42ff-0d85-08df4449ef4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: UABs6adQ5LWxac5Tf6TVIX0YdA8Ph7lyTl8vX3dXq6Kp6Mb/Ah0qwUhhUtwRNglck9H+NJ4xL3If9Ml9QCchPqwnIdAzQr1y1QybitZVqukT3edCvBMX0GcsPL0h2WVYwjMtBG5/UPv3u+s1ebogkBskqI0Wq58BtNkvfHxp7NxQyLFUuvNGPj9htcPNsexz8j3vMWKf4eRIm4rINSpCLgDTP44zVtRKUOewDeJByVNHJzp8GeftlxDfagwJYIC+29RP9wtWx6UKDAV4MwpNx97SpIqjYjsIN5rn3YiQBWXGK0Ym8FKcjrq+8PfQ1Y0zPUmpiK0foCt5ULce9wB4H6jCKvtT2gXboBPyRUaSeIK4H8ML5jgATgnndXs5Dn3J+78HYYzL5qrt49lSYKl+tk5BuxlQKtVWy2gk/9sQ5bXSlc1pHbOuWKb1WShyPQx3MCH78r8TVojaQxu6w68NUu3vA+/FVI2gMgUVZleTyz/gXhDJcoIEbktHRbuZt+nYFumqAWBUDfsBcFcH3mIAr+/UTK6Cb0PS3hF7Gb85WNytYHvbGsKG3zgAPDw+/EcxihR2Xv31pX0kMAdISW0XeNSYU5WKYjjnpbLHShnmFjM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XhDWSUP+8PgIA1BhqCcPe5/msSTN9iC5fdq7HVVCS4ZVNhErwRKdPVQEqdNQ?=
 =?us-ascii?Q?9foW8jMkNymWJmI4S74/5BsVQ4QT/D8Dxy44OGv5m7l1VcP9JbqefxfFGqr8?=
 =?us-ascii?Q?O8oE26Bp2bKdUwWn9WLaC7WHnsLUX34ZMEqnnwaWYyuJt57x9AKmSW2pvgX2?=
 =?us-ascii?Q?ybA46yxq+diqMmbcfOhozTUfuEvBY5YYOny994kHyPgJEcvsYlle+KJzTPxH?=
 =?us-ascii?Q?NdkJYGK4shIJmpbrAqZnNus1ipmjatkQdUec8F7q/8XXW0VNzhbZtIpMNQqr?=
 =?us-ascii?Q?B/wVOJiHh/Xxy6CieoYQFOttqxqnZvpGIqHvCDmTgkUyETmsl4ICgXERRzIU?=
 =?us-ascii?Q?osV8TvJTjE0Vfq5WiCiu6/XTrPmYqg4kAOpLoFC1YZt9uAkXP0fTmRg6ujey?=
 =?us-ascii?Q?TZH7SF+HoCl0bkH/thNSWltEOXnKTNGlIv3q4i7IO35pBf7GeisDlFt6QEnw?=
 =?us-ascii?Q?l1eKjqnKtgWeUhLV0SrIyp+hPNR+1w6UP1s4t0wv/lWWDrgatbAikAQXH+w7?=
 =?us-ascii?Q?Cn7bPE38ie3Ps1zBSX4wBG3CW4Jw7jwjxKvwjU/fXO8DyBKOh+aImgOcnlnC?=
 =?us-ascii?Q?RfEp/X7Drda12NZ5r+d+P8krvoCWCnLyVkrDg+JDW18YKOwOsdWxPD5QKfRu?=
 =?us-ascii?Q?cPc6BpxFjT/ViD9B+7bemV+1LkUHv/iNyTuxZrm6AMax3Q5WrfSle9DPZ0T6?=
 =?us-ascii?Q?0CV2AbcsLLrLCDd/JU4E/h4lpYMxoZLu00BWKOqYIt714DXyhavtxGK3w8Jh?=
 =?us-ascii?Q?tJsjhsNGeKDZA/AYatCx+hjqlxN6+wiZYYB8Z/cjue+UlytBrPxFgCEu8n5v?=
 =?us-ascii?Q?ekaW6UMtnL1BejJ0KPrYuqCf/evn0CsRXutUbTVU8Utld9XVVD411kAA8qgR?=
 =?us-ascii?Q?R9Q+dDjF+R4pdsq8/yJtzjQOe/z3W+6Lc0+BkctwwmZHmvhpl/5NlbxIyeyr?=
 =?us-ascii?Q?0R//tio6MZYjU45KkBa+Kammnks5ZP1ufAiZo3vRzePwxs+ulUz8hZAWZ6rH?=
 =?us-ascii?Q?MPwNch9/+pyZ7v3BuHZhNOKFfa3Jy7chhUGc/pW7KEvq+S4iiXjTo7iIenXB?=
 =?us-ascii?Q?fHyWj/62MGzqo87zv73vgBTdFZvYf/eDZDTKiRedegoYuLMAnPjaOny5UaN9?=
 =?us-ascii?Q?/6K0e5cythxZoQ64sfR+aWIN6/Q3VkAd8TCVVYepWTVi2oWspcEoxHM7pMl7?=
 =?us-ascii?Q?buftBciHVSed+/+3BxlNpLH6TIiSyC5ApbN7Um3Eaq/cp5JdobABK4vv17QK?=
 =?us-ascii?Q?IiIpUsTAc0PY30YRuuw3GSdJC41EI3mJZSbk7YN0+r7G03r0NHdsF9JL+nHl?=
 =?us-ascii?Q?FLr4+5UotBA940NVWcZJm0Ewr7wD+YOGm/OiL3iUlg6e8hk5jj0vLSMQccPB?=
 =?us-ascii?Q?DGjobyVXCo+2e678TJAJcdk/OiYcbngfia1rHAJJRgmSOOu5vp1N2IxQwbd7?=
 =?us-ascii?Q?dYzALl3BU1RJCGwCPAgH7ClE5WkXpkgVX4C9v6xnm9zLI5SURjCnHU6JpjyN?=
 =?us-ascii?Q?ErMW02BGoeL2ZEb5IX2/k37CYNuJzdI1tQkP2xGmPTOUTf9n4einfzg952Bi?=
 =?us-ascii?Q?tMke25NPCO8IrtUDgy39s6sKJYFmHmQi+uY8uZqbaUdMz3pESDBLoVFZ7Rnk?=
 =?us-ascii?Q?LFywWKgyAefLhZsGywHXWJ/Xj1Tpt+VY+QJkUMP0c9CIVXaMtGOBgmn5z388?=
 =?us-ascii?Q?WWZ99plMSOmQnSc5Gg0PxJ/W020f5H8ZigXo9CwDSgAVNlNjwIu8x8qSlCU8?=
 =?us-ascii?Q?CUwfxjb73A=3D=3D?=
X-Exchange-RoutingPolicyChecked: 5P3fdYwlWJjGIAueA32Ql8BYs+j744OQU848jxxivMpqgepKGBFEJS6ZGwfUT0wsUX9q+vyyoZjL1CrcliX7qtAbLnefnpEW+UypCM/XFRQHOFJtSAIHKOGXwd5N86OLSEwLadg4PtYAHaaq9ECeq7Ovl7o9bemZUR0bEu9mwIZQaAqQ+LcHMczEtX/9/pO+ayKzqwE8E3sXNMDwohnLWjYTYK51R4yw6RuKjaPHLEuuoeNlUnn2Eqh6nXHeGS05g2Pl/PHLtgvMiomiIRvoIplpsvZ07qEFk3gqKSWqb1FuGlQ85D/7fetX5tea+eH56rOD5URx6I6Zi67NC8makQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 240a5f33-73f4-42ff-0d85-08df4449ef4b
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 01:27:25.1802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YidBoJw3DQKWLyskh4KrN/HXJ3BsM+b01LPLrTNmurENaeQkbqeUxXbSA8lpH1xNumi3U9+zXDe5UVz3ie0TlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
X-OriginatorOrg: intel.com

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   c29a11a6da74fe6ffbc7bc4bbcb21f2e579e814d
commit: 814c5b1590037330381a4ae83aaf40c0986ba2bb [318/318] selftests/net/af_unix: test listen() rejects wrong socket states
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261116/202611162350.vLBOZfbI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162350.vLBOZfbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611162350.vLBOZfbI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> unix_listen.c:26:10: fatal error: kselftest_harness.h: No such file or directory
      26 | #include "kselftest_harness.h"
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

