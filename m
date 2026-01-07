Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C522A4FE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813857; cv=none; b=VQpR3KHSbD3xImaRDBWWz+AmzpUNjRP2BlIPVdWg0NN30ncv7Mqxks0Rt3A9oWm1YBNso/HEtLc2CwuW+qM6/Zv0AcDH4iBcRYeIT7xzIqq8OPFVtp7MvdrIGiKyv/PO1Ayfb9JYek4t3hcDBluFkxsPBU0fu67M/1cxvjiYFEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813857; c=relaxed/simple;
	bh=L6f1PifJpqxsnm0Lnab1vQ+mLCz6DECvZ25laxXR5rU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GmJkP2wU+kXndKvv6QH+kUTuAAKLEOdlWcbuOI/vgmwMnUN0pcH6R3iLMovrbPco3jIkYn4JN72tKDjC6qZtGhQPgTPhtt+ROEQ1UCW5JLdimZ9tUkQ04jW5Y9qjX4mE6+6TL8gpCpx9YwKQ0Y5Ifb5KGd5Hca4LJ7re37dqfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MaRBb51Q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaRBb51Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767813856; x=1799349856;
  h=date:from:to:cc:subject:message-id;
  bh=L6f1PifJpqxsnm0Lnab1vQ+mLCz6DECvZ25laxXR5rU=;
  b=MaRBb51QCkGsED9yiAIICUBZdeX9b+AzopvshMo1eT8McPpm412MD2qn
   vK+LRSihE3q7OAswVywfQiI5nL9zw2pj5enFRClZcyMHWEbasAYrAn1Y9
   cKiKMyUHkUj0PT7AueXly6YZq9ym9vZrajDu2WmZWwMe4/Ac/Z+iFRGLN
   JTRMxMdCehgw5g+wI27gvu0/mHu6nN1e0HVoNX05NLqondNkb5X3dBHLK
   AikuLDrxSMrT/WaZnsfAh0iS68H3P0HRlbjo5A28W1ctZ2EXxYJwiMoxz
   HuBeb5fi0kklEXvUqSksDipdi/zCt5KztHpWrEA5kXYOQQdm5k8054QFF
   Q==;
X-CSE-ConnectionGUID: voSoO+GUQE6UNGXHKTtkeQ==
X-CSE-MsgGUID: JYL5oTLCR7Kty5TrrrNXDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69267574"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="69267574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 11:24:15 -0800
X-CSE-ConnectionGUID: 1IeyQUOwQTmJiQY/wBjy4w==
X-CSE-MsgGUID: 1q/G+Pi1RU+xT6hNBU1cIQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2026 11:24:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdZ8d-00000000469-0fGk;
	Wed, 07 Jan 2026 19:24:11 +0000
Date: Thu, 08 Jan 2026 03:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v3 1/9]
 include/linux/poll.h:134:27: warning: division by zero is undefined
Message-ID: <202601080313.MTon6YNv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v3
head:   8a4f71e8f0a8aef992da7df176a352073872a47c
commit: c96cbb611777a60e4328fc821843d1bc092dcca1 [1/9] numa,memory_hotplug: create N_PRIVATE (Private Nodes)
config: mips-randconfig-r073-20260107 (https://download.01.org/0day-ci/archive/20260108/202601080313.MTon6YNv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080313.MTon6YNv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080313.MTon6YNv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:11:
   include/linux/node.h:108:75: error: expected ';' after return statement
     108 | static inline int node_mark_private(int nid, bool enable) { return -ENODEV }
         |                                                                           ^
         |                                                                           ;
   In file included from arch/mips/kernel/asm-offsets.c:26:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:7:
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
   2 warnings and 1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
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
