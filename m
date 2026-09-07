Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2A648F85E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783025; cv=fail; b=hXvuRLXPPONhs1dR+Ov8RIaV8OfwFjmm04J96utD3md6UFnPis7ruTJoiOUN5NPpUztk/KugvBgyN0nZG0CXnEIpyFAd6sBd1dauzzQEJqnDYzgmVc3BOYIgZeRzDMdaN4n2FA4FoffG9Oh/Q5ntjoX7RgU5goai0MdK/JplUnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783025; c=relaxed/simple;
	bh=efEK/fAmBJo0crgar0qKipBB1cRl67HDL/lsuSniVCA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fYEw7+GLo4cf2+nkn0+gsZlxhwzqGH8DQS+gWMTa+Er20YtRl/Nswwxp5URwi8kG+TAEEwYA8HijwCn3hhp7EEUSEC3ptAU6/oDO8bYWAu1QSPvwNhCbJ06BqwdZlys35QdhcAc/gg2Mje+qRNx5QZ3V32fXKXLOgUmH0pzxGcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D09vnOFr; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D09vnOFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788783025; x=1820319025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efEK/fAmBJo0crgar0qKipBB1cRl67HDL/lsuSniVCA=;
  b=D09vnOFrV/d5ghkxNQEvJXPc+uYBUndptxrAPO+6K6B1usfHswpJTM6v
   2lBfW08+AHRfupGcZwEwHAwrwr8iUoLKFBMNHnih/C2gpQZNXaF02mrQK
   Na6xEDaFDojPjcfCqjIjE7MNg6J3MEtSbfJCY8X2XKuIKFcj+rVPO8k4I
   VsLbFQb3mS0CAluFtoCW4YN08pBffiFmSS1MkxdHpYY0Q6yQtbL+w/gN3
   EOXwYPa/GXhtP5s8We1Fd+ft0nej6oq5hNe6reEOOPL9yiEVaCmT5McBW
   SSeMDQCCyaQrIXZQg3oGIcqXeKB1xuXwL4Og+sMeiBhd38g6pdTe99gR+
   Q==;
X-CSE-ConnectionGUID: vAGgdErJThWx8hhJgRIb/g==
X-CSE-MsgGUID: 4OOZ5rXYR4KBqUdCYufMVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89392949"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89392949"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:10:24 -0700
X-CSE-ConnectionGUID: hHWiAvKtSj61Xybc+tSG1Q==
X-CSE-MsgGUID: Gh3Fhf4HTJ68PScitP/Hww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="275975040"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:10:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:10:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 05:10:22 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kx6BocXiY40tShBYz7b+9FmfQCBUUCfu/ccXQDoQwK4elXdlv9qMsGLocFlBMRN852rAc864FKbtDh9iKF2KR5UH1QtFv6jE0GYWarLOhpgqkIXsN6x90iJzDgurDOBpSEE+yAtMZRTHcVXIahgcOOt3/nHqI7QBNX5cMQ5IjplWTb/Vi7iR6Y5hutaXC+VXB0NunGVzadIg4bhG0RFxdsDSySqTg9FOybTk1OvVeDmUoj3TniEZe0/ecRrt49jotm8zJxMYJyxIdBIYcbc8jFMlK0xi1qyRrYT6JY47QZ2ggppTeONG1Ks6Z+os9dXRk3b/6nt1KBvIb8EmIHBMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrloR1g3l8SM6aoAV8jZxs2YaSumkTeteVHtp837xJY=;
 b=a5k4r/njnNk6HHkk70ELbZggkDWlzn/tZjA3hQESDo7IzlVPIgF0vLmpwsqoYl6tMtBDLQDn3XV+6FIPaFUCE12EGwJE+1Qc/p9TKeVkjry8btKMix0GIBWPOOYu0HO2jVjyF/ozWrWpcQh91V0o3rtlXfcvIcDY6BppxytGq5mriht4/cJb5zS9fUOgFxOWxxgfWDL0pW9A7tevGf1/2ggCu2P6RgM7ot5ala9zLbP5bSEcTnez2D6ou9ndAs/5jRZiHdsg4JYUiR+HGjcO7QqAhn9lM2btuMclL6q88HH3hFMFGbpe7RDohKOY2Zz+b4GK2tp1g6JqYZesRTZpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by CO1PR11MB5043.namprd11.prod.outlook.com
 (2603:10b6:303:96::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:10:20 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:10:20 +0000
Date: Mon, 7 Sep 2026 20:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Maguire <alan.maguire@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: kernel/bpf/btf.c:8758:(.text+0x184bc): dangerous relocation:
 unsupported relocation
Message-ID: <ap6ppWpoUohiMvgZ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::17) To PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|CO1PR11MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: d58477ce-0100-42d9-096c-08df0cd8fca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: v2cG4co87sBt6uqfw7okLkR3lWUc542IjqaCTReFFXyPIc+CJbJXQ/xz8iGF0fqsijTgO9sHxUi1/3tnUSfxv1ilJcklWo2L8/XQjOvCllAzlpx85NF129g6rWZnr/WBgye9RNBblrBr8FJ/lDUZqIcEDNbgJ8Lrulad05YqZmh6WyLSgKBqB7+E5KkSZJ5v1dour+tZ5trmNJb10rd2fIGJawqoJSuFbhfRno32he0+k+zgBvdoqo740Bm8lWQPaw3uAjMr4Qy0AK53FWf1ZFR4NL8JpF5M82UjPsWvXZ6/SUBh3Dg7m3PgdvrxnnPo16wzebmMrlI+xKTe3+VJ1/P3Chewo7koYIPDNipLFjyIa5eaFmkzJHzWXAHLBY7QTLkWfCqge4YXFnKXrkAzyMPN5+tUKcIiBdX15QCRQIm/d/Samx04aRo5qwLy1UqhMx+noonAHxCoAWu6u1BIDIIsZX8gzFUCPAz/yj2bDJXx9cDsnrVXmH9JTMRunRdPrposICok2+SVMOTzUI3VarlxBq4tzfoT6XgpKfWn2y+78/BNbMxrL2OMINv1Cz/66sxKMPrrnh15g0s732sQNq6v2M1ndCLax+ou2wiC7fO2xg3SVYW3uo0OeTtLRzqF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yEVYprfCIay7yltLue2XhhJv5iQhIyEhK4j5y1Hi+S3HAJrgxuJahkAvyeIz?=
 =?us-ascii?Q?7O7btG3Onl1/YbkD9oFKNHhMoBhh5ImaJb2+GU31w8AGoqy8SCiJYKy5DpBx?=
 =?us-ascii?Q?zn7kinlSJQX7vSYAuooP75K2cLuUTFfv2KUnTudKRCy0FGs25NiqaSb7H9Eb?=
 =?us-ascii?Q?V7okLeQprS5dBxhcCJIshfIb0KY7A+UWdQRYCej7YA7zNSLPjX3SjlkrCa0o?=
 =?us-ascii?Q?v3jeaNOhJD5adjEQMyx7R1czz6pUNcuMRK9nItxT63Uksrszpt3bfrFVQt24?=
 =?us-ascii?Q?7LAW2FmlH2/UUPFdiOTEIbNSk/k6ElYjB3mib43UF4vHjYnlxdB9/pCfmpV5?=
 =?us-ascii?Q?+NcD2yQsCWBPuQRwC/9/zfjJUm0bX5tNVbbP4d1eFOf7TEdS1n2XhKaDt7T+?=
 =?us-ascii?Q?IFaPLNcBDa5FyyZcJt6Sr6wm5RD/nZhXwpxDf4lnKeBUmd0KPaoCTiXR9t0C?=
 =?us-ascii?Q?x0oPfedIDs6obaOur3AH2hXWrxA4DZWvuM+7us/wnOkd8e2cmPYwxprGNapR?=
 =?us-ascii?Q?g6kf2siTfHnjPbmXyWorKN0xz5+xUhU/w6er3L8YVZFYb0OyrUefzl/G5KXq?=
 =?us-ascii?Q?/2j9e72EN61RJ5G4z7jesYXcdOzngCY0zLtXdS1USC62Cw06fpmGnlXk68f7?=
 =?us-ascii?Q?BgKxjRmayH4metY5Bt7RSRawkCvxevWpy356Lc4qwsdukry/tbQOLasL/6iE?=
 =?us-ascii?Q?uk7ruRi2ati4z+6nTRkZcA+SjSpQ0EV8Q9G0M42nrKxFa9ihAefyFFdpz8Cq?=
 =?us-ascii?Q?qBkHFXHYiiFCnXlFbzc3WuxC59gpeJOzIq4nMivJM27ELzVptZn52y8YruaL?=
 =?us-ascii?Q?t9CRQ1hmywQuRgd/dynkfUmWIb1j0BPzETRzuWlY0xxToSCGPJjEeWdkPZcw?=
 =?us-ascii?Q?vsOrdj8xt/XoEcf1nifm2yz9L+R2KrpzwmHXClAc/d1geDCZtAq27bngrdgh?=
 =?us-ascii?Q?9+m0Z0S3LAxVkjz+zGM00PAOYHw8mvlL2X05dSQgtOzSFyjvLNs5DiOlsZ0V?=
 =?us-ascii?Q?+kbVLc9C4FcNP1youut9lrQI8WV/Yi7qAikKeTJDGn2Hs5YtQ89WDY18FpE/?=
 =?us-ascii?Q?0k66mopqJyoHSTMoYtdoVsYaDFdOt9B/jvjVq+g74UB2PSmqjbtVgKyrfIPy?=
 =?us-ascii?Q?fOBhjEFE1Xku2CFU0I3Ur1eh4eeIeXgO3fnuCFpMf1RQqdnUfHcOkFVaWoCT?=
 =?us-ascii?Q?CfSt+NBL4p7AE9GOmznyuj/AJMxRT6wyW5LyGJ3iUGuH+x1oOfV7dot/cE2y?=
 =?us-ascii?Q?n5UWHiYMFlxnY9QGbirg+d1SWs76xoNry+M3g+3FdHdJUenSSL7DD8PBVCRy?=
 =?us-ascii?Q?AisxswmloqYUmCTOL2ZIIzABMAyYr62ibhPQRclHN0/fc1yoZGVps/hbleXM?=
 =?us-ascii?Q?K0KjnC4WQ1K4S8xl6MHJfsqCxqrEJcxGsdTwm1kGNkH37kHFNmEcbqFzcsdl?=
 =?us-ascii?Q?HAZYXhmmOBMBqyIDcOeon5wCywOnyWUxeETn+jAyTnYqRcf5rbNsSAD/DFwr?=
 =?us-ascii?Q?gY3Nane2P2UmVdstRBq+PgCFiEOCeMQvfD8XVVXb3ARL0sZarHD0d7g7bA8F?=
 =?us-ascii?Q?JxmiLw1FgDDPB6zXT2I7v7ABmomMwEZSlChXBNMyXTaRvNjFADUreE4/KxE6?=
 =?us-ascii?Q?kOKQ4d29MVYOmuTKiftMALvxzLAcUBd71VAIBHcvmokdQ3YE03fzsT/qAJcV?=
 =?us-ascii?Q?bZQdtcQ5bby3nufHxVd5h3Vwa+oZGZZbnQEvzP6Ui4cEd13JkzdVmm3+lY6H?=
 =?us-ascii?Q?ZbKzQ/LMoA=3D=3D?=
X-Exchange-RoutingPolicyChecked: zozdaxJldKaXnogJfbYBOjIp17Mvhl7gP1lor7PE7exEMC+fNELeggyVQV2Pu3wUq5DIP/V4jCMopZ6VFQ+DrGIglhPwvdaow/x5IxvXbUpbIyapEb2iZOhipRD0YQkTrmiT5wNsq0Q1+aAYDmdh3zjGxV8AP07BouP0ZqMG/ou4092o/a1xDemaQkL8RpvtlHLfGK5LFdU7xjTzXqxYTE0VIC809NxgBjXWdea/k1xkuJdwvQB5hncZAH2F+knr8xd1BWj9nChgdW4BwPBDoq3OgYnORuZzcYHXnuI0+VoK6xmvnndE52oDCQh8gxLAXEluLsLRAbA5JzSk1GF79g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d58477ce-0100-42d9-096c-08df0cd8fca1
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 12:10:20.3239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ajv1jG4mdCnX9/+F5tEXfbuF9L+GnHbQNZUjofTPbHU7MmotlKvlRwYQfyMWjjgWt5+M8467a3bBKQs22ro4sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Alan-Maguire/btf-Extend-UAPI-to-support-BTF-location-inline-site-info/20260901-175740
head:   9e05e3a3098276adea1e7277934c60598cde310e
commit: ef28548058e47e9c824316fe339f88dfd00c35aa btf: Make vmlinux, module inline info available in /sys/kernel/btf
date:   6 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260907/202609071137.v1e0SkZx-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071137.v1e0SkZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609071137.v1e0SkZx-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-gnu-ld: kernel/bpf/btf.o: in function `sysfs_btf_add':
   kernel/bpf/btf.c:8758:(.text+0x184bc): undefined reference to `btf_kobj'
   aarch64-linux-gnu-ld: kernel/bpf/btf.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `btf_kobj' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> kernel/bpf/btf.c:8758:(.text+0x184bc): dangerous relocation: unsupported relocation
>> aarch64-linux-gnu-ld: kernel/bpf/btf.c:8758:(.text+0x184c4): undefined reference to `btf_kobj'


vim +8758 kernel/bpf/btf.c

18688de203b47e5 Kumar Kartikeya Dwivedi 2022-01-14  8737  
ef28548058e47e9 Alan Maguire            2026-09-01  8738  #if IS_ENABLED(CONFIG_SYSFS)
ef28548058e47e9 Alan Maguire            2026-09-01  8739  struct bin_attribute *sysfs_btf_add(const char *name, void *data, size_t data_size)
ef28548058e47e9 Alan Maguire            2026-09-01  8740  {
ef28548058e47e9 Alan Maguire            2026-09-01  8741  	struct bin_attribute *attr;
ef28548058e47e9 Alan Maguire            2026-09-01  8742  	int err;
ef28548058e47e9 Alan Maguire            2026-09-01  8743  
ef28548058e47e9 Alan Maguire            2026-09-01  8744  	attr = kzalloc_obj(*attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8745  	if (!attr)
ef28548058e47e9 Alan Maguire            2026-09-01  8746  		return ERR_PTR(-ENOMEM);
ef28548058e47e9 Alan Maguire            2026-09-01  8747  
ef28548058e47e9 Alan Maguire            2026-09-01  8748  	sysfs_bin_attr_init(attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8749  	attr->attr.mode = 0444;
ef28548058e47e9 Alan Maguire            2026-09-01  8750  	attr->size = data_size;
ef28548058e47e9 Alan Maguire            2026-09-01  8751  	attr->private = data;
ef28548058e47e9 Alan Maguire            2026-09-01  8752  	attr->read = sysfs_bin_attr_simple_read;
ef28548058e47e9 Alan Maguire            2026-09-01  8753  	attr->attr.name = kstrdup(name, GFP_KERNEL);
ef28548058e47e9 Alan Maguire            2026-09-01  8754  	if (!attr->attr.name) {
ef28548058e47e9 Alan Maguire            2026-09-01  8755  		err = -ENOMEM;
ef28548058e47e9 Alan Maguire            2026-09-01  8756  		goto err_free;
ef28548058e47e9 Alan Maguire            2026-09-01  8757  	}
ef28548058e47e9 Alan Maguire            2026-09-01 @8758  	err = sysfs_create_bin_file(btf_kobj, attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8759  	if (err) {
ef28548058e47e9 Alan Maguire            2026-09-01  8760  		pr_warn("failed to register [%s] BTF in sysfs: %d\n", name, err);
ef28548058e47e9 Alan Maguire            2026-09-01  8761  		goto err_free;
ef28548058e47e9 Alan Maguire            2026-09-01  8762  	}
ef28548058e47e9 Alan Maguire            2026-09-01  8763  	return attr;
ef28548058e47e9 Alan Maguire            2026-09-01  8764  
ef28548058e47e9 Alan Maguire            2026-09-01  8765  err_free:
ef28548058e47e9 Alan Maguire            2026-09-01  8766  	kfree(attr->attr.name);
ef28548058e47e9 Alan Maguire            2026-09-01  8767  	kfree(attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8768  	return ERR_PTR(err);
ef28548058e47e9 Alan Maguire            2026-09-01  8769  }
ef28548058e47e9 Alan Maguire            2026-09-01  8770  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

