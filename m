Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD8D630
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 00:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5MN6fL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697501708; x=1729037708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LuF4ec017KFYr2PNK6123OWOnRNfrdA4Y6QegB69+bk=;
  b=c5MN6fL1zmDlC8Merh1zBK7EgIlQZy11VQqlsCpsSiPsvcjJgAFoCGHK
   ngDOyk3n223L1tDttmfbxBxzSiW2YKB1SOdgq0lSb6p0PDz6AOvxesFbd
   99XN7/GUf2++TvOwNRDH79szVAo7sbidl2KIpQxEyXnvRcbzsZrD32wvw
   yYFXm50vjBaDQMAbV4PfGLpD+CmK6wYUrebCwIRrbpWg+4tLXtQCM79GS
   GKsWobwoi9qyLoC6BVAyqtDyO7c0McMxbClGlyRd20JEIMY+T4DpPGXlS
   HrwQVhZTFTEwYNdMLniUc/3uDx0jbLP7rqhqI6AdUvxwM4NLrGAxoQJUO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384540632"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="384540632"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 17:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="785284186"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="785284186"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Oct 2023 17:15:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsXji-0008lz-2C;
	Tue, 17 Oct 2023 00:15:02 +0000
Date: Tue, 17 Oct 2023 08:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pfcp 11/19] include/linux/bitmap.h:642:17: warning: array
 subscript [1, 1024] is outside array bounds of 'long unsigned int[1]'
Message-ID: <202310170708.fJzLlgDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pfcp
head:   9183a3eb639912169a3d3e2be4f25556b465919b
commit: c8a652cdcc0964510f108726b3da0784d1bc0cd2 [11/19] bitmap: make bitmap_{get,set}_value8() use bitmap_{read,write}()
config: x86_64-randconfig-004-20231017 (https://download.01.org/0day-ci/archive/20231017/202310170708.fJzLlgDM-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170708.fJzLlgDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170708.fJzLlgDM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/gpio/gpio-pca953x.c:11:
   drivers/gpio/gpio-pca953x.c: In function 'pca953x_probe':
>> include/linux/bitmap.h:642:17: warning: array subscript [1, 1024] is outside array bounds of 'long unsigned int[1]' [-Warray-bounds]
     642 |  map[index + 1] &= BITMAP_FIRST_WORD_MASK(start + nbits);
         |                 ^~
   In file included from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/gpio/gpio-pca953x.c:11:
   drivers/gpio/gpio-pca953x.c:1032:17: note: while referencing 'val'
    1032 |  DECLARE_BITMAP(val, MAX_LINE);
         |                 ^~~
   include/linux/types.h:11:16: note: in definition of macro 'DECLARE_BITMAP'
      11 |  unsigned long name[BITS_TO_LONGS(bits)]
         |                ^~~~
   In file included from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/gpio/gpio-pca953x.c:11:
>> include/linux/bitmap.h:642:17: warning: array subscript [1, 1024] is outside array bounds of 'long unsigned int[1]' [-Warray-bounds]
     642 |  map[index + 1] &= BITMAP_FIRST_WORD_MASK(start + nbits);
         |                 ^~
   In file included from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/gpio/gpio-pca953x.c:11:
   drivers/gpio/gpio-pca953x.c:1032:17: note: while referencing 'val'
    1032 |  DECLARE_BITMAP(val, MAX_LINE);
         |                 ^~~
   include/linux/types.h:11:16: note: in definition of macro 'DECLARE_BITMAP'
      11 |  unsigned long name[BITS_TO_LONGS(bits)]
         |                ^~~~
   In file included from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/gpio/gpio-pca953x.c:11:
   include/linux/bitmap.h:643:17: warning: array subscript [1, 1024] is outside array bounds of 'long unsigned int[1]' [-Warray-bounds]
     643 |  map[index + 1] |= (value >> space);
         |                 ^~
   In file included from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/gpio/gpio-pca953x.c:11:
   drivers/gpio/gpio-pca953x.c:1032:17: note: while referencing 'val'
    1032 |  DECLARE_BITMAP(val, MAX_LINE);
         |                 ^~~
   include/linux/types.h:11:16: note: in definition of macro 'DECLARE_BITMAP'
      11 |  unsigned long name[BITS_TO_LONGS(bits)]
         |                ^~~~
   In file included from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/gpio/gpio-pca953x.c:11:
   include/linux/bitmap.h:643:17: warning: array subscript [1, 1024] is outside array bounds of 'long unsigned int[1]' [-Warray-bounds]
     643 |  map[index + 1] |= (value >> space);
         |                 ^~
   In file included from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/gpio/gpio-pca953x.c:11:
   drivers/gpio/gpio-pca953x.c:1032:17: note: while referencing 'val'
    1032 |  DECLARE_BITMAP(val, MAX_LINE);
         |                 ^~~
   include/linux/types.h:11:16: note: in definition of macro 'DECLARE_BITMAP'
      11 |  unsigned long name[BITS_TO_LONGS(bits)]
         |                ^~~~


vim +642 include/linux/bitmap.h

c8ac468adba7fe Syed Nayyar Waris 2023-10-11  603  
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  604  /**
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  605   * bitmap_write - write n-bit value within a memory region
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  606   * @map: address to the bitmap memory region
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  607   * @value: value to write, clamped to nbits
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  608   * @start: bit offset of the n-bit value
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  609   * @nbits: size of value in bits, nonzero, up to BITS_PER_LONG.
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  610   *
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  611   * bitmap_write() behaves as-if implemented as @nbits calls of __assign_bit(),
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  612   * i.e. bits beyond @nbits are ignored:
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  613   *
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  614   *   for (bit = 0; bit < nbits; bit++)
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  615   *           __assign_bit(start + bit, bitmap, val & BIT(bit));
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  616   */
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  617  static inline void bitmap_write(unsigned long *map,
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  618  				unsigned long value,
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  619  				unsigned long start, unsigned long nbits)
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  620  {
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  621  	size_t index;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  622  	unsigned long offset;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  623  	unsigned long space;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  624  	unsigned long mask;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  625  	bool fit;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  626  
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  627  	if (unlikely(!nbits))
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  628  		return;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  629  
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  630  	mask = BITMAP_LAST_WORD_MASK(nbits);
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  631  	value &= mask;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  632  	offset = start % BITS_PER_LONG;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  633  	space = BITS_PER_LONG - offset;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  634  	fit = space >= nbits;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  635  	index = BIT_WORD(start);
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  636  
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  637  	map[index] &= (fit ? (~(mask << offset)) : ~BITMAP_FIRST_WORD_MASK(start));
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  638  	map[index] |= value << offset;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  639  	if (fit)
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  640  		return;
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  641  
c8ac468adba7fe Syed Nayyar Waris 2023-10-11 @642  	map[index + 1] &= BITMAP_FIRST_WORD_MASK(start + nbits);
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  643  	map[index + 1] |= (value >> space);
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  644  }
c8ac468adba7fe Syed Nayyar Waris 2023-10-11  645  

:::::: The code at line 642 was first introduced by commit
:::::: c8ac468adba7fe930ec22f392d5f127b768deccc lib/bitmap: add bitmap_{read,write}()

:::::: TO: Syed Nayyar Waris <syednwaris@gmail.com>
:::::: CC: Alexander Lobakin <aleksander.lobakin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
