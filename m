Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFDD1FBF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 03:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707709442; cv=fail; b=CyayGbxdIo9Rsgcv4VIlzb9Wn6QlwDYY8a0MDruWyRFgyNI079j3xNgYbLdvgGqBivXuldxzy7FZP5132M987Ee8U7xTEygUMS64BsB1ZBzLJ+69r0evdIEDm5QC5IhtFjU4HbS7vykzpAc1z9f49D9OcplHv4ETbgs5pV6wt0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707709442; c=relaxed/simple;
	bh=LHf70cPMIW6j8cVIFPytrZvJ5q8rjDryGc+c6LfkoFY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Rh58CIQa79me1NJGI3OLC9090OM4b7TCN6iasB+p3tKpw/wgmAzddpcCkx8OM+dJA3yHp4lh+bKdoDVmczg6k5qiKwjX1nqn78nj0LXNh+NEHK1Fz8uvzZy+m/T/UxxvgVO84m3H6/9H2WIpG6NJ/37OC2bH9jQDpoxwfKsGtKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzvQh6s0; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzvQh6s0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707709440; x=1739245440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LHf70cPMIW6j8cVIFPytrZvJ5q8rjDryGc+c6LfkoFY=;
  b=gzvQh6s0S2BBvIFrVyzZ3T83dMwT8pzzHfchsQUvPceSZw3fm5wWKsab
   A0gODQQRhwCZhm6IvbCdv0yxOJXtXdxic07MevcVZ4TvSunxI0hdQdx3M
   vHfqeGLMtPf020AucUI5NVnyQm3D27OJT9Fa8GAIeDHGlOr0kLXtDQxJL
   yO1F3TvrTUwFeGVF/wr/zMnCLxipWkixqD9Xz++xDty9+nJ0HVrHu0AZc
   F1AusPwP9x8Kghn4TTbPehE2eEMSsTEuzLZqnlSHNuA+8GkYAmi03iXOd
   rkVLxL84U+CnQu3qrsEBRvTqQMDlM1mzD/MviiP9YvJohYB+lMJJePd7J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1816968"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1816968"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 19:43:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2445826"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Feb 2024 19:43:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 11 Feb 2024 19:43:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 11 Feb 2024 19:43:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 11 Feb 2024 19:43:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 11 Feb 2024 19:43:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZDGINRooqXMzj1TKzlzITjG/HUD9hPpqRD7c1prnEmy6czstmxu8j8xCzMmSt1mPL9U81Jl6c9vV0T1cz0GeB1Wtex4OffoRK18ycId8wPpnT2HHJMdexzXipTEXh/veRpq4u65+PIk0jLTpvzhHLo4+8sI1EffYfJkl7J9P094Dcm+NWjtG1H2hmqB3Qc5b/fYq0IGb7EmO3JLSue7dhHHbroclZiiPfj5Fu+i1Gh4kN3PoNc9lCzHuZ3Ees0G8O9l3Xv7JMtYb/ZHvITJkHyntfrBDcG4b4FjlWstNEF8Dhb3xgy3EylPq4S4xbpAMsxjm/QKa+cYC5IA+YIuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNamiD4DZdn42a7KGb4KS7y9zDFdB4+00oGViSAM84s=;
 b=VaBU8xMvkPStLAcP2PPZdjrRLRbNJI2UqOmCdRaDn8hpuGJCZD3t8dFjdGH4/gPbdCWX7lfn7SxkmmSu46q5XsHaf2dd3pNXXr5H2Pfb72fUY3gfjXMDLYzNIO9/ImLcLBuZYOEIYF0bxHsVUEwo5sKDZ/XCRWKausJpKpBxEU3x2F6LmlU0PpmG6Ycq1t7v2IQTJXHIr3JIVhVlcK+I1hqZP3ZH/y3cxjsYzV5uzgLaSQHJFsepyQ2k2Qx3y5JPKEma1PkVM9L1kDSzJ+zEhadva49Cp36Q4NhYDHb4rWTA8BTCuNwlxJ6doJhuttLe/a9UgkCBJD9xl+CKTcJJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by SJ2PR11MB7597.namprd11.prod.outlook.com (2603:10b6:a03:4c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Mon, 12 Feb
 2024 03:43:55 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7270.033; Mon, 12 Feb 2024
 03:43:55 +0000
Date: Mon, 12 Feb 2024 11:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Phil Sutter <phil@nwl.cc>
Subject: [linux-next:master 2259/5901] arp_tables.c:(.text+0x1c): relocation
 truncated to fit: R_NIOS2_CALL26 against `xt_find_table'
Message-ID: <202402111317.WPmbzZp3-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|SJ2PR11MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f5b9c3-0ccc-47ca-efcf-08dc2b7cd67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TuVh5flk1O1KOtxXmgVi9vm7aRiFKS28+T3pXlBRefKfje6fj6Pr61B+Fco8ETD0gsloBl66jNqOsyiQuUKQFGE4xDnhoWsjyWh6Df2g8Sq2jHRgLsD1aA/c5ZLziKa+edxYemRfJxNs2StqpFqRNxes+ceapnXvMyntYd8Hn/tQ0faTypyCanA5GSiIh35x/PbrecDFfioNUkSssIYh1ifB1t8bw7aY5Pmp+3SCYSreG+xq1Jx7HA4iuqr2oZqfccMYXfKbxKNIoMWbfsG/SL0rAJM9OE3Q2K/WqurVGfd87l1AqQeeBNvFIoLqh4QWLBgal71/rSKTvhAOYF1qw8TQNwg2KNjUnwG/xFyc/1Ibl0UmL37KKBQAGRTO1i1whfCGhtWo6ULH2O/2YmXcV+DPiSuftgEHOUdsy6A9jGFNpoDArQXB7GGVWB9eWORitruBewUFoLkB7UFP698jao1Rq4TB9IzIAYsogKYGDlM6yYswzOisHWoWa9HfUKGfEiQvwV5hV7SbQmrBMdawLASWEpHtrrTOxLkfx0YpFh1ht5t6vp9jt+qMVAtQCJ1HuUm8bodZ+D16S1oqASti/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(86362001)(82960400001)(83380400001)(26005)(66556008)(6486002)(6506007)(2616005)(6916009)(966005)(478600001)(6666004)(1076003)(66946007)(66476007)(38100700002)(6512007)(36756003)(316002)(54906003)(8676002)(8936002)(4326008)(2906002)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1646C6XAtUhYsKWQC4NIhu4tUIDHB58bbJJLQkjhdsITVOlmxZtKdfBXsVsQ?=
 =?us-ascii?Q?Wh8c6/OeJm2a9+MKxFspyB0iTeDS82ZTXGn8t+IvJyS+yOaClf0WBBbD++ew?=
 =?us-ascii?Q?MrolVcd5+gMTpmLOMkJLqRcprg7o37RxPo/fFQxO7McRVMo5uYHcLUiPxHgr?=
 =?us-ascii?Q?RQW9Na3PwJiT3p+Kz3Ik7LVLs3ZKvOewBUOBpC6WHb2yaj9MQZHhWImLX+r0?=
 =?us-ascii?Q?RKB/WHL3+hc6fD8VbLWG0K4PBt4zrQPlx9Q7GqXmMfYhWNTZcLFwu+4Y2q+F?=
 =?us-ascii?Q?yS65H3pKjxSLHAkcaolDDbn/PMKbs1HqLqdNbH5B8nUbqhoF/Toht5u1CWmN?=
 =?us-ascii?Q?lNk4WfkGoNRGZMclRPduNunlDHQmBBGK/t3RtHcf8c97k71SoGbtDkyDpZZ2?=
 =?us-ascii?Q?AEr+RCyRTgK/W30TkAvLt7Z/W5QrJByYVMoJnL12JRssQnlsn/iI1XVmOp4A?=
 =?us-ascii?Q?PnwFiRjdmhs/YpiD1Kw29Ro5t3RoVezwxoZVWvDj0q3SqHvFzFhOSAbDdreB?=
 =?us-ascii?Q?kwYLsdB8xF7/6+sl+F8RPs7qbpCAWtdYE/v4ywAS0bkx3Us6KuQoA8u1GlPA?=
 =?us-ascii?Q?F/CjhAHvgKELy0kOGz8QyFbbuLfNG+5OE70d5na2GNY1qBfiL9plBKxlUe+6?=
 =?us-ascii?Q?uqrxMFGQ5igggODe8Hh4eoJJEuBSgWgi09PuViz+Yr1BrEtQZInY4PeH2hOa?=
 =?us-ascii?Q?qp1sF+BeUZpmH6xj0tS9HA1e7yqJ2qoNzD4YxKo95odzKOIzYObT5zbCe8rG?=
 =?us-ascii?Q?+DFSXju0BFMsOy+3P9zh8SzRTkIKa9inrHuRrqKEh+/UOEnbR7QGBd1EctIL?=
 =?us-ascii?Q?jpG7Yx/syTrGA4F5lVpk6MxXEOnGYz27ZcG/o3GE7x3NDGjmFdFsssZSCPNr?=
 =?us-ascii?Q?Bnz0JCdd75QNQz417EiCzrdRIz92xwaM2DVoidP0yeOmciQOWF/SLDBxNSeb?=
 =?us-ascii?Q?XgOvBeEjXB43m4N+HKLElWnzDMdt739j+HhKEiIJq8dWvOJJxa4/+UOlvVbv?=
 =?us-ascii?Q?7666BV7vfK+74zmmzFJJCPcHBniWlW59Hk/Ca6U5fvx39fFKs/WQ+SsZStkq?=
 =?us-ascii?Q?Tu3Lgjlu+Hr4QkeFCmrxmaqYidAEOzpuDgvAfPCg9+oVHQmq/oEIWAEzf+kT?=
 =?us-ascii?Q?ilr5gk8z6ArLeBio/eyukSYR5CUiDY6ThVDrnUo8lmFW7F10z7x1MQu2F/Rq?=
 =?us-ascii?Q?21WT/90b9NnDAcQXPez3vuSBkRPRgyRbc9wSUg49JSUhINBkOb8lCigGMDAd?=
 =?us-ascii?Q?yHIDbG9JAFPzdvfX70hQ+GRKQu/RdfubN0b+Z8K0DlrUc0T8ZdGNLB8LOvE2?=
 =?us-ascii?Q?+D3W/kzlppW3hu0WfrgYe78l0+dtsviB3Y2U9uAyFhA0SwIYG+TKeTQWTNta?=
 =?us-ascii?Q?rRsXMyfnVG7c6LFnkxBSYhFzzP+OsQDCKKaAHx0acvIPZV+qSzuvMDeYVLPh?=
 =?us-ascii?Q?5U14i0dCAuF6PNJhRGL/48Oj8DhUFvKWi3um404GmqOLKElI0JyfyzO2dN/1?=
 =?us-ascii?Q?ihEORuY2J6KS7mFDS9o0jXG8muGp8uUMdOC9cLQyzmZ8gFSjCSg2FsVbU+C9?=
 =?us-ascii?Q?RmBQjh9iWPUtAA2XcrH9oYx5B3KslWT41ZukgLc76k0++45ep1w+HAhQe/y1?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f5b9c3-0ccc-47ca-efcf-08dc2b7cd67f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 03:43:55.6100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBvPNRyCAPeIcqa63OjKtK0GMJ1C/zATruhhvNEx1N1YVe4m06SxNjJS56sjFM2QRKKeV+yJ5iRtosPCKaq/Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7597
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   445a555e0623387fa9b94e68e61681717e70200a
commit: 4654467dc7e111e84f43ed1b70322873ae77e7be [2259/5901] netfilter: arptables: allow xtables-nft only builds
config: nios2-randconfig-r052-20240210 (https://download.01.org/0day-ci/archive/20240211/202402111317.WPmbzZp3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402111317.WPmbzZp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402111317.WPmbzZp3-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_unregister_table_pre_exit':
   arp_tables.c:(.text+0x1c): undefined reference to `xt_find_table'
>> arp_tables.c:(.text+0x1c): relocation truncated to fit: R_NIOS2_CALL26 against `xt_find_table'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arp_tables_net_exit':
   arp_tables.c:(.text+0x70): undefined reference to `xt_proto_fini'
>> arp_tables.c:(.text+0x70): relocation truncated to fit: R_NIOS2_CALL26 against `xt_proto_fini'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arp_tables_net_init':
   arp_tables.c:(.text+0x94): undefined reference to `xt_proto_init'
>> arp_tables.c:(.text+0x94): relocation truncated to fit: R_NIOS2_CALL26 against `xt_proto_init'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `mark_source_chains':
   arp_tables.c:(.text+0x49c): undefined reference to `xt_find_jump_offset'
>> arp_tables.c:(.text+0x49c): relocation truncated to fit: R_NIOS2_CALL26 against `xt_find_jump_offset'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x51c): undefined reference to `xt_alloc_entry_offsets'
>> arp_tables.c:(.text+0x51c): relocation truncated to fit: R_NIOS2_CALL26 against `xt_alloc_entry_offsets'
>> nios2-linux-ld: arp_tables.c:(.text+0x59c): undefined reference to `xt_check_entry_offsets'
>> arp_tables.c:(.text+0x59c): relocation truncated to fit: R_NIOS2_CALL26 against `xt_check_entry_offsets'
>> nios2-linux-ld: arp_tables.c:(.text+0x75c): undefined reference to `xt_check_table_hooks'
>> arp_tables.c:(.text+0x75c): relocation truncated to fit: R_NIOS2_CALL26 against `xt_check_table_hooks'
>> nios2-linux-ld: arp_tables.c:(.text+0x7d4): undefined reference to `xt_percpu_counter_alloc'
>> arp_tables.c:(.text+0x7d4): relocation truncated to fit: R_NIOS2_CALL26 against `xt_percpu_counter_alloc'
>> nios2-linux-ld: arp_tables.c:(.text+0x7f4): undefined reference to `xt_request_find_target'
>> arp_tables.c:(.text+0x7f4): relocation truncated to fit: R_NIOS2_CALL26 against `xt_request_find_target'
>> nios2-linux-ld: arp_tables.c:(.text+0x850): undefined reference to `xt_check_target'
>> arp_tables.c:(.text+0x850): relocation truncated to fit: R_NIOS2_CALL26 against `xt_check_target'
>> nios2-linux-ld: arp_tables.c:(.text+0x864): undefined reference to `xt_percpu_counter_free'
   arp_tables.c:(.text+0x864): additional relocation overflows omitted from the output
   nios2-linux-ld: arp_tables.c:(.text+0x8d8): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `copy_entries_to_user.isra.0':
   arp_tables.c:(.text+0x97c): undefined reference to `xt_recseq'
>> nios2-linux-ld: arp_tables.c:(.text+0x980): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x99c): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x9a0): undefined reference to `xt_recseq'
>> nios2-linux-ld: arp_tables.c:(.text+0xa80): undefined reference to `xt_target_to_user'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `get_info':
   arp_tables.c:(.text+0xb94): undefined reference to `xt_request_find_table_lock'
>> nios2-linux-ld: arp_tables.c:(.text+0xc50): undefined reference to `xt_table_unlock'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_do_table':
   arp_tables.c:(.text+0x1018): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x101c): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1030): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1034): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1158): undefined reference to `xt_recseq'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o:arp_tables.c:(.text+0x115c): more undefined references to `xt_recseq' follow
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_unregister_table':
   arp_tables.c:(.text+0x12e0): undefined reference to `xt_find_table'
>> nios2-linux-ld: arp_tables.c:(.text+0x12ec): undefined reference to `xt_unregister_table'
   nios2-linux-ld: arp_tables.c:(.text+0x134c): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: arp_tables.c:(.text+0x1368): undefined reference to `xt_free_table_info'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_get_ctl':
   arp_tables.c:(.text+0x14e8): undefined reference to `xt_find_table_lock'
   nios2-linux-ld: arp_tables.c:(.text+0x1514): undefined reference to `xt_table_unlock'
   nios2-linux-ld: arp_tables.c:(.text+0x157c): undefined reference to `xt_find_revision'
   nios2-linux-ld: arp_tables.c:(.text+0x15f4): undefined reference to `xt_find_revision'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `__do_replace':
   arp_tables.c:(.text+0x1644): undefined reference to `xt_counters_alloc'
   nios2-linux-ld: arp_tables.c:(.text+0x165c): undefined reference to `xt_request_find_table_lock'
   nios2-linux-ld: arp_tables.c:(.text+0x167c): undefined reference to `xt_table_unlock'
   nios2-linux-ld: arp_tables.c:(.text+0x16d4): undefined reference to `xt_replace_table'
   nios2-linux-ld: arp_tables.c:(.text+0x16e4): undefined reference to `xt_table_unlock'
   nios2-linux-ld: arp_tables.c:(.text+0x17c0): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: arp_tables.c:(.text+0x17dc): undefined reference to `xt_free_table_info'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_replace.isra.0':
   arp_tables.c:(.text+0x18d8): undefined reference to `xt_alloc_table_info'
   nios2-linux-ld: arp_tables.c:(.text+0x1928): undefined reference to `xt_free_table_info'
   nios2-linux-ld: arp_tables.c:(.text+0x1a44): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_set_ctl':
   arp_tables.c:(.text+0x1b48): undefined reference to `xt_copy_counters'
   nios2-linux-ld: arp_tables.c:(.text+0x1b64): undefined reference to `xt_find_table_lock'
   nios2-linux-ld: arp_tables.c:(.text+0x1bac): undefined reference to `xt_table_unlock'
   nios2-linux-ld: arp_tables.c:(.text+0x1c14): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1c18): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1c1c): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1c2c): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1cac): undefined reference to `xt_recseq'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o:arp_tables.c:(.text+0x1cb0): more undefined references to `xt_recseq' follow
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_register_table':
   arp_tables.c:(.text+0x1d2c): undefined reference to `xt_alloc_table_info'
   nios2-linux-ld: arp_tables.c:(.text+0x1d78): undefined reference to `xt_register_table'
   nios2-linux-ld: arp_tables.c:(.text+0x1da0): undefined reference to `xt_unregister_table'
   nios2-linux-ld: arp_tables.c:(.text+0x1e08): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: arp_tables.c:(.text+0x1e24): undefined reference to `xt_free_table_info'
   nios2-linux-ld: arp_tables.c:(.text+0x1ec4): undefined reference to `xt_free_table_info'
   nios2-linux-ld: arp_tables.c:(.text+0x1f28): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: arp_tables.c:(.text+0x1f44): undefined reference to `xt_free_table_info'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arp_tables_init':
   arp_tables.c:(.init.text+0x2c): undefined reference to `xt_register_targets'
   nios2-linux-ld: arp_tables.c:(.init.text+0x58): undefined reference to `xt_unregister_targets'
   nios2-linux-ld: net/ipv4/netfilter/arptable_filter.o: in function `arptable_filter_init':
   arptable_filter.c:(.init.text+0x1c): undefined reference to `xt_register_template'
   nios2-linux-ld: arptable_filter.c:(.init.text+0x38): undefined reference to `xt_hook_ops_alloc'
   nios2-linux-ld: arptable_filter.c:(.init.text+0x54): undefined reference to `xt_unregister_template'
   nios2-linux-ld: arptable_filter.c:(.init.text+0x80): undefined reference to `xt_unregister_template'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

