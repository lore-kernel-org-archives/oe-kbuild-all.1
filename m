Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643DC320F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189227; cv=none; b=gdnrMaCcWGtdgMBsAvv/cJzWlzGvI1YiFgq11IAR6tJ9mftoyOn1UdesxcOzj82oMLhQlt5Y3glt6t0W/zBhPeqRAJla9ufv0Rh8PIkE90eOvvr0Mzx62f9yQlalB04335RhQxPfUM5v0qPzv6D9PdnKSzoWJ+TIYMFX45Ot/cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189227; c=relaxed/simple;
	bh=2cErqbyiBICWdnYTmDezVwO1MypxVA26NG2igApKHpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K3e2tVmEa+PhRZ+zDRt+U0SrCyMHzwrqoCHjkL7kXtWWb+BTnQj3QDIET3oWw14vy0nJjDe9PCC09ulagp9fRqaLVAyHVjnNfpEJ86SSZ8xBnTCOr1D9sHRB3MrlFi6mg9F31I4vWxW6cN2sDdZyJ4VijqG6799zlv8fplFqw1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1FWQbcI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1FWQbcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758189225; x=1789725225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2cErqbyiBICWdnYTmDezVwO1MypxVA26NG2igApKHpY=;
  b=Z1FWQbcIQRVk1TIiywgNFHkVvrQ8wm9EYhzO0ckrvsh3Jvb07usegQpd
   sBs5Pw1qq/paBS5yIvgRHqhZs4RY9N9XKBVfzNPpssHjo4JwhzuiGs6mt
   qLx/FHEDk8k+8xV5+HdcG0cYQZNnLt0SNT1Ym89IZRbNxpxmvI+Emy1NB
   cc7IGBNNV6+jZvyRNBhe0NfWaCD46vTDoOVM67+dd2UKKepw74lOAaeBz
   oPXBqWStIfB+LUcMKrhqCDFdREol0nRC/qZEI4vCjxhPO/HARn9/eG6bQ
   E8qhalrMu3xKR+7T8PHkiBdOq9HtPCMjcrayak68yd+kiea6y6IfgCbzu
   g==;
X-CSE-ConnectionGUID: hoUAJQO9R9qlf76FrE/ydA==
X-CSE-MsgGUID: Zp8rnp9dQYGl+LNh0BiRSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71882277"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="71882277"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 02:53:45 -0700
X-CSE-ConnectionGUID: 0R2XNC8kQWyvhlxETnCmGQ==
X-CSE-MsgGUID: NhOaMg56TBuoToW4ZqYi1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="180611959"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2025 02:53:43 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzBKd-00034z-32;
	Thu, 18 Sep 2025 09:53:39 +0000
Date: Thu, 18 Sep 2025 17:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [akpm-mm:mm-unstable 235/243] include/linux/mm.h:3679:16: error:
 incompatible types when returning type 'pgprot_t' but 'long unsigned int'
 was expected
Message-ID: <202509181744.SIHyVUMm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   1f98191f08b46ad015d4480af96541b521fa2411
commit: 322cdf975a863b1d694bfb2d4232eef49944b91f [235/243] mm: abstract io_remap_pfn_range() based on PFN
config: csky-randconfig-002-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181744.SIHyVUMm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181744.SIHyVUMm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181744.SIHyVUMm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/csky/include/asm/cacheflush.h:6,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/buffer_head.h:12,
                    from fs/hfsplus/hfsplus_fs.h:22,
                    from fs/hfsplus/attributes.c:10:
   include/linux/mm.h: In function 'io_remap_pfn_range_prot':
>> include/linux/mm.h:3679:16: error: incompatible types when returning type 'pgprot_t' but 'long unsigned int' was expected
    3679 |         return prot;
         |                ^~~~
   include/linux/mm.h: In function 'io_remap_pfn_range':
>> include/linux/mm.h:3699:31: error: invalid initializer
    3699 |         const pgprot_t prot = io_remap_pfn_range_prot(orig_prot);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/csky/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from fs/hfsplus/hfsplus_fs.h:20:
   arch/csky/abiv2/inc/abi/cacheflush.h: In function 'flush_dcache_folio':
   arch/csky/abiv2/inc/abi/cacheflush.h:23:39: error: passing argument 2 of 'const_test_bit' from incompatible pointer type [-Wincompatible-pointer-types]
      23 |         if (test_bit(PG_dcache_clean, &folio->flags))
         |                                       ^~~~~~~~~~~~~
         |                                       |
         |                                       memdesc_flags_t *
   include/linux/bitops.h:47:24: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   arch/csky/abiv2/inc/abi/cacheflush.h:23:13: note: in expansion of macro 'test_bit'
      23 |         if (test_bit(PG_dcache_clean, &folio->flags))
         |             ^~~~~~~~
   In file included from include/linux/bitops.h:28:
   include/asm-generic/bitops/generic-non-atomic.h:166:64: note: expected 'const volatile long unsigned int *' but argument is of type 'memdesc_flags_t *'
     166 | const_test_bit(unsigned long nr, const volatile unsigned long *addr)
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/csky/abiv2/inc/abi/cacheflush.h:23:39: error: passing argument 2 of 'generic_test_bit' from incompatible pointer type [-Wincompatible-pointer-types]
      23 |         if (test_bit(PG_dcache_clean, &folio->flags))
         |                                       ^~~~~~~~~~~~~
         |                                       |
         |                                       memdesc_flags_t *
   include/linux/bitops.h:47:39: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   arch/csky/abiv2/inc/abi/cacheflush.h:23:13: note: in expansion of macro 'test_bit'
      23 |         if (test_bit(PG_dcache_clean, &folio->flags))
         |             ^~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:121:66: note: expected 'const volatile long unsigned int *' but argument is of type 'memdesc_flags_t *'
     121 | generic_test_bit(unsigned long nr, const volatile unsigned long *addr)
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from arch/csky/include/asm/cacheflush.h:7:
   arch/csky/abiv2/inc/abi/cacheflush.h:24:44: error: passing argument 2 of 'clear_bit' from incompatible pointer type [-Wincompatible-pointer-types]
      24 |                 clear_bit(PG_dcache_clean, &folio->flags);
         |                                            ^~~~~~~~~~~~~
         |                                            |
         |                                            memdesc_flags_t *
   In file included from include/asm-generic/bitops/atomic.h:68,
                    from arch/csky/include/asm/bitops.h:70,
                    from include/linux/bitops.h:67:
   include/asm-generic/bitops/instrumented-atomic.h:39:72: note: expected 'volatile long unsigned int *' but argument is of type 'memdesc_flags_t *'
      39 | static __always_inline void clear_bit(long nr, volatile unsigned long *addr)
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
--
   In file included from include/linux/xattr.h:18,
                    from squashfs/xattr.c:16:
   include/linux/mm.h: In function 'io_remap_pfn_range_prot':
>> include/linux/mm.h:3679:16: error: incompatible types when returning type 'pgprot_t' but 'long unsigned int' was expected
    3679 |         return prot;
         |                ^~~~
   include/linux/mm.h: In function 'io_remap_pfn_range':
>> include/linux/mm.h:3699:31: error: invalid initializer
    3699 |         const pgprot_t prot = io_remap_pfn_range_prot(orig_prot);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~


vim +3679 include/linux/mm.h

  3674	
  3675	#ifdef io_remap_pfn_range_pfn
  3676	static inline unsigned long io_remap_pfn_range_prot(pgprot_t prot)
  3677	{
  3678		/* We do not decrypt if arch customises PFN. */
> 3679		return prot;
  3680	}
  3681	#else
  3682	static inline unsigned long io_remap_pfn_range_pfn(unsigned long pfn,
  3683			unsigned long size)
  3684	{
  3685		return pfn;
  3686	}
  3687	
  3688	static inline pgprot_t io_remap_pfn_range_prot(pgprot_t prot)
  3689	{
  3690		return pgprot_decrypted(prot);
  3691	}
  3692	#endif
  3693	
  3694	static inline int io_remap_pfn_range(struct vm_area_struct *vma,
  3695					     unsigned long addr, unsigned long orig_pfn,
  3696					     unsigned long size, pgprot_t orig_prot)
  3697	{
  3698		const unsigned long pfn = io_remap_pfn_range_pfn(orig_pfn, size);
> 3699		const pgprot_t prot = io_remap_pfn_range_prot(orig_prot);
  3700	
  3701		return remap_pfn_range(vma, addr, pfn, size, prot);
  3702	}
  3703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
