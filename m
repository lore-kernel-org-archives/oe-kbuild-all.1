Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB791200DD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efMnWDii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699556917; x=1731092917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6LOomUNxs7iCaNcE6GnTDW+eTEUZxd+cahzxeO4hPjo=;
  b=efMnWDiihUPAXREnwtWcdQ0f1hi6QxtEMjDQlAlNI3wApDUQKNKg0XXf
   1Od1n50W2LA/F/BcZ6B64mxeWTpNKgj85WQ2Wdb5VPSP8LWjv3mTIb9OM
   +KoopgVrhJ4p82ZVKhHdaYhLZneDFOqdGK8Kzd0CNn9Npb4Vky3XeFTA+
   5tKvEl/eE15HXkdQiOm/jnC8Byr26sb+2sthzgMohgOp0byjR7HTLHe3q
   5Y+k094CdZRV/X0dGxiMmcZOj0qjnsTmk07O+9yQPOnOAiJ34AZVDkW/p
   xLKsM8x38t9okqZsUQp6L3Rz4st9BAq8nVX1KA/Yf/BDH171dDs4kh5Lv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="476286359"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="476286359"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 11:08:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="833929242"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="833929242"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2023 11:08:04 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ANm-00094j-1t;
	Thu, 09 Nov 2023 19:08:02 +0000
Date: Fri, 10 Nov 2023 03:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-fixes 39/41] arch/mips/include/asm/cmpxchg.h:83:32:
 error: call to '__xchg_called_with_bad_pointer' declared with attribute
 error: Bad argument size for xchg
Message-ID: <202311100301.XBXz3rBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-fixes
head:   75a3bc7cc3bd84295e596d1a3c2528f5d6d60b67
commit: e920cf491295abc4262ef06f0b0f4159cf694255 [39/41] afs: Overhaul invalidation handling to better support RO volumes
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231110/202311100301.XBXz3rBg-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100301.XBXz3rBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100301.XBXz3rBg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/asm/atomic.h:23,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:13,
                    from include/linux/smp.h:13,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from fs/afs/callback.c:17:
   In function '__arch_xchg',
       inlined from '__afs_break_callback' at fs/afs/callback.c:82:6:
>> arch/mips/include/asm/cmpxchg.h:83:32: error: call to '__xchg_called_with_bad_pointer' declared with attribute error: Bad argument size for xchg
      83 |                         return __xchg_called_with_bad_pointer();
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__xchg_called_with_bad_pointer +83 arch/mips/include/asm/cmpxchg.h

5154f3b4194910 Paul Burton         2017-06-09  66  
b70eb30056dc84 Paul Burton         2017-06-09  67  extern unsigned long __xchg_small(volatile void *ptr, unsigned long val,
b70eb30056dc84 Paul Burton         2017-06-09  68  				  unsigned int size);
b70eb30056dc84 Paul Burton         2017-06-09  69  
46f1619500d022 Thomas Bogendoerfer 2019-10-09  70  static __always_inline
068550631fbe0b Andrzej Hajda       2023-01-18  71  unsigned long __arch_xchg(volatile void *ptr, unsigned long x, int size)
b81947c646bfef David Howells       2012-03-28  72  {
b81947c646bfef David Howells       2012-03-28  73  	switch (size) {
b70eb30056dc84 Paul Burton         2017-06-09  74  	case 1:
b70eb30056dc84 Paul Burton         2017-06-09  75  	case 2:
b70eb30056dc84 Paul Burton         2017-06-09  76  		return __xchg_small(ptr, x, size);
b70eb30056dc84 Paul Burton         2017-06-09  77  
b81947c646bfef David Howells       2012-03-28  78  	case 4:
62c6081dca75d6 Paul Burton         2017-06-09  79  		return __xchg_asm("ll", "sc", (volatile u32 *)ptr, x);
62c6081dca75d6 Paul Burton         2017-06-09  80  
b81947c646bfef David Howells       2012-03-28  81  	case 8:
62c6081dca75d6 Paul Burton         2017-06-09  82  		if (!IS_ENABLED(CONFIG_64BIT))
62c6081dca75d6 Paul Burton         2017-06-09 @83  			return __xchg_called_with_bad_pointer();
62c6081dca75d6 Paul Burton         2017-06-09  84  
62c6081dca75d6 Paul Burton         2017-06-09  85  		return __xchg_asm("lld", "scd", (volatile u64 *)ptr, x);
62c6081dca75d6 Paul Burton         2017-06-09  86  
d15dc68c1143e2 Paul Burton         2017-06-09  87  	default:
d15dc68c1143e2 Paul Burton         2017-06-09  88  		return __xchg_called_with_bad_pointer();
b81947c646bfef David Howells       2012-03-28  89  	}
b81947c646bfef David Howells       2012-03-28  90  }
b81947c646bfef David Howells       2012-03-28  91  

:::::: The code at line 83 was first introduced by commit
:::::: 62c6081dca75d6bec1198ed5a1ae50968b323a8c MIPS: cmpxchg: Drop __xchg_u{32,64} functions

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
