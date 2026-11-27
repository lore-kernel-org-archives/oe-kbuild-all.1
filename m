Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758617;
	b=OcINm/sJ2haoTrZep7p6mjGOTR81gHuCzG2snk3D08asgMrHZw15Jz6TfOCYj73ybMx1
	 tKNoqGJqbkHdeF9arrq9n6W7umROPasuhJGqK76LDMr3Duu+nAZLix+ouwbQ892KAdQZD
	 jY8LKp89mbc1H2UbcwL6OYZd1YGpEpLaiiY/Ti1+aECAHIWOeup1AwDi6/XQU7xakThx3
	 LFU5U9zronILNOk8yY7jx5bimm16BsBVALV7u7V3iJnaPZyxP57lcdV9vTlA2bMez7+u0
	 9C+k90VBHvDeLAohr0J6zy+3f21xHb8p1n10F4SEZkKTNvPh8gY9Lfu5FKeS8871N+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758617;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=nGNNbozTvKpjitImMIIB/LM1+rTpEKMM7E+fi4H/A4U=;
	b=XNlG7Kqy5ERqXr7eXxtP8t/fQiyVGMn1ifYq5MdotPOcDMzXIYVqAUZoo6GNyCEvUtQC
	 Y2okk/p4BjbiBuCOYdVG+szbhP0jIfF996LC4kaqj48OrX356b6eiCusObmg0t3ELIvWK
	 0Zz2Ho4lyiPavRFE0f+gnz2lbjD7Hw1yOu6ctYxJkMA1miVfpMUO+jiNrxYqOqgUeZssk
	 dz7J+CtLgmblgjjlGg1NfKfqWpC57JAWbR2JHrWPaKBYwgeT/EPTV0ljB/qIFCIfVuX4h
	 4kGBBXi7FoctuB4cGhR8wUwQD1LRSCtPXB0o6t0nd8QJ2BL6J4mrv5uSfHOl4JSqkWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NjgQcokv;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA078606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 05:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA078606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NjgQcokv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795758617; x=1827294617;
  h=date:from:to:cc:subject:message-id;
  bh=tQGAJBFhJM7NzlLf413oyddhUkB0Lt7Eo1syH/qURSM=;
  b=NjgQcokv2gMk+w0q6ggCDNYr6aVJbcc6oeZEx3vj9JsTxSItaNl1YYEh
   qBb8DoAAE445cdamTSmzfMev97v0HPQUclSNXU7bOTnF16MeEne3nyM16
   sXIDtSZCQ9TUsxvgO9FSoQBkjWRgzhx8OpsZ7gg8C/reP+9qAQEU2rvMm
   oBGb1Vr+KWdlUEo/94ckSWNIBgEh5SQdFM100cobrnPP0N5+RKzxBfzP1
   nhpUAGnIE1h2r0eS1L898bUhJIDfUqfnlMREsShgRE6YP+z5wSbJZFegs
   AVVMS2MNIkk8/u2CF/nM2J0ZRiglVxtnADpnl187ixSSkgPXf4C2TxMuL
   A==;
X-CSE-ConnectionGUID: fapLyoh+Qwi6dnCkA/3QNg==
X-CSE-MsgGUID: R54oJN7bTP2Oia8iQXiE6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4656248"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4656248"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 21:50:17 -0800
X-CSE-ConnectionGUID: 742qckrYTmmfx61OBwEaJw==
X-CSE-MsgGUID: Q5wvcRz5THyZdRs3lVRI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12105573"
Received: from igk-lkp-server01.igk.intel.com (HELO cbd2aa73d023) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2026 21:50:14 -0800
Received: from kbuild by cbd2aa73d023 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWoqS-00000000023-2WnP;
	Fri, 27 Nov 2026 05:50:04 +0000
Date: Fri, 27 Nov 2026 06:49:11 +0100
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, Yury Norov <ynorov@nvidia.com>
Subject: [trace:trace/for-next 4/15] include/linux/kasan.h:202:43:
 error: use of undeclared identifier '_RET_IP_'
Message-ID: <20261127050911.yRUv13dj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   1e443753bfddcd9d34bfb672be26245c4deca2d0
commit: 4b9cae768eff5f92c9383738e8bff21fd3cc3eb6 [4/15] tracing: Remove trace_printk.h from kernel.h
config: arm64-randconfig-r2309-20261126 (https://download.01.org/0day-ci/archive/20261127/20261127050911.yRUv13dj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3a9f981aab0cc32f74ffac36a87891cda8889c37)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127050911.yRUv13dj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127050911.yRUv13dj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/scs.c:9:
>> include/linux/kasan.h:202:43: error: use of undeclared identifier '_RET_IP_'
     202 |                 return __kasan_slab_pre_free(s, object, _RET_IP_,
         |                                                         ^~~~~~~~
   include/linux/kasan.h:248:28: error: use of undeclared identifier '_RET_IP_'
     248 |                 __kasan_kfree_large(ptr, _RET_IP_);
         |                                          ^~~~~~~~
   include/linux/kasan.h:313:52: error: use of undeclared identifier '_RET_IP_'
     313 |                 return __kasan_mempool_poison_pages(page, order, _RET_IP_);
         |                                                                  ^~~~~~~~
   include/linux/kasan.h:335:47: error: use of undeclared identifier '_RET_IP_'
     335 |                 __kasan_mempool_unpoison_pages(page, order, _RET_IP_);
         |                                                             ^~~~~~~~
   include/linux/kasan.h:367:45: error: use of undeclared identifier '_RET_IP_'
     367 |                 return __kasan_mempool_poison_object(ptr, _RET_IP_);
         |                                                           ^~~~~~~~
   include/linux/kasan.h:395:46: error: use of undeclared identifier '_RET_IP_'
     395 |                 __kasan_mempool_unpoison_object(ptr, size, _RET_IP_);
         |                                                            ^~~~~~~~
   include/linux/kasan.h:406:35: error: use of undeclared identifier '_RET_IP_'
     406 |                 return __kasan_check_byte(addr, _RET_IP_);
         |                                                 ^~~~~~~~
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scs.c:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^


vim +/_RET_IP_ +202 include/linux/kasan.h

34303244f2615ad Andrey Konovalov  2020-12-22  181  
b3c34245756adad Jann Horn         2024-08-09  182  bool __kasan_slab_pre_free(struct kmem_cache *s, void *object,
e212c463eee96b2 Kuniyuki Iwashima 2026-10-28  183  			   unsigned long ip, bool after_rcu_delay);
b3c34245756adad Jann Horn         2024-08-09  184  /**
b3c34245756adad Jann Horn         2024-08-09  185   * kasan_slab_pre_free - Check whether freeing a slab object is safe.
e212c463eee96b2 Kuniyuki Iwashima 2026-10-28  186   * @s: Cache the object belongs to.
b3c34245756adad Jann Horn         2024-08-09  187   * @object: Object to be freed.
e212c463eee96b2 Kuniyuki Iwashima 2026-10-28  188   * @after_rcu_delay: Whether the free follows an RCU grace period.
b3c34245756adad Jann Horn         2024-08-09  189   *
b3c34245756adad Jann Horn         2024-08-09  190   * This function checks whether freeing the given object is safe. It may
b3c34245756adad Jann Horn         2024-08-09  191   * check for double-free and invalid-free bugs and report them.
b3c34245756adad Jann Horn         2024-08-09  192   *
b3c34245756adad Jann Horn         2024-08-09  193   * This function is intended only for use by the slab allocator.
b3c34245756adad Jann Horn         2024-08-09  194   *
b3c34245756adad Jann Horn         2024-08-09  195   * @Return true if freeing the object is unsafe; false otherwise.
b3c34245756adad Jann Horn         2024-08-09  196   */
b3c34245756adad Jann Horn         2024-08-09  197  static __always_inline bool kasan_slab_pre_free(struct kmem_cache *s,
e212c463eee96b2 Kuniyuki Iwashima 2026-10-28  198  						void *object,
e212c463eee96b2 Kuniyuki Iwashima 2026-10-28  199  						bool after_rcu_delay)
b3c34245756adad Jann Horn         2024-08-09  200  {
b3c34245756adad Jann Horn         2024-08-09  201  	if (kasan_enabled())
e212c463eee96b2 Kuniyuki Iwashima 2026-10-28 @202  		return __kasan_slab_pre_free(s, object, _RET_IP_,
e212c463eee96b2 Kuniyuki Iwashima 2026-10-28  203  					     after_rcu_delay);
b3c34245756adad Jann Horn         2024-08-09  204  	return false;
b3c34245756adad Jann Horn         2024-08-09  205  }
b3c34245756adad Jann Horn         2024-08-09  206  

:::::: The code at line 202 was first introduced by commit
:::::: e212c463eee96b2568d8c85ca4ee63049dbb18f2 mm/kasan: detect double-free involving kfree_rcu_sheaf()

:::::: TO: Kuniyuki Iwashima <kuniyu@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
