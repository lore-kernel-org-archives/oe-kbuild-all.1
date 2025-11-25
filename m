Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BB01C5F10
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 02:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764037686; cv=fail; b=PRcQcKHatBp7s8uHKz9L5cPUszLxVgpqMcHHiXnZJM0p54exhsm3yPWv4uDm3GLRBZddOuXnrnGIbZMr6scsnedqdNch8wGN36rf9vE5qpQpJKRoHfaYZ9oUcmAFY511BGs+nnfBqi3ZTMMLvfhcKOLn/4o5jpxaddK6N5i3uU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764037686; c=relaxed/simple;
	bh=on8KkkIvKguKR9I8cphwyL16esq1qpvKO+R8w7Yv2+0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XF+YT1wiwZFbIVbIBavGC35fxXOMAwJqvEujJ+0JXiL2frmEIhwx8hEK0OMEEEqQLePn1UJfNf4mlj3m1TcGnRchFWl1esZQq+JntF9z2LyynETEQUq0509pg+UB7Ouvwc9a1Wo/cSwU9hfj8TnlF4v5dUuulWbzoksdrDO8+rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aydyukjd; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aydyukjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764037684; x=1795573684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=on8KkkIvKguKR9I8cphwyL16esq1qpvKO+R8w7Yv2+0=;
  b=AydyukjdtlyVJBTzfP92+ntp55CVWNXpuoIpEmWoDdu98k/s8Ma1u6OE
   cwrOg8p/dPlpcinZai5J36kGiaH8uEFwCAAXlIbKbiJZ72ZJ3o9WdS3to
   Dl51z8HSOCTNDu9Z//Bb/0V0geb03LtOkyG71x1/So+ltJaCXaCGHAYjW
   D+uf0UPShmfRa46gws2HsDV5CuwcMhalksmzjrWBJVzE164l8cN7beDzT
   OLxoHxJLV5wryP+wdhuVhL2yxgm5/8dALAO78X76HUgDKMBIatnKbQImj
   iQFOmnoN7pSnHp72o9YsRCeV8J1jEvlK2+W7F98zAnfGrPo0ho6dT5ntQ
   w==;
X-CSE-ConnectionGUID: Mco+XwicSRys/xIJtI8Y5g==
X-CSE-MsgGUID: 3b9C95B1Tp6otlQunyquJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76737010"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="76737010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 18:28:01 -0800
X-CSE-ConnectionGUID: xftzYrDMTpS+FBcZFVCkmQ==
X-CSE-MsgGUID: f1KWZtGbQKajN4SI622MzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192151132"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 18:28:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 18:28:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 18:28:00 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 18:28:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTeyQc9ZcOV9xwhfuY4SnZ63j8tqU0B2ly+Gw0mgYvrDkeowdJunTqxJXQLa0PXEiUsqJs6fikMuXTi8Zk4NIJCaGC3gI7CUoH79kO1ntKoZViOr0VuDRjIPkoRnFBAxVYr8W0VrykYEYvQ9dBm5H+6pgug7buC8mCIroIhML3iUl4nAJ/zFJa09Yfq2VOZXukW5Cqngo6+TqVJrzYmF7kAzvyPMpIWBNN5x+5r604h82ibG0ovh24y+dFjyT866OwPSH2DF9/kfCmP7gfs8Nno0dJtd8YMNZgUVAcY9gfn5X07Jt9qFKoouxTq9jgFx7dZKBLBKQLmyWlPx3T+f/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZplfZDjpl83vJ1S+7LUiJ9e1XiY/s/u9SIBlC65eVr0=;
 b=yLFS7dL20/iRyxrFrsI3euG14Rx0nhE1LZgCFxmhyMh13gaf32s/MReQqpThbMHAdwQ+JGi/gJW6S9gbqQdeWyTcRqkruWoXxfNZVPDGnKxMkCNuAt0B9XcR6K+l0jCdOhRSXZIT0yR74fPPE13wBEqlwTdgLit4s5LxADtunteWNrO5De+FjMZUJBzIs/JxZmmcFLCsQRtHA2Zslc2Gl+YcdZwMbmz86TMK+OyWM5ranPkLVA5OgYMsjQIsXAwNIHPoIaSkdIzHzKoqfxZHJgjEP2qCw1k74Nz3zxY4XOnaqeILP0a832PPA8sKqdpoJ/JTTbCiwg4E2EQiTcK+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB7895.namprd11.prod.outlook.com (2603:10b6:610:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 02:27:27 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 02:27:27 +0000
Date: Tue, 25 Nov 2025 10:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android12-5.4 5/5]
 drivers/power/supply/power_supply_core.c:739: warning: Function parameter or
 member 'temp' not described in 'power_supply_temp2resist_simple'
Message-ID: <aSUUCFDeg3ytnM7t@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CH3PR11MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 4117ee07-0650-4858-5421-08de2bca2d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b7AYtBVr94KUSTgOCpFIzElneMgrmAy0rADHw3/XaGGlDXG0H91EbwgGw3/S?=
 =?us-ascii?Q?tf98BAfAZcxxScyLMOm/4hu2Ac9Z/PNZ34MUMoXk2v0xNPFFI6BXBu+uyeg5?=
 =?us-ascii?Q?Z7akU0EeLd/80aNcPUOXtRo4uBlm1lkCOJh6yXaVczGMMiNOdGvIvDuQVStM?=
 =?us-ascii?Q?NIUZLoESfk4LcYOb9q4C0vJx/WnsbKXF+FcTs92KZjxvm9Oeww//PRVWl7he?=
 =?us-ascii?Q?g9cZgw2gHKObsBTmld42kGXgM/KYnBAECyzBHObzsXQxjO83KH/5f0yWHi3I?=
 =?us-ascii?Q?n+vfIEYUHGnArmqvedUA6AYRILT6R8f9PcsmsjSKotyYsvLIBahjgsF/eur2?=
 =?us-ascii?Q?AKCrTRNP9ySvhiO4BbKnfN8IMzep9eLxjxW8f83ACjN1sMn3ovVq/Tr6+/g4?=
 =?us-ascii?Q?eMR2ByGEdcCdqO7LvD9384GLYZwTtLHdxcetEoVx8GTXka6jowjKGrwZgRzc?=
 =?us-ascii?Q?mawCEf66gZ7b4aLFZu7ylV1cVk6uHx1Vp40p3LjmA+VhDSWFrwGKlUg4MAYy?=
 =?us-ascii?Q?arVKDyg8p0l/e4GO5yjFBrgPAMVmi0AavRZGpcsvN55FB/gNdWoZ8Y2rmjus?=
 =?us-ascii?Q?qegtmHk3HWePZhDaAhdRhb3a61Aj7a7eFBWbAsqpVcxwz0CY4rH4V/+a1mNl?=
 =?us-ascii?Q?l7fQLhmF98fpftlbX4JMGhZqtpFLJVXuGD7DfeSFFPYsTdxz8a+OLBi7VVpw?=
 =?us-ascii?Q?tvmfYzhlrZvIUJkCIbR5YeQCfajlqMdKxGrKlOKNM4fS5zPYZU2NH8LnSthU?=
 =?us-ascii?Q?owrTXfNA/9vEbicCsmX0mrvhxK/cycuGxG90OEuYW2DSEbLMNQfuZdw/iU3w?=
 =?us-ascii?Q?W7WFGy43YGv1xnfjvzUK74ZfhbG2tlHfADdPgKECXKzb4O31C+8ZKRf8dRTb?=
 =?us-ascii?Q?gE/LbPhkIKY8Kz0AzbX0p5P4PLwA9ijQlVuirICufcIvnzhiklwHg7gfJepf?=
 =?us-ascii?Q?PNbKiAtde6n0ASKt/Q8DotbZ3BJg6Nqy6hrwJy+W9pOi4mhmUPCj8jvGk3RK?=
 =?us-ascii?Q?t36uShxvT0iIfumUu+AMYdFZ6XTiRKnk+uJ0TdgiXAxkRu+AdLWacAz0OoNe?=
 =?us-ascii?Q?hfU/n2cgDqnJtXaJ/KhmzSeCpZD7WLzsBcFxyxffo50/PlrxCV/yP7zTuhx5?=
 =?us-ascii?Q?t3kotD1uflsyqoXZqNyj0V96UlZf/IdQYFV1PHrrr6RUGwJKAnsAMEvdh9+X?=
 =?us-ascii?Q?sxe5IBE6avuWnen9f2aZw2q4z5yBZRp0y+48twrj/IsfxJHI/awZFRO8TJiW?=
 =?us-ascii?Q?c18gdmxqAjkVDEq/D8JuNDOx1QwTKOe8nCBTSI8GtC98854XBpdX2ufZQC44?=
 =?us-ascii?Q?xudzohz086d8ISS/Ro2m+qKiPUYU7QVAbWgK43yx4vtdpKsXoC5vjlovR48E?=
 =?us-ascii?Q?bOLKNNSQE32omB6IeKiRpUvHw07K7M16cHwuchGL9CtsABHu2zx/wfZ1w1OZ?=
 =?us-ascii?Q?cRYiYwa36+bfrrh+mgF4pjqxKM+n/Gir9Oam6Qn+IPJ/h4kk7Mc7fQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Ixjeauk4ZoP40gxDcH3KwSrhJJRcDPOpw9RPR40BBZxQkKC1UCkyuH1aBSB?=
 =?us-ascii?Q?lJCQfZWw1haFxnCg4rpL0b1vBwD0+vUaGIy03GOaVQTUKuKGqn4VoA1vgXE/?=
 =?us-ascii?Q?BxIce7GruzysXnBILuAQExuvf9HnzV3Citv1AjgNKXzhCUnvM6DDVTms0pll?=
 =?us-ascii?Q?ESTEHP7TWtTzDU8wGpDrsjZ1LcpjmAsjUCQw59aWzsMxNpMC1qHb5VQpdf71?=
 =?us-ascii?Q?XvEbAEGujK0q9LY6IjLh8ekAjq+jzDCZrPnUwFmPe75Dy3ChMXcBrOTNCybe?=
 =?us-ascii?Q?D6WUEFcvGIeVF/Y5iJfJSgILANdiWBAJPynfAPsrLknXEdda63h31iITn5/Z?=
 =?us-ascii?Q?5FFMjc317EeXEYvdhLhV6UzB+ncri9DRNtl0j02eZ+NbrWbsVwuLTktMCdTx?=
 =?us-ascii?Q?jef3GIiAKl8B84hrjC77gIXwUrflUOES83JM4c+wxHEG1iDUg2Gz47oB/t0i?=
 =?us-ascii?Q?XSbA1a/yh4TZ+7I79oDqNt6WnObvKpVzBrqFS8fwm52wrgbfjd0uSbg7tlOO?=
 =?us-ascii?Q?6uuWp+jw7GW20oebeXkh0lqOfkx48M/gfqeaa/XAzFJqWZmIYgfFNELMa9tu?=
 =?us-ascii?Q?u+QfogF41/y/Tsz1RrkeSte+uKAXpOw/Ser1uh5L/81EiTqTUJ1CKIhxMndX?=
 =?us-ascii?Q?KSdQMY2wOAUGD6RZ6JnrMx3P7CDg5lgLVNtOD/UPeeFzoIE2Vx8Gw5ju1NVn?=
 =?us-ascii?Q?SK3fLCYkm/KInvxSj+U4aCKO89UUO4Gj0zKHb9EvK8doKlkkAG7UQff8dZ0x?=
 =?us-ascii?Q?tUF3qcbL++DYAWgM6CqNrqPWtah2GSAg1WmrHBo9W/j4pzFEB7yavrXsR8W8?=
 =?us-ascii?Q?LaulVIMro8jss37l3zgT1V2PX0deOpeRV8OIFtzJ10i5q00NnvdlAdVJiLEl?=
 =?us-ascii?Q?oT7YtqCKLxsNNfPLrJ7K0+HklZ810rNZ7qhDACjVdG74FrQ4WbENND4S78wi?=
 =?us-ascii?Q?ShI4DlCQjOeiUKgzCLXudR4q5uodUzDRhwackAVgCbTUCmuGT8V1SdyYvWho?=
 =?us-ascii?Q?s9hoh2bQyogVPumfxSR/eVyAuZq52liH1Z+vjrEWuq0V5tAHQte0oL6KBNmb?=
 =?us-ascii?Q?K88UyT5aRnG5V679tncjAw6G5jhjx91KEz3wHd55s23AVO0Bz1cjWDzyRMZT?=
 =?us-ascii?Q?mFLbn4QuXGOJyXen3FKrl0bOvBCjqvUaHP6Bymu0O593opgPMO7ya76rNKie?=
 =?us-ascii?Q?9O6GVM+eOCWX6+HkjtjZAGuv8j/zKGJDmlB7rpH2kE9E11Kgyu3T2AMcbAR0?=
 =?us-ascii?Q?cE2+RSHaZR5FZP0Y4j8YFW7ILP6DphJAQ3aplw5j29B4+yEo98Do6fgy+5km?=
 =?us-ascii?Q?MNcQZr29bhahFhyzh6jot7ixPF2i95OXFyokC1L2uyj6+GqFBrEav4AaSgMR?=
 =?us-ascii?Q?elGcfjYlXsvneCe4v34/YsFkjWHf9k6O3t6tV+M4HcfCMF/aot6HuqlyshIM?=
 =?us-ascii?Q?oKjNBXEstCNztM4s5I0aMeDJ/gum2D79cp7JYFCWzG2UVpu4ZachOc5gmTJQ?=
 =?us-ascii?Q?qkq06mbVT9wH7U/vA+up6UIJEz1WtIWmK+CwTbSmHSxdRCU3rM+Y8B96nYgg?=
 =?us-ascii?Q?k31g5Ib5L2CQ082cbV/Di+sPMv+/c6JFNC3clv+3QMTNTwI8YtQnyz70gOSS?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4117ee07-0650-4858-5421-08de2bca2d48
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 02:27:27.7952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhav4qtAlDuNwe0087TENoq50NGnc5siojjL3m65yWU1DBfzUhsJo+5OjKgUsqusM3+uQKpHN58IxnetiRJUVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7895
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: a96c947b075f9781a5d5941f560acf8b4c01405e [5/5] UPSTREAM: power: supply: core: Add battery internal resistance temperature table support
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251124/202511242124.Ql5cORJX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511242124.Ql5cORJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511242124.Ql5cORJX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/supply/power_supply_core.c:739: warning: Function parameter or member 'temp' not described in 'power_supply_temp2resist_simple'
>> drivers/power/supply/power_supply_core.c:739: warning: Excess function parameter 'ocv' description in 'power_supply_temp2resist_simple'


vim +739 drivers/power/supply/power_supply_core.c

3afb50d7125bcd Baolin Wang 2018-11-05  722  
a96c947b075f97 Baolin Wang 2019-12-09  723  /**
a96c947b075f97 Baolin Wang 2019-12-09  724   * power_supply_temp2resist_simple() - find the battery internal resistance
a96c947b075f97 Baolin Wang 2019-12-09  725   * percent
a96c947b075f97 Baolin Wang 2019-12-09  726   * @table: Pointer to battery resistance temperature table
a96c947b075f97 Baolin Wang 2019-12-09  727   * @table_len: The table length
a96c947b075f97 Baolin Wang 2019-12-09  728   * @ocv: Current temperature
a96c947b075f97 Baolin Wang 2019-12-09  729   *
a96c947b075f97 Baolin Wang 2019-12-09  730   * This helper function is used to look up battery internal resistance percent
a96c947b075f97 Baolin Wang 2019-12-09  731   * according to current temperature value from the resistance temperature table,
a96c947b075f97 Baolin Wang 2019-12-09  732   * and the table must be ordered descending. Then the actual battery internal
a96c947b075f97 Baolin Wang 2019-12-09  733   * resistance = the ideal battery internal resistance * percent / 100.
a96c947b075f97 Baolin Wang 2019-12-09  734   *
a96c947b075f97 Baolin Wang 2019-12-09  735   * Return: the battery internal resistance percent
a96c947b075f97 Baolin Wang 2019-12-09  736   */
a96c947b075f97 Baolin Wang 2019-12-09  737  int power_supply_temp2resist_simple(struct power_supply_resistance_temp_table *table,
a96c947b075f97 Baolin Wang 2019-12-09  738  				    int table_len, int temp)
a96c947b075f97 Baolin Wang 2019-12-09 @739  {
a96c947b075f97 Baolin Wang 2019-12-09  740  	int i, resist;
a96c947b075f97 Baolin Wang 2019-12-09  741  
a96c947b075f97 Baolin Wang 2019-12-09  742  	for (i = 0; i < table_len; i++)
a96c947b075f97 Baolin Wang 2019-12-09  743  		if (temp > table[i].temp)
a96c947b075f97 Baolin Wang 2019-12-09  744  			break;
a96c947b075f97 Baolin Wang 2019-12-09  745  
a96c947b075f97 Baolin Wang 2019-12-09  746  	if (i > 0 && i < table_len) {
a96c947b075f97 Baolin Wang 2019-12-09  747  		int tmp;
a96c947b075f97 Baolin Wang 2019-12-09  748  
a96c947b075f97 Baolin Wang 2019-12-09  749  		tmp = (table[i - 1].resistance - table[i].resistance) *
a96c947b075f97 Baolin Wang 2019-12-09  750  			(temp - table[i].temp);
a96c947b075f97 Baolin Wang 2019-12-09  751  		tmp /= table[i - 1].temp - table[i].temp;
a96c947b075f97 Baolin Wang 2019-12-09  752  		resist = tmp + table[i].resistance;
a96c947b075f97 Baolin Wang 2019-12-09  753  	} else if (i == 0) {
a96c947b075f97 Baolin Wang 2019-12-09  754  		resist = table[0].resistance;
a96c947b075f97 Baolin Wang 2019-12-09  755  	} else {
a96c947b075f97 Baolin Wang 2019-12-09  756  		resist = table[table_len - 1].resistance;
a96c947b075f97 Baolin Wang 2019-12-09  757  	}
a96c947b075f97 Baolin Wang 2019-12-09  758  
a96c947b075f97 Baolin Wang 2019-12-09  759  	return resist;
a96c947b075f97 Baolin Wang 2019-12-09  760  }
a96c947b075f97 Baolin Wang 2019-12-09  761  EXPORT_SYMBOL_GPL(power_supply_temp2resist_simple);
a96c947b075f97 Baolin Wang 2019-12-09  762  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

