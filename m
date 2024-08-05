Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C345613C9B3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 03:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722828044; cv=fail; b=FH4yUnYkk1MzExZ+Ea4QL8nfw4tHXZBQAizVeBJVR9nVtOdvXigFvNyTz7GJipH9p0Xu7kWkWlPXDhrcYiPUHlCqzmPYxRGYD51da5IpVc2mIx5tV1quxopbbjm5id5nc10TuvkoOa5MjsNfd9kwmYJSTG+/UheIqy0qDhmPO3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722828044; c=relaxed/simple;
	bh=MdvEAUcLozsnjX+6/A16CIqiWM9r5jM9a2o7Un0qG6c=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R0Hwi5MuLpaQ5f9BLzRpF3klo6G+jkp5PfCy+/MTxJorkbJd+5VLR7gApeALFh5ID7o5HTzte1BJffERsGMavW0/YE1ftnfAyJ/vnvgYhnGqGsCjwg31kk5DbkGw2if/zTbtuNt8j1QeI9mW7ZIOTX1Ic5w9S8LtQq0WTmK9dK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMUmTEMN; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMUmTEMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722828043; x=1754364043;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MdvEAUcLozsnjX+6/A16CIqiWM9r5jM9a2o7Un0qG6c=;
  b=ZMUmTEMNULPPYTECcdoeIzCazUSuJnmvboDChfP9YfbSHuHCaNE+flJP
   q8bc2LKlV4IgWPK/RY1hHtUDhsZY6bFugGysX7m6Vg3Q97Z5ARLvki4VX
   NJJBBPVO51ndS4x63Z5U6A9gz7Y46s5TQM17+rbSq6Ol6/I8JWYSCcL3V
   JWb6FFCC0u1NyNeGwx7QLx4Df5SSMrvGPkfldr895ejMbJ5Af2rtq9ilh
   BDV6D4yNaW9KIsbu0Bu2un0+b9L60OvXxceqoxG87qwqtAxY4WBkut3ly
   v3jegISdfJg1nkeDWnx5gSZ87p07wf5B0lOmcjcNbluDeJAqyh2p4WwD8
   w==;
X-CSE-ConnectionGUID: jFgCYQaARcq6XQRv61gVLw==
X-CSE-MsgGUID: 2JsNxfakQ4O95Flr+cQF2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20584806"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="20584806"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 20:20:43 -0700
X-CSE-ConnectionGUID: wKX0tVrxTXW/EkzJTFlm7w==
X-CSE-MsgGUID: Ys1X/Yz2RNKAN5AmBg4b4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="60998310"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Aug 2024 20:20:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 20:20:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 20:20:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 20:20:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 20:20:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJbQJctlTow72w4T9SHixChTipr4298QIGjcRuvr9ah9iX7jfeVRrnAVqyiPqiOoaDoYIPnpY18kK+D1rSsQpFu/xx4Qgf78dqYoHyj3W3ysHKv3HPOfDuFahbuKFFsxAXctakU4Js9tXa9776K3/s2khcPaJAh9DoU3bqWbZH5hbPoUUg73ChSm98IUWYdgbRu0D5jvh7Bcng3yyKZOX9SECdxkQtWHImCrJ/Pi51EZ4fFmTM07nHaGGWx1Qd/+H0otZj6RKdJ8ikS8ct+mpxrXiKqZ38t5aUdsgYZCG9JTVuvtNmKP/KuLtcP2KtqEnjWZYVf83nXGRnQfbSzyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRa0+A0AX2ClZS/o3JRozvhyCwhzwKGWwJ1MNnmy7bo=;
 b=WDaWCJYrfNhuZAV2JdOOQ2UWJUjvOMWrXcIHLUDpccvYvpj9UtH0Zt2b0fa9/WNRLv/RRjQ3i9ae0fgU7sZ7Z9Iq0ln8WhVNd4FYE5P/CPY65Q7AcXbe0GCEmXKFwqR94gvqf3x1hcoF2s4kdHM/muYRdk8OA7YUNqRL/3Cxp3oTHrjmGH/v6CNCOWwa8h9Vfh9Qvcng8tJ2nVVw4ZlU5BnRDGqmvLskq8eSc5U+fPy7vmRFR1JTDMyP4zAa8GfZtgcQvOBf4Ij5cg95+MeHqVS/RW9/JEMAr6+fqhPvQF7du58dYt4/KQlCALpGCcwFNMOWlPfGnxZ2rguaKmSErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 03:20:36 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 03:20:35 +0000
Date: Mon, 5 Aug 2024 11:20:23 +0800
From: Philip Li <philip.li@intel.com>
To: Alex Shi <seakeel@gmail.com>
CC: kernel test robot <lkp@intel.com>, <alexs@kernel.org>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [alexshi:ptdesc 14/17]
 arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible
 pointer types passing 'struct ptdesc *' to parameter of type 'struct ptdesc
 *'
Message-ID: <ZrBE91C/Zm1OsQfW@rli9-mobl>
References: <202408031130.UnwgnuLS-lkp@intel.com>
 <feeba873-32f4-4677-8eb4-743af24d50f2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <feeba873-32f4-4677-8eb4-743af24d50f2@gmail.com>
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CY5PR11MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd97ae4-c6e5-4635-4049-08dcb4fd91f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AIQqscwxyCrMH4u8WVJ78XY3qDLoKLQPDFL/uCjOnSiTiLaNvgV31ZTl1kcs?=
 =?us-ascii?Q?MI10dYN3SoYUOaGjPfz1UxnmtIOkItGFCRwWiK7aWz7b7DKxQkur2Z8Mr3nB?=
 =?us-ascii?Q?xaUm5Jxy4Trk923LJ24wZGjSVnWCtHVjTZoebBdag37cec1CDr8FK3xUJmjC?=
 =?us-ascii?Q?Eoq4EgPc5HNg6ukTYCyIXODeoiVnzrjiusGZhISlPTTr6RCLcl1dwbcasCRz?=
 =?us-ascii?Q?Pa60yN/9gSnJ0QWCpOqQtFQ/FaKRsR50C0WPH9tOVNnEq2ASidhjuTZ1fEZg?=
 =?us-ascii?Q?BOcsZXOCfdjO29GhSxQ6R/B6FAoVj2evQaCAQ1/FCffITqHrYJuSgtK+qj/Q?=
 =?us-ascii?Q?2b7wTBDry9f1KDz/qM1zVKwvkvJufsqWRrT+aRSCpu7vw2vqfBGEcpCmx5Td?=
 =?us-ascii?Q?uuskwQVU5ab1Zu28LmwvsVumNhSNzOemzz/Xx8mWDs4akrakgcL3PFVg+oYH?=
 =?us-ascii?Q?voFF576hpUwp9fz8J+oKxE99Isi4M5yEBBNAkMSrca470ch9pe32hIAKrGNb?=
 =?us-ascii?Q?0/HAeKdnCRfz0Bfbj2Rf3qqani/WM2KElI4DOJrOLQKMbh/SPd6P2AvRyfj+?=
 =?us-ascii?Q?eGSFclCPeKTSROWUSc73bWs5eawVjXLWgFdMLS3FeFllqBkj0DBb5jnpmI0W?=
 =?us-ascii?Q?hX4ePl21YP/XpEHnhFfknPqHPCFWDu9EJI+axSFZ47Mz2/CnzoEeeiexmVno?=
 =?us-ascii?Q?t/0kyU8MB57+s3Lyf+bwKEtjFYkzYPEU4aeJyD6qOME++dbKXI5vn2duD3mt?=
 =?us-ascii?Q?7EeIgzTEDcyyw9vdDwRujTUhgA00eUPuPXE7ndvO6FrFzq7RRw9VKZjpvlxN?=
 =?us-ascii?Q?1Vl0uADGdxoNrF7N86lPSJ7Kige4YTiI/Mq08v6ZdFT/kiZb4gPZe74F5ZxC?=
 =?us-ascii?Q?Cv3tlFbf8tbjCCIaUYcw9Wr7OL1L+8sWiRlZ0HXF7K8yVHgv7/4mXWSpNS7w?=
 =?us-ascii?Q?aPJ2pyQp18AWy7cVOszsUrtO43z9e7L6t2Wvp6kKwqxQpLNICNninMl33+Fo?=
 =?us-ascii?Q?qvmBRJivW/uGd25mL5C8pnjisEWxHuyVWDfHRHYIu/5KQQY5gj2MwGjGYALU?=
 =?us-ascii?Q?gnFRBOrAnrCVTseU9k970VO3G+DU5vX+KorCXIPtVrhdyr8FTcL21f/9tJze?=
 =?us-ascii?Q?Xht5nOtszZTRMjMQMqNYcoYM1pZ1C5rd5KtCpSS+xqp2pMjZEMg8okEs1ox2?=
 =?us-ascii?Q?gvITviF181WGzkhQpXJF7v15tDcLh4jt+6OdvRB5ZPw7asg3/WyXqWSjfPOE?=
 =?us-ascii?Q?T61YgXEqjDY98OOtja8l4vMEEj07TkFBCXu2oWWkA8dQZznSJ0xbU5mYKR80?=
 =?us-ascii?Q?GvqIITuJ43Kv0lj3Cc4WvE4/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T+6zBU+p4lKKOnSV1hBVY9FjB+YVwrUEa7DWpfnCT2ekx1ot8/WU/AljGwCR?=
 =?us-ascii?Q?HtpEdQxAcNMNvLk5aoeAt1xqTNEvAzMT37Uxs+u7krinVdMX2kqArECZ/s64?=
 =?us-ascii?Q?XMbJTWcoGilRrurFAcP4GGA98DO4m2MAN5Crco64iJP4QJOVB5Ne4eGWfJ8K?=
 =?us-ascii?Q?fFcNm+WVDykD8Cs69IGTlE6phVqG4lWKXBTosPhq4OkPUKPxIaXaUVzE4/pH?=
 =?us-ascii?Q?z2yDUCcxmNMURWR7oEkTv+ykbbVDzrbDKon8YVs9EtbC8TtEYCSjEoCTRG8I?=
 =?us-ascii?Q?OD3XDOMAFLkr13Pe6vA704FJio6BIcWfESk+KcmttmFNVtR5m4WVt/WHuQm9?=
 =?us-ascii?Q?y/81DRUHWc4AwVzXxem2bQY7H/DwROEANB9ql3pPfD3aVZ9xPBwWUBCQ/2Gg?=
 =?us-ascii?Q?XZcT1Cv4qs7Le5YtWIJUaYEeaaswvc6JXh+/z5FBWIm0pSjdr/E2xVOTxLiH?=
 =?us-ascii?Q?uOrUOLcrh7fGx3ho/juLoo2bUPlFP7S1wAyb41JXE6emTGHUrY37oOgR0qSj?=
 =?us-ascii?Q?RVwWb5+YTNKPqkf6IHIjxMsCy5mArEs7y5eH9gOZDKl5ZHBRHhe3K97Q/hEM?=
 =?us-ascii?Q?OL5y3Tzhw+OxQ/9hKzMgV43eZDZGge+YikXSya5nhNtOfdw4LzL0qvTOhirK?=
 =?us-ascii?Q?I5uiE8HNDWws64/9Z4z8zUGK9Eb2V2eit0KbtpgnrrQ7WLvGdQIRa5pmiF5t?=
 =?us-ascii?Q?4J0TMgGUyMQ4XmwnJqObgL/nIopkOQi0OuciJJq0Sgy5k423V4cDV0bQHTGv?=
 =?us-ascii?Q?rx8bztZrCDB4RCBVkS0v9EQ6mtckqHRjF5xDC93sqKM11V6izYYVYoiujgO9?=
 =?us-ascii?Q?WEmQvsrcSVho1CCEOiLd/Sifs59kcobX92GBHTqVTuzqGlMf2pkqQl/Z+oU8?=
 =?us-ascii?Q?ouvqHLljJPZK3Vur/4eYvI3MnaWAdQBg5yd/dOtyG0836dQ7+ja7hSqTXJy0?=
 =?us-ascii?Q?o2HZh69sYuePqFY7549xQXto0CxKJ5ltM9bMOBkQPR2jfBfe+d/Jf2QnKFE2?=
 =?us-ascii?Q?LcFE1vFixUBPJDsw3PN1ZKqc+9qdvFTVbVcYafnjZvAMhAHK+yG5n8kXoCbd?=
 =?us-ascii?Q?Esbd3257SnOVUBbzXmow1iwzpAy421fxwS0pk5FcEePsYRpv9bC5rHAo3o/e?=
 =?us-ascii?Q?OwPqobSZSfhypFUDNe0LhIZP8PMQKkjP5zaYyXNqvKSKExi5I/h3iffORUVW?=
 =?us-ascii?Q?1GMnIcFSFItIkJeqFds8sixUVcTouHwgQnXrfJCG3hHk0EGxsR57DmU7szPI?=
 =?us-ascii?Q?y2780HgC/yLSRrdHWwEQny4AVkhnGGYk+vO6sv88k7qh34gRLYpZm/Yk8Ay5?=
 =?us-ascii?Q?aUckiHKZ39/WuWleEyMUH3MMpWpr2+tOfmEj1VRBQ2tNDhVWqcefe0QC7y7w?=
 =?us-ascii?Q?iD3Cu58o/AglRpClJoWZ3K9C7Y0EBaeac8oU+QYo+673VDiKt4Meu1yxx2P2?=
 =?us-ascii?Q?pmZYcYjG3HWVjSSScgWPCZIGmmHmuqnofSTez5i3tBPilQxvkCw6+d4aj5oK?=
 =?us-ascii?Q?OJItZeZrvbjvMVpnXMPj1iYUR2uH/aFZYeRU1cVToOMBAWyPt9IWY9gnyF20?=
 =?us-ascii?Q?1ujLk1ovyES2+35D+bE5/Y7P5OIC+In8CfGVAukF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd97ae4-c6e5-4635-4049-08dcb4fd91f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 03:20:35.1005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr+KJCywQ6mM8kUp0aaCjPLYk1xDVbdPfI59n14F6VsDT5ugrVBJd7uX71zOHC632CA78D5YDCibLuDVdtvMvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
X-OriginatorOrg: intel.com

On Mon, Aug 05, 2024 at 11:04:48AM +0800, Alex Shi wrote:
> 
> 
> On 8/3/24 11:26 AM, kernel test robot wrote:
> > tree:   https://github.com/alexshi/linux.git ptdesc
> > head:   3735e634f8feb67c941d17222b53906ace2fd2b8
> > commit: 8ac2ea5f299444d065b292043aed0a1e94996159 [14/17] mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
> > config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/config)
> > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/reproduce)
> 
> >    In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:
> >>> arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]
> 
> Hi guys,
> 
> I still don't understand this problem. what's the meaning of 'struct ptdesc *' incompatible with 'struct ptdesc *'?

Hi Alex, there's one warning before this error, not sure whether it helps.

   arch/powerpc/include/asm/book3s/64/hash-64k.h:277:18: warning: declaration of 'struct ptdesc' will not be visible outside of this function [-Wvisibility]
     277 |                                              struct ptdesc *ptdesc)

If this can't provide any help, you may add llvm@lists.linux.dev list to consult for
this error.

> 
> Thanks
> Alex
> 
