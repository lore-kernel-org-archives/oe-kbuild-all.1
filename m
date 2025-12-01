Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3832926ED3C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 06:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764570558; cv=fail; b=Op48N8vug14FLa2V5iqVSKcJNpRuoFK25Ap72MO92+gUbEyLe22MOlsOdj5ZedLxjmyAjuMin1bImLjX+VP+8h6r5IpYuSP+E/0OxT0YUlnEw7CX20dAjKNQHts6OW+FjS9RMww8CBa6Lx9OxS21woOokcp75hxKKnM/ZZRwRqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764570558; c=relaxed/simple;
	bh=IMjJpDXG1optGUPFJwFmJnO53aK+whQbMp4a8TnJlOE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=krrIDUaF9fNnroB8FAq1p5DRxX0ffL2+rGDYdoLqtg/BQKto814v9CgvhyO+P8jHZ1FixwOtcrNdwd1bKXy1mhBO4/tsP1/SgPkKTHJ4k/1ZOfWkZg+XJUUJbXeogcsp/dFVx+1YvliB/K9mVha9n72MAyk4mwAzpqeV3fTlPKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vsicgp3P; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vsicgp3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764570557; x=1796106557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IMjJpDXG1optGUPFJwFmJnO53aK+whQbMp4a8TnJlOE=;
  b=Vsicgp3P+7IZEVjnAfGmw1S62TfeYRs0w9W0W0Y7EVHUgboLeIUfI4mY
   HRJNPaYRy4rn+jBUSDsE9HoRlbWdk3mzMoOEW6NlvYyIjOG0S+S162WNe
   nzSFaB1FyxOACiRm75tbkfOnkyCG6XBT/2yX6n2FW1o2SUwjuYSlOLLQV
   9QjlCtMqowbYfoPrffpGPAH/9WmoSefkaMQeNkSRgZnFrnPrY8xzpj22o
   8pgrIwlDMv+JrXKWFB6Dv/awCqz2SxarSd/ecQg+csjECYeuZ6eBv6Zi3
   lglcmWe1ZMQmpa90ISksi673SPBArE3hPTzYd4XxlPkGzgdCCYCcatCx8
   g==;
X-CSE-ConnectionGUID: B5AUeRfyTxmJf/E9j3G1dQ==
X-CSE-MsgGUID: gn/i/Zf7TAWDdEwwNarn7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77968429"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77968429"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:29:17 -0800
X-CSE-ConnectionGUID: F6oI4Ki8Tl+bRMUDVjY28g==
X-CSE-MsgGUID: raXN1WDZQZSeuPrOFbI12w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="194400962"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:29:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 22:29:15 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 22:29:15 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.25)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 22:29:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgx9zaX/CzCMzBN2JSu1GHTwHSLhW/SDRq406TM1f5CoQ1gyX1lqedreAQIR97XiDN0JTNZ0Lvxy1oIjhBgk8/5l0SA6zXy6jzmkejv4DKrbc5h9jHH8kazMrtFx9ZM3FTsfj8SHeetW22uvS1jPTk+wwXcMadXeYlvkARQxZpEdQ4b7mzuEj8Xf754nLneZvxQroWryvAttQkgnbiONqLw2Q/u3vBkC0pssFR3kasMpAiE5Lp3sVAjtGOQ+/K34nxX+m3p7Fy0ZRAbYUZm1I5WaVF9BfIiVJmhHe7RNkDUkkK6BUTkA0D72Jhz6m97rm3lYSrORekrbN/1/9zBbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79tHmXh5irFw3jaHOduWU7u0D6hO5ELxOju2FMcW0Vg=;
 b=WUJurbIICBuxaUlVvJ5V0z1wMVXp1OItMzO0NQpJioSvUcahEBiXD8816xOqDAoXB34GVFj8OcepNv3RUP5l/XXPOon8TWSaXdmbq7j6s/h+vKmLJiCAciH+qBKP1G98gQYM6JY6GFjLWEzvZeAnBOLGoqr4K7Dju0p3UkMChpHilVeujacqK3y4VJXMsJGNWLhTwvgk+mK+C9Ji5uK7IWrm3v+PRtbrIGj3X8lcYK2YJ1nB1BGbcJxVVaeyWrYGRGsSZAWKebSaFDxsEMfr8PmppVDedbgcKc+0OD6ztT4JsiYnqWWBkjOyZNlaIxxlfTGtxZt/SkGB+Zd8mUPcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CY8PR11MB7826.namprd11.prod.outlook.com (2603:10b6:930:76::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 06:29:13 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:29:13 +0000
Date: Mon, 1 Dec 2025 14:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [sj:damon/next 145/145] mm/memory.c:6213:9: error: implicit
 declaration of function 'damon_report_page_fault'
Message-ID: <aS01safxQkNSNWBg@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CY8PR11MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 27731e77-22be-4117-cad3-08de30a2f198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cMd3hpXkW6qN05vmLDOfxy5vSAmS/i8Rm03UxPUSUZGE1PHEvYrws2NBUcI2?=
 =?us-ascii?Q?l+3Tde+Scb4bPZIpKHCCMSV1khob4NoHsXMkAyMR51BMcT34ZE2PcYVVD5kr?=
 =?us-ascii?Q?HoCgSJaNvxv6ljjeS4Bb1T0xFCg1a623Izm4qYDbaxdRdnbVvylUFvh8e8Sn?=
 =?us-ascii?Q?fASxkplr87+AC/aqJGvyUipzh7ng834iyJCezRRhhIyjKO5nMAKz8fKovSgj?=
 =?us-ascii?Q?uientlLpPChg5CuPDmaPdU61nmImw/a+aAQLWwRNP41Dx3f+QKVA7foiYN8+?=
 =?us-ascii?Q?9St9WF3ulR33S0Dhf8JEhSO9QdW+ZMEueqU5E6MVTowvTNI9NVnRFMYkWUo5?=
 =?us-ascii?Q?p4D72kyZ5WjZv05AXjsqMEcBncekNPbMonIfJNFl0REijc2wGNTuWM5ko4f/?=
 =?us-ascii?Q?1pu+13r3OpK90D4OsV/0A942bVhJyJGXkAxayPWHzfWGzzAK+jHEzXoCvfFq?=
 =?us-ascii?Q?H8ZOykURIhjqMunPL90Ik790sdKUV+oLBp3NLronv0/We0a5iA5tyXvF1KSg?=
 =?us-ascii?Q?V7g9LfthbZyTEEXLCS+VVxvbnBpLBBgeSgpkyyOl52lk4C2L+xAZBV7rAmey?=
 =?us-ascii?Q?jUkxldo5FtwbLokkSyb8eUMELSvo4QevMUmrOT0WGu52URHKhTNVurvXFxZc?=
 =?us-ascii?Q?pfzdRA7Syhl4qYG3NbDQpzo2fMvh5kXehktozTESV6gaHN29U2WLuBIrlWCY?=
 =?us-ascii?Q?aN64rTzO71iYwFCXELr0Wy6JklcxuJBYWOnAMVkTFw/kogngcWHN6TuJ8jvN?=
 =?us-ascii?Q?Sw9wdZaNbV4OhrB88krqda8VOn4DwQv4EUbbBOgp3OyMaiZxnQaWURrvi8gn?=
 =?us-ascii?Q?wkTZ5z7Hbs2ai/Bgo0Fa0fsgkMrk83/wQHNtiNNOg6f63O6PGM40W6K90VZq?=
 =?us-ascii?Q?uLV+taPtGUP4lb/EgZzLE1n3xMkR4wrn2TqMIn9gZHZQ9p18BrQs3HUviTkc?=
 =?us-ascii?Q?/jpw7loEF+WO1HtMDSjC9GTbSkjJE/DcP0ghgMWwJhrlt+TqxnMsMcYIinox?=
 =?us-ascii?Q?Mqwu6Ci7Onk6uptSeF37kpBywkNE1jQoBAR+SzibFoC7Q/sjjxJ6r6bIgaXx?=
 =?us-ascii?Q?ak3dfUHYDNkRkkK43lgFlkWMSd6QVrTGY4nyEEMxeTILxGaH2V5n3dvhw0oY?=
 =?us-ascii?Q?6KyoPvmnpOQKEUM5iih1YBPKVqX97wyrxe9Pv4eI7tkx6KAjVHVaO4fCEP1Y?=
 =?us-ascii?Q?a114u0WjwD1EDApf5jD+FAt22L2DvqWN9SMf9w3u14k2LuG1PHO0isKSVbSM?=
 =?us-ascii?Q?C+ckA3Z4/LQ/wBTkUHpFrS+2muAbbLLc69ntDF9fb0lqTb+CL4LRbu1Beo3q?=
 =?us-ascii?Q?//hkTc4/KV409CP/fePAJnm+CvX/yScH7rb09sizkAj5Kh80whg8WuinnbsL?=
 =?us-ascii?Q?qBvBqCghrOKay2Ibzd1NpyKb/xaDRQpCiC/k1jBaIKZj/57yHD9Wvfx01AGg?=
 =?us-ascii?Q?9ZTykahVbp7LABuhxm+wXmtpLWo5Fpl0seB7NspbIJTDzqCJsmgG6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mumKFk2BnmGmQiuwkjlWIPROQvKGHyZ6DCUqN7PLI1EFjZrtH+e4Ulbon9+g?=
 =?us-ascii?Q?Kp+0Xj61SvidH9FfchwLXeIS1P+eH54qaJ5Gng62loO7EZF9VfvtTBcqixkQ?=
 =?us-ascii?Q?7YYkUqg2Arzg0FL11VqkYg5gzJ0UBOH65Y6rrea8DteSlzqKGs+hj9mgVXJ9?=
 =?us-ascii?Q?/0rgHYHeuq6iUxe8/skC4UyVbXR+FwVtdx45RjVtA+5+0OKVfIxN5B+zVusO?=
 =?us-ascii?Q?R3h073HYpW3/4bhQD7TIwEXjzNY4YD9pSs7lo3j9kKBT1IAlb9EWPXWRI0cl?=
 =?us-ascii?Q?NoZk5IbPojX7+XVD6FP5ocQLWUXQX0t/T8dmlY8edKgCDk5CxlKY/uTZNunp?=
 =?us-ascii?Q?KzvqROMzsmAQVgN8fUUDptXsXivT/q2VQJ9SCCBm9HnkDXATEMD7RHBgNK/Z?=
 =?us-ascii?Q?Wr0G90j1IWAhb5ZafD3n+paqRGHGgRTZOBY1gFlm2dO6Y8CMG2Bardas5l5a?=
 =?us-ascii?Q?1y6lU0xIIkHNlTNUHouqT1GkiirY8ZAZNbrN2JPqItWo2EfSVK4DdBEcwFCL?=
 =?us-ascii?Q?md11cg1aFD7c3FzZCnQ86aWS+dqPkdSg+ixXFd8GnOMxntc0pN2FAiAcCrsh?=
 =?us-ascii?Q?fDGyyLfu8kzZmkZbFj4Bg4ohfb6EL57iGq4EKPNOwrVFKWF0dNfsVYC7A5Q+?=
 =?us-ascii?Q?e/2lp0Ovce+kPrK0TTX9erhj/neeAYVH6zm3CAK/LM8ogiJBAxZ3LZVk06jo?=
 =?us-ascii?Q?VQ7OEBSMIFDUfLEPP7R/APGofyosDgTttY+62/o4Pz3xxaNOjpE91NlAnHKF?=
 =?us-ascii?Q?T3iUhqZTOxvD0qU3wvV8+DxUu5cclm26WsZMM4JZeoGrMHtizY4TWIHFdDDl?=
 =?us-ascii?Q?57K+qMFNzWiwoXtiYR4M4OFZPKjXhyw1EaWJEYLeBWPAr2jkmzLZZ4hTH8hn?=
 =?us-ascii?Q?MnLROzSOVJl5IRcih1cs4kMiGkFlsHJtxMM1uaEiUHejaitFKUNmo7b159AB?=
 =?us-ascii?Q?t9ZdFPTigJjtzzsKdCqDDp3/7EJ3Wxnwap8n0BVPBmTvLTwb5PT7S1U0RWzA?=
 =?us-ascii?Q?5nlVULMGb5WO0ouwlKrLHbMIu9JCgXa7JEiqVeylK3qrNZ3SWc3HWDFNxnzH?=
 =?us-ascii?Q?LugLIoUli98rZzSXxDlJQhGb8XVnoH08G+KG6nh5rhvSd428hKXDvTKlHI2y?=
 =?us-ascii?Q?GoOPaZNiR2K2rVlfmlesiejJkWaXi706jbtUCpGLwnJO4DggI0VZ0Ym/n90G?=
 =?us-ascii?Q?JH47auzOmTPjI6GsrIyTnDcqhZi+tLGfz/B2ppzykKgNhWHLzHd01aESF5Vw?=
 =?us-ascii?Q?kVWNuptwCnGNA8YXBGW5bIMSsJkYVkPTARVIJ/iQol5bKnJ78cUlicZraIji?=
 =?us-ascii?Q?3PMGvLIcyqP7US4DyS6545x4ftg5crOtw9ApnhsaHha3dXp31zmRCoC2jldX?=
 =?us-ascii?Q?hnjF74GS1zblvExQpoN3xE5obvkHOTRGzvwN/MMI2FvGA2lDEa3BX7Qh0Ap/?=
 =?us-ascii?Q?5C1PQmv2WOy/58gCzZRgnmoNh+7zlUdWQjb+WTN4xI0c9R4ms4NrrQX7GWS6?=
 =?us-ascii?Q?TsSZpW1Q5OxxMcYVAmQS1L1+gYob51cK5qA39rNVPKQnGRJtS92f6V5Ot/nc?=
 =?us-ascii?Q?9AQYuqBqDarrxCHJfdl3+99a/zcOKoxAXxb0V4Se?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27731e77-22be-4117-cad3-08de30a2f198
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:29:13.0683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/B6YbKRwDNbqdBaMpL+jds6LcsxTs0Rz1bLAZKVsmUm6Dq4IP1f0rBUeaJaqF98hjAR9T77/8jlP76JakUIVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7826
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   3fdd82439d28bd0bc5eeb347a6e96569ae05ec92
commit: 3fdd82439d28bd0bc5eeb347a6e96569ae05ec92 [145/145] mm/memory: move fault reporting into damon
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251201/202512011308.JsZqQIqQ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011308.JsZqQIqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512011308.JsZqQIqQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'do_damon_page':
>> mm/memory.c:6213:9: error: implicit declaration of function 'damon_report_page_fault' [-Wimplicit-function-declaration]
    6213 |         damon_report_page_fault(vmf, huge_pmd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~


vim +/damon_report_page_fault +6213 mm/memory.c

a00cc7d9dd93d6 Matthew Wilcox 2017-02-24  6184  
c6fab22355afde SeongJae Park  2025-07-27  6185  static vm_fault_t do_damon_page(struct vm_fault *vmf, bool huge_pmd)
c6fab22355afde SeongJae Park  2025-07-27  6186  {
c6fab22355afde SeongJae Park  2025-07-27  6187  	struct vm_area_struct *vma = vmf->vma;
c6fab22355afde SeongJae Park  2025-07-27  6188  	struct folio *folio;
c6fab22355afde SeongJae Park  2025-07-27  6189  	pte_t pte, old_pte;
c6fab22355afde SeongJae Park  2025-07-27  6190  	bool writable = false, ignore_writable = false;
c6fab22355afde SeongJae Park  2025-07-27  6191  	bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
c6fab22355afde SeongJae Park  2025-07-27  6192  
c6fab22355afde SeongJae Park  2025-07-27  6193  	spin_lock(vmf->ptl);
c6fab22355afde SeongJae Park  2025-07-27  6194  	old_pte = ptep_get(vmf->pte);
c6fab22355afde SeongJae Park  2025-07-27  6195  	if (unlikely(!pte_same(old_pte, vmf->orig_pte))) {
c6fab22355afde SeongJae Park  2025-07-27  6196  		pte_unmap_unlock(vmf->pte, vmf->ptl);
c6fab22355afde SeongJae Park  2025-07-27  6197  		return 0;
c6fab22355afde SeongJae Park  2025-07-27  6198  	}
c6fab22355afde SeongJae Park  2025-07-27  6199  	pte = pte_modify(old_pte, vma->vm_page_prot);
c6fab22355afde SeongJae Park  2025-07-27  6200  	writable = pte_write(pte);
c6fab22355afde SeongJae Park  2025-07-27  6201  	if (!writable && pte_write_upgrade &&
c6fab22355afde SeongJae Park  2025-07-27  6202  			can_change_pte_writable(vma, vmf->address, pte))
c6fab22355afde SeongJae Park  2025-07-27  6203  		writable = true;
c6fab22355afde SeongJae Park  2025-07-27  6204  	folio = vm_normal_folio(vma, vmf->address, pte);
c6fab22355afde SeongJae Park  2025-07-27  6205  	if (folio && folio_test_large(folio))
c6fab22355afde SeongJae Park  2025-07-27  6206  		numa_rebuild_large_mapping(vmf, vma, folio, pte,
c6fab22355afde SeongJae Park  2025-07-27  6207  				ignore_writable, pte_write_upgrade);
c6fab22355afde SeongJae Park  2025-07-27  6208  	else
c6fab22355afde SeongJae Park  2025-07-27  6209  		numa_rebuild_single_mapping(vmf, vma, vmf->address, vmf->pte,
c6fab22355afde SeongJae Park  2025-07-27  6210  				writable);
c6fab22355afde SeongJae Park  2025-07-27  6211  	pte_unmap_unlock(vmf->pte, vmf->ptl);
c6fab22355afde SeongJae Park  2025-07-27  6212  
3fdd82439d28bd SeongJae Park  2025-11-30 @6213  	damon_report_page_fault(vmf, huge_pmd);
c6fab22355afde SeongJae Park  2025-07-27  6214  	return 0;
c6fab22355afde SeongJae Park  2025-07-27  6215  }
c6fab22355afde SeongJae Park  2025-07-27  6216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

