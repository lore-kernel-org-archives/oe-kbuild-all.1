Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420F350A39
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 13:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732547; cv=fail; b=VjDlplbtZ0yeaopRwqY+VuMB+hnYQpjPTx2LA47mMOFQsvrJxpBmM1GYOgb0VFWRUvUbtf9bJv1f2pXxDGWcfUr+Dll2U03aayAwnrqVcnc+yBsX0tTMJRbjYgzCl6C9wDp38Nu2L08kyU6fQjrz11mrj4Fv1P+Gn/TNJcLmomc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732547; c=relaxed/simple;
	bh=vJamR0oOPzkgsWkVzvKeAgrvjNkxdagWdIkCazfbQ0Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q/pjCVxDyVVhDsRnGPewte55Q20bRjDc9vHvCI8VyVpgTRTm8XvGTA1sdgjTPFGHe5ioXWVsDMaOxtgtNW/XDKRgy+CrKJFhMcxd0spy4PgH39upZcXmaHxvxc3BP8P8OmDukNp/y6HZITr67YJaIiZY+vaPuvSq2wV+0miESJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+2BwWAs; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+2BwWAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763732546; x=1795268546;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vJamR0oOPzkgsWkVzvKeAgrvjNkxdagWdIkCazfbQ0Y=;
  b=e+2BwWAspu2PbyMDGtyCKmfOYqA46yaTpgAzUe3i6uvOti6TC+PBtvUe
   W6+4Z+NzKptTrakyT5IZXvKrI6aaigHdY+MpDiH3r2j9mX8GdovVMOjSU
   Mko0YkQqENXAcDn2ri8Q4droQjUaPnSWTHiUoJRvDLqGSjynOeTyQ8rWz
   Vk6bmWYjXitIcnG8YoNPCjEd4e8PSbLCnnG2Hk0yq03kHYimo+E97o6Cm
   FN/oGMW4LdSNDiA3o6kUGjUSYcKISGGltto9w/gEBy+U2F8scwNqAg7Xn
   rcdC3QNLByh2L5JfyW3qVrGszGZ4WfPIC3wHaLBBhgV5CRV6b7CfYwY+M
   g==;
X-CSE-ConnectionGUID: 4VemwWWoTaGYBtr1yk95Tg==
X-CSE-MsgGUID: KTDJ45omQ+mIUdDbVkd95g==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="83216018"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="83216018"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 05:42:26 -0800
X-CSE-ConnectionGUID: uK+elxR0TVCldw2FvUI76Q==
X-CSE-MsgGUID: 8c2mZPHqTiaRXusQmB8YZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="196157451"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 05:42:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 05:42:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 05:42:24 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 05:42:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sibwW58SKTwpwd/krgk0xYzMIUTxCh9W2UAVuNOjDUt2BCl9+N9KjZsWkJLR+wSog40wnAcUUqVLDCGs7MKGdhfkr832GeYn8sD0MWPFeibvdrOdBiqQUR5R9MvvdNdim4dsrmJt9D3YMqb+XBOzvfI6w5QC4ykG2Pvm5fWnFVFTgbEy5Hyh/1RN0VJoIdlUnrK6qsqrWpNuExiQOyPDxMk+5jV8pnBw48r+IgnvAw91JHRt5fLlj+GkwDcrmyZbUvcQ6qORC2TCZSbU3yhnpTcili++8dbRYS928kQ/6ICvQ7R3/JOn9y5cz7HdNAycCWbFadBJy90tMEm+Oq+S4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/UtUoCfA+GJxYxJt4XK8trXLHLOxVtLPCLMhF+mGms=;
 b=clZh7ZMrpkMXduyrgkNmdkX5TAvEjdfck2lY3wgyw5+p/q2XCNeM2jEkNfayNtNxC9lm4oiX6vY6FzP9+CRwNdvM0Rzjf8MGwuOYlQXYTNyvwzQsReBifl8CRNS342r9HuroU+17oSU9v3DZm5hP++0eUVdyhzZIJaqfa8GtZHNQNMeBC+5c4kVDXmcHpDcvQcDHDOxhwjLOUH3FsEMksmNGf2Hzc+p/1OWCGpjhczoOb70A193EyFVig0qapQVDhSELbYrZm3SFs3Ua0htVXeoJuUF8kM2vHssYwD82/gBf+UKgMXXFfroseiyVlpGwMOK8c5whRpshMj3LJV4zCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by MW4PR11MB6667.namprd11.prod.outlook.com (2603:10b6:303:1ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 13:42:22 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::fc95:158a:24ce:885b]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::fc95:158a:24ce:885b%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 13:42:22 +0000
Date: Fri, 21 Nov 2025 21:42:15 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: David Disseldorp <ddiss@suse.de>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<oliver.sang@intel.com>
Subject: Re: [RFC PATCH 2/3] scripts: headers_install: filter ignored configs
 via sed
Message-ID: <aSBsN4WcGYqf8wsO@xsang-OptiPlex-9020>
References: <20251111132021.22809-3-ddiss@suse.de>
 <202511141203.lxo6340i-lkp@intel.com>
 <20251117122306.1db6c625.ddiss@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251117122306.1db6c625.ddiss@suse.de>
X-ClientProxiedBy: KU2P306CA0066.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:39::17) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|MW4PR11MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 09eebf55-4d42-47eb-3d79-08de2903cc17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/ylPgrgsEu+mJenaQllJ6gCVwIK3N4eSyC8MjejzeZjh2T5FDhF6rknridUd?=
 =?us-ascii?Q?aSwKr7PDDeT/n6I6b9oikp9LK3YaQr1EwfqYfhONKaesIJzsMyzwItQo7+nk?=
 =?us-ascii?Q?SAvBfZbB/E7GCdM4R/FxqwTtNkuxi7e/M4DKv8VhD2j0b6/P9qUCsuwCfrN4?=
 =?us-ascii?Q?ICrsOb2QsVPVbQpZ5yJcW5iS/5rDrYx67pmEqDDxWoGuxeUbttL9f/JBmKF2?=
 =?us-ascii?Q?AJuSKv9HtJr4FoxMForgUrFwCptD/oAZ+Jj9w6d4qfB5i/Sjs7T+l8gJVkvA?=
 =?us-ascii?Q?83Lc0j+IF5ugT697Id7aVp9AqAMZB40yZbkz1xugbNpYTgQxiPajr5x1eK8D?=
 =?us-ascii?Q?2zALAj4SDL5/uycBb4ru+Srg6cg2iwS6ivao3SwDBKH8x/AknA9LgJvdDrvl?=
 =?us-ascii?Q?yjqcOf9qP/cBrv8Kvh5H6+0KjRIMizEQpTnwP2sCAuyMdcT6YcID0A8/wcwq?=
 =?us-ascii?Q?fwOOCkKDIOdBgOvWkjVza12hn92ICBJav/nB52AghSjGp1At1mvDLYGrmRLQ?=
 =?us-ascii?Q?rMwre/rlS8At/eUSiGefHvi0NwRTYBgMroo7Na/+pb+93QOM8UxmRzC32w9y?=
 =?us-ascii?Q?/EC+m0/HrEJB3CHlINJ+oluZkSTFTn2UwbN9mhBL/b81fDoRnZmI0fZUDSsj?=
 =?us-ascii?Q?ed2ZHqmtcUQEUShq4cIalCEPVbYsnSfWopFnRBZzf+CrWrm6IikMZW7pXB03?=
 =?us-ascii?Q?FIv9eFNaRC4PjOzkdJqgDWoRiKw5qNTB0oTjDPS3boVhMBrDZaiRTtmrh36D?=
 =?us-ascii?Q?Pjpyr9vwrQzKDZJJ5Qszl3QO770nYi+O/oBdeTEgpp7+vIXQX51qIDZHOq2s?=
 =?us-ascii?Q?u1L3MfPnp2T1X/kNF0leGzFofRLoo4fNtSQD5HU/BBqtwUfffSg2AgZ88keB?=
 =?us-ascii?Q?RudZ/arQzgLsxcuYsuAEQ8A1Bl9Jw2nLhpjCp80nvk82eonD5PIsMkDL+Wbq?=
 =?us-ascii?Q?Kto5HxJX6GbVyqT5lhGHoDZV1HBBXUv9iR9NCRS8CESvuCMwrphQKH3M3EQj?=
 =?us-ascii?Q?l1DcVnM5siz+BRR+MF1ugOjM14Blf5VourghrtC2GB2CgfI9xb9b4De4FaPN?=
 =?us-ascii?Q?cBenubD2ZjXuuTJKcin4DXL8P3qH1B6N/1Vwe1C5N1hwkr56H6q2n1AzLyeB?=
 =?us-ascii?Q?NpaYLeaCrN29+vnbStGv7XaIml0m23Dajp6bo8WpDC4BcKqRamECIimgHQfM?=
 =?us-ascii?Q?FkLBaxLEgBsxLBGyYjj/j6ulfWvFA21o/SoVbSRAWVy9uFvPxjc7OPmnVAnI?=
 =?us-ascii?Q?PhT3Ic8nSITAck7Lk7xvynD2tJPdT5mVY0d0xsU4FYUh0LG/tQXZYKR0Pf9S?=
 =?us-ascii?Q?i8z63TItaJMq84qX7cv77bA2oeGUcdaJBD6Me1z6YrjFyXyHrjnPn5z82Y6l?=
 =?us-ascii?Q?iRYNs178rznVzje29PA7ZobkolqfN08eyUR6ta/9w4Vu0yBs+8pVmQp275pZ?=
 =?us-ascii?Q?UkBjaAh7rj0ZKrJKgHtsA9NVu1JMdN9I5yi2oWo2A57xw1ZUzS5VFA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gKqStUHn9KJJzHAOyqqBvM7CTGS2m9b3t6CrvD709g+CWcmjRnEwmf1XkWsl?=
 =?us-ascii?Q?6nTp3w848+/AIGyHk9HmYa4fBj1Equ9v8Dk5rRmW/BQiEYXmH7fnh+hrF4cg?=
 =?us-ascii?Q?6y4Mg+O8TwAlnp74c9UYZgLfl+O47UQHL3lyRcFetYpWZcreKncPYuWeznlX?=
 =?us-ascii?Q?fo+aK+1Olz7NW5W5zF92A1dmUAvj/g553puSN26FlVBfESGJ7JV7PnXAQZdo?=
 =?us-ascii?Q?bPWIVAOji9pTdYj3msh71UzzBSbEenONlyzA47BNXKkFHHvc2icJevEwMYxb?=
 =?us-ascii?Q?6ZU2A3m4oWsVQmE3QguPcbU9lbdCvq9KtbFlrNcQE7R3xgqcaDADA9NmrE23?=
 =?us-ascii?Q?Io7qbs6zhpahNCQXXMxaLEMJt8Qry09CokO14NS7fZyWrkD4+xvg42Mfrvp6?=
 =?us-ascii?Q?44s8KyCdZ3MUfzbMXfraseTNuZmr14xvUrMy/aAnNkPKrJaYX1wy/ARvdyPj?=
 =?us-ascii?Q?Sl3TvTiW9CTkyWdUB7MOWAlJeS0tywlEhzJ2fZwqRSBtMsv6JKX3GYkmiRvk?=
 =?us-ascii?Q?IXvqQPqsRwL2oLPYs+4t43NlEi17LgiuyDnhtXm3SAiOvxHhFiEpFVJyQVni?=
 =?us-ascii?Q?NwAFh09GFkWvT51n8jkBdR8DkNAc/JvNRKYL3NomjrnK+70hj3iaS9JmlCnS?=
 =?us-ascii?Q?eJjaBvw+WQ6HG+qGrZsdjLGqcE5ws/FAiH3psTOwarDip0koHJP06px0GolQ?=
 =?us-ascii?Q?Qws4vyh9pCoPvwcG0uGQLkWflXS1UI0JxiRpz9wP005Jcj/kdHDIzC9dJqKw?=
 =?us-ascii?Q?L9i68C4dunxMZwafi2wROBaTnOT0Pu5h8rGO4s4KmD1GbusH8B+BRBuN7iLR?=
 =?us-ascii?Q?mG6sUY6bn3Tx1v3zc1QDhNzToP/ViLNSwGxf2/Kp+9YXeJYtTkhl5z6/rLjt?=
 =?us-ascii?Q?UbJxHV5ok0r3zWPIzvZj3gSKohFvwYBXLtl0iEN2tjtQqQCbcYUaj/bon9u8?=
 =?us-ascii?Q?rhFgcQSh+OgpwyRjbcLTzkWOXSO7y1d8Mg+FYPKm5jAbtxlBuAjWUczTY2Jx?=
 =?us-ascii?Q?Ag2jORBCY41x0Cozzrxiyh3SYX8PEZtdp1WLHbJ8WoS2PHQk6ZIBQY5Scbw7?=
 =?us-ascii?Q?1SoTlXizwTfd3asLrYKdmFLlX4NMIRKaPHnIlqmI10VyJ6PBu51v9u397TNx?=
 =?us-ascii?Q?vyOe98/+ZrebMvTtu6yPEGE86DIOCwtjUFrb20hb5RA6QOFmfKxpKGOaQSaX?=
 =?us-ascii?Q?iCG2/aOWwM0UzmirO+C/slQ83oVYtmvSv09HZnGs9hA6Ukg/JV/XgZZtMLB1?=
 =?us-ascii?Q?GKePeqgQw4bLEHDqPBrYNgO3P3J7p0PaRd+/yvMocpZiEnpqnP2Gv6RI29c7?=
 =?us-ascii?Q?lLlAX2Oi1bew/J1Bt6WfziqYCgcfHYLvSlghBmHgVhSpjZpoilU/NfroJNIC?=
 =?us-ascii?Q?ufAKwa8xesuNBfVMs6g+SVatz5CDx8GEI1FvjSSXZ47Q0aAEl6OaGBlu5l6y?=
 =?us-ascii?Q?fRIUAtFBrBuU8uKN776wXQlNC54Oo8Gp3f1dQgTDzI0sCfCTmBc/WFaw7X2b?=
 =?us-ascii?Q?8Zb+JO0ImYl244PGKcA5qDXEFlQW4Se+jOqjj2ttGps5G4Sb+vjhuAQooEy3?=
 =?us-ascii?Q?BUsxwaMkVMO3dY0NsY5CNb2Dyaa2Tx6Oca0EgAraTizBUCKOqcVb9+YCxzPB?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09eebf55-4d42-47eb-3d79-08de2903cc17
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:42:22.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epG78S+JHxbisOUbozNVrv+FdOl3N4qq6h8oABRGXLVmxVBLKrpb5jGtcc+kNuqN7WhVsl6Hpa+2jFGBCwN/OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6667
X-OriginatorOrg: intel.com

hi, David Disseldorp,

On Mon, Nov 17, 2025 at 12:23:05PM +1100, David Disseldorp wrote:
> On Fri, 14 Nov 2025 14:47:35 +0800, kernel test robot wrote:
> ...
> > >> error: arch/arc/include/uapi/asm/swab.h leak CONFIG_ARC_HAS_SWAPE to user-space  
> 
> Thanks for the report. I'm unfortunately unable to reproduce this. Can
> you provide version details for the shell and sed versions on the test
> system? I didn't find them in the links above.

this issue can be reproduced by below shell/sed version

xsang@xsang-OptiPlex-9020:~/kernel-upstream/linux$ bash --version
GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)

xsang@xsang-OptiPlex-9020:~/kernel-upstream/linux$ sed --version
sed (GNU sed) 4.8

> 
> Also, the shell "set -x" output for the failing headers_install.sh
> invocation would be helpful.
> E.g.
>   bash -x ./scripts/headers_install.sh \
>     arch/arc/include/uapi/asm/swab.h /tmp/debug_swab.h

I make below change

diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 029d85bb0b23..9f33733e35d5 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -57,7 +57,7 @@ $(if $(new-dirs), $(shell mkdir -p $(new-dirs)))

 # Rules
 quiet_cmd_install = HDRINST $@
-      cmd_install = $(CONFIG_SHELL) $(srctree)/scripts/headers_install.sh $< $@
+      cmd_install = $(CONFIG_SHELL) -x $(srctree)/scripts/headers_install.sh $< $@

 $(src-headers): $(dst)/%.h: $(src)/%.h $(srctree)/scripts/headers_install.sh FORCE
        $(call if_changed,install)


then see below output by following the reproducer [1]

xsang@xsang-OptiPlex-9020:~/kernel-upstream/linux$ COMPILER_INSTALL_PATH=/home/xsang/cross-compiler/ COMPILER=gcc-8.5.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arc prepare
Compiler will be installed in /home/xsang/cross-compiler/
PATH=/home/xsang/.local/bin:/home/xsang/bin:/home/xsang/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/xsang/.local/bin
make --keep-going CONFIG_OF_ALL_DTBS=y CONFIG_DTC=y CROSS_COMPILE=/home/xsang/cross-compiler//gcc-8.5.0-nolibc/arc-linux/bin/arc-linux- --jobs=72 KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 O=build_dir ARCH=arc prepare
make[1]: Entering directory '/home/xsang/kernel-upstream/linux/build_dir'
  GEN     Makefile
  HDRINST usr/include/asm/swab.h
+ [ 2 -ne 2 ]
+ INFILE=../arch/arc/include/uapi/asm/swab.h
+ OUTFILE=usr/include/asm/swab.h
+ TMPFILE=usr/include/asm/swab.h.tmp
+ trap rm -f $OUTFILE $TMPFILE EXIT
+ sed -n -e /SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/!p} ../arch/arc/include/uapi/asm/swab.h
+ [ -n  ]
+ sed -E -e
        s/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g
        s/__attribute_const__([[:space:]]|$)/\1/g
        s@^#include <linux/compiler.h>@@
        s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
        s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
        s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
 ../arch/arc/include/uapi/asm/swab.h
+ config_leak_ignores=
arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64

+ echo
arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64

+ sed -ne s@../arch/arc/include/uapi/asm/swab.h:\(.*\)@\ts:^\1\\n::@p
+ sed_filter_ignores=
+ scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ usr/include/asm/swab.h.tmp
+ [ 0 -gt 1 ]
+ sed -e
:comment
        s:/\*[^*][^*]*:/*:
        s:/\*\*\**\([^/]\):/*\1:
        t comment
        s:/\*\*/: :
        t comment
        /\/\*/! b check
        N
        b comment
:print

        t check
        s@^\(.*\)\n.*@error: ../arch/arc/include/uapi/asm/swab.h leak \1 to user-space@
        P
        Q2
:check
        s:^\(CONFIG_[[:alnum:]_]*\):\1\n:
        t print
        s:^[[:alnum:]_][[:alnum:]_]*::
        s:^[^[:alnum:]_][^[:alnum:]_]*::
        t check
        d
 usr/include/asm/swab.h
error: ../arch/arc/include/uapi/asm/swab.h leak CONFIG_ARC_HAS_SWAPE to user-space
+ exit 1
+ rm -f usr/include/asm/swab.h usr/include/asm/swab.h.tmp
make[3]: *** [../scripts/Makefile.headersinst:63: usr/include/asm/swab.h] Error 1
make[3]: Target '__headers' not remade because of errors.
make[2]: *** [/home/xsang/kernel-upstream/linux/Makefile:1379: headers] Error 2
  CALL    ../scripts/checksyscalls.sh
make[2]: Target 'prepare' not remade because of errors.
make[1]: *** [/home/xsang/kernel-upstream/linux/Makefile:248: __sub-make] Error 2
make[1]: Target 'prepare' not remade because of errors.
make[1]: Leaving directory '/home/xsang/kernel-upstream/linux/build_dir'
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'prepare' not remade because of errors.

[1]
https://download.01.org/0day-ci/archive/20251114/202511141203.lxo6340i-lkp@intel.com/reproduce
