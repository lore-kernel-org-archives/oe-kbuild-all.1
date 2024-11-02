Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4016513C67E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730546690; cv=fail; b=ngCkBO8R1r9WigAbEo+cPfXuyiWbeQfqxJJJcUfE88Baa3yzQnT0ekpc2XhqNuxbd8f7aJXqSlAzCVEbH7f4Us0fu6cjulfh7Cnqc55/dmoQpeVp0nIFnudWG1s7UTVkkwIQYM+CYC7NCYVL2MdmyFni8mMt0t25TtzBPoeiogM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730546690; c=relaxed/simple;
	bh=OKV6YBT5/eemQ6OhuInPSwjWV/atLqSCpecriY0wwjU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ig8sD/83//rs1n8sQv/rm2sLNTVTrPvBKBYNP87FTs9bkrXq50NVVLiZqrCoqZI2Js03o96tZpEhiTBRZFgd9dlMJR1jkmhezLLNkrkoBwHmf0O4Q4+h6xsOtCxaKdOUtNqZ8nP426z0PFUG65ayY0xWVHHWiPfNmfzWVf4diRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYmDxg9e; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYmDxg9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730546688; x=1762082688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OKV6YBT5/eemQ6OhuInPSwjWV/atLqSCpecriY0wwjU=;
  b=EYmDxg9eBHJ/vhAVlrfnq2SsW6k5J3cg/57GRNufciqTJKnEJXgoEVm2
   RQs/XdLcRwkBKmmXiDARUmHr6I0QvslAoyOhLoO/v5llnH5v9e3n0pdfk
   2ytoKEOqof1IWksZ3nAzyJaNJaJiONZNj4O2dexf0gp19lTgYZJ4Xkkcr
   8pe06WFMRdAGHDK91KHLIKhRNdykBo8DfunVof7NZNx9GOpRS+ZCi+oeO
   t/JDrAPIXY0MC9AkG/eoLr/4hNE8ft71CRvfNYYLqr8SVMI5qfJYtOQpG
   uW4zYbZnujpMEOGUsXBWn8DTCzGTwKWDJS22b9nEScAlSW9S0mS3LQI/V
   A==;
X-CSE-ConnectionGUID: sBwAsi9OT7KX3JDqCPIBCw==
X-CSE-MsgGUID: h4YFDLy0T5iZO41IiAlQHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30150120"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30150120"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 04:24:47 -0700
X-CSE-ConnectionGUID: eRSbkhNBTfiPV3efbhp/sw==
X-CSE-MsgGUID: ZQVVrw/KTmiVwrmNYbXmUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="83651570"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Nov 2024 04:24:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 2 Nov 2024 04:24:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 2 Nov 2024 04:24:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 2 Nov 2024 04:24:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L21GgNK2LohlKq/aSw4SU/74N2d6Xd4ZaY7P+ZLKOvk8O1/gk9LC7b9EY4UALELxEIwI1rWv6Gb/5BOBylrMKk7G8ilutyOVEeJMs4nZlV61F0GoiTRUi/RySKgFGWMahKp6BN/5wUW3X45rAZ4IBzuie9ljjTuL3DViVguWIhBmLCqyiDFosGuvP8UJTAfQoHW2fwJpvtDZSWg76+OvOKeop5A6NOOBy2/bgnfOGWzba9j73KFnz+OkxLtFqiOMRk27OLAwp1wnlwJT2MDddrk5U8emFtqCIVnxG7xg+O2IqfJGoqp9ongmdqlYgQpnnjSBnLzsN4lgCw+nnY+1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpkApUQL83+8Kb76FtNsaTWvoFKX7CK3CkHIrunh4xo=;
 b=GajMSVpVwlxqXbxOApnGGn26PbubjeYM/4ua96C96npi3zgqUe4OOpsJxcyioDu5ZTUMx321N2TGZ1JzuvRTfurQ6EaLrTg6j4U0bd6Mw+VoMcGkV8uRlej6iHrpZQnWwM+uwWNGM2IE9ouHIDSObQVpeZXoR9W3twpU4rxeI3huJrXEhTmYSaMTPGrYp1W40BKNy6kWmipz15poJuJU632UKXsaM4hZlzu7FBCfJssdACDo1R2BFHz3Reb9GR3T2ZwgkIqjbd9XVjbOZFYd6h7T10zbDJ2D7IxtJB+t1RkLp6Nf7A3xrxSGwWy+M0GIZs/89Yvq2qxLPw6eXrT7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Sat, 2 Nov
 2024 11:24:40 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8114.028; Sat, 2 Nov 2024
 11:24:40 +0000
Date: Sat, 2 Nov 2024 19:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <ZyYL7ywEZaRJQ5UH@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 17dbe9da-749b-491f-17e4-08dcfb30f096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mR4BZihIF4/Vf9PAAWPqOSBmBs3gAoIPAsdOjaaw8tvYHj7vfmcmDWQGtbMT?=
 =?us-ascii?Q?Ear/VkWp4boeUq+SsEp6rTsXXL69kSQyyew5VDoLo/sQP3rexYNrWRrZgj2T?=
 =?us-ascii?Q?lzQ4S22clgbawxZeDwsiie9h7pynMm76wr6oJZ9crFh4wB5TZE8EwFJD5Tyz?=
 =?us-ascii?Q?kCO2tzIIdR9tdVHfgaZPQpw1yGkqh7c6itqFBUjs8FpE4PZym2ULn9bf07SR?=
 =?us-ascii?Q?W7DOzLCeFHdKxyszM3or2z3oGDBYnvG/wPRpNh1JCO1KWiZ3nC27JnatSX1S?=
 =?us-ascii?Q?MSkSQ4j0/JV+E/AqRxhF/0WsMqs3u13SvG2OSD8hcX6RhOVoxYNFLqccIWJt?=
 =?us-ascii?Q?jy+Ue96Om+ONbOesiNMCjIHdpxiSlAh47boHkP/URudIfJtUPYdnA9vng4Dv?=
 =?us-ascii?Q?HCJypytrzd7Xzkn5ZsgRQr2QiDs5XQmp5ed/Y9MipcmDg8KNJgOyGuKGQXM1?=
 =?us-ascii?Q?U2REzByGaO6L+gLDxHhkikbqc7W9x9YqF25/uAHPPqYn3TARi4xBkvw5FhgJ?=
 =?us-ascii?Q?yM8Wo9zYlXOeWunBSXnC1nv+TODzM3zmSHWFLw8pvCBn4a/KANmjxbGEmqdT?=
 =?us-ascii?Q?qUdSJ8Kcxw226qMHpekVEVt7URVTqtsmArrG9RtZR211DU9NpEBgyUykfZpA?=
 =?us-ascii?Q?0fhKPcTt3rcHkJUWoxyGoZmgUMIN8K+dEaza7QxnJkGMSp3yfT0kCAHpHbW8?=
 =?us-ascii?Q?yXnA+3tJJmu9lAah7GVSZ+k5aq3QuTky+3zBo4leHiBqd37waE6AQtHy1slD?=
 =?us-ascii?Q?ngdHJTwBnPr9zOwzGy9adb6zHr4eFClCMiyYVdxqHQEqxKlT4MCYJPA4lQd8?=
 =?us-ascii?Q?g1v4pmFXpLk2WQN6U9YUaR5uHbeZD+ToXO8rra/S2DGj9zkwa7lL85DmsgH4?=
 =?us-ascii?Q?G0M2TdKO3/gIb008KAwW7H+IdobftZGAo5nlfeHWRiby8LEPBwndHFksRV/J?=
 =?us-ascii?Q?1ryV1/WLkaWdkqzfX1MLaR3HQSeGkmYswWVkQWxyXWdfzoe0ToZBXVBAaIg7?=
 =?us-ascii?Q?2qCWy8sjxKtmAjELRNLM7SWALA/QDDaQ37RBQGTQE/Cf2fATISJVRyr+VTRH?=
 =?us-ascii?Q?cWvm5MBwQ/a3+QkT6W8Z0L+MwQ6aA3lIzo0P6gdrc32gC3s/8brSABZJzbQH?=
 =?us-ascii?Q?qcx2aMAE9jMQE+GICdodAq4JHXQq8FnA6TsBDOjouDTAOpmVC7O4N5yo9QUC?=
 =?us-ascii?Q?emyIrraH5FoQuRzimN0L5ft0ZhxpVIIPO3YN2xBFeH6TjDoFaQRtH5ODrKoj?=
 =?us-ascii?Q?iK9vIM5OEh3LkLBDhgQJgskAyeVPReq0GZfBHGLnvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oIlXsbLwEFAQgyPkVyuVwNGOxv8/7wOBEl9Uy5z9fDwgZYQ4xiZGhpD2Me31?=
 =?us-ascii?Q?LQh12tG/thARBiGUy/X7lji1nZ71t0ii8mbTpRQGLxVFqiDOBAxnKOPcZcrE?=
 =?us-ascii?Q?6e9/j6+9a1QSwVXiZN4NvhBK5ScuDBfHavSkZRuMnq+qNGZ/W4kEvhufP/uA?=
 =?us-ascii?Q?sDnTGDytIAe0s1OvNm8dF3/lAf0kLCQaUMoeSL0sCKmSCNmqbCf/uNBatvvd?=
 =?us-ascii?Q?uK5MLrAfcCTDMsIYNBHdTPd+tLfPT44jrzJgdqkavFOLKt06Oo/+L/yjScoc?=
 =?us-ascii?Q?ysa5P+k/8jCPFLv9RndfJnVthmNVsDcM9FqteZnvlhBT2Y5TS1+ap3YDHKt6?=
 =?us-ascii?Q?Fx+baCRlEViuQmTXzLbt5ZKsYfU9TeI9mtZG84Jx/2uN9Xpnff/LIZY81XFN?=
 =?us-ascii?Q?Xc1mps0DwLEAO/R1Ns1+SmiAELdxlHX34uWOhwFi4413PbWavtIHbEUbjv0I?=
 =?us-ascii?Q?JP+WIu36Jdrz/wntdaNpImsosMc5/3iOdekCHCOOR/5MyUaeYu3f4VixXGaj?=
 =?us-ascii?Q?GTvSl7hdHeoO1irkgfZYb/RNq6qIGnoIWz2eRB6urRRRoIWUT0NCKp0fsW3Z?=
 =?us-ascii?Q?vNJhL5I8Ltk0i14kFqn+iGIHtw8Kos/99RB/MEl4fUfgU0XT1zKnNcpoSetj?=
 =?us-ascii?Q?anZ1tuy1VWBc6mhkJdVA0DMorGgqT97zN/UrfDxYLOEWix+Z9pH9vJL7eq+c?=
 =?us-ascii?Q?mk/OPawnkTMQnLQoSH+l+2ktPcQ+HpslGfxAQ5JTI/G18UZkO+lGSrUxbxJZ?=
 =?us-ascii?Q?IM4e2cDCaTLE+QIeNck2H7IE8degU8daYpN7Kn9mfYi+v5E+/4yKOxfTijEv?=
 =?us-ascii?Q?S4a76yUv8eX5v4nxQx/maxN28ScLKxb2j7yqpS09OOK0gc9EUHVGxjaThO4h?=
 =?us-ascii?Q?F5gdmCcUPwquZSS6osncrvXO6QGJGvIidVfcnVGgOFNwLR0bVYYsa8L8ltVn?=
 =?us-ascii?Q?1KjyeqfZKb/vC29tJJTLQrmzAHlXIhHrwbCyI9GzAtcdfiijX2o+wEni3EmN?=
 =?us-ascii?Q?fq0D+mzOujGDY+iOEPdGc47FEHX3l0Ef0CkFySQ4lRf6ltHmLr3MMxLDkum6?=
 =?us-ascii?Q?trw5prcz4YuCDnHup0tsMcBb16ysFbcrgaDcYuzkPC/rmoVn6JyJNtVTR4tw?=
 =?us-ascii?Q?qft1CxGDMl16v7Hr0u/ac5alX1JJ9PGSBw5ZBxbF2FnyBjncdu/iUMd1NAuL?=
 =?us-ascii?Q?999037CD/qeK1U64bNuMhod5dglkoZWpxZEEaxHiIu84TrXOND0/tXAkjdaX?=
 =?us-ascii?Q?De4/dSDbZ1g3YKUn8/rm1mI2JvYmYKHIuj1inTMrMrgL0MOGqL2705VWanzc?=
 =?us-ascii?Q?DdzHQaRuM3EAYePwTEJtfe1i96qGDP0Nac8EOKfelfTb/TIDgk7BvtiHk9Lp?=
 =?us-ascii?Q?vCnLeCTuvfnsf8H58mgG0lEJgADuJejxEbyjlWJxRBckJxOpdhZMHOinSLcb?=
 =?us-ascii?Q?rGJQApI5dfPgUhZud+9hYCZzowVNfus/iy+PLNzHltIxll2W0t/RcDIFPJ8B?=
 =?us-ascii?Q?JMK3y07iiI3Lh32Q6F8XNBR0Ra1G/aiTIe9z6e33G5uu2x/DynU4toy6M6qX?=
 =?us-ascii?Q?g/EFc7bEkWlkIMz792E3MPQ2dCuI98Y4uXSLBxZ4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dbe9da-749b-491f-17e4-08dcfb30f096
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2024 11:24:40.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijupDyHGbzzrGqGpw3elDSo3kuazdC0nKH7g1UIH0KWPmh1vl+R0NmkrguksvWRQ69NT1Y8df7F2jFQ3B7ZCrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   81bd1eb3862e37f2ce6e1148ed51ac214ab5c007
commit: 851e91f44acdef60982a319ab23a152db843b98e [1/1] CHROMIUM: arm64: dts: mt8183: Add katsu board
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241102/202411021401.FCS2H4XJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021401.FCS2H4XJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411021401.FCS2H4XJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning (unit_address_vs_reg): /soc/i2c@11008000/sensor_sub: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:100.27-134.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/sensor_main: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:136.33-142.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/camera_main_af: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts:19.31-30.4: Warning (i2c_bus_reg): /soc/i2c@11007000/touchscreen@5D: I2C bus unit address format error, expected "5d"
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning (i2c_bus_reg): /soc/i2c@11008000/sensor_sub: I2C bus unit address format error, expected "3d"
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:100.27-134.4: Warning (i2c_bus_reg): /soc/i2c@11009000/sensor_main: I2C bus unit address format error, expected "10"
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:136.33-142.4: Warning (i2c_bus_reg): /soc/i2c@11009000/camera_main_af: I2C bus unit address format error, expected "c"
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1186.21-1196.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1941.28-1945.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2055.27-2059.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,katsu-sku38', 'google,katsu', 'mediatek,mt8183'] is too long
   	['google,katsu-sku38', 'google,katsu', 'mediatek,mt8183'] is too short
   	'google,katsu-sku38' is not one of ['mediatek,mt2701-evb']
   	'google,katsu-sku38' is not one of ['mediatek,mt2712-evb']
   	'google,katsu-sku38' is not one of ['mediatek,mt6580-evbp1']
   	'google,katsu-sku38' is not one of ['prestigio,pmt5008-3g']
   	'google,katsu-sku38' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,katsu-sku38' is not one of ['mediatek,mt6592-evb']
   	'google,katsu-sku38' is not one of ['mediatek,mt6755-evb']
   	'google,katsu-sku38' is not one of ['mediatek,mt6765-evb']
--
   	'google,kakadu-rev2-sku22' was expected
   	'google,kodama' was expected
   	'google,willow' was expected
   	'mediatek,mt8365' was expected
   	'mediatek,mt8516' was expected
   	'google,elm-rev6' was expected
   	'google,hana-rev4' was expected
   	'google,spherion-rev1' was expected
   	'google,kakadu' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /: failed to match any schema with compatible: ['google,katsu-sku38', 'google,katsu', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /: failed to match any schema with compatible: ['google,katsu-sku38', 'google,katsu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: i2c@11009000: Unevaluated properties are not allowed ('camera_main_af', 'sensor_main' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dpi@14015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: mdp3-ccorr@1401c000: 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@16000000: reg: [[0, 369098752, 0, 4096], [0, 369229824, 0, 4096], [0, 369233920, 0, 2048], [0, 369235968, 0, 2048], [0, 369238016, 0, 4096], [0, 369242112, 0, 4096], [0, 369246208, 0, 4096], [0, 369250304, 0, 4096], [0, 369256448, 0, 2048], [0, 369258496, 0, 2048], [0, 369260544, 0, 2048], [0, 369263616, 0, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@16000000: 'mediatek,vdecsys' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@16000000: clock-names:0: 'vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@16000000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: thermal-zones: 'tboard1', 'tboard2', 'tzts1', 'tzts2', 'tzts3', 'tzts4', 'tzts5', 'tztsABB' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

