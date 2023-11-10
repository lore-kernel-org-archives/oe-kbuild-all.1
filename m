Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31413AC2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 20:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+6stdoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699646686; x=1731182686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JvXXiA4W2+8/eHrb9OSfk9rF+e96Eb+Hl6I4yyTLqqY=;
  b=L+6stdoZqQHaMolOdP7sCzCat5WkGNC2TXHQMr9LESN3F9SiB3mvW/hh
   Txuss6EgPEHm+IPYbFdN2VaFcFc5oqKFsClN/+BTqc73OJje1Rrf1iKYd
   P5d/bdpp8dm/bSSbN/1CUzjgZVsatLlvmUhQKIsSx+p/TZO7TlsI3EMMp
   bPwhqhfoi0vF3NqM9s4kPRS9XCiJxoGgi5Ya33I/b/jrXZyV+gH0IhGr+
   Oll8I8Q8ZWKLIJVlY28T+ce/CHgSFky/w49evtl+zxkn5ZNuo9xNUZSpd
   uf1JFEvcXE9UiKGnBMT8ty+bEzphe5IdkUarRhgm+TfgIbM8ULgUIlD/y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394133176"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="394133176"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 12:04:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="757282894"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="757282894"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Nov 2023 12:04:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Xk7-0009rm-0S;
	Fri, 10 Nov 2023 20:04:39 +0000
Date: Sat, 11 Nov 2023 04:03:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 4167/30000]
 kernel/trace/ftrace.c:6781:6: sparse: sparse: symbol
 'ftrace_graph_return_stub' was not declared. Should it be static?
Message-ID: <202311110319.xPmUZYBj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   c666f11f2e581c5d527e46130cf771208b5d1367
commit: b4a47b3387c7e24a60d7f732f5dc7ca5f2e96645 [4167/30000] ANDROID: ftrace: fix function type mismatches
config: x86_64-randconfig-121-20231012 (https://download.01.org/0day-ci/archive/20231111/202311110319.xPmUZYBj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110319.xPmUZYBj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110319.xPmUZYBj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/ftrace.c:1679:22: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:1680:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *other_hash @@     got struct ftrace_hash [noderef] <asn:4> *notrace_hash @@
   kernel/trace/ftrace.c:1680:28: sparse:     expected struct ftrace_hash *other_hash
   kernel/trace/ftrace.c:1680:28: sparse:     got struct ftrace_hash [noderef] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:1685:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *notrace_hash @@
   kernel/trace/ftrace.c:1685:22: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1685:22: sparse:     got struct ftrace_hash [noderef] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:1686:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *other_hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:1686:28: sparse:     expected struct ftrace_hash *other_hash
   kernel/trace/ftrace.c:1686:28: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:1937:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:1937:50: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1937:50: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:1948:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:1948:50: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1948:50: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:3022:24: sparse: sparse: Using plain integer as NULL pointer
   kernel/trace/ftrace.c:3114:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:3114:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3114:14: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:3123:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:3123:22: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3123:22: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:3575:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *notrace_hash @@
   kernel/trace/ftrace.c:3575:22: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3575:22: sparse:     got struct ftrace_hash [noderef] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:3578:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:3578:22: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3578:22: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:3942:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] <asn:4> ** @@
   kernel/trace/ftrace.c:3942:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:3942:27: sparse:     got struct ftrace_hash [noderef] <asn:4> **
   kernel/trace/ftrace.c:3944:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] <asn:4> ** @@
   kernel/trace/ftrace.c:3944:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:3944:27: sparse:     got struct ftrace_hash [noderef] <asn:4> **
   kernel/trace/ftrace.c:4309:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] <asn:4> ** @@
   kernel/trace/ftrace.c:4309:19: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:4309:19: sparse:     got struct ftrace_hash [noderef] <asn:4> **
   kernel/trace/ftrace.c:4446:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] <asn:4> ** @@
   kernel/trace/ftrace.c:4446:19: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:4446:19: sparse:     got struct ftrace_hash [noderef] <asn:4> **
   kernel/trace/ftrace.c:4452:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] <asn:4> *filter_hash @@     got struct ftrace_hash *[assigned] old_hash @@
   kernel/trace/ftrace.c:4452:34: sparse:     expected struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:4452:34: sparse:     got struct ftrace_hash *[assigned] old_hash
   kernel/trace/ftrace.c:4704:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] <asn:4> ** @@
   kernel/trace/ftrace.c:4704:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:4704:27: sparse:     got struct ftrace_hash [noderef] <asn:4> **
   kernel/trace/ftrace.c:4706:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] <asn:4> ** @@
   kernel/trace/ftrace.c:4706:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:4706:27: sparse:     got struct ftrace_hash [noderef] <asn:4> **
   kernel/trace/ftrace.c:4743:37: sparse: sparse: Using plain integer as NULL pointer
   kernel/trace/ftrace.c:4990:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] <asn:4> ** @@
   kernel/trace/ftrace.c:4990:35: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:4990:35: sparse:     got struct ftrace_hash [noderef] <asn:4> **
   kernel/trace/ftrace.c:4994:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] <asn:4> ** @@
   kernel/trace/ftrace.c:4994:35: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:4994:35: sparse:     got struct ftrace_hash [noderef] <asn:4> **
   kernel/trace/ftrace.c:5111:29: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:5111:29: sparse:    struct ftrace_hash [noderef] <asn:4> *
   kernel/trace/ftrace.c:5111:29: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5114:29: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:5114:29: sparse:    struct ftrace_hash [noderef] <asn:4> *
   kernel/trace/ftrace.c:5114:29: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5228:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:5228:21: sparse:    struct ftrace_hash [noderef] <asn:4> *
   kernel/trace/ftrace.c:5228:21: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5256:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:5256:21: sparse:    struct ftrace_hash [noderef] <asn:4> *
   kernel/trace/ftrace.c:5256:21: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5307:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:5307:36: sparse:    struct ftrace_hash [noderef] <asn:4> *
   kernel/trace/ftrace.c:5307:36: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5311:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:5311:36: sparse:    struct ftrace_hash [noderef] <asn:4> *
   kernel/trace/ftrace.c:5311:36: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5631:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] <asn:4> *static [addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:5631:18: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:5631:18: sparse:     got struct ftrace_ops [noderef] <asn:4> *static [addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:5631:66: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] <asn:4> *next @@
   kernel/trace/ftrace.c:5631:66: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:5631:66: sparse:     got struct ftrace_ops [noderef] <asn:4> *next
   kernel/trace/ftrace.c:5672:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:5672:59: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:5672:59: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:5673:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *notrace_hash @@
   kernel/trace/ftrace.c:5673:59: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:5673:59: sparse:     got struct ftrace_hash [noderef] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:6030:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:6030:62: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:6030:62: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:6031:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *notrace_hash @@
   kernel/trace/ftrace.c:6031:62: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:6031:62: sparse:     got struct ftrace_hash [noderef] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:6077:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:6077:36: sparse:    struct ftrace_ops [noderef] <asn:4> *
   kernel/trace/ftrace.c:6077:36: sparse:    struct ftrace_ops *
>> kernel/trace/ftrace.c:6781:6: sparse: sparse: symbol 'ftrace_graph_return_stub' was not declared. Should it be static?
   kernel/trace/ftrace.c:237:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:237:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:237:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:2909:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:2909:46: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:2909:46: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:2910:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:2910:47: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:2910:47: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:2914:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *notrace_hash @@
   kernel/trace/ftrace.c:2914:44: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:2914:44: sparse:     got struct ftrace_hash [noderef] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:2886:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *filter_hash @@
   kernel/trace/ftrace.c:2886:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:2886:48: sparse:     got struct ftrace_hash [noderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:2887:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] <asn:4> *notrace_hash @@
   kernel/trace/ftrace.c:2887:49: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:2887:49: sparse:     got struct ftrace_hash [noderef] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:2663:13: warning: no previous prototype for 'arch_ftrace_trampoline_free' [-Wmissing-prototypes]
    2663 | void __weak arch_ftrace_trampoline_free(struct ftrace_ops *ops)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:3418:1: warning: no previous prototype for 'arch_ftrace_trampoline_func' [-Wmissing-prototypes]
    3418 | arch_ftrace_trampoline_func(struct ftrace_ops *ops, struct dyn_ftrace *rec)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:3656:15: warning: no previous prototype for 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
    3656 | char * __weak arch_ftrace_match_adjust(char *str, const char *search)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'process_mod_list':
   kernel/trace/ftrace.c:3937:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    3937 |         int ret;
         |             ^~~
   kernel/trace/ftrace.c: In function 'ftrace_regex_release':
   kernel/trace/ftrace.c:4969:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    4969 |         int ret;
         |             ^~~
   kernel/trace/ftrace.c: At top level:
   kernel/trace/ftrace.c:6166:13: warning: no previous prototype for 'arch_ftrace_update_trampoline' [-Wmissing-prototypes]
    6166 | void __weak arch_ftrace_update_trampoline(struct ftrace_ops *ops)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6781:6: warning: no previous prototype for 'ftrace_graph_return_stub' [-Wmissing-prototypes]
    6781 | void ftrace_graph_return_stub(struct ftrace_graph_ret *trace)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6785:5: warning: no previous prototype for 'ftrace_graph_entry_stub' [-Wmissing-prototypes]
    6785 | int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4758: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4758: warning: Function parameter or member 'ip' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4758: warning: Function parameter or member 'remove' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4758: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4772: warning: Function parameter or member 'ops' not described in 'ftrace_ops_set_global_filter'
   kernel/trace/ftrace.c:4800: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4800: warning: Function parameter or member 'buf' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4800: warning: Function parameter or member 'len' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4800: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4819: warning: Function parameter or member 'ops' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4819: warning: Function parameter or member 'buf' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4819: warning: Function parameter or member 'len' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4819: warning: Function parameter or member 'reset' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4834: warning: Function parameter or member 'buf' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:4834: warning: Function parameter or member 'len' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:4834: warning: Function parameter or member 'reset' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:4850: warning: Function parameter or member 'buf' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:4850: warning: Function parameter or member 'len' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:4850: warning: Function parameter or member 'reset' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:6683: warning: Function parameter or member 'ops' not described in 'register_ftrace_function'
   kernel/trace/ftrace.c:6705: warning: Function parameter or member 'ops' not described in 'unregister_ftrace_function'
   kernel/trace/ftrace.o: warning: objtool: __add_hash_entry()+0x18f: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: t_probe_next()+0x1f3: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: __g_next()+0x212: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: alloc_ftrace_hash()+0x63: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_allocate_pages()+0x23: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: hash_contains_ip()+0x4e6: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: clear_mod_from_hash()+0x32c: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: clear_func_from_hash()+0x282: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: fpid_stop()+0x35: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_find_tramp_ops_any()+0x138: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_find_tramp_ops_next()+0x89: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: update_function_graph_func()+0xcd: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_pid_follow_sched_process_exit()+0x67: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_pid_follow_sched_process_fork()+0x6c: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: clear_ftrace_pids()+0x3e: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_filter_pid_sched_switch_probe()+0x6a: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ignore_task_cpu()+0x3a: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: fpid_next()+0x95: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: fpid_start()+0x106: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: g_start()+0x2d9: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: update_ftrace_function()+0xaa: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_graph_probe_sched_switch()+0x2f: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: __unregister_ftrace_function()+0x1b7: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: free_ftrace_hash.part.0()+0x46: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_ops_list_func()+0x21c: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: __ftrace_hash_move()+0x158: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: alloc_and_copy_ftrace_hash.constprop.0()+0xf3: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_graph_open()+0xac: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_graph_notrace_open()+0xac: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_ops_trampoline()+0x121: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_lookup_ip()+0x23d: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: referenced_filters()+0x4ee: sibling call from callable instruction with modified stack frame
   kernel/trace/ftrace.o: warning: objtool: ftrace_hash_rec_update_modify()+0x162: sibling call from callable instruction with modified stack frame

vim +/ftrace_graph_return_stub +6781 kernel/trace/ftrace.c

  6780	
> 6781	void ftrace_graph_return_stub(struct ftrace_graph_ret *trace)
  6782	{
  6783	}
  6784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
