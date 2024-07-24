Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E7158A01
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721827287; cv=none; b=OL+Uv7/5Jo4O0/nzlDolVBnaRFNIiPROgEW1vEmEGH7zRja+0ULS2ogV2vUNE7eAWKBBP+6cQOMfEQCzsmAWq/liP3P6KQtCdbVfhMpoFTaTQqTlvVS4U43oKlSt5gSKVuNcfORKBhjaC7hKfjpnUPhS5Ce7JcI/qsKhpmTQS6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721827287; c=relaxed/simple;
	bh=7m+ohxlJytFfVezNwmezrZv5CY1wMIseM9e6kT2tWxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uOYcnNuN1tpcM/Vw7unWWN7YoQP+gJPefZNBvVjCZ3998vU4gmSn5slUGN6Fc47dDshiPN1Zv6wBbENDSvF2OTTtu7msRJr/4k8eT3elP3vNx/qAe4lfaMQSkjalehooqcNkBb4rfVHOUjMnvMH8BtLZ8an+w7/YHaKHuS3xkRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rso9SbOs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rso9SbOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721827285; x=1753363285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7m+ohxlJytFfVezNwmezrZv5CY1wMIseM9e6kT2tWxQ=;
  b=Rso9SbOsLG+Vg/sg0VO1UpQZfjMxL6KeBk2xaJNS2Qb4ePYY+dR9I2YI
   tZZQzIv5DzQLjmBhV1tRdkaTzWqZG6YMzb3TB65sUYv0Ewy/6ysVtQkwz
   XW/Di3Xos4s+HCjygZBeYRrRMYqHGiViQvSbLOkuwvyZhPLt1eFmDwxKK
   DbEWQQlBM6nBaLqCzlDch0pcrwuA6V546lX6ZQ4j7svub8Q118JoCrwej
   hDcKCHJ6Z0AOzAMTzVNTpOcDJ9SvI8Jc4aIZ4Vb0psbGG48fBFfZUh8tM
   1K5+HNlR+oVGHoQjxA+0+x7YDJkFy7DyPfPQC7F8zpiXAjibrmhFDczQx
   g==;
X-CSE-ConnectionGUID: x2c+s9TOSAuSsrN9Z4yyIA==
X-CSE-MsgGUID: ZbcBA0dKTfuw/8ASN4KjIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="22411993"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="22411993"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:21:21 -0700
X-CSE-ConnectionGUID: UJKk7GH6SU63g2ALeucCBg==
X-CSE-MsgGUID: 9pM1HUsNTH+lPK7+aXHPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="52808814"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jul 2024 06:21:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWbvh-000n1D-1U;
	Wed, 24 Jul 2024 13:21:17 +0000
Date: Wed, 24 Jul 2024 21:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 33/41] include/linux/mm_types.h:510:51: error:
 '_Generic' selector of type 'struct ptdesc *' is not compatible with any
 association
Message-ID: <202407242141.3hZS4agH-lkp@intel.com>
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
commit: 887c1bf7c199edf9083e31d7959f92735d410ec9 [33/41] mm/pgtable: introduce ptdesc_pfn and use ptdesc in free_pte_range()
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20240724/202407242141.3hZS4agH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242141.3hZS4agH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242141.3hZS4agH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/csky/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   mm/memory.c: In function 'free_pte_range':
>> include/linux/mm_types.h:510:51: error: '_Generic' selector of type 'struct ptdesc *' is not compatible with any association
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   arch/csky/include/asm/pgalloc.h:66:28: note: in expansion of macro 'page_ptdesc'
      66 |         pagetable_pte_dtor(page_ptdesc(pte));           \
         |                            ^~~~~~~~~~~
   include/asm-generic/tlb.h:706:17: note: in expansion of macro '__pte_free_tlb'
     706 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                 ^~~~~~~~~~~~~~
   mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~
>> include/linux/mm_types.h:510:51: error: '_Generic' selector of type 'struct ptdesc *' is not compatible with any association
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   arch/csky/include/asm/pgalloc.h:67:37: note: in expansion of macro 'page_ptdesc'
      67 |         tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));  \
         |                                     ^~~~~~~~~~~
   include/asm-generic/tlb.h:706:17: note: in expansion of macro '__pte_free_tlb'
     706 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                 ^~~~~~~~~~~~~~
   mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~


vim +510 include/linux/mm_types.h

9a35de4ffc209b Vishal Moola (Oracle  2023-08-07  501) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  502) #define ptdesc_page(pt)			(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  503) 	const struct ptdesc *:		(const struct page *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  504) 	struct ptdesc *:		(struct page *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  505) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  506) #define ptdesc_folio(pt)		(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  507) 	const struct ptdesc *:		(const struct folio *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  508) 	struct ptdesc *:		(struct folio *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  509) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07 @510) #define page_ptdesc(p)			(_Generic((p),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  511) 	const struct page *:		(const struct ptdesc *)(p),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  512) 	struct page *:			(struct ptdesc *)(p)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  513) 

:::::: The code at line 510 was first introduced by commit
:::::: bf2d4334f72e4e033166c5a3bf1331a7238eab9d mm: add utility functions for ptdesc

:::::: TO: Vishal Moola (Oracle) <vishal.moola@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
