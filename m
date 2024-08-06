Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1482542AA0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722930995; cv=fail; b=lF8cNGpjWMTOI8UsjrMUwhlF7665/Peoe5Gvt775WvFvHwMQ8KznymUqmJ1PiKOeTSP0fwxU/qm9cRNNQeRISyxxS4Vl7O1+3wpOc8dd6DO8z3SwcWcG8onCmI13Kp0PBWI2kyTeC7ufSsjkWER5Id5l1RV9bJ4hza/OyBPmMeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722930995; c=relaxed/simple;
	bh=TUirMFegmFM01IDe3iAnIYOVxjf269jVHVt8Vhr10h0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=QNt86FSAVhO6JsEx86IchawcQ78wnZU2uE77ou2AIrqVnZHbQ806RiFUPB8sZFOBdJk65tIKApHXoHk0w2jUvpnG3mq1Pralgshf2uYAjgJobPkxyPeEuQGXR9WQQm54CD8xJvvKnNJhUHe6fW5x0fl4fdMfDabzmKgZxRRNL3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOMXP4Dp; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOMXP4Dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722930993; x=1754466993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TUirMFegmFM01IDe3iAnIYOVxjf269jVHVt8Vhr10h0=;
  b=FOMXP4Dppnwwwfq+9u4J2/vYzMsCqLcWUvb+qPcGQ8oHkT4upqdiRHwf
   LtFq++S0bKZLN44f4XiOyEBvpZoZxQshwFhWseZH5eRTa0jzjB12sNW47
   m2y62isq4EbSfG/3iRfb6CrCHdF7HFShZTUxZRg9c8utjhBV+v5sb0avn
   AYqQdXH01t+QHOLoOBygHA1kFo3lgvU5+ZgSHgRaCHat4AExWWLtbUhes
   eab9vAN0GXgqgzGqzJgwmAI/cCo0iPQCkK+KpGn2WDRv4q5v04/8xAvMW
   0akmqZFI6JaZc6XuO9aLepBmiB+ItuigI/G1tg1oTHWxb4bVITILg6Scv
   w==;
X-CSE-ConnectionGUID: +w0sgYaCTX+Mcqa7a14nOg==
X-CSE-MsgGUID: ZTSQZL8iTiW+kFZQntRJ3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32334513"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="32334513"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 00:56:19 -0700
X-CSE-ConnectionGUID: MN2lTwYHTAW7Bik2wkBaFA==
X-CSE-MsgGUID: Wt7neOYoTeKE9v4iqxLwxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="87363928"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Aug 2024 00:56:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 00:56:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 00:56:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 00:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O90UeFQdHMuQtY0kjHu1Wh6DQlkHwENSGKOmuT3jw5/VC3kRhGAGAmvVB4RDV9DHi9/8Qc5AEHfEHWzS52PEsW25UPK90DJ7HCBKi1/9ExK9MCpwjnEgj8urqJRsQt135dJ5g3kHutJzgHStNGbRt+UcjoJwsUj9Sa2TeP2XGSeG+u+J6szqhIOm7neOdOKfryGJyDyaDs7T4GXhcKwl7SP2D4aJInl6BNSr6LEFWz1YQ4QpUR/9bz7xpFnQGMDLuc11FcqsAUCPEbSKYqKD+kfhQDtaIGXlevVIxGHGMsQLP8Qh/r1dBre+BuOlf64UTYdu+7xbZUOwWGoHple5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=As1FZpmObhV4YeIWgy8+Eu8ej+TiYlBDurjdQ5QSrd8=;
 b=J5Uatw4i7yUbMa+BbuM7Bd40xP5uc7F8vNihnIem7lhhH5zwyi/7BGajPSo+iIJkZ94bqtZpBlgDM5xH3qdcCzqB58NF4GHB3H6mRu8iJxULSQaDiqd1d0EceavEPPjLjaDS82K5sfMt9G5COXlSLXFzP1CA5neCzQ3SDIO1LA7KoQdAp40S2PqT5NwK96fVvbFckziU2Zj7EyXJBTObH/LirQK8E7KyfbNaDPPfgIyQRGrIa3i6wZsPhHxhW6oTlv/Uxv2LrDTAuCkhHJHCUOUdlPeR/7ilrraylilxUmVWrLS/bLInnuhA2/SLdxtCASuiiB5wIWrV6g7IvXooiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB8570.namprd11.prod.outlook.com (2603:10b6:510:2ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 07:56:15 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 07:56:15 +0000
Date: Tue, 6 Aug 2024 15:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
CC: <oe-kbuild-all@lists.linux.dev>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>
Subject: [morimoto:renesas-bsp/v6.1.102-2024-08-05--working 749/832]
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb:
 /soc/video@e6ef0000: failed to match any schema with compatible:
 ['renesas,vin-r8a779h0']
Message-ID: <ZrHXFiQKACciLgWP@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 171f6981-16a6-41ba-e41b-08dcb5ed3eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OJ63JESvdVgqd3zaHVHSNJOi2/ZkIFWA4GaNgJGj0dAGMUyD60lV/96eOgwM?=
 =?us-ascii?Q?FE/U4dHERKl3vNbKvkQJJzXy8OdBHUhZQDfV7pOINZmNOgrMedQHPIbeX8NE?=
 =?us-ascii?Q?O5VcT+GTWYO0YCI0zavsihw+O3YbC/GzWp3t43nrC63OEh41Sj9VeW40Be/a?=
 =?us-ascii?Q?65YCjbXKPz5vv1kuaLvFFU21kcEQl82Ja5gnvHQhF9/CtKzY0ttSBhPK2DOX?=
 =?us-ascii?Q?RmOWFxr2tudV17qDW9D9zqNsvAq3ukXYjn1YEGeVu1ujgMS7wF7dXpw4V5DH?=
 =?us-ascii?Q?NqStk3Umyug6HN/JF1arORbvWaGxjEJv9JY7YP2rhC+ySbUyfvmj3xxSTfZc?=
 =?us-ascii?Q?/CPvgt0+z0/QhTOiGs79cvqHLffSPygWXgt3ALMeDXu3uHfT0xatjx6p+TKz?=
 =?us-ascii?Q?jDm0Ow9BcvH2PH147pXjtNfyJJ30+sfnH4FvURHZClgCf/q2H1tV/nHyT/fB?=
 =?us-ascii?Q?4oC0hmzVr+Gf77RgKkWuKC+PpdxhEMWCcSk+Juxn7AIYgn9iwQ1CkcVvrAex?=
 =?us-ascii?Q?wrw+u8gdmZrxVKZoYILZKy3KYkBpKa0PENAyHUbon0858O77picAzjRHxXg1?=
 =?us-ascii?Q?zRxzLg9GKM2QYtzGbDJYvVT8Z0fIUk/+t0IjHSgeONVFwGNpAX1212sjI8eB?=
 =?us-ascii?Q?MWqs+AlynswjDQPCs2TqdRpkjeafT5/agw4NPVVOsmYg6/czn054XKNm1fbW?=
 =?us-ascii?Q?YgPZ9SEp3Td0WdNe1mt7CwUXWBIKkNHzCidJxXXP01YmZgsh6JEPYm6d4qJL?=
 =?us-ascii?Q?phjfDT9jG9JxmP3oWEuC0pVKQmqv6l4qNH0kjHYiG+SQFVqNGrSyKgRzu+BH?=
 =?us-ascii?Q?MOFOYzliAodabcihdxrYsuFN9K/rD+R4saa669GxpF7G9XnlwY1rjfsg4hPY?=
 =?us-ascii?Q?2IV2TYph0dY3zdGbBqXSiMCjVaIDW0/vUX94ODWyBCj7SqUCWgkL2I853O3m?=
 =?us-ascii?Q?Ebh18FPyYmBRqRIdcCjmqr5f0gDG2hyycGbTuK8BmCxNtlmzeFflJonlSikK?=
 =?us-ascii?Q?TdZPoJ7WhwR5/DWPf3G49itsEDRHZ8j9u6lg7veLe+JnkzaTVJcv2h9949DD?=
 =?us-ascii?Q?TKQDSEg/DkF8XQE9Uv/GyMQ0o4WTll/EjBxt1PZOkz0zw2QG9lizAC385RVg?=
 =?us-ascii?Q?+2MsMXdpUVcxPuCpQm8FVv0LPa8QgWGsRifkX5mDwdM1SDKRn3XnnJaTk56y?=
 =?us-ascii?Q?dg9Nf66KQz1LYhF1lydNBKwzzb87UDSKJLPiMqPGtOq0GWUFZsLXl4KzjfWE?=
 =?us-ascii?Q?PRl7nK7QMTPvemooIlPnOfirCLL6Y7jU84C7jz5KfbhIWcI41/aBdtFtG3ZB?=
 =?us-ascii?Q?L48qlK1HEaN9IarerhgmgLtfWvvTDYTxD+8JGBAqTA8tXoLhqjnRHtdiDEx3?=
 =?us-ascii?Q?kdrCbGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lih9KD7R4YnKawxodQv7H3t6GkjtfE/wmfb5n0iNAl1NyYh1LyIW+9sDH0YS?=
 =?us-ascii?Q?B4QWNwDmKTPw54XCl8GHrJgVd0ThsgsryOO/4NwyMwp3wsYJjOd8dGHX+YSu?=
 =?us-ascii?Q?pb5bQ6kiJVvMsuCYiwzO2OY/sz4tCt/eqpWOXIyZ21JiIT8tTTGlvUrqen26?=
 =?us-ascii?Q?V5Pv25M6t2cq1yXoG1rsA+AA0yd9+Q+DCbZWw6uZz/XnXFip9WIXUgUbW/oe?=
 =?us-ascii?Q?Sc1cSYiRSp8DDiqFoFNJ7mkL8COgAAnrVeeIh7yZYgV4vIZM7FXqmNq6iZbe?=
 =?us-ascii?Q?X0WY0gmJFbibTLqfZAz6NtMK/BsgiIggtqJWjAEvqDBoniYHuaJnhmnzZHGq?=
 =?us-ascii?Q?D3p3MS6jd0dhUT+voPZhnnMBSECPeZBDgjsOxxdNcUTXT2ZJ8Q8qcFjq5UR9?=
 =?us-ascii?Q?YHqi+Ybj/vgbop/Wk/i46u4sVoqYOSrrmcov+XaT62F3twmaJrx60840A3Np?=
 =?us-ascii?Q?eRiTeyoVlpba27hZUTy7aq4Ud4io96NrR9OSeEWDVS79Itcy0YbUBmzP7fjD?=
 =?us-ascii?Q?0kx4oBZrtPMXrEVW4QiAdpVHW4Sb3vHJCl0o1w/p7ga6xZytp4qg0FhfF1rc?=
 =?us-ascii?Q?/cQRPxCM/zdK3kBtRXUjsACnaCEM+fF3inarC7whQtBrNo9fQUvbMm6QHC+Z?=
 =?us-ascii?Q?QJvlZAtV/xSsexbHxCBRXkF47SxYZMR5f+34hyqvTOL7qulwgA3VOTMuWoi2?=
 =?us-ascii?Q?fYAHLXk3brqy6uPpx3UYnoPEr8z4H6onlcNOhtLIRCKb6VutOO76coDCvNxs?=
 =?us-ascii?Q?5AvW2GhDGFgtN8PDMuvJ6ZVbKZN+RE3oKO5WMETjw1Q6J2qk5FTHObgbKEs4?=
 =?us-ascii?Q?1hJ3JvA+jLpUnSFQ6W1s8IYTn+zA+oMElSvPVofLnXiC9xUwKee7huouNkou?=
 =?us-ascii?Q?DQEzqJQXIE1kwhk6dPk+ojYuohH28tL8SjGNamM75ZcvomMd6AmK+730DyCg?=
 =?us-ascii?Q?yxwOYGDN2hzkVuqELEBK0DchLH+vUbf234HCoTBYTUgJry2snEVrsb28hIoE?=
 =?us-ascii?Q?6g5M9QyRqjH3D6kmcZMpFfvwwa0gtwrOMNOu/mzp/56HZzJMngqde9l1daO0?=
 =?us-ascii?Q?vVDRzDS0yQFai3g/IFMo+ctWwgUmMOjFl7Dc3LZg5FmffbWanmLL1zeKIdfg?=
 =?us-ascii?Q?LJRabpB8dt9ef5RGFx/2gNfzIaDWSfv3ln1KuEbdWCcJj3fBPxfLOtSwF5W0?=
 =?us-ascii?Q?s5Ru7M2UMh5/019V7cW2gItRAyRLPQevxF+QjQ8oESCLsEVSmXmEG8XqguL2?=
 =?us-ascii?Q?Lq4hLHL8sX6SW7bo2Y8its0HUCKqtaBYL0iia1zjgWY3Qpq9iR4cOYdjvRTR?=
 =?us-ascii?Q?tG8lxUNCf/7Hb+U6tXx8JGrSICqpFXEUg2BjytwbY8v6HFEu/OhkEUfOwIXO?=
 =?us-ascii?Q?gViG7MF6fM+aSjMmdcqysaPnDT2Hv6WZTapnLaiDI9az38GwxtxZWelIXZCR?=
 =?us-ascii?Q?4EKzJ0Q7Tsz7BaJvBsh/5euigF0gZs2QWqrkwhMTIiLSu5HzPVNcnLNIY+jb?=
 =?us-ascii?Q?V5sTFQZJF9Br0IzT+q/T+jlq0LbmMV6vb5IHWhpiiPkmXZfNVdxzsVlV8KzT?=
 =?us-ascii?Q?YpfoHi2AgiYOBqzrMFqxm6jG7Zx9xZ7cpZTzockx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 171f6981-16a6-41ba-e41b-08dcb5ed3eed
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:56:15.0154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVsWYS2iFIXhUFFq9kdHTXEwPclFz8G1marZIY3gKlpmpkc1o3RnrcAzft56ggBe12/7XfGmr0kDoXDiIgEwwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8570
X-OriginatorOrg: intel.com

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.102-2024-08-05--working
head:   d2286b6d46210b4f6686f30dde7c897ed7a09d7e
commit: e7621e14fc7a50fcf04373be62225797f8761c8c [749/832] arm64: dts: renesas: r8a779h0: Add video capture nodes
:::::: branch date: 28 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20240805 (https://download.01.org/0day-ci/archive/20240806/202408061424.Pkb9eMiM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061424.Pkb9eMiM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408061424.Pkb9eMiM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:963.12-973.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:991.12-1001.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1019.12-1029.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1047.12-1057.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1075.12-1085.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1103.12-1113.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1131.12-1141.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1159.12-1169.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1736.12-1746.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef0000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef1000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef2000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef3000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef4000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef5000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef6000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef7000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef8000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef9000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6efa000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6efb000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6efc000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6efd000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6efe000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6eff000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/csi2@fe500000: failed to match any schema with compatible: ['renesas,r8a779h0-csi2']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/csi2@fe540000: failed to match any schema with compatible: ['renesas,r8a779h0-csi2']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/isp@fed00000: failed to match any schema with compatible: ['renesas,r8a779h0-isp']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/isp@fed20000: failed to match any schema with compatible: ['renesas,r8a779h0-isp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

