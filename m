Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614B83CB56D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 21:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197967; cv=none; b=qmk2YW2WU7+G+CdK6c09FwglY470hxQIi8QPMCgIOCfyw/ql6yLk03Rck8UMv1IbRyyi7+h11Og6Z/ABMDkQ6eUYEECiqFnswhQL/hMQzHP/kNF755Gx1KBk2z/tr8Oat7b8sQJK0boqTDlY2ugqOawwkr8iRGBBfPLyofOCikw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197967; c=relaxed/simple;
	bh=VHfI0GuSKhE867JGbERTc6eFLFe7Fnzw7ZKLuDYJaSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z5fJe9XJeoYPenYAETBexvxjCR2RGxIsMjchfAlS3jDW4O2QOPRR1snIZa2l+8L1k2JyQWegRRdVTSwqcBKdPLR88Mep5+U3LOz5BVFGgkznEgoWOoGw4OBobRgLRnr2Oy+qY/3RvvOOaSo7OM7fsk1pNpjTmAUXxbR/DrpfunE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSnxD0RB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSnxD0RB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790197960; x=1821733960;
  h=date:from:to:cc:subject:message-id;
  bh=VHfI0GuSKhE867JGbERTc6eFLFe7Fnzw7ZKLuDYJaSA=;
  b=KSnxD0RBVn8dbMIzAP8+xOry0fH6wZooGf9e1BUBBob3KCysY2WaqY76
   n6TRXL/uqBvBQxlSpQ8OpPvd1yViS74Ml5Ce/BxUeuLMMTBOUkz5P4YrS
   PHoNtQtZDCPC+hSi75lI5/0X1kjb6/0Tn4u8slfQ1yK7+Gpyarsvnkltj
   g7qA0CY4TwcpWMeCCLClYmG0NZxSVWRzqlfXxSZ3hNeyvG9fGiwaobpO0
   ki43uO0CBBjmS2Tm1qA06bK7pt+St0pSUTicXAtb2HCvRwgQIIhVL8uNv
   GifudeOp8OugS2INT6kqZCBH/OPzwcPBG5ChMeRuE08mchQ/u8hgH6yT5
   Q==;
X-CSE-ConnectionGUID: 7s0fKMkOTlurg+kctfh0FA==
X-CSE-MsgGUID: tBxl4T7GRWOsor/tZ62CPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93441781"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="93441781"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:12:35 -0700
X-CSE-ConnectionGUID: J8b3zkxMQZ26A8mES7sMvQ==
X-CSE-MsgGUID: R/+LuK+2QIWv+rJJ2pmSHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4892734"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 14:12:34 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9UGU-00000000HkM-31mn;
	Wed, 23 Sep 2026 21:12:30 +0000
Date: Thu, 24 Sep 2026 05:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmckrcu:cmpxchg2.2026.09.22a 25/28]
 arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
Message-ID: <202609240539.AkulvjVe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC: Emulate two-byte cmpxchg
config: arc-randconfig-1001-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240539.AkulvjVe-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240539.AkulvjVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240539.AkulvjVe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:190,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
      80 |         if (_prev_ == _o_)                                              \
         |                       ^~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:80:23: note: each undeclared identifier is reported only once for each function it appears in
      80 |         if (_prev_ == _o_)                                              \
         |                       ^~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
      81 |                 *_p_ = _n_;                                             \
         |                        ^~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_' [-Wunused-variable]
      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_' [-Wunused-variable]
      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_acquire':
   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
      80 |         if (_prev_ == _o_)                                              \
         |                       ^~~
   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
      70 | #define raw_cmpxchg_acquire arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
      81 |                 *_p_ = _n_;                                             \
         |                        ^~~
   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
      70 | #define raw_cmpxchg_acquire arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_' [-Wunused-variable]
      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
      70 | #define raw_cmpxchg_acquire arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_' [-Wunused-variable]
      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
      70 | #define raw_cmpxchg_acquire arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_release':
   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
      80 |         if (_prev_ == _o_)                                              \
         |                       ^~~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
      81 |                 *_p_ = _n_;                                             \
         |                        ^~~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_' [-Wunused-variable]
      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_' [-Wunused-variable]
      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_relaxed':
   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
      80 |         if (_prev_ == _o_)                                              \
         |                       ^~~
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
      81 |                 *_p_ = _n_;                                             \
         |                        ^~~
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_' [-Wunused-variable]
      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_' [-Wunused-variable]
      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1 shuffle=1050985161
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=1050985161
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1050985161
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1050985161
   make: Target 'prepare' not remade because of errors.


vim +/_new_ +71 arch/arc/include/asm/cmpxchg.h

    66	
    67	#define arch_cmpxchg(ptr, old, new)				        \
    68	({									\
    69		volatile __typeof__(ptr) _p_ = (ptr);				\
  > 70		unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
  > 71		unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
    72		__typeof__(*(ptr)) _prev_;					\
    73		unsigned long __flags;						\
    74										\
    75		/*								\
    76		 * spin lock/unlock provide the needed smp_mb() before/after	\
    77		 */								\
    78		atomic_ops_lock(__flags);					\
    79		_prev_ = *_p_;							\
    80		if (_prev_ == _o_)						\
    81			*_p_ = _n_;						\
    82		atomic_ops_unlock(__flags);					\
    83		_prev_;								\
    84	})
    85	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
