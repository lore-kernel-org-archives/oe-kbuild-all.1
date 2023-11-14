Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264C1440F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 00:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtbEC+QP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699923303; x=1731459303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8DMfjwgYMLc2z/b5Ivg/+k7stmebF1/wjLBNfju1Ws=;
  b=WtbEC+QPzzSyqLsDhRNxm1CzdM4m0Oa/A5BFMdwf0MclzhkgdzwkVXmQ
   NfWC5EJjcAg3ZSr8BgT/oe9F/mdHB/DXaY1uvLrlHbtBeMzl7Gi1EBpNI
   bc6kVqKktHylG32hyqrPpBFMI7NAF2biizHmxmknyCugHplnTrsNQ3ueE
   HtSzajN6Ac1OTV+qMgnQDcTVCCX/i9HY4tdG8W1LZgGOSIxLXA3i4SrFh
   Ou7PEPJ2NkvDCCkaT4OTYg76de54NXkAt2gf8FIQpteEWnZq8wsxxT+sI
   C818RSI5DKWHgjF2zGtGsJBcALUNK9kV9Khi5VZ8xyIwJdC5a+KJEqzEf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375573376"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="375573376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 16:55:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5827696"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 16:55:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 16:55:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 16:55:00 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 16:55:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 16:55:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xbjyn+UukHk29unDfFkZB4Bb6MN5IuCt3cVIC5OiD93rpVvA92K+rCA76nbx85BUeXL9OgIeHTbfjeqQ19xAGQJXZOr8lY5hf0D/cvWQax0fSFNdTgzJNHjtKI4p1wEEg55/lO9oQ5iohI1MGYUudpWdR4LSpQNjkeuIoic84p9zfv5XBVipUPL9xSA2gF3izicujq1W4VSaVjriKN+A4CkuH5WMYy5X9Y815+W2mLTf0c+rErl1Dc2v+jlTVQNvUzz9gl5g68NMBkeYrPx/TACeCXxEhQegd7E24qjziDfj80JDlDuNXm2N55hfL7DOabKWbSzQAYJv16CoY8L23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYlfEfFnHFcennZj/NQDaAiTgjtP7gZDY9wIBZv1ruo=;
 b=cEMuD2/PuHe674/FXAAP5rGf58GPKZ5u3UcNuMlaoP2bgb0yoWtPsGIeYP5Vr6IYDzKGYSZIfBq+cMcxvEmh7hSOOVKRWqKeb31eEZYao72qzeqDoHNZ8M7ROdHP+RtskkUdsiW6/1Cxg19gNPt4ZJJrI/XihRwjE7z/6FTqVATuqMnmlu+JzEOKC3COiS7yFH6i1HdfOFBoeyX8FMLecOA1gHHstgt1r3FgJX2S/3UtrHJb43hR9lGeTcvaLCcxFOC3yCnqHmcfN5sQiVQB+KFU6TB8tCYzkGTIyKxnGGb59UYaO0IAudEaNuCJMgll6VIoNqFMJwMfPlSQqH3DGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.28; Tue, 14 Nov 2023 00:54:58 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2f1a:e62e:9fff:ae67]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2f1a:e62e:9fff:ae67%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 00:54:57 +0000
Date: Tue, 14 Nov 2023 08:54:49 +0800
From: kernel test robot <philip.li@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: <oe-kbuild-all@lists.linux.dev>, Sebastian Reichel <sre@kernel.org>, Algea
 Cao <algea.cao@rock-chips.com>
Subject: [sre-misc:rk3588 31/37]
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:488:6: warning: no previous
 prototype for 'dw_hdmi_qp_set_audio_infoframe'
Message-ID: <ZVLFWUaRU5mdCRLr@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|DS7PR11MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd054b8-4e8e-46a8-b2de-08dbe4ac52ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: np/T2/vPPfD6SeURWwWnjgKwHziwtkTEoE/5wCHa+tvI2T3BwklUjoKfu6MB6fAjyIdhITxCKtiQietpezCh5Syd79YR2nvgd0oeu4HvOzhOBip+Gjmj3XqCL8ZeQKb9HqfetfDAUlrd/1spr9mo5yDeowZMDpk1k1OHAzEmVembNlH/C4e1rajePVwCKzJZs3c7S6ZbMZB3tX0n3lBF+IMsUVpNCy2Po4HuAZOy6bc2XX+1jW36W5JRw3/eKkDFco5UD1mGW4CtqX3ZpAsNjYMgf1eKeIVNKgjOb3WgkI2u5xC49t8+72pPR/EmKxKCB+Df+XEovUZUnFlYTV5B52yz8QpjpqtUGQuWxxHJZuauG+uAnh1qBSS7LCc3+ghJcGL4fgbelzPeUKhoY5HL8t7yhvO+bW9aHlHvH+QfXSKRaXEaBsJlCUYwjDonDC30DnLRiO3ozdj7Ar9f9vpiVTr1uC5XvAfKa9rDWHBQPmHgEhU1c36QE5+CKss8xGkS4WK/Q5dHCF8QS96S7mmgeH27gexsVJNxncyTOLo7fcPwKieAeJqSRmXJwJ0kcW8k/qMTpyKGal3y/WAzcEkzTvj8tD3S7VUifMdu6xBxZ9b4EtnNU+SH510ajDmPEuhywEFs9HOffPbCkeXvAFsg6VJ+CIfsmElEgaqm3NiA1u2rJe0JIfbLUQWEOGKwKQJT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(376002)(136003)(396003)(366004)(346002)(230173577357003)(230922051799003)(230273577357003)(186009)(451199024)(1800799009)(64100799003)(33716001)(26005)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(6512007)(6506007)(9686003)(2013699003)(478600001)(6486002)(966005)(6666004)(66946007)(316002)(66476007)(66556008)(6916009)(54906003)(2906002)(8676002)(4326008)(8936002)(30864003)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5VlAWOpnYrLN3PWQMiCqPk7d4kDc+ik46dJ2HMYeA98UvHNrk20l0HZSwvlf?=
 =?us-ascii?Q?kIH/GiW2fhsfbC9JrJaHzDULMGH4IOfjqtRBMEkXN4buCvAdoO+l5DSjcB0I?=
 =?us-ascii?Q?Ob6/b99kXVP8st9sChI+ApyGJ50dPuDOvI43fXVQopumZGXngmYymNZWLniR?=
 =?us-ascii?Q?GI8O6CUsxVbaVYyJvxFVndcbnEixKkOkdcU2ngCxktPDb/6MhTfIWcR4Fd0t?=
 =?us-ascii?Q?YRM+Mo5ejnvp2YtpbR6nPz1HpArCgVDn6CyByza9VgbhwUaGsni/WGsHbS+c?=
 =?us-ascii?Q?7XrtPTds3/HI7Nb8MSDCY85ct7rJZLXpbkCz7ShylYbZBG5kpkhRzNhsKdRY?=
 =?us-ascii?Q?M/TYrjyeJV9sbel1glO/1d93ACEcEcMpuEGTeHgt4gqS5GF5vsyI41gnKYr+?=
 =?us-ascii?Q?Yse7OJSv++q6NqwPQD3tC8SbgLKD2UG1W96JhO6J0L5/QySy1bdKDXK5rHpm?=
 =?us-ascii?Q?LRNBQ1hSALHpK/9Woc/4U/eg1PQsYyN2q/Yl4mB1JMSrreUZq0TaW/8dZIEa?=
 =?us-ascii?Q?9IAywHwebqYUMOneG1lQU7wNfgsO5M0cDTjezc4B7J+zROUfCwAvCILSyfLg?=
 =?us-ascii?Q?ktMg3AdmeOu8GPyy6fSg5T4eQT0naqvoOu1UKJ8hrfphjNiSgOJU/RxjcbBF?=
 =?us-ascii?Q?JmQ6CpOfb68JFb4jMtTO0GYj0324SgDYgS42F5TUbXWfEmbTT4Gz/ESwMzPQ?=
 =?us-ascii?Q?+4VLopw8A0mS2zvvYYYY6Oq4SpAsBTEQHkSWPnp9bKkFCQ3kmaHnFlIoH29B?=
 =?us-ascii?Q?7v5/s20A2ntsP7zIyumT6PqMg/SWe3wbkJ3rC2zq6E9zhp0UxnDpbsUazKvG?=
 =?us-ascii?Q?CDPVnqIu24sA5Y6RzLkiWAr7FiLLIcqRcCmuHLQKa3y8prIp0ngQmxDs2YoY?=
 =?us-ascii?Q?Tg1yvPZCfAEJyK/vaq4Z2Wv9+8fvvyX8A0pS6vz2LbWr2pbCNk8vBr5XwfGX?=
 =?us-ascii?Q?zpE7By28MTEVxyCA1/FLyvfQusxi5iUkqidVsNSwSPvSxyn/8OkkOLw4xmm2?=
 =?us-ascii?Q?Jf7CABVoPjDtjo8BCHwjdioTZQw5CwulJeSkwU9iW2/D8Oc1LWoZ6pJOQLbY?=
 =?us-ascii?Q?GbbJ75359Yr0Hh0jYYO+K0CdSYkK4RoiYGup6XOddtB4gisWgMeEkD3iijAX?=
 =?us-ascii?Q?FWpM4s3EBMlxGlzEhAqEDtWHBnMJrRJd214tKshnnuX3H75skRovbUd3suhF?=
 =?us-ascii?Q?fuDIat44BjUxUUMUhC2z6lojxO8bBgPAsVuPD9hZAL0QuloNlC+dk4mcV+pV?=
 =?us-ascii?Q?rw/x9ScjAYRh6gDQ/IYasrPZ7uOv9N1U7sQ3YxoezHsa+/RfZHUj5kDCwWMA?=
 =?us-ascii?Q?aqFpzNUOu6FIUMfxs1EZXiT18NuXMyvDNtQJfro/K8AizNItwDhqJpWo8JM5?=
 =?us-ascii?Q?absiRMy5ykXOZKY3dqKUG4ErmxJtfi7Jerk734LW8bcfy9oi9ZXJOwaM17PH?=
 =?us-ascii?Q?8f28GLcI2sCyQpbu1xhowfeonU/VFKsG8a1/5+6t1t81jOSUsQ/lsO9PphFs?=
 =?us-ascii?Q?JQCsJD5Sv4VoS1u52874XIJVwwWtDDUs3scKOg0hlzXvpoXYUPSG9EGuuaTP?=
 =?us-ascii?Q?JhbDLdDk0hj+kl9fpCuIS7pcKLtHJn+SsQCcc99w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd054b8-4e8e-46a8-b2de-08dbe4ac52ba
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 00:54:57.9782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7JhE7VKjB4Ah0q4439uHJZ4ZLmFVNo642sd08TUrtEedHHsoSBCDHSZQ4O7D1vP7nCHqXguiVeP3HQZytpptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   f41b3e9a9d7f22bef0735b4fe0007321ce6b6d6b
commit: 171fd53717525f0f6dc56e90e6f38a9038c5c779 [31/37] drm/bridge: synopsys: Add initial support for DW HDMI QP TX Controller
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: csky-randconfig-002-20231113 (https://download.01.org/0day-ci/archive/20231113/202311132319.bZOYf5Rs-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311132319.bZOYf5Rs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311132319.bZOYf5Rs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:488:6: warning: no previous prototype for 'dw_hdmi_qp_set_audio_infoframe' [-Wmissing-prototypes]
     488 | void dw_hdmi_qp_set_audio_infoframe(struct dw_hdmi_qp *hdmi,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:566:6: warning: no previous prototype for 'dw_hdmi_qp_audio_enable' [-Wmissing-prototypes]
     566 | void dw_hdmi_qp_audio_enable(struct dw_hdmi_qp *hdmi)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:578:6: warning: no previous prototype for 'dw_hdmi_qp_audio_disable' [-Wmissing-prototypes]
     578 | void dw_hdmi_qp_audio_disable(struct dw_hdmi_qp *hdmi)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:2135:6: warning: no previous prototype for 'dw_hdmi_qp_set_cec_adap' [-Wmissing-prototypes]
    2135 | void dw_hdmi_qp_set_cec_adap(struct dw_hdmi_qp *hdmi, struct cec_adapter *adap)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:2284:6: warning: no previous prototype for 'dw_hdmi_qp_cec_set_hpd' [-Wmissing-prototypes]
    2284 | void dw_hdmi_qp_cec_set_hpd(struct dw_hdmi_qp *hdmi, bool plug_in, bool change)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/dw_hdmi_qp_set_audio_infoframe +488 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c

171fd53717525f Cristian Ciocaltea 2023-11-01  487  
171fd53717525f Cristian Ciocaltea 2023-11-01 @488  void dw_hdmi_qp_set_audio_infoframe(struct dw_hdmi_qp *hdmi,
171fd53717525f Cristian Ciocaltea 2023-11-01  489  				    struct hdmi_codec_params *hparms)
171fd53717525f Cristian Ciocaltea 2023-11-01  490  {
171fd53717525f Cristian Ciocaltea 2023-11-01  491  	u8 infoframe_buf[HDMI_INFOFRAME_SIZE(AUDIO)];
171fd53717525f Cristian Ciocaltea 2023-11-01  492  	int ret = 0;
171fd53717525f Cristian Ciocaltea 2023-11-01  493  
171fd53717525f Cristian Ciocaltea 2023-11-01  494  	ret = hdmi_audio_infoframe_pack(&hparms->cea, infoframe_buf,
171fd53717525f Cristian Ciocaltea 2023-11-01  495  					sizeof(infoframe_buf));
171fd53717525f Cristian Ciocaltea 2023-11-01  496  	if (!ret) {
171fd53717525f Cristian Ciocaltea 2023-11-01  497  		dev_err(hdmi->dev, "%s: Failed to pack audio infoframe: %d\n",
171fd53717525f Cristian Ciocaltea 2023-11-01  498  			__func__, ret);
171fd53717525f Cristian Ciocaltea 2023-11-01  499  		return;
171fd53717525f Cristian Ciocaltea 2023-11-01  500  	}
171fd53717525f Cristian Ciocaltea 2023-11-01  501  
171fd53717525f Cristian Ciocaltea 2023-11-01  502  	mutex_lock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  503  	if (!hdmi->dclk_en) {
171fd53717525f Cristian Ciocaltea 2023-11-01  504  		mutex_unlock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  505  		return;
171fd53717525f Cristian Ciocaltea 2023-11-01  506  	}
171fd53717525f Cristian Ciocaltea 2023-11-01  507  
171fd53717525f Cristian Ciocaltea 2023-11-01  508  	/*
171fd53717525f Cristian Ciocaltea 2023-11-01  509  	 * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
171fd53717525f Cristian Ciocaltea 2023-11-01  510  	 * AUDI_CONTENTS1: { PB3, PB2, PB1, PB0 }
171fd53717525f Cristian Ciocaltea 2023-11-01  511  	 * AUDI_CONTENTS2: { PB7, PB6, PB5, PB4 }
171fd53717525f Cristian Ciocaltea 2023-11-01  512  	 *
171fd53717525f Cristian Ciocaltea 2023-11-01  513  	 * PB0: CheckSum
171fd53717525f Cristian Ciocaltea 2023-11-01  514  	 * PB1: | CT3    | CT2  | CT1  | CT0  | F13  | CC2 | CC1 | CC0 |
171fd53717525f Cristian Ciocaltea 2023-11-01  515  	 * PB2: | F27    | F26  | F25  | SF2  | SF1  | SF0 | SS1 | SS0 |
171fd53717525f Cristian Ciocaltea 2023-11-01  516  	 * PB3: | F37    | F36  | F35  | F34  | F33  | F32 | F31 | F30 |
171fd53717525f Cristian Ciocaltea 2023-11-01  517  	 * PB4: | CA7    | CA6  | CA5  | CA4  | CA3  | CA2 | CA1 | CA0 |
171fd53717525f Cristian Ciocaltea 2023-11-01  518  	 * PB5: | DM_INH | LSV3 | LSV2 | LSV1 | LSV0 | F52 | F51 | F50 |
171fd53717525f Cristian Ciocaltea 2023-11-01  519  	 * PB6~PB10: Reserved
171fd53717525f Cristian Ciocaltea 2023-11-01  520  	 *
171fd53717525f Cristian Ciocaltea 2023-11-01  521  	 * AUDI_CONTENTS0 default value defined by HDMI specification,
171fd53717525f Cristian Ciocaltea 2023-11-01  522  	 * and shall only be changed for debug purposes.
171fd53717525f Cristian Ciocaltea 2023-11-01  523  	 * So, we only configure payload byte from PB0~PB7(2 word total).
171fd53717525f Cristian Ciocaltea 2023-11-01  524  	 */
171fd53717525f Cristian Ciocaltea 2023-11-01  525  	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &infoframe_buf[3], 2);
171fd53717525f Cristian Ciocaltea 2023-11-01  526  
171fd53717525f Cristian Ciocaltea 2023-11-01  527  	/* Enable ACR, AUDI, AMD */
171fd53717525f Cristian Ciocaltea 2023-11-01  528  	hdmi_modb(hdmi,
171fd53717525f Cristian Ciocaltea 2023-11-01  529  		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
171fd53717525f Cristian Ciocaltea 2023-11-01  530  		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
171fd53717525f Cristian Ciocaltea 2023-11-01  531  		  PKTSCHED_PKT_EN);
171fd53717525f Cristian Ciocaltea 2023-11-01  532  
171fd53717525f Cristian Ciocaltea 2023-11-01  533  	/* Enable AUDS */
171fd53717525f Cristian Ciocaltea 2023-11-01  534  	hdmi_modb(hdmi, PKTSCHED_AUDS_TX_EN, PKTSCHED_AUDS_TX_EN, PKTSCHED_PKT_EN);
171fd53717525f Cristian Ciocaltea 2023-11-01  535  	mutex_unlock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  536  }
171fd53717525f Cristian Ciocaltea 2023-11-01  537  EXPORT_SYMBOL_GPL(dw_hdmi_qp_set_audio_infoframe);
171fd53717525f Cristian Ciocaltea 2023-11-01  538  
171fd53717525f Cristian Ciocaltea 2023-11-01  539  static void hdmi_enable_audio_clk(struct dw_hdmi_qp *hdmi, bool enable)
171fd53717525f Cristian Ciocaltea 2023-11-01  540  {
171fd53717525f Cristian Ciocaltea 2023-11-01  541  	if (enable)
171fd53717525f Cristian Ciocaltea 2023-11-01  542  		hdmi_modb(hdmi, 0,
171fd53717525f Cristian Ciocaltea 2023-11-01  543  			  AVP_DATAPATH_PACKET_AUDIO_SWDISABLE, GLOBAL_SWDISABLE);
171fd53717525f Cristian Ciocaltea 2023-11-01  544  	else
171fd53717525f Cristian Ciocaltea 2023-11-01  545  		hdmi_modb(hdmi, AVP_DATAPATH_PACKET_AUDIO_SWDISABLE,
171fd53717525f Cristian Ciocaltea 2023-11-01  546  			  AVP_DATAPATH_PACKET_AUDIO_SWDISABLE, GLOBAL_SWDISABLE);
171fd53717525f Cristian Ciocaltea 2023-11-01  547  }
171fd53717525f Cristian Ciocaltea 2023-11-01  548  
171fd53717525f Cristian Ciocaltea 2023-11-01  549  // static void dw_hdmi_i2s_audio_enable(struct dw_hdmi_qp *hdmi)
171fd53717525f Cristian Ciocaltea 2023-11-01  550  // {
171fd53717525f Cristian Ciocaltea 2023-11-01  551  // 	hdmi_set_cts_n(hdmi, hdmi->audio_cts, hdmi->audio_n);
171fd53717525f Cristian Ciocaltea 2023-11-01  552  // 	hdmi_enable_audio_clk(hdmi, true);
171fd53717525f Cristian Ciocaltea 2023-11-01  553  // }
171fd53717525f Cristian Ciocaltea 2023-11-01  554  //
171fd53717525f Cristian Ciocaltea 2023-11-01  555  // static void dw_hdmi_i2s_audio_disable(struct dw_hdmi_qp *hdmi)
171fd53717525f Cristian Ciocaltea 2023-11-01  556  // {
171fd53717525f Cristian Ciocaltea 2023-11-01  557  // 	/* Disable AUDS, ACR, AUDI, AMD */
171fd53717525f Cristian Ciocaltea 2023-11-01  558  // 	hdmi_modb(hdmi, 0,
171fd53717525f Cristian Ciocaltea 2023-11-01  559  // 		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDS_TX_EN |
171fd53717525f Cristian Ciocaltea 2023-11-01  560  // 		  PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
171fd53717525f Cristian Ciocaltea 2023-11-01  561  // 		  PKTSCHED_PKT_EN);
171fd53717525f Cristian Ciocaltea 2023-11-01  562  //
171fd53717525f Cristian Ciocaltea 2023-11-01  563  // 	hdmi_enable_audio_clk(hdmi, false);
171fd53717525f Cristian Ciocaltea 2023-11-01  564  // }
171fd53717525f Cristian Ciocaltea 2023-11-01  565  
171fd53717525f Cristian Ciocaltea 2023-11-01 @566  void dw_hdmi_qp_audio_enable(struct dw_hdmi_qp *hdmi)
171fd53717525f Cristian Ciocaltea 2023-11-01  567  {
171fd53717525f Cristian Ciocaltea 2023-11-01  568  	mutex_lock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  569  	if (hdmi->dclk_en) {
171fd53717525f Cristian Ciocaltea 2023-11-01  570  		hdmi->audio_enable = true;
171fd53717525f Cristian Ciocaltea 2023-11-01  571  		if (hdmi->enable_audio)
171fd53717525f Cristian Ciocaltea 2023-11-01  572  			hdmi->enable_audio(hdmi);
171fd53717525f Cristian Ciocaltea 2023-11-01  573  	}
171fd53717525f Cristian Ciocaltea 2023-11-01  574  	mutex_unlock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  575  }
171fd53717525f Cristian Ciocaltea 2023-11-01  576  EXPORT_SYMBOL_GPL(dw_hdmi_qp_audio_enable);
171fd53717525f Cristian Ciocaltea 2023-11-01  577  
171fd53717525f Cristian Ciocaltea 2023-11-01 @578  void dw_hdmi_qp_audio_disable(struct dw_hdmi_qp *hdmi)
171fd53717525f Cristian Ciocaltea 2023-11-01  579  {
171fd53717525f Cristian Ciocaltea 2023-11-01  580  	mutex_lock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  581  	if (hdmi->dclk_en) {
171fd53717525f Cristian Ciocaltea 2023-11-01  582  		hdmi->audio_enable = false;
171fd53717525f Cristian Ciocaltea 2023-11-01  583  		if (hdmi->disable_audio)
171fd53717525f Cristian Ciocaltea 2023-11-01  584  			hdmi->disable_audio(hdmi);
171fd53717525f Cristian Ciocaltea 2023-11-01  585  	}
171fd53717525f Cristian Ciocaltea 2023-11-01  586  	mutex_unlock(&hdmi->audio_mutex);
171fd53717525f Cristian Ciocaltea 2023-11-01  587  }
171fd53717525f Cristian Ciocaltea 2023-11-01  588  EXPORT_SYMBOL_GPL(dw_hdmi_qp_audio_disable);
171fd53717525f Cristian Ciocaltea 2023-11-01  589  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

