Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B1215697D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713215281; cv=none; b=Fz9XFs/BaW2+9q3aINzq3hU4pBMcflfHYhnwko8o5hXHE0DBt6/u5BEPEO6WnviZXw+ntgVA2zveFgUSkJt5EvDYvq04+KGVBD1cKjmebBU25DTiOnmduo5Z79O2UAp9jp2/vBytABG7D2Q6a0QZ5BpuHSpwt8/X1iAZ0bfOlp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713215281; c=relaxed/simple;
	bh=HTswpeWTqlqRO4Z7nRnbsNegu7NAlPW8sxScnc8V1YY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NW0aF31MG2yMNOGQQ3YFcZCdLGv4NO9FbXBaS4Nl1Z9IgjgW+4f5XO2BWtPX74oDAx1bbXOoDjWjbQ6MkoHkODtwWh3GCYqTEj4v00gy+CLfwagOMd3ZqMQH1W7gv164YouqgC4jHOy5XEbsDbVcWN5iD4OMj/VmOiaKPtsfUR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rud5z0I5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rud5z0I5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713215279; x=1744751279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HTswpeWTqlqRO4Z7nRnbsNegu7NAlPW8sxScnc8V1YY=;
  b=Rud5z0I5070QFbfUbGwHSePeR9eeq9OndsPmrHtX8mcTs9Ho9c4Jj2Ex
   UA9VxPQX4Ht8zb5G3ZLQ5wX8i6GVcz5R7dI1/cc4xglQBSTkUGVeq1hOj
   zUd8pvCTYtpuckzIBTOrjbfUFGZdY4LDxNAsFSof2T9U3AFmP4rwyrkla
   C03faxGC7uuGbQ7I3ebJxELoNOm/5PUSIojFbFGC7HJaDngxosV8itFmX
   o/JgGiWuNFiXOjY0pKkQv9hntip6qeAv5kXSusSjalOzmGg1bp0Z8CjF+
   3vt/su40Pse50BCJkIYSg0QqK8qiD/ki2LSKkF+BB2mOG8a2VVxRVgHxB
   Q==;
X-CSE-ConnectionGUID: cgiraoAxT8yp9B6Kvf4fgw==
X-CSE-MsgGUID: TFCZ7ixPRWm2i6Kmu+zu5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12404591"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="12404591"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 14:07:58 -0700
X-CSE-ConnectionGUID: n4v3mX0uQn2ombcOmLA+yA==
X-CSE-MsgGUID: Su4Kic6XR3SVPA36LZfymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26834182"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Apr 2024 14:07:57 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwTYQ-0004eb-2e;
	Mon, 15 Apr 2024 21:07:54 +0000
Date: Tue, 16 Apr 2024 05:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-snps-arc@lists.infradead.org
Subject: [linux-next:master 4535/6266] arch/arc/include/asm/cmpxchg.h:73:27:
 error: implicit declaration of function 'cmpxchg_emu_u8'
Message-ID: <202404160503.zFIp77TO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
commit: d4f26ed66a53be57567bf71d60e80a116cec34e1 [4535/6266] ARC: Emulate one-byte cmpxchg
config: arc-randconfig-r016-20230816 (https://download.01.org/0day-ci/archive/20240416/202404160503.zFIp77TO-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160503.zFIp77TO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160503.zFIp77TO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   arch/arc/include/asm/bitops.h: In function '__fls':
   arch/arc/include/asm/bitops.h:137:17: error: implicit declaration of function '__builtin_arc_fls'; did you mean '__builtin_arc_flag'? [-Werror=implicit-function-declaration]
     137 |         return  __builtin_arc_fls(x);
         |                 ^~~~~~~~~~~~~~~~~
         |                 __builtin_arc_flag
   In file included from arch/arc/include/asm/atomic.h:31,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:188:
   arch/arc/include/asm/atomic64-arcv2.h: At top level:
   arch/arc/include/asm/atomic64-arcv2.h:13:3: error: conflicting types for 'atomic64_t'; have 'struct <anonymous>'
      13 | } atomic64_t;
         |   ^~~~~~~~~~
   In file included from include/linux/page-flags.h:9,
                    from kernel/bounds.c:10:
   include/linux/types.h:184:3: note: previous declaration of 'atomic64_t' with type 'atomic64_t'
     184 | } atomic64_t;
         |   ^~~~~~~~~~
   In file included from arch/arc/include/asm/atomic.h:13:
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
>> arch/arc/include/asm/cmpxchg.h:73:27: error: implicit declaration of function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
      73 |                 __flags = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_); \
         |                           ^~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
   In file included from arch/arc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:192:
   include/linux/byteorder/big_endian.h: At top level:
   include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
       8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
         |  ^~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/cmpxchg_emu_u8 +73 arch/arc/include/asm/cmpxchg.h

    62	
    63	#define arch_cmpxchg(ptr, old, new)				        \
    64	({									\
    65		volatile __typeof__(ptr) _p_ = (ptr);				\
    66		__typeof__(*(ptr)) _o_ = (old);					\
    67		__typeof__(*(ptr)) _n_ = (new);					\
    68		__typeof__(*(ptr)) _prev_;					\
    69		unsigned long __flags;						\
    70										\
    71		switch(sizeof((_p_))) {						\
    72		case 1:								\
  > 73			__flags = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_);	\
    74			_prev_ = (__typeof__(*(ptr)))__flags;			\
    75			break;							\
    76			break;							\
    77		case 4:								\
    78			/*							\
    79			 * spin lock/unlock provide the needed smp_mb()		\
    80			 * before/after						\
    81			 */							\
    82			atomic_ops_lock(__flags);				\
    83			_prev_ = *_p_;						\
    84			if (_prev_ == _o_)					\
    85				*_p_ = _n_;					\
    86			atomic_ops_unlock(__flags);				\
    87			break;							\
    88		default:							\
    89			BUILD_BUG();						\
    90		}								\
    91										\
    92		_prev_;								\
    93	})
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
