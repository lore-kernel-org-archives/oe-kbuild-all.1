Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBC43DCD9B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280579; cv=none; b=LiwToZRYUuPFQ0YYEY7t1mp2GQRBc9XkSjm/zCXmbrKRLigqTuGeyBKxPxKT2E2YvMGmkp75QodNZ3CWfTzuMvJXQgGLDcZ9JRv+YYf1P8YXggpTGu1FHejmQKipteACyPWFD+GNfkilI8U38KnOajY4PNZhk5p7owIg0b4i6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280579; c=relaxed/simple;
	bh=Uc10E6vjgE+VCQ78SnYxsNHA/z8OAcH+P4BCxjtBEko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXf8zpUdVRQUlargs2SeEDSrTLszlFLSMJD3leSbu6wWlNdF9WA03CnneNNzg/o5OVeblIyrZb8mQYVUtFOE3qTtrqdt0hjKNWfC8KFe3iIwcdRmZGbm2mXNX1wYrmmobwOOCGrtPrT9pN1HLJpzmpJgHntnGyxdaemP2bUhcaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1b6a1Zo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1b6a1Zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791280577; x=1822816577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uc10E6vjgE+VCQ78SnYxsNHA/z8OAcH+P4BCxjtBEko=;
  b=R1b6a1ZoUTPRxkK6GUvYsHtHjzMEMl/RiY4qcJxqD+IYUFwtJwrkNHZm
   jVuNAYfF8WS6MHtcNXMqni2m+7JMAA9vnCDi2fCiAMwYBfZvI6s+91ckf
   AjIw68P6b1g0PJ5qH1NeQT1VfjoAMFC6bK6vMnipD+vg5M2FLPbuSPlLm
   Dk4M4i0uk7efs0kkg+70JZkOI6A0IHNeH65qlUSflDaJkJpvL+SVtorzg
   /qUS3e/TMbtfo5JHXJB8vAQuwDZyy4Xhk0sQ2KCWch+x/wdbCCobMq3aW
   v+010g4kt9BkUgYOjzmTS7qSaQPpNhsVM+w4/8Nnev2dlNMTh2tvoLc85
   A==;
X-CSE-ConnectionGUID: 3hJJx7U6R7+OUzMpFdlJ3g==
X-CSE-MsgGUID: gfl/jUi0TB2xRTBy5YfM5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="19409"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="19409"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:56:17 -0700
X-CSE-ConnectionGUID: IrOC/AG7SKyjNfPRdxc6hw==
X-CSE-MsgGUID: MmvJDYO1RSew69z8bBJZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="305038552"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2026 02:56:12 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE1u5-000000001Qw-3Vj3;
	Tue, 06 Oct 2026 09:56:09 +0000
Date: Tue, 6 Oct 2026 17:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
	vgupta@kernel.org, guoren@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, arnd@arndb.de, paulmck@kernel.org,
	david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org, brads@mainlining.org
Subject: Re: [PATCH v5 1/3] ARC: Emulate two-byte cmpxchg
Message-ID: <202610061706.jjwf7ggl-lkp@intel.com>
References: <20261005120700.383058-2-brads@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005120700.383058-2-brads@mainlining.org>

Hi Bradley,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on vgupta-arc/for-curr jcmvbkbc-xtensa/xtensa-for-next linus/master v7.3-rc6 next-20261005]
[cannot apply to vgupta-arc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bradley-Morgan/ARC-Emulate-two-byte-cmpxchg/20261005-120658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261005120700.383058-2-brads%40mainlining.org
patch subject: [PATCH v5 1/3] ARC: Emulate two-byte cmpxchg
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20261006/202610061706.jjwf7ggl-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061706.jjwf7ggl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061706.jjwf7ggl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:190,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
>> arch/arc/include/asm/cmpxchg.h:54:46: error: implicit declaration of function 'cmpxchg_emu_u16'; did you mean 'cmpxchg_emu_u8'? [-Wimplicit-function-declaration]
      54 |                 _prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, (unsigned long)_o_, (unsigned long)_n_);       \
         |                                              ^~~~~~~~~~~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +54 arch/arc/include/asm/cmpxchg.h

    41	
    42	#define arch_cmpxchg_relaxed(ptr, old, new)				\
    43	({									\
    44		__typeof__(ptr) _p_ = (ptr);					\
    45		__typeof__(*(ptr)) _o_ = (old);					\
    46		__typeof__(*(ptr)) _n_ = (new);					\
    47		__typeof__(*(ptr)) _prev_;					\
    48										\
    49		switch (sizeof(*(_p_))) {						\
    50		case 1:								\
    51			_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
    52			break;							\
    53		case 2:								\
  > 54			_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, (unsigned long)_o_, (unsigned long)_n_);	\
    55			break;							\
    56		case 4:								\
    57			_prev_ = __cmpxchg(_p_, _o_, _n_);			\
    58			break;							\
    59		default:							\
    60			BUILD_BUG();						\
    61		}								\
    62		_prev_;								\
    63	})
    64	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
