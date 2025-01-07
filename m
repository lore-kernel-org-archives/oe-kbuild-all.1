Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9744E7082B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 01:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736212781; cv=fail; b=DqvCswBQLNrsqa67Aied2X+/POyKcZUJQd5pKn9BATAAs72IINuRb8EXHJ6LxR5EY4e7Wu2DYD+63tecYRqllxP/DVrnQ4DrDRM7No4QEKMNflKsF3mXrq+J15N6i24H66wVj66ffWk4b7yXgxoFXigLoIB3A/ISM12D8ERyHxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736212781; c=relaxed/simple;
	bh=PMICSChC8JQl4tf6PjaakZuLLOs7ur00c5+f9YMtW7M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fFi4gFawaiyWvJwpgJzwdGRGDhNWbK/9T2KjSiIvU7VwrZNaDQ1RLVQ+kHVWcKbg5pTlGhnVw0SBrqgzu4boYxItkd+9JIoeSTfXhHGzLoDfWvhpCsEQjbRle7WqaXo8Y4QWYsSDghsu3VOD+B0vi5P10/ue0dzfek9DbWrLWRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFgfq/Qt; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFgfq/Qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736212777; x=1767748777;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PMICSChC8JQl4tf6PjaakZuLLOs7ur00c5+f9YMtW7M=;
  b=JFgfq/QtjrDBVFz7Phe9odI1MGPl54G27RycaibMD07jiBY+gjhXkRVe
   rNllV4OXvJDHDzZzBV/OqMEJ+B/tcjQaoibLPKJGdw/BDDwPylAy2e9cO
   O3dqNJGQmMAuG3uSIkUiHpfIa8iLqpxULL8CfLJhAHy+Xz6YpIIdF0IIk
   nsORjniqaWAGhuhFEdqCeAnkGcZIPb47iwkx9MvybqU2Dfi6xIn/cvJFe
   JYqrFHbpNiQO+ay9gldYtsaf/t6FpRMDJQfgTJIziVFTFwjtoY8UR3+Dq
   mZGP/bHQXSisaCCXqnZqu8C2h2fWEK5M9UpqfE/RmNPEL3X8NNDrl8DhB
   w==;
X-CSE-ConnectionGUID: a14EpoE5TTiALNdIvGRrtA==
X-CSE-MsgGUID: 5CeUefBdQoeCfZe6Q+HIBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36535581"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36535581"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:19:37 -0800
X-CSE-ConnectionGUID: p3HNRvI5TLCOwEBuei7Kfw==
X-CSE-MsgGUID: sS3XPSoxSq20+OSI+CZNuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133514262"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Jan 2025 17:19:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 17:19:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 17:19:36 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 17:19:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6salriaMrXyOeAdPAkcYEqqOb0QiWodQpsvO5KKZ335PKFlioRdD1AmvXaPZV5SJ6snKJ1piavIDVWaCsFg9waJaKGGkiY3q2UEIcLgDV/bFFuLE4XEDZtuxbEuPj2udKyYqAzCa65WMWZnm+x50dF6ji4dDsDzqzoeJ/07maMnNyAF9HPAFzKW1XypmWQY+qQVbfffv6Oz0MxcVBa5Rg3qMhWZIYAA7wvvQ15EZDmdv7ghDHXZqyfo027zw4bcYGdlvhxK6AAqR1GdiCGYFbmDg/2lQUMbC2o4G7THtpiYjkShWxzIg/diAAfybzYjnvTvuFhkFLPlMlqqdjc0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFsWDf/zNl+iLRr8Rbq4NohAQJ7Nw36YuHfURcGi8MI=;
 b=DQQ0eE2Z1ye6C7BxmFV9ECAqIpQQfx3PszTHzxIQ/ZIOBWETE/z1kYv/aAd/a7dO29B94p/O/bGGmR/d8luGy8wywvkqSbm0XZG/tUE5EelcgF9CeiIaEQuf5MWXk0kAfHMMlF9BPKM6ws+7V47y9NkwKtpmgzN5yH/bwuZEnTniQCmCMxgojjv6iVX9xIlsc192WRMnZYt0FfxmrfDqeXETjf0l15HISobX7ibfriU3VoECf+QNwucl2gkmai3W+4/cFzk6CqslyZ7xBJEHFX85qOnb9fLG7UWZmZDxRX3d0ohbhIPAvLnvoVo/k+7wZvjuLQghWzLJRq8V4vG/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM4PR11MB7758.namprd11.prod.outlook.com (2603:10b6:8:101::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 01:19:30 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 01:19:30 +0000
Date: Tue, 7 Jan 2025 09:19:21 +0800
From: Philip Li <philip.li@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: Jonathan Corbet <corbet@lwn.net>, kernel test robot <lkp@intel.com>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: Re: security/landlock/ruleset.c:644: warning: Function parameter or
 struct member '' not described in 'landlock_init_layer_masks'
Message-ID: <Z3yBGW7Vl9niXv0K@rli9-mobl>
References: <202501060543.XG0RGoPB-lkp@intel.com>
 <20250106.iejae7ueh1Ka@digikod.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250106.iejae7ueh1Ka@digikod.net>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM4PR11MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e7e020-12ee-446c-3657-08dd2eb955de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?S+neeQuillQubFxsp25qpf5BXNt/t7/yVGVupHxrgLAXl5p4o/h/I/Zf3m?=
 =?iso-8859-1?Q?fYtH/Ey/6+jfipLLZAfXVxHIh0am1ukO3iZgBD+xbwzzkjAY3Y9nZItp9/?=
 =?iso-8859-1?Q?eNuVY+0FNMlv+sb1eMZT2qrJWhH1OCB9RXJaUS+nPpxkI/BjcQduGhpfeW?=
 =?iso-8859-1?Q?YqQEOUbexVClto+hSChVPjequjdwRoa65U2fqpLoBXTEjTk/cBKuBsILmB?=
 =?iso-8859-1?Q?l1wlLQXo0d3BlfzA1N/05d10C2qFKKdIm55kk40Pu1rHeIucpA3p7cTiEQ?=
 =?iso-8859-1?Q?/mI6p9pYkMHsE5NeqT4NbQYekUcyC1tr3hO8pZYQK1+OYGIFvyh80KYppZ?=
 =?iso-8859-1?Q?5p04uYejXw79K4+Ij0yA8Edl7Fe1nIAeh7+VzCnkYP9kjEbI8SCg9LdVL3?=
 =?iso-8859-1?Q?qAlKACBLW2xTX1LURgY7Kdta3Zs3F8iK7UjHzlw/MIIoP4GnDTU6SeBUDM?=
 =?iso-8859-1?Q?f0RtZLRs2Uth0GQzLqKlyFKM78eRp25SfkBGmFp1S3eklvGA8Yo1XIprjq?=
 =?iso-8859-1?Q?9y/Yj7juIr9IxJ5wW829Op57tFrtOihbX90aHdWgD247E5GWUz/3v2C14/?=
 =?iso-8859-1?Q?kThRTr5xNqf8IgoDUgSUyGo3YBW7uSy1fagZQos4n3YVj1RlbPchhX4TZV?=
 =?iso-8859-1?Q?4qM8tAvW+uv/cL3kpziL3qKgOH1KGd4hqmSnrxymu6i6HQdwdDrQpN/hs4?=
 =?iso-8859-1?Q?jxrqyearqgZCTH4yZRwAzt/gwuVXOVhAE+uD7gB0LFEhE7j4mhVVdHlYom?=
 =?iso-8859-1?Q?b4V3xhnTRPziW0OvUbShDslyO0YS5XveW4O28+wzXTMVQ8Dn/5sphHappN?=
 =?iso-8859-1?Q?zcltZjj+kCVTn5FcuQboucgNz60ZLLNFW4aY6w2VCp5sPb6Hfp/7McRQRc?=
 =?iso-8859-1?Q?uKRNYZZN3RcKwosWvD+La7dAREXX7gh6F8sHogaNrpkaxC4OTqtzJiqS3G?=
 =?iso-8859-1?Q?Uxf9wwACSTej0Cxcr97VeN2t1diqpNuz0g82zwgp9Tt79axMx1vhgAVHk0?=
 =?iso-8859-1?Q?OWhXz1zwOynwDbHG2cfMNKLgKwVAV39mLOjdMc6ymR6Zwszvq1KtFp6BqM?=
 =?iso-8859-1?Q?c4iYtCfOCdym3AXnCWLChhPxEX+t6M9AGjJXpEzPQCS5v2N3uiJvBQ3wrI?=
 =?iso-8859-1?Q?Y9j+wTvlMx+QEPNv0SvHDdeuhkahFCPan9oT3G2X8RJBChlek4/DCTX+IG?=
 =?iso-8859-1?Q?XdyIytObgG6iAv8Emn24d1gv7ANkCHYwJpb3s7vXi+KC6mqkRdNXQTqDyc?=
 =?iso-8859-1?Q?D7eXGaDszWVFthyBbubVvmJ5GkQxpp0d/XpRz8gtrJ0kojV+FaW2+hDVWl?=
 =?iso-8859-1?Q?yyDZHBsbcYl6P2EFk5GXOZeyclkB1+TzccG2/zC7viXkiTVfgy4tTcQS84?=
 =?iso-8859-1?Q?dECSFZZrVplvhdqRJBjg3PaWyG0OtZ5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cpbdzL5v5653ppPcUi7kFCd4in/2/UeaVgW8NZ4HipLfc5LbNXxszUX8ki?=
 =?iso-8859-1?Q?RJtN4LlvBQNJHf43URR3RbnHwFjrWKSbTmcVaFGES2Bs4RLjRNGuG69VmS?=
 =?iso-8859-1?Q?99LCKvOtug8vrWVf3mtTF+vJHMqt0h396w1XLDH9smHTTQL7Hdtep+LZ21?=
 =?iso-8859-1?Q?cyf7BTsQ8Ta7ukAk41aRXgoYTgVP0lqMwMSLcdB106LJ/1YqrEjoDHDaxR?=
 =?iso-8859-1?Q?U9VisV05Qgi0ptcAesuWt8JLxFRg6FmBJS9qifgglaczdF/MC6ZOA9VpLR?=
 =?iso-8859-1?Q?pZDyfdtzc4qz5vqpwftiSbHi4hnEgpZ6cl0pG5iFiIvcme9mwzxAomVFOp?=
 =?iso-8859-1?Q?tvMG9bO8gjHF8BzbL2EJUvLb85p6mSIyAMMT7g8DEEApgDVbCvJzcRk1fT?=
 =?iso-8859-1?Q?z5+ils2WqD5TQ4E/Ul8Hri85t5mURg+Ag62EbDFyTZ1TckoukWLzZs0+e9?=
 =?iso-8859-1?Q?6x8Okwze5HC73KQJ4uaWZdfIuI1NjG1IVbe7maG9gpoxJF8JmP2tat7WY+?=
 =?iso-8859-1?Q?Oaj14DBFSrpToJjWVmzi/ia4lV72LF16LiMxwSx585RTm3vL8kx3tYxFOX?=
 =?iso-8859-1?Q?vadY8hROM/WCmTQ2orkubMZsBvF61+kCQRiZVU7MTjpFbtmHuHrrjySVmc?=
 =?iso-8859-1?Q?Cdhozu1JAyscFcuVyl3KwnAo8F6MIVCIJftKgjVuvQjwYiTvUOnRBUmQPS?=
 =?iso-8859-1?Q?FgosGlwpA+hjX5OCsn8kcFMznhJdyyuZhEVLW5x7CdYtwm+3QaruIzB/ol?=
 =?iso-8859-1?Q?+9xnjOCqLFRSqqJg7pws+0YjkrXX9gvcPAZqRtOkByjJHW0YcaqALtnc7m?=
 =?iso-8859-1?Q?8VvA/SsVQk4T486thpCqPhGYDKa46SlGCPhR6LVQOkGrQjAJwr4XLXQVUL?=
 =?iso-8859-1?Q?Kof6kDf2aLJGHwnwsU3hHUE4loRXtIY/HqfUCA8bHU1KuSTBkGqkqVaSgj?=
 =?iso-8859-1?Q?tm3yQmnzN8zLyN3ELVdTpGw/K2qUnDT+W68IoECY3dH2TghWCC9dVbcZUI?=
 =?iso-8859-1?Q?1CHZGdvwDgF65sgHF9kqmfWhJEjInpgLMkPJm9A1p4ZIGl9PId1pQrZwiR?=
 =?iso-8859-1?Q?HSPbeSlP1EnV2HiljrFib2Grvcz4ekF8+eFEqW9S+mPQZQ/ClG7brY8Yqx?=
 =?iso-8859-1?Q?mgxcVToxkumTxVaETpScngaagryhf7O1BdagxOCu6NqjUfHRORJBc+Bt6+?=
 =?iso-8859-1?Q?LHwi0bHmjV5V90wfW2bsQZy4iv13WDg7myHxDXApEuy2IOel7YIvxoQvZs?=
 =?iso-8859-1?Q?9XRXgv1j/ySqVpY4WUqdK9c55qQjOovTAxAJXNi2UDJ8tICyGds5PCEmPh?=
 =?iso-8859-1?Q?8F7n3wtF6OmtTryB4a79GEEgEs9zQ1Mz01KWxxC9yJjOq0/UVVQZoU1hQq?=
 =?iso-8859-1?Q?lAiJm2TYiMlhqf89mcVaxMQStHnldHMdbhXBc0BcG5pUq1i+chOyEH2jIu?=
 =?iso-8859-1?Q?9kgpihvebogGZEPam+sjziukMwWDDy/LsdyrEPTuyURQg6S9UXm+/WNkIs?=
 =?iso-8859-1?Q?pPkH2ZkJ1spWsJad3s8D2otnFzJvEyuHPtW6rBKQtC4ai6Nz+XD4kWL1gM?=
 =?iso-8859-1?Q?ygV2RTSCHhXK20CfKmyqj9MN20rRdrh/jyTR+cKoUv/H+WRe9WSpUU9Vjj?=
 =?iso-8859-1?Q?flKdOSPdkdk8QcTA+hB087u2cLrIieQrD6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e7e020-12ee-446c-3657-08dd2eb955de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 01:19:30.4034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2eKcKXjOUHCZpGwgVXZt2DBvftCQXZXm1D6Rk59/z+lJVntnHwhxFOv2jGIwVclGaCsCUnVQnM7fq0DvS0Evjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7758
X-OriginatorOrg: intel.com

On Mon, Jan 06, 2025 at 05:18:36PM +0100, Mickaël Salaün wrote:
> scripts/kernel-doc definitely has an issue with pointers to array.

Sorry about these false reports, the bot side will filter out these
invalid kernel-doc issues.

> 
> On Mon, Jan 06, 2025 at 05:07:32AM +0800, kernel test robot wrote:
> > Hi Konstantin,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   9244696b34f2a626d7468864420ab6a47289bf10
> > commit: 0e7410112964168a65578002269ae3b80b207936 landlock: Move and rename layer helpers
> > date:   1 year, 2 months ago
> > config: csky-randconfig-r026-20230729 (https://download.01.org/0day-ci/archive/20250106/202501060543.XG0RGoPB-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 12.4.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501060543.XG0RGoPB-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501060543.XG0RGoPB-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 182.
> >    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 182.
> >    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 182.
> >    Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 182.
> >    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 182.
> >    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 182.
> >    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 182.
> >    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 182.
> >    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 182.
> >    Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 182.
> >    security/landlock/ruleset.c:182: warning: Function parameter or struct member '' not described in 'insert_rule'
> >    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 182.
> >    Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 182.
> >    security/landlock/ruleset.c:182: warning: Excess function parameter 'layers' description in 'insert_rule'
> >    Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 644.
> >    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 644.
> >    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 644.
> >    Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 644.
> >    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 644.
> >    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 644.
> >    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 644.
> >    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 644.
> >    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 644.
> >    Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 644.
> > >> security/landlock/ruleset.c:644: warning: Function parameter or struct member '' not described in 'landlock_init_layer_masks'
> >    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 644.
> >    Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 644.
> > >> security/landlock/ruleset.c:644: warning: Excess function parameter 'layer_masks' description in 'landlock_init_layer_masks'
> > 
> > 
> > vim +644 security/landlock/ruleset.c
> > 
> >    626	
> >    627	/**
> >    628	 * landlock_init_layer_masks - Initialize layer masks from an access request
> >    629	 *
> >    630	 * Populates @layer_masks such that for each access right in @access_request,
> >    631	 * the bits for all the layers are set where this access right is handled.
> >    632	 *
> >    633	 * @domain: The domain that defines the current restrictions.
> >    634	 * @access_request: The requested access rights to check.
> >    635	 * @layer_masks: The layer masks to populate.
> >    636	 *
> >    637	 * Returns: An access mask where each access right bit is set which is handled
> >    638	 * in any of the active layers in @domain.
> >    639	 */
> >    640	access_mask_t landlock_init_layer_masks(
> >    641		const struct landlock_ruleset *const domain,
> >    642		const access_mask_t access_request,
> >    643		layer_mask_t (*const layer_masks)[LANDLOCK_NUM_ACCESS_FS])
> >  > 644	{
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
