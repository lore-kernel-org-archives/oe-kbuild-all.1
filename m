Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13988692FC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 16:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707496501; cv=fail; b=MzN1qxhdI0rVKBwc/zduhpM64TK2zg2cVxtSzOEhfC5VCO2F2E8jLI/wRX6GxL4A/MdtUNVgNzpTTDL3fUgPmfhYeYS8wegurfdXl3deHwZtRMt4aBjews+ddBPGwWLRnPV+ggDi+gjcLz2AKMyW0en9GtKRbsHNY39vhLf1yg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707496501; c=relaxed/simple;
	bh=81hY1nky3+zUrcnDOzdqeeJqUr8x0jFiUusc9LPT350=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XggDjwiKeko6e5HnwkhDWSr+esriEiX1olR/1dFq1y/hht1Ee/RkQe55Ev2aRVTXL9y8uJSu3yfDWjaJ+ZWMhcyqlQmoFkU8H0gWU51Sj3kanabODmKj0Kz4j6NKy/lUp4tRnGKoRUtodJhil4UF72wQ7mPUWxxmL645MfJfsB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbCq9L50; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbCq9L50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707496500; x=1739032500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=81hY1nky3+zUrcnDOzdqeeJqUr8x0jFiUusc9LPT350=;
  b=ZbCq9L50lKVYUSSPms6BAZtmrA4j9yF+qz93pqXR4WMkZ8qi5z/MkI4Y
   dmK2DKU//YGK3am2N660sgy10/f3FUeWFDNRK2kmFU2Bl1rDLSxRvyd4F
   W0TFUKtmNggd5WEV41UImVBnrmBAaa2Nj2ZUXkNYiyilvRVbRwWZS8sFZ
   ACwZY2Es8xlcO6oIawjF0+cdxV8t6VM/ltHvsEwxOv9grrN/N2It7rVR0
   uXMojyL+rLadcB/SJiGmhVEHPs1WsEoPj0aK8flhIekN0YnEjP0Ls9TuB
   cUXOrbMuMS2iCNJczbDQq1sQp/i9aDHHaZbtoa14Q9AT5mUrsIYzM+3/q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="23937752"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="23937752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 08:34:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="6625978"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Feb 2024 08:34:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 08:34:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 08:34:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 08:34:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HX8h+Tb6lBI84ooAT5mojkd5ZwRh6NiL3kSt20hR7dBgC1qIu3oHqetRqt2P+SFp3SAjzv5JoPUWDRRbi6PL4rxT6Mx5Q4SV87vZD4gi1REFSNBWB0b02iS45TKc1oS+9rphk/WVnPN1zhHaMPLaE2v7uY2VxqebwmdomHKayb6Vvsn3wUK/9VoSbRHyzye6PslKZKPbXLasgVdwWKidR5BWEJD9XwuZbABbpuPNzeegVlelPkB2CpRQuuuB1yAQ2BIaIhYNSI4EkTvjdxxo1/L8+WrXnERsCHXxNge4ErAtitxuQFs3zsnSr4RZxSHtOE9qs3tGxLT+f3TqhMgiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hrkvv4hmZRlfboHyfvmYUlHqnAakbvaRfsm1V1Lx/aI=;
 b=gTQjl1lpX1Av579axlNnZWWGmmovBuhx7Eouyg0/dbSK7SXpu1nwZGDjGdyiUKTsFm80Z/rCNVMUjluUGkUlj2TB7GYq5Hf71G3v/opfxURBLOJm7ZCOuL+K43ufe4NoO16Aq4BPNrKemns2+j2xVP+DxnZLEp5GcjeZn9pt1+jXwE+EEwA10ExPLvdMa6+Or1hNUZx0K/TSr8QhCXdUR4T/qOX7TnTtcT7M80m58Q8S4lmyJqq+ZjuJLd7v+DrwaZwz66NQlJdlsDRD5Smt4W8Iz/LBZ/gmhh65/uE+GK0RJjSQ60sNW/ZsR58TLF6PsRoY/U8zv4R7S8pIEDSbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Fri, 9 Feb
 2024 16:34:56 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7249.038; Fri, 9 Feb 2024
 16:34:56 +0000
Date: Sat, 10 Feb 2024 00:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>
CC: <oe-kbuild-all@lists.linux.dev>, Lee Jones <lee@kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, <linux-doc@vger.kernel.org>
Subject: [lee-mfd:for-mfd-next 19/19] dtbs_check:
 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml:
Message-ID: <202402090901.PJ4OjZCB-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|SA2PR11MB5100:EE_
X-MS-Office365-Filtering-Correlation-Id: 800cb4d2-9654-462d-2925-08dc298d0d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2F3DVYrGGoiPFo9F/V56ZasdjQn7sbh7Z484WugKE8b/LpCp6o2inT1W459W69wEUrMKl7qKJG9oUDr/h6soPK1MIQNXMYlhZ+5xHHMf5a6Ut7txa5ndbPC/9IV3IxEFJ2UlqeYo+MkCW9HdPaNqdFB/zhWdakV37yCMLgXDBVpn/HP8Z5vIU29hCsuDZsTbXcR8RWjZqRyyHjlUtdbk6GB+rq1LR8wqcZkNjOjrVv4+sQ4bV2j8QAehjut3t5AJCY3BfeT5oyWlInSLA5RwcuK92FDEoMCphfw+gr8YUHkheWm9S6z9dF3lpFTdBKJoNB5i6iS/tiPWQNEgUo2rMNBGz4epiF4WHLHKtdhL+PAhSugbQCqsaN/4LIS7X1AvQnKBMxTEQIlFp11nsKLfuq6hHq9RozRqcUOflpKOWs48o4OCgXxKKTLZ4FP7rtXb8Kp9vqvc6B/uFVEaKx258yCKpw+s/wM1/30BCZwxpioAOHtsuSC6+ANbhdzSt6PZMkRSmVtGbZs8Y20rO/0k20Aj2G2NR+zMlg9hQMN56vAklImyRCJlJqWB/4xMy/PB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(39860400002)(136003)(230922051799003)(230273577357003)(186009)(451199024)(1800799012)(64100799003)(54906003)(83380400001)(38100700002)(8936002)(82960400001)(6916009)(316002)(66476007)(66946007)(4326008)(66556008)(8676002)(6506007)(5660300002)(2906002)(1076003)(2616005)(6512007)(26005)(966005)(6486002)(6666004)(478600001)(86362001)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TF6csoxojJXakg0g4JNbkR76HqPQTZpE2kwQWZqZTSbWMZB3hbNyQvvBH4Ry?=
 =?us-ascii?Q?AG+gJi0T8ZWNRD5IEn1rNCKavgvtpY0DOGy+/A5xKiu9t4wfi3dpEDp51Pss?=
 =?us-ascii?Q?Q6Pv5RmsPOthlCiRG5AzB0FYVhh/GDJ3Af+yJNvFkpQzAJ2hjGTbCNoeoYOr?=
 =?us-ascii?Q?rDvz2jYION84x6UoFkWmC4QuoSBHekkbcVGq9EymDRJILQxY/bVZi055xdsh?=
 =?us-ascii?Q?y2CP/+jXnZswMgU27h1YvzAgL0aI837j0e0G++3iSnaBSnY0lfxSNDxnx1tb?=
 =?us-ascii?Q?XK4lPfI3RfpDQKGyIwFN7vdmaxxUDo0Zerx7PcojvbM72UAKLH16XZ5IOJxo?=
 =?us-ascii?Q?z1HGQA/IZxA9k+N25mtKKePgkvySFb+qEKPqS3/hMQwh5SwxUn9QUq0si3Pb?=
 =?us-ascii?Q?hDpIs61Yz8j+9KtaKI4xjL9+wN3qwNG4KVtrCv18O4CDIUDlC10gndJ++HdP?=
 =?us-ascii?Q?DD9S4oZgyqcpPkxSdF9hL+uN/cMTDkQoAPSbaQ5O8QmZsjxMHfTu70lAdKNA?=
 =?us-ascii?Q?b4hhSUynZUpG8gv2c/cKjATtNpIRl32WNtkMF8TST7KTTJxiKRoUoEJJ0WHA?=
 =?us-ascii?Q?JUdzs7HU+vzx9/Qd8NWCl4wfGhCtIfdg6ijeB1xik2OayG6KC5YPPmzdYSwr?=
 =?us-ascii?Q?F0YaNWZ3BCdFzs5MTxW6md9faQ25p0wVOW7QjG5x3T0HG1sTTJpnalNyRjU3?=
 =?us-ascii?Q?F7McKmn9F8MyXPqEvvJNqvUJF45rzMI61FFOVfn3ipXjsSDoznI2GZmSfNKP?=
 =?us-ascii?Q?VOdg3ubiXT6h2J0qNkqTHLmoMo2J84NcQP3gP4ydJ1pDvCJrsCYMbpmD6+n6?=
 =?us-ascii?Q?qhU1OtxOPhAtCvIvDhTFHieuZuyb6Vonqezfu88vOyiufyhQQtn2xv2iQJnD?=
 =?us-ascii?Q?mQ8CNQrmE3dPR1IzwuvPnO1a0bTf6mpHrA79BXAd0K843VjTrXLT5q3eDGqs?=
 =?us-ascii?Q?FJ/yqA4wVkdRbKSs8EE9V2SGmjF0r4PWclvz49E5yfrwu7yXQP5bGOfLuUAc?=
 =?us-ascii?Q?wbLIwOMn8litgFFaBVaNio8Mc+K+k7bzcWkJA+sbds4IfkIIKXLKJ0+/W8dF?=
 =?us-ascii?Q?aU+1cQ0QY76oSwEy89uhF+wWH9S/YCm32Ixwl3uiTzh5bh7JpHYEToaIJd8w?=
 =?us-ascii?Q?w6G50+NYlWu4CTfu1orOmllKbsZNG8ABpH4NeAvpiuIE9f7z/LZDVJ0/TQgE?=
 =?us-ascii?Q?gd+mg51I7hRPE5K993M//VXudVEcV58E/BG6pw+bLsOEL9QtCAi7IKzy6fl7?=
 =?us-ascii?Q?abmKMe5OAJ/ICgLeYzzqMhjVuyQJAXelMtcvJqz+4jHF88Wh0WE4ecNiErCv?=
 =?us-ascii?Q?FyLkwlmVWWWYrPPtS5FigIHOFLbM1Sc1KwZCHtLEkJQWwmk6gPNHivtaVmy+?=
 =?us-ascii?Q?hBkqmA5rcWqGChvISz28mqbN3LjXWawM0YczEDk6O9oA81utWsWv0Awdi+dQ?=
 =?us-ascii?Q?1nvCRd+XwuwNwRwP+QTKtdXYtMDfCp8pIdcVZzvPQiXKs6Jnax0bks+Gv1KY?=
 =?us-ascii?Q?D1P4ESnGKTS00h9PCHGKfZXx1gOgtvzmxi/K2lDTDwBTOwmpwEmgB5w2ZstY?=
 =?us-ascii?Q?HhVbWIKkkfCKBnHT8arKQ2/laJyp/pknBqqCIGiWLHUqB4QoXtnOtrG7cbn4?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 800cb4d2-9654-462d-2925-08dc298d0d16
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 16:34:56.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbZiTE8dsE79Csa6JDYzO7Q0qd2FVMffMsmLY5gcHbAp/hoyAERvpk5gfeEYzYS25rvBs1WDUeH1mat+0c0Ojg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5100
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   d5132d176d6f21742ac67fd311ccc61fe830e999
commit: 54a372cc10ac77a6fd8e2e57a72d3d43be9e292c [19/19] dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
:::::: branch date: 11 hours ago
:::::: commit date: 14 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240209/202402090901.PJ4OjZCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402090901.PJ4OjZCB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/display/atmel/atmel,hlcdc-display-controller.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

