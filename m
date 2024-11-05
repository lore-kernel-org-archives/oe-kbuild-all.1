Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AD3125B9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 01:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730768409; cv=fail; b=FNUXlBX8m/GiEpmeUFjqnxvqqVjKoIntM5xAHWsXoHKhz8nwZYU3UR8ml/QHduIYgafAdJ4MIvlL6PS8d/GFMQLqPjQdyRbEBjuClTJP0vhzWESygx5pNZ3PhHOVr1xBGyHfBP4XUjws6o1O6qjzY3b3JZK33qImPebhYYYQZIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730768409; c=relaxed/simple;
	bh=cnZecLiJYQ3KyJA+1MewovBVKoy28InPnoRNq/A8dqU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=g33yxWtTgLYnl6GVC/UOkIdH+acSM8dnSw3Oq2eHS29XlDno4WFGme1yqcG69b1kKzU5cW1rYPM1ZK11FKHQCBPZjP9Ctnq0K9Xetyr3B3uwIMkso7wcZpIJK2Tmp8kI7cCyDi7Hb8C5iNvHidoAigiY/yS1KpSpM/dGUPXJJZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CE6I6da/; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CE6I6da/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730768407; x=1762304407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnZecLiJYQ3KyJA+1MewovBVKoy28InPnoRNq/A8dqU=;
  b=CE6I6da/NET+cUzbJxLZrfcc7AU9j3OUQioukuwMm/mZ+nVlENcOeU22
   cl21i2ERRTLr4sxc9WBZH3schpGPR3SACTF7r16E30ut7sN/+QjCmewim
   ZiRj/cDSl++Xx1g7YFyzLOm+HMd/Fh16Ng3eGWezM5tfKrJGZYiXmNKFt
   8Sk2I9heR5LJhgdmiG55OtaLHIBMopeCfd3Z9B9RjVTigTcY1bsviTUm9
   TXFE8Fdwai9IJd3XpmKmlRpDZNJ1NghAb4YcqtS3xXPxWg0swVIi98T+K
   C1pDgDc/8QBBVQCUbmzqPwuflGDfjvbveDHJT85Hp5wXmta1UaCv0J0/e
   Q==;
X-CSE-ConnectionGUID: Ichp04uVTLKXCGjqZxLf2A==
X-CSE-MsgGUID: /Dy/qCE/RKOpQyyfSC6r6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30441864"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30441864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 17:00:07 -0800
X-CSE-ConnectionGUID: 71CEPXW/QU25RTJMQGyKLg==
X-CSE-MsgGUID: XPgDbNwMRsCZfCPFFzW/rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="87754111"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 17:00:06 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 17:00:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 17:00:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 17:00:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9mELgvzkljoH65jE0ZZGjFDfLNVEvMmfVg77CRGZ3zt4Zg0aCnTY+76AaD5UuKPDZmSaz/tmuaxTPaGBo1bjJ9r+oh+whYTH4csLvzXZcxqVePGVEJ4JPfefpoiP8cerqF+H+Z4lRWvlbrvV5e+POAt+6WmyCuuJ8srCrOjTptZS6vcUdSGBsY+SDqrWH4fT4Jl6Fpskeb0MCpuXQghD2By+fdqB3Wdn2+kXTrQKgMl2QgYdKCIrTAtB4/X/PGLIsMTLVxU+8BPtZSxHrfyAqpVNz2rE9To/VoXVK9o0Euf9/InAR/6yQsMSO9El9QCFaP92yjlqswCTV3nodNllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BGx0f7HayQpIFJ7pXvcWMY6GPZ2DekrC1phBRov5J8=;
 b=ZOiRCAUieDSpWIBmIPAb+GPtSB+gBA/RM2Uh1cqRE0dyEXyI+EYaEMdvZsurxStTMoJPYwfXYhgE0ZATs7iybjXi1UqgtrnFIrYt3G6H+Iquxnxrsn1pRdRRyVXk3oJcTJRT55Q+Z5yhwDFt0y8T9awGU1aDHxvtB1ojLL5iUi8Lz63dd/P7imbOnrjLfovW35IpEv74p/Jxa+s16yImiT6Pf0BfTBGGqcbKWeCXt67ZqzDLIs7G2Bwi4ZJ4rw6ZQdFNRRN57/uwuXUb3G7Drwqx3mXqcz0QILDqk4dGJOsJ6m6qtkV4+KYQjFFknRJogfqzl5wTbp3oAFERYnVaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS7PR11MB6222.namprd11.prod.outlook.com (2603:10b6:8:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 01:00:02 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 01:00:01 +0000
Date: Tue, 5 Nov 2024 08:59:53 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to
 match any schema with compatible: ['google,pico-sku1', 'google,pico',
 'mediatek,mt8183']
Message-ID: <ZyluCSlcso9x/ipl@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS7PR11MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc94550-2736-4e07-10ee-08dcfd352d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pDhGN9vVjhXmi2dXqGdsherePlJzBe5X5oP9Nd7b1KwFsYSVaGfll5BJyc52?=
 =?us-ascii?Q?WlF/97t3TZo1EpwiO98JJ0Cmf1/vcGkrv2MQy/YNmhbCOYL+nWo9xGSKdFWY?=
 =?us-ascii?Q?HidQPP5dwumA4wtyjS7/4Y1alQjOIE5AFhwcOz0YLE2GdqtPVCpJOvO0lTbe?=
 =?us-ascii?Q?cSsKkUjQtbJiJnuNw0GRiqMOy/+iW3t1dIVreoyAtsJJxs617gJ+ZVg1k12X?=
 =?us-ascii?Q?V1ZvMc2grEY367qkoUjDXrugd5xN6s9TZLrBqpaETzi5u1CvlH/xOmNCKyZE?=
 =?us-ascii?Q?7vXYEZ3qvDxaVH2amPbeiRiO7zGoEliCkNPVjCcseKwL2UF+tNzjNHDNk5Bw?=
 =?us-ascii?Q?BrLAHBvtoyAmn2Mt7Mtonm6GLG5vfDyD+2uPRHuMYnVvICHGGUqUcKUHv8hF?=
 =?us-ascii?Q?9F6aNHRGdYn8e8QOATUMjOYoJDNleIVWeWd/1LAL/QVTkVZqeS4xRLiEtQR7?=
 =?us-ascii?Q?IEs6fCbltSzJZB3Jcq83v9wxdunysPVg+3DubZ1dIXn7BRPUXPYGD8Rb752t?=
 =?us-ascii?Q?XnV4C3kpQFXrh7qf706UQ1jbdlNVCJj0kMA3a92D/FwUoayUp3OcvBd72IM7?=
 =?us-ascii?Q?cqgHQoIx2i5PE8SdHIzxQqOq4ztFsnpYkslSMNNSQT9M2XPYpL6sfTVt+NaD?=
 =?us-ascii?Q?fyX4AKnP4f+vkb7AA0FOfUzv41kGlayt9sc8mrk9v67hJFzz7lF7aY1dktDI?=
 =?us-ascii?Q?wpeK2FTcGzoe1qttxlKEBtKC0vaMY1nh3tQr3Ve8QiXLxYkFm50hKYmYkk6w?=
 =?us-ascii?Q?zjkVwmvDUYrfYIpiFyhl9HRY2ZgBF26kS3nVsrJItIFOhrIkxRRpw0tq9nSf?=
 =?us-ascii?Q?zPMj4UCWsLlW47h3CJ0fxQUo1SBB5CDpT/Hu/LNUItQ6ENGzEzBQWfzrhdYj?=
 =?us-ascii?Q?jsxFDvNxpsQRfRCjNsq2LTGDfDjc+TSLM5tUlXa1oswRxy4h8N+NXWA9bf3M?=
 =?us-ascii?Q?xfZrplCMSEKBp+MU5mqAkjAokXeZmICvZSSG1cKHkbMWLfPIpax0libYZjS+?=
 =?us-ascii?Q?sCBZNLpQBmRW0khUbpDBrly/vb+kR2s/QFsjrLKum6GAxRZX0htQRU1yyWQ1?=
 =?us-ascii?Q?WgHAe/rP0L66LTezfyNUcyYTO/e2sAmLnxcflTT+oQhr+63xMWUhojeMxnaW?=
 =?us-ascii?Q?CM9+kroCp9y2cgvGgppCj3cgCqpbs7Qx40B7G9vu3KcnUsUYLPobO4/DNYIn?=
 =?us-ascii?Q?/hGTAHDXLY84qndugYTa2+3ElRUYJxSInH5N0HZmEnKagzteKx/4pSWV4FPK?=
 =?us-ascii?Q?tM28eJTir62yRmNsEs5P4S82fwQeWWeLaeQoQkar+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Eo8EJBtNIUEzSoExpvsrRdKrD+Nbz/HCuxmbdi1gglIQSw+dOO1CFFtyF6h?=
 =?us-ascii?Q?lGCwy1x6aF+JmiI8F9NRG5Pk0nO/yBfSBCpvAhmPnkfJqirf6qetUD38PnF3?=
 =?us-ascii?Q?m8ycZKFr5X8TUhVELlQ4UEYjH/kciR/G6ZMUTNHdahJl3jnQjMElHfDCCOvW?=
 =?us-ascii?Q?nBjZi2IkWtKsg+z+bfhpeDzDxczBKd2ZjTGgbizK4n2srCP2iPGB8cIeT2Y7?=
 =?us-ascii?Q?tHwreAwgeF86GWzmwMl6VSBdtXItz53PK97yXXP00Bz6phMckt1k1a6O6lFB?=
 =?us-ascii?Q?rmemheFB7YdKA5QsdjT4NV6RFVPRb6vIIY39wFO80RMxHrp2/HbOQ0h4FhxB?=
 =?us-ascii?Q?nCI7AUvoi/5VwbT7Nqv2iUww72q8OQ0Caxj2IE45e3yB4E0bC/qYS5YiOHz3?=
 =?us-ascii?Q?ScQh58ewhScPZw7F8iH5UaK8ZrwCJBPJqMK+fX38D4UHMkfmqkNRdYFZMuQ0?=
 =?us-ascii?Q?fl/in/XYF+GQFz6q0w5uOZZUn+xjaSX6cYRHHauh3oW7xtOypS7vAqsPB2zK?=
 =?us-ascii?Q?OWRom/7WGLpLyD9wuAKKriYt/eT22WuRq6+Zq+rjXVjlRC7yna9XSe1im7hy?=
 =?us-ascii?Q?1xlH+vUw5LZspifQ7J/hWQBGRvF5GJ7dXNdNnG1JtgAlJCsl3WZ6woF18i3E?=
 =?us-ascii?Q?EuEhBzuYyuMvHfsTRXTL84WFloB94Yw940ws1YZv7/+APGD7Y9c0xZP3ubef?=
 =?us-ascii?Q?HvgGu8J3eMvtfIcrxiYgF9iD0kllaFdnZYyqZxDZPbWG/HkFji80sN53oD4r?=
 =?us-ascii?Q?uO7E3pVpu4qnQHwESDGNzDmMlJvPv868e5Ab0a7FCzGK6sfo0kcAzmb9oUww?=
 =?us-ascii?Q?CLNTyRU2ZX1kKm3iepo0clBYL0LrJWY5ex9d6BTtVIttCB9mAEXTrg7Gpl9b?=
 =?us-ascii?Q?px+V9kykQMYIzNGszIyIzH7SC9NJXR6L3txJeCO9am8rh27m0xy5x7MzR/YY?=
 =?us-ascii?Q?04jfRgSeuDaI31i0qt9IN14Da1eL40Bi3kJfjNDQfxd8Nk5kufzD+MP0bMSl?=
 =?us-ascii?Q?YLWFtRWY/AF1/uqOyR3hOHyCj1KyMkX8b6WHqso4zEprkGw9CXfeS8+MGS6W?=
 =?us-ascii?Q?4zMx0aEAPQIDRk/B2OOf6nRjDfAyGV66hdlb7vIAfknGTut/hJZ+MDSOAjN5?=
 =?us-ascii?Q?djbkkC5IVOqiB8kIN3/vHHWarPw6zOyOU/X0r+SmgCyutpYBuOqr9MrAp0ec?=
 =?us-ascii?Q?hdwClaPpSm/04a0c1v9JQosMhqsNb/1KN1WZdqeariKAThW32q0ds2v2CVHE?=
 =?us-ascii?Q?64xW+jPHff+I22M55hAq6f/8wf1vhTEIW+YiYiz6U4vTPVjrMU6twyCf6qX0?=
 =?us-ascii?Q?qEfSAu/wIG52cC3VSBAH60fbiGaUYDoqTOTD0Ycw7/zDpqldZcYtv1Sw9G1c?=
 =?us-ascii?Q?Ij4aY8oR4GQGITO9k80uyIVVz5cEuYJ2+eaIyfLbxQnWzksrxLq1mC5bF91T?=
 =?us-ascii?Q?kXlVOyo1j67jmnGVDIo2OhvqtzIJfr4mlgKHLhKAMcSWXtYpSW6bUJEPeHtB?=
 =?us-ascii?Q?eOg9sIAZst2M5DJBHodBZf0P/IUxdrN9Uc5cIveEPPvd4rYXUl7VYKmior6O?=
 =?us-ascii?Q?h6vXJNJoCB0Fe5ao5DXnm6NFtleu+3idzUgpLX9s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc94550-2736-4e07-10ee-08dcfd352d4c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 01:00:01.8488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8OWwvB4ax/Eh1Zn4ys4/HG7VlzZ0HkRrzjQElxTipVV7i3aKzXK91dbjmMmFcIKsZbLgLIcwvSNDAlDSgnXHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6222
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   81bd1eb3862e37f2ce6e1148ed51ac214ab5c007
commit: cbae8f3e9b30d9136bff1155071d3d2505c45e64 [1/1] CHROMIUM: arm64: dts: mt8183: Use icarus dtsi for pico dts file
:::::: branch date: 4 days ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241104/202411042239.YItwcZ1v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411042239.YItwcZ1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411042239.YItwcZ1v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to match any schema with compatible: ['google,pico-sku1', 'google,pico', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to match any schema with compatible: ['google,pico-sku1', 'google,pico', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

