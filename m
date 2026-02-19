Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDB62C08A2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 08:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771488043; cv=none; b=UR+jeooRKs9DRHfFrgeE+WobOkK6u07/XGFJQcn94RlOh3oDdRZ41o8rkqE8Zwabo6ZfefIPeaeKLO4Brow1coWwQGMT046Tol5bsONsxdkyP5f5lToLh2GRvNO3KCGjGNyHlDwXwA/MO8FNGrTWUtphHpfu5wl/gCsN+QU9hqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771488043; c=relaxed/simple;
	bh=KZ1N8ZjwQQbRte4wcvMZr9SVgxmLK9We4Mi+tTwcilk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CJBljswPHeGEZEuzlxUA7/RayBhl+2m3kjs8ZbxRLYQW9e+rVAHhiBukQdc54W6nxRMsvnct3fowCCpk96VTLEqmZLPjCpHQ0pYX7fH+lUbB7KuP+c66XpqjmAI53vs/Ol5VG3k/8UV2IcatC7N8BuvYk+ZmlKeQpjozKte1Ftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uwtr7nP0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uwtr7nP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771488042; x=1803024042;
  h=date:from:to:cc:subject:message-id;
  bh=KZ1N8ZjwQQbRte4wcvMZr9SVgxmLK9We4Mi+tTwcilk=;
  b=Uwtr7nP0Mbr9GyOy2j2kNwdS9jbsUX4g2gt0DMlPtvlgiLXSSvNurKvl
   TOOEWQd8e6rTX6GbaMzqpHdetoOQtC9zFATwqGpM5P5jz+827Za9chb0Q
   BxySnxhqjBBMunX97lhbR9KMS9rawEOnr0RzdA3i0N1o6zhS3dwqgGad1
   ijxHkFb3GruWHUgf86XwQdEfkkG8o4L/SxsPVWAV5+9H7K9bX3Bwe0jGd
   5RR4Ip+rSXzZqUIY6JOlqlonh/v6fHKdNpIwYqEeob2OhuMzkzh6kmtJ+
   o9sqzpPfJ0E39uTpVftGCXTMdur1SbhNM0MOtuR9g7mtGYzg8u80rLs5P
   w==;
X-CSE-ConnectionGUID: IynWbnfdSk2LNzTesuMI1A==
X-CSE-MsgGUID: EdJ8ZcaIQRCPREM5UzbIxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="98031019"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="98031019"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 00:00:40 -0800
X-CSE-ConnectionGUID: bUhIEx1fRtCP1qo4BUFcJw==
X-CSE-MsgGUID: Es44zU44TBW69S46ho8YTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="214457242"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Feb 2026 00:00:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsyxT-0000000132j-0c8M;
	Thu, 19 Feb 2026 08:00:23 +0000
Date: Thu, 19 Feb 2026 15:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>
Subject: arch/mips/include/asm/bitops.h:104:2: warning: used $at
 (currently $1) without ".set noat"
Message-ID: <202602191524.ahByivoK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   956b9cbd7f156c8672dac94a00de3c6a0939c692
commit: 511b3b644e28d9b66e32515a74c57ff599e89035 nvmet: pci-epf: move DMA initialization to EPC init callback
date:   3 months ago
config: mips-randconfig-r111-20260219 (https://download.01.org/0day-ci/archive/20260219/202602191524.ahByivoK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602191524.ahByivoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602191524.ahByivoK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/pci-epf.c:11:
   In file included from include/linux/delay.h:12:
   In file included from include/linux/math.h:6:
   In file included from arch/mips/include/asm/div64.h:89:
   In file included from include/asm-generic/div64.h:55:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
>> arch/mips/include/asm/bitops.h:104:2: warning: used $at (currently $1) without ".set noat" [-Winline-asm]
     104 |         __bit_op(*m, "or\t%0, %2", "ir"(BIT(bit)));
         |         ^
   arch/mips/include/asm/bitops.h:33:3: note: expanded from macro '__bit_op'
      33 |         "1:     " __stringify(LONG_LL)  "       %0, %1  \n"     \
         |          ^
   <inline asm>:4:13: note: instantiated into assembly here
       4 | 1:      ll      $3, 0($1)       
         |                       ^
   In file included from drivers/nvme/target/pci-epf.c:11:
   In file included from include/linux/delay.h:12:
   In file included from include/linux/math.h:6:
   In file included from arch/mips/include/asm/div64.h:89:
   In file included from include/asm-generic/div64.h:55:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
>> arch/mips/include/asm/bitops.h:104:2: warning: used $at (currently $1) without ".set noat" [-Winline-asm]
     104 |         __bit_op(*m, "or\t%0, %2", "ir"(BIT(bit)));
         |         ^
   arch/mips/include/asm/bitops.h:35:3: note: expanded from macro '__bit_op'
      35 |         "       " __stringify(LONG_SC)  "       %0, %1  \n"     \
         |          ^
   <inline asm>:6:11: note: instantiated into assembly here
       6 |         sc      $3, 0($1)       
         |                       ^
   2 warnings generated.


vim +104 arch/mips/include/asm/bitops.h

cc99987c375e49 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01   62  
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   63  /*
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   64   * These are the "slower" versions of the functions and are in bitops.c.
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   65   * These functions call raw_local_irq_{save,restore}().
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   66   */
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   67  void __mips_set_bit(unsigned long nr, volatile unsigned long *addr);
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   68  void __mips_clear_bit(unsigned long nr, volatile unsigned long *addr);
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   69  void __mips_change_bit(unsigned long nr, volatile unsigned long *addr);
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   70  int __mips_test_and_set_bit_lock(unsigned long nr,
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   71  				 volatile unsigned long *addr);
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   72  int __mips_test_and_clear_bit(unsigned long nr,
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   73  			      volatile unsigned long *addr);
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   74  int __mips_test_and_change_bit(unsigned long nr,
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   75  			       volatile unsigned long *addr);
8da36b26e3d864 arch/mips/include/asm/bitops.h Matthew Wilcox (Oracle  2023-10-04   76) bool __mips_xor_is_negative_byte(unsigned long mask,
8da36b26e3d864 arch/mips/include/asm/bitops.h Matthew Wilcox (Oracle  2023-10-04   77) 		volatile unsigned long *addr);
92d11594f688c8 arch/mips/include/asm/bitops.h Jim Quinlan             2012-09-06   78  
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   79  /*
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   80   * set_bit - Atomically set a bit in memory
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   81   * @nr: the bit to set
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   82   * @addr: the address to start counting from
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   83   *
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   84   * This function is atomic and may not be reordered.  See __set_bit()
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   85   * if you do not require the atomic guarantees.
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   86   * Note that @nr may be almost arbitrarily large; this function is not
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   87   * restricted to acting on a single-word quantity.
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   88   */
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   89  static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   90  {
c042be02d73053 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01   91  	volatile unsigned long *m = &addr[BIT_WORD(nr)];
c042be02d73053 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01   92  	int bit = nr % BITS_PER_LONG;
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16   93  
fe7cd97e68fac1 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01   94  	if (!kernel_uses_llsc) {
fe7cd97e68fac1 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01   95  		__mips_set_bit(nr, addr);
fe7cd97e68fac1 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01   96  		return;
fe7cd97e68fac1 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01   97  	}
fe7cd97e68fac1 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01   98  
59361e9975fd56 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01   99  	if ((MIPS_ISA_REV >= 2) && __builtin_constant_p(bit) && (bit >= 16)) {
f0b7ddbd794bdf arch/mips/include/asm/bitops.h Huang Pei               2021-12-15  100  		__bit_op(*m, __stringify(LONG_INS) " %0, %3, %2, 1", "i"(bit), "r"(~0));
fe7cd97e68fac1 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01  101  		return;
fe7cd97e68fac1 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01  102  	}
fe7cd97e68fac1 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01  103  
cc99987c375e49 arch/mips/include/asm/bitops.h Paul Burton             2019-10-01 @104  	__bit_op(*m, "or\t%0, %2", "ir"(BIT(bit)));
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16  105  }
^1da177e4c3f41 include/asm-mips/bitops.h      Linus Torvalds          2005-04-16  106  

:::::: The code at line 104 was first introduced by commit
:::::: cc99987c375e499a95572504d69c215591222072 MIPS: bitops: Abstract LL/SC loops

:::::: TO: Paul Burton <paul.burton@mips.com>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
