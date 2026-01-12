Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676641EB19B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 00:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768179016; cv=fail; b=phh0r7TIL+WrcxBtTu41FobKcnhkeISSoN/aEe7GQkY1sP70HBxcVpVl72nvi/o8jHi2t9wwur++Iw2ETYo0+LwBnHDlzNeSBVZidcYeAJ0P0+Egb3HLhCMoGn+wKUu+ap1TE2RTqVS5xCfYFu41S32uw4YcY+C/iGFrmiC15SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768179016; c=relaxed/simple;
	bh=dWgXbEumW9ZPQcAlGKSxam8q5vqelBzl31Bsv46L610=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NcSwLEosanhjbYn8W4iw078fV2oAdv2OD0ZIbBisXF5BUOB8LhoU10crksOr2IM9uytKbGzw5Vcrmtd8k/OqqfthAzUKum5MaqIcxksB3JXKErmg9kuZxr61bbhT5udy4qH1aO1Wm36aec3GmqOdjAPwQ54pt5K9G0BAN0B6bdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGABNXjM; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGABNXjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768179015; x=1799715015;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dWgXbEumW9ZPQcAlGKSxam8q5vqelBzl31Bsv46L610=;
  b=BGABNXjMk6JfrOwrpSWqNwiD+BUMXp/fY+pm/YDw3PmVPzGR6d1Ntuvl
   Ya3tF4GwWrpdpFZplPnnyEGddb80Z1kuE92+ipR9q0a2KI+r1U5uj4c3N
   B0sgnp4BnLZenpbz/Bqv3mNOCy04D/c3nUgH6H2TBANguVHNVAFbPy+m7
   ecsGzeVhFuFOQx02agCEqzbEcTZekyxx82++pj5PJfOfo2R+ZD/IZCHqs
   RJIts063ps/yts+iEvwgjEwCSDHIzRvci6n5E14pL/6gFov1DfY3qouAl
   +ErEa6Og5Z5VAs3WmRzHO9tQeBoR9gzrT9dBpvlZdrNEzM0A+BFB4LEX8
   g==;
X-CSE-ConnectionGUID: HcxLJ9UKTXqoMrPmCw9ysA==
X-CSE-MsgGUID: 4Z/++pYMRBa/7E19MCx3mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="72032722"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="72032722"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 16:50:14 -0800
X-CSE-ConnectionGUID: ftY3C0deSyyRUfK3dSR1Kw==
X-CSE-MsgGUID: MxJPeiX7RFCcDMGH8/tRFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208490736"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 16:50:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 16:50:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 16:50:08 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 16:50:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5//cemIOE8nYtDtGW0Pld8twJq+WrPK0hKqqu7mao7DODiw+dv2cMB1DZX4M0FJoXucMXR45zmPRw/Ox7LOVcViicy0BOjuy5sOVu9TxpZQnY3km3PGWf0TVfjvE8cc3q8r6oEEXABkwYMQZAN6kSnpGoStXTHs6oAM+K/6URSqW8kf+0Ve1P/QEYkwZgdfV/xc6HwSWV2PS2txNnQ7wqKfhPo+sCXpE0he58qP91glVbMpU3vbGBE6Hvo/PNKB0rRj3HUIntbsExZB8plDv74LAnvkBnAmixQkrRD2vPNWI+rAQqKVSq+ql1X8pcO2RqnBmbwJjasaUC0MC9svow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nbk7TVa+aYzQS21TQioEhUuHMSVStZpEbfVWAIBCmSU=;
 b=X+0kpnt5/FjxU8YQx1WTgZ9lLhtRhTYLVZDMCRFksFOz7B2XJiHCivTOT7HTyTg3dt3tktU6BfQncb0xdneb65VfTOTEre1DrTBNFrfjNvAN2AX+hYLflBNDJiIKbKGBGRY3jAsPSz1Gq3b07cbroeMkken2znoSATqHcn2t0+c8jY0EqoTG+vYatrkWk8liqETAc+s57W5r5SyWRRH/BjTFncXxGYm5CtfLI3UI5wC+1wz/9M27inytY6gryTn+m1RnVBvYVt5SClK6dbH/bkTwqdeHED6VHq+ikUyhvlDMN7TJYmjj0amek/xfcLtimp3vlUZ8TxFYM1dM8KCzMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA3PR11MB7611.namprd11.prod.outlook.com (2603:10b6:806:304::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 00:50:00 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 00:50:00 +0000
Date: Mon, 12 Jan 2026 08:49:51 +0800
From: Philip Li <philip.li@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
CC: kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Maciej =?utf-8?Q?=C5=BBenczykowski?=
	<maze@google.com>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <aWRFL4nDyNBIF032@rli9-mobl>
References: <202601110443.5ENBRFej-lkp@intel.com>
 <20260110221508.GF3634291@ZenIV>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260110221508.GF3634291@ZenIV>
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA3PR11MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 133b2f74-5a4d-45e2-de9c-08de517483bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yZpsro1wLFKsG2C2LfTxRwi65a7MjM52LhEnZjGigRvY7Q9UYgitLTakDKsB?=
 =?us-ascii?Q?9wBVaHkpWeiC5TkuK+E9s6Sh3Na6wB/k8uiGKfHxmhJ2ZHfG0MoJGGHrkQZF?=
 =?us-ascii?Q?t8yoLr5R3NOmKTK/2GvHUU2b8j0vKyK28/aSFR3cIQ3qwDD9m5KoboVZQt0g?=
 =?us-ascii?Q?cF89MidpD62BCRlMbNl2KDpgSVON+ds2WdJtW17QFiCGJT2ejIl/vHPQl4Zt?=
 =?us-ascii?Q?jHt58m0bivI51lvyVhsB7p+rSRgbV+UW2nqXsiTYqOSm9l8IVBmRWEX32rCY?=
 =?us-ascii?Q?9Nez6IJpSrrzr2sBbkZQQUEyJScmTwrrrBo0Kk73Pp3NFReuTNaWMEj60n8C?=
 =?us-ascii?Q?YhcD76w4GP+5GZeyv+mqWaZeXejlkKKl3Op+UGaNO6Owb6JFF60xSMOUEJ6d?=
 =?us-ascii?Q?MFyComjgGz+T8j+KPpPquehuVVwifqbOVhk7RdR0qBmpTjwEPR8pVDftFuSb?=
 =?us-ascii?Q?LpiU4DwbOK7yrKTcrZpAvgqgU0WQN72e+eLLc4EWln++gOVQZAWxq35m6cHa?=
 =?us-ascii?Q?CimTjhgFmEghHTdZPWoJrKZpKfJ5XEw3eWIPWsZLxdBk75BKI9iyGTSOGLF0?=
 =?us-ascii?Q?SFA1pF9udq6qaNxleaVzhOMipWAK2Gl5KchuZD0TVtwpVDkb0NP3qwIx5kJ3?=
 =?us-ascii?Q?M3q6fHcoqvfSn4tzkhUoy7NfqT+4MQozcZD2f5m5rh+d39ZfEYFOzVrAn7FY?=
 =?us-ascii?Q?SyGcsU0pan8v/S8aktoPQmEN7za+p5WHUkjaJSgq/8sAqCS5n5n7VWEQk+zV?=
 =?us-ascii?Q?NyJ1vV+z6J2/63cQGafipy1WaoFRsF14bOncyxqBHktYR86eKoBT6gjlQSq/?=
 =?us-ascii?Q?FqHpU04OJQ8JiSKIY2iaoTiLNAKJEG82QHyMPU7ZTuWtS07S3KJ7TtsPtKQv?=
 =?us-ascii?Q?yQIJN41trl2w1I4Uc6f6U9etDLRzV5VdYe4KuEZ94Mm1x5jyR8JTVRwO908T?=
 =?us-ascii?Q?kfgkZCLhCw1SPNKXjURohqv/BHUYUxg3vAHyxthYUU+Tmrulr4EHtV1NDze3?=
 =?us-ascii?Q?F/oD9PeygMfsQeuRo8iETK1RO10eCYN5bn0QChpVO3dRbYapo/dswOYPxQp8?=
 =?us-ascii?Q?jDjRNha/4P7H+3Oce4eDb7AiUO/XF/omAAHM4rCIW33cBgKoSMkvrNYabQD8?=
 =?us-ascii?Q?MLgixl8MFb7/ISzrhVCnRyVMPrgkU9P0CkibYUTNvBp+QDRmPVVz28YNLVdr?=
 =?us-ascii?Q?x87l4cWRovO5yGMq8UVgdL8Y+DYfvaj3/g3uaQJxCr2JKA+HkCMg6bOaeRjj?=
 =?us-ascii?Q?iSqRQvZ61q/bcoZQRSOH2csVYgKFT63GDmyGHAkSFui2nbULGJUaYcgFCtS2?=
 =?us-ascii?Q?c76Rd9V9kxo9pLtIRQq0XhZKYhliCSBKw9DACFwyofGkTQVcmh8W/n752pam?=
 =?us-ascii?Q?W57pfUoqkCS2I8YEfosEN+fqtpV7cRcKpT2fg1r6iK/lIebzJNQr/+7Rv+bC?=
 =?us-ascii?Q?/kJrCA1wLNR6r67HLbevwC05F9hXrwMWWm2XqIWu2QOuGFefd/KNpg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?myuQWZw8jBGR2EaZzPdOmbI1KTRtufcAmmVpDX5C8B0Lv+S6LndtZK2WqvpA?=
 =?us-ascii?Q?urc/tX95quklsHXr+MduR0U5GGKHEza3xALj2ONRp3fQyUb8hHVWL7u5UD6R?=
 =?us-ascii?Q?ZfUggLbkXEbEcoZJz+ZZxsZmo1BeI0YO4QF38+aJ+1zc+o1pbIfka4aYeHyL?=
 =?us-ascii?Q?hmWTrD5RVxhk5HURW/fJLCZncsf/d7+ebBlAIktc9xOCmK6XACy6ZrNwvz8n?=
 =?us-ascii?Q?wAPB2Bt6zjIO2Mz1q8egUzgVVdW19Z9UqzgRe0fObbHZENwvS+AoPp4LgoQG?=
 =?us-ascii?Q?hvFKqayO31EUPAVtRczNm4l30JtDIMEU2eqQitJHbie7ZDc65GASmGNFZ8fm?=
 =?us-ascii?Q?I2JlHCQZ8t5i+3a4Dm9J2bQQqQZQv7lBaQ80Rfv+F5fWIN98792Ietk/GdPG?=
 =?us-ascii?Q?2dvbEo8qdGNHbg9bDU9NfoYiWRpswywWGxEGixSnUC99Lv065FSXFUZgCmhw?=
 =?us-ascii?Q?xABpuCRzPyJHgLcAqT1OayUCQ06SHoOLnYvTITDnJyhtddXQqgT19HD/Aslt?=
 =?us-ascii?Q?59Gs+aBu89sJQ0VURnecm6hIOv2xRnpWZQZtUQRJleWLDbjtM+ciMPRg0rSd?=
 =?us-ascii?Q?gTF/ukNUJ6VNI1bQ1NxrqE8H5u8VnOOVgS1TDh/ljsoyxGm1UAFuu0DHtpld?=
 =?us-ascii?Q?Vh+ih2kjQQB/6NEdDKD0xOKV9+d0UoTG3CKXP1JrerDrCpMBBvbFUJ7+cEfm?=
 =?us-ascii?Q?xqyXkPepy5U8m5QLFX4B5K3lUQUvCTm4ZUC/pr5ewEvV11Pc3mknKgXgagrb?=
 =?us-ascii?Q?T4eCDLgezW2oQumdbju/T4A/V7i61zKchfwbH/2jpDSOt+jwt5z2CzLqWiVj?=
 =?us-ascii?Q?ZDSiNJJH7j5YvuuevrDkaj3fO+eenfQwhVd9hb1yglpJnfzU5281G2/XeAhZ?=
 =?us-ascii?Q?etRqaGsHR1cO7nP8lQbGJJxNaLpb/l6rgin7KuXpo50KvHlA3MEDV8dburjS?=
 =?us-ascii?Q?zS0dAoAn29MvFK1JE443etZQqlyzsLvHIuVDfaVCTp3CgH95/o/MfnOzj83M?=
 =?us-ascii?Q?kVqGgXeztSktopynfJanziqs/1W6ToDyvS8liX/DAOcoWG+MgomxQ/oFyRiT?=
 =?us-ascii?Q?jLXgBJ2CDMezGRYzBr0Sm5RExJX9ocmEwwj4F5dkaoxSzDadLGb23QBJH9P8?=
 =?us-ascii?Q?Z47+nK1SErHVaothboSb7WbsRjNH+2LLEp+yDILDDE8ZBC8cVV0WAoSojOJZ?=
 =?us-ascii?Q?f1WF5Fu9GKg1sBqysaxxPKZmKwdYZoR9wHSlMgLm/qf8XHEt+zeUn+v4D9Og?=
 =?us-ascii?Q?zq6bkiYMNqhow7SqnIY5sxlh1gXTpSVHgrZEQTga4Jb4/dL84Iy/mzG2OPoh?=
 =?us-ascii?Q?NIHrIsKRcJ3ifWSyKMwEf7jb18bajhWZuMGW7I0HjwEOQ0JsuRA2vqgyQTbp?=
 =?us-ascii?Q?1tLvnwXMdSofQ+v4IUthVDmoUSVob0xgOFKZ5ZlSjhYsX16focOzRa2EIbhO?=
 =?us-ascii?Q?bJ/aOjowgUoDxQ9fn2KEp85xI00vjS/iB29zTuwTu1l4c++n1uUUaFU6ZU/4?=
 =?us-ascii?Q?k8NrtPUEVLNx2CKG1JgznvQJXPkVY5LTCYkzG8prDMbmgtUCpyAeWzPxfWTC?=
 =?us-ascii?Q?oT40/ZA/7/f2RhMmz2NrizaZ7auzg1sOAlot8uFhRUd2VRbYDKeF+mSWLg/Y?=
 =?us-ascii?Q?eerMEiYBZ1GqS4hsUlkxSjyQN6xfiFS+wNnchBxy9TAWOsWbdwB1nKZj6Y+n?=
 =?us-ascii?Q?3bZ26LiHGXh8VUUHwmho3pyQLf2BU0mIbPLjAzgFmWze+XOBegeFWKJRuUIN?=
 =?us-ascii?Q?pRbnM20cCw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 133b2f74-5a4d-45e2-de9c-08de517483bc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 00:50:00.4448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9UZns6468zbXITRjgDmapOU2Q17QNAJE/uzMo4sqlFQJN1VisOSV2I3hWzE6BOhRsjG+70ivaKJuhToWvwPZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7611
X-OriginatorOrg: intel.com

On Sat, Jan 10, 2026 at 10:15:08PM +0000, Al Viro wrote:
> On Sun, Jan 11, 2026 at 05:06:31AM +0800, kernel test robot wrote:
> 
> Folks, could your bot be taught to recognize that kind of situation?

Got it, we will follow up to update the bot logic to ignore further
reports for this pattern.

> It's very clear what's going on - an inline function that gets the
> same warning with this config every time it is called.  Commit in
> question has added several calls of that thing; the origin of warning
> has nothing whatsoever to do with it, and that can be guessed without
> even looking at the source - the quoted diff between the logs is quite
> enough for that.
> 
> Looking at the function in question,
> 
> > sparse warnings: (new ones prefixed by >>)
> >    net/ipv4/datagram.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > --
> >    net/ipv4/raw.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute.h):
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > --
> >    net/ipv4/inet_connection_sock.c:328:36: sparse: sparse: context imbalance in 'inet_csk_find_open_port' - wrong count at exit
> >    net/ipv4/inet_connection_sock.c:605:23: sparse: sparse: context imbalance in 'inet_csk_get_port' - unexpected unlock
> >    net/ipv4/inet_connection_sock.c: note: in included file (through include/net/inet_sock.h, include/net/inet_connection_sock.h):
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> >    net/ipv4/inet_connection_sock.c:1467:9: sparse: sparse: context imbalance in 'inet_csk_complete_hashdance' - unexpected unlock
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > --
> >    net/ipv4/route.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute.h):
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > --
> >    net/ipv4/ip_output.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > --
> >    net/ipv4/af_inet.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > --
> >    net/ipv4/tcp_ipv4.c:3415:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *data @@     got struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@
> >    net/ipv4/tcp_ipv4.c:3415:41: sparse:     expected void const *data
> >    net/ipv4/tcp_ipv4.c:3415:41: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control
> >    net/ipv4/tcp_ipv4.c:3537:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *data @@     got struct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control @@
> >    net/ipv4/tcp_ipv4.c:3537:45: sparse:     expected void const *data
> >    net/ipv4/tcp_ipv4.c:3537:45: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control
> >    net/ipv4/tcp_ipv4.c:3541:50: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@     got struct tcp_congestion_ops * @@
> >    net/ipv4/tcp_ipv4.c:3541:50: sparse:     expected struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control
> >    net/ipv4/tcp_ipv4.c:3541:50: sparse:     got struct tcp_congestion_ops *
> >    net/ipv4/tcp_ipv4.c: note: in included file (through include/net/inet_sock.h, include/net/icmp.h):
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> >    net/ipv4/tcp_ipv4.c:1846:25: sparse: sparse: context imbalance in 'tcp_v4_syn_recv_sock' - unexpected unlock
> >    net/ipv4/tcp_ipv4.c:2139:17: sparse: sparse: context imbalance in 'tcp_add_backlog' - unexpected unlock
> >    net/ipv4/tcp_ipv4.c:2401:21: sparse: sparse: context imbalance in 'tcp_v4_rcv' - different lock contexts for basic block
> >    net/ipv4/tcp_ipv4.c:2612:13: sparse: sparse: context imbalance in 'listening_get_first' - wrong count at exit
> >    net/ipv4/tcp_ipv4.c:2660:29: sparse: sparse: context imbalance in 'listening_get_next' - unexpected unlock
> >    net/ipv4/tcp_ipv4.c:2693:13: sparse: sparse: context imbalance in 'established_get_first' - wrong count at exit
> >    net/ipv4/tcp_ipv4.c:2738:40: sparse: sparse: context imbalance in 'established_get_next' - unexpected unlock
> >    net/ipv4/tcp_ipv4.c:2870:36: sparse: sparse: context imbalance in 'tcp_seq_stop' - unexpected unlock
> >    net/ipv4/tcp_ipv4.c:3091:20: sparse: sparse: context imbalance in 'bpf_iter_tcp_listening_batch' - unexpected unlock
> >    net/ipv4/tcp_ipv4.c:3119:40: sparse: sparse: context imbalance in 'bpf_iter_tcp_established_batch' - unexpected unlock
> >    net/ipv4/tcp_ipv4.c:3416:41: sparse: sparse: dereference of noderef expression
> >    net/ipv4/tcp_ipv4.c:3416:41: sparse: sparse: dereference of noderef expression
> >    net/ipv4/tcp_ipv4.c:3538:45: sparse: sparse: dereference of noderef expression
> >    net/ipv4/tcp_ipv4.c:3538:45: sparse: sparse: dereference of noderef expression
> > --
> >    net/ipv4/ping.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> > --
> >    net/ipv4/udp.c: note: in included file (through include/linux/bpf-cgroup.h):
> > >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
> >    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> >    net/ipv4/udp.c:1668:28: sparse: sparse: context imbalance in 'udp_rmem_release' - unexpected unlock
> >    net/ipv4/udp.c:1700:19: sparse: sparse: context imbalance in 'busylock_acquire' - wrong count at exit
> >    net/ipv4/udp.c:1712:28: sparse: sparse: context imbalance in 'busylock_release' - unexpected unlock
> >    net/ipv4/udp.c:3305:9: sparse: sparse: context imbalance in 'udp_get_first' - wrong count at exit
> >    net/ipv4/udp.c:3322:39: sparse: sparse: context imbalance in 'udp_get_next' - unexpected unlock
> >    net/ipv4/udp.c:3370:31: sparse: sparse: context imbalance in 'udp_seq_stop' - unexpected unlock
> > 
> > vim +2100 include/net/sock.h
> > 
> >   2096	
> >   2097	static inline kuid_t sk_uid(const struct sock *sk)
> >   2098	{
> >   2099		/* Paired with WRITE_ONCE() in sockfs_setattr() */
> > > 2100		return READ_ONCE(sk->sk_uid);
> >   2101	}
> >   2102	
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 
> 
