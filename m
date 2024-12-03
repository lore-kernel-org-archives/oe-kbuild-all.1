Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848051EE024
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233813; cv=fail; b=BmYzZwHKe6ZvMca12fBWk1/TNe2YA2EJl6feh1u6nf2IW7mACzUzvy5w8mgDlUwi5dirD2NFxSX6LsE3zlrMl8B4512GKwA0x4H9QbR1FW/pFVlDBSK4JJBw8pVFaPPLcqO9ZaAWbn5YZc5wFfH5jjW+lfJDMoxI6+SXln8xevw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233813; c=relaxed/simple;
	bh=XYDcso7Ksljfi8Bk2Q1VCDfBKUnQKT/8BWM7vJjNLUE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=C+8TmqyzLahYcU58YKx7zDSIUKU+tjKZc/cPftkLNEVLFQ0JVNFm4jtcUjOntjpDY79BnGeaPEiMqmtUwRUWuLA56o+UQOvbTmQVUOyDX8vzxC6MT67USczQx0O7lsdkh6/h+8IOnj4vpBkO0zK+ZoQpsdeRRir2VwBa1wpZypE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwk18WbH; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwk18WbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733233812; x=1764769812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYDcso7Ksljfi8Bk2Q1VCDfBKUnQKT/8BWM7vJjNLUE=;
  b=kwk18WbHf121DDfrIx2brMov9jctzbTNFlW2u2WJ+RZuqP2Hy5FmeNo9
   27Nej5E2xUem+cN1Z4n86mohUtvMhKmb0CDBvRd/nDO4hY+BhGTb6bJly
   GWcFVUeHviGmsWu679fdmI+C1260jZ8kBUpGdGaoGaxdZG++CHObAYP+W
   hBzm8+Clb2iVyCZzq9x4sybbcqT9MmN959n96S7EzbGbBovVj9f0d4WCD
   ZhM5ga2Bm5oeHMDAMqpO5Ysp234vCHycQCFGvOyS4HJMd6LmIj0+uyrqe
   eOQ018qGlK2tLWxWnwJQkpu9K77m8LNMq4zjvIv+Ub2QveyM9jT4P5OTb
   Q==;
X-CSE-ConnectionGUID: cGUtzOQLRGS56pJbA8O1tQ==
X-CSE-MsgGUID: mIotPh8dTg6NSs+axFya8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44835457"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="44835457"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 05:50:11 -0800
X-CSE-ConnectionGUID: 5egjiT7RSr2Tnvmg6FkS1Q==
X-CSE-MsgGUID: I1n3U7ghRK2o6xPu9E6hEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93900031"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 05:50:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 05:50:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 05:50:10 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 05:50:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOySajPN89QecaHWNQtWqfdj4Q8p3jbSMU1Sdpwau287bOzCs/U8ubZHDq6X8Zu8Ri1aiPtU+raKzuU8P5RMGNyWjw7waAZXbsrynBLr6zlj/xp+/Y6OWgXnLib4nee679wJRju9imi6Z8el8dsdLOmePiQfqA4AxwpcAGE5uPOiAwm4DMD5q95eLFFb6rPuh1/b5anT/jHXan5wkwu90alDmTnayOBnESIduoedk4ESa8zajh0ddhI3fyPk8DMhDYnsEGTOfWgvdj/c8AQQO3co4XTmzO7Ol3myHOBaKKyQoDw/uxQK9weoaf1kUH6Q/0G7mgCFAviUlcrVgzK1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Sja4BehpKEM86BPn+z3wfGjZAnjWthriOVOdJxoRf8=;
 b=fwFogWVLT5xZEU1W+bSu14wILTyzeatVqyoZ37yBYLBXtHs8tWilPFTMosB9w7nauIsWJU7X1Iu94quZ2vLo0GYjVEYUuvPnLtUeLZCekkmkEeIW+waUF9ubm3A3Kb5VOh+xhSxQDISio83wxx639N3YYDpMZMBOUv5IlwKNidmV7svjVxb+w+RBSM4s3WPfEIn2ftxC8L0VRoj7+9eISyY2i1FpXdA4zOt6E1nnsnfn8oztBI8/9wdgzoArA5nyF9GSAc44Bigvugrs4xNOVLe2vN81QZ0oCKYG5UTO9SkwqM1SEjfGkg0nEeF4u7RynHqtBS5HgrpXe79Pz4AMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SN7PR11MB7668.namprd11.prod.outlook.com (2603:10b6:806:341::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 13:50:07 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 13:50:07 +0000
Date: Tue, 3 Dec 2024 21:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:uaccess-hardening-2 2/5] arch/x86/coco/sev/core.c:475:25:
 sparse: sparse: duplicate [noderef]
Message-ID: <Z08Mh3B6cj6nhnKk@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SN7PR11MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: f94b02d1-c92b-4dba-ae64-08dd13a16550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Q79P2bMd9NV1TW1Gajvh0shP2uObHwwREfq72K/74PmpW3jLSay0n4FKDST?=
 =?us-ascii?Q?T6iVf/+VOdBQrJp4RV/q/tz0GZJ+DpyfNEh7Ru8HtE6L56nkG3CVCnC2IJFn?=
 =?us-ascii?Q?c+SW+Kfy2K8yEa3GFfZoIPIZslYs0r/mLEtd7bNHOwm8XFwXbUWrQnWjmpoR?=
 =?us-ascii?Q?ekBdj588ZrAroMbHBEpuvQrwLBe5MI+239P1J5/zYPh+R2zfEQE7wc7QdWQE?=
 =?us-ascii?Q?WHQHj/qloKQY0byHVbXUReB1/SWEyI1RDh+MiIW6jEg/67Z1E1KWrajOgHyd?=
 =?us-ascii?Q?oaRwLhEumoH0+ErOItLQTwiZn0UlrWfSwvfXifsiKQY9C4R+WXNW2a7bw23w?=
 =?us-ascii?Q?c6m4Mm5OGP5UV8K9JUQzSm6QMdCEOM3q9xg35IqpCmXlw7RBD6jPl4XVk6sP?=
 =?us-ascii?Q?OpLv0k2fv5KnQA3gLQjJbQHgTT49N4NcgcQ9j5X+a8LqACPyTUhxQif3W/pZ?=
 =?us-ascii?Q?f6WD1aOzcb704FcpNbfZ91lN2AKDnnLO6wC7c/YvWg61wLNkg/ZBKvjwNlZB?=
 =?us-ascii?Q?BXu9Pc2/aLCXjYD1TJORS9oOAjSsx/u9C2iSt6tVZbxju9wsvmK3dy+GT53L?=
 =?us-ascii?Q?m1gpZCycm5I8z2SOtC651WcOHImKPjIxbS/BNc/ftAbtZ2BwZDTgSa8Z8B/d?=
 =?us-ascii?Q?QsTA5Jvzzv3RHiQdPOeDodQUpeHMa9vV/2H/3dbPnJgnvyQcGc0Hj0503bUZ?=
 =?us-ascii?Q?NW7WSFVI9+VM7aWcrXANITvByMcJmdsPazKMJdziE8gezNkF8nDuBRZMAZiw?=
 =?us-ascii?Q?PQlpeHFMkaPZRQEo39HzMYBU4dBjsUeghC7viBrpYXMcUMohH5CQ6U3OE5pI?=
 =?us-ascii?Q?oCQqv0Ud6kBB/ewhKtckAFvI65xcfo7zpjOmZLy0hWAu3RtIjiryqgKHA7N1?=
 =?us-ascii?Q?VobdVbhmf2vQ2pu+GkJayLbwjyEcYNj+Ifk4ChX+1oH7hljSa5RALey7fL7p?=
 =?us-ascii?Q?1fxLN15RyXcWcb5hlx+AulsDixH1gXOBfMbxMrLOlNqV+7pdTexQvXwBqBp/?=
 =?us-ascii?Q?1dx3mJBHaPwzZeulwK01XW6RO2fNYpO9I38/ycwugKY+AMmaxhk/uKBQN3uJ?=
 =?us-ascii?Q?iPC4ON4tXmVoS3/ZCBozBnvfMgrnncdCJXo/+ZJo8xFPpZZNUBgw30cNV0n/?=
 =?us-ascii?Q?MHaVqNmmjUFg0J3eYrRKIhn8pIdRGB9DHK7tGeh0VK2RyypVFCshoQ4lKyGz?=
 =?us-ascii?Q?A76nINpQzu5qyylqXLBFBcJFYV2VwdYo9rros5lVs73fqqW6IcwaOmD6z59W?=
 =?us-ascii?Q?xwugYlAoujs73pWZQUsn2vV3WLIPotjzrtfKsaMn0ZT0yLBO+6y+XHsR+PyD?=
 =?us-ascii?Q?qDw3/FOMI9V6lQqUMoYN35M6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vuilQEA0VisUrXRRsJFLDN38sw/vTEtt29RF739nz52f6LA6DbChbg9yKyOT?=
 =?us-ascii?Q?WsV3LqUG/D8N2SpOqrylkOmWtpDH8G5sMF5zARscMkArCCX6z81PEZjgUdBc?=
 =?us-ascii?Q?4WmxmojwDCWBfPtX+oa5FX3oeL/ILBgolbC28UZhzTiXYziOgaN4301cydJT?=
 =?us-ascii?Q?erSf3PPJTqlYvnXMwrVpcc4nmYBlB1AQOmR77DEH8lIqv0u7gPU6tXWd6O5o?=
 =?us-ascii?Q?+7lVPiB3TKsJbAn1jF2e8UCAm4LqFQ/uchrfCvMC8VxK3Y5vQOxXZoirBztf?=
 =?us-ascii?Q?7TcyICcT8o5h3e1wqxiZzE2GdqMskZzMH6icLppRyd9jfCP5wz5h9izF2WV6?=
 =?us-ascii?Q?hHcPynddOqvY36CuAPafOTKoJOm0PRqf+dq0YmWId1qG/dHurcgZYc5J4Rq5?=
 =?us-ascii?Q?yn6Rrj+2kE2UF1/nDtjW14pc3E8eVCm3by9wthMsRKW83AnbzO9v4jgoya4n?=
 =?us-ascii?Q?YWWMugusFljQEo1UuRld/Mo7v5DQR+H0hwMPgrr/7lLuqJAIrtvd+qGeJJF1?=
 =?us-ascii?Q?WoMBZ8ZNIKRGy3qj/GtaXMpsuOzKlI/2xruqCYnI0te7T7Mdc2eF5T2fXtW/?=
 =?us-ascii?Q?nHuRNHqEWdTTUl4aPvD5cEoU+w4HYGHjRxzN8QzAHqgzzREU+BUCNS8fdLHk?=
 =?us-ascii?Q?9cuoivaEXSfe8RqeyPvllhj0XLMaWZAEc5EFgEggsnYeWN3f3/jiNmIkLVXN?=
 =?us-ascii?Q?scFG3bI0IjMWwKcw0vI4/viDMIzo/KIKcB+2haXsNlGUQwNPzfYv8pYxwHhV?=
 =?us-ascii?Q?21Z8w5hKVIrhv4XiiO/Tmg/0vPLmshPJs/exPP6Ici5GGrunczMjWrieHigt?=
 =?us-ascii?Q?KmzhYhGIPAMZqwgJ+rcwH2FtXZgzn/0iykzQtuV6R7TcSyWtOeQGNHGzBd5+?=
 =?us-ascii?Q?uNwZUomOFDyE1EYKjNeSzpyQvbCuVuYhxJXYcVZti8Gus+vOCrWxkNBscZu8?=
 =?us-ascii?Q?oWt6CK0p9i+NE42fvNRQgoSuGoBAJoWisq1rq7ri5SbqjQHzgCUIqm84pjNg?=
 =?us-ascii?Q?v9+01RZbKSrdyzh+E4GPOvqIJDAmnZQs72AxULctv3SbXRP95xiisuolrSbI?=
 =?us-ascii?Q?PJaRX3KYnsPuiHkoSZ6cMxjyoJ7qEgVyVkju6CINoU5bfp0bqrgRwwcWhQd4?=
 =?us-ascii?Q?dDUtjK2TrBfPiv0oQlxjlk66etsV2G6fa9wzRbCXRREi+bwM33MtdSvi4uF9?=
 =?us-ascii?Q?gtg1I4mIW0CWXaxbvKK+d+lWOHo2w7CRtmb42/zAF3X82rwU5+BnUxdVSmsx?=
 =?us-ascii?Q?rOidPnQIqOvx7lECrrRydA4KOBOUZyStXXWIgt+NVscc7F31DF7fK9My9ZmB?=
 =?us-ascii?Q?N/LE9BSKcJHl7a/NYwuyiI+70iItp2E+Ey8mPs6GXqcZgVcW/HoFwW4FBUY7?=
 =?us-ascii?Q?WERV6qvYCJGXNiJdw6EONfaMCFw6NGC0nyFp0y0EJ+J7/hpytQnP+494EWu2?=
 =?us-ascii?Q?Sysu3BiMDOAm+29uzXxulIyKwJkpx8ooTJDv6xGv8CqUSKp5HX665bPeqb+I?=
 =?us-ascii?Q?gSd7mfTFZjcrDc/bky9XKNJLIjvwaWOpJhQEyqsHO4QvHvmrXwnIfEI5oz68?=
 =?us-ascii?Q?U4Rjmblxx25GsLoCGgCCQLBqvZrcFPaDj+fvcZ4S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f94b02d1-c92b-4dba-ae64-08dd13a16550
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 13:50:07.3041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7bSsKyyZUL3qsXOx8MIGe/FZH53EGJTu2KZDDeWe6AnyF+9NA1l6/QQmq3ahJd3xhwsdqTXKT2YtYpMu2smQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7668
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git uaccess-hardening-2
head:   fe61a94918d25569e09dcdbdd5c8f67b2736f540
commit: f7a5c14629a56aae2519289cd41f892f5ee7615d [2/5] x86/sev: Remove off-label __get_user() usage
:::::: branch date: 4 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-122-20241126 (https://download.01.org/0day-ci/archive/20241127/202411271726.dvFXgNky-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271726.dvFXgNky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411271726.dvFXgNky-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: duplicate [noderef]
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: multiple address spaces given: __user & __user
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: multiple address spaces given: __user & __user
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: multiple address spaces given: __user & __user
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: multiple address spaces given: __user & __user
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:479:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:479:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:479:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:479:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:479:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:483:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:483:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:483:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:483:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:483:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:487:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:487:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:487:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:487:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:487:25: sparse: sparse: multiple address spaces given: __user & __user

vim +475 arch/x86/coco/sev/core.c

f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  423  
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  424  static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  425  				  char *src, char *buf, size_t size)
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  426  {
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  427  	unsigned long error_code = X86_PF_PROT;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  428  
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  429  	/*
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  430  	 * NOTE: the 'src' pointer can be either user or kernel memory.
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  431  	 *
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  432  	 * This function runs in atomic context, so unsafe_get_user() is not
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  433  	 * allowed to sleep.  allowed to sleep. The page-fault handler detects
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  434  	 * that it is running in atomic context and will not try to take
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  435  	 * mmap_sem and handle the fault, so additional
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  436  	 * pagefault_enable()/disable() calls are not needed.
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  437  	 *
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  438  	 * The access can't be done via copy_from_user() here because
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  439  	 * vc_read_mem() must not use string instructions to access unsafe
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  440  	 * memory. The reason is that MOVS is emulated by the #VC handler by
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  441  	 * splitting the move up into a read and a write and taking a nested #VC
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  442  	 * exception on whatever of them is the MMIO access. Using string
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  443  	 * instructions here would cause infinite nesting.
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  444  	 */
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  445  
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  446  	if (user_access_begin(src, size)) {
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  447  		switch (size) {
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  448  		case 1: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  449  			unsafe_get_user(*(u8 *)buf,  (u8 __user *)src,  user_fault);
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  450  			break;
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  451  		}
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  452  		case 2: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  453  			unsafe_get_user(*(u16 *)buf, (u16 __user *)src, user_fault);
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  454  			break;
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  455  		}
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  456  		case 4: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  457  			unsafe_get_user(*(u32 *)buf, (u32 __user *)src, user_fault);
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  458  			break;
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  459  		}
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  460  		case 8: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  461  			unsafe_get_user(*(u64 *)buf, (u64 __user *)src, user_fault);
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  462  			break;
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  463  		}
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  464  		default:
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  465  			user_access_end();
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  466  			WARN_ONCE(1, "%s: Invalid size: %zu\n", __func__, size);
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  467  			return ES_UNSUPPORTED;
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  468  		}
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  469  
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  470  		user_access_end();
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  471  	} else {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  472  
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  473  		switch (size) {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  474  		case 1: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23 @475  			__get_kernel_nofault((u8 *)buf,  (u8 __user *)src,  u8 __user, fault);
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  476  			break;
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  477  		}
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  478  		case 2: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  479  			__get_kernel_nofault((u16 *)buf, (u16 __user *)src, u16 __user, fault);
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  480  			break;
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  481  		}
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  482  		case 4: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  483  			__get_kernel_nofault((u32 *)buf, (u32 __user *)src, u32 __user, fault);
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  484  			break;
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  485  		}
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  486  		case 8: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  487  			__get_kernel_nofault((u64 *)buf, (u64 __user *)src, u64 __user, fault);
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  488  			break;
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  489  		}
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  490  		default:
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  491  			WARN_ONCE(1, "%s: Invalid size: %zu\n", __func__, size);
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  492  			return ES_UNSUPPORTED;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  493  		}
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  494  	}
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  495  
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  496  	return ES_OK;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  497  
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  498  user_fault:
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  499  	user_access_end();
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  500  fault:
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  501  	if (user_mode(ctxt->regs))
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  502  		error_code |= X86_PF_USER;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  503  
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  504  	ctxt->fi.vector = X86_TRAP_PF;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  505  	ctxt->fi.error_code = error_code;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  506  	ctxt->fi.cr2 = (unsigned long)src;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  507  
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  508  	return ES_EXCEPTION;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  509  }
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  510  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

