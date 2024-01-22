Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CA63D540
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705933739; cv=fail; b=SG+mSDIxHW2UTt5F0G95M048EsS9YI/rfkFDsvwBi+FvjdSDOUS6EYk87kZB0gtJW4RDYUYMrujQXj0rorhW+5cO2xl3EjjvuoJT/6wPDlwmp654QV2ToHSkzY4uLuGW0HlHQqtDFnofvHKKf6M8SrcjcEtIvhazBbZDHxnyYyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705933739; c=relaxed/simple;
	bh=DPgex3bH+pUcWloHQ4p70aQYdjnpoNZVobVsTdolQ2g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=i4vrkaWHHNrMq+dGSFprITLwxeG2Li2269foe0MsDlN7d1uSGD3K5ihsQmLddYYYmWHYJCYJpbgftTFBtkh5FX5F7LXPcXRNhVw0nOtctM4pTpQehuTobLWexzMG648EXM0MdNBHKPO/4cJ/VuJsgh0HiCgeQcaX/XjZ0ZCgJ8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTy3ZsLR; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTy3ZsLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705933737; x=1737469737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DPgex3bH+pUcWloHQ4p70aQYdjnpoNZVobVsTdolQ2g=;
  b=VTy3ZsLR1dn4jCzGGAeSByhfsq02Y9rqwZlEPxc4XnMCKEqOVLqtkC5G
   7GOjU9LC06UllJmngYdcjhKkbgG2L+Ze3l1U+L9CW0OfCNGaTiHROERco
   oeEX9oPymaAuAhnMNR3N/O8RjXzcXbOKOv8aXXT3X7OnSUwHi3yAg0v51
   n3I8Fi7pSDLQZqJ2gn7+l8eOlXz84RpkhFpaIepxKE2ChoaulBqC60owr
   RDnSEtk/1Eelh32HGw9G6P53M7s/lf27b6B7X433t0GPkVg3ZgunQFf4R
   wtXQzTup5sYMVLiP9iLOw8ltfouNsulQRC3YK/SojGgzyaH0tiwgbOrgQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8591869"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8591869"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 06:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1202804"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Jan 2024 06:28:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 06:28:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 06:28:55 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 06:28:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkfrjcdsXoAmQLNpnBv41D28oNwhZ/hABg8ldUTe2e+cTd4IxdhMRaQ+U79ZpwVKegrk8Zw1L13g/oqKTezQIzLL/kA9oxF/o3Pzf/0fyo6yQnYrTx+aSesKv0v20lhtBk5kkqyxFelLPtKDdkcCqPsbjX9qg6e7thWSkTku+tFmTFzw27xhM4VZvNSUqA/hS9J3/eei0T3d+GWRBGdhepK5CZAG9P4XLfI3yfHRRqv8wK7xOx/Lz1B5PLrfo9sNU2yL2MZ08BXbz38dcZZXMSULD+CfQpm6q0deZpzL6j9foj/8fNhPV2ZYqtomxPT3Er3JB4s5DA5/j7wjwTLptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HS1JV+heNKmZJnsqPwXNZHFKGVfkyBmgio1SpJNyCyI=;
 b=CUjuYBW6GuF+4ZnrvSYZhEVqjmDPt9f8H1KbotpM1oi/AcjxuTN5ZXO85lF+ssvztmVFH0NTVNngxPdXIhuxwf6j1ViNwKxvfm3MP+siHTuJm77fqpTs0Mj02LRHklKmtYNPrNw602Dz4i+uFm0zq/pkrVgPot/U0c9ilH5DoxYaVZg2xJoPnAmE/vrkekfo8UMFyiGwlC6Y77sj9MiObcE1uVpGptkk6nR+yneqPn6LshWPsQdUOBalu9zNv3O+BMD/zjf99TNiiG0yYase9GCqb7gvdvFXRb1WUoZZQy5fMBdx6N/hjS35u/1MoHQgxXVaVC0SBAi8Kzi9Y57lMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by PH8PR11MB6564.namprd11.prod.outlook.com (2603:10b6:510:1c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 14:28:51 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 14:28:51 +0000
Date: Mon, 22 Jan 2024 22:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>, Guenter Roeck
	<groeck@google.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chrome-os:chromeos-5.4 4/26] dtbs_check:
 arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (pci_device_reg):
 Failed prerequisite 'reg_format'
Message-ID: <Za57nPzEpITa13uF@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|PH8PR11MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: d9257139-c658-4021-e2f1-08dc1b5673f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zdw3Lb15zgaZ38QrkMnpNcPd0lozYuKsY8xgY2fdDDKyzTMYMMwKNBkCYlqat+Eyqx1Uv+VSUNX5tr9WtO6jdNQe8jRkkwEZSO/keI2x0VqPqNVKCZ55jfsVo//MY2d9yJevWuYL1y2diBbGmJSf/1zj2eBRuDyKkEGIAIlCqq6jhAb13ODhXyenLXwHQfyYXRTZUMgi3DfAEPIQxDA1Ah1Nm6eFOOSIycqVAT5pC1S1o9yCCWdR1TPDMNaLO4qvdaJtAIVP9mOn0DnVN9JGSK6qpOER8vh6hxBzyuQSZUuU4sLMSi/VMol6yBB9V4JzMw6hdeyRCooNFX0OxNfdYXCGu0WlRBQgdLcM6bfJ13D9V3yyIAuyryhEb/mav3FF+vXPps9uSQIYBGUbuaRlX+fbCj4chVa22HnSLqUUvofIjVEXs2PalvkJALebnihfmDh9I9UPHTiro2V/Msz96kacjwf8OgcnvrOWv18oQSNPzFzRjJV2l3cZkB+woDe2NA4/9GMcb3upb1fCZ+QGb8NNuSsdw9PPpg8HUDq00MuVOi5je/eeE6gY8NmnLLjenbgsCNhFh47c3SCt+n5GKYX6CCflo1YL/gBrhWNhVPRVUdGAq1m5hsz7Myqfj4ysB1aou1UQZaR+XUCvTof4zksdfM+E4kDjdJoXN14vzmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(6512007)(6666004)(6506007)(5660300002)(9686003)(66556008)(66476007)(66946007)(38100700002)(8676002)(8936002)(4326008)(2906002)(316002)(966005)(6486002)(478600001)(6916009)(26005)(83380400001)(33716001)(41300700001)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2DsEcdAraJ1uAYwJydOTWV0lBSif8SG2rvPvzx3iDHzCZkU8pgKjgO/LGoWH?=
 =?us-ascii?Q?TWmXBEup4xev/spCKjYfhMn3u+2tAp1VAgBnJc0GACO+E19eAPhhCdXu/xYT?=
 =?us-ascii?Q?leueaSvbFZg4+ZpZabB8IY90U0Ca/Ng9OudN2xkqlP8tRM9Kou5sd4cXhxwS?=
 =?us-ascii?Q?iD5jZEVFn6wP6S10B+TKb2Jj3jC6ktOG+HV20PJ4QDvGXp8SiE7Kih5VVrWq?=
 =?us-ascii?Q?Ny/cmOSl1hay/7OG9wflqNdNoHn0w37cl1T717QjFHS/OE7LtpWwg3ZC7ur5?=
 =?us-ascii?Q?aCic8J0MNbST2XPC4RpEOQl8OMpZJVEqKgPAziovK9fXTcgalxfjPKdU0aqE?=
 =?us-ascii?Q?zrrEcQrQub0lEcbyPSrETDTr9RwgedhEI9pCludsKBR2gJS7iF4OtdLbp/QO?=
 =?us-ascii?Q?h+wKeV4WwHiKb18I7hXYNmuRKSeoj1Nm4SqeXS7VH+LxBmcYZ5XpjzX3R9IM?=
 =?us-ascii?Q?Nv+zuhAsWp1Ib7qN7oJvvqYdW0Luv5FFsi++BR8eZBByu4n/QPWbK7dSHQ7C?=
 =?us-ascii?Q?eWLqUMuEhDnDtnMBE7BPI7aQtUpkDccwWR3csvkHcdVfnUMyk9S9P0WRqLru?=
 =?us-ascii?Q?PpS4WmEn+57OfYirq36Cz8B68w1bkihDTMY7N/Tq79D9BboeacQT90v4f3Mg?=
 =?us-ascii?Q?BDDye30MUpSSrBKdCI1RMUOXTWvHMvfPH5pz9NKwRtsWFLMX8ruxHXwE2lxQ?=
 =?us-ascii?Q?auY6Z4u3mPrNc25Z9YF1hdK7lIa7c+lWJMx9y0rXqReVaPYEZiDRYy7iBlkW?=
 =?us-ascii?Q?OphYXiF5qLN2Byj+lFTq+uMKDRvsMU8otzu6u+I6/8f7skRAoF7AODj/0xEy?=
 =?us-ascii?Q?XiU8H+snwX+SVtJH/yBNKlsohzmcIFGe/0fDjhmP4Fsy2Com0D0YtBNyPATb?=
 =?us-ascii?Q?IO0PW7DhV44eERTJEWIWcTc0/pWrCSIapgAALn89+rc///e0sbvYSlUn1HV7?=
 =?us-ascii?Q?Ui9Q9Au2UrkWF2S/H7aQAbmhpHo8sDXWljWYUkmDAyGU9OFb3NlqZlfEn4Y7?=
 =?us-ascii?Q?OOUYWbVSESj5F+jDwZg33ZcCYP8GMeTUyWeuLOD2+XZubHHGPdM4nf5zGXLy?=
 =?us-ascii?Q?0e+AiY4SL0trLBsgV1J3/RrNAH4AzAVUIt5Qs9WwpO48cYG554SwkCHpA2sa?=
 =?us-ascii?Q?tq1lp1MaRE6CSNGMq3L55+2zLX+vvAj3GArfhmijPKq43uPH7T+auZf518KL?=
 =?us-ascii?Q?WrocwcjlYMGhBwMbWzwr3pPjsiyb+0c3TfRJedCYaIJe2CfuSLhy1P1UB7Tb?=
 =?us-ascii?Q?1WgLkk50ygfS/1HINWHhfySS/W83mDsBuleeTaN6oUoEqOXAYfZdD7gfHN1m?=
 =?us-ascii?Q?XI+BbShB9oopzx0crQoceDc9SXwuwJQ/imRxoUPQhlj3peZqoJ3/G6oiD3yj?=
 =?us-ascii?Q?P1YZn+SI73U0CJsKfqhQ6kfAHHuWJl0VksPaxjzY69WCwtpWNuoe+AJI95FE?=
 =?us-ascii?Q?LOW7Eyb51CtOuCSvsu451mi8aC1DFS/YmnXS6NfgENTQFbq0VgvxSeX7Y5SB?=
 =?us-ascii?Q?jIpXexScNFk6DhJuMBpn4EsUrWc4238H4zXYfSUngRvON4wMUQtw/4g3iE8L?=
 =?us-ascii?Q?CtCOyPuYxFsbjomxQxbjg7+H33U64+YQ/PYUHi6C2JGqFT78Bw3uc0hXu2PR?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9257139-c658-4021-e2f1-08dc1b5673f2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 14:28:50.9066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iG4tEOwHn6t4V5KrbiYy0eJwJx+K5azVwmTIJZ30/Dcq3aAJAdOKZ8lFJAlsV3pCVOJ6qu+zfb75NUYLVbOTRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6564
X-OriginatorOrg: intel.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   d0f9d7ffac45b1b5471e3e8e1aee6b70c8be0cc6
commit: ae731dda9a603073b32b2daaafdaea6d294acc45 [4/26] BACKPORT: FROMLIST: arm64: dts: mediatek: Add socinfo efuses to MT8173/83/96/92/95 SoCs
:::::: branch date: 34 hours ago
:::::: commit date: 8 days ago
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240118/202401181235.njZUy2u3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401181235.njZUy2u3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:718.5-23: Warning (reg_format): /soc/efuse@11f10000/socinfo-data1@4c:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:722.5-23: Warning (reg_format): /soc/efuse@11f10000/socinfo-data2@60:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:172.36-179.6: Warning (unit_address_vs_reg): /cpus/idle-states/cluster-sleep@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:180.36-187.6: Warning (unit_address_vs_reg): /cpus/idle-states/cluster-sleep@1: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183-evb.dts:208.23-241.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc0@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183-evb.dts:267.23-285.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc1@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:744.26-750.6: Warning (unit_address_format): /soc/usb-phy@11f40000/usb-phy@0700: unit name should not have leading 0s
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:717.21-719.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data1@4c: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:717.21-719.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data1@4c: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:721.21-723.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data2@60: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:721.21-723.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data2@60: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

