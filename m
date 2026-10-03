Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020203164D6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038317; cv=fail; b=nU+jo+C21XcqcB39Viu4CrGuRENxl7CRiZ72zGaz48rFWmZFuEOMyypRTNrS+jUghevUsBHqZ82VqpUHnWotLa5u4/6IsuiW9xw8gKM/ApDZi+fPNvOKXSssKDJzxkWijp6BOQ9jWQEAUyMBYEtYORpyaCyth9ZhsPadii7L2zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038317; c=relaxed/simple;
	bh=zN9m/Y3yNvvJcBdogmzvMjOVAJyS0vdmRBcpcHJJiFU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=H/EbCylH6LXRlwR5hdZanLkJ3/DLv3jgHkcKJKKt0Isqo7CnFKkMIPLHEtmwIMgMZ2GhlzO4wrSmJKGKpPgcsyMRiUINEIbPyamlhc3eClZmKfnxMn61triYgoWS5PzOZukQzYq8SuyYyL/1QZJt/MSjxs3hpjG3V/XY4pqpEBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btCHNDcE; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btCHNDcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038316; x=1822574316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zN9m/Y3yNvvJcBdogmzvMjOVAJyS0vdmRBcpcHJJiFU=;
  b=btCHNDcEgTMF+6o6xU8OjqvaeCzAHzdmNLySlWQZq1RASaylfvHD58WL
   kwzHOXYrVjoyUsYsizQF9foTX1rwpo3Fx4LjKfXOJPkSktarJ43pBR7nz
   HvpGNQGxZUDXLn6IqheykgghCkzbbjR44VPJZPOLActBZO47cdXcrO+b3
   Oiczf/LXRhiKyu46LNZ5pxALw7UbaNJ8puymzOL8D+Yz/ChbS5kcwDpBd
   EcYY//2+FGafuVXOkkS6KDvFfVcs6GIs8tW5/E6CDCcb2YOudJt1YAjhd
   YtAOXxEblVf1YFRVsqL4AQW0cKHnAyjs+KHNzAjvQwIlSWeWjRiKtFKYq
   Q==;
X-CSE-ConnectionGUID: bNZQgxrFQTG323koS9RNGQ==
X-CSE-MsgGUID: 3TfAUuzXQsmJ4NIqAZ90PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="79336554"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="79336554"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:38:35 -0700
X-CSE-ConnectionGUID: CbUOHhQySH+WQNAhYcUFGw==
X-CSE-MsgGUID: Gg9a06qUT2iuJeDvrsGltQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276530646"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:38:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:38:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:38:34 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dxdc9RjQaBg7+xnJf02GIN6ZfaAXxHRU3BdQho/MMtOSXa8hl+uFg4eUiX0eySaOfY61r0E+au1XML9LW04VKnItPYHSNyDYRQCDMmUP//GBFpphdXCiATExCyeXewI+upv6Q5lwvaHXw1Ng0Lexv7gMBqQs8Jaotzta097XUVLglcatwak5v3K7DRL7KGgUdQQ0/eBi6ojJTZuZOru9f3B+7AyBUoi/e+seezUJUnSXIHoNOMtxMsIWSq+l2lcS6TPlmLiJfWihpYZMi/hWwOZ/AfltLiWQDawuSfwyNv05lIpNb0h8uF2J19KnzUVfKqRP8SFq9bSWyKg2++1t/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJcTe3rotOrObDu0S0cNfmQ1pVjkpomeoidJmZL4nXQ=;
 b=s7PRigW/4oiK0LIhpBznZqNqZkFc53cxMYPlwsJIymSsav4Ww1Meu4n/prPrvOktZFEQm7mUkq1MAeYPlJiSjmW+D2cxYldVBlbKhTNxMETtSpaDYW9ZXqToWfJbzj2ViPK8ECuoTVxJdDz/WmGz4HJrfWlAywmUSF/IwCgCVB77tYDSIDRKpqkZro/jQv/vBzS83YDoQFm2iRZIPn4fE4qhKbFeKUvhrX8IL4MAeVh3NY5L+9DpmwPhNLiIrtAZ24P5E2/z3TFpQJx//LOKKhGQXBIW1q83L7q1dnYSwKwVM2g7xPzn4Dr3r54naENgPzcYuG/+1kW7qCO1pCBGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Sat, 3 Oct
 2026 14:38:31 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:38:31 +0000
Date: Sat, 3 Oct 2026 22:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sander Speetjens <sander.speetjens@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: Warning: drivers/rtc/rtc-raspberrypi.c:18 expecting prototype for
 rtc(). Prototype was for RTC_TIME() instead
Message-ID: <asETYJIaoKOf9/Sw@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH7PR17CA0017.namprd17.prod.outlook.com
 (2603:10b6:510:324::13) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 022c827d-0edf-4059-c453-08df215bfef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: hSzXK7bwK8OrsjmuqQBgd5h1Hu8Zf2i6RsfO2CXPapq3jDwAHmXH/nGtzeBQwXs+jDjNGlTfsl1eSJ96yn13BQuvZB1bIPrv8Zn0jgRncezNpf+NpQ3926P9xGLeMqU62uHsDuItFcOK9dlQjR/t9MAUMe25MJmOPc3gtahNo+pH7xRF7swVR5BTAk8UUIlJf2BXY2ZXluWbvVixiowRjVr9BxxV+QRD0xjf/MzuULddVEKYGUZiqpttodcWyn05gI+dbbGrrtec1x35+pfQPaUsrERx6hp2HVx3StDudUUrypFcqy48OKjCxTvoIq57WNyWp9/E5MAozQf/WezvDPB22IH+2B0eipgBE6ZoisyRfUIB8icuaep9JmFB6WzpPFiJLAkzJEVC+SRMxYXEnjXeTetmoVh4zAFZv8n0RYetF3VllgMByX4RHwo5JBCjHo1akNNp9GolRSEOar9p1xQ3rAGqnhL2M4cDYHXwUBqemKP7pYdRHyspASav2VjZr3AXfyO8vEVl+hN09f/5cNBDwRZe1E65dtFtM/7BIzKlmFInKJrZArE5yGwINEGOzSFazDeyhbSjRxzSmBbkRskrpKOdK3u8+9HDpt/0FnM5AM8ObEoYdhFEDCq10AMv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TebV8SXzRrPAaajOWGIqNzTfTxPg2bhn/5rsJ69gAHyLZQKAbElZN9jXPU5F?=
 =?us-ascii?Q?nZie+LpzA8EwIVVyZjrVqfcbVjCVTnn3xj1e4o7uJNMeN9DrgrkVtin/sTKQ?=
 =?us-ascii?Q?9HlMdLCZaU04LtfiaBnKxIf8uAReduzDYoP99W3ht3hymoJIxjyvNSe1TTSb?=
 =?us-ascii?Q?GQGfzMlm9vNXOq4Ms9QtZlqD2ocmmAe209Vw6nlGIeLjCxTqidH5LUE7PbaU?=
 =?us-ascii?Q?8AmoXPbxODQs9vZKDvyUnsxsimEDGa0/ADBq0d2+hGOhzM4gP9rtA3nen839?=
 =?us-ascii?Q?HZIOc8oYVmptlzKP+UrTXSxB02lYisDjvOc+rX6MoXeqwo0FwsmDBBQlR965?=
 =?us-ascii?Q?B5GXffTCwIsehqWaE9dDadf/xQWe8ffgLYp2OPd3dhEVr9KQ/QDLuPifKr2a?=
 =?us-ascii?Q?c2BwQHS0eNAEMoeVQyyNmgI+9xI3GkeCprUfK6a8jhEwa40VhcpYJzbu8fgg?=
 =?us-ascii?Q?bBK0ZjYns2I86/Zr8y+/HaP3xO5qGo9cCM1rX/hfNzUEy2lB9wPy+Y/56uHU?=
 =?us-ascii?Q?0krSJxOd5s7SqXCADRt9uIS7amh53N0ROn9BqcGumZjDEfEbso1wMJizpQdX?=
 =?us-ascii?Q?8xTEAA2ghMi6NwzbuVWWoy3c3aJY/c0Hqp+Rgc009ZsYSdjhuirRItfurm7O?=
 =?us-ascii?Q?xPaCHP5U6+uX6b/Svi91CrAHRxkd3fRDZOVDZkURhR6Ma2r1ds7Tgp2wtGFe?=
 =?us-ascii?Q?4YsGy/qlTDvhc9siFf0MFzvJDmqa5bWuRL+3xOfbrHb3yvBiLhixvP8I261Z?=
 =?us-ascii?Q?FQlQpkbYMzavdbOgjK0M7tKzC80phtbZ1SuCdJWaOlrkpouNimOYa9yuSmCy?=
 =?us-ascii?Q?S+lHj6pIbVkW51R0aAElOGCUCYIiDDL9akcWY8eMONphxIutMdhN51LpfsXJ?=
 =?us-ascii?Q?TCTZeRMM3aaQ9bJM5bLqwiaZHSDgmNs6pOZgSYI5sRCGL1ncdwtqdkEEjCrI?=
 =?us-ascii?Q?g8quCG1v2t9jDacxMe6daDonUmeUA5zz8KYoGhU3JXrKVPwC0QniBdlQPloh?=
 =?us-ascii?Q?myxX7JQrLVHqIKx7F6SsatFQHk1uNG1dDWgqt4UYBczW00laMYr6xbhfi5mo?=
 =?us-ascii?Q?MI5oYz7DkHPVUGHD6KgO04dd7Lva6UyPz502yta3TibWSe6HtHhvxB8Vn6OK?=
 =?us-ascii?Q?4se9nGpvt5vxSB3F6fOmC5qot36cMiWKgBtaNu5Zkujh1fUR2dfatzhobBEh?=
 =?us-ascii?Q?Yd8iYObDQs31j25rkR+Cwz9I7SGaVROEuFgy53zaokSQ2H8hhnCfudSYeaM/?=
 =?us-ascii?Q?FZRJAcG7pdKvJPobDZ7F9V06XFw3/HK88KsL4aOjxivp/voYGJ9VE83FNn2W?=
 =?us-ascii?Q?znZU2AnunujRyKDF0U7F/nzq9FF3B8Oj/4wjHw/puJCwyN16660xXO2xbF9B?=
 =?us-ascii?Q?FcelBV72pbjbCT4YO2tbJ/GAeevfy2h4mFk6ChOFhihk6ITRkwXgL9y1J+fG?=
 =?us-ascii?Q?suXT6txkKDxuArsbKp+RJ/rXwwaqtJR4mvn2p0ouyLarKoFVHQ/qwSpBiXhl?=
 =?us-ascii?Q?FLAEJS3h7RMulT90VptusV1aGbNCh4l2TWyB1YMvvT7lLNbvh3p/mvigNBcK?=
 =?us-ascii?Q?nJzGOBsakjIBbxybw1Zq2SrwOqPW68BEONzu0auzTUJ7YM0mPVo7Fe7o9FWd?=
 =?us-ascii?Q?azJkGM01pCzKwyJbgwJmlWX1gfM67Ky0XFlcUJIrPEWB8nX/fvFkl3Iae0DM?=
 =?us-ascii?Q?R3tEzgAbsscpSXUZwTU8leHtbI6g3OHMR8HbRS/enDoX/4a2USIjKTnAf7lP?=
 =?us-ascii?Q?XilMBBp9LA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Xmze/IpYB42tSrMpafxnPLl5M3JIapLjh1I3FJHYSneDKmB3IyLKpPh9r8lkom8NRu+OlMMwQMTdl1onX++h98a9ktNQ5qMKCCoxTIepJ3Vw5mvpE7ZTQz7cRu/Xdwg9R+HHKYXlCfTlJIoOiOkzUpDuk5al5E5OAZBLwcQYuSvpf8LBAy5AvErWbXcyJvFUQK+8eGlXyseKY+dsYXwe8glamm9YiEfBgOznLhUrGvR1JFx9SFx5qp/aBHnR0JTecmigewYb4hSGW4R2SsHKIheqYPHZRpf8q1OkKbjjWQPFIEhaavMQ0ICDdOC1mALC64bLyDi38TFV2QEHi35kDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 022c827d-0edf-4059-c453-08df215bfef7
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:38:31.4664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/dIBYGRF3NJ04kA/FanOvCut5W2cGfocfBPC3UJ13lGWs8rRZhedBV3Rn+ElfoCZ7/YAHaLJbBoaYBZEi8rlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com

Hi Sander,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/Sander-Speetjens/dt-bindings-rtc-Add-missing-type-to-trickle-voltage-millivolt/20261002-122417
head:   f0603900ba1981a9e2248413689194bfaed6f91e
commit: f0603900ba1981a9e2248413689194bfaed6f91e rtc: Add Raspberry Pi 5 RTC driver
config: parisc-randconfig-1000-20261003 (https://download.01.org/0day-ci/archive/20261003/202610030533.NdBMhtiQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030533.NdBMhtiQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030533.NdBMhtiQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/rtc/rtc-raspberrypi.c:18 expecting prototype for rtc(). Prototype was for RTC_TIME() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

