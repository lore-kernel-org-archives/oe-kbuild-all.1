Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9421D7995
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 01:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764896416; cv=fail; b=qqNbfoeahR9Q788T7VkA7t/76oAvyoy4HKSCQNVq5Vx71HaTR2fRuaLstKXljlLKay0aY5FHn421qc5QZFLE62QVa4Frg43GgFRFgkWgobGvvSEtqnwhhkkm1ZEPEPclxjgUFR+PwO2w70AdwH1wabONslLFdN+wIQD9wNW9kj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764896416; c=relaxed/simple;
	bh=wmIraxBUJJSLr1Bia67mzUfqn2DfUBL5z7rBdtUMrVU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OTOz14+S1xtuwVjdGpkrKyAuO2uumVsdaTZ94fuu/YHTXPPxsTtu4iLdYpMSXj7N3BTg4pdEpxAmtKGnKs98/zXbaWSQUtc7tvjp3HtHTmIJ0X9iQkZTPWq0o/V+CQSiIVSfiupsuIQf007dBgxb3K9ExqZnniXWeugn/tL71QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2+u3877; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2+u3877"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764896415; x=1796432415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wmIraxBUJJSLr1Bia67mzUfqn2DfUBL5z7rBdtUMrVU=;
  b=b2+u3877DOKDq/R2IFXaSnO483L+wySkyG0S/IlVSMWv1ZnBiklZaD7I
   z2Y3A7c0LMNzGLvscW+MXhHoh+XAULnCNjhkUAYxOA8PEYGz0G1SoXs3e
   N68tfQirkEem/ljJ26/L/ZB8grfFtE6+UNVt205BNUBp8ckIgBbig7bKn
   LrTFbMzPZ47DJxrXIvBiL2qy6SDmXziCWeNn7zuOXQ3PAJpep69K0LHaP
   ur9o4yR8BFk2Ot3/bCHdWHPihZLWGe0t28p+qmq4eO7KtO+zEfEjwNBkG
   oOwbmiCy79cTabrZ+tJjV2nqeYrd1E5GIWvcH6S2Pw/UhEy++OX8W/ET7
   Q==;
X-CSE-ConnectionGUID: 9gJ6t7uzRPa7O6l8jiAC9A==
X-CSE-MsgGUID: vRCg2v80SL6kqqCtlxPx9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="54479058"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="54479058"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 17:00:14 -0800
X-CSE-ConnectionGUID: 4prRpGAvSmadI+wst3DrCQ==
X-CSE-MsgGUID: 6ciTC8VWQAezWTGkbQqQSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="200100742"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 17:00:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 17:00:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 17:00:13 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 17:00:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYfo7M6s02MNoh8HBL0FeVkQtXW/Log+UCQ+EEh25Nxfvf5N6Q9eV31mE7to0dC6JTZBpbWH5yEgSXtqgUTUTD+rd9XsfC+NJPaFpdahFoYl8ETa1zbffYWOkUs8VneI0XpF93MmQK5Jeia7oZpUiGjWqU5fMgjL5gdHchSRBLOgsyeVP+QXUApTclJncJKZi/ptIOB30sqe2Ypv9nE2o2i00avXLtC9+tVDQzrLYpzereQi1OOBDTne7r4YdpTkRfeCODJ8XyuVIkRJ+MLHPXe0zVYT2uZpgbmMbGvFFMRZf1XrBnOGK4zv0jSI2nlfXmslXiywj+DGPx60HtAlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsYkMcFD2oZCpyNeoop6qu4R+flwgNKJ/UxafyZr/mc=;
 b=ZHAnHQypOu1B3X/U/VVqwThTb9IJdgERgV7cecCdWYyOzLwU68x1QCBvr2n7MU3eFD8/hyBlXoafSpjsDDITRB9zKLGtGczE2OO0G/rk0cr6ACH9CSwgHgd6ZPkIFA5nLCxF8bjq/ObZjFVHedg4peUsF7wMo+qhvX6xGkYmF8LWnz4YiYdEfrBlsG4i5e3uaG7td4IqOZd+El3PxH477oZOZ7lj82tUa2HBCEYUOF1zOfge67hb7A1VtCxwurBCKjehEg3AMR/dnTx6J37uLbvRjq5RbA0sL3Q4NU4YKgqBnZAvLKPLb2BhvOxjnoiSGoONU4ewa6CDI+bzMLX/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH8PR11MB9460.namprd11.prod.outlook.com (2603:10b6:610:2be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 01:00:11 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 01:00:11 +0000
Date: Fri, 5 Dec 2025 09:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [thomas-weissschuh:b4/uapi-nostdinc 3/3]
 usr/include/linux/string.h:7:10: error: 'string.h' file not found with
 <angled> include; use "quotes" instead
Message-ID: <aTIuk3AXM+37dLCZ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CH8PR11MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: dce7c4fa-c239-4fdc-cb3a-08de3399a437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?laczh1RFAmdd3CI0r/30fP2SPIF7QShkHVYKvwpio+7/5l5gyVacF+cLkstQ?=
 =?us-ascii?Q?xex1JWIIxvkJ/7gt9r17iUo2Jfga09f2ahwLJNPQJdFVpORpVEBU4oIxF6Po?=
 =?us-ascii?Q?Htnma35QKrA19ESz2uImoBIsG9brGLc8nc1fV1PNazOgKEQJhdNttr2C6zgP?=
 =?us-ascii?Q?tM0ITrqdL6KydCP90Dj7SAle14+c7G3bS3Q2+ygDjdZU1xnt6HsLEVTiW+/8?=
 =?us-ascii?Q?2p/Nc0Pc0uMyl4hUxxOT3KuoXpahzoA9Ur/CAAsp8NWPyQ3bKi7xLMLw3mzg?=
 =?us-ascii?Q?KSHC0HZuQgl6sSTorKs7vq4F4tCOjyqHPsEwBGhPdwM5KapA9KP56OZmqqYT?=
 =?us-ascii?Q?bhq3vSB5cinbgO2QPENHJ6DpLabRR7Y+i9UpOwG0sOH0pCFIt653jzc8LnRU?=
 =?us-ascii?Q?nxumdDPACrXKyWIdZ0O44uQ9sD5vy6TCIAKkMwWOUzSl79QSL9WNoiuY8nPG?=
 =?us-ascii?Q?kYwNf6og6OLw/3IjWJSbEWonZbe3syNh6/xP+QAV6Z6kPOYmmdiP7V/L1Qe5?=
 =?us-ascii?Q?UraESAwSnH7wcAnxn1soAAAYv0V0jCT1Yuwt615jSuaqjjOQ31c8PfnkdQQt?=
 =?us-ascii?Q?g8LDP8XbxHPFqCpXkvPotOOEQSgJW/y4pm25zPs+VSqFVmCDldbIUG3ttnby?=
 =?us-ascii?Q?mYH+oggPOspLoDZ2v6+DaMuLO3NIZtiN0BxrHJtDRt0SLlas2ZggWiqQGr6H?=
 =?us-ascii?Q?67uFxSalwgJknMAc0lUrw+/dO+tbw4067bkH6xyZvGz2JrJrZEAOGCC/Dz6i?=
 =?us-ascii?Q?1x2TioUtXZ71IG3mxZxm4fXGRnhb3pYM/emz28fTN6YoUJOq8nSdxdXGc/22?=
 =?us-ascii?Q?lyQdzU/bQ5UCiJST/i1hRxrQPe8BFpBQJswI/jrag8E6EzWgRl5Rk55gQpcZ?=
 =?us-ascii?Q?PZGy+DWyNIlEvXyGQyRPpU63hqX2YjsmIc34AE7+deRPoqwrmwLLKi8k7A9i?=
 =?us-ascii?Q?C/ce1eyaaCEuVdhL7AOG1gxC5MTOrKvJ5+pw3UCykQwMZNKavR/L0uWwh/+z?=
 =?us-ascii?Q?jSZfvEbUVMcabbtgbJrT9E2pCvpfCjX4pJqY5yHLTmh5ByNbiCvyMflmN9xg?=
 =?us-ascii?Q?da/LiyLFEFqkBx6vhpSDoblTWzszMbfSCoLF0LwLXVrEoIwj3zfsRm8S+NDs?=
 =?us-ascii?Q?Xl1P41RAQpCqDEqcgDUM+X3+4WycY5vZuCxFpwkgzRa+yWGU3kERJFo8S6bx?=
 =?us-ascii?Q?J6rWsN6jklAJ0qR+Q5RONb0ygodWxOI4CXk3Mp9W9wEBbaJiEPQNi31vX/BT?=
 =?us-ascii?Q?K7x517D0RPXqmjfMJhPf9htKn/ckAGM5LpP4RaEP+8zHM5MQWpanGko+CiyV?=
 =?us-ascii?Q?Wvtdu8U2x5clT3RErKPVbBQi7iee9k/fqLB0EMRM8yNkq/dFuDTChhg+IRSj?=
 =?us-ascii?Q?+Srgj67t7dEZ1XPi6/Y9eeaU2cb/WzuJJIP35Bu2UK0HM5ZpSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JE/AyPVq/xfvrKicrmlk+hDbbz8ZUTLY8OEZREKmzUDyAtNjA5L/bYmFIvp/?=
 =?us-ascii?Q?TuTMWpGhWc1pubOhPmkHptN3wi/Hcp0F3k82cUu1sY5r/pzsg66R8XNbXrkY?=
 =?us-ascii?Q?sycy9B7cLnYwvh7xueQHejIhA2L80VY7CoVZbjh8rU3nqhxZPT+ZHiBqfqjH?=
 =?us-ascii?Q?A64gGPshQJE52gg3yb9NTErqoI5Y/ehzxb/FW3Wpx66CEj1xTl6+Rh4EaG44?=
 =?us-ascii?Q?X9bPDe1sedL9q2dJOiA5KtjLxlHw4tTN3vf/rzTOxKoYvh2N0CAmYcEoU6ej?=
 =?us-ascii?Q?VSv1/2VLlvVTYy5wDLaUph+OjhuYbNNxKRWkiCOWlr6lm54hXDU2YxslCDyP?=
 =?us-ascii?Q?MRCPk9ThKywWKQLIbpeLu0bmY2QH8Opx1k1PRz3vqplCQ1n+zYq0H7T829jW?=
 =?us-ascii?Q?9L4KlojQT+FKP6g0I+i09Gj6rJ1xT1vjrDl8to/7kY9TkHtWrH03erDWjF0Q?=
 =?us-ascii?Q?YObgLsgATI7YZj0CjxRs82eSXuu8GgGXSVAclneIlwBBhR5mEUxLWT2kgx4p?=
 =?us-ascii?Q?rJmy2sKS6bheqpvThP8v94BHj7yqxJt0QT4y+unyBCHw8vXsD3n/guhkIhRo?=
 =?us-ascii?Q?6HWh0HUshGA+EprACoR5fml4ll+Cuz6X816M2GE9d05lq1jIvOqrFwZrfSIi?=
 =?us-ascii?Q?OcGB/c2uSn6hVbZWKnEb6sReSBhzP13vpJgLhg5sTAw8kl7DVsY0xore3aCl?=
 =?us-ascii?Q?xci0EzzPgXXfL/yWUz70FPMUAERClSipnXZHE5NqJTwzzNobBPPJ5FmS3njN?=
 =?us-ascii?Q?6Me78jTYtuE4Ffa6jPx0JnSwJG0/+MXZIFzOuE2l/MrSIBhgjsNIQLRJ4V1H?=
 =?us-ascii?Q?wyNxpke3RCWcpNLm5G1ooNb7ny7SU6kC8OkX22jz9cilAzCFGtidPhu9sXzb?=
 =?us-ascii?Q?x98Q6GzQ9H4FKrVtxtgBPtDiNNqlKnkjuE0Q5zoZXyT8uaC89knq8h4UsMXF?=
 =?us-ascii?Q?d7UIPak57odezukGRWXYDXvJzI6bU/0vpOPf4ihHrU6dblyVJ+vxK2NAIrPB?=
 =?us-ascii?Q?Y1mNm1uXDJoEM2WmP1M6BUzF3Yrgzrf8Hn6YG9ZD/a7dWsdrkSw3djvId22r?=
 =?us-ascii?Q?CuJLzTRKnAss85CRX5xZmfUSOYZ3MkPxU/bOJTT6W12irCXkQeWXY5xXJiCx?=
 =?us-ascii?Q?MOFxqD/TGO4qrIokHaWSEw1v1n8wZAssYjBZCODw1UG96kV96FWTnwaQ2g9s?=
 =?us-ascii?Q?19KCQEY5ssfrD/m7apc3toGi5hrGZBAYL7FaSCmvRtuyu9C+AQrLWY/6Iqq5?=
 =?us-ascii?Q?fGbvRQVbbWiHz/xEMmIQWlSU5SGVDOm7catsj1YidKxdK2F2k2YRzDetLmRs?=
 =?us-ascii?Q?PmCBkG7wQCZOUdkGEdZAP29OeMThDaq8sCK9aBiqRWHaSq9V8GtPcuv28ORO?=
 =?us-ascii?Q?D5apP5nSattXKHgeE2M1L9HTCbWDe7WHBiRRnxZ6rfwx66y+G9six7nh5uAj?=
 =?us-ascii?Q?JhBKgZCQzY5DaRW1C7+rv8sRXry5jzZnlGvO+YjiUL7A67+AkbncRVYLKLD/?=
 =?us-ascii?Q?zUBMf0uZtWIMtJERyUtVjblKCWzr4K5UvV2D3/kMb0c28oiJGBlOSkkpaYS6?=
 =?us-ascii?Q?EIpSz+xG4eHAqbvSzcYPa1TCUaFa3aFlog6mD3wU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dce7c4fa-c239-4fdc-cb3a-08de3399a437
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 01:00:11.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3atTKf5KCzeuaVtJBF4UbDO95FCtlzO0XKjF+s+TvOtL7aFI7hkOe5Jv82kcpc1H2FYyT9T267iI07JdttTLIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9460
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-nostdinc
head:   31a040462afbf415cb6ae55dab41da03fba9aa38
commit: 31a040462afbf415cb6ae55dab41da03fba9aa38 [3/3] kbuild: uapi: validate that headers do not use libc
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: s390-randconfig-r072-20251204 (https://download.01.org/0day-ci/archive/20251205/202512050334.avQXT92k-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050334.avQXT92k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512050334.avQXT92k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/asm/chsc.h:14:
   In file included from usr/include/asm/chpid.h:10:
>> usr/include/linux/string.h:7:10: error: 'string.h' file not found with <angled> include; use "quotes" instead
       7 | #include <string.h>
         |          ^~~~~~~~~~
         |          "string.h"
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

