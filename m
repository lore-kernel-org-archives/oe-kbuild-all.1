Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8281A48BD3D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871362; cv=fail; b=EuttEdNKmQf7+/PTo234tbEeF1CbSORxYUEC5FlROGhD92KD1/6tdvmDCe0Ie/wZmQhPjujDUx/hcRySI4isoMjOuBWPwORBf6tCJImHRRlJRxkEy3AYbZ+x7BCy2VL6TOepOqZ60F6zg4xSI5eah/ZuUjoh0EEilXHRFS7i3lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871362; c=relaxed/simple;
	bh=KGRICMBhwnMVVkt4d5kvUj1Hj7FT6MqiHPsFdNrXbwc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aSLW66+mAddC9P6xlE/ZH7dA3fOzqXZ/taaTab6rIr3NF+0mzS8iSJj+XMsb8Gd86nL3Tjd6kwB2jfYjDzycTyGcqIbloTIAaT3R8W9uhwsIFKRj3lBMISflkLxKnmjzf9BcPCjubDM1G/2vVTs4bIAzg8a3JjMgBNlQOlyRsDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ea0CTTi3; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ea0CTTi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767871360; x=1799407360;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KGRICMBhwnMVVkt4d5kvUj1Hj7FT6MqiHPsFdNrXbwc=;
  b=ea0CTTi3502cTVfFLbhP9pqmam/WFUTr1Zbsh8plwPTWYxZPf22iTFCE
   Uwz8uLyvC1SH2iQDS0KWSlccWxXyYfr6tntq1c5w8TmJ15RDIPxK1VWyg
   0ShWdcr6vquoLlYKGh4otKjB107ArTPI4wc8R0KkXCmg51dafsErEuLB/
   8Ft8e6nkQ6vcTEYuDKzFZyidN/Dc2k8IxWqIe+lpn9Sp8e+KJvwj9ktjG
   THnL8GycbNg69L6prqPZAHPRfpuQysZLHuvnjFwkv+BIdOnrnnVBNlTzi
   Yb4iRZ2SJxwGaDAYjcueXveg1gcv3LR980XmYGjNQsYXXeCCjHFLS2WMi
   Q==;
X-CSE-ConnectionGUID: 6wraMjgLTPGBuHfPawJshw==
X-CSE-MsgGUID: AKA+QpnLRNWFYmCTBH6FeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68441148"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="68441148"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 03:22:37 -0800
X-CSE-ConnectionGUID: OW3d0+i1QDOkZoPcT0T8tw==
X-CSE-MsgGUID: g4vxMGvwRzOcvZBOVIohMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="234345493"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 03:22:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 03:22:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 03:22:36 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 03:22:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzVYlor+g5RZQceAOEBPk7c+orEsjKLjvobmlaDllBApXiy9YxiWMyYp5mEDwaxLhpqO0CW9OFbXxmDhea0yiY+YOkCAhd1RuMVuWKyqjSzRW2VLefo9jtHR7DtKDJtdiNMDwYkgIZ2/hejjbCKbO+7QK5bYYM21fHmu6MjfegwqIqSPeOtMmo22mpG9X23JPqgxQ/s6drrfhNjZbPZoo5mqxgc2wBZ8zCrnjYDyrsVDPvmH4cGKhxFRy3/cJ/LUrM2LTnXdLhIGIs5MvBQ2oDvsd/gN3z23zDWUSg3/2FS0Fsc0WFT1G5KqzGd6HQl1XSUHhDnfq61fksjDWcUvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTkI9KtQnCDRd/ZAzJn7kMKBwYwfYLEnOt58OkWkdcs=;
 b=ogD5vAk1SnhHmsRhklW4ziKdfpiVqndMoldMvRxnd0I51nl/eY5j/p31RAHWXjPju6JriaBC2PhWDMGCOXjqibNCL0RoQaVg8iImiwfEJpvN60nbBQp+KMsu2XltckPmrGbPICe0ELQjFGAJKrBCiE+4ozNlbsBzhV5snRniz7lkn1vBS78KVRlcmbUMv4ERyDZZcgyIqAn30VFZZmKGd1bJWiXc4Tfd4enYtPiItIauacuEktUsMZ1gfgOt+5iS8A/l51DSIxs+iNewbtzwQuWcPQYZZ56e4rFU+uR9zScyIuDs69oh1jt0I7eCeBVspe11YPPf4L3osTu3hp281A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 11:22:34 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 11:22:34 +0000
Date: Thu, 8 Jan 2026 19:22:25 +0800
From: Philip Li <philip.li@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation R_X86_64_32S
 against `.rodata.str1.8' can not be used when making a PIE object; recompile
 with -fPIE
Message-ID: <aV+TcSn3GnmFT667@rli9-mobl>
References: <202601011320.wfOmjyKl-lkp@intel.com>
 <CAMj1kXH8L19zFLnM26JnBKJ5pbqp0-igOn095NTtW8ji0UAbbQ@mail.gmail.com>
 <CAMj1kXF4kfpvzT+-GzLFBNBb=aTN8Km0tumTm2Kw9zbu4iRuVg@mail.gmail.com>
 <aV+HboykUV1ac4Oo@rli9-mobl>
 <CAMj1kXH4NysHuvSyeJtyRENLe-6ua3zij-vMcz0Dyw8o3JVjBw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMj1kXH4NysHuvSyeJtyRENLe-6ua3zij-vMcz0Dyw8o3JVjBw@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CH3PR11MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 4765a4bb-8267-4f2c-2725-08de4ea8382a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9mjXV1fHvgxVMlgnSIycxZ7HIedQBZBppo+dKDxvuQ0JvogOs9wT0fmQ3gao?=
 =?us-ascii?Q?VGc/iBuYCp+ZZOa7tnoociEPPh7oHzLOZwzpD7UTbENSbxuhAqkz/BppQwsW?=
 =?us-ascii?Q?4o2xl1VwHcmctc1Gx0LZQYE4YOSJgSAIQqYJ4SL9ORTb7sFlgftDZc3KxLq2?=
 =?us-ascii?Q?Rx6RfrBcdXxkqTkJeR2zKGfJoNmjMy3I+tog4ZF7A8EOXuTJij4xb4/WHDj3?=
 =?us-ascii?Q?YNdDXBX3ZFgm5zkDXOmRtV3HPwcY9aENOLQmtcK0CRdeoc+JxIfVryVPUL7h?=
 =?us-ascii?Q?y5esOWS3Cuuy82B6t4nY7LcGxuyLy8gcSP/C6IceHKHHZGxwcdp7z++6LKoz?=
 =?us-ascii?Q?gcsdlUqOs0Ssuo9UhsI1C9XJuGTbk3dDhCm1oqirscVSwYNlgluPONnG61gv?=
 =?us-ascii?Q?skeQU+iHFKV/O1m/nZhejAS4aO+hnXmUlQ97sGDIXAy7R90M6DAmsQpSY4U7?=
 =?us-ascii?Q?n2zWcWuQss7mKnNNgfwK7ztGZFB4dl8jWhZhuE0mvMJhOBz+jCNlbbdkLErr?=
 =?us-ascii?Q?TjiJnpFZIULL6ow3r+hnZ/yFrlTCzWrvn9YHRUarpsv7oXSw7Yjv2vapMPzT?=
 =?us-ascii?Q?iFCkYhB1wYA3wwi8t+ZsxCkCqI4PDwl8dK+KlQIfWxp4BPBgm3JzpAGqFJYQ?=
 =?us-ascii?Q?3GlFXfTwX/0OzVFNme42JOsIHudns/MN0DKZ5KOu6UHBFfEHTRQ/QKXy/pTk?=
 =?us-ascii?Q?kO9IDxfYY79SxTkn9yFk2rCm/rXPSu+hR/HHPGzzEeUT2hDCVGwGLf45U1rw?=
 =?us-ascii?Q?dlM+PRE6srDCmKZcuKI5d0JOE06C2fsuageHyBsVjE2jpsKOYdBwh9ygUloq?=
 =?us-ascii?Q?0WMzB7kEY+oVrn39+2stwd13XWoRNHmibZ85sTcRmTI+aOhMB13arWQuVHED?=
 =?us-ascii?Q?qy1h/FCwKWSUZGrcJcfRAqP1PKD5poJ0mDbydicrY0gDF6HDTLSWUnsvtNV3?=
 =?us-ascii?Q?fbHK8wkHVc6Opr7vlzoS6eGL28wQQ0z1tcFF6HVlaM4wgmhE1gr0EXSq0q71?=
 =?us-ascii?Q?PJPrllDk+vf0gN3yHYByHvyoiLa3rEJqIK5+2xZCCcYgrRfZW83tkvsnzvHZ?=
 =?us-ascii?Q?CCpaGtpWTXQ60belb2xm0sLYjIKn2XUavsyo+Dv1pGAtu05qyIZmHZGfjGVV?=
 =?us-ascii?Q?yC+9LB8i0Inw5X9bLgNA3j/gITRkgq3Pu7TevAX5PAyentfDGWuC0n0iQ1fg?=
 =?us-ascii?Q?OsOrdhbUsFlZDhzisaTqYR4XqZuq6k8k8Kl2KDziESqB1gnM6IBi31l4z43A?=
 =?us-ascii?Q?SCQMXd6LbK0QePVMytWCcSUJYWohdyvixTxq8kETD3haJuguLAWnUn0z7WTG?=
 =?us-ascii?Q?ZLwwT9ysC10lY1E0zeyf9QSpg9+GCzeK+bNgYoWQOWwGgWbV/Yf9SWE3slk5?=
 =?us-ascii?Q?2WhQTHBpA+maxN57VlCI+GT1cXM9ADeSiKWqU4wmLNFjLf+90skcneZ0hU9n?=
 =?us-ascii?Q?cUxXGIJjIZ7GzfVLdNncf6sCndPkXUEu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+nzreJ25OdvCd8vLrmSEe0cryL85Szngvy0zp2jtuv7foS5JbyuNE/xGFVL?=
 =?us-ascii?Q?F6tbFA7PHtiKF4+ewpbNqlpwh6S8iYQaU5e3IgsVeXEtNDQmcsnP3JKMMm9z?=
 =?us-ascii?Q?g1a0nDUXUFzogZWqYsIW2KXLbYlNwXnEPk4HoWdlGvKV68QZaAfOyEEWbeaw?=
 =?us-ascii?Q?kmGkCLGQ1DnpJEDgBYp9c64G//fi4BFkpAuZ+D3w78lO4dQqcMhekOgSGdmI?=
 =?us-ascii?Q?oUyDEnQ7V2Dsmv/Moui9ja4Sd9lTeWEvgIpncJ+tqEVmFpKixGNqOV6WcBvq?=
 =?us-ascii?Q?Ms69fDE5bCqFsLrhXJ8YOLVyHJXBMoHndJUiLyW8Dc/kxVD54EbfeRS1LXvw?=
 =?us-ascii?Q?70Fbn9lqQEgyw75ZQ+58LxBFj6r5fxUGb14eegOmzd3wGIIPZxIMCqcn5tXh?=
 =?us-ascii?Q?DIunDdNF7P7bZ+8eoVJvZGrc242acEUeHfdXx/XFts3+nYFOIG04/l+0riCJ?=
 =?us-ascii?Q?i3opUkCw3gyX1Tc3JbuC53OYnmpKvg+Qr6NIfld7k7ojtjLa6NewIlqg1OQF?=
 =?us-ascii?Q?FXePw7w2ut+CCncRADKefAgILEbCF8UIrAletx9QDQdK83H9DF3h819ErgLe?=
 =?us-ascii?Q?BiWlLEWiDIasEKZxE1XKnrG9JbDTMA7LeOVOMwN5RddkFHbjVS8D+1DE67FG?=
 =?us-ascii?Q?QljKtAePH2qCyB2AZ91Za9uyGf6hKdXbwRbRGtL8y1ND8Q52oyuPpDJXh11u?=
 =?us-ascii?Q?oAAXdJ72yJ8Sb/6wZ2/vSoyJU0fSdhhcoFcc3sChd4cwd4FmFDN22su89IqV?=
 =?us-ascii?Q?+pGerg1IE1h+0TPhtdBxzyQVzvfC4K6m2AsDKN3YfpgguuSaHhlhE+E7Nl0H?=
 =?us-ascii?Q?4RYEiINe4vDjuW6My9yRz+4L7iRDav7iABi6JRklsVt5J5QQAzDQgxm6GTsT?=
 =?us-ascii?Q?tbnCbiXrnV59U6vk0i6Y1K82wnKWr2lXAQyzRC822SV3SDiXE4KMcLLwOrOX?=
 =?us-ascii?Q?goBvnKh/MrU4rK/HxJyGMo9q0lDhVUhza60kiK36GIQivAzsN7+8LSuravLD?=
 =?us-ascii?Q?ZTxqow+9mWoz6NQTXMkO+qKuilZFdDh3xPckF9n/T6odmuuA1I1wKyD24nmz?=
 =?us-ascii?Q?7oaQzklFxc9DZMy6hnd5gm3iESpVNKehsB2Q1hYWIgQnN3hhlYZCiug26N8Y?=
 =?us-ascii?Q?h5X8GH2VdHeeNxnEHocHhmLhpfwbhBqK21dBY+cxt2GSJlyN8QMK1xnORBFb?=
 =?us-ascii?Q?YigiFhqk5IM70SBWmN+RGkEg4fS4jHiuYnqren2SBWB5oOIH55q12TNNwfwx?=
 =?us-ascii?Q?Bt0yzE43zCv8IN1isq+2CR/ymESmnkv9Wnape839sXebhoiNc+rwG+F0KeB9?=
 =?us-ascii?Q?1R9k67O2Vd3VjYq5F/WtDwDJecYSmhGwUvTI4dnj+rk1Ejg0Pr7WOmPcC4zG?=
 =?us-ascii?Q?zRq2lnSKUtBH0tQCw1vlPfbw3xlIjcwPBGrN4N/fPBlkNpEJjIRV+mXIs+Lf?=
 =?us-ascii?Q?aC4acuXM5juE1h1N2ocQMFyEDnvPSo2IUepKTOYtd++xW4LcuRvFDOCxV44k?=
 =?us-ascii?Q?Jtc2uhLHDqmQPyJVcvnNwbfVWg+W2eqDeQguUgwlNCBpiplBbHR3fL2s3Ypi?=
 =?us-ascii?Q?niVVLWpQO6r+tJGxXdx4ZM5XkWPCJwemjdwNA2DR0BUK+FqkdVNwcGq1M5kQ?=
 =?us-ascii?Q?M1Ce+C4gGZp9aj/xKdOTq88DoDGqiCCwgRM6FIVsXTKXh/p62qEuQENKpmyu?=
 =?us-ascii?Q?Ggq6heFWPDad6RMBjaEsWjZQSw15E8GPmbDKj/3mNpr64RHc0MjbZs7jp8kU?=
 =?us-ascii?Q?9VC4kZfQ/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4765a4bb-8267-4f2c-2725-08de4ea8382a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 11:22:34.0515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3Iija14AHUcyVnfMAn+OPQyYQf/bxL25mo3mMNN2ZsMjLLy5BiJs1sZbFwidugv2LaZYpc+YuxCQsRSiA8xZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
X-OriginatorOrg: intel.com

On Thu, Jan 08, 2026 at 11:33:54AM +0100, Ard Biesheuvel wrote:
> On Thu, 8 Jan 2026 at 11:31, Philip Li <philip.li@intel.com> wrote:
> >
> > On Thu, Jan 08, 2026 at 11:25:42AM +0100, Ard Biesheuvel wrote:
> > > On Thu, 1 Jan 2026 at 17:03, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > This does not reproduce. Where are the build artifacts?
> > > >
> > >
> > > I kindly ask again: where can I see the build artifacts that produced
> > > this error?
> >
> > Sorry for not responding in time, we just start the investigation. So far,
> > it found the internal build has set below extra flags for x86_64, which probably
> > leads to this issue.
> >
> >         KBUILD_CFLAGS_KERNEL=" -falign-functions=64"  KBUILD_CFLAGS_MODULE=" -DMODULE -falign-functions=64"
> >
> 
> Why would you pass additional C flags and not mention this in the reports?

I will correct the reproduce script to reflect the additional flags, otherwise the
build failure can't be reproduced consistently.

> 
> 
> > But we haven't got further root cause.
> >
> 
> Thanks, standing by for further updates.
