Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9662853F8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764694049; cv=fail; b=VzNavg8iyVrOiW1WcGmFNI9DFYd3gDvRByrlSe4YAg7iZU05xWh0ZLUBREXl20LUhficSvfJ6X5wvPzQxVWGR4iGL6tK9xduqNjqLGE55B5H+wQeJ9RSMqzCNBt75bJLUY+H14FdVDwOoAOw81wlgBJQLrdqbOueXCnsnPtOHRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764694049; c=relaxed/simple;
	bh=fODSAcfW+UvjlMNQVx3MfuY+njitQyvFcO8RIRalcEI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MYPEAglKa987TV/sVP766Br/5Vf8q5USJ0IBYKB2DbTjcFTl3jQjTsjsk5o9rlYhIULwEOJr1k6K+V55750nclq0yTAoM7i29re/CN98ikQ2VbG5RXsuvlQH7UUBfnbz19psiZ31ZrWmzlLhLh4/k5YxM2Hu9l21NNcD3kOHerE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAW2UxBq; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAW2UxBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764694047; x=1796230047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fODSAcfW+UvjlMNQVx3MfuY+njitQyvFcO8RIRalcEI=;
  b=KAW2UxBq+47X+vwE5kmOPOIAwxUhYcz9P/iLwwudTL0BiFdroREfVuHE
   T8LjJFzkt04LQLcMm+AZyk35PO41TDw0eOCjTw08ynFSTcT+Q4YqitmMI
   vBiD9OH0Z4bLUnK9Z34lcyMysv6ESQ9VZn7JJBVvjXPtKJBfAz4e3ozk2
   w+3MFBwbw3EAHs39X3Fn1ZJwl7D4tqu2Ni35fJGyXj0ZCujjTrTC//evi
   b/PsqwwKuMDvSlYso3LyAmSayHLRN/EgcQ+tZ0cGP9LRQHDfvbGkvjouY
   XQ56hpcWsR1DEimiNHWqpPtcn9ATWoP5mcA+ebALD4dFEhwr5OR+YeOom
   g==;
X-CSE-ConnectionGUID: TRMexQ8VS3uO50sDzu/IYQ==
X-CSE-MsgGUID: GkTCcm0TThiZof74b3I5NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66837762"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66837762"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:47:27 -0800
X-CSE-ConnectionGUID: QdPpYi1ET66J/mygo9F7dw==
X-CSE-MsgGUID: +/XD5/lqTS2GCaW17kvvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194656883"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:47:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:47:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:47:26 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:47:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLg0G9R2OSDfKsr6lnOIyVsjnnQP6ncMcZYwMixyd4MaSJ2jI/uQ3AMxZNBgmctz9WQQJFNET2Vn0uWJ1tUkpKC2vTik+jwhTBImSRHEq1tT3jwFfBg/qhAUKJgr2nbdDAuyCMcCromc7ibjX1MWzbPIPY+I2BmVQL/mn8w4vCP06KzkLYKcaaNZE20xFWmFcPFPMkOBPcJ+upeMDN/W41SG2Bxuwk5RFYxtR4pfQ/zyo/L0Ze98GLHNH3Hs97G9vob2eL8cNEJ2369mc/geHv2SO6w5X2lAA10p2mfeUtokO7X0Y90u80D6xnYpxiSYRRc3zyFDztSyVteKHIOsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+aijI8h46rUgQk0h5Th0BCvWIEZCFdX5Xp5PK9QuSg=;
 b=SRZ5ww+tt4h8T0HVN9bS7sa3g5DMMTmo2xufZ0bmi6I653RDDmRmzG9iqcD9XrNcsPyx9MvQSbaYaVDZapBfMp3Z5zOp1ruN7k5SY4Lkgl9DhlvizbNhnpHrcs3RgbMUzih6/eb6w0h41P7ZFyEdikDp0ine4/f7qaz0J3F1x6nvGPkDFrC8NWyiT2oDiSq5OSPPhO9+obyUN+tuzzCpnHJQP3fuFu2DUSGiRiqgzWZBxca2uWPH6oS/7C8QhHyRMu1tKpfDUvUnXLMnpK/cvCRDb8I7Y8Y9oWmogBi4BTOjUAL6IfUEV98DdBm+VWRXaMGfWvv73sVzqRMKSZ2Pig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA1PR11MB7318.namprd11.prod.outlook.com (2603:10b6:208:426::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:47:23 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:47:22 +0000
Date: Wed, 3 Dec 2025 00:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-kiwi-6.1 36/36]
 drivers/dma-buf/dma-buf.c:413: warning: Function parameter or member
 'dmabuf_info' not described in 'dma_buf_account_task'
Message-ID: <aS8YEazMFluyTnJx@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|IA1PR11MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: ce55a417-4052-443f-b841-08de31c27728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/sd0hIB5y5d3IuCoR282acdEa3jaCC2DtGLlZqCkLnPnRudbxK1AEk/pMpfT?=
 =?us-ascii?Q?L/jV5MBchosZtP4TT37dOy1JhMAmw2fiF0oGaNKFuDXXRSeCXuHDtZvrmcT4?=
 =?us-ascii?Q?sd9eHSoBOsQu3WA1Vl+Wy8kb5LBi0DpNE3Xm80/o5hKtMdg9fA7gU2cO5YJl?=
 =?us-ascii?Q?4+jQNTZ2+WzpyiSCUSXwu930mEGxheNJdelJLOs+Fm99FJyJlh1f4FNVXuFU?=
 =?us-ascii?Q?6W7guuI2NKqaZWP+uSzGExtLZJSlfo/2mbUFVSeY0nE1KpJ9CnTq0rnuz5Ld?=
 =?us-ascii?Q?aL5mvdoyvn4qFfWfZ8aMA3Xk4vMK2ChYGkLGOg1uvxEQ98t4xAUNGOuc5GnQ?=
 =?us-ascii?Q?poD1rPiH73muWfzzskaJD/PuOhZGELR4OTMLEQM7KrxQcMHD9zIzwxTcVRKg?=
 =?us-ascii?Q?txRlYpPtwlR9ECyOQeQcs8EeXdjPDLaa3QcqCVaJZiTmIC0iOLWDuus2OOgE?=
 =?us-ascii?Q?EqDT8/X9aA5T3JszNKeOi+e0T4lKEXz3D93B581NqNgh/5vpZR1i+E0Q0P9w?=
 =?us-ascii?Q?OcphAX2K1iAvxdakofMYXivKmal3Cz0Dc7nXh4TZxK7NUvEbPfXSFOyOoEtd?=
 =?us-ascii?Q?EX+7Gxt3oKTbpTYGpo99OyS15ZO9AjSmewbtp1clyHKHqg1i+4Lm8y4iEbnt?=
 =?us-ascii?Q?g8qYbKkyxaDZU9P+rMa4Q6FoqtKImducPP+fgBcnX1kJnO84FNAK0rDe6O/w?=
 =?us-ascii?Q?sku/rAM5qN41ED10O46gXktXpnbu15Caexa61XOvc8Bq0BH0RTtSj8SVmlvc?=
 =?us-ascii?Q?BjVBU+XMbNo5Su9lU/TBl/RkCLVvVvy9bHSSXr5nzbikvb8JViRJGC+qVlJs?=
 =?us-ascii?Q?TDaq2KrCt5c0/Rsc49iRUWUA8JFlyarX6+kLOTqRpiZEXKi7qhPhns0Yf79I?=
 =?us-ascii?Q?OowurYZ2ZrztSyEdDV0mwqlGd6neEO/TR4om3+gg59xMAgvdXFHqjjeJpbdr?=
 =?us-ascii?Q?Mq7cTjjHL/L6mn5LHrAx5rQxsJlEYd/Snx20B7E0PAigdnIrmf+T72louZQU?=
 =?us-ascii?Q?GJ2vt0BgygPUD9B2qkgk75FGAPZomPiND1/2g1HKWVBgu3tqOjsmxH63I8nk?=
 =?us-ascii?Q?Uh5z/hD0Tfg7pGO4+ie9goFKGG+guB1cHqsP/TZ/hU/xP17R3WKGyjyzyFKq?=
 =?us-ascii?Q?naOATDleh2q7eUSyiUcO3jl8tkDUv/YpYArVVevcIGI2FH9vvUJ8TRdFTxpa?=
 =?us-ascii?Q?GvHFJOvnf2KNba/YGkQ/KVTTkj51CcU1s8hUBlJ4Ybma+xxliNjOO7Bn0mFG?=
 =?us-ascii?Q?HjIHablgnrXo+vacs6Jfsx2qg+XaE4BATL24NL33n47D3t8pMGQjfABafzX8?=
 =?us-ascii?Q?rqrKd8tjp86SiNXBYiWwuAKkfFsFAZbz783fAOVszvcXcpC6wWlvwJfKbnvA?=
 =?us-ascii?Q?X4O0evOZeds60btJCjJx+zOaMsj7GJso9bL1HJAHi2a2FBWo5Br/aQVDugIT?=
 =?us-ascii?Q?pj9Yj5P7xwVsb8+eh2/xYA63zAigL2/TMe6sa2pC/x7avVeb7xDkaA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/tJH9S2/2d2iOippmXSv9xKTwV4wC1PFbq00Fit7bGL87csCGY8+wD4GqDpz?=
 =?us-ascii?Q?+c9JeFRao7hJsY0UnYwBpXHf+tYK1x4mG06aLNo6xZuv8H70+oy39aH9y+lT?=
 =?us-ascii?Q?bh48n8KcrfdEwV74UUPYaUOdw/aZDdEgqQaWXcfs1AtaOKc5ilY/4XHYaQ5o?=
 =?us-ascii?Q?EYuAqebKYRy3AQ9kX6qufRX4kZYpwvwzfCls/iLJSNBjMO7kdRTCxNCl3T96?=
 =?us-ascii?Q?AsKal1/GrhLfXT6884fz+6wUdwpMbQU25cfzvZm7b7AUNh9YpWLO3mPrsXf/?=
 =?us-ascii?Q?/uKNa02gNmVJyO0cYx6islxQnYx2vLA8sMxpqcGL7MsNmUZObYw5V4E+aZ0K?=
 =?us-ascii?Q?+rJ2mVwJAe4KIZjkEXBZGGuV/Y1nyeJcOhfuPmAv1gg0EcTdOKA4Qdx4aD9x?=
 =?us-ascii?Q?f48PwZYVZFAgBqMRAVsblV4kzkhDNzeqIeDAg3kNZdKG9PV6hzstq9Xv8Klm?=
 =?us-ascii?Q?n7a16PGIWsi5J9vo56LB3Oh32/r/cg0qUv3JMVsTS4c0B6lnH1ssKQLNAPva?=
 =?us-ascii?Q?uEuHC/C4snZO7gXavbo2vCMZKuugNjTJZAURsm7H4zKI9vwXdk7QVhl844du?=
 =?us-ascii?Q?eMUJVBRLr9evNThXeYWWhoSIPccrs8HQeMGmzTYe8KYLMWzOTlj6Gq6WmLvO?=
 =?us-ascii?Q?sX/rlO+pRIs9TtfmWMJ7YWBYnXDvKXh5M7v+ePQfJRinM3lfh6v+w3seK0ZY?=
 =?us-ascii?Q?0+69TcWW7VUovJPM0gslfo7REwNjKY5AlJLUKG2zhBVez5UFNF73kgNe93UI?=
 =?us-ascii?Q?vmvUep6w2fm2MGu0kgBnWOVY85QjeBIXm3gBT7knsVCUAob7VX4JjwLlIAFD?=
 =?us-ascii?Q?9P780zAzokx7VuT8TWaLbxB6zHzI/dGAvNXuAKzcHlML6UdDzToLqoyjV2Tr?=
 =?us-ascii?Q?AC4PMgPgjcQIjgHvDwtIZt8qQwqEI05paj3bTsGrXUORzfFa8gJ2ME9gnS4j?=
 =?us-ascii?Q?7ktST1vOpKmdd8dwCIRxrNMAHvMXAoYTl3dw5Xvak68pL9yO/efIVbvF7QL1?=
 =?us-ascii?Q?v66bxf492oq7g27bm4N+uOvH2w6XxULoW83K5rNy4PFhyV1bsoWVgg8E7W+x?=
 =?us-ascii?Q?3pC4FdfGzidt/HFWjXN6N8Woc2h8bd7CXzSqaLMs64t2QlkZ+Mrno0TmeaDG?=
 =?us-ascii?Q?bPi5HEkJGxR6t2Zv2RX2a7KbNJ6mHH+3WbK2Z3a8lJAczgOXNH/03HCOxrBd?=
 =?us-ascii?Q?EEc5Kn+uFM9vMxYKknI8vZE54l7Fi9oM3ia6TsYVzBdqOQMXcVQVWnBRGBgC?=
 =?us-ascii?Q?4oTPKKONR1QD1LVNtaTTpP1OYCJs0XZQ3Jo+Yo1Tt2XixJGOBo4rq6Bl8Oad?=
 =?us-ascii?Q?oi9lGU5cTfEPS+3ggZ4ESQXnLiB306magpG65I6jv+tDNhIUfapoaYj3AGex?=
 =?us-ascii?Q?qUYcYK39T+bxxca81dTDcyNuLh/WSuwi7XIvGJt+4YQC4e0lAN9jbzzYajVz?=
 =?us-ascii?Q?fHazBB7aGMM36bgQ5xANiZyV6y4wcZTe8Vyw8y6ibm1pxmXhS2tmJB+I8Hpj?=
 =?us-ascii?Q?Av/r11EjnqAftGMDidtrOUy3KnamkD9Nxsow3BFteSLeNK0GJAsWFhaarCCo?=
 =?us-ascii?Q?Unfdz8rai5a8fw1sH9yO0LEfpq3eswU/xVUAPmxbZChI8RgbeYBQzcDPjXXA?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce55a417-4052-443f-b841-08de31c27728
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:47:22.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lGleDqUyuWBKAOCVkQnkJ/VfUww/nwcWMNRhd9zp5pFbGoXXb1OqGPx5S1hTFqHBvHa0qp42gvcn4Dn28EoAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7318
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: 5dd8a05ba11a36d91c244d3e482a18a275e5d8ad [36/36] ANDROID: Don't use current pointer for per-process dmabuf accounting
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021659.QqMFxsvF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021659.QqMFxsvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021659.QqMFxsvF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:413: warning: Function parameter or member 'dmabuf_info' not described in 'dma_buf_account_task'
>> drivers/dma-buf/dma-buf.c:413: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> drivers/dma-buf/dma-buf.c:452: warning: Function parameter or member 'dmabuf_info' not described in 'dma_buf_unaccount_task'
>> drivers/dma-buf/dma-buf.c:452: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   drivers/dma-buf/dma-buf.c:932: warning: Function parameter or member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:932: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +413 drivers/dma-buf/dma-buf.c

060742b3d06d5d T.J. Mercier       2025-07-22  398  
060742b3d06d5d T.J. Mercier       2025-07-22  399  /**
060742b3d06d5d T.J. Mercier       2025-07-22  400   * dma_buf_account_task - Account a dmabuf to a task
060742b3d06d5d T.J. Mercier       2025-07-22  401   * @dmabuf:	[in]	pointer to dma_buf
060742b3d06d5d T.J. Mercier       2025-07-22  402   * @task:	[in]	pointer to task_struct
060742b3d06d5d T.J. Mercier       2025-07-22  403   *
060742b3d06d5d T.J. Mercier       2025-07-22  404   * When a process obtains a dmabuf file descriptor, or maps a dmabuf, this
060742b3d06d5d T.J. Mercier       2025-07-22  405   * function attributes the provided @dmabuf to the @task. The first time @dmabuf
060742b3d06d5d T.J. Mercier       2025-07-22  406   * is attributed to @task, the buffer's size is added to the @task's dmabuf RSS.
060742b3d06d5d T.J. Mercier       2025-07-22  407   *
060742b3d06d5d T.J. Mercier       2025-07-22  408   * Return:
060742b3d06d5d T.J. Mercier       2025-07-22  409   * * 0 on success
060742b3d06d5d T.J. Mercier       2025-07-22  410   * * A negative error code upon error
060742b3d06d5d T.J. Mercier       2025-07-22  411   */
5dd8a05ba11a36 T.J. Mercier       2025-11-12  412  int dma_buf_account_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22 @413  {
060742b3d06d5d T.J. Mercier       2025-07-22  414  	struct task_dma_buf_record *rec;
060742b3d06d5d T.J. Mercier       2025-07-22  415  
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  416  	if (!static_key_enabled(&dmabuf_accounting_key))
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  417  		return 0;
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  418  
060742b3d06d5d T.J. Mercier       2025-07-22  419  	if (!dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22  420  		return 0;
060742b3d06d5d T.J. Mercier       2025-07-22  421  
060742b3d06d5d T.J. Mercier       2025-07-22  422  	if (!task_dmabuf_records_preload(1))
060742b3d06d5d T.J. Mercier       2025-07-22  423  		return -ENOMEM;
060742b3d06d5d T.J. Mercier       2025-07-22  424  
060742b3d06d5d T.J. Mercier       2025-07-22  425  	spin_lock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  426  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
060742b3d06d5d T.J. Mercier       2025-07-22  427  	if (rec) {
060742b3d06d5d T.J. Mercier       2025-07-22  428  		++rec->refcnt;
060742b3d06d5d T.J. Mercier       2025-07-22  429  		trim_task_dmabuf_records_locked();
060742b3d06d5d T.J. Mercier       2025-07-22  430  	} else {
060742b3d06d5d T.J. Mercier       2025-07-22  431  		rec = alloc_task_dmabuf_record();
060742b3d06d5d T.J. Mercier       2025-07-22  432  		WARN_ON(!rec);
060742b3d06d5d T.J. Mercier       2025-07-22  433  		add_task_dmabuf_record(dmabuf_info, dmabuf, rec);
060742b3d06d5d T.J. Mercier       2025-07-22  434  	}
060742b3d06d5d T.J. Mercier       2025-07-22  435  	spin_unlock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  436  	task_dmabuf_records_preload_end();
060742b3d06d5d T.J. Mercier       2025-07-22  437  
060742b3d06d5d T.J. Mercier       2025-07-22  438  	return 0;
060742b3d06d5d T.J. Mercier       2025-07-22  439  }
060742b3d06d5d T.J. Mercier       2025-07-22  440  
060742b3d06d5d T.J. Mercier       2025-07-22  441  /**
060742b3d06d5d T.J. Mercier       2025-07-22  442   * dma_buf_unaccount_task - Unaccount a dmabuf from a task
060742b3d06d5d T.J. Mercier       2025-07-22  443   * @dmabuf:	[in]	pointer to dma_buf
060742b3d06d5d T.J. Mercier       2025-07-22  444   * @task:	[in]	pointer to task_struct
060742b3d06d5d T.J. Mercier       2025-07-22  445   *
060742b3d06d5d T.J. Mercier       2025-07-22  446   * When a process closes a dmabuf file descriptor, or unmaps a dmabuf, this
060742b3d06d5d T.J. Mercier       2025-07-22  447   * function removes the provided @dmabuf attribution from the @task. When all
060742b3d06d5d T.J. Mercier       2025-07-22  448   * references to @dmabuf are removed from @task, the buffer's size is removed
060742b3d06d5d T.J. Mercier       2025-07-22  449   * from the task's dmabuf RSS.
060742b3d06d5d T.J. Mercier       2025-07-22  450   */
5dd8a05ba11a36 T.J. Mercier       2025-11-12  451  void dma_buf_unaccount_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22 @452  {
060742b3d06d5d T.J. Mercier       2025-07-22  453  	struct task_dma_buf_record *rec;
060742b3d06d5d T.J. Mercier       2025-07-22  454  
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  455  	if (!static_key_enabled(&dmabuf_accounting_key))
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  456  		return;
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  457  
060742b3d06d5d T.J. Mercier       2025-07-22  458  	if (!dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22  459  		return;
060742b3d06d5d T.J. Mercier       2025-07-22  460  
060742b3d06d5d T.J. Mercier       2025-07-22  461  	spin_lock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  462  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
060742b3d06d5d T.J. Mercier       2025-07-22  463  	if (rec) {
060742b3d06d5d T.J. Mercier       2025-07-22  464  		if (--rec->refcnt == 0) {
060742b3d06d5d T.J. Mercier       2025-07-22  465  			list_del(&rec->node);
060742b3d06d5d T.J. Mercier       2025-07-22  466  			dmabuf_info->dmabuf_count--;
060742b3d06d5d T.J. Mercier       2025-07-22  467  			dmabuf_info->rss -= dmabuf->size;
c8372adc56a99a T.J. Mercier       2025-07-01  468  			trace_dmabuf_rss_stat(dmabuf_info->rss, -dmabuf->size, dmabuf);
1b269f8eb12649 T.J. Mercier       2025-07-08  469  			atomic64_dec(&dmabuf->nr_task_refs);
060742b3d06d5d T.J. Mercier       2025-07-22  470  		} else {
060742b3d06d5d T.J. Mercier       2025-07-22  471  			rec = NULL;
060742b3d06d5d T.J. Mercier       2025-07-22  472  		}
060742b3d06d5d T.J. Mercier       2025-07-22  473  	} else {
5dd8a05ba11a36 T.J. Mercier       2025-11-12  474  		pr_err("Could not find dmabuf %lu in unaccount\n",
5dd8a05ba11a36 T.J. Mercier       2025-11-12  475  		       file_inode(dmabuf->file)->i_ino);
060742b3d06d5d T.J. Mercier       2025-07-22  476  	}
060742b3d06d5d T.J. Mercier       2025-07-22  477  	spin_unlock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  478  	if (rec)
060742b3d06d5d T.J. Mercier       2025-07-22  479  		free_task_dmabuf_record(rec);
060742b3d06d5d T.J. Mercier       2025-07-22  480  }
060742b3d06d5d T.J. Mercier       2025-07-22  481  

:::::: The code at line 413 was first introduced by commit
:::::: 060742b3d06d5de7b692b6e7340e90bb950769e4 ANDROID: Track per-process dmabuf RSS

:::::: TO: T.J. Mercier <tjmercier@google.com>
:::::: CC: T.J. Mercier <tjmercier@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

