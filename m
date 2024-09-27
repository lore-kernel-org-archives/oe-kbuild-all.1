Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04F14B948
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727445543; cv=fail; b=Z9yI5NY6BZL3LFlEgj1Kf90RVFMku+haMT3rstoCgb2nw/NS+SmSNhQY27zbFrpQ+Ghxq6OjVMfRCUw/EByOw/ykBfWu0/xfYWcqDknaZiityL1KfGPhAuyadA+Z9CJ7LvmZpSnvjEsPa16cQj4VVhqYvKUnoXCQ3mDhqFNJ55U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727445543; c=relaxed/simple;
	bh=5b2zs1whzJQQ9hhRS/eG13cWGP4ZQGq5Nns6/5x5XVI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hi8sXRKmZDC4qUbmtFF8dagnIXfNabdeXZg3pLhPJC4kQ70Kpu0HQwvI2ZOhdrBlM2fvO1e8X4r9U0od66qPIZG5FbSS7BLjgyvYrPbygyxvhZT9dIysMns+aliriAcZgt5V+YhozxygeS4S5E4+Ufbtz3h+8JKycODhD/nGiGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMd2STbG; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMd2STbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727445541; x=1758981541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5b2zs1whzJQQ9hhRS/eG13cWGP4ZQGq5Nns6/5x5XVI=;
  b=NMd2STbGviZ+Kq10EQC5CJOf+MsirrfsBBDava3dBw7Pq9d7BFZvtDEC
   rfLmQjSBHU4DgqeGyZRzQQGZMp9tcaaya1IM16KyxPVsULAeGrIYUm+8c
   jIwwb0uNPiSwvIXLviZGjS/9JPLXBi4ZunHWgqRYqbXC2/IbWxxRpDum4
   3LdKXfaIT6iM6hsH6d/MR6TQyPGqXoLqbqP/wsS69dSOfhfplRG8oUemC
   XGaPZ9jas6HWxWFfFLVC2cwKiQerG26WrSrppibkffKBZYGqLubyitD5u
   uk7Hs8/McbjuYE4HbawPOCAl9m5o2Bw26uW2p780jooGy4Q1hX/0JI7Lp
   g==;
X-CSE-ConnectionGUID: QIaWgUBLSf6N8dKiWwBWIw==
X-CSE-MsgGUID: 9eP5IHmMRCupwndWK6qgYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37153692"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="37153692"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:59:00 -0700
X-CSE-ConnectionGUID: XI3KhwskQpaU0mOZP6AUgQ==
X-CSE-MsgGUID: b6QfZvKJRYmtTsMoZsADyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="95877701"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 06:59:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 06:59:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 06:58:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 06:58:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 06:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEHObgZ9P9b2cDAMX5fueIqVMxfeCcTbKW9BavufCv8qHp/y668wMT+VfCyZs7b7our5XlOzh+U8U6Kav7Nkdzvhdr+OUHnJmunI1UvAGUlFxQ4gOmnO5mnznM7yYCktrLCPw3Kv+k3dbIwp1Ad89NZrIj6s2Xt+Rq/0fr549ozQxMYZuL1UQJHdPPssb0+8YTNw4FEtGmu70oXBsMOjclfARbnCS0e+h0eNYO49UHaUtCDYnf5Z5b+Sa60Gmdzgb+qeREzO6ZKZZ3t9mpVgY0Ho/i94Pk+eV5xfGQd1+rVc1UBgzfAQfKXF1qagCq9BiYs6dBBYzLJRQyfDFXxnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQdKhJxPXHY1PX7vqU1kjiCaUekSjPWPBgMykjmLX6o=;
 b=MJ/ydeSLSFBZILuJKRNM7CLBhGjqnzDaTjsmYMPM7nHyJPH4R/3dR8RbagFDcHtIxpUQSfc7vKSKLu1hdhY8zH51LYzFG733YiSM4TW+ExZo3qo0xKRUM+RU1OCKzanQgE5WJZ/IrY/NJL2DeYmBgg7HSE9zSVqj/Umb+lOvUN4badCAePMbiOTAVZvlZoV6dGqun0KL9n/FQlLJEiH4Fh/WlYf0qWtyQB1eOt4YoU+nD6d+15J0wMW+NvAHMVp8hnwGrCfpHoY1/gGY0I3ffM5s/G6VqJimlOWvoWRqz6JooH3ZIh4yNOmveejK9DYezDQiwFIlhihYaskUGkjgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 13:58:56 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 13:58:56 +0000
Date: Fri, 27 Sep 2024 21:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.19.y-cip 6919/30000]
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c:687:22: warning: no previous
 prototype for 'rcar_du_crtc_mode_valid'
Message-ID: <Zva6GK7s4m0eHfKI@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5e52ae-c8fc-4ce1-0cd9-08dcdefc874c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ih0NshaQpWPot8gNZCFz8kWc0oDv2mMpIAOFWv9S2hCIwWYDqjp9v823kKQe?=
 =?us-ascii?Q?wTd0PTwpA85NCtQ+McT6km8OhGwc61914bSNGWfV82hC/VCpfwe8yr/RrzyR?=
 =?us-ascii?Q?ZgHOvoxqvqhjf8Ymdm9zFPgtqW12O86hvYml8d0gCLUUzkzMfnX3jLOtqfxg?=
 =?us-ascii?Q?wF8L5VCa9WueJ1HJUI4P0EwbbzvvCoBtjDFenPHbqk8ExKnsKuDBdSoykg0K?=
 =?us-ascii?Q?LLHpB4BTh1nswE0AcUQG7jB3LcOykgtYFE0fcoYt76s85TFV1a3DYk4xSIJT?=
 =?us-ascii?Q?diov3Uub8wuWOoWf7En3mCAOpT2SOmMa1SkpUTLgc8Mm1gDsOur4RPYqM+PU?=
 =?us-ascii?Q?bKWQVqlY7OVwbpxUZT3jUqD9M5Sl3kNHB+Y17OCyTBWW8q6JTv3/S3yrJoTo?=
 =?us-ascii?Q?cqKbYRUcLYhdH0ikytRseMY0nZM2cXukijQQ4/H89BzOzZLMJQhqcgVdMpg5?=
 =?us-ascii?Q?6Re0qeEQhdy57L7I555Ec7rBeWRqNt1C38J079rQEYAPqMOPKoJeQ/BHuhlE?=
 =?us-ascii?Q?fi9Vu3ffp3EZZ54G0E/qYwdVDnH1UJCRcbL/k49IglOno6IgpPil7VP1fNun?=
 =?us-ascii?Q?aDizlpi8g7jzfkLo4jA/s9qy4mYdiHZP2z6ni6UludTivTnpZF8W+E4rB+b2?=
 =?us-ascii?Q?SiGve+9JWwLRFtr884lruzYzzAmjKs5KiRvfZCDauleDMU5hdZBgcmA9SlsD?=
 =?us-ascii?Q?sW/oUO/0DQd08U9cpuzfo1Yt8+i6L84CLQFk6pqH9TwUZPz2UNJJAmt38O8C?=
 =?us-ascii?Q?pSBm2YUzsiG5lFCVI/0RkgjY+LSYXHMKbuHTROWW9U1FDA2WKGN/HESh7Ht6?=
 =?us-ascii?Q?c67qbRMlaCrsR2coyZbsnetNklrIrg3UyJcMCH8w6xLpjQFloXQAmmM1W++o?=
 =?us-ascii?Q?TqzUOoSkGXpNbeIPZBiX9eusrx9AFtyB4G2lOxSW65TtIAgNLlHymslA9hn7?=
 =?us-ascii?Q?jNYyBGwcrZEFxTpX4pgAd1rfS2qxBSK8oRVoe+AEYTy5VK5bMI9LLC8ePHyb?=
 =?us-ascii?Q?8xP+ZrUhbi/kKkrryEQ4MoVcqA/IJgUbVsmlnSl+MA/JjHESQ8yBEE9KiXqf?=
 =?us-ascii?Q?L/bVV2sBGr1TpkbLMJ4XfqRb0Cwb8J/Ae4iUIRW1QlaEvPa5ziPe47Td2XLw?=
 =?us-ascii?Q?krw0ZOWdXVtPYF3p9BI4+HIBfoQFKkIymMFLnkKj/kGJkTmIZq9q9wbs+jPe?=
 =?us-ascii?Q?t8Cf5Nr5R2i9zVrYQJGRZdJDYD/iS/uLhqPoxznKeKxz9o1gh9wW3ry0Crw?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U0HtVv3Bxb12jzIzm8uErVuFZZALvCIOfvZJ/TOueRPz0dwk8fC95bC1fz/r?=
 =?us-ascii?Q?687ADJiNYUU0GOakNe3AyANUJvQRbuqoLsMjlJaLMhXTDkXqbasECKxHYs5d?=
 =?us-ascii?Q?Ot6z6IwPrrPiyr6SGnVdMvK1Kz01MGpbeWNY/b0RCAMKsB2g7VBv1amr4rJC?=
 =?us-ascii?Q?3pJ0RrMPVUVOBglNP8xyX/pqhQx24OL1zbfm+NoKMRbkQlm5rgM0wCNERiUi?=
 =?us-ascii?Q?QgQv0hbbPzzktyuRcBLFou1wNPiUXCCOInldaC0h/A2kKcN1feCV/7vus1d+?=
 =?us-ascii?Q?ej1gVEcfm0yl+AWuNOubYy21VZOopKmvQ7ezgMrU7p0/yHwak0JlHK0+5Cuw?=
 =?us-ascii?Q?vF9/Z3ZIBmpzJz45oAGfoVR4xORKGdXaExpbKBWvmoSqv3Ce32tjZBpn175Z?=
 =?us-ascii?Q?ByB9VsILEEdNDeN7aqFzViHZyPMzkXt0rBHCAO3MZHXtfdzyP408QZBVk7Ap?=
 =?us-ascii?Q?+ON2ElI40XFZlicsMqHaXvUeLUejJ5mDzZ+7SQW6fiworTNVvo/2bJJ72Nl7?=
 =?us-ascii?Q?Nj7zlTXy09VCi+jFkh9veIAR8XdljsJyH0D5uEGB0daiHwLzeL2nhxiKY2sB?=
 =?us-ascii?Q?bqyZFOqM6+ESDc9c3YHVs+nUD2RyrFu7ClJ/aXUDvEm1kuuKUXfdsP4ytqL0?=
 =?us-ascii?Q?88ddu+RfmgdLaHEy3SJnUiwRRnRhd5itS/xWjxw/obgTGOpPWHQTVOrUIv+d?=
 =?us-ascii?Q?IKWFKov6fxIA3P9rR+3JhVgZ7Ad7zn46X4slIEF6b2b23zItKjO90FewG4y5?=
 =?us-ascii?Q?Nnz62+coQJSc0/YMbszFma/yyTC4dlqi/hY9NdpkMehozgsB2KqT9bIwVJqj?=
 =?us-ascii?Q?SuG+CsxuEt0hrhpAVHFwxs+kP4nyTlMXSisp7GlSZomwatJ/BrEti24XacDo?=
 =?us-ascii?Q?A8WMkaZFITDdMFUPNyWCWkkbhJYOjjgTsw2yF04XAE/dP99w7MJ8dXCWvozT?=
 =?us-ascii?Q?Pxm9Lk5w3HR9JJvNR1cfri37pd3GXAapUIokJTCkzvfuKg1gZMwtKoInulyT?=
 =?us-ascii?Q?sjfzXgfkvm7mRhxfgXDe8e1rv8GEOUzN79X9+5h3jgW+L1nZeevHJzx4879S?=
 =?us-ascii?Q?fwaKqik+hqxiF5rqRDgJZsbhmaFSw1TjTl79Lz0nC2s77EPZZCvElK9XjKoE?=
 =?us-ascii?Q?U1Nv1cXTLbFGbw8+99EvDmGAO8ccbpZ+lEuuGstGwp4oZK2PXddyMk9VFmJA?=
 =?us-ascii?Q?q7U7IFwOBso2ijWsyTcr6KSBhcal1U4UtR8FljJj1xRxlTIVg9w4hfDEITcN?=
 =?us-ascii?Q?a7A8G7u4Ixk3dw3r6EqPlHC2Auol3YIIV/4jor/W9A3VDJxDD6TkS/nBG0Hn?=
 =?us-ascii?Q?HCP0k2dFq7yDYlOb6APX+zeT7cWIIVhJgoxXKSU5gbAFHezydQXPkvB0Zf8/?=
 =?us-ascii?Q?R15F49dT3A5uosw+NujiXhAD54FJlisdW3AxxxAhtobrFVh9Ob0N/MWhCnJa?=
 =?us-ascii?Q?ORiZTkhjkljyvs3EOwmZc1oAyYOW2+xGWqPT4wCktIzTvhwNWyPPwXkD9eYc?=
 =?us-ascii?Q?tibLjmCck5WxFixxKicWoC9gQ1iiW9CPOnJLRd+pGiixN/4vEeLb4bFRhIHj?=
 =?us-ascii?Q?Mhfz78ijeM2e+d1f/WTYZfzUDK6zuR+cDcE/ErXc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5e52ae-c8fc-4ce1-0cd9-08dcdefc874c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 13:58:56.6559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUGcXl7Y060mtktQpku9IC7SO7SfzOg7EJ+tvD9X0dpcGBWCOrxkoKdgXUPcTKY2wOJSoC2vGUowdD78blKa/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   95b722b3ebb739e01ce712254a92789f843917e3
commit: c91507b765b769d6930a2aab363bfb7b704b819e [6919/30000] drm: rcar-du: Add interlaced feature flag
:::::: branch date: 3 days ago
:::::: commit date: 5 years ago
config: arm-randconfig-004-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271134.DyCm0IxA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271134.DyCm0IxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409271134.DyCm0IxA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rcar-du/rcar_du_crtc.c:687:22: warning: no previous prototype for 'rcar_du_crtc_mode_valid' [-Wmissing-prototypes]
     687 | enum drm_mode_status rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/rcar_du_crtc_mode_valid +687 drivers/gpu/drm/rcar-du/rcar_du_crtc.c

920888a2d56f0e Laurent Pinchart 2015-02-18  686  
c91507b765b769 Kieran Bingham   2019-09-17 @687  enum drm_mode_status rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
c91507b765b769 Kieran Bingham   2019-09-17  688  				   const struct drm_display_mode *mode)
c91507b765b769 Kieran Bingham   2019-09-17  689  {
c91507b765b769 Kieran Bingham   2019-09-17  690  	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
c91507b765b769 Kieran Bingham   2019-09-17  691  	struct rcar_du_device *rcdu = rcrtc->group->dev;
c91507b765b769 Kieran Bingham   2019-09-17  692  	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
c91507b765b769 Kieran Bingham   2019-09-17  693  
c91507b765b769 Kieran Bingham   2019-09-17  694  	if (interlaced && !rcar_du_has(rcdu, RCAR_DU_FEATURE_INTERLACED))
c91507b765b769 Kieran Bingham   2019-09-17  695  		return MODE_NO_INTERLACE;
c91507b765b769 Kieran Bingham   2019-09-17  696  
c91507b765b769 Kieran Bingham   2019-09-17  697  	return MODE_OK;
c91507b765b769 Kieran Bingham   2019-09-17  698  }
c91507b765b769 Kieran Bingham   2019-09-17  699  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

