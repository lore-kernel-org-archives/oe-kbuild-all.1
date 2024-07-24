Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462F3158A19
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721829447; cv=none; b=Vyl8ZtdxnaaqOtmzbxRrkEEw2sXn8yP6ffzWku0dQeq9yI3PA5BjP8c/WwX9TWl5KmMA23KH9qHnwg9NPvGhiA0vLjonzCR1WjncLUTcWrhreZIuf+GWU9KmRHU3U/0tBUDTLJVxAGAEqWtO5SkICry5HC03I3przI0vwtgrQlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721829447; c=relaxed/simple;
	bh=jbwauz8wPclS+jKgH+Skd7U6mBldqJ2orI2okmReRG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8X8uqXHX4+euCvJ2npInUn2E3pUnoRthnQvjvTLVl6JvwC+rTpTQQTgTm1o0smny06dCn3dXmmZMuO9yNLeR4aHrtOGyo8dGAWRSSRJ3U+9l8+pcoz+Y3Rg0Gk2FF+ZZ4ZpEfcraXfr8tXU2HqhD7DcoYiatXMiqrkEamLPxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiZh+QLv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiZh+QLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721829445; x=1753365445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jbwauz8wPclS+jKgH+Skd7U6mBldqJ2orI2okmReRG4=;
  b=LiZh+QLvbtb6mye5OsC4c+e3Z75XBkZZ0WtPblEjYB1m/sdGs2e75zcG
   PYO4ffh+fElHgA8faxOfxpdpQTsQot906D1644dj79iNIsvmCvb29NSvd
   VHyO2UbxyluT0j3DYaMOahMnAqYRZLKyLW39aeiC4kpC3o4knHBBsCb3f
   irO5EUQzIW+NI/syC7truxZxnu87gesR/OCA9ZaxGshtUDepbKLbLA/Uj
   0SC18OBIMdVTQlUI6+yqokFLL7fE8FbG+RzfLP6ITE08Rd9H2tf8OXh1x
   qbmGrjdO5zyGovVWrSCL9fFrB7vXrBUp6+ci+HWUP6wKQAHEVEERaD6lF
   g==;
X-CSE-ConnectionGUID: ZP0kWK5OTl+0XrRyw7232A==
X-CSE-MsgGUID: z1VzZAnhSpGzBBmqKePidg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30107932"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="30107932"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:57:22 -0700
X-CSE-ConnectionGUID: nMf/+0aLQwCFoK1jbEoFGQ==
X-CSE-MsgGUID: 9l7P3J4RSxmScNcFuqcZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="53367252"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Jul 2024 06:57:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWcUY-000n3Y-1x;
	Wed, 24 Jul 2024 13:57:18 +0000
Date: Wed, 24 Jul 2024 21:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 31/41] mm/memory.c:448:17: error: incompatible
 pointer types initializing 'struct ptdesc *' with an expression of type
 'pte_t *'
Message-ID: <202407242121.X3GeosZX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   45de53e1a6ceb1ede64b54126f9ee514f50c4e4c
commit: a0b75c1c1fda3892f1c8e0946254a4cb1226e10a [31/41] mm/pgtable: fully use ptdesc in pte_alloc_one series functions
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240724/202407242121.X3GeosZX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242121.X3GeosZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242121.X3GeosZX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:44:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:45:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/memory.c:448:17: error: incompatible pointer types initializing 'struct ptdesc *' with an expression of type 'pte_t *' [-Werror,-Wincompatible-pointer-types]
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                        ^        ~~~~~~~~~~~~~~~~~
   mm/memory.c:4650:35: error: controlling expression type 'pte_t *' not compatible with any generic association type
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgalloc.h:140:28: note: expanded from macro 'pte_alloc_one'
     140 | #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
         |                            ^
   include/linux/mm_types.h:502:38: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                    ^~
   mm/memory.c:5013:35: error: controlling expression type 'pte_t *' not compatible with any generic association type
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgalloc.h:140:28: note: expanded from macro 'pte_alloc_one'
     140 | #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
         |                            ^
   include/linux/mm_types.h:502:38: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                    ^~
   15 warnings and 3 errors generated.


vim +448 mm/memory.c

   445	
   446	int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
   447	{
 > 448		struct ptdesc *ptdesc = pte_alloc_one(mm);
   449		if (!ptdesc)
   450			return -ENOMEM;
   451	
   452		pmd_install(mm, pmd, (pgtable_t *)&ptdesc);
   453		if (ptdesc)
   454			pte_free(mm, ptdesc_page(ptdesc));
   455		return 0;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
