Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA74117C9F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723474267; cv=fail; b=COUWoyIdSs+V3VKwW6hvBIC8ciaFh+Qf4CKra2Y0hq+CxcbmqHcYpm7hj7wevC6nod7Y+2l2LdzLarVE91ZVFO79+CZsYclV8BTJjb8EXd9UVFDcti+u8DNNbJbSRqLMsqrlw8lKgkC2e2arCcna6B9qxFMRNt014tGVdpLJ1H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723474267; c=relaxed/simple;
	bh=8Egm1u+sZGLAj3ZME1QSVpqSOYAr2ZqcQPobUFmFc+8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=J1yr7FVE1ji6eVSFdmXFJBimpBUZ+vzlOoP+vO4wQxGL8k1XE/8A2DqNdnFZj9yZ5VZ7yZhxbLQ5bl3HOd6V4KyOwWYJli2JN+l0GDFw2bXk1ImEQ8a1lRsXsBIZJgV8yxW48q0HZL+kWIw2P6rWOkYsIiqDq469HJPPWVM8O3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3W4ryEl; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3W4ryEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723474264; x=1755010264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Egm1u+sZGLAj3ZME1QSVpqSOYAr2ZqcQPobUFmFc+8=;
  b=E3W4ryEl+AMjmEQ4YPDc6gLQlJKXs7YiCx0NqdT2XMkyIGWdftJ31DG9
   RYPOZ6vOSsp/HZ3i9+caQ4dFrJ4hlbgFhO0F+oim8oBBiFcgAE68spoq/
   qb9I8KzXn1YBnMN/vG3hcQHb4GkBdKSJ4SDuwZwC/+tnm1zAvkYWSkvuU
   PnLlzMuRViu7ObaAp04vgpkwNeqzQRvVEvorVGbsApFE6dMRc+JBnQAJ6
   Dp3DOZHhMnUrDh4dQVNUNCQEwIo4vsObzihQ4xN6Zinld74jEuHUdF2Cx
   gxUG5LqKQw8Pv5/2qgesxbl1Z2NEwiuYmF0lHLQc/vOvHf6nYRxYlDKqD
   Q==;
X-CSE-ConnectionGUID: JoB09FYwSBGGptPBWEw9/A==
X-CSE-MsgGUID: 7f5udRF8SrqIOQMOk0uWgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32267966"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="32267966"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 07:51:04 -0700
X-CSE-ConnectionGUID: tZmhhlyBS9SWcxF9KhpqRw==
X-CSE-MsgGUID: nmQT7NAbRqKplRb9s9X6Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="62678930"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 07:51:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 07:51:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 07:51:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 07:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCzhPpzxskuhodwrCddQ0tRmXCuYKKI3evWaHwW3QGIm15nGZdDkxyFVz2waUovr5iXf4wiZOlFxg4N1sC3qw94NKNlID2HXeul2MaIybB8ZRl8t/qc+xN0Gj2I7JVxRhz+HZi4f8HCwLPjjBIu618I5pmacjZ1NrRzYfeW+fru0ZqgwOmPZmXryGp6Z2SBzpEzv2kQa/N202DQuxZJQUz+Pyt2HwmHnXuVu8/38G07TW0cWMP2D64kNU8+qdw2PLzKieVyb/k/xs0ghRYbWYttAOidymwJbxPyl0f3ylSK+zJ8sL++Sj5nel8+J+o595rsMyfcoy54OiOXK7R14CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJhjwKGFNcb7FJr7gbmtTNQ34aNzQ8jJOyR/ZARmWtk=;
 b=MKQ2QIkXsq+c5fohWxx0LlyBvCVbk/Oh/wqsByzTEDPOtkxeN0+YYoodbaui4Suc+KpHPSfE/Nc1jpZjCF7kxan5JbvYaNEcNZeDcRMUUfIxs4vEmHyelR2ve7uhLAfvgizqIohGSh6/md6LOiO2q2vtGeeLGpNPhXazJOr8OmSH+DkO7PbenqJZSSE3J8wg01uubrnA8aNpdxJ3QNITZt7reo3ks7zoNZWf20/mmSKru/qL1mARphXTzrk8aCEsmTTyNXZgxmefeeOxRRYAemfmGo4COctJeztUYjruNf7FMaSZQch1L13DUVt9UgMteWmeE5eDZcdb4iY7kVJ0RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Mon, 12 Aug
 2024 14:51:01 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 14:51:01 +0000
Date: Mon, 12 Aug 2024 22:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 32/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <ZrohTqTMBKiaVQsY@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3298f0-d965-4502-4b7d-08dcbade2ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0uyaSdTAqaZ6J1CRbRvKATF1un+QIReuqYujZ53GUk8LJH3xE0QTWiDDh5K6?=
 =?us-ascii?Q?SvyK3IQVZRPIaOWtHzoZo5fYYvzAos/MuSmtWUAez1giS3vTOhqoSHNJF8Jt?=
 =?us-ascii?Q?o8+VpoymAt6z1db+ic7BQqDNsiJg8TZXMTWnaxRW3Zq9v0p5cheMF/d3lhg7?=
 =?us-ascii?Q?tHwnEYIgYmq6qBzBD4CKsCxdM6UalHds354VUwK4rIgAtBTWzdG0p1BwnaOg?=
 =?us-ascii?Q?uxwQJkPagCoSDX23SAVz12iHvs820w363NFz160/p702Og65Aawj28ljrNSy?=
 =?us-ascii?Q?qjkhv4xrpHRXadDg4wVClDgKThrFSy2GRLl9ss1nkzrRy2fVAtPQDWNuzZdV?=
 =?us-ascii?Q?l/Cbl878AnIAQ4zxECltZD1ZXjO2Iuk8e9QZsky5yJWSv4Jn1o8sBsmy/+a2?=
 =?us-ascii?Q?nNd+jhJ1QcvEgCMdUv2GHjowg1VIkr+NbhU6DbmxEngOgSZFW4Ik7ABgjJuV?=
 =?us-ascii?Q?O1b54mU/iHyXVsK4YTNn8Yo3BdNeXRg3HbB4cCzTIux0sNFOUcwKaKPnc605?=
 =?us-ascii?Q?JWHzpk8GQj27fFNZuQ0FbyN5jKa2zRHv5Mf8QeZju2H2RQ8nRxvNOVDbzdCs?=
 =?us-ascii?Q?1ImGnxhpyEYW6tJRobtR08M73IbTJ38WC5i4bfowsMBVjys4XYdsOFxYrTbd?=
 =?us-ascii?Q?eboT7DkQOE2HGzAJ603QD4+UFQ5S3Sd3sbYMnUwFmhMKkqVKjRI40J7tEunV?=
 =?us-ascii?Q?kSz+tM+qPDfcnPvr1dva6wtYsfOnkfdFnUXELeTkjMQt3+bNdVV3rPGPBX3F?=
 =?us-ascii?Q?Jq7wsb9omUwNDWaxgVeAKDf81pt/KZVq/zUhq/erMLyi79Fsoak2TdJ2Jia1?=
 =?us-ascii?Q?nUsxuVfrobm0GZ6bIvJ5NPNLTTQ1g0XiGcFltwym/mfj54fJddTRClrDrdph?=
 =?us-ascii?Q?uJkjr5XBFIgmoQKIGcTNBPjj/F15SnPzqoPlWDeFazlDD9+bh3XXW2WlmdTV?=
 =?us-ascii?Q?zL4Vr3ZaBx89kc8hPJCQpQLA59BCjWg3yKSoE4039Fg/YE1Nojo0PFfnx44q?=
 =?us-ascii?Q?up/YCcc3t/2yKmxiM51uK/tDFapje6PUpa5MwcF+QyViU6avtzUJGfo6/zFz?=
 =?us-ascii?Q?da6GQaLFC0Lv8qcQMQVPfk8LPE7jrM6JNB3S2Pc0fuypPO5qHCUeNZb7b+l4?=
 =?us-ascii?Q?N9Wfzio3CoQwdus6qUuGFF6+A/sWwmNVcCuQfMQhhbeW2YOoPt5H5klCGxy1?=
 =?us-ascii?Q?ylE4vpg6n7RlTNTCadVWwPEwT6XqR/0+KqqtfMWRLCl24m2glIBDc2971Q9l?=
 =?us-ascii?Q?dN6xmGYuij8TdPwaA1IOkiSe75pgwPacFi2kqwpyWVGZGzJTchs+5hSfL0m4?=
 =?us-ascii?Q?iaslXfun5WWwyoI7a4Q5UVNyK7iUO3rxY/WCY+kYytWEdKyLg0PYx+UEuMAz?=
 =?us-ascii?Q?nJdJnNM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vm/RD77bZySwK77v0GriheXj6VI05nY8xR60l2LkeMqeUZ0nL0pGZ4gLptC/?=
 =?us-ascii?Q?JFy3ahzlDjn72sU15hskSMKjFdwxHn7ihSH8NDYR+jiSE88oRfpOgMcd6H5j?=
 =?us-ascii?Q?4M7fRy2NmGWPSmvPLspIhTEvSm6ds0HF1Bl1ZXvEAiINwbbITTwDjjwzDy3G?=
 =?us-ascii?Q?w5K3TOkVDgAo0QM4TpRaBV8bb6Ard3gUtbtZE8uIOmh5XV7jPvQWxIcY/CJI?=
 =?us-ascii?Q?q0KwMRCL224k5PQeF6a7pt52n2PCYMQRo6Ay93v2n3GOgi9OPE4Mh2hxfLLP?=
 =?us-ascii?Q?3K00VXZQDWmaCV4zFGyok4XUw+/QwrPc65MMNlBk0NgM3rKLJHLYsYtLYR4k?=
 =?us-ascii?Q?Ut7U5P2bIfpTfpC0XaugYGQyn6Z5TqGxFRg7Xm3Kx4RKnBGHgMxGRfZ9K8cb?=
 =?us-ascii?Q?rmIJMwwpYtodHhuw+fSfX3ZhLcIvbU0oW8d081Rb4ilaWw435hiyY2GZC7QN?=
 =?us-ascii?Q?C1DxeFN+C+fb7ne18eWwT+AYHcDp7F/2Pvhy/kPEnD9pqgSf6S75wBQ4mFGA?=
 =?us-ascii?Q?obsr+/kPGnvSEMg0Wfe0J/h3GS4TaueeoIg3Q8aqM0DggoVlQrhu8fm+Fc+A?=
 =?us-ascii?Q?2lvIdbZmPH+XUAhKfKfykW7g9bdCUKTCMUB265mYH66qbyO+7pfdnogtPhH2?=
 =?us-ascii?Q?LXFz4EHKC5HACc3Dh5AKYufFmzrW5E68oT3mC+EhewbIzWCzEpEH4rCbUGUA?=
 =?us-ascii?Q?Ig3cqIFR0qptOYsxvL3ce4gPJx9sziFcSzBXZQp4zfxNf4xW1ULMNzUapIYS?=
 =?us-ascii?Q?GUUgVRxlqpF06ygFI/P706Hwa7BGhd9M3qz5RPrdon1nH9/5g0XXn9LBvzgU?=
 =?us-ascii?Q?/rd8ljOtYyoWanBZIrHxOIIBQByt8d5lxvAK+gyPMulkUU+M4iue/cuyJxkI?=
 =?us-ascii?Q?pn/GCJx7Gl2nDz9DdQ1MuFwdmyccw/ZPU6bcgxLfIJOqHprCh/Dzyjx/BOac?=
 =?us-ascii?Q?2GPiPFRTP19JkUl7IKrYxkHeg+BpFT5LxzuqKR5Wzo4GJ5yH8ZNllNBoN4bY?=
 =?us-ascii?Q?scYW0GrpWwVS821x0kFCrwAvEo/sO6YUbYqvrvmmZbCdDqx3GOGGvm3K4cZS?=
 =?us-ascii?Q?1anBieDaHljGJTiHRKp/CFL1ALnuLVhAnQ4D8vte4thR7n/tEvXG/YwCoKfv?=
 =?us-ascii?Q?ORFYU/RYhB1Xj/qLKTaUcDeSSy4++35NZzvzxkHERACQJnibx/TFlTWIv7y7?=
 =?us-ascii?Q?zU6d2vuOl8eiDVW5qA+Mpz1ZRc4jM1FZawKSdmrpUWF/DR1OVSAFVTcLf3bo?=
 =?us-ascii?Q?ERszJPsPHruyWa3f/XwUXuukhuRF2SM2WwLRfNG2BjE4ZKF05uJuN2fkJ+wv?=
 =?us-ascii?Q?p0nU9ODdagnfTTZ046p6zqENGOMrnUv9iUQ4bpWCOKIt7jLFmJVNpb5whWwY?=
 =?us-ascii?Q?GaTA9mg2V/sR4hQ2y0ObOit5mPPX0hUgOjZDU+7e5fk0KQYI3TQBP1AsVWdf?=
 =?us-ascii?Q?qS63olW7IQklQafIdxx2GIGqIeOjj9O1m1wynkEr25KjJdooS+WIoTdz4wRx?=
 =?us-ascii?Q?DvtOI97+HDpjrvVRnFXtAGRTUWas8XBcy2/MM8AWbMuAcXt85dtzf/vAIwVL?=
 =?us-ascii?Q?vKFnRjE7DUneOA1j8xoOLER/iQSB569hUxVt+x82?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3298f0-d965-4502-4b7d-08dcbade2ed0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:51:01.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfHZnZRDwaHzc6xk8OUtIe7+DZu+7EIXQs5w/Iv8ZwPOjbI5hBSZVAXVeyS+kj5sRc4grXmmHN8cyaDla667Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 7ac7a6e2dac16d26212911a91515a49a08a10371 [32/78] ODROID-HC4: arm64/dts: add 'meson64_odroidhc4.dts' for compability
:::::: branch date: 5 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240812/202408122132.5ONgvITU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408122132.5ONgvITU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408122132.5ONgvITU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: pwm-fan: 'pulses-per-revolutions' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

