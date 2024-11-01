Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C4A1C687
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 01:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422988; cv=fail; b=tLzwrmos9z/xrw15F73ee/i+6rBvbCkEoe5eS189P4Uv33q8w1cNEuwiUp40/GPr3Ahdn9Doh1wU98+fPWvXCttE0ii1o1vHydyOlJc/KK88c4eOf0UZoXvHmJp+zrcD1Wm8vZBSp4QcesAsMB4ufJV3dhH/IAoDrsnFyYhmShY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422988; c=relaxed/simple;
	bh=+fRMb8m2lZb+1IoB2KEHX5nH0WChTu6OrreWvI+QsKg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ahghfhgJuY4hTA9elgY1Zv0tiDc8JenDmRguAoKqntEnO18HCtT8ogefbwJrVC8SFHk9so35WnW7VsnCbBBxNdgE7oiVXZRdQJA2LTPpGfd3jJM+8flmutiPoo9j0zyKdcWU9NydWJu9+ja/qs1z12iTxZ8AE3txUJrzEj18up4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HR8LHDR8; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HR8LHDR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730422980; x=1761958980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+fRMb8m2lZb+1IoB2KEHX5nH0WChTu6OrreWvI+QsKg=;
  b=HR8LHDR8K/2n+3CJUvkvm98UEHTbtu1ww0YJrmK7Fl0AW+w5euXe9Vg2
   qLh92rYd4whds9bXPCzK6icDXTXAXc4Eo9zO0FPb+EpHQ3pP7v7O1Dv1r
   eGzugrI58jJnweQKx5+lO0o5dQPXMRa7dR2Mk1MpEqfE2fJnEPW1BScTP
   RroRQg3CDZInes2TVPb8PEOuNZyBnYSKPuLNxbQ1M05/nhGI78v4YAYdU
   I7vG6bpX1PLRrdJQgtYNdTY+BNMguLzpNeRYisPAYpgTVMzppzSfGgAYn
   /T+ngJe60Dyu4OJXEBI/1K4zRngKnJYZCbzIT7LGRPuQpwtiNWWQJ8grK
   Q==;
X-CSE-ConnectionGUID: bev4mkkMRFKpnNJ+HN5Oug==
X-CSE-MsgGUID: mELehIL1SxaGwP0jaIXhmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29608588"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="29608588"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:02:58 -0700
X-CSE-ConnectionGUID: 1924VaSNRkG4w8dz2wc0zQ==
X-CSE-MsgGUID: DwN56kGiTaqr84/ySoCwAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82928706"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Oct 2024 18:02:58 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 18:02:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 18:02:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 18:02:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPD9RWHCr7wuZLPYEIEL3hRCfcKinBX32/xEQDAB1ZkNh4WgA217EVVB2AxLAhQlsBMH2DooiS2z6XUsmjSTJcsUSSWbpOoHr7kjpOg7N+5Ai8p0bdabM/fCluXK8RKgR53JvV+xCTaMaA3V937bC+VL4UBr10kLSkfEkEBCZCnjzu50d2rfaIgXpUSs3S5Ej3so5pH6QhVQL4uF1TJi8ZcQyRXXRqz5HoA+bfM7ziM7G4icO09Iod6ZNlBbzodgwpOpVFhTojNfGaYX1RPfZQUZEg5KIie4mOhgQ0F2rk2eTtC8PwrS2742QJAYGpi/ORKZPoCz4irzIlNClCDd0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOyAS0difVUATYhQD7Uhsq3KKSkojuoqIWWGOjtZCIo=;
 b=EbbDjxt4em3IzT5NB+fBIC4C8IR3+ZmkPd58v82aM+39tDlqjR9B/oQtSfW/E2GDL/6TyrDSBOpy+G15WpKWN0GiDrq+Q4Xd0loDXgNC5qG7gF/nUZBQELGovyCM7X6Pn3VLhjaiYwdHiac3gkh0l02gQUVypNKK4JwnBn0MYEIf3Def7JxQfuldhPbz/UinQkDL1qo7jtzcAITKqHOU5LgE2bRHr5do0Ai2Gk2zkMDeCYOGPrFY8sevg+rsZh6dtBJM+XsCrCVSpNEPayVM0QyhztBdgcNcFphl/u6idcMskoRAhu1GbB1A/1KMTZTiRemaaETPhF8f95Pg5vxb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB5914.namprd11.prod.outlook.com (2603:10b6:510:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 01:02:40 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 01:02:40 +0000
Date: Fri, 1 Nov 2024 09:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-desktop 13266/23114]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <ZyQoqKE+g/p9l0H2@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d39e41-a687-4500-f070-08dcfa10e218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zf4IudJMxV9UbHu61wLRjAZAXngCPV85ugG9d7P4K3IdX21GdP4DduF4ftm/?=
 =?us-ascii?Q?vJBw/pivQw0VK0wdy6ml3aPEw8Z2T8RL4lGWJLOv/mcZluymZZvAL7YdngMy?=
 =?us-ascii?Q?C5VxuMFIeSgGZ3DsmK756oDaKoZCefL5rrg4neN0FCY4+dUl/E8oCO/euE54?=
 =?us-ascii?Q?Kl+5Eo0jmUjAvrKQxIIU+vlzKok4fDt7qYgzDJq8PfbPnLlF1MEPT7u4LKvA?=
 =?us-ascii?Q?5qBMiOddqhV5Fhlr4rln+tTrLA35BCb88wyg/R2V3QOB7Yw3SGqwAqtVVNV/?=
 =?us-ascii?Q?NDjYU/t4Hpal4cJZrYlWxpzSCm2mT8supm1LrKZS/LZW+8qCse6obLOKWS3I?=
 =?us-ascii?Q?T1g+rfcyYn9JdxzXXhHrL4iE2gqI3XZAmZPST+TyBxFpMzw9kxdHOVecLNhN?=
 =?us-ascii?Q?x1wWUAnh3Kp8Grj+EA6nWCSTRYVoPTU7ZrIwLRT9GHMV+dHisKiP8F1nwcyN?=
 =?us-ascii?Q?Brf6h3pLMUmysfX3pltDezD3pnqfVEZfthGFew3hmgfkAjbIu3KaD6nUf7XY?=
 =?us-ascii?Q?/IFDM1DmS9gkoLLpMKcDmX/G8tByNeFxsEEr5GbT4ybbj7qwN28Oq+hycwju?=
 =?us-ascii?Q?slQrk1nPmNGnFMLDL8FlZtchQ+PMXI6g02T1UWdJfQkKJg8OJ60robjufS/N?=
 =?us-ascii?Q?0zQdROARNDEuCSINkTn0/35B9bEjFjgjNcm/rfgt6PLpVlY9GIHl380B1H/D?=
 =?us-ascii?Q?lYS5dUo0PWIghNDgpoXpe9M0rgFpYhcThUCPoRJtttb4GzOTAk5yt3WMtRDy?=
 =?us-ascii?Q?PNySDhYCtXJxqfGKrk1wMyWbZwcl9faqhwhca4IVxvnKVEzs0UBo6nJ0Lcrc?=
 =?us-ascii?Q?tVoav8krsdThy5fHi/x73UCGmrWaQKqHkE6P+xLWFfIAYo9WSNTKNKST5cMd?=
 =?us-ascii?Q?Lhg98azqHbaElKOkvHyBca4eh6mxdQyBbt1wLQ93yn3WoanMhkR9Tl3gtv5h?=
 =?us-ascii?Q?jHRT6fs4xafa+W54tkwMj7EQCyMV7/npoJYH2QA84C+n+UMJSFAvVKj80mQx?=
 =?us-ascii?Q?kRBCUUkISkoR2j18wbZQBggdQqZMs3xxYHTED+QBKocR8bGnyqvRO/bzltSs?=
 =?us-ascii?Q?SszWQdh7qkyvxB2SJACOf210H3IhZqVbqAkyIl0c+oEv2Wccwq37AlOH8bpc?=
 =?us-ascii?Q?QmqiHUUP77zZk7TcADRFFKXiWvxyN4BkFhC29ARnHszpEQ4ZQ8uUjKIya0v2?=
 =?us-ascii?Q?+XYmXz+dRUmriI/TfXoXmaR6V+3bvO/S9WMQG1y6BpJafd5rZQdJfPrZrYOJ?=
 =?us-ascii?Q?ltGclfhRU4ul9QBEi9CQ2nQibLgktryVgzZIxuXaug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CZLErcZ8a8T5di/THMgQK1gpSNgTxTDnBCVdk/TZNjaA+BZ0+xsNcrNNWnDV?=
 =?us-ascii?Q?APdWmpRomYQhNgumfx5y0Hlw4Hco4R1Dy80H7TIfpUgX6WlfvQ/aVyO4K5wy?=
 =?us-ascii?Q?x9deXTe5phdewdGxIdgt8HvgmFv7w2GPBNMklg5f8jEiTdfPq3qDJbrwG0+5?=
 =?us-ascii?Q?K89OecPtELmcNGK7XBd6YyMBA34cmsEiUKbnV+ZyVu41pfANXvSB6FKpGP4B?=
 =?us-ascii?Q?3UqsjDlSgr2iHJ8bVZ2dvWs4WDKlpobLtMOw1ocn4jRKrJh5lTi8GknAuIzt?=
 =?us-ascii?Q?tnDVmFzinW9v75yaDqym5kcVnUwHMYOU8NSS6eQqycP634Xv0QePvAZJ94GG?=
 =?us-ascii?Q?Y2RHTl/VTB8sTSLL0s9iYTHOygC1em7m7bbw/i4WzA0LBWfaUfHL9feVN/WA?=
 =?us-ascii?Q?kcYp7krTcjScqAV0rUajT4edP/+Co7oZh2a6ALIZ+49d6B67qU/FV3SZ+47E?=
 =?us-ascii?Q?MkzYMrPUxY4dDXEviWBamvYawQAoyrAKE17PtiFjy+In/hpzihx9aE5scjd5?=
 =?us-ascii?Q?jo1cF+lo9aV8i+5WvamoekQQHLmrtS7iqNLNemVBXAy6FMeiX/f4v6pJeNeW?=
 =?us-ascii?Q?U5LclcBJ/0zvBNRJgwJXVfeB9ZTTukWX6OzLdSC+Oht1LdG6UFdNaJ01bLbJ?=
 =?us-ascii?Q?ZyVC+8RmuMYRQc5ZdSRwuavPcq0TaEoIxcEtxKcxHGGx1QtFcumtjhh9AZJ6?=
 =?us-ascii?Q?j3xiSkePkk88uFjSkh5sB5/vhklLpZ8h4Wv5XF7O3SQrOq8K/SHj3QeIPUWI?=
 =?us-ascii?Q?iJxJTKTYJ+Fyra9g9yOc+QsyiSbby95FpdZrcianKyDNngXX3RekHAFCoCYp?=
 =?us-ascii?Q?D8x3pPwhsYXmtQqsBgC56TwLAHY92Jl8cG96A3gIiyVGB0bDFmmVe5UUfsfT?=
 =?us-ascii?Q?YIANjGBeZxA7zYE2GRJKn86mmbuRLDhI+4NKVlqlGtEd1e7GYCsuEvM3jrfh?=
 =?us-ascii?Q?MZpouxgoYkvi2821GmmncCUeSQ5Ro7cU/H7iEfPPTJojdp7ZT7KolHichegb?=
 =?us-ascii?Q?UjkOSOI6Y8kiUQAtIGUWsrSmAT0hI6ViG6XkmRRX7gBLpiJ10HUIpU2xPdQg?=
 =?us-ascii?Q?NCKggcQtODdkzSTTPmuDUbXB+sCuVlCovFznWDdJRxkRMSx1+0biVyIHEnpm?=
 =?us-ascii?Q?KYbyWxpgrmp06k7F8F/c70k0I7ELUmZf85hnarypiU+DsWGjZfRIjhQxnvCI?=
 =?us-ascii?Q?rUVGIep2j/+1uiyB5m/8Tps4yj+L4XWiVn5iQ1xdETw9ozp8sRYo3iZxwbK2?=
 =?us-ascii?Q?Pc/i0oyPePJMff4eaP6puLcfFbJsVVRUXFEVkyAFQq5Yfky1Wm3MK/LS11Nk?=
 =?us-ascii?Q?RvPguEX7J7I3I1sOPcjMhs0Ou8tNr3/XQ6nKu1LhogPa9/b1eN6wF+Yvh3En?=
 =?us-ascii?Q?DP0xNMzykKsttKoZwNKhEUAXrmiQ46JGHDL1oMe7+ds5//bkRV4VTeS5USGl?=
 =?us-ascii?Q?fcJVmoD+jHHtpE2z2qWBD2gubZTRbz+MCqpjopJYsA4MOiAFButZ5XIO809n?=
 =?us-ascii?Q?DUDoLekxyTN4QkoCcfxCD/dnqMUJdCveb1lT4f6jt0r53mSCwD9CncF9t9hl?=
 =?us-ascii?Q?eO1/6uteHfCmZUCJNAuuvVclZkf0ire3U2qAf+Qc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d39e41-a687-4500-f070-08dcfa10e218
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 01:02:40.4920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7n04AqgS6SWENsELFZbthn5JduTgPNAEVfkzJWzlNY9g3OiAg4RSX2qKEOep/TxBXCKYJTorNUHZwtYJtz+3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   81bd1eb3862e37f2ce6e1148ed51ac214ab5c007
commit: b0e8f19e77a26eaad28d34770d7e115c48c035a7 [13266/23114] CHROMIUM: arm64: dts: mt8183: Add kukui-jacuzzi-makomo board
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241101/202411010735.G17LK1k0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010735.G17LK1k0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411010735.G17LK1k0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:523.27-527.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:529.27-533.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1186.21-1196.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1941.28-1945.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2055.27-2059.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,makomo-rev4-sku0', 'google,makomo-rev5-sku0', 'google,makomo', 'mediatek,mt8183'] is too long
   	['google,makomo-rev4-sku0', 'google,makomo-rev5-sku0', 'google,makomo', 'mediatek,mt8183'] is too short
   	'google,makomo-rev4-sku0' is not one of ['mediatek,mt2701-evb']
   	'google,makomo-rev4-sku0' is not one of ['mediatek,mt2712-evb']
   	'google,makomo-rev4-sku0' is not one of ['mediatek,mt6580-evbp1']
   	'google,makomo-rev4-sku0' is not one of ['prestigio,pmt5008-3g']
   	'google,makomo-rev4-sku0' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,makomo-rev4-sku0' is not one of ['mediatek,mt6592-evb']
   	'google,makomo-rev4-sku0' is not one of ['mediatek,mt6755-evb']
   	'google,makomo-rev4-sku0' is not one of ['mediatek,mt6765-evb']
--
   	'mediatek,mt8365' was expected
   	'mediatek,mt8516' was expected
   	'google,elm-rev6' was expected
   	'google,hana-rev4' was expected
   	'google,spherion-rev1' was expected
   	'google,kakadu' was expected
   	'google,elm-rev5' was expected
   	'google,hana-rev3' was expected
   	'google,spherion-rev0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku0', 'google,makomo-rev5-sku0', 'google,makomo', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku0', 'google,makomo-rev5-sku0', 'google,makomo', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku0', 'google,makomo-rev5-sku0', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc1-pins-uhs:pins_clk: 'pinmux' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: panel-pins-default: 'panel-reset' does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: uart1-pins-default:pins-rts: 'output-enable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: uart1-pins-sleep:pins-rts: 'output-enable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: dpi@14015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: mdp3-ccorr@1401c000: 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: vcodec@16000000: reg: [[0, 369098752, 0, 4096], [0, 369229824, 0, 4096], [0, 369233920, 0, 2048], [0, 369235968, 0, 2048], [0, 369238016, 0, 4096], [0, 369242112, 0, 4096], [0, 369246208, 0, 4096], [0, 369250304, 0, 4096], [0, 369256448, 0, 2048], [0, 369258496, 0, 2048], [0, 369260544, 0, 2048], [0, 369263616, 0, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: vcodec@16000000: 'mediatek,vdecsys' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: vcodec@16000000: clock-names:0: 'vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: vcodec@16000000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: thermal-zones: 'tboard1', 'tboard2', 'tzts1', 'tzts2', 'tzts3', 'tzts4', 'tzts5', 'tztsABB' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:523.27-527.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:529.27-533.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1186.21-1196.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1941.28-1945.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2055.27-2059.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,makomo-rev4-sku1', 'google,makomo-rev5-sku1', 'google,makomo', 'mediatek,mt8183'] is too long
   	['google,makomo-rev4-sku1', 'google,makomo-rev5-sku1', 'google,makomo', 'mediatek,mt8183'] is too short
   	'google,makomo-rev4-sku1' is not one of ['mediatek,mt2701-evb']
   	'google,makomo-rev4-sku1' is not one of ['mediatek,mt2712-evb']
   	'google,makomo-rev4-sku1' is not one of ['mediatek,mt6580-evbp1']
   	'google,makomo-rev4-sku1' is not one of ['prestigio,pmt5008-3g']
   	'google,makomo-rev4-sku1' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,makomo-rev4-sku1' is not one of ['mediatek,mt6592-evb']
   	'google,makomo-rev4-sku1' is not one of ['mediatek,mt6755-evb']
   	'google,makomo-rev4-sku1' is not one of ['mediatek,mt6765-evb']
--
   	'mediatek,mt8365' was expected
   	'mediatek,mt8516' was expected
   	'google,elm-rev6' was expected
   	'google,hana-rev4' was expected
   	'google,spherion-rev1' was expected
   	'google,kakadu' was expected
   	'google,elm-rev5' was expected
   	'google,hana-rev3' was expected
   	'google,spherion-rev0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku1', 'google,makomo-rev5-sku1', 'google,makomo', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku1', 'google,makomo-rev5-sku1', 'google,makomo', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /: failed to match any schema with compatible: ['google,makomo-rev4-sku1', 'google,makomo-rev5-sku1', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc1-pins-uhs:pins_clk: 'pinmux' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: panel-pins-default: 'panel-reset' does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: uart1-pins-default:pins-rts: 'output-enable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: uart1-pins-sleep:pins-rts: 'output-enable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: dpi@14015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: mdp3-ccorr@1401c000: 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: vcodec@16000000: reg: [[0, 369098752, 0, 4096], [0, 369229824, 0, 4096], [0, 369233920, 0, 2048], [0, 369235968, 0, 2048], [0, 369238016, 0, 4096], [0, 369242112, 0, 4096], [0, 369246208, 0, 4096], [0, 369250304, 0, 4096], [0, 369256448, 0, 2048], [0, 369258496, 0, 2048], [0, 369260544, 0, 2048], [0, 369263616, 0, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: vcodec@16000000: 'mediatek,vdecsys' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: vcodec@16000000: clock-names:0: 'vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: vcodec@16000000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: thermal-zones: 'tboard1', 'tboard2', 'tzts1', 'tzts2', 'tzts3', 'tzts4', 'tzts5', 'tztsABB' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

