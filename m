Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA041C6C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 04:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713326889; cv=fail; b=YtLw3XWARHJj3mJq4bvuK/GmgoispGSd+4gZM1xMG9ye5MMAHQtpRITRq/kRBGMpOK/ZRPZUcAAAKdmuqirXccs5KQbYmDGIreQfgpG5ID+u/agKbf0c6Se3i8yGngzwTTLl1C2/iKicMdKPmwtQJHaf+JJXmkGHYeVka2zHu54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713326889; c=relaxed/simple;
	bh=1F0xxDUwStaYqNLBeLTSvNcFVrEuy+19EBkhfQz1RzQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=TIaCoJcq77nC3BDI+puTteXHa6Id/OM47QYlm9x20jjr2I43a/WSwahVxafRf/Y+eWrAiSQfPmmHGZNv6uTrYerFmi+Vgvnu6kgbMBZMtHMERrdSst/T3/Tcyx1cohelyabdq+Lw+WRND7NsZMP7p5PCsx9pb87FpxvRiMZbKsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OV8Hv+Qr; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OV8Hv+Qr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713326888; x=1744862888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1F0xxDUwStaYqNLBeLTSvNcFVrEuy+19EBkhfQz1RzQ=;
  b=OV8Hv+QrKAdjZ7lG2fa7XtIuTcC9GAFRLUXA70Y9KcvDVgU94zS3TOX1
   TSIUuIllwwWHQx20BEYqnsGiCvACRhQbOF6ORBbqQHuip4d3i1e7477fk
   doXi85MMIV4mZvNT2ASHCAXv+Pe4TCKfzwkeIEf8RRSuOohUPcM+POG3L
   ewFbhBkEj3L+AFpenVVm70RF7vN/uPI1HGdXwra010dEi+yRuX6ZaLexY
   3KDmkCUlJMpEyA7+jya5EfPcjDfyXsveZms45/Fue4CySUZT9EUUMqmSR
   oGFOr38AX4XuPH6xP8v+6dUGJbhWFdc14ZTZ1QC5pGm/4Qjj9DITyuKQa
   A==;
X-CSE-ConnectionGUID: SRdxcrWWTp603B9/29PaVw==
X-CSE-MsgGUID: YciWXXMxTW6KJ3kS62P6yQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20221849"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="20221849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 21:08:06 -0700
X-CSE-ConnectionGUID: OQs0aD7eRIiBD6WmY+E8Ww==
X-CSE-MsgGUID: mb3cZ7v5TuSLPfOpvzUoHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="26927960"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Apr 2024 21:08:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 21:08:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 21:08:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 21:08:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 21:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AT0o5EKGI89JvEfGd8/7BhTE3Su3qpw0ssYsJbffbFgDocep4GUe+kRt3/vASYc14/vMbt8gMOUWr8AZE1SHQiSAhZPZ8bPpiqB4X6d/JIpj2UnCNlo9/yGTvldcWVrTq/N8nSysZX9iFbeKC480BUy7Udzq0Kf8tlMXrq1sFq19PkRgJ8h7okZdq9jmdIEnOayjpQpoJpP/4tuxWSUBKQV9RNtpNGVX23EXHWkIPgcQiWTn29K4hOyPjg2rF9xkXP3kv4hluJV40dy6zK7QlfResQCWSrthGGDgOAY9UyMNIm74uDM8gIJfBxI+cFYukhRpYa6FKusc+SqY6ia8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tn4RYNElM7ZomLxCSysDu/367AU3NmpORd6ynDsCA04=;
 b=KnrlM4jrZDyOFYBU8OsZq9YWdHKtY7Hpfwxky+rScWkkWIT8jhHUgdB4O88aQhKtEbGzcj9slM8X9ZygLxzgD6NhuOd8a2kTdRlX9tXYJZ/3FUq8TPTGXx2KN+5PRDx5DWz10VBSEmTTxbvgJ7XEH7CQOJhhobowpKjwM8N7SHgJI7+5plhDpzkMTAii/s+wC5caqGP7+7xfSYwwC7vUkC3Ym7q5B4gm03L01NAq0B8tFgJVfUAtgyLHOiaGBeHJzwsVHXdFlpFwKIQ1wMOAIxDXA6OV3KTUvTRwUSOj09+pTqeOLS/CmbHUSL+0M8P9bCJu5uLdqtJ2qSHkbODHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 17 Apr
 2024 04:07:51 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 04:07:51 +0000
Date: Wed, 17 Apr 2024 12:01:15 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
CC: <oe-kbuild-all@lists.linux.dev>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Long Li <longli@microsoft.com>
Subject: [char-misc:char-misc-next 11/26] vmbus_bufring.c:172:37: warning:
 taking address of packed member of 'struct vmbus_bufring' may result in an
 unaligned pointer value
Message-ID: <202404121913.GhtSoKbW-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 15979c19-cf98-458b-a93f-08dc5e93f2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MPd5Q7mgMekwWA1cd0yIoecn2kopTgik2S/NsRHyXdp4gRF2SFfDqlnBKO8lC3epxxGQcH6f/Iy8I4txf6bTKRw1CFoXJo0n+t0Hjy1D/mCh4lLbtAfCgjkt9ULeB8XtMmpxt7050PgJI1mkg6/CQiqXZmiDf5VsWeTd0eSyNpQolY1duMpLvl+PkFGT1I/P137fLEX8egxKQG4aoMRCz22BE6xP1Lb6bzwfRV4tt3Onsg0ZWQ1lOu28rn/1E9+R+n+CMJh7VR1/CtLDl7korxwhNbskDLu1CMRLZHij8Zt0u8sy+5GsURnRxOv9G1pbRXODwfnhEHYb+v2OO905vqpV4nq4MuvTCyG9ezFvPgjj131hj2004bC9dEhbzpkbDzibOMbBz/mqqq1i2c0Mi+o1Nlurq6Fj8ilVqjpeScMysSVBpsngd+gaOLiVu0z7U7Ep8PHCPRroj2v7p2oFBlVwm6UIG8rqLKqt4HXS5BPqhVs7WtrHiiI9MqW70xarUfR+mYE2VG5RkqbQYK8CCP6vQX5v+vU13p/xxA8sDW+15RzBBHQH3YxrvMMC+wt3TFGwDCDJ2wgOPHEIbKoNqV3LwPUbpvlSD6PKmlGPbWAwnfkanUTYA838/gXPt9hua6/a+48eKuIh6TwCqpvQFd7WSFiwFKdQjwW09q/sKi0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ansqC/v61MAHj+sWoMjC8yn4O04jxWh9LJxpKtqVtyRB6Z9rTNTXiDFU3GM4?=
 =?us-ascii?Q?noSp/gd4dLSu3Hf2d/Wrv99TEQc/uqOc6BLl/QxhqJCxK6xlaE/0WvgMX2a+?=
 =?us-ascii?Q?JTAnYy5TfoxRji9VPazKCNshjW+8pmzup0LaIJNGsmN9dOSRzwO1ZUYrvfCe?=
 =?us-ascii?Q?MxEO4OWO76oBn6kKtPAk65T1XM3Z6L00bBuaVuVA6qIQZlFFtZeMoXaVVfzf?=
 =?us-ascii?Q?Sz38rUNyM5hoEWALYuro2911BerZ5sRn+3euic3f+EVN68evojuFXs+6V/uJ?=
 =?us-ascii?Q?ABHL9YIAfiuvZP5JRYXe+mDf2dU8IZ7e0WxUTD218cPoBZej1QNH8sGqZb/C?=
 =?us-ascii?Q?ppRerJftC12NUKVSWUn48iTkCZ/X9IMWKGPaZ2nOoQL7HDbYrsmsmR26nciR?=
 =?us-ascii?Q?+GdTGysnTjA6kwZgmdFNOmDUYqSIbiVxfnGz+EWUVWnaAFRJiZuJXF7IBWYO?=
 =?us-ascii?Q?Xrkny99ltbKovyN4m5Y4VKZLPk08FyBTFmVOrRKKiSXTPp0vuUoNuULGGbjJ?=
 =?us-ascii?Q?s885zKpirRMHDHMIT8iBCpUENE6AH3ABSReuEEJz+lVTxZAJwX/YdjJQCvo0?=
 =?us-ascii?Q?ntY4plHLAr5rGChhWyRsrAUMtHmLLCK+0DxgipGJN0mLSWQL2C/48vXnaUrA?=
 =?us-ascii?Q?6DnN2ql8cEiwMLlWLzJM3+yNYB5d5X1tqnmBlPeEBHIl6Sd6zUp58UUriW12?=
 =?us-ascii?Q?oTdGfex3c9d8094Dx3zRndcfZkeDLnjJcK1mN2umiQUw4xBbLqAGzaqTrnTl?=
 =?us-ascii?Q?dre69HjIiF6HXy3gelawLHMt7qmHZdAFiwgzg8cqburUQPYMGv8NGP6PcEsO?=
 =?us-ascii?Q?QQ5tQFTGJSwx4q7AuRy2sNTwC9b4nCgsCIH+GD2PWPzyQrDzJVNg0yEvQ5W3?=
 =?us-ascii?Q?aBX5wMrQb5pU+1wwFGLXiaJIMomRwXooQ5cP/b2vStpQAVGYXaIWpysXEujv?=
 =?us-ascii?Q?M6KuU+FK8dktZpo2z9miDMjeXrsKs17fDhfybnMSxlWUEqQXG98zn54m+sLo?=
 =?us-ascii?Q?A0YW8NmMXaW5cWh7pnsEemfZ2CnIMir7uujgW9TvXN1DHgsK+A0h93vh8iTc?=
 =?us-ascii?Q?h3R2WB13xHzrDDpqaj+nAQiEgqsYiy8ucct+HixOMyU5BteHxl38WM8jVon3?=
 =?us-ascii?Q?Q/P0LwxbUsJ2PNyPdzR7FlGNqU5bwVsiG0K8JzUJLjUxGKK5KFzjZMr9z/2r?=
 =?us-ascii?Q?Zyr7GGiZnFJ2Eaqk0W5IWtEmZqLhkpJi/iS+NwgVxaT4Aa6S29iEbOoi1wS4?=
 =?us-ascii?Q?PF+UjQUFOi6KW2iAcVz/EtIUeAbMfj2OZgozFRTQkxD2QZtO3bXk5sBqOIOU?=
 =?us-ascii?Q?AV0JI99fYnh+4IPm0KoWpxoElLi95N4lG9WpTmr4JcOliqc9OCOCzZv7Ud73?=
 =?us-ascii?Q?WZhmQ4VqhsR8kPcCBCYWk0lKpCR87GqHfI/q5inPI6KUbXVytZ6JtopKidb6?=
 =?us-ascii?Q?tyUSSanueevDTj2CpqOXSWMqlphzm1UX6Oftua1s6XQ2v3RL46lyrtpAOteZ?=
 =?us-ascii?Q?8Mo1YIogWnMqJfwj+y41cGLE5ti6kR7OENNLLjW88oafVvwOdhP1HN1rg6/g?=
 =?us-ascii?Q?F2T/r9zclrAtWbdWxCpwWGKaLDWM49jvtGZEVFgF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15979c19-cf98-458b-a93f-08dc5e93f2f0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 04:07:50.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBb83nOvb8oKGlsOTaJ2gy8+WeOtuJra7e6wgsRTZV/rreVRrdrlWg3oUvgK+V7FnmK9qirrom0eoHSl6y95kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
head:   dc806bd48abc1b8a4ae72709a37e65db42a32048
commit: 82b0945ce2c2d636d5e893ad50210875c929f257 [11/26] tools: hv: Add new fcopy application based on uio driver
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404121913.GhtSoKbW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmbus_bufring.c: In function 'vmbus_txbr_write':
>> vmbus_bufring.c:172:37: warning: taking address of packed member of 'struct vmbus_bufring' may result in an unaligned pointer value [-Waddress-of-packed-member]
     172 |         while (!rte_atomic32_cmpset(&vbr->windex, old_windex, next_windex))
         |                                     ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

