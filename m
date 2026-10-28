Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793177682;
	b=GO4L3LXWzVeWvf7HiPFp+Hc9d0br+De6yR0TLfEIXyGfvaTCCrM27+zaeXT7kzjs8HTN
	 x6fb/J/kj6apPBHJwW1iN4cN3w+GCxl+ng3cVZcU7vK17/zpC1ZmoqSvEYHqBX1/yAaC6
	 PYJIuY3hPgT/0HdpasojcVaUt5EVz0TZssGWsxtGJW3DdSXPB5eLAt1RjgElBBzf6rxFI
	 LVvliBrWSRUhYokcEYi80kZDDctT0GhMoWhxMxKP3k1oqnFGz0U/FcnwuLc61968O0JFE
	 i1XFOdpdoM2Gp09gk13zCm3DGUBY3vJ9WLkAQvX2V6FCA6p/Qc8+q6KE1L4ecNaIVqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177682;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gEQLM3BO8Qnm0JXILmE2cvCVPA0ymaK0AV4QZ6roTFQ=;
	b=2Jvh7rj/uhfGeLGIWyWz4FjNqyTc3bGNe9rz9BbeTkuzKaHiiw2OmtDzfcDbPlCfhKO6
	 6/ouA3VH34N7/je4b/SXBjzr1KCshmrfNrP4JIe+azq9yXR/E3JFAqm0ppkgamg/EU8Ip
	 NFAqP5qHSthqtdnN/d2Dk/O6rpt8vH2MIyfl35M0FyfrGhClKWrFUg/oc7X0Y6UL0f82C
	 3GNszmYYaa0rRsmf3v8gWE3kTG9sz0lAHzOYHLS5c/k7CMZ8IFAsQHe5YeBe1spTEHuiL
	 TW8aulGeK1Uxa0sPuaP1x524AEj7XbmHm7Mf9hE3IIv4o9TIkkV4lizgeY+6jpN7dpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V8eg8MSi;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E020606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 08:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E020606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V8eg8MSi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793177682; x=1824713682;
  h=date:from:to:cc:subject:message-id;
  bh=EQrez7ijKC/lYtp/05R6kxSMZ7m5ZN7Sf0uSRGwIy8o=;
  b=V8eg8MSizdwQgdmfcJcQNEw9+RDvRctDNLphs9so5cofXUdRx5cv4ZaR
   qM8dIKww9vQEmmsAU+SVOOxyTtXHHOtfi9C5G9j5FFdoTXNuCOmhYhaUt
   4dLQ+4cIomjTkKkTtKrjOZRBK40t9z/ih21RJGYB7P5GQLEfxvD7erRH8
   0GxIXnWZPRAgDfNrws/3vmZXYkoGeZ7Pi5QzPbwBRcAeL012+0WK/ASkv
   gHXzO9greNquWYsIXJue7RwfZJNGy61wGHRhYUo5rzPrHTnNP7cPY2GCF
   b/J71zUL6bTih2kPB+LSzXkw72j+WkDWH5m6/rOMZFbk+qlLw+iY5d/PR
   Q==;
X-CSE-ConnectionGUID: TxpfJIt0QbaCZlPHpkIjqg==
X-CSE-MsgGUID: uvPsfYd9SWetdXDi89Y/DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1897607"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1897607"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:54:40 -0700
X-CSE-ConnectionGUID: OuUj7OjWRZmiugj2zUeoxA==
X-CSE-MsgGUID: 0/wdIiNUQ3K2ZLtr+0JSVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4863655"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2026 01:54:38 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLzQa-000000004p1-1cNd;
	Wed, 28 Oct 2026 08:54:36 +0000
Date: Wed, 28 Oct 2026 09:54:22 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9]
 ./include/linux/list.h:70:20: warning: storing the address of local variable
 'waiter' in '((struct list_head *)((char *)sem + 8))[4].prev'
Message-ID: <202610280911.KkXmc2NG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e404899677bc470e620572471a562f09ea3de082
commit: 50f3b00d4c7ba9aef6e0be4db192ee81f4f8a125 [9/9] libsubcmd: Fix use-after-free for realloc(..., 0)
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261028/202610280911.KkXmc2NG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280911.KkXmc2NG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280911.KkXmc2NG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./include/linux/rculist.h:10,
                    from ./include/linux/pid.h:5,
                    from ./include/linux/sched.h:14,
                    from kernel/locking/semaphore.c:30:
   In function '__list_add',
       inlined from 'list_add_tail' at ./include/linux/list.h:100:2,
       inlined from '__down_common' at kernel/locking/semaphore.c:209:2,
       inlined from '__down_timeout' at kernel/locking/semaphore.c:252:9:
>> ./include/linux/list.h:70:20: warning: storing the address of local variable 'waiter' in '((struct list_head *)((char *)sem + 8))[4].prev' [-Wdangling-pointer=]
      70 |         next->prev = new;
         |         ~~~~~~~~~~~^~~~~
   kernel/locking/semaphore.c: In function '__down_timeout':
   kernel/locking/semaphore.c:207:33: note: 'waiter' declared here
     207 |         struct semaphore_waiter waiter;
         |                                 ^~~~~~
   kernel/locking/semaphore.c:250:62: note: 'sem' declared here
     250 | static noinline int __sched __down_timeout(struct semaphore *sem, long timeout)
         |                                            ~~~~~~~~~~~~~~~~~~^~~
   In function '__list_add',
       inlined from 'list_add_tail' at ./include/linux/list.h:100:2,
       inlined from '__down_common' at kernel/locking/semaphore.c:209:2,
       inlined from '__down' at kernel/locking/semaphore.c:237:2:
>> ./include/linux/list.h:70:20: warning: storing the address of local variable 'waiter' in '((struct list_head *)((char *)sem + 8))[4].prev' [-Wdangling-pointer=]
      70 |         next->prev = new;
         |         ~~~~~~~~~~~^~~~~
   kernel/locking/semaphore.c: In function '__down':
   kernel/locking/semaphore.c:207:33: note: 'waiter' declared here
     207 |         struct semaphore_waiter waiter;
         |                                 ^~~~~~
   kernel/locking/semaphore.c:235:55: note: 'sem' declared here
     235 | static noinline void __sched __down(struct semaphore *sem)
         |                                     ~~~~~~~~~~~~~~~~~~^~~


vim +70 ./include/linux/list.h

d7c816733d501b5 Kees Cook        2016-08-17   56  
^1da177e4c3f415 Linus Torvalds   2005-04-16   57  /*
^1da177e4c3f415 Linus Torvalds   2005-04-16   58   * Insert a new entry between two known consecutive entries.
^1da177e4c3f415 Linus Torvalds   2005-04-16   59   *
^1da177e4c3f415 Linus Torvalds   2005-04-16   60   * This is only for internal list manipulation where we know
^1da177e4c3f415 Linus Torvalds   2005-04-16   61   * the prev/next entries already!
^1da177e4c3f415 Linus Torvalds   2005-04-16   62   */
^1da177e4c3f415 Linus Torvalds   2005-04-16   63  static inline void __list_add(struct list_head *new,
^1da177e4c3f415 Linus Torvalds   2005-04-16   64  			      struct list_head *prev,
^1da177e4c3f415 Linus Torvalds   2005-04-16   65  			      struct list_head *next)
^1da177e4c3f415 Linus Torvalds   2005-04-16   66  {
d7c816733d501b5 Kees Cook        2016-08-17   67  	if (!__list_add_valid(new, prev, next))
d7c816733d501b5 Kees Cook        2016-08-17   68  		return;
d7c816733d501b5 Kees Cook        2016-08-17   69  
^1da177e4c3f415 Linus Torvalds   2005-04-16  @70  	next->prev = new;
^1da177e4c3f415 Linus Torvalds   2005-04-16   71  	new->next = next;
^1da177e4c3f415 Linus Torvalds   2005-04-16   72  	new->prev = prev;
1c97be677f72b3c Paul E. McKenney 2015-09-20   73  	WRITE_ONCE(prev->next, new);
^1da177e4c3f415 Linus Torvalds   2005-04-16   74  }
^1da177e4c3f415 Linus Torvalds   2005-04-16   75  
^1da177e4c3f415 Linus Torvalds   2005-04-16   76  /**
^1da177e4c3f415 Linus Torvalds   2005-04-16   77   * list_add - add a new entry
^1da177e4c3f415 Linus Torvalds   2005-04-16   78   * @new: new entry to be added
^1da177e4c3f415 Linus Torvalds   2005-04-16   79   * @head: list head to add it after
^1da177e4c3f415 Linus Torvalds   2005-04-16   80   *
^1da177e4c3f415 Linus Torvalds   2005-04-16   81   * Insert a new entry after the specified head.
^1da177e4c3f415 Linus Torvalds   2005-04-16   82   * This is good for implementing stacks.
^1da177e4c3f415 Linus Torvalds   2005-04-16   83   */
^1da177e4c3f415 Linus Torvalds   2005-04-16   84  static inline void list_add(struct list_head *new, struct list_head *head)
^1da177e4c3f415 Linus Torvalds   2005-04-16   85  {
^1da177e4c3f415 Linus Torvalds   2005-04-16   86  	__list_add(new, head, head->next);
^1da177e4c3f415 Linus Torvalds   2005-04-16   87  }
199a9afc3dbe98c Dave Jones       2006-09-29   88  
^1da177e4c3f415 Linus Torvalds   2005-04-16   89  
^1da177e4c3f415 Linus Torvalds   2005-04-16   90  /**
^1da177e4c3f415 Linus Torvalds   2005-04-16   91   * list_add_tail - add a new entry
^1da177e4c3f415 Linus Torvalds   2005-04-16   92   * @new: new entry to be added
^1da177e4c3f415 Linus Torvalds   2005-04-16   93   * @head: list head to add it before
^1da177e4c3f415 Linus Torvalds   2005-04-16   94   *
^1da177e4c3f415 Linus Torvalds   2005-04-16   95   * Insert a new entry before the specified head.
^1da177e4c3f415 Linus Torvalds   2005-04-16   96   * This is useful for implementing queues.
^1da177e4c3f415 Linus Torvalds   2005-04-16   97   */
^1da177e4c3f415 Linus Torvalds   2005-04-16   98  static inline void list_add_tail(struct list_head *new, struct list_head *head)
^1da177e4c3f415 Linus Torvalds   2005-04-16   99  {
^1da177e4c3f415 Linus Torvalds   2005-04-16 @100  	__list_add(new, head->prev, head);
^1da177e4c3f415 Linus Torvalds   2005-04-16  101  }
^1da177e4c3f415 Linus Torvalds   2005-04-16  102  

:::::: The code at line 70 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
