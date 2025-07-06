Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F452E36F2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 02:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751768643; cv=none; b=hHhyY0AGDJqMw0OMt/wEJdCe1Lgu09fWB0cHHcNFWk/JcV2DTVwGbHWvwpX1oqgqjQKpJigYkBJcebYzItw3hEEZsHys0hhfw7CRx1Ul5QtQ2UqXqYK6m4atXuIbiBZXlKBrd2khdU0YjRW48a7HE2ObF14YwEG5cIKlh9JCpnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751768643; c=relaxed/simple;
	bh=CO3NNkd8KxJktlvx4OOfr03Qn1SZBVjrGp5TqosPtZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e3BPWnRKncnxTtmRqy6GnlL21PNGLBJ4XXBY0hQCn2udwKyfyqLrEx3P781QshYFeu/hhHQGKBmlqh3ybflI54juifLEnUBKFBeD/ZSwPgAM6FA7VdhrZXWvpmD21l3xgazYom/vZQ3z1LIZ2l5rf4P8rYuAMyMdOrbgWQIW/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eosMLcQh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eosMLcQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751768641; x=1783304641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CO3NNkd8KxJktlvx4OOfr03Qn1SZBVjrGp5TqosPtZQ=;
  b=eosMLcQh+usOL6dlTWU1i1F+SxTAj2OZ+jVE3aREhtt8msnlbTPmC1bj
   rQcCu6moBt/4p7YubZpqE9+cowInN4UErp462aMWfzWo/1wBPwwmW/xo8
   bzFmIwTSwTZTT+kw92vR/151HQEfO04M8mPjFkIlUcrS8QkjoOmK3sHVo
   N+oeMc7yb+zNnDlYLKQJDw/dBOZ/77mvGxss4bvwYAKdFTJ9HI6D/FQqf
   4Ta/8hNoqPYhuL2OwJXI6VL6gW8BdIbVULWhZvqU4KaDhKPfRPVHxpVj+
   2Vu1WSjqy10p9ljC3SWqkRqOgm5NsH2ICrMRJ0XPzNygd4zg8da/YG2EI
   Q==;
X-CSE-ConnectionGUID: YT+M3Vy7RU64xnwyrfw/lw==
X-CSE-MsgGUID: WpXyf1hFTtyzl3PWLgulIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53249198"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53249198"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 19:24:01 -0700
X-CSE-ConnectionGUID: 76fNJ35RSi6t0i8lgTk3ww==
X-CSE-MsgGUID: 2r9XZwo1Rf+4aBYUyFrL8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="178581810"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jul 2025 19:23:59 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYF2r-0004pP-1M;
	Sun, 06 Jul 2025 02:23:57 +0000
Date: Sun, 6 Jul 2025 10:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, =?utf-8?B?6Zer5rW35rab?= <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2467/2467] fs/nfs/enfs_adapter.c:62:25: sparse:
 sparse: symbol 'nfs_multipath_router_get' was not declared. Should it be
 static?
Message-ID: <202507061041.8fClqxw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a9f7917e90ec872036160e2cb3a1d3c1856cb406
commit: 18e360871c3f648ecb0d8cc9b23fd4268a64c17f [2467/2467] add enfs feature
config: x86_64-randconfig-121-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061041.8fClqxw5-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061041.8fClqxw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061041.8fClqxw5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/enfs_adapter.c:18:31: sparse: sparse: symbol 'enfs_adapter' was not declared. Should it be static?
>> fs/nfs/enfs_adapter.c:62:25: sparse: sparse: symbol 'nfs_multipath_router_get' was not declared. Should it be static?
>> fs/nfs/enfs_adapter.c:78:6: sparse: sparse: symbol 'nfs_multipath_router_put' was not declared. Should it be static?
>> fs/nfs/enfs_adapter.c:84:6: sparse: sparse: symbol 'is_valid_option' was not declared. Should it be static?
--
>> fs/nfs/fs_context.c:374:26: sparse: sparse: symbol 'getNfsMultiPathOpt' was not declared. Should it be static?
--
   fs/nfs/enfs/enfs_init.c:30:25: sparse: sparse: symbol 'enfs_adapter' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_init.c:95:9: sparse: sparse: symbol 'enfs_init' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_init.c:100:6: sparse: sparse: symbol 'enfs_fini' was not declared. Should it be static?
--
>> fs/nfs/enfs/enfs_multipath_parse.c:24:6: sparse: sparse: symbol 'nfs_multipath_parse_ip_ipv6_add' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:162:5: sparse: sparse: symbol 'enfs_parse_ip_single' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:209:6: sparse: sparse: symbol 'nfs_multipath_parse_ip_list_get_cursor' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:236:6: sparse: sparse: symbol 'enfs_valid_ip' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:248:5: sparse: sparse: symbol 'nfs_multipath_parse_ip_list' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:361:6: sparse: sparse: symbol 'isInvalidDns' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:387:5: sparse: sparse: symbol 'nfs_multipath_parse_dns_list' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:431:5: sparse: sparse: symbol 'parse_remote_type' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:473:57: sparse: sparse: restricted __be32 degrades to integer
>> fs/nfs/enfs/enfs_multipath_parse.c:471:5: sparse: sparse: symbol 'nfs_multipath_parse_options_check_ipv4_valid' was not declared. Should it be static?
   fs/nfs/enfs/enfs_multipath_parse.c:486:44: sparse: sparse: restricted __be32 degrades to integer
   fs/nfs/enfs/enfs_multipath_parse.c:487:44: sparse: sparse: restricted __be32 degrades to integer
   fs/nfs/enfs/enfs_multipath_parse.c:488:44: sparse: sparse: restricted __be32 degrades to integer
   fs/nfs/enfs/enfs_multipath_parse.c:489:44: sparse: sparse: restricted __be32 degrades to integer
>> fs/nfs/enfs/enfs_multipath_parse.c:478:5: sparse: sparse: symbol 'nfs_multipath_parse_options_check_ipv6_valid' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:494:5: sparse: sparse: symbol 'nfs_multipath_parse_options_check_ip_valid' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:510:5: sparse: sparse: symbol 'nfs_multipath_parse_options_check_valid' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:536:5: sparse: sparse: symbol 'nfs_multipath_parse_options_check_duplicate' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_parse.c:562:5: sparse: sparse: symbol 'nfs_multipath_parse_options_check' was not declared. Should it be static?
--
>> fs/nfs/enfs/enfs_config.c:554:6: sparse: sparse: symbol 'enfs_glob_match' was not declared. Should it be static?
--
>> fs/nfs/enfs/enfs_multipath_client.c:72:5: sparse: sparse: symbol 'nfs_multipath_client_mount_info_init' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_client.c:120:6: sparse: sparse: symbol 'enfs_free_client_info' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_client.c:135:6: sparse: sparse: symbol 'nfs_multipath_client_info_free_work' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_client.c:191:6: sparse: sparse: symbol 'nfs_multipath_ip_list_info_match' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_client.c:328:6: sparse: sparse: symbol 'print_ip_info' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_client.c:352:6: sparse: sparse: symbol 'print_dns_info' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath_client.c:390:6: sparse: sparse: symbol 'convert_lookup_cache_str' was not declared. Should it be static?
--
>> fs/nfs/enfs/enfs_roundrobin.c:107:17: sparse: sparse: symbol 'enfs_lb_switch_find_first_active_xprt' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_roundrobin.c:119:17: sparse: sparse: symbol 'enfs_lb_switch_get_main_xprt' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_roundrobin.c:169:17: sparse: sparse: symbol 'enfs_lb_get_singular_xprt' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_roundrobin.c:332:5: sparse: sparse: symbol 'enfs_lb_revert_policy' was not declared. Should it be static?
--
>> fs/nfs/enfs/enfs_remount.c:105:6: sparse: sparse: symbol 'enfs_clnt_delete_obsolete_xprts' was not declared. Should it be static?
--
>> fs/nfs/enfs/enfs_multipath.c:186:63: sparse: sparse: cast from restricted __be16
   fs/nfs/enfs/enfs_multipath.c:190:65: sparse: sparse: cast from restricted __be16
>> fs/nfs/enfs/enfs_multipath.c:211:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __be16 @@     got int @@
   fs/nfs/enfs/enfs_multipath.c:211:24: sparse:     expected restricted __be16
   fs/nfs/enfs/enfs_multipath.c:211:24: sparse:     got int
>> fs/nfs/enfs/enfs_multipath.c:321:5: sparse: sparse: symbol 'enfs_configure_xprt_to_clnt' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath.c:357:6: sparse: sparse: symbol 'enfs_cmp_addrs' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath.c:374:6: sparse: sparse: symbol 'enfs_xprt_addrs_is_same' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath.c:393:6: sparse: sparse: symbol 'enfs_already_have_xprt' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath.c:782:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct in_device *dvice @@     got struct in_device [noderef] __rcu *ip_ptr @@
   fs/nfs/enfs/enfs_multipath.c:782:52: sparse:     expected struct in_device *dvice
   fs/nfs/enfs/enfs_multipath.c:782:52: sparse:     got struct in_device [noderef] __rcu *ip_ptr
>> fs/nfs/enfs/enfs_multipath.c:785:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct inet6_dev *idev @@     got struct inet6_dev [noderef] __rcu *ip6_ptr @@
   fs/nfs/enfs/enfs_multipath.c:785:61: sparse:     expected struct inet6_dev *idev
   fs/nfs/enfs/enfs_multipath.c:785:61: sparse:     got struct inet6_dev [noderef] __rcu *ip6_ptr
>> fs/nfs/enfs/enfs_multipath.c:836:5: sparse: sparse: symbol 'enfs_multipath_create_thread' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath.c:925:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct rpc_xprt *xprt @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/enfs/enfs_multipath.c:925:43: sparse:     expected struct rpc_xprt *xprt
   fs/nfs/enfs/enfs_multipath.c:925:43: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
>> fs/nfs/enfs/enfs_multipath.c:932:6: sparse: sparse: symbol 'enfs_create_multi_xprt' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_multipath.c:988:6: sparse: sparse: symbol 'enfs_release_rpc_clnt' was not declared. Should it be static?
--
>> fs/nfs/enfs/enfs_rpc_proc.c:13:21: sparse: sparse: symbol 'enfs_procedures' was not declared. Should it be static?
--
>> fs/nfs/enfs/exten_call.c:60:5: sparse: sparse: symbol 'NfsExtendProcInfoExtendEncode' was not declared. Should it be static?
>> fs/nfs/enfs/exten_call.c:178:5: sparse: sparse: symbol 'NfsExtendDecodeFsShard' was not declared. Should it be static?
>> fs/nfs/enfs/exten_call.c:263:5: sparse: sparse: symbol 'NfsExtendDecodeLifInfo' was not declared. Should it be static?
>> fs/nfs/enfs/exten_call.c:531:5: sparse: sparse: symbol 'EnfsExtendDecodePreCheck' was not declared. Should it be static?
>> fs/nfs/enfs/exten_call.c:542:5: sparse: sparse: symbol 'NfsExtendProcInfoExtendDecode' was not declared. Should it be static?
>> fs/nfs/enfs/exten_call.c:597:5: sparse: sparse: symbol 'dorado_extend_route' was not declared. Should it be static?
>> fs/nfs/enfs/exten_call.c:666:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rpc_xprt *xprt @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/enfs/exten_call.c:666:22: sparse:     expected struct rpc_xprt *xprt
   fs/nfs/enfs/exten_call.c:666:22: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
   fs/nfs/enfs/exten_call.c:668:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rpc_xprt *xprt @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/enfs/exten_call.c:668:21: sparse:     expected struct rpc_xprt *xprt
   fs/nfs/enfs/exten_call.c:668:21: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
   fs/nfs/enfs/exten_call.c:671:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rpc_xprt *xprt @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/enfs/exten_call.c:671:30: sparse:     expected struct rpc_xprt *xprt
   fs/nfs/enfs/exten_call.c:671:30: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
   fs/nfs/enfs/exten_call.c:676:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rpc_xprt *xprt @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/enfs/exten_call.c:676:22: sparse:     expected struct rpc_xprt *xprt
   fs/nfs/enfs/exten_call.c:676:22: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
>> fs/nfs/enfs/exten_call.c:662:6: sparse: sparse: symbol 'nego_enfs_version' was not declared. Should it be static?
>> fs/nfs/enfs/exten_call.c:955:6: sparse: sparse: symbol 'NfsExtendDnsQuerySetArgs' was not declared. Should it be static?
>> fs/nfs/enfs/exten_call.c:966:6: sparse: sparse: symbol 'NfsExtendDnsQuerySetRes' was not declared. Should it be static?
--
>> fs/nfs/enfs/enfs_lookup_cache.c:30:27: sparse: sparse: symbol 'enfs_lookup_cahce' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:98:6: sparse: sparse: symbol 'enfs_clean_server_lookup_cache_flag' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:112:6: sparse: sparse: symbol 'enfs_update_lookup_cache_flag_to_server' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:223:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rpc_xprt *xprt @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/enfs/enfs_lookup_cache.c:223:53: sparse:     expected struct rpc_xprt *xprt
   fs/nfs/enfs/enfs_lookup_cache.c:223:53: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
   fs/nfs/enfs/enfs_lookup_cache.c:226:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rpc_xprt *xprt @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/enfs/enfs_lookup_cache.c:226:60: sparse:     expected struct rpc_xprt *xprt
   fs/nfs/enfs/enfs_lookup_cache.c:226:60: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
   fs/nfs/enfs/enfs_lookup_cache.c:230:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rpc_xprt *xprt @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/enfs/enfs_lookup_cache.c:230:61: sparse:     expected struct rpc_xprt *xprt
   fs/nfs/enfs/enfs_lookup_cache.c:230:61: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
   fs/nfs/enfs/enfs_lookup_cache.c:240:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rpc_xprt *xprt @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/enfs/enfs_lookup_cache.c:240:53: sparse:     expected struct rpc_xprt *xprt
   fs/nfs/enfs/enfs_lookup_cache.c:240:53: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
>> fs/nfs/enfs/enfs_lookup_cache.c:146:5: sparse: sparse: symbol 'enfs_query_lookup_cache' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:251:6: sparse: sparse: symbol 'enfs_query_lookup_cache_pre_check' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:269:6: sparse: sparse: symbol 'lookupcache_execute_work' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:292:6: sparse: sparse: symbol 'lookupcache_workqueue_queue_work' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:305:5: sparse: sparse: symbol 'lookupcache_add_work' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:374:6: sparse: sparse: symbol 'lookupcache_loop_rpclnt' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:423:6: sparse: sparse: symbol 'enfs_lookupcache_update_switch' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:440:5: sparse: sparse: symbol 'lookupcache_routine' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:460:5: sparse: sparse: symbol 'lookupcache_start' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:471:5: sparse: sparse: symbol 'enfs_lookupcache_workqueue_init' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:487:6: sparse: sparse: symbol 'lookupcache_workqueue_fini' was not declared. Should it be static?
>> fs/nfs/enfs/enfs_lookup_cache.c:504:5: sparse: sparse: symbol 'enfs_lookupcache_timer_init' was not declared. Should it be static?
   fs/nfs/enfs/enfs_lookup_cache.c:146:5: sparse: sparse: context imbalance in 'enfs_query_lookup_cache' - different lock contexts for basic block
--
>> fs/nfs/enfs/dns_process.c:92:6: sparse: sparse: symbol 'enfs_update_domain_name' was not declared. Should it be static?
>> fs/nfs/enfs/dns_process.c:129:6: sparse: sparse: symbol 'enfs_swap_name_cache' was not declared. Should it be static?
>> fs/nfs/enfs/dns_process.c:148:6: sparse: sparse: symbol 'enfs_domain_inc' was not declared. Should it be static?
>> fs/nfs/enfs/dns_process.c:217:6: sparse: sparse: symbol 'ip_list_append' was not declared. Should it be static?
>> fs/nfs/enfs/dns_process.c:361:5: sparse: sparse: symbol 'enfs_quick_sort' was not declared. Should it be static?
>> fs/nfs/enfs/dns_process.c:394:5: sparse: sparse: symbol 'enfs_dns_process_ip' was not declared. Should it be static?
>> fs/nfs/enfs/dns_process.c:434:5: sparse: sparse: symbol 'enfs_server_query_dns' was not declared. Should it be static?
>> fs/nfs/enfs/dns_process.c:494:6: sparse: sparse: symbol 'query_dns_each_name' was not declared. Should it be static?
>> fs/nfs/enfs/dns_process.c:582:5: sparse: sparse: symbol 'enfs_iter_nfs_clnt' was not declared. Should it be static?
>> fs/nfs/enfs/dns_process.c:669:6: sparse: sparse: symbol 'enfs_domain_for_each' was not declared. Should it be static?
--
>> fs/nfs/enfs/shard_route.c:327:5: sparse: sparse: symbol 'enfs_query_lif_info' was not declared. Should it be static?
>> fs/nfs/enfs/shard_route.c:434:5: sparse: sparse: symbol 'enfs_update_fsshard' was not declared. Should it be static?
>> fs/nfs/enfs/shard_route.c:530:5: sparse: sparse: symbol 'enfs_update_lsinfo' was not declared. Should it be static?
>> fs/nfs/enfs/shard_route.c:555:5: sparse: sparse: symbol 'enfs_update_lif_info' was not declared. Should it be static?
>> fs/nfs/enfs/shard_route.c:639:5: sparse: sparse: symbol 'enfs_delete_shard' was not declared. Should it be static?
>> fs/nfs/enfs/shard_route.c:776:21: sparse: sparse: symbol 'nfs3_parse_ops' was not declared. Should it be static?
>> fs/nfs/enfs/shard_route.c:801:5: sparse: sparse: symbol 'nfs3_parse_ops_size' was not declared. Should it be static?
>> fs/nfs/enfs/shard_route.c:858:34: sparse: sparse: cast removes address space '__rcu' of expression
   fs/nfs/enfs/shard_route.c:867:34: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfs/enfs/shard_route.c:1035:6: sparse: sparse: symbol 'check_cpuid_invalid' was not declared. Should it be static?
>> fs/nfs/enfs/shard_route.c:1108:17: sparse: sparse: symbol 'enfs_choose_shard_xport' was not declared. Should it be static?
>> fs/nfs/enfs/shard_route.c:1187:17: sparse: sparse: symbol 'enfs_get_shard_xport' was not declared. Should it be static?
   fs/nfs/enfs/shard_route.c:1741:34: sparse: sparse: cast removes address space '__rcu' of expression
   fs/nfs/enfs/shard_route.c:1750:34: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfs/enfs/shard_route.c:1954:24: sparse: sparse: symbol 'enfs_shard_ctrl_init' was not declared. Should it be static?

vim +/nfs_multipath_router_get +62 fs/nfs/enfs_adapter.c

    17	
  > 18	struct enfs_adapter_ops __rcu *enfs_adapter;
    19	
    20	static DEFINE_MUTEX(enfs_module_mutex);
    21	static void *enfs_adapter_data;
    22	
    23	void *enfs_adapter_get_data(void)
    24	{
    25		return enfs_adapter_data;
    26	}
    27	EXPORT_SYMBOL_GPL(enfs_adapter_get_data);
    28	
    29	void enfs_adapter_set_data(void *data)
    30	{
    31		enfs_adapter_data = data;
    32	}
    33	EXPORT_SYMBOL_GPL(enfs_adapter_set_data);
    34	
    35	int enfs_adapter_register(struct enfs_adapter_ops *ops)
    36	{
    37		struct enfs_adapter_ops *old;
    38	
    39		old = cmpxchg((struct enfs_adapter_ops **)&enfs_adapter, NULL, ops);
    40		if (old == NULL || old == ops)
    41			return 0;
    42		pr_err("ENFS: regist enfs_adapter ops %p fail. old %p\n",
    43			ops, old);
    44		return -EPERM;
    45	}
    46	EXPORT_SYMBOL_GPL(enfs_adapter_register);
    47	
    48	int enfs_adapter_unregister(struct enfs_adapter_ops *ops)
    49	{
    50		struct enfs_adapter_ops *old;
    51	
    52		old = cmpxchg((struct enfs_adapter_ops **)&enfs_adapter, ops, NULL);
    53		if (old == ops || old == NULL)
    54			return 0;
    55		pr_err("ENFS: unregist enfs_adapter ops %p fail. old %p\n",
    56			ops,
    57		       old);
    58		return -EPERM;
    59	}
    60	EXPORT_SYMBOL_GPL(enfs_adapter_unregister);
    61	
  > 62	struct enfs_adapter_ops *nfs_multipath_router_get(void)
    63	{
    64		struct enfs_adapter_ops *ops;
    65	
    66		rcu_read_lock();
    67		ops = rcu_dereference(enfs_adapter);
    68		if (ops == NULL) {
    69			rcu_read_unlock();
    70			return NULL;
    71		}
    72		if (!try_module_get(ops->owner))
    73			ops = NULL;
    74		rcu_read_unlock();
    75		return ops;
    76	}
    77	
  > 78	void nfs_multipath_router_put(struct enfs_adapter_ops *ops)
    79	{
    80		if (ops)
    81			module_put(ops->owner);
    82	}
    83	
  > 84	bool is_valid_option(enum nfsmultipathoptions option)
    85	{
    86		if (option < REMOTEADDR || option >= INVALID_OPTION) {
    87			pr_warn("ENFS: invalid option %d\n",
    88				option);
    89			return false;
    90		}
    91	
    92		return true;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
