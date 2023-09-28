Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC5D20F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 06:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695882378; x=1727418378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FWqf7Lduq3bVazs0jP+BKnJFJjiqrqRa91oripTqmzI=;
  b=DtMYPhWMV908W255WOohq1UpDGtInuEJ9Cd2wesurP6uqA8WhzXmbpB6
   RnN5forXlaEXLmvByaWAGPO3C2ZL7lAEpJDuSUR5MfZWzUz6LxnIe/ZmN
   G1mkOyT8Tq6wqa+Yo6kBTpeCobR11melCxBAfdkuhfOuXedH2/6L7Iley
   E2j9zplrBvOjyB+mqhv2mJxIU01uIxV0GkqoCGIUWB2hLWKzYi/fhLiHj
   NdUJlEIIxa+wXfwe/jBre2FVHWBp2m+Ae3LjCcsbWGoczsOUxRBnmW6YZ
   WIGFf9tWWxLyDVG0ozjP4Em+nRCQqBtMNsRftKk6D3hHuDqBPlc794Zp9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="446140404"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="446140404"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 23:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="726123331"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="726123331"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 23:26:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 23:26:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 23:26:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 23:26:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 23:26:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCJ2+iovU3lB/NRBvKXW4kzllzySDJuQ7v7Hs1QduV5XEpY8MK1nxUwudmITlDtNBXOU6wjuJnVDWbBqWObHpMuPlR+o5Wf+qAUGK5/eVjGxNaS5fr2rcpODjTcbFvo/KthfmQiKE5nP0wCCVXU39HIPPIGHD1xj6Wr8fq+swJQtPUP3utl1WTuP1hCRoQx3gJbObJcVkiJL34eK+7PQc15/KBZNK5fHLXTRftrxoitnnHZiA8hnFz9c+jkhgrvbnXAvYAbQLVjYS7INRRWrD8HdEdddg7vKrQUuuDlKHfsQbaUObQwJtYdmRjvMxffJLI3yTv9PPV32Oi7HLMN2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhWgRRe90jummy3aFoFbnhiud20TiRWZwa9PBSsh3jc=;
 b=ZSWP+TIBNEo+f8cxbPKwyB3R9wDqZrOffCCGOgP3XFPqjelHBWc74VhIiZYXDaYc+kg9BXLfzPMv2NDDIZVne2GhLtQwsSvF3DwlSP5k+sOKwsvruluWDrUYVYHV4x1HFWvmbyZ7EjH3rUnNtAwje/MZNFR/1iMbhzYUvZSJDNxySP+XT5wJNKPAkPoiu9JLusG/YkDXJIgwfnGdDf2yX/qhgN8lQp6KbF2obZ04R+aRNOPy0lZLFAB4hxCWuJb++mXT+ua0qOq1sw4iAwJg3snKhVp68X+eVo7TnEjEzfyDHvD3/0G4/GZJnRgGA6fFAxfdsVie4DO5UwZG3MVR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB8599.namprd11.prod.outlook.com (2603:10b6:510:2ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 06:26:07 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6792.026; Thu, 28 Sep 2023
 06:26:07 +0000
Date: Thu, 28 Sep 2023 14:21:08 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Walker Chen <walker.chen@starfivetech.com>
CC: <oe-kbuild-all@lists.linux.dev>, Jenny Zhang
	<jenny.zhang@starfivetech.com>, Walker Chen <walker.chen@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 46/52] checkpatch: WARNING: struct
 snd_soc_component_driver should normally be const
Message-ID: <202309251001.DRqCwwiR-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGBP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::16)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH7PR11MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e5c897-857c-4327-3032-08dbbfebcca7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2APz+xbra4g0/1aeTjS1gzDLuxVZirJs7rOAOgzt+P6TRreFDBnhLKLi6rDrBFYgplKQ4xoom8TOoRT1Yj/bjDE/5NysVID9j8CVnrFHvQZvs0LakrEVvubxeNWDtz5HHzgOwSljpqmeUbPUXS6pWO9vBqa/3CDWxYhTRiodJTujAbCONnf7wflI5oyghhs90Kf31sBxbV4OHXphdRpjWU5eOHekt4EOnEyg+kMrrkbNdGQp2TcehL8ZvrJcD3IebS3AC82D4/OP2wmvuCakljmd/2uApc7y5LOFrwOI2Mh7+/X1HUf7oKoIo4B+SCdnKHNDd81m1lWVf2TqFUwxR/FB1uyjodW9OWumQtpj5a+xEWAz0jV4GLOR+idwfjqcKpXM+Xa97rCF/iky/B0QVhzHp/kslvTK6V+7AwkVLBmfkD8E7k437yT69/dQbh1gKUqaT/Nj4ihKKyyg56hF4UXUSA5bYT4aMdv7f/9ThGggMZmnSBUrkWI2g1pGoB+9df9BmLyhOlSJGv8GuNpaQtJv/Tk8T2NPrdPE+5HiG1LwwkR8Or6YfEaGhisyBe6dqjRJR9bB5bOzcs9t/b7QSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(136003)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(478600001)(6506007)(6486002)(966005)(38100700002)(82960400001)(86362001)(6512007)(2906002)(41300700001)(83380400001)(8676002)(2616005)(26005)(1076003)(6916009)(36756003)(316002)(30864003)(66556008)(5660300002)(66476007)(66946007)(8936002)(54906003)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/GkWYz7CUfpWZNiOyJN+L38D7EJskTm5j57Y4MH7z8ncl0TrDrEcCcayOnoX?=
 =?us-ascii?Q?ML0fAjCgvFsEvauaS5sJFimb0T+cuhB/Q74G/lCzRTFQomBlHvtqoKKMZBio?=
 =?us-ascii?Q?P4aYAn42jX5bPCxA9RgDeNNRtEjJFNKQV1hFNIyWQcEQNpCIqcGPIL+7yQHD?=
 =?us-ascii?Q?Hc60vn3KKmrDq/ZfzqCqnc+RLjW6W90YtCUlS1lB44fE2iG2E/YfOqiDHvIg?=
 =?us-ascii?Q?hJnH+0P7389otJJnybNv+pb4iRtMNcHmFWDWIz6J80FwmcEeXGCZHc8K50lL?=
 =?us-ascii?Q?j8Ba7WRQ+PrL9CAHwQxyzcUFAMtoPeW0BjhTuooKCh7DZFQZYpN/G4WqQJVE?=
 =?us-ascii?Q?NsJNw7tJHqQfurQtcOSUHU4SetEboh1myicYMCDa5pIaBp0DYSdhglZ/wJhS?=
 =?us-ascii?Q?04O0nvGi6zOQNCmQoVGcNh00zk00Dt30xZsI9T0wJ4ralaq1D/r9RJj3kkFb?=
 =?us-ascii?Q?ZCrBJU3XV1BUE4ksqxX9TwQhNWmtgUu3CmXr28qeu2IwYlpbWy/7CUTzh1a1?=
 =?us-ascii?Q?kCq3SQzTHjy7tLaxh/vOU6JetrfMNrh8x03C9bZypNqEsDLfOoyaya5n09Vr?=
 =?us-ascii?Q?71qLpnCwZJlOQX8SCYF0FfbQYSoZx22ZZOby1nIKVgq0BYk2Edh8tFhioORp?=
 =?us-ascii?Q?XWVrhXuufQhU+45vjlCfOkEvnIWQwu0nWX3zV1xCnfPJ+kdRrGYctWj7W2/3?=
 =?us-ascii?Q?mswgXOepu1M7QZdwdhCA3ZiFyF3CPx9UiE6tEauXAmADre8kYtZvYF5cBatq?=
 =?us-ascii?Q?H5mDxfrEhm/PElGsm/yvL02u1jPZ26F1VWLFvagQrc4RpfxEYoByurt+qEcG?=
 =?us-ascii?Q?pD1EFe0h5zCJKXFtz2sIsWQieAqGxhLzKYvlosh5T9VE5XIc22Qu5MtJ1RHc?=
 =?us-ascii?Q?BRJjP5g1MzgcwH2GPvqM5q21hLj24ItfqSjoXKuS3gdcY3Hp5prSQ9NP3id+?=
 =?us-ascii?Q?VYrvJLgJcx5FtJw376c4+0li+AFhWvkzikjnggwLWl7p4EP/iMG50Ydmhu+a?=
 =?us-ascii?Q?TkfXIP2uOzB9L6DbmGPJdow16/PxLVEkt16q+Z7lbPRchNOAffblINSEi352?=
 =?us-ascii?Q?IsBBGen4tjH1XdHjQucXhtNvVbX7DfvBDhMqS+pglK7L3u0OQSum0rMRlfx4?=
 =?us-ascii?Q?bBFjRQN7LiNRmYenJBfoGGfK3Eut3bbPnGmZM42Hfoec3H66ot+3/r9Hfr4y?=
 =?us-ascii?Q?KQ6xQsd2ZVIj43ldbBIy/jfm9k3wtwTqHVTAXRFa43FyaMY9hOdsh+Au6CPU?=
 =?us-ascii?Q?KVbKJFuRgPaardTwlQlMH86UxhmGgdlbyPJTZztuWFI8MSW2DsKQc2On8SH5?=
 =?us-ascii?Q?KUOknSNo9r4Kf+4cV1ny7LZfZ4Sm+P5OSPgap5TJj5lee2oSyvvZx+63wcbR?=
 =?us-ascii?Q?iqsEl+lb/8Q1QFt3qPZdssYfJnxmTB4EsajKTmrnkPN9citzVhs5qAJz3IYT?=
 =?us-ascii?Q?W7xDUlEK0itUvd7cgfQ9/jSsms0ZCXRiU4lef2aLoMpCA1n5HQuQIk8mLwXP?=
 =?us-ascii?Q?zpc3tcv6zRcXw6qv+xaD2M0kvBP75TPeqPD1lu9c1Y/6t3xnGIszL5YcyBJE?=
 =?us-ascii?Q?+osH9GpD1NGc8xFqGyKEkI+5O7gF5vuMuVAuvGJv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e5c897-857c-4327-3032-08dbbfebcca7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 06:26:07.7624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQOca9mpG2vqy597bfgjiIY462da+AhZCM8+Jw2TI/Z169IQvFR+OjVf4++H4rTvoRi367UfXd7TRp0tKEEGrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8599
X-OriginatorOrg: intel.com

tree:   https://github.com/esmil/linux visionfive
head:   c727f594ac6d4d500eed929fe3bb1d6d90880662
commit: da4ed475b10c0c5728df9bf9159ec89ac06dbc59 [46/52] ASoC: starfive: Add StarFive JH7100 audio drivers
reproduce: (https://download.01.org/0day-ci/archive/20230925/202309251001.DRqCwwiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202309251001.DRqCwwiR-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR: space required after that ',' (ctx:VxV)
#453: sound/soc/starfive/i2svad.c:49:
+	u32 sp_value,sp_en;
 	            ^

ERROR: space required after that ',' (ctx:VxV)
#454: sound/soc/starfive/i2svad.c:50:
+	u32 sl_value,sl_en;
 	            ^

ERROR: space required after that ',' (ctx:VxO)
#456: sound/soc/starfive/i2svad.c:52:
+	regmap_read(vad->vad_map, VAD_SPINT,&sp_value);
 	                                   ^

ERROR: space required before that '&' (ctx:OxV)
#456: sound/soc/starfive/i2svad.c:52:
+	regmap_read(vad->vad_map, VAD_SPINT,&sp_value);
 	                                    ^

ERROR: space required after that ',' (ctx:VxO)
#457: sound/soc/starfive/i2svad.c:53:
+	regmap_read(vad->vad_map, VAD_SPINT_EN,&sp_en);
 	                                      ^

ERROR: space required before that '&' (ctx:OxV)
#457: sound/soc/starfive/i2svad.c:53:
+	regmap_read(vad->vad_map, VAD_SPINT_EN,&sp_en);
 	                                       ^

ERROR: space required before the open brace '{'
#458: sound/soc/starfive/i2svad.c:54:
+	if (sp_value&sp_en){

ERROR: space required after that ',' (ctx:VxO)
#466: sound/soc/starfive/i2svad.c:62:
+	regmap_read(vad->vad_map, VAD_SLINT,&sl_value);
 	                                   ^

ERROR: space required before that '&' (ctx:OxV)
#466: sound/soc/starfive/i2svad.c:62:
+	regmap_read(vad->vad_map, VAD_SLINT,&sl_value);
 	                                    ^

ERROR: space required after that ',' (ctx:VxO)
#467: sound/soc/starfive/i2svad.c:63:
+	regmap_read(vad->vad_map, VAD_SLINT_EN,&sl_en);
 	                                      ^

ERROR: space required before that '&' (ctx:OxV)
#467: sound/soc/starfive/i2svad.c:63:
+	regmap_read(vad->vad_map, VAD_SLINT_EN,&sl_en);
 	                                       ^

ERROR: space required before the open brace '{'
#468: sound/soc/starfive/i2svad.c:64:
+	if (sl_value&sl_en){

ERROR: space required after that ',' (ctx:VxV)
#475: sound/soc/starfive/i2svad.c:71:
+static int vad_trigger(struct vad_params *vad,int cmd)
                                              ^

ERROR: that open brace { should be on the previous line
#483: sound/soc/starfive/i2svad.c:79:
+		if(vad->vswitch)
+		{

ERROR: space required before the open parenthesis '('
#483: sound/soc/starfive/i2svad.c:79:
+		if(vad->vswitch)

ERROR: that open brace { should be on the previous line
#975: sound/soc/starfive/i2svad.c:571:
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	{

ERROR: space required after that ',' (ctx:VxV)
#977: sound/soc/starfive/i2svad.c:573:
+		vad_trigger(&(dev->vad),cmd);
 		                       ^

WARNING: DT compatible string "starfive,sf-i2svad" appears un-documented -- check ./Documentation/devicetree/bindings/
#1420: sound/soc/starfive/i2svad.c:1016:
+	{ .compatible = "starfive,sf-i2svad", },

WARNING: Improper SPDX comment style for 'sound/soc/starfive/i2svad.h', please use '/*' instead
#1453: sound/soc/starfive/i2svad.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#1453: sound/soc/starfive/i2svad.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: 'interrup' may be misspelled - perhaps 'interrupt'?
#1526: sound/soc/starfive/i2svad.h:74:
+#define VAD_SPINT_CLR				0x860  /* clear vad_spint interrup status*/
                      				                          ^^^^^^^^

WARNING: 'interrup' may be misspelled - perhaps 'interrupt'?
#1528: sound/soc/starfive/i2svad.h:76:
+#define VAD_SLINT_CLR				0x868  /* clear vad_slint interrup status*/
                      				                          ^^^^^^^^

WARNING: please, no space before tabs
#1722: sound/soc/starfive/pdm.c:18:
+#define AUDIOC_CLK ^I(12288000)$

WARNING: please, no space before tabs
#1723: sound/soc/starfive/pdm.c:19:
+#define PDM_MUL ^I(128)$

ERROR: space required after that ',' (ctx:VxV)
#1746: sound/soc/starfive/pdm.c:42:
+	int mclk_div,bclk_div,lrclk_div;
 	            ^

ERROR: space required after that ',' (ctx:VxV)
#1746: sound/soc/starfive/pdm.c:42:
+	int mclk_div,bclk_div,lrclk_div;
 	                     ^

WARNING: Block comments use * on subsequent lines
#1750: sound/soc/starfive/pdm.c:46:
+	/*
+	audio source clk:4, mclk:3M

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1782: sound/soc/starfive/pdm.c:78:
+		printk(KERN_ERR "sample rate:%d\n", clk);

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1792: sound/soc/starfive/pdm.c:88:
+		printk(KERN_ERR "bit weight:%d\n", weight);

WARNING: Comparisons should place the constant on the right side of the test
#1796: sound/soc/starfive/pdm.c:92:
+	if (24 == weight) {

WARNING: braces {} are not necessary for single statement blocks
#1796: sound/soc/starfive/pdm.c:92:
+	if (24 == weight) {
+		weight = 32;
+	}

WARNING: please, no space before tabs
#1964: sound/soc/starfive/pdm.c:260:
+^I^I.rates^I^I= ^ISF_PCM_RATE,$

WARNING: please, no space before tabs
#1965: sound/soc/starfive/pdm.c:261:
+^I^I.formats^I= ^ISNDRV_PCM_FMTBIT_S16_LE|\$

WARNING: Avoid unnecessary line continuations
#1965: sound/soc/starfive/pdm.c:261:
+		.formats	= 	SNDRV_PCM_FMTBIT_S16_LE|\

WARNING: DT compatible string "starfive,sf-pdm" appears un-documented -- check ./Documentation/devicetree/bindings/
#2048: sound/soc/starfive/pdm.c:344:
+	{.compatible = "starfive,sf-pdm",},

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#2066: sound/soc/starfive/pdm.c:362:
+MODULE_LICENSE("GPL v2");

WARNING: Improper SPDX comment style for 'sound/soc/starfive/pdm.h', please use '/*' instead
#2073: sound/soc/starfive/pdm.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#2073: sound/soc/starfive/pdm.h:1:
+// SPDX-License-Identifier: GPL-2.0

ERROR: space required after that ',' (ctx:VxV)
#2147: sound/soc/starfive/pwmdac-pcm.c:26:
+		iowrite32(basedat,dev->pwmdac_base + PWMDAC_WDATA);
 		                 ^

ERROR: space required after that ',' (ctx:VxV)
#2170: sound/soc/starfive/pwmdac-pcm.c:49:
+		iowrite32(basedat,dev->pwmdac_base + PWMDAC_WDATA);
 		                 ^

WARNING: struct snd_soc_component_driver should normally be const
#2391: sound/soc/starfive/pwmdac-transmitter.c:31:
+static struct snd_soc_component_driver soc_codec_pwmdac_dit = {

WARNING: please, no space before tabs
#2403: sound/soc/starfive/pwmdac-transmitter.c:43:
+^I.playback ^I= {$

WARNING: DT compatible string "linux,pwmdac-dit" appears un-documented -- check ./Documentation/devicetree/bindings/
#2422: sound/soc/starfive/pwmdac-transmitter.c:62:
+	{ .compatible = "linux,pwmdac-dit", },

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#2440: sound/soc/starfive/pwmdac-transmitter.c:80:
+MODULE_LICENSE("GPL v2");

WARNING: 'unsinged' may be misspelled - perhaps 'unsigned'?
#2486: sound/soc/starfive/pwmdac.c:39:
+	{ .name = "unsinged", .vals = UNSINGED_DATA },
 	           ^^^^^^^^

WARNING: braces {} are not necessary for single statement blocks
#2513: sound/soc/starfive/pwmdac.c:66:
+	if (uinfo->value.enumerated.item >= items) {
+		uinfo->value.enumerated.item = items - 1;
+	}

WARNING: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#2516: sound/soc/starfive/pwmdac.c:69:
+	strcpy(uinfo->value.enumerated.name,

WARNING: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#2571: sound/soc/starfive/pwmdac.c:124:
+	strcpy(uinfo->value.enumerated.name,

WARNING: Block comments use * on subsequent lines
#2603: sound/soc/starfive/pwmdac.c:156:
+/*
+static int pwmdac_datan_info(struct snd_kcontrol *kcontrol,

WARNING: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#2651: sound/soc/starfive/pwmdac.c:204:
+	strcpy(uinfo->value.enumerated.name,

WARNING: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#2692: sound/soc/starfive/pwmdac.c:245:
+	strcpy(uinfo->value.enumerated.name,

WARNING: Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88
#2734: sound/soc/starfive/pwmdac.c:287:
+	strcpy(uinfo->value.enumerated.name,

WARNING: Block comments should align the * on each line
#2777: sound/soc/starfive/pwmdac.c:330:
+ * 32bit-4byte
+*/

WARNING: Missing a blank line after declarations
#2781: sound/soc/starfive/pwmdac.c:334:
+	u32 date;
+	date = pwmdc_read_reg(dev->pwmdac_base, PWMDAC_CTRL);

ERROR: space prohibited before that close parenthesis ')'
#2782: sound/soc/starfive/pwmdac.c:335:
+	pwmdc_write_reg(dev->pwmdac_base, PWMDAC_CTRL, date | BIT(0) );

WARNING: Block comments should align the * on each line
#2787: sound/soc/starfive/pwmdac.c:340:
+ * 32bit-4byte
+*/

WARNING: Missing a blank line after declarations
#2791: sound/soc/starfive/pwmdac.c:344:
+	u32 date;
+	date = pwmdc_read_reg(dev->pwmdac_base, PWMDAC_CTRL);

ERROR: space prohibited after that '~' (ctx:WxW)
#2792: sound/soc/starfive/pwmdac.c:345:
+	pwmdc_write_reg(dev->pwmdac_base, PWMDAC_CTRL, date & ~ BIT(0));
 	                                                      ^

WARNING: Block comments should align the * on each line
#2798: sound/soc/starfive/pwmdac.c:351:
+ * 10:10-bit
+*/

ERROR: space prohibited before that ',' (ctx:WxW)
#2805: sound/soc/starfive/pwmdac.c:358:
+		pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 		                                 ^

ERROR: space required before the open brace '{'
#2807: sound/soc/starfive/pwmdac.c:360:
+	else if(data == 10){

ERROR: space required before the open parenthesis '('
#2807: sound/soc/starfive/pwmdac.c:360:
+	else if(data == 10){

ERROR: else should follow close brace '}'
#2807: sound/soc/starfive/pwmdac.c:360:
+	}
+	else if(data == 10){

ERROR: space prohibited before that ',' (ctx:WxW)
#2809: sound/soc/starfive/pwmdac.c:362:
+		pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 		                                 ^

WARNING: Block comments should align the * on each line
#2817: sound/soc/starfive/pwmdac.c:370:
+ * 10:center
+*/

ERROR: space prohibited before that ',' (ctx:WxW)
#2822: sound/soc/starfive/pwmdac.c:375:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_CTRL);
 	                                        ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2825: sound/soc/starfive/pwmdac.c:378:
+		pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 		                                 ^

ERROR: else should follow close brace '}'
#2827: sound/soc/starfive/pwmdac.c:380:
+	}
+	else if (data == 1) { //right

ERROR: space prohibited before that ',' (ctx:WxW)
#2829: sound/soc/starfive/pwmdac.c:382:
+		pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 		                                 ^

ERROR: else should follow close brace '}'
#2831: sound/soc/starfive/pwmdac.c:384:
+	}
+	else if (data == 2) { //center

ERROR: space prohibited before that ',' (ctx:WxW)
#2833: sound/soc/starfive/pwmdac.c:386:
+		pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 		                                 ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2842: sound/soc/starfive/pwmdac.c:395:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_CTRL);
 	                                        ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2843: sound/soc/starfive/pwmdac.c:396:
+	pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, (value & 0xF) | ((data - 1) << 4));
 	                                 ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2851: sound/soc/starfive/pwmdac.c:404:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_CTRL);
 	                                        ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2867: sound/soc/starfive/pwmdac.c:420:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_CTRL);
 	                                        ^

WARNING: braces {} are not necessary for any arm of this statement
#2868: sound/soc/starfive/pwmdac.c:421:
+	if (data == UNSINGED_DATA) {
[...]
+	else if (data == INVERTER_DATA_MSB) {
[...]

ERROR: else should follow close brace '}'
#2871: sound/soc/starfive/pwmdac.c:424:
+	}
+	else if (data == INVERTER_DATA_MSB) {

ERROR: space required after that ',' (ctx:VxV)
#2874: sound/soc/starfive/pwmdac.c:427:
+	pwmdc_write_reg(dev->pwmdac_base,PWMDAC_CTRL, value);
 	                                ^

ERROR: space required after that ',' (ctx:VxV)
#2877: sound/soc/starfive/pwmdac.c:430:
+static int pwmdac_data_shift(struct sf_pwmdac_dev *dev,u8 data)
                                                       ^

WARNING: braces {} are not necessary for single statement blocks
#2881: sound/soc/starfive/pwmdac.c:434:
+	if ((data < PWMDAC_DATA_LEFT_SHIFT_BIT_0) || (data > PWMDAC_DATA_LEFT_SHIFT_BIT_7)) {
+		return -1;
+	}

ERROR: space prohibited before that ',' (ctx:WxW)
#2885: sound/soc/starfive/pwmdac.c:438:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_CTRL);
 	                                        ^

ERROR: space prohibited after that '~' (ctx:WxW)
#2886: sound/soc/starfive/pwmdac.c:439:
+	value &= ( ~ ( PWMDAC_DATA_LEFT_SHIFT_BIT_ALL << 15 ) );
 	           ^

ERROR: space prohibited after that open parenthesis '('
#2886: sound/soc/starfive/pwmdac.c:439:
+	value &= ( ~ ( PWMDAC_DATA_LEFT_SHIFT_BIT_ALL << 15 ) );

ERROR: space prohibited before that close parenthesis ')'
#2886: sound/soc/starfive/pwmdac.c:439:
+	value &= ( ~ ( PWMDAC_DATA_LEFT_SHIFT_BIT_ALL << 15 ) );

ERROR: space prohibited before that ',' (ctx:WxW)
#2888: sound/soc/starfive/pwmdac.c:441:
+	pwmdc_write_reg(dev->pwmdac_base , PWMDAC_CTRL, value);
 	                                 ^

ERROR: space prohibited before that ',' (ctx:WxW)
#2896: sound/soc/starfive/pwmdac.c:449:
+	value = pwmdc_read_reg(dev->pwmdac_base , PWMDAC_SATAE);
 	                                        ^

WARNING: braces {} are not necessary for single statement blocks
#2914: sound/soc/starfive/pwmdac.c:467:
+	if (dev->shift) {
+		pwmdac_data_shift(dev, dev->shift);
+	}

ERROR: spaces required around that '==' (ctx:VxV)
#2993: sound/soc/starfive/pwmdac.c:546:
+		if (get_pwmdac_fifo_state(pwmdac_dev)==0) {
 		                                     ^

WARNING: braces {} are not necessary for single statement blocks
#2993: sound/soc/starfive/pwmdac.c:546:
+		if (get_pwmdac_fifo_state(pwmdac_dev)==0) {
+			sf_pwmdac_pcm_push_tx(pwmdac_dev);
+		}

WARNING: braces {} are not necessary for single statement blocks
#3018: sound/soc/starfive/pwmdac.c:571:
+			if (IS_ERR(dev->tx_thread)) {
+				return PTR_ERR(dev->tx_thread);
+			}

ERROR: space required before the open parenthesis '('
#3032: sound/soc/starfive/pwmdac.c:585:
+			if(dev->tx_thread) {

WARNING: braces {} are not necessary for single statement blocks
#3032: sound/soc/starfive/pwmdac.c:585:
+			if(dev->tx_thread) {
+				dev->tx_thread_exit = 1;
+			}

ERROR: code indent should use tabs where possible
#3249: sound/soc/starfive/pwmdac.c:802:
+        }$

WARNING: please, no spaces at the start of a line
#3249: sound/soc/starfive/pwmdac.c:802:
+        }$

WARNING: DT compatible string "starfive,pwmdac" appears un-documented -- check ./Documentation/devicetree/bindings/
#3288: sound/soc/starfive/pwmdac.c:841:
+	{ .compatible = "starfive,pwmdac",	 },

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#3308: sound/soc/starfive/pwmdac.c:861:
+MODULE_LICENSE("GPL v2");

WARNING: Improper SPDX comment style for 'sound/soc/starfive/pwmdac.h', please use '/*' instead
#3317: sound/soc/starfive/pwmdac.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#3317: sound/soc/starfive/pwmdac.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: missing space after enum definition
#3346: sound/soc/starfive/pwmdac.h:30:
+enum pwmdac_lr_change{

WARNING: missing space after enum definition
#3351: sound/soc/starfive/pwmdac.h:35:
+enum pwmdac_d_mode{

WARNING: missing space after enum definition
#3356: sound/soc/starfive/pwmdac.h:40:
+enum pwmdac_shift_bit{

WARNING: missing space after enum definition
#3361: sound/soc/starfive/pwmdac.h:45:
+enum pwmdac_duty_cycle{

WARNING: missing space after enum definition
#3368: sound/soc/starfive/pwmdac.h:52:
+enum pwmdac_sample_count{

WARNING: missing space after enum definition
#3394: sound/soc/starfive/pwmdac.h:78:
+enum data_shift{

WARNING: missing space after enum definition
#3406: sound/soc/starfive/pwmdac.h:90:
+enum pwmdac_config_list{

WARNING: Comparisons should place the constant on the right side of the test
#3510: sound/soc/starfive/spdif-pcm.c:27:
+		if (SNDRV_PCM_FORMAT_S16_LE == format) {

WARNING: Comparisons should place the constant on the right side of the test
#3515: sound/soc/starfive/spdif-pcm.c:32:
+		} else if (SNDRV_PCM_FORMAT_S24_LE == format) {

WARNING: Comparisons should place the constant on the right side of the test
#3518: sound/soc/starfive/spdif-pcm.c:35:
+		} else if (SNDRV_PCM_FORMAT_S32_LE == format) {

WARNING: braces {} are not necessary for single statement blocks
#3528: sound/soc/starfive/spdif-pcm.c:45:
+		if (++tx_ptr >= runtime->buffer_size) {
+			tx_ptr = 0;
+		}

WARNING: Comparisons should place the constant on the right side of the test
#3550: sound/soc/starfive/spdif-pcm.c:67:
+		if (SNDRV_PCM_FORMAT_S16_LE == format) {

WARNING: Comparisons should place the constant on the right side of the test
#3553: sound/soc/starfive/spdif-pcm.c:70:
+		} else if (SNDRV_PCM_FORMAT_S24_LE == format) {

WARNING: Comparisons should place the constant on the right side of the test
#3556: sound/soc/starfive/spdif-pcm.c:73:
+		} else if (SNDRV_PCM_FORMAT_S32_LE == format) {

WARNING: braces {} are not necessary for any arm of this statement
#3735: sound/soc/starfive/spdif-pcm.c:252:
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
[...]
+	else {
[...]

ERROR: else should follow close brace '}'
#3738: sound/soc/starfive/spdif-pcm.c:255:
+	}
+	else {

WARNING: braces {} are not necessary for single statement blocks
#3824: sound/soc/starfive/spdif.c:47:
+	if (stat & SPDIF_PARITY_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3828: sound/soc/starfive/spdif.c:51:
+	if (stat & SPDIF_UNDERR_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3832: sound/soc/starfive/spdif.c:55:
+	if (stat & SPDIF_OVRERR_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3836: sound/soc/starfive/spdif.c:59:
+	if (stat & SPDIF_SYNCERR_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3840: sound/soc/starfive/spdif.c:63:
+	if (stat & SPDIF_LOCK_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3844: sound/soc/starfive/spdif.c:67:
+	if (stat & SPDIF_BEGIN_FLAG) {
+		irq_valid = true;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3848: sound/soc/starfive/spdif.c:71:
+	if (stat & SPDIF_RIGHT_LEFT) {
+		irq_valid = true;
+	}

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#3906: sound/soc/starfive/spdif.c:129:
+		printk(KERN_ERR "%s L.%d cmd:%d\n", __func__, __LINE__, cmd);

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#3951: sound/soc/starfive/spdif.c:174:
+		printk(KERN_ERR "channel:%d\n", channels, rate);

WARNING: braces {} are not necessary for single statement blocks
#3958: sound/soc/starfive/spdif.c:181:
+	if (rate < 3) {
+		return -EINVAL;
+	}

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#3972: sound/soc/starfive/spdif.c:195:
+	#if 0

WARNING: Avoid unnecessary line continuations
#4055: sound/soc/starfive/spdif.c:278:
+		.formats = SNDRV_PCM_FMTBIT_S16_LE \

WARNING: Avoid unnecessary line continuations
#4064: sound/soc/starfive/spdif.c:287:
+		.formats = SNDRV_PCM_FMTBIT_S16_LE \

WARNING: DT compatible string "starfive,sf-spdif" appears un-documented -- check ./Documentation/devicetree/bindings/
#4145: sound/soc/starfive/spdif.c:368:
+	{ .compatible = "starfive,sf-spdif", },

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#4161: sound/soc/starfive/spdif.c:384:
+MODULE_LICENSE("GPL v2");

WARNING: Improper SPDX comment style for 'sound/soc/starfive/spdif.h', please use '/*' instead
#4168: sound/soc/starfive/spdif.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#4168: sound/soc/starfive/spdif.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING: 'defualt' may be misspelled - perhaps 'default'?
#4193: sound/soc/starfive/spdif.h:26:
+#define SPDIF_SFR_ENABLE	(1<<8)	///0:SFR reg reset to defualt value; auto set back to '1' after reset
                         	      	                      ^^^^^^^

WARNING: please, no space before tabs
#4239: sound/soc/starfive/spdif.h:72:
+^I^I^I^I^I^I^I SPDIF_FIOF_AEMPTY | SPDIF_FIFO_FULL | SPDIF_FIFO_AFULL | SPDIF_SYNCERR | ^I\$

WARNING: line length of 107 exceeds 100 columns
#4243: sound/soc/starfive/spdif.h:76:
+#define SPDIF_FIFO_INT_STATUS	(SPDIF_FIFO_EMPTY | SPDIF_FIOF_AEMPTY | SPDIF_FIFO_FULL | SPDIF_FIFO_AFULL)

WARNING: 'reciever' may be misspelled - perhaps 'receiver'?
#4253: sound/soc/starfive/spdif.h:86:
+#define SPDIF_INT_LOCK		5	// reciever has become synchronized with input data stream
                       		 	   ^^^^^^^^

WARNING: 'recieve' may be misspelled - perhaps 'receive'?
#4254: sound/soc/starfive/spdif.h:87:
+#define SPDIF_INT_BLOCK_BEGIN	6	// start a new block in recieve data, written into FIFO
                              	 	                        ^^^^^^^

WARNING: please, no space before tabs
#4275: sound/soc/starfive/spdif.h:108:
+^I^I^I^I^I^I SPDIF_AEMPTY_FLAG | SPDIF_FULL_FLAG | SPDIF_AFULL_FLAG | SPDIF_SYNCERR_FLAG | ^I^I\$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

