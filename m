Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D4287268
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779396816; cv=none; b=bFYvpiKiJZFlHcz37cnMiIENjBA0+z2o0F86qC/8dhyAxTn482ynjndIOP//OF6wNvTUof+KuP4mE5fm+GX3ERTkdqWzm58lQCziFJvByrke8ju6oDBpb/UyrJuznOyRqjw5lTpvjzpRToOXXkhN+rNCl9KKJfiMQe52GOLljVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779396816; c=relaxed/simple;
	bh=KxP2LMhgMul+wPFAq9wKAFsX71swBdT8by59srz2Wes=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QhFhjnxelHZCNGDNld0b9ywybR7vqHGkYSTO4iE+Nk9hq3S+No0Mxg6rT0l/1fUIltzr4C4xrjjzq/wsCpOnGQpdcf4kl2sMpUc7DcO8xldw7lB6LDYbTWfcPjSMea7gq1pN+a35DM5jtoiRekKRrFIi/BB6RgTE5MhheUDVI+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0S/v3wo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0S/v3wo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779396815; x=1810932815;
  h=date:from:to:cc:subject:message-id;
  bh=KxP2LMhgMul+wPFAq9wKAFsX71swBdT8by59srz2Wes=;
  b=A0S/v3woiW1+HOEcZ05XUTXbXiyksknF+X3ugs9Sxv1+wqid3CtCUpqN
   JSvyxYw59L5xAtjR5tGa+/nwlellS+32eQoExsG/hw5O9wtWnmlGN//et
   5AoDlLivyKhSaIWwjcs7m1kLqq7e4proh8t0dtxbRQ2f0t9sm/5GmCBwU
   ksMTTwHPCNgLlt1rVgMHr8reNWEMzN4+faJCNczAihOVY+hoa0dbegUj2
   Bc2tZNPr4aGD10mkLTkR3mIOQRpsXvBL1qRfTAup2bHd/2cLph5IqR8Ar
   3cw/VYREq38kl9gPLj0iCZSDdu28hcOBMQIGSPLOqO/s+Np1b/WtmoqKT
   g==;
X-CSE-ConnectionGUID: /NmBig1ATXWluv294V79mw==
X-CSE-MsgGUID: 7uOHTpviTlqqiUikDzzHsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90901324"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="90901324"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 13:53:34 -0700
X-CSE-ConnectionGUID: naNf8FkATGC0L5R1lSiZvw==
X-CSE-MsgGUID: Jil4E5QnSGGlLFCZuc1e1A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2026 13:53:33 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQAOY-00000000195-1gn7;
	Thu, 21 May 2026 20:53:30 +0000
Date: Fri, 22 May 2026 04:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_ops 3/8] include/linux/poll.h:134:27:
 warning: division by zero is undefined
Message-ID: <202605220452.egpSlSrP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_ops
head:   d964de3065ae3aa792fe6b812681b106abb18d17
commit: 4eae673faa096749302cf82fbb5d55632b340754 [3/8] mm: memcontrol: factor out a folio_memcg_css helper
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260522/202605220452.egpSlSrP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220452.egpSlSrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220452.egpSlSrP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:47:
   include/linux/memcontrol.h:1944:9: error: call to undeclared function 'cgroup_e_css'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1944 |         return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
         |                ^
   include/linux/memcontrol.h:1944:9: note: did you mean 'cgroup_lock'?
   include/linux/cgroup.h:732:20: note: 'cgroup_lock' declared here
     732 | static inline void cgroup_lock(void) {}
         |                    ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:47:
   include/linux/memcontrol.h:1944:40: error: incomplete definition of type 'struct mem_cgroup'
    1944 |         return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
         |                             ~~~~~~~~~~~~~~~~~~^
   include/linux/mm_types.h:36:8: note: forward declaration of 'struct mem_cgroup'
      36 | struct mem_cgroup;
         |        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:47:
   include/linux/memcontrol.h:1944:55: error: use of undeclared identifier 'io_cgrp_subsys'
    1944 |         return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
         |                                                              ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:53:
>> include/linux/poll.h:134:27: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:134:39: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:12: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                          ^~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:23: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                                     ^~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   4 warnings and 3 errors generated.
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1375: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +134 include/linux/poll.h

7a163b2195cda0c Al Viro 2018-02-01  129  
7a163b2195cda0c Al Viro 2018-02-01  130  static inline __poll_t demangle_poll(u16 val)
7a163b2195cda0c Al Viro 2018-02-01  131  {
7a163b2195cda0c Al Viro 2018-02-01  132  #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
7a163b2195cda0c Al Viro 2018-02-01  133  	return M(IN) | M(OUT) | M(PRI) | M(ERR) | M(NVAL) |
7a163b2195cda0c Al Viro 2018-02-01 @134  		M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
7a163b2195cda0c Al Viro 2018-02-01  135  		M(HUP) | M(RDHUP) | M(MSG);
7a163b2195cda0c Al Viro 2018-02-01  136  #undef M
7a163b2195cda0c Al Viro 2018-02-01  137  }
7a163b2195cda0c Al Viro 2018-02-01  138  #undef __MAP
7a163b2195cda0c Al Viro 2018-02-01  139  
7a163b2195cda0c Al Viro 2018-02-01  140  

:::::: The code at line 134 was first introduced by commit
:::::: 7a163b2195cda0cddf47b5caf14a7229d4e2bea3 unify {de,}mangle_poll(), get rid of kernel-side POLL...

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
