Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3109C14D2B5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723302969; cv=fail; b=UvMrfoo9fYK49VrzfR4dsXjSEfM+u4tOGum3uKkqxy1QJ/pYLcmQ5ypS/tF1VT8zWTsmIgfXBeoZtwYbwI0Ey2kn4LfByQF9C8prrot2pzvS3dYEGqjtFwRztmBZQ3vyEgts1tJHVhbBjaFEWCXNCLXYubh0t1oU2pypFknBU94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723302969; c=relaxed/simple;
	bh=cOEx4jw8TqJTjiPdxiMX+yLLhAtf1xEk/MN8+ce/p/Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HzGX6lj5hPd2ScduaqHhXLC2wtnudUU5gX/5M73tH4CgCWQslHVOPrEWdO4xVgLg5bBrXrNFSzDBsOMtGLJM7lmmr+0fm3uZgE3yU/jWpQeB0bZ/1LqgjRfN3rrhBWjcK7wtnpVlIqLUf7+Y4BwHi7pNbOI/FxgoZJ8eVEcHYSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9nhOFKr; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9nhOFKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723302967; x=1754838967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cOEx4jw8TqJTjiPdxiMX+yLLhAtf1xEk/MN8+ce/p/Q=;
  b=g9nhOFKrNR369b0q/Hjmq+dL+6nnmvaAgFsOMrWd5pCHPWXNMEGdSzd9
   UvdnAQXOJKb9K/IXqxMqlTsrpaqt/v+d8sNWehi5UchtNNjVZcWoqbgQt
   taVHXBLd8Ouwm4mDy89AvYmmCIlqq3wzSOF7fWZpeQ8GharzpIk5n/Q/5
   HLPZB1Mshwej96d+tvMkQgy4tjJMFxpQc1/SC9+5L9wP5rLPyZm5MULOU
   9c0dYQP6tZMtkCvDUD+VAQHE3qKn3xrYsjHUThh+XKppTO1gsYMj0F4Sg
   aiMPxKeAsH6nmS9HCkVArcCdZSk+Op0NaHOYTo+QD5NBcTeY7+VfxAOt6
   w==;
X-CSE-ConnectionGUID: rzq/1Ck2RE2gw0tAaSREog==
X-CSE-MsgGUID: jaA4nZNcQ4CVHFLaF++7Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32043330"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="32043330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 08:16:07 -0700
X-CSE-ConnectionGUID: XyvvlBGxQu+n2/U6pPb4Aw==
X-CSE-MsgGUID: Mjrzbm8sQR+GYcom05S1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="81066758"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Aug 2024 08:16:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 10 Aug 2024 08:16:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 10 Aug 2024 08:16:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 10 Aug 2024 08:16:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mwnq34bOF2WePkrITOydVsQfTOCkXy5vwyw3hW8PS+bjputhGLx3zdiM4WBZe0GPjxV5/uobGAdIy4IyWASZJHrFsDAjsq+po3iuTHUS6KYW2p4z0BISCbJFEGkMrWYfscoiY9F8vxQbyxE7WKjiqlMfuCy0lB98YucM1afenTRCIol2Q7l3SgJrqfPvPjqz+W0UbzZu3+WAevKL1a5Jaiy3I+81bEtuzQceyZq9RjSzd9r2kP6VUyYi/dvyWnC7d7qAsxJf7FssgjQ6lxAVrevRLCa5XIf/v7hhASONlhyBUp1sxyx/YLsy4gFRxlACJ6N5H3/KuPD5AXMmFhU1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVFicFyz0qvyMA3I9qW+ZOtBppcM2D+0N3XYkskr3MU=;
 b=qNEBjyf01YFCRjK2iYx2OJ71vGn06bWrFzGsviLbD/FEUE0VAR7XNFTcFwS+c6+0cCvLiV5P99h8FSH8K5jkpdFthRGfIB92xsUNgegpT4SLWE4521gywn23MjDeVVNPgjyQtr7tJqIT2fnv3kNGfJTarCH6oUg7I/TkDwWovxWFx1iVY8kivSm0BGWr+pJXVR1kKKoaNSlJCNK+rOh2UH++z1s27mW+qPNrBMNXslibZa2UTfZg9GmSyn0fZ0TRKBxeF3Mf8MruZtdHC6VxK1bBFakedlVLlnchXA6HWVtUKnV60QfNweFDdzd4HpAfgw0GQj0vdeHEIhPyMh03UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.28; Sat, 10 Aug
 2024 15:16:02 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.029; Sat, 10 Aug 2024
 15:16:02 +0000
Date: Sat, 10 Aug 2024 23:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.1.y 23/91]
 arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level'
 is a required property
Message-ID: <ZreEKYfYPImkbsd5@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: c0537160-2a97-400d-04d9-08dcb94f5867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JqQKsw9MeadB208My4HTxEnORerJa0MsuLkzVWSRYqoB/HXPbM5JjV2/UYrp?=
 =?us-ascii?Q?GPm/Ke5Z/mQ1+ciOudtsJW5Kta61U9i0dP3ZIw1C/azCGLutd6whyXNjHmxw?=
 =?us-ascii?Q?w6C0b7EnUUHGgmeJ6Nknj62Fan9RTy6nsuYBXb+Df+b4keu3eNlDHX0jE2JS?=
 =?us-ascii?Q?1fLaY7tStGC9Nh/EQvZAqxN3HRjQkOQgM1WTKzqE5bbuw4eFDJNOkaOAi+5r?=
 =?us-ascii?Q?supxaq0hxDzitizQ4rNQKLpvtg5xB5gHXU/V9S8KS1zuzSLac6IHcyViAuWR?=
 =?us-ascii?Q?lTAODMd/NQirrVodGOyxohs5XL5hQEEqijzRMiuYYSQi+FK53wdjqcwBzZqX?=
 =?us-ascii?Q?S2RhtPF1RdPq6Fw+lRJm1GYsvJ3oEBVe0yS8xItLWdiW4D1xNN90Ki4sP1t9?=
 =?us-ascii?Q?lts844SduVMlEqrTz0I1TPytztMGC+amhCbRR4SI7GIGxigOdijnrstiR5DI?=
 =?us-ascii?Q?aiDaYTHGcktgsx+lehd7hfZMz/j2Lg6I0ELvrFakiGG85Mi6PEcSMIKNGfYN?=
 =?us-ascii?Q?+y7GQ1tB/jCdKrNeYvRF6vn0aIAxHAoQzFlbUVnysv3IBFqb1lgrJ/JWowkY?=
 =?us-ascii?Q?NLMCBd0PhSDjJ1OpxEw+qLYMOSeHgWW/MI1qqZBgkG5hx1mTWiZQguyjv1JS?=
 =?us-ascii?Q?QbwduAAoSFgQuMg0w2TnxMYyQ/RkxSRFG5V0naEcaxlqJX/DYFwosgYhh6em?=
 =?us-ascii?Q?u9GyVD+9h37mYERUhqRpMkv5Uibxa8R9mwgH5hkLk9kGOecYTmMFzeFRo2Dr?=
 =?us-ascii?Q?jY9kszM5ott3TmmywCrbhQi+xusLUGcz4/MYvx+cA2lnr44MkFmv1kiUbZ/L?=
 =?us-ascii?Q?EMVE1dLAAyH7bUC5ydUDdqyvnveQNeE58KSB/HpL5cxRb6rj/L+QaV0Bvud8?=
 =?us-ascii?Q?iVLXCKhr8VGHrBnG/4VlATCtB0dM7pAfR2PcyAEQyh608T4bR1GQfeob9bKp?=
 =?us-ascii?Q?vO0aHCNQzVn++z6Bwr6p420Y4PJFQ8MAxa8h5q4ZFxcGUCXW7Rgwtn6/Nkyd?=
 =?us-ascii?Q?zEk7EZyDKcc92vbUi565HQf+0tI1S3/OHG4fzNbFnqlFatyRQ6SLpbzkxeRV?=
 =?us-ascii?Q?AZpu4yaKI9YFAnIAYPzAD4ArWzedrThzyDrluFEZ/00Z+5OqcDZH2/+gmesP?=
 =?us-ascii?Q?0x8hsG8w8I8Guu0pR6Nz0X/fUy5cCo3m9jfuagE/CwCyNB5qhngK5xZlWHuT?=
 =?us-ascii?Q?7GCnKnlXEbTIGcdydXJPd/qDltv8uko2AGueykCAe2CdyKVEYWV9oYQIvuMs?=
 =?us-ascii?Q?34QE+OuFLKjTTc90pSt0oUZt8CNgfHNiGh+OpwcqoIqljGOc6z6mPufHIB4Z?=
 =?us-ascii?Q?pvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vC3/1rVpo8cNF/UAAb2TyTL39IZLRMvwVJanpHtZuwXfcUXG65CrwgecyoNg?=
 =?us-ascii?Q?eZr5gqOM0BXjt0EtxfIRF65UDglkf7J5RhMU0q7XyC+BR4ktnUFOSpF175fW?=
 =?us-ascii?Q?S4qbok1IQY7GhDNGToI7Dys363XWB+DL0UOSplpB6X4nvJgPNT1aRQbkszGI?=
 =?us-ascii?Q?JjD3853OViNR/OzlI1zL4LM66pmoVE+TzFKjiCuid18dohV9V7R4xPakL9aU?=
 =?us-ascii?Q?5RGKW9XWuHEP8reXE43UoEig9MUEBBhBMsEqSmuRen6ptpjrlTg7oQWcqDkb?=
 =?us-ascii?Q?WLN84e7zvLi86TVxH0nfim954WRGFL4NdEAjw2920dfmsEeyWvJGSlll92DC?=
 =?us-ascii?Q?+afeHIovntjTNpzXn2KFkVTUHQ+EMePjUXrF6rmyIZYnB0bEdRn9rymEHTEz?=
 =?us-ascii?Q?9JBzecZyKrKstM+kspJJ+DUva9hL4NiVVyPIlDjYB1EOPwHumR+ANAvnnrYy?=
 =?us-ascii?Q?dJQYq/6pvxkIe1G4lYJrAZV5qidscrMbGogg9A196QtSLgS3E2NMPaumtLmZ?=
 =?us-ascii?Q?irwDa+RCAaHkpQG3N9cWBcJxbrUbNrEYwCNBmZcq8/kMi5eQbud/bHw9kGZq?=
 =?us-ascii?Q?toi7BFCibCgZYoNEX+jsAAZUPvMU+n03I85S7AFqIBjftzPkDqsACT1u4fkA?=
 =?us-ascii?Q?7GX7QYB5w8IA/UDjPoz9FDeFO8aYIdpM62Iqk8pc2RtpGAzj7oHkT94b+LM6?=
 =?us-ascii?Q?CdaE4aCUS6gBkJTfyp2o+Q0tPjIIdTe+4jYsM7yJ6LovpaqxXu2hdYutGB9p?=
 =?us-ascii?Q?Zex/sOQ34HP/FIASPQnqev7xUCc+99YnEwaV4zaQCP3C99eSHJZ6x5nGo5C/?=
 =?us-ascii?Q?DJTjsVK6Eytz45hOBNAa3lHspNFMX2WsmHcLuubpYcn7Ayd4G06WtTKWtP2r?=
 =?us-ascii?Q?yeu+XEDbxpbNDrb3g/TJsn1vmc9Y0vBdDnJT4qNNRDbZ7/6fI2Q6TbzHjrAm?=
 =?us-ascii?Q?JdyZsaM4fvEO4CRmOoBNO1yNrZUo/fmE4lMWoDIt7jHvRUWvRm3rbmZiSGVx?=
 =?us-ascii?Q?zU02gbLnGmQ3JkhZBa+IQNW7NFr4AtudKgXYnLzH23Y02rMXitSDb92NJB0U?=
 =?us-ascii?Q?qTC8oQ+ug89t140JP6oSYzp0XSm6ZwFMTxdBhCkeeF+9HwTs93v3ZIOTtINx?=
 =?us-ascii?Q?jdc8c6+R2Z2JCL2d+dHc9xkflOaN0Hfwkzl4xV2WlLiaZ+72bEo1LbVMm/yJ?=
 =?us-ascii?Q?on0bcqZMx5L/304ZUCkLsW9ehqsMrGOMPhhnI+i9bvDUezdxcF+Aa45tGWgp?=
 =?us-ascii?Q?8HIJgI6gLh3n/7ukGMqxVkG8RxMVqa4d35VUA61q9a9ZJ/u5TMPKg5gq2Olv?=
 =?us-ascii?Q?vQ3vrqcJSvxsurUhkdcVJvVF6scZGmcuHJ5s5krjE45s5DG8F3KCdz1oxgZ+?=
 =?us-ascii?Q?oqoDYOTNCxT+qLQ3fXl4VzDaN1LwJhG4xz1ww4uX/P8EbHu21wWsMA6YYDPs?=
 =?us-ascii?Q?p3GTZYRpp2AWo4jhNnTG+S62spMhSoVqefInzCy7rHdkZmNueGpKW5nZI9ab?=
 =?us-ascii?Q?ehJHp6J56jTyTH3rwaMQa6zZ4nBIYP7XCTu0iBk5y9eLCN2OSPVagVLKDF+O?=
 =?us-ascii?Q?AxoPyIPVyWmlp8MXfD0G4s0McQqVRi9A3hu3QB0+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0537160-2a97-400d-04d9-08dcb94f5867
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 15:16:02.1513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNUr+V21qjKNOARXk3nZ1kenmXy6LvMxDcFTQ8IvpRUtWpQ4zw5YZnm0SP2FGQ6vp9WMtr+Teyg6C00gEuxyYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2a5f985c90ffd8f4e2de3a2fd76f00c3e322aa6f
commit: 5e5c31f1c11458aabfa51021f3e0319bb051330e [23/91] ODROID-C2: arm64/dts: add 'meson64_odroidc2.dts' for compability
:::::: branch date: 3 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240810/202408101815.KMf8Wrqk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408101815.KMf8Wrqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408101815.KMf8Wrqk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:252.29-257.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:534.15-537.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-719.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:534.15-537.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-719.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /firmware/secure-monitor: failed to match any schema with compatible: ['amlogic,meson-gx-sm', 'amlogic,meson-gxbb-sm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /firmware/secure-monitor: failed to match any schema with compatible: ['amlogic,meson-gx-sm', 'amlogic,meson-gxbb-sm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /efuse: failed to match any schema with compatible: ['amlogic,meson-gx-efuse', 'amlogic,meson-gxbb-efuse']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /efuse: failed to match any schema with compatible: ['amlogic,meson-gx-efuse', 'amlogic,meson-gxbb-efuse']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: scpi: clocks: 'scpi_clocks@0' does not match any of the regexes: '^clocks-[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scpi.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/interrupt-controller@9880: failed to match any schema with compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson-gxbb-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/interrupt-controller@9880: failed to match any schema with compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson-gxbb-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8550: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8550: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8650: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8650: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@86c0: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@86c0: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/clock-measure@8758: failed to match any schema with compatible: ['amlogic,meson-gx-clk-measure']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0: failed to match any schema with compatible: ['amlogic,meson-gx-ao-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0/clock-controller: failed to match any schema with compatible: ['amlogic,meson-gxbb-aoclkc', 'amlogic,meson-gx-aoclkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0/clock-controller: failed to match any schema with compatible: ['amlogic,meson-gxbb-aoclkc', 'amlogic,meson-gx-aoclkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pwm@550: failed to match any schema with compatible: ['amlogic,meson-gx-ao-pwm', 'amlogic,meson-gxbb-ao-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pwm@550: failed to match any schema with compatible: ['amlogic,meson-gx-ao-pwm', 'amlogic,meson-gxbb-ao-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/ir@580: failed to match any schema with compatible: ['amlogic,meson-gx-ir', 'amlogic,meson-gxbb-ir']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/ir@580: failed to match any schema with compatible: ['amlogic,meson-gx-ir', 'amlogic,meson-gxbb-ir']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pinctrl@14: failed to match any schema with compatible: ['amlogic,meson-gxbb-aobus-pinctrl']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: bus@c8834000: rng: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8834000/pinctrl@4b0: failed to match any schema with compatible: ['amlogic,meson-gxbb-periphs-pinctrl']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c883c000/system-controller@0: failed to match any schema with compatible: ['amlogic,meson-gx-hhi-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c883c000/system-controller@0/clock-controller: failed to match any schema with compatible: ['amlogic,gxbb-clkc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@70000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@70000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@72000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@72000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@74000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@74000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-0:sound-dai: [[57], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-1:sound-dai: [[57], [0], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-1:codec-0:sound-dai: [[57], [1], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-2:sound-dai: [[57], [1], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^dai-link-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

