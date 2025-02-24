Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62CC16F0FE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 01:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740361400; cv=none; b=YUdRdCPTSIqM8nnpwmaQno908Z4k2PcNZYADpyfcCkgJSQeowwAXdJCTbjlRQMG1N7ZbgoMYOPdXPmy4tfcR20lsssaU4kuP579OA759w7OBvsNEiFjIBTo7D4xvG973SyJ08XmMv1I7K61MYYveCLD0hZMZY/pWTPFy+kgHnV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740361400; c=relaxed/simple;
	bh=GxSnply1tk2hlLN5iVMTINXKk9aadl4NifU2t0YwfC8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IduNwipoJ5G17XFNt4tCAWGOSlVMcwZbqXACUzjfPN82bqn/bdcXkgr8OEnOCVriBFOPYy5OTwW1hvPvGiIul83cE5JN/gG2hbOaGVh1cAUhCA48b6DIPhCReKav7jiY0dlkjWIxvZAOeJ07LEsHcKRvFKwYEoxYTf3vUiac8XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS57aPDK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS57aPDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740361398; x=1771897398;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GxSnply1tk2hlLN5iVMTINXKk9aadl4NifU2t0YwfC8=;
  b=WS57aPDK8WeebQCJ9OV9EzFWsrOCqLdFVKcFSQ57fs+C3Mn1Rqm7lK9j
   G3EORsU+gmS72T6c0yGBRz7jCjg3MO4wq/N3DEyzF6/Ew4RxGbXWYeaZn
   3U3N2vaRT/fozDP6R6WNwVsTrz3f6BnJzCT49dlVY2W4IXBaiRRJiimzY
   6Jg/X2qfpLZqpV5W3NbU4FSB0HURJa9o6SqK6ZOF+et5LdbqLdE0Oujb5
   6VQx0tJsjeCQZvMZJpBsjJeVR6MECsghPIbUhzd0NeqFE7Km8OfQsE/jx
   zDtRwHVkLg6BjCi7da2ENiWhuJwIbcn61eahmBdVtNrGhT9PDZ9b/ktu5
   g==;
X-CSE-ConnectionGUID: 4fM/TWQcT7WDchDnMNP8Ng==
X-CSE-MsgGUID: U1ok6nVXSpKtw6zqc13G1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="40293803"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="40293803"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 17:43:17 -0800
X-CSE-ConnectionGUID: 9w5hXjpfTXu5KkAMHg0fQQ==
X-CSE-MsgGUID: b4qn878FR+a5xtsp2P650g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115892944"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Feb 2025 17:43:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmNV3-0007jD-2p
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 01:43:13 +0000
Date: Mon, 24 Feb 2025 09:42:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/67 1/1] include/linux/rculist.h:511:20: warning: array
 subscript <unknown> is outside array bounds of 'struct hlist_head[0]'
Message-ID: <202502240921.02YKw0bH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/67
head:   d4d762eeb80852805ab03951a26b1625f7702e74
commit: 131e135f7fd14b1de7a5eb26631076705c18073f [1/1] arm64: instrument smp_{load_acquire,store_release}
config: arm64-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250224/202502240921.02YKw0bH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502240921.02YKw0bH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502240921.02YKw0bH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/xt_hashlimit.c: In function 'htable_create':
   net/netfilter/xt_hashlimit.c:275:38: warning: variable 'ops' set but not used [-Wunused-but-set-variable]
     275 |         const struct seq_operations *ops;
         |                                      ^~~
   In file included from net/netfilter/xt_hashlimit.c:31:
   In function 'net_generic',
       inlined from 'hashlimit_pernet' at net/netfilter/xt_hashlimit.c:56:9,
       inlined from 'htable_find_get' at net/netfilter/xt_hashlimit.c:426:40:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'htable_find_get':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~
   In function 'net_generic',
       inlined from 'hashlimit_pernet' at net/netfilter/xt_hashlimit.c:56:9,
       inlined from 'hashlimit_net_init' at net/netfilter/xt_hashlimit.c:1277:40:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'hashlimit_net_init':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~
   In function 'net_generic',
       inlined from 'hashlimit_pernet' at net/netfilter/xt_hashlimit.c:56:9,
       inlined from 'hashlimit_proc_net_init' at net/netfilter/xt_hashlimit.c:1238:40,
       inlined from 'hashlimit_net_init' at net/netfilter/xt_hashlimit.c:1280:9:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'hashlimit_net_init':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~
   In function 'net_generic',
       inlined from 'hashlimit_pernet' at net/netfilter/xt_hashlimit.c:56:9,
       inlined from 'hashlimit_proc_net_exit' at net/netfilter/xt_hashlimit.c:1256:40:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'hashlimit_proc_net_exit':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~
   In file included from include/linux/module.h:9,
                    from net/netfilter/xt_hashlimit.c:12:
   net/netfilter/xt_hashlimit.c: In function 'htable_create.isra':
   include/linux/list.h:691:36: warning: array subscript i is outside array bounds of 'struct hlist_head[0]' [-Warray-bounds=]
     691 | #define INIT_HLIST_HEAD(ptr) ((ptr)->first = NULL)
         |                                    ^~
   net/netfilter/xt_hashlimit.c:311:17: note: in expansion of macro 'INIT_HLIST_HEAD'
     311 |                 INIT_HLIST_HEAD(&hinfo->hash[i]);
         |                 ^~~~~~~~~~~~~~~
   net/netfilter/xt_hashlimit.c:128:27: note: while referencing 'hash'
     128 |         struct hlist_head hash[0];      /* hashtable itself */
         |                           ^~~~
   net/netfilter/xt_hashlimit.c: In function 'dsthash_find':
   net/netfilter/xt_hashlimit.c:198:14: warning: array subscript hash is outside array bounds of 'const struct hlist_head[0]' [-Warray-bounds=]
     198 |         if (!hlist_empty(&ht->hash[hash])) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_hashlimit.c:128:27: note: while referencing 'hash'
     128 |         struct hlist_head hash[0];      /* hashtable itself */
         |                           ^~~~
   In function 'dsthash_alloc_init',
       inlined from 'hashlimit_mt_common' at net/netfilter/xt_hashlimit.c:754:8:
   net/netfilter/xt_hashlimit.c:245:57: warning: array subscript <unknown> is outside array bounds of 'struct hlist_head[0]' [-Warray-bounds=]
     245 |                 hlist_add_head_rcu(&ent->node, &ht->hash[hash_dst(ht, dst)]);
         |                                                 ~~~~~~~~^~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_hashlimit.c: In function 'hashlimit_mt_common':
   net/netfilter/xt_hashlimit.c:128:27: note: while referencing 'hash'
     128 |         struct hlist_head hash[0];      /* hashtable itself */
         |                           ^~~~
   In file included from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arm64/include/asm/compat.h:25,
                    from arch/arm64/include/asm/stat.h:24,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:10:
   In function 'hlist_add_head_rcu',
       inlined from 'dsthash_alloc_init' at net/netfilter/xt_hashlimit.c:245:3,
       inlined from 'hashlimit_mt_common' at net/netfilter/xt_hashlimit.c:754:8:
>> include/linux/rculist.h:511:20: warning: array subscript <unknown> is outside array bounds of 'struct hlist_head[0]' [-Warray-bounds=]
     511 |         n->pprev = &h->first;
         |                    ^~~~~~~~~
   net/netfilter/xt_hashlimit.c: In function 'hashlimit_mt_common':
   net/netfilter/xt_hashlimit.c:128:27: note: while referencing 'hash'
     128 |         struct hlist_head hash[0];      /* hashtable itself */
         |                           ^~~~
   In function 'htable_selective_cleanup',
       inlined from 'htable_destroy' at net/netfilter/xt_hashlimit.c:417:2,
       inlined from 'htable_put' at net/netfilter/xt_hashlimit.c:444:3:
   include/linux/list.h:850:43: warning: array subscript i is outside array bounds of 'struct hlist_head[0]' [-Warray-bounds=]
     850 |         for (pos = hlist_entry_safe((head)->first, typeof(*pos), member);\
         |                                           ^~
   include/linux/list.h:808:35: note: in definition of macro 'hlist_entry_safe'
     808 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                                   ^~~
   net/netfilter/xt_hashlimit.c:378:17: note: in expansion of macro 'hlist_for_each_entry_safe'
     378 |                 hlist_for_each_entry_safe(dh, n, &ht->hash[i], node) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/xt_hashlimit.c: In function 'htable_put':
   net/netfilter/xt_hashlimit.c:128:27: note: while referencing 'hash'
     128 |         struct hlist_head hash[0];      /* hashtable itself */
         |                           ^~~~


vim +511 include/linux/rculist.h

67bdbffd696f29 Arnd Bergmann  2010-02-25  485  
82524746c27fa4 Franck Bui-Huu 2008-05-12  486  /**
82524746c27fa4 Franck Bui-Huu 2008-05-12  487   * hlist_add_head_rcu
82524746c27fa4 Franck Bui-Huu 2008-05-12  488   * @n: the element to add to the hash list.
82524746c27fa4 Franck Bui-Huu 2008-05-12  489   * @h: the list to add to.
82524746c27fa4 Franck Bui-Huu 2008-05-12  490   *
82524746c27fa4 Franck Bui-Huu 2008-05-12  491   * Description:
82524746c27fa4 Franck Bui-Huu 2008-05-12  492   * Adds the specified element to the specified hlist,
82524746c27fa4 Franck Bui-Huu 2008-05-12  493   * while permitting racing traversals.
82524746c27fa4 Franck Bui-Huu 2008-05-12  494   *
82524746c27fa4 Franck Bui-Huu 2008-05-12  495   * The caller must take whatever precautions are necessary
82524746c27fa4 Franck Bui-Huu 2008-05-12  496   * (such as holding appropriate locks) to avoid racing
82524746c27fa4 Franck Bui-Huu 2008-05-12  497   * with another list-mutation primitive, such as hlist_add_head_rcu()
82524746c27fa4 Franck Bui-Huu 2008-05-12  498   * or hlist_del_rcu(), running on this same list.
82524746c27fa4 Franck Bui-Huu 2008-05-12  499   * However, it is perfectly legal to run concurrently with
82524746c27fa4 Franck Bui-Huu 2008-05-12  500   * the _rcu list-traversal primitives, such as
82524746c27fa4 Franck Bui-Huu 2008-05-12  501   * hlist_for_each_entry_rcu(), used to prevent memory-consistency
82524746c27fa4 Franck Bui-Huu 2008-05-12  502   * problems on Alpha CPUs.  Regardless of the type of CPU, the
82524746c27fa4 Franck Bui-Huu 2008-05-12  503   * list-traversal primitive must be guarded by rcu_read_lock().
82524746c27fa4 Franck Bui-Huu 2008-05-12  504   */
82524746c27fa4 Franck Bui-Huu 2008-05-12  505  static inline void hlist_add_head_rcu(struct hlist_node *n,
82524746c27fa4 Franck Bui-Huu 2008-05-12  506  					struct hlist_head *h)
82524746c27fa4 Franck Bui-Huu 2008-05-12  507  {
82524746c27fa4 Franck Bui-Huu 2008-05-12  508  	struct hlist_node *first = h->first;
10aa9d2cf98787 Franck Bui-Huu 2008-05-12  509  
82524746c27fa4 Franck Bui-Huu 2008-05-12  510  	n->next = first;
82524746c27fa4 Franck Bui-Huu 2008-05-12 @511  	n->pprev = &h->first;
67bdbffd696f29 Arnd Bergmann  2010-02-25  512  	rcu_assign_pointer(hlist_first_rcu(h), n);
82524746c27fa4 Franck Bui-Huu 2008-05-12  513  	if (first)
82524746c27fa4 Franck Bui-Huu 2008-05-12  514  		first->pprev = &n->next;
82524746c27fa4 Franck Bui-Huu 2008-05-12  515  }
82524746c27fa4 Franck Bui-Huu 2008-05-12  516  

:::::: The code at line 511 was first introduced by commit
:::::: 82524746c27fa418c250a56dd7606b9d3fc79826 rcu: split list.h and move rcu-protected lists into rculist.h

:::::: TO: Franck Bui-Huu <fbuihuu@gmail.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
