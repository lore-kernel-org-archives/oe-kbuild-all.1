Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794016246;
	b=r0ciba9Kz8uZXKeXsA2jiHVGn7LkfMDzv23f+gcQsTHBu1DeKBEe3HJ7jarZJunEJLth
	 oJ/SSMn5rUhsY5zKKUdFaNxD7uv6CpoNWi5OT8hx81wLlGOkvmb0UgppPA//IkZpflADJ
	 jVYV7H8KsKoIBX3oXffiT1sDWQZ9Gv0ALFSoqUmom5xc9lcBwHor/lIeqiQgDxkv42jMv
	 ePHNSgVWEIaIy3WTKjwleRuNlggLZwsuITV+3bMIUkS3lRuYF4w1lxJNSm+JCrA02dvKL
	 0n1A0dkBYrNiS5EJdnlFf2Q1zUoIPKsUQjF5gi2T2RIOs/Ni6zc1Szfgqcpn+7AXDfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794016246;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=5ovPt7x0EYj4Otri4iBoCxlqT4sfZIwGBqX/NKK9We0=;
	b=rONAxw6BWbIHYCQDkQX9SQmeDHN7YQmDtQyGg4zo/UctCJuJw7cX5W/7RkOpiYJ6AK6m
	 xSIluYcAUOshMtecCOXe7P6kA5B5mnZAtUgALR/8vfJyLXxbrPhnCNCu6PU/gP8v7AcoX
	 tfrbFLHFh0ZaxJkIuGFYDIyTXXFw9PdSFe59vzlx0KG6CU0xCbxDjn9mELSBiMzWuMhTL
	 fvUuIUF19lwUtzDfYcvq6ntMHPYI3Qm43F8BsZNjHNib+u0Ct8HM6aq9kFYW88ovGR9aH
	 kO5YYWrhDgE35T5D390K+JLt2hl9HZOvmhbyI7snkxqSXVCr0wwyZsjri2UhAn/JAMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RQCtg5py;
	arc=fail smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D8606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 01:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D17D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RQCtg5py
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794016245; x=1825552245;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GxFwivnpMuMNNlkmXrctbe1nfC1dldrBtflw1UwPZI4=;
  b=RQCtg5pylJMo+xRQcpndK9bTx5YRtRERhz7/3AEcy+Ahr8NEyHGfIXSY
   qHMOfzCJ2VPOZZ2c5rufcQztU4nzFDy9WWcNYmq/ZMOrj5Wzy3lQYIasq
   RDNVzKDRvUY+4h7HadU13xi0BUtHpWO7z2zmIe5+S61zB13ZOuPL7dEOM
   P9BvfrdadQKuC9N/4yBnUi/A6hMCu12m48RI5lIEyEJ52YFKThP1SVN2/
   guOHfkgEi8aLsO4l0nqWE6QSQAl/mcE9wRuvFw1mh4VXhV955kCjf0W6s
   9nA6wEI+I26FBPEUNsZfCbayuOrYO9r+r8xq6UKVc5xrD2ZKXW+TKlw4y
   A==;
X-CSE-ConnectionGUID: p6e5qzCyQkSfMle2gDKv8Q==
X-CSE-MsgGUID: +JYDoJPhQSSEWW0YIxQfIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2735255"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2735255"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 17:50:44 -0800
X-CSE-ConnectionGUID: H8o2b0QiT1yFJO85YE+/JA==
X-CSE-MsgGUID: isWbCu6rQNSBBPalEIxgCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="9188167"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 17:50:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 17:50:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 17:50:43 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 17:50:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/KNU7JZTQz5XSXp/iCrpUIki4gVV3TUz1Uc0dbEDD9ej1QZzwfrUiQnVu7pmCDoLATifTimypbJRpDLDGPvRzYRTDza30iyKv9AXFqX+XTNqLGmo89PYGhQVsxtDGKMASCem6Dfr5T6mh/xRcAJEKQKVdZC5u2UX+jI0JmUlwz7Lbj+aCr1WrYeu2/gwjf5p3qGzfm/hc7IceKQSnsWeV/EvDd3d3/JC+s1SqPxUx4VEoIqWbXTxutEgggIlQLROlggqWzMZL8DXyf4kvYFSQX4fXClZHHbV3pYX4dfxKmPsnloVSe7ooyUYLK3ZjJ+tTp69uRBpVMbXHINh8S5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ovPt7x0EYj4Otri4iBoCxlqT4sfZIwGBqX/NKK9We0=;
 b=YByuIORsdiGYwpeo8G3wf5FOf04ejDTNHmaRBJQqxQUqfepKPZq23U2WY11KH1uVFuPxi4/BsTR7UyYaZDCgZCkfyCtImZ/4eMA6/8vr6VnFnXtdQvfZ0RHNz6HH+0NOLOdKufPdSNhttwDNhhOBS7Is2n1989c9eLcnuRD7PZ9xiG6Uuk8+fAZedcKSO7Poj00p9nnYUDs6PIeoa+CWhrlbi9LS5pcFCSOCTm5WvvGjbK8cXhiSuk7oYGoyriRKnLzbN9VebXSh3vFptzg5/zZQGv605EzrdZ3nwZXSJ4tWe4R6UBA8W2FzRKHWcrrOsb3lHBKVm4qACB2EWHk4/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by CH3PR11MB8137.namprd11.prod.outlook.com (2603:10b6:610:15c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 01:50:41 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 01:50:41 +0000
Date: Sat, 7 Nov 2026 09:50:32 +0800
From: Philip Li <philip.li@intel.com>
To: Qu Wenruo <wqu@suse.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "David
 Sterba" <dsterba@suse.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: Re: [linux-next:master 1261/4145] {standard input}:61662: Error:
 operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r27,r28,-1'
Message-ID: <au6D6DqGl0Scz1zz@rli9-mobl>
References: <202611061612.twOQJVLd-lkp@intel.com>
 <8523ef0e-426e-4be4-8061-27f69c65f589@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8523ef0e-426e-4be4-8061-27f69c65f589@suse.com>
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To DS6PR11MB362586.namprd11.prod.outlook.com
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|CH3PR11MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 59149c57-ee99-48fd-db38-08df3c718796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: F1Pp2WA/g1E+gjPUIGpVwJ0evvImZCUB4H9DVPlPYu+Eck3s3wB5caMiqu8Z4Cvk6YljBSosAxEWuisO0pLTP3FhUrbMsv7UXYDDJq5qRGPRbvPwsrUMFgkkq6lOjaAkmrD+Sd8xoupVESiRhUX8QyeDHc7tOw7yjN4F4QelA7AdkUMXK8tt2SsbDU/KxCBj02uz6MJWgoDIQZwWU7ppzw6o99WWIGfFCTnWcLTl0oLK5Bl55Moz7SAuVpMMKzwMy/XhiRD9dFl5ii/ueo4+TNpWfaK+dOe5xqRfyYkHxBbRpScfnHQXGo+ZJLQVZIJT171p09ubf4kjIJYWPbco7JpSjFPnZ7jF08YPfmAjxreJz7p0ruoy5VozOkumrvwFYkbRphfOsdTQrkSufXLCI7PZsRDiqOqShrwSyurNeMKkNk9Rm0x6PaZRaTDws0/rRJD6IecW01ez2u2kvPlNvAsDiuzv/+lszrWQCEFYoL+6h3wmJ/E4CAjI+IRiVQMacP7Hi1aFkR6t9Pwhzyilm6QMpToI8fTlJ29Dpy9/Yqy3bKRp9RcyptR0RckffpOZ9ZicY2b42y5m3m+X4T+/hgBQ4JcFDibgkpJfpyxKB5la/RpCh9Z4qmGS18SPHCK2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFpHTzNaM01WZGR4Z0lWUVVkSkJPVHY2NVdNTlgxQjBxZmlVZWVnVXJkMGFj?=
 =?utf-8?B?NXVndS9xaDdzV1ZKeHBmeFFiOHVOQVMyQm9lWGFMVHJ6eFhqazlLQ2wwM3Ru?=
 =?utf-8?B?Ums3SHNsVEc3MExMUHIxQ3VuSmJXT1R4Q3VxZG04MTB3djQzemp5bnVRMkJZ?=
 =?utf-8?B?eXl3UzhJYnk0eHJDbm5SOXI3dUt3c1VFVCtSdE4xeVQ4eGdXSjBQNVdYa3Ja?=
 =?utf-8?B?bnlVRzRyN0VsWDZXV0lWdytockwxM2xCYktrWHQxSXdQRDk4MUNydEMwSThK?=
 =?utf-8?B?NEF5TjgwaFdXMVYxUzFtVVNiR2V2S0svNHB2dCtIU2s5dkFrcmtMWm05cEw1?=
 =?utf-8?B?YkVEZHppVDNqQXo0c0RaYjdrdlhxcUR4OXVuTmoyKzh4YW1QRW42akdGV2tx?=
 =?utf-8?B?TDhpaHlTUlBlc3FJTDZjajRHRGJRditZMmdWdmRXYndieUZPTzdZRFdWU3FG?=
 =?utf-8?B?TmdpYnJDLzFBazFNN05WOXNUd0NYTXBwVUxISUtLRGlLUnFYb0JlZzB6dFJE?=
 =?utf-8?B?VENUOXJhdENhYTVZQWxRNDJ3UWcwYzhUbkNoWWNwNHVnTzNwMUhjNU1wSXRC?=
 =?utf-8?B?T2dBWHBGU3RLSzlpWUlMUzdyUWFGaHpoRWpEc012VU94SE4xQUJldHNGY1NG?=
 =?utf-8?B?YWhxWVdmQmJqbE00THJ1eEg3RVRNK1hzY0I3ZkNURVRCUFZNVW9NWkdJRTZp?=
 =?utf-8?B?MU9nWGt4Q0xXZFVTVjR1Z1VkUVZlZzBXY0RiMDJralpDN0p2VTJjOTh2Sks5?=
 =?utf-8?B?QjV6Q1NERWN3QzU5d2R4dmdhRy9hRjlVTHpUWW8wZmQ2YnlRaWhwRzRzNk1x?=
 =?utf-8?B?dmZrUFk3K2g0VFB6S0xhc1JlbGdmWEpqNHpvWk80dHN0UkRkN2xRQU5hQUc4?=
 =?utf-8?B?NzUrdHAyMjhUSENmVm1mR25DNE5JTDBHdWZ0VXB1QjMyeFAxMkl3VjJ4blRn?=
 =?utf-8?B?ZFZQZlZTR0tRYWdLOXlQaFFENnRQdCt1OXhMd0hlamJqTm4rdnczMy9PUjFK?=
 =?utf-8?B?VWxZMkt6Sjg3b1NHOXFsYzh1UXZJQ01rK3NvN0ZCZWVMYUxLYk5VSkFoUVF3?=
 =?utf-8?B?a0dpcFlSMkU2OU5ZbTRYNnZjY0g1a1Z0RzI5ODNGaFZkM1NDRG1reWsvZ2h5?=
 =?utf-8?B?MEdzakRXd3dzZkc2dm5mS2tvT0xBQjBVTjV0dUc2enFwb1VaZSszbXhNTGZt?=
 =?utf-8?B?UWN0R2E2UUxrVWFJeXNvME9jMFoxS1dlZHpkV2hXWG9hNHROL21QT2lVdFha?=
 =?utf-8?B?cDN5TkFkRGpsQXgxMjQ3V1prQmkvL1Jwemo4ZFRwTUNSMUxydG1EZUJRVUNG?=
 =?utf-8?B?YmpCT3YzUzhkNHhQaGx1RVlSUFFRRm8yRmVpZmtYekppS3NIcENGRm1wL3Zs?=
 =?utf-8?B?VTE2RTRydVhBUlhWTUpDRGRDYTFCMjZiMUhqWkFvSWFhYnNQTzN0RHhxRDFK?=
 =?utf-8?B?TVNMNEZsSk5RN1pzRjl2RDJTOGRJMUd1S0xUOE0vbFVwTHQybXlDVDJKcXFK?=
 =?utf-8?B?Ky9BT1JSbWxVemIyU1dsQ3k3ajc2SmFtRnRUUG40SU1nZjBlNW9ERUx1aktx?=
 =?utf-8?B?Z0V2MVkwWFh2Tm51cGJxbG51NU1Heitob0lEb3B4aFFmSXp5MVQrVjJmN1Fp?=
 =?utf-8?B?V3BPcGFNM29zVFU2WVd0cGQ2T0VpaGNnajFtK0xaanpmOTR5aUVZRzgydmFO?=
 =?utf-8?B?QUhQQXFINThPR000Qk1oRitGY0ZkSDFJUjQ1aS9Hbi8zMmN2aUs5dnlFUzBB?=
 =?utf-8?B?NlhBam8xNW4rMVBlSml1VWhCbEViMGVSTWoyeUhqZ1JZRERMMEI4RVl2akN5?=
 =?utf-8?B?UDZ2ekxUUEkreHByV0JRbDV1OTcvNytCY2RlZU9EaFB5a0tCWmljL2N5V2xH?=
 =?utf-8?B?OGcvYlhrWWdxRDRqNytOaDhDOEZSR3NzNlNWZzMxSHBhSXRnZ3lQdGtLQ2Mw?=
 =?utf-8?B?Q0FpN2k5bHNrVHY1VERvL1l2TjVZbG1pUXBaSXZuTlRTaUFCZnlaVUJ0cFZV?=
 =?utf-8?B?K1B0TDRqTFJ4eENaYnRqeUZUNFpTNTlSVWppQVZEQUc1SnArUXRWbFRHbHdJ?=
 =?utf-8?B?SzJQckRmYjdhdSs2SUxOREczd2IxbVBGRmlwblhSbkszaU4rajZHYTBITmtR?=
 =?utf-8?B?QXVPKzNrbWs1dmsrZDZ4V3BQcHN4aEhTbDNXUi9DSjJmT3RxZUFQYzJZc1Fy?=
 =?utf-8?B?QWtMZTRPSG1FU1VJYXpvSi9lRFVDRjlNWHpQcDNCekcvS1VVV3NTQndTTy9l?=
 =?utf-8?B?WXZTbm9qTkplUEtCZTVOOU9aUG5mRE9zODJBbU9XdFUwZkRKZExxMEdjNERp?=
 =?utf-8?B?WG1TNUk2K3NRdWc1M1JQVlZybjFQSFBhemNyalNlbUk3Q3pPb1BzZz09?=
X-Exchange-RoutingPolicyChecked: l1v2nk1rs72xqT9I0bYBSBj4N9+GF7cBHK2d3tWN7LSKUyWfaMQmRK8SfeohgGv9a+rHkn5cf7MtQck1vX/RTlQge8LR4xxGsdBFxgY1yLoOctTQhmN5gqGh7VAxhdJm7/Hn38wiy/D2pg6uQidI72Xfr+RRvQPopW0mN8JDG3nOhtcqC//HR0HQYFrT5q4zRPntWeuFGV2lq/TAXUu8S429AGhPr77xnz3TcvR4AUlMDJFa4wyQLVJhmgyrsmJWy66QQSsIS3VHCVQoCVfeAuxczJiM9LePTyC4XRk74FtBVZj3fjr7ytGh+wfpMFZ4GAADkwZGWt8ywFSojSgbsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59149c57-ee99-48fd-db38-08df3c718796
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 01:50:41.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLAXju4Phj81r/3ZyLbwZPkYQrhPM/qXosLPwzhvaOggQCgJO2vFnTYSfjrhh/P5DWEKNZw8s1OC/WA6vjVopw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8137
X-OriginatorOrg: intel.com

On Sat, Nov 07, 2026 at 07:35:09AM +1030, Qu Wenruo wrote:
> 
> 
> 在 2026/11/7 01:43, kernel test robot 写道:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> > commit: 8a13fc366acd07c58a72b0eaee2c1e38f9280cee [1261/4145] btrfs: convert volumes.c and block-group.c to use map->stripe_len
> > config: openrisc-randconfig-r2109-20261106 (https://download.01.org/0day-ci/archive/20261106/202611061612.twOQJVLd-lkp@intel.com/config)
> > compiler: or1k-linux-gcc (GCC) 9.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061612.twOQJVLd-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202611061612.twOQJVLd-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     {standard input}: Assembler messages:
> > > > {standard input}:61662: Error: operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r27,r28,-1'
> 
> Not an expert on compiler nor openrisc, but it looks like it's some special
> path on ilog2(), which is mostly fls() - 1.
> Most architectures has dedicated fls() instructions, but for openrisc it can
> falls back to generic_fls(), and it can return 0 if the parameter is 0.
> 
> This fallback path results -1, leading to the above warning.
> 
> But the problem is, the stripe_len parameter is already verified by
> tree-checker at read time, any value not 64KiB is already rejected.
> 
> So the fallback path should never be reached.
> 
> To me, this looks like a false alert.

Thanks for the info, I will configure the bot to avoid reporting this commit again. Sorry
about the false positive.

> 
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
