Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16221225403
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 18:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765391510; cv=none; b=EuKbijH5JkEJzooOduCsAR+cRXkSNgdc/mRyKFrVkZBOm4fZq7yr4mW93eKZ3tpSvrJSYs7gY0E9i6RUD5w6wWZf38OQosQws6TO7RRFeIkVvGlZUyakKMXFxkYAuEWUS/7CWEjNcgmoA/PQyd4sbxsAJgKNd3DXsn8Pt6j8izk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765391510; c=relaxed/simple;
	bh=HD44L51hkxhEJsoY0HwMIUYApB/+tJoMYHM3Cp6Q1P0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQ6m9RIvcL9ncM6HkMuvDW1218ZQzcCzWNWJHj47dmmY1CiZ881kjRK7Uy7XM9EJf71RK1mLBOpQj5P0eysvkeCP+mMpGZTq8paikyzvl8G59ddWbC7JoKxRo86oFdKEBTfIYhTtspWlXshlcCRH6PNJ2j8W6OkFzwuBuQM56dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQhDEWDg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQhDEWDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765391507; x=1796927507;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HD44L51hkxhEJsoY0HwMIUYApB/+tJoMYHM3Cp6Q1P0=;
  b=eQhDEWDgOXKjy0kFD4VEz0j9IL1ohHMjrsDYo4GEcxln9HkzuSUKiPQi
   S8fGUyZni4My1obPr7lby5w2VLUYOb+V2EVf6+6Hbwl/TL9AaiFR5AxlG
   lpqPojhy+P6NeLcHMh2/v+PvJxPbMd6/GNJGcYkaB0eqN+1EljCNtCIzx
   JQJdhHx8nScYlHRaK+EvLzK4aAdEErzbMT7TlXWrvm7APIkfuDMPgoknv
   Gl8kxpjoqXWhwnAeiNusk0X562+UJwgQIU4Y34x3Cw9qp1tkXpPs0scA+
   CiIstyu+dJLipznbP6bqPdo28r4CN+AayUurNQ3w4JhkFRd3F3aWlzo7d
   A==;
X-CSE-ConnectionGUID: 8Vrv82YoTsGj2I5J77vJgQ==
X-CSE-MsgGUID: dhnVHYfYQRuuevWWcDwg9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92847882"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="92847882"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 10:31:46 -0800
X-CSE-ConnectionGUID: ns/kewL0RvWDOMncXUQcnQ==
X-CSE-MsgGUID: wZwjwmTqRTeaUD5ehGaRQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196647076"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 10:31:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTOyU-000000003dV-1gsG;
	Wed, 10 Dec 2025 18:31:42 +0000
Date: Thu, 11 Dec 2025 02:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, =?utf-8?B?6Zer5rW35rab?= <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3529/3529] fs/nfs/enfs/enfs_config.c:554:6:
 warning: no previous prototype for function 'enfs_glob_match'
Message-ID: <202512110235.L883ZLLi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi 闫海涛,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: 18e360871c3f648ecb0d8cc9b23fd4268a64c17f [3529/3529] add enfs feature
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512110235.L883ZLLi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110235.L883ZLLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110235.L883ZLLi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/fs_context.c:374:26: warning: no previous prototype for function 'getNfsMultiPathOpt' [-Wmissing-prototypes]
     374 | enum nfsmultipathoptions getNfsMultiPathOpt(int token)
         |                          ^
   fs/nfs/fs_context.c:374:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     374 | enum nfsmultipathoptions getNfsMultiPathOpt(int token)
         | ^
         | static 
   1 warning generated.
--
   fs/nfs/enfs_adapter.c:62:26: warning: no previous prototype for function 'nfs_multipath_router_get' [-Wmissing-prototypes]
      62 | struct enfs_adapter_ops *nfs_multipath_router_get(void)
         |                          ^
   fs/nfs/enfs_adapter.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      62 | struct enfs_adapter_ops *nfs_multipath_router_get(void)
         | ^
         | static 
>> fs/nfs/enfs_adapter.c:78:6: warning: no previous prototype for function 'nfs_multipath_router_put' [-Wmissing-prototypes]
      78 | void nfs_multipath_router_put(struct enfs_adapter_ops *ops)
         |      ^
   fs/nfs/enfs_adapter.c:78:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      78 | void nfs_multipath_router_put(struct enfs_adapter_ops *ops)
         | ^
         | static 
>> fs/nfs/enfs_adapter.c:84:6: warning: no previous prototype for function 'is_valid_option' [-Wmissing-prototypes]
      84 | bool is_valid_option(enum nfsmultipathoptions option)
         |      ^
   fs/nfs/enfs_adapter.c:84:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      84 | bool is_valid_option(enum nfsmultipathoptions option)
         | ^
         | static 
   3 warnings generated.
--
>> fs/nfs/enfs/enfs_config.c:554:6: warning: no previous prototype for function 'enfs_glob_match' [-Wmissing-prototypes]
     554 | bool enfs_glob_match(char const *pat, char const *str)
         |      ^
   fs/nfs/enfs/enfs_config.c:554:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     554 | bool enfs_glob_match(char const *pat, char const *str)
         | ^
         | static 
   1 warning generated.
--
>> fs/nfs/enfs/enfs_multipath_parse.c:24:6: warning: no previous prototype for function 'nfs_multipath_parse_ip_ipv6_add' [-Wmissing-prototypes]
      24 | void nfs_multipath_parse_ip_ipv6_add(struct sockaddr_in6 *sin6, int add_num)
         |      ^
   fs/nfs/enfs/enfs_multipath_parse.c:24:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      24 | void nfs_multipath_parse_ip_ipv6_add(struct sockaddr_in6 *sin6, int add_num)
         | ^
         | static 
   fs/nfs/enfs/enfs_multipath_parse.c:162:5: warning: no previous prototype for function 'enfs_parse_ip_single' [-Wmissing-prototypes]
     162 | int enfs_parse_ip_single(struct nfs_ip_list *ip_list, struct net *net_ns,
         |     ^
   fs/nfs/enfs/enfs_multipath_parse.c:162:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     162 | int enfs_parse_ip_single(struct nfs_ip_list *ip_list, struct net *net_ns,
         | ^
         | static 
   fs/nfs/enfs/enfs_multipath_parse.c:209:7: warning: no previous prototype for function 'nfs_multipath_parse_ip_list_get_cursor' [-Wmissing-prototypes]
     209 | char *nfs_multipath_parse_ip_list_get_cursor(char **buf_to_parse, bool *single)
         |       ^
   fs/nfs/enfs/enfs_multipath_parse.c:209:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     209 | char *nfs_multipath_parse_ip_list_get_cursor(char **buf_to_parse, bool *single)
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath_parse.c:236:6: warning: no previous prototype for function 'enfs_valid_ip' [-Wmissing-prototypes]
     236 | bool enfs_valid_ip(char *str, struct net *net)
         |      ^
   fs/nfs/enfs/enfs_multipath_parse.c:236:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     236 | bool enfs_valid_ip(char *str, struct net *net)
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath_parse.c:248:5: warning: no previous prototype for function 'nfs_multipath_parse_ip_list' [-Wmissing-prototypes]
     248 | int nfs_multipath_parse_ip_list(char *buffer, struct net *net_ns,
         |     ^
   fs/nfs/enfs/enfs_multipath_parse.c:248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     248 | int nfs_multipath_parse_ip_list(char *buffer, struct net *net_ns,
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath_parse.c:361:6: warning: no previous prototype for function 'isInvalidDns' [-Wmissing-prototypes]
     361 | bool isInvalidDns(char *cursor, struct net *net_ns)
         |      ^
   fs/nfs/enfs/enfs_multipath_parse.c:361:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     361 | bool isInvalidDns(char *cursor, struct net *net_ns)
         | ^
         | static 
   fs/nfs/enfs/enfs_multipath_parse.c:387:5: warning: no previous prototype for function 'nfs_multipath_parse_dns_list' [-Wmissing-prototypes]
     387 | int nfs_multipath_parse_dns_list(char *buffer, struct net *net_ns,
         |     ^
   fs/nfs/enfs/enfs_multipath_parse.c:387:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     387 | int nfs_multipath_parse_dns_list(char *buffer, struct net *net_ns,
         | ^
         | static 
   fs/nfs/enfs/enfs_multipath_parse.c:431:5: warning: no previous prototype for function 'parse_remote_type' [-Wmissing-prototypes]
     431 | int parse_remote_type(char *str, struct net *net)
         |     ^
   fs/nfs/enfs/enfs_multipath_parse.c:431:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     431 | int parse_remote_type(char *str, struct net *net)
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath_parse.c:471:5: warning: no previous prototype for function 'nfs_multipath_parse_options_check_ipv4_valid' [-Wmissing-prototypes]
     471 | int nfs_multipath_parse_options_check_ipv4_valid(struct sockaddr_in *addr)
         |     ^
   fs/nfs/enfs/enfs_multipath_parse.c:471:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     471 | int nfs_multipath_parse_options_check_ipv4_valid(struct sockaddr_in *addr)
         | ^
         | static 
   fs/nfs/enfs/enfs_multipath_parse.c:478:5: warning: no previous prototype for function 'nfs_multipath_parse_options_check_ipv6_valid' [-Wmissing-prototypes]
     478 | int nfs_multipath_parse_options_check_ipv6_valid(struct sockaddr_in6 *addr)
         |     ^
   fs/nfs/enfs/enfs_multipath_parse.c:478:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     478 | int nfs_multipath_parse_options_check_ipv6_valid(struct sockaddr_in6 *addr)
         | ^
         | static 
   fs/nfs/enfs/enfs_multipath_parse.c:494:5: warning: no previous prototype for function 'nfs_multipath_parse_options_check_ip_valid' [-Wmissing-prototypes]
     494 | int nfs_multipath_parse_options_check_ip_valid(struct sockaddr_storage *address)
         |     ^
   fs/nfs/enfs/enfs_multipath_parse.c:494:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     494 | int nfs_multipath_parse_options_check_ip_valid(struct sockaddr_storage *address)
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath_parse.c:510:5: warning: no previous prototype for function 'nfs_multipath_parse_options_check_valid' [-Wmissing-prototypes]
     510 | int nfs_multipath_parse_options_check_valid(
         |     ^
   fs/nfs/enfs/enfs_multipath_parse.c:510:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     510 | int nfs_multipath_parse_options_check_valid(
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath_parse.c:536:5: warning: no previous prototype for function 'nfs_multipath_parse_options_check_duplicate' [-Wmissing-prototypes]
     536 | int nfs_multipath_parse_options_check_duplicate(
         |     ^
   fs/nfs/enfs/enfs_multipath_parse.c:536:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     536 | int nfs_multipath_parse_options_check_duplicate(
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath_parse.c:562:5: warning: no previous prototype for function 'nfs_multipath_parse_options_check' [-Wmissing-prototypes]
     562 | int nfs_multipath_parse_options_check(struct multipath_mount_options *options)
         |     ^
   fs/nfs/enfs/enfs_multipath_parse.c:562:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     562 | int nfs_multipath_parse_options_check(struct multipath_mount_options *options)
         | ^
         | static 
   14 warnings generated.
--
>> fs/nfs/enfs/enfs_roundrobin.c:108:1: warning: no previous prototype for function 'enfs_lb_switch_find_first_active_xprt' [-Wmissing-prototypes]
     108 | enfs_lb_switch_find_first_active_xprt(struct rpc_xprt_switch *xps)
         | ^
   fs/nfs/enfs/enfs_roundrobin.c:107:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     107 | struct rpc_xprt *
         | ^
         | static 
>> fs/nfs/enfs/enfs_roundrobin.c:119:18: warning: no previous prototype for function 'enfs_lb_switch_get_main_xprt' [-Wmissing-prototypes]
     119 | struct rpc_xprt *enfs_lb_switch_get_main_xprt(struct rpc_xprt_switch *xps)
         |                  ^
   fs/nfs/enfs/enfs_roundrobin.c:119:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     119 | struct rpc_xprt *enfs_lb_switch_get_main_xprt(struct rpc_xprt_switch *xps)
         | ^
         | static 
   fs/nfs/enfs/enfs_roundrobin.c:169:18: warning: no previous prototype for function 'enfs_lb_get_singular_xprt' [-Wmissing-prototypes]
     169 | struct rpc_xprt *enfs_lb_get_singular_xprt(struct rpc_xprt_switch *xps,
         |                  ^
   fs/nfs/enfs/enfs_roundrobin.c:169:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     169 | struct rpc_xprt *enfs_lb_get_singular_xprt(struct rpc_xprt_switch *xps,
         | ^
         | static 
>> fs/nfs/enfs/enfs_roundrobin.c:332:5: warning: no previous prototype for function 'enfs_lb_revert_policy' [-Wmissing-prototypes]
     332 | int enfs_lb_revert_policy(struct rpc_clnt *clnt, void *data)
         |     ^
   fs/nfs/enfs/enfs_roundrobin.c:332:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     332 | int enfs_lb_revert_policy(struct rpc_clnt *clnt, void *data)
         | ^
         | static 
   4 warnings generated.
--
   fs/nfs/enfs/enfs_multipath.c:321:5: warning: no previous prototype for function 'enfs_configure_xprt_to_clnt' [-Wmissing-prototypes]
     321 | int enfs_configure_xprt_to_clnt(struct xprt_create *xprtargs,
         |     ^
   fs/nfs/enfs/enfs_multipath.c:321:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     321 | int enfs_configure_xprt_to_clnt(struct xprt_create *xprtargs,
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath.c:357:6: warning: no previous prototype for function 'enfs_cmp_addrs' [-Wmissing-prototypes]
     357 | bool enfs_cmp_addrs(struct sockaddr_storage *srcaddr,
         |      ^
   fs/nfs/enfs/enfs_multipath.c:357:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     357 | bool enfs_cmp_addrs(struct sockaddr_storage *srcaddr,
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath.c:374:6: warning: no previous prototype for function 'enfs_xprt_addrs_is_same' [-Wmissing-prototypes]
     374 | bool enfs_xprt_addrs_is_same(struct rpc_xprt *xprt,
         |      ^
   fs/nfs/enfs/enfs_multipath.c:374:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     374 | bool enfs_xprt_addrs_is_same(struct rpc_xprt *xprt,
         | ^
         | static 
   fs/nfs/enfs/enfs_multipath.c:393:6: warning: no previous prototype for function 'enfs_already_have_xprt' [-Wmissing-prototypes]
     393 | bool enfs_already_have_xprt(struct rpc_clnt *clnt,
         |      ^
   fs/nfs/enfs/enfs_multipath.c:393:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     393 | bool enfs_already_have_xprt(struct rpc_clnt *clnt,
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath.c:589:6: warning: variable 'link_count' set but not used [-Wunused-but-set-variable]
     589 |         int link_count = 0;
         |             ^
>> fs/nfs/enfs/enfs_multipath.c:836:5: warning: no previous prototype for function 'enfs_multipath_create_thread' [-Wmissing-prototypes]
     836 | int enfs_multipath_create_thread(void *data)
         |     ^
   fs/nfs/enfs/enfs_multipath.c:836:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     836 | int enfs_multipath_create_thread(void *data)
         | ^
         | static 
>> fs/nfs/enfs/enfs_multipath.c:932:6: warning: no previous prototype for function 'enfs_create_multi_xprt' [-Wmissing-prototypes]
     932 | void enfs_create_multi_xprt(struct rpc_create_args *args, struct rpc_clnt *clnt)
         |      ^
   fs/nfs/enfs/enfs_multipath.c:932:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     932 | void enfs_create_multi_xprt(struct rpc_create_args *args, struct rpc_clnt *clnt)
         | ^
         | static 
   fs/nfs/enfs/enfs_multipath.c:988:6: warning: no previous prototype for function 'enfs_release_rpc_clnt' [-Wmissing-prototypes]
     988 | void enfs_release_rpc_clnt(struct rpc_clnt *clnt)
         |      ^
   fs/nfs/enfs/enfs_multipath.c:988:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     988 | void enfs_release_rpc_clnt(struct rpc_clnt *clnt)
         | ^
         | static 
   8 warnings generated.
--
>> fs/nfs/enfs/enfs_proc.c:558:30: warning: unused variable 'shardview_proc_fops' [-Wunused-const-variable]
     558 | static const struct proc_ops shardview_proc_fops = {
         |                              ^~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> fs/nfs/enfs/enfs_remount.c:105:6: warning: no previous prototype for function 'enfs_clnt_delete_obsolete_xprts' [-Wmissing-prototypes]
     105 | void enfs_clnt_delete_obsolete_xprts(struct nfs_client *nfs_client,
         |      ^
   fs/nfs/enfs/enfs_remount.c:105:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     105 | void enfs_clnt_delete_obsolete_xprts(struct nfs_client *nfs_client,
         | ^
         | static 
   1 warning generated.
--
>> fs/nfs/enfs/pm_state.c:83:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      83 |         int ret;
         |             ^
   1 warning generated.
--
>> fs/nfs/enfs/enfs_rpc_init.c:7:5: warning: no previous prototype for function 'enfs_rpc_init' [-Wmissing-prototypes]
       7 | int enfs_rpc_init(void)
         |     ^
   fs/nfs/enfs/enfs_rpc_init.c:7:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       7 | int enfs_rpc_init(void)
         | ^
         | static 
   1 warning generated.
--
   fs/nfs/enfs/exten_call.c:60:5: warning: no previous prototype for function 'NfsExtendProcInfoExtendEncode' [-Wmissing-prototypes]
      60 | int NfsExtendProcInfoExtendEncode(char *pbuf, int buflen, struct enfs_extend3_args *pObj)
         |     ^
   fs/nfs/enfs/exten_call.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      60 | int NfsExtendProcInfoExtendEncode(char *pbuf, int buflen, struct enfs_extend3_args *pObj)
         | ^
         | static 
>> fs/nfs/enfs/exten_call.c:178:5: warning: no previous prototype for function 'NfsExtendDecodeFsShard' [-Wmissing-prototypes]
     178 | int NfsExtendDecodeFsShard(struct enfs_extend3_rsp **extend3ResOut, __be32 *p,
         |     ^
   fs/nfs/enfs/exten_call.c:178:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     178 | int NfsExtendDecodeFsShard(struct enfs_extend3_rsp **extend3ResOut, __be32 *p,
         | ^
         | static 
>> fs/nfs/enfs/exten_call.c:263:5: warning: no previous prototype for function 'NfsExtendDecodeLifInfo' [-Wmissing-prototypes]
     263 | int NfsExtendDecodeLifInfo(struct enfs_extend3_rsp **extend3ResOut, __be32 *p,
         |     ^
   fs/nfs/enfs/exten_call.c:263:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     263 | int NfsExtendDecodeLifInfo(struct enfs_extend3_rsp **extend3ResOut, __be32 *p,
         | ^
         | static 
   fs/nfs/enfs/exten_call.c:531:5: warning: no previous prototype for function 'EnfsExtendDecodePreCheck' [-Wmissing-prototypes]
     531 | int EnfsExtendDecodePreCheck(uint32_t version, uint32_t opCode)
         |     ^
   fs/nfs/enfs/exten_call.c:531:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     531 | int EnfsExtendDecodePreCheck(uint32_t version, uint32_t opCode)
         | ^
         | static 
   fs/nfs/enfs/exten_call.c:542:5: warning: no previous prototype for function 'NfsExtendProcInfoExtendDecode' [-Wmissing-prototypes]
     542 | int NfsExtendProcInfoExtendDecode(char *buf, uint32_t bufLen,
         |     ^
   fs/nfs/enfs/exten_call.c:542:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     542 | int NfsExtendProcInfoExtendDecode(char *buf, uint32_t bufLen,
         | ^
         | static 
   fs/nfs/enfs/exten_call.c:597:5: warning: no previous prototype for function 'dorado_extend_route' [-Wmissing-prototypes]
     597 | int dorado_extend_route(struct rpc_clnt *clnt, struct rpc_xprt *xprt, char *buf,
         |     ^
   fs/nfs/enfs/exten_call.c:597:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     597 | int dorado_extend_route(struct rpc_clnt *clnt, struct rpc_xprt *xprt, char *buf,
         | ^
         | static 
>> fs/nfs/enfs/exten_call.c:662:6: warning: no previous prototype for function 'nego_enfs_version' [-Wmissing-prototypes]
     662 | void nego_enfs_version(struct rpc_clnt *clnt, struct enfs_extend3_args *args)
         |      ^
   fs/nfs/enfs/exten_call.c:662:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     662 | void nego_enfs_version(struct rpc_clnt *clnt, struct enfs_extend3_args *args)
         | ^
         | static 
   fs/nfs/enfs/exten_call.c:955:6: warning: no previous prototype for function 'NfsExtendDnsQuerySetArgs' [-Wmissing-prototypes]
     955 | void NfsExtendDnsQuerySetArgs(struct enfs_extend3_args *args, uint32_t ip_type,
         |      ^
   fs/nfs/enfs/exten_call.c:955:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     955 | void NfsExtendDnsQuerySetArgs(struct enfs_extend3_args *args, uint32_t ip_type,
         | ^
         | static 
   fs/nfs/enfs/exten_call.c:966:6: warning: no previous prototype for function 'NfsExtendDnsQuerySetRes' [-Wmissing-prototypes]
     966 | void NfsExtendDnsQuerySetRes(struct enfs_extend3_rsp *extend3Res,
         |      ^
   fs/nfs/enfs/exten_call.c:966:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     966 | void NfsExtendDnsQuerySetRes(struct enfs_extend3_rsp *extend3Res,
         | ^
         | static 
   In file included from fs/nfs/enfs/exten_call.c:5:
   In file included from include/linux/string.h:294:
   include/linux/fortify-string.h:606:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     606 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   10 warnings generated.
..


vim +/enfs_glob_match +554 fs/nfs/enfs/enfs_config.c

   553	
 > 554	bool enfs_glob_match(char const *pat, char const *str)
   555	{
   556		unsigned char c;
   557		unsigned char d;
   558		char const *back_pat = NULL;
   559		char const *back_str = str;
   560		bool match = false;
   561		bool inverted = (*pat == '!');
   562		char const *class = pat + inverted;
   563		unsigned char a = *class++;
   564		unsigned char b = a;
   565	
   566		for (;;) {
   567			c = *str++;
   568			d = *pat++;
   569	
   570			switch (d) {
   571			case '?':
   572				if (c == '\0')
   573					return false;
   574				break;
   575			case '*':
   576				if (*pat == '\0')
   577					return true;
   578				back_pat = pat;
   579				back_str = --str;
   580				break;
   581			case '[': {
   582				match = false;
   583				inverted = (*pat == '!');
   584				class = pat + inverted;
   585				a = *class++;
   586	
   587				do {
   588					b = a;
   589					if (a == '\0')
   590						goto literal;
   591	
   592					if (class[0] == '-' && class[1] != ']') {
   593						b = class[1];
   594	
   595						if (b == '\0')
   596							goto literal;
   597	
   598						class += 2;
   599					}
   600					match |= (a <= c && c <= b);
   601				} while ((a = *class++) != ']');
   602	
   603				if (match == inverted)
   604					goto backtrack;
   605				pat = class;
   606				}
   607				break;
   608	
   609			case '\\':
   610				d = *pat++;
   611				break;
   612			default:
   613	literal:
   614				if (c == d) {
   615					if (d == '\0')
   616						return true;
   617					break;
   618				}
   619	backtrack:
   620				if (c == '\0' || !back_pat)
   621					return false;
   622				pat = back_pat;
   623				str = ++back_str;
   624				break;
   625			}
   626		}
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
