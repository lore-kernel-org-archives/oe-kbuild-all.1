Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58FE3FA5F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767720; cv=fail; b=BIphU+3UttlatGMR1tHp55ipnqKvALIFULLi3hbts6eW0LqXxidLq0acrZZVBx41piWNkq6n2FbOPAIrujt+7/Bn2B9zGwRMVyYhd3+d/o3xWiEzyXOrnLeSP8ggMJaZdHMjP970inNkTwmmlQ6e2Hd4QHLcxcFaGTNEbe1aOOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767720; c=relaxed/simple;
	bh=fm1gqCHCOwW0mRVxf0P5RxQ4IqR+P2Xyuvg2As/lG14=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JOJSy8LLntYgNTdO0Hf30tuiAv36czewZtsVCtZMXPct1Jz68LObdoQJN8pTgUKKJPvEG2dwZ/mU26eokdkHxMLGauA0Ag18dQDXn8N2FP5OZR7Ct3gRRsTv8KP+BgPnBwEdzG+jj0Ap/aDB1RdBeS547GOKDEFuQWVg6quB1rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nq/2ixCW; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nq/2ixCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778767714; x=1810303714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fm1gqCHCOwW0mRVxf0P5RxQ4IqR+P2Xyuvg2As/lG14=;
  b=Nq/2ixCWi1rmmBAw0ERt3IbZ0e4jALSmtmY/DEtvE29BlAl1tbavbM3D
   O+ucM21RgEWNcf1Wq06Nmy0EECZELg5uJoiDQnKi4W1eOnlXBFXp3dIVL
   07yzjl2BQgwrJKBP8D/XdVXk052rESh/Ej/DKm2mrPC+A/rFJAtZOmp2m
   xnfPkUpTK/4Q0t0DFJYNCPscqLXtEDdqgwd6WuqZfvsKGyDRxX2aXV9/v
   NfB/vJ2ZxaKb4VpiRJesblHiRXdGIs21HypdzQxioPGNiFOZfAUmzDB+b
   GdjW5cp9EQrHtXGfNCcKKM++Luu/FzqnJfbT/DrjE6XYAhfkaWWKIz++i
   A==;
X-CSE-ConnectionGUID: AUtLn0Z0RJe7275mUyAOmg==
X-CSE-MsgGUID: otqvXFvaTlCc/UpoqElJlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90019473"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="90019473"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:08:29 -0700
X-CSE-ConnectionGUID: cflALZKERJ6SM9o5ynO+Jw==
X-CSE-MsgGUID: 07u5uYjkTO6PjgOHrJygVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="261916824"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:08:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 07:08:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 07:08:28 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 07:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEGpXM8Eo0cWkYejZxSPdXJGWsYBFLGCktkKZhUeo3jq6lXH/i9REvHoN5jzy9OW7reDFyYq7UhNOy7maFdhxPUBbo9DukWF8DufEdXcMh8VanBgESSum0LDrcOvXZZI7+jTgZfNbac0lM1BVjuD6MTugKxRiJNadrx9TWW09ukxzoV29apEblwAYCDEtXofXQXMfejSztLww3o3K08+vmu1LMA9PeQhYIbK010jVhb4UovqKfFefoHw/JGbFnSFv+XhIXpSkD8XPqTCPvWzFuUpK53aT2ZS287jymbuBncAOMGgCak4Kz//JqbCxT06wQScHUHx40GPjOXuLDM7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWKxQDLnKWNXVnjf3na8X3vVWsUMKciMSN8Ig7So11w=;
 b=KhWMHe3QePoiUgLHaMLp30lEnrddLV2CNVVdX0t42jTkgkS+MnzuJb5aFcIAXRhZyEB39tBqZImAIPYapoE9/jlOP+asJINweC5mjIjU2U9ATmKEhmvhe60LU1NaqZYrY/gcIgso0KHx/uLNWJUEU0Pi7J2FQS6OoNp10VQ2cE2wCqUGoup3lzsuhMLyVVc3MDW7zopPcH5/ibtUYnhfv9/YwjR/ZKdbZ/KXBkXltfIo179ajiLGlE7+oZlujIIIpcfkA3ZxPoPMUJXE1IcC5gztfbHEWrwOG5lCMgu/mcI5gtwGZ9h7PuuCbZtvfIZ8oiDcSBVVLgKPSOlfaySA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 14:08:23 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 14:08:23 +0000
Date: Thu, 14 May 2026 22:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Vipin Sharma <vipinsh@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>, David Matlack
	<dmatlack@google.com>
Subject: Makefile:23: ../liveupdate/lib/libliveupdate.mk: No such file or
 directory
Message-ID: <agXXTt03HvbC/cLH@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0057.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::8)
 To CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee7aa39-1b15-4124-4a34-08deb1c24286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: DZeXxFeKQcy31o5aCfzwVHjwWKKUUthQyUNn8f+GP/mzj1amOx6jMnHXcbCoOVjtixER4/KVhiHAxLgpD76cKcQu0EM0tMEaNfdsPhMHnbeF2mQaVE7d3q4lSI6ySruyQwHA4ZtKBhligABvS1rEi8r1qkNzLC9+d8Dv44NQZbyDAuzdyhY4tXhvDeWSw4H07hvXAuTKwMa28R7fYLIm82zdn5Jyuj5sssxvvxx+0xFilT1l3beZyZ+S6KbJ+4n2C/DOOAIIX0M2fbLCoCs73zAtKTP21bH/XNp/OUsDDpCaEg02z0Ftl0MFH9gF2H+BKhc0dhxKAWA12YLzt8NQ2ANLLPwNpHTXs2b5cH7kT1k5+/Kb0nFzs0Bw5KHPmHlGh/kTJ5fd6WCZGk/x3vbBcPTvlYFqUi3jP8+xYeeAfl3JqdyH5aP9A6FksWsqG6hEZSItuT7m2kfoai2ya4TGlJWo8raMmT7za8ReIBrV4rkxhGWFE9NIZS5TW3a7uWXjJBeV3Lgvp7h19LvCy9tySMAekBF9/CDw4jg76xlMIFlDMAGnnLStoArVeU6Oy6NLxjJFnVPBzqLsth5SRASoZDXxvradgszyQ75SgMkVdXL3cz8pnzUjoKE/4XbXoAXgxdu+b5Y+An2AGC6/uIuTZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6wK8JKPMQTAZTEDkR204l+RA/CFttxdtbXpkw901MgeRGRYIWwWQibLqW0dj?=
 =?us-ascii?Q?rjbo6n2NHRyCExHfaQmgaOKLxGu13/gk3WxEXwOnaRbnEj/EZ5v5j9Lt/mcu?=
 =?us-ascii?Q?bMRPwL5DwaG6puGwR2tYEET8PQYG7h8q70H+q7oO5zvhu/2YCsrtRXDAZGtA?=
 =?us-ascii?Q?S5zfO5YRlbp8eBtURUlWIhAqUN9L7Tvk2NbqqAUjdG3ravVG/KV1ZB/B2zXC?=
 =?us-ascii?Q?RrPufZmOe5p3/kKx1Q98YhhF28ws5YvEeczf4xMNl+sJUrDjaNHYSvl/+wzL?=
 =?us-ascii?Q?YBJS1oYRqAnzBdkwb3Q9PgqFpGjSvI51ahhszihH9LQi2mgCU5EJ88ZPM4i7?=
 =?us-ascii?Q?Q/jcbSrGXTZYz3WtePJRG87HYN+yRipbvdXYXpl/eLBv+49d1PoL0tdDCHlw?=
 =?us-ascii?Q?gHlLHu1NSLIxwcnRY0GmO6OtktA4Nbi0bVjRgUcPITasrVOomcFTTAjmUpsq?=
 =?us-ascii?Q?f1WxIJTmWS1qHU4nPYzn8k8EsrDxpm7/qrOk0MKGLgYo5f7WBNJateMauYYJ?=
 =?us-ascii?Q?jBSn8hYllxiGNn3KceYD3mBqC7dIL0SrKK9rgNaG825o8+YbFeFt58WCan0g?=
 =?us-ascii?Q?j9D01Nr7vtEO7eZX+vjv0CO/jvX8Kj/93Pfjuo7/1EXoiT2EtasCCSXdKg6D?=
 =?us-ascii?Q?0lhpIYqm2x2qVhJK8CbUgBgm7r7XQBPanDL3H1fVp3PFPqooEiy5X/c/xSiy?=
 =?us-ascii?Q?Cias/u3PpF6vSD5ryarbW5rVXSIv0oo1oqpygCCFvnYuwREpZQajDFA8zUOE?=
 =?us-ascii?Q?wARHybOQQLUMHzXVl08SQ5LmUST0XM8j/RR4qWoFi1xAGcmvSXLmcj6MLT/7?=
 =?us-ascii?Q?xtUbZMy1Ndhvx0rwPvXl5RzQy7Ry+51nexilhOqqz6+CIFmfq124uXdv23cY?=
 =?us-ascii?Q?jRl1Ez+vyegWa1zs1nzJ2zmJIKAZwvQSUS9PvglOeC/71iLTAuPrq4bZFprt?=
 =?us-ascii?Q?igYAkz04Czpujvo7E4iBB7BgPCn/5vKhi0QTSj/4BIHbpFWSmoO3CrRon0x3?=
 =?us-ascii?Q?1AlrQGh4FaydyoiInHzjFkDMTunkoC3uK/cdbynQBvQn7kFRhn3OPX6QvWLU?=
 =?us-ascii?Q?IQV6h/0iS2wjOFNMcyu8xyAxrkVq/LkVyD25GZUyEfMxwClLMba+HXpvgBsx?=
 =?us-ascii?Q?I4unSTDTBcL2OMSsUcvvCtGM8RWIimeg6/JB/H2XT5Pi+Y4zz1sYMZGZt1yu?=
 =?us-ascii?Q?J4uXah8UdAw2QCEfGpmaKquS5w/2w5sSmeY3WKfay2hAe1axnSGjE/gRGegQ?=
 =?us-ascii?Q?caDBxB2c02zSn2EIEhd/FSei+s2hpyl9YfwoZc6tdN9HStpbA8+IZv/qkiOz?=
 =?us-ascii?Q?bTEoyMN78oHQCaLoAaqtP+KA0qKlmLRWiwWqbD+It4eEKb/4xRyu6ggxUmuD?=
 =?us-ascii?Q?rwjme4flgEdd+kHDPkasgTft4UEIB4tOL3wAqNfoEmVVSkmMWR181A1dO0vw?=
 =?us-ascii?Q?Q+IsgoqzDjH9aEKGQmmCPVBRdLZjtVDjMsMHkwIhJ5jMZ5yTqE+hXHmTW8JM?=
 =?us-ascii?Q?26JbzSRtQt1Zj9OvJBzEB2mYPuon+SBkhJPfka8ovvXeGiooMkXsuZyeRtQu?=
 =?us-ascii?Q?U1aXygpx3MFPjpApby4/7w/AAsPuaQ+5t5N3B3fEi6e808wgtn9M4VC79yt9?=
 =?us-ascii?Q?13N0MlXcgA9KUQSbw6mBaAnB1HvO9JjzMgybYlVfAJelgYBbYHDWdrQbFCuP?=
 =?us-ascii?Q?cLu40FA/tkbV3rjsW4mw+M7ro8PKWGqolZ+7Q5xIGeGVTXP4C83b/udfGrr9?=
 =?us-ascii?Q?16PLF0SkqQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: bwdVroFUeZ7/oYLuOiu7nwpNVUyK5fjAJYIkc21HyI+zlP0UC2EqgTApmeNQI+6Fo23myKB4leJH8vIZ+s3atL+Ofw4zlvtHytJcG+UgSa+MRL/ad8qUpPi1g/eGkrdvfbftgRxyqWhkaQG2lOxvYxExUXpusRTubyDN3xJiWel7WULwbfqX1VLlN6l/IgV6OEMaugGZkce9aBtb9ULcD1VkTHXjilI8PPM4cv9TojsjeLw+YzcZy4MxOF0VZ/CCGoPeEpNvTPXGf6WsreIQWjKKUWk6vDEpisQfGOMJ/4VU9N0/J3Y0bDPYLKICz6UbCOBjHIqsOkit9ucOo7iXOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee7aa39-1b15-4124-4a34-08deb1c24286
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 14:08:23.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSWzQF7Uf6p7+trlhBQJh9/uyXdIZCkaJU1iFnrYf8mDWOr4AWWmh4aiPm/HMMTdsOdCqMKmzHNt3/+8vawq/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Vipin-Sharma/vfio-pci-Register-a-file-handler-with-Live-Update-Orchestrator/20260512-152829
head:   ebd50d810440364055692a3ed1d967cd7149d0dc
commit: f35ed2dfb272632246d1c9b941897e618a8372e8 vfio: selftests: Build liveupdate library in VFIO selftests
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260512/202605122134.oEzTYlT7-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122134.oEzTYlT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605122134.oEzTYlT7-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: *** [../../lib.mk:225: tools/testing/selftests/drivers/net/psp_responder] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** [Makefile:124: tools/testing/selftests/hid/host-tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
   make[1]: *** [../lib.mk:225: tools/testing/selftests/net/busy_poller] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/net/tun] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets specified and no makefile found.  Stop.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
>> Makefile:23: ../liveupdate/lib/libliveupdate.mk: No such file or directory
>> make[1]: *** No rule to make target '../liveupdate/lib/libliveupdate.mk'.
>> Makefile:23: Failed to remake makefile '../liveupdate/lib/libliveupdate.mk'.


vim +23 Makefile

87d599fc3955e5 Masahiro Yamada 2022-12-13  17  
121c2a137767df Masahiro Yamada 2020-05-11  18  $(if $(filter __%, $(MAKECMDGOALS)), \
121c2a137767df Masahiro Yamada 2020-05-11  19  	$(error targets prefixed with '__' are only for internal use))
121c2a137767df Masahiro Yamada 2020-05-11  20  
ba634eceb535d9 Masahiro Yamada 2017-10-04  21  # That's our default target when none is given on the command line
121c2a137767df Masahiro Yamada 2020-05-11  22  PHONY := __all
121c2a137767df Masahiro Yamada 2020-05-11 @23  __all:
ba634eceb535d9 Masahiro Yamada 2017-10-04  24  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

