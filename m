Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F9B440F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 00:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPL6ldEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699923364; x=1731459364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M/5PwAMprEI0aSPaqFv2php94MdxTn/pV1/S4+O0Iis=;
  b=OPL6ldEGx/fK+MKMcGgOCNGzfFSzpRs/fAS4R3jVr5MbBDZZ0W+0FEAv
   9x+1tjMmMqRFMuL3Q0246KuMieFaWF40y2djdlSKK04XCs6/k/mnG4U8u
   9C8i7pQmwERAHp4P1twg7CEDycCggf89wIBmN7nXQ1glFwva/Kq+GwN9v
   tib7t3txV00CKGUb9MSS+AQMdo7Rc/o+C+wiRMxmgYjXAYGS8NfHBdDfi
   ydyP4TaP1eeE49ywGHfIayWtPJlNVPYcWf6WyrUWrtuh5HP7EohHV1Q8R
   cOsbjt0KbFnD7f5CQ/0wzSDdYwhc2Sxkao2SF7fpc+pUBGFNMotD3/aSf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3589868"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3589868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 16:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="764496277"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="764496277"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 16:56:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 16:56:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 16:56:01 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 16:55:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEXzj7wNCZsZTdAAoXG3ZqYqRVSkuCQzUTVeCSpCUecKG0EQhsmcabyLFLU9gNQHBw9kF2eqtmysI+AmhvPOVzEdRGr/4/c1SKhVF87GmX+i+GPD4oO5TO1JaD0AIVjr3bU6RWy5+jtlXFLl0UcoLgx17o3WvhDpOLKVT76KQ3tH3PZLMVw8jP/4c/cymJzjAvfcDfCmqTUVy3AyzDNyUmd3vBcYiS/WjYbnQYwaeDVIMB6pMelY6KJpYiWxUS8DGpB1i+fqVumBbrkHUNJfnlxqopoNGNRlWhLqVCxtw4yu2FMzDo+oD8P4RrDcz4JuuutcKAuUXyeDT2KZJSKnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=851sDeiGgyYgSRFXW2ZfMxUQxuTwG5xMkSxUw+Y1LXk=;
 b=f8DHzqiRcVWGOO7ieV55grvdVjfroZd3QjfY7mdo0EhFAC22UhbNBctZchfJfMnuc2+gh+w8Rw5/sWo79b/iF8InyMGzhnPr4FMqnA4EHYesajqHh9cy16+tHUB/kXqkUyUV29GxyL7BkwTmv89KKt0BIEjrqkF9+wccK32LBpDy6Hw5Sk0tFuuNw2N2bDQIHQ763CT1QtFP6S1fXNGSDqttreU1vV2KraOfVcC1c1QV/0X0R/24rNC5hCfHeOaRIu7gvq2Ws7xU/lWUi44ajXOUAraOtWaRte31SUOSIrBs30gYNrQ+Fnv/CbpmUj53lH7/BPRhKgozrxqslM7Ggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.28; Tue, 14 Nov 2023 00:55:52 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2f1a:e62e:9fff:ae67]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2f1a:e62e:9fff:ae67%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 00:55:52 +0000
Date: Tue, 14 Nov 2023 08:55:44 +0800
From: kernel test robot <philip.li@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: <oe-kbuild-all@lists.linux.dev>, Sebastian Reichel <sre@kernel.org>,
	"Algea Cao" <algea.cao@rock-chips.com>
Subject: [sre-misc:rk3588 31/37]
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:3251:12: warning:
 'dw_hdmi_rockchip_suspend' defined but not used
Message-ID: <ZVLFkBOaQDhXbQ7R@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|DS7PR11MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd0fad4-2533-4448-b349-08dbe4ac7342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YU21dzO49faum6D6+LKUWW7g5ft6FGH3RgMTiM0rKPQXPQ03EXKx2kSoFgKzyzJU6H0ks17KX65pgzDRhC+OU7NUb0enY5mkaabm8/JwFhXI3qvm2LjsOJxuIY+Z4Mmjpa7QyMVGm2/iiT6dN4V76l3NpwscPlCvEF5Dkaca6nQ2BnmUZEhrl5dIShc/OwV+xEpG/WVYD+BWofjT/B0r4rCgcArmwQW51JDMMvLWpahur80J0Y8dUL2E3Hy6f7UFXR+rNPW9+Fo+SPUeIM5Znqa7qXu8g4YBZSB/NRa1t//D4QQKU1rAZiIJeyez5Fr3dL/7agjfXfGCnwUNf0CXMTpRQrEMQQjs7kx0cxDglso+7VpUJFjGHL2n7yIWMKX7ncYG89Ipz9MKDAsC5XiOYjWGIMt9AN4wZSjRd3HuL4HpJoWZslVuTakZ1uyicCbqQi40Wqgi+Grwou/x5C4j1t69shWFK7AZXfb7ryLd3t1lka4GD84jzBZKSBwuEePTEgayUM4bB6WnUdodhS1Z+cd7FAnnnTY/MBkb+szI9KDJVKdWzlW6z3wVOUnTxXdWhaTOURbN03WJ9BBQFinU8ZyRuWieiX3rIc/M9/8U0MgMpqkRcX519i77YcD1YC6H5sXpVfPEtvopej/QQSa3xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(376002)(136003)(396003)(366004)(346002)(230173577357003)(230922051799003)(230273577357003)(186009)(451199024)(1800799009)(64100799003)(33716001)(26005)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(6512007)(6506007)(9686003)(478600001)(6486002)(966005)(6666004)(66946007)(316002)(66476007)(66556008)(6916009)(54906003)(2906002)(8676002)(4326008)(8936002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KZLFt0ecsVcZBpcUCU02LxbZv6qLhJoisu8+aVLsWSBa3/L7jC4H5lznZcjo?=
 =?us-ascii?Q?pNy92mSUECV4VDp1cFbKpL0V14Yn4dg4EcRFA4k3G7nNeBW04FA8rjP7Vsp7?=
 =?us-ascii?Q?vN07GP/QgEFv0SipiaUlYjJh77MLzkKNX0PbxvtIZhMULe5ZZhbwE+OjQPeS?=
 =?us-ascii?Q?oRGn/GseqYRUMOrGh49u7T8Sc2Gsp4Fz0G4FyyRHqWYpqAGE1RVWkKWNYX0V?=
 =?us-ascii?Q?j271antOOAs3ch/Ia3QqFcy8XSxOATcbEDtiaKOtIruUJYyh1v5QGVvlrODx?=
 =?us-ascii?Q?IPcuZ1Y6pjxKchEYMeSvn181ND9e2I9dNGp8Snt4lQBMpY+cwDUVp83M15YI?=
 =?us-ascii?Q?tDngtyj0rtV4XCqG7AuEWpGxakW97NHnD0o5LE1tA24TSFKCXpYjlvQ7vgfY?=
 =?us-ascii?Q?pCy2k4uw9CbyjqIS3XA8KsD70nIujgny2HTydEBMM4uViXCHCv8w3Gio8qvs?=
 =?us-ascii?Q?ILr66yULSUkm+laZJ1Pmuj77DIwXDOlC9pxhnWoMEaqxUGnwL0p5E3gNKxm7?=
 =?us-ascii?Q?vDZJfPxwqDbxaKg2x1Krd1Vws6PbHAxqCBAmhg+O+W0OLI2F+K/RXO5Wrr7k?=
 =?us-ascii?Q?K73C9auZfnhmnTH3j4d0Hfh0EJ3AuUX/nM0u/T1IYLc3tTd5rbzdY5b8Kl7c?=
 =?us-ascii?Q?F90MBjF3+xrR3NrxaNvL/gtT12D5gOogvC5oI8RnjwuHu26WXS/I0T55S8UQ?=
 =?us-ascii?Q?gRY/JHrVOLUzDt/K4skHTjQ8jFUCPF+UBfRVg2tfUjw6tKujxNuU6Gb5/beJ?=
 =?us-ascii?Q?+Qvvn1qJOxfXO+5BTfsPTg1lK0OOvxBEG7ePB8N21l0mdYRszUV3c5dMKEOZ?=
 =?us-ascii?Q?gmtmaGD0X/bGyNdOyp/XC+Q/+YbBeVNPAN13AwNRxn6J4M/7H7BJL0U3I5Yk?=
 =?us-ascii?Q?Gxv1VsP+cWuNNaz1iABsDV8/zWuzMbX7MxJSAL6KihLqBLV4LxsBQd/aRxzA?=
 =?us-ascii?Q?YIcxPdogbEfMQOdShcXYwPwBA3SIq9AOY1HzI1Hyo525hThkD8H2u+anV0+E?=
 =?us-ascii?Q?2XcMo6FQJw4ufQXllmTafmCvarPBgfBC9bwjNIC5kkG3GFM0w1xak0yCraJe?=
 =?us-ascii?Q?m2IZhxBSAGOh7Jyg4wq/FBCOh+Q/hMs/c9QEm/eTC3rNR0cVIpMNqFlyz7hI?=
 =?us-ascii?Q?/6AyCsCMFnEi5PN8nHXJTIZWASiSxolvJpXN83pFb90G3fndVDuNkf0Q4APU?=
 =?us-ascii?Q?CES+KwLFU20IVKwL+yNnXjKhm6uH/DeVIl5wYL9zSQR1+P1BRwkj3MrVMPSb?=
 =?us-ascii?Q?IPbot++y71TBBnZyacbDQVB/NzwTTviAwB3M8BmlSAWmoJEoCtnAH5rY0flD?=
 =?us-ascii?Q?eIdCzJOhAn2v5VYP4vbObK4tlGBi3Us8sPgx3UEAU7V5YzjKtDaoAodIkxiP?=
 =?us-ascii?Q?UDsaKltcZWtV+2CQXgGUMt4tMT6DBaS//A8YBlvQQTTrUP8ZZBggEMTJi6iP?=
 =?us-ascii?Q?y1jRNTiYDs6EBV9WU45xkn30AXKm+1MkkXqClV75vBbZ5wluUmn6vyrXnfAi?=
 =?us-ascii?Q?CCf6Zoo6PLj3/qdCrSR5yj7cRf/GCG/3ABACgkvJotvpnRxLpS2hHuCKPrYJ?=
 =?us-ascii?Q?V8eX5c0s1DBJtBPmC6Ejs99xw++IBQF1janH/hsh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd0fad4-2533-4448-b349-08dbe4ac7342
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 00:55:52.5853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkkzog3RonnrLvFK3CZ3isjDipgoS4GpHeDhQMdqtEM5+7biVuyAX5CcniML8Q90tS3R9G0ZFvZIwYODatO5pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   f41b3e9a9d7f22bef0735b4fe0007321ce6b6d6b
commit: 171fd53717525f0f6dc56e90e6f38a9038c5c779 [31/37] drm/bridge: synopsys: Add initial support for DW HDMI QP TX Controller
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231114/202311140850.0vkZsfyQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311140850.0vkZsfyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311140850.0vkZsfyQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2139:11: error: 'RK_IF_FORMAT_YCBCR_LQ' undeclared here (not in a function)
    2139 |         { RK_IF_FORMAT_YCBCR_LQ, "ycbcr_low_subsampling" },
         |           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2140:11: error: 'RK_IF_FORMAT_MAX' undeclared here (not in a function)
    2140 |         { RK_IF_FORMAT_MAX, "invalid_output" },
         |           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_attach_properties':
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2219:49: error: 'RK_IF_PROP_COLOR_DEPTH' undeclared (first use in this function)
    2219 |                                                 RK_IF_PROP_COLOR_DEPTH,
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2228:60: error: 'RK_IF_PROP_COLOR_FORMAT' undeclared (first use in this function)
    2228 |         prop = drm_property_create_enum(connector->dev, 0, RK_IF_PROP_COLOR_FORMAT,
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2237:42: error: 'RK_IF_PROP_COLOR_DEPTH_CAPS' undeclared (first use in this function)
    2237 |                                          RK_IF_PROP_COLOR_DEPTH_CAPS,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2245:42: error: 'RK_IF_PROP_COLOR_FORMAT_CAPS' undeclared (first use in this function)
    2245 |                                          RK_IF_PROP_COLOR_FORMAT_CAPS,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2316:21: error: 'struct rockchip_drm_private' has no member named 'connector_id_prop'
    2316 |         if (!private->connector_id_prop)
         |                     ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2317:24: error: 'struct rockchip_drm_private' has no member named 'connector_id_prop'
    2317 |                 private->connector_id_prop = drm_property_create_range(connector->dev,
         |                        ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2320:20: error: 'struct rockchip_drm_private' has no member named 'connector_id_prop'
    2320 |         if (private->connector_id_prop)
         |                    ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2321:69: error: 'struct rockchip_drm_private' has no member named 'connector_id_prop'
    2321 |                 drm_object_attach_property(&connector->base, private->connector_id_prop, hdmi->id);
         |                                                                     ^~
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:6:
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_get_property':
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2463:28: error: 'RK_IF_DEPTH_8' undeclared (first use in this function)
    2463 |                 *val = BIT(RK_IF_DEPTH_8);
         |                            ^~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2468:37: error: 'RK_IF_DEPTH_10' undeclared (first use in this function)
    2468 |                         *val |= BIT(RK_IF_DEPTH_10);
         |                                     ^~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2470:37: error: 'RK_IF_DEPTH_12' undeclared (first use in this function)
    2470 |                         *val |= BIT(RK_IF_DEPTH_12);
         |                                     ^~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2472:37: error: 'RK_IF_DEPTH_16' undeclared (first use in this function)
    2472 |                         *val |= BIT(RK_IF_DEPTH_16);
         |                                     ^~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2474:37: error: 'RK_IF_DEPTH_420_10' undeclared (first use in this function)
    2474 |                         *val |= BIT(RK_IF_DEPTH_420_10);
         |                                     ^~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2476:37: error: 'RK_IF_DEPTH_420_12' undeclared (first use in this function)
    2476 |                         *val |= BIT(RK_IF_DEPTH_420_12);
         |                                     ^~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2478:37: error: 'RK_IF_DEPTH_420_16' undeclared (first use in this function)
    2478 |                         *val |= BIT(RK_IF_DEPTH_420_16);
         |                                     ^~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_bind':
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2880:44: error: 'drm_mode_convert_to_split_mode' undeclared (first use in this function); did you mean 'drm_mode_convert_to_umode'?
    2880 |         plat_data->convert_to_split_mode = drm_mode_convert_to_split_mode;
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            drm_mode_convert_to_umode
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2881:45: error: 'drm_mode_convert_to_origin_mode' undeclared (first use in this function); did you mean 'drm_mode_convert_to_umode'?
    2881 |         plat_data->convert_to_origin_mode = drm_mode_convert_to_origin_mode;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             drm_mode_convert_to_umode
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:3101:25: error: implicit declaration of function 'rockchip_drm_register_sub_dev' [-Werror=implicit-function-declaration]
    3101 |                         rockchip_drm_register_sub_dev(&hdmi->sub_dev);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_unbind':
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:3166:17: error: implicit declaration of function 'rockchip_drm_unregister_sub_dev' [-Werror=implicit-function-declaration]
    3166 |                 rockchip_drm_unregister_sub_dev(&hdmi->sub_dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_get_edid_dsc_info':
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2068:1: warning: control reaches end of non-void function [-Wreturn-type]
    2068 | }
         | ^
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: At top level:
>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:3251:12: warning: 'dw_hdmi_rockchip_suspend' defined but not used [-Wunused-function]
    3251 | static int dw_hdmi_rockchip_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dw_hdmi_rockchip_suspend +3251 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c

171fd53717525f0 Cristian Ciocaltea 2023-11-01  3250  
171fd53717525f0 Cristian Ciocaltea 2023-11-01 @3251  static int dw_hdmi_rockchip_suspend(struct device *dev)
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3252  {
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3253  	struct rockchip_hdmi *hdmi = dev_get_drvdata(dev);
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3254  
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3255  	if (hdmi->is_hdmi_qp)
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3256  		dw_hdmi_qp_suspend(dev, hdmi->hdmi_qp);
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3257  	else
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3258  		dw_hdmi_suspend(hdmi->hdmi);
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3259  
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3260  	pm_runtime_put_sync(dev);
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3261  
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3262  	return 0;
12b9f204e804b2a Andy Yan           2015-01-07  3263  }
12b9f204e804b2a Andy Yan           2015-01-07  3264  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

