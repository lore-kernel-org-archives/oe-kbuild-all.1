Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92108163
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 00:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721435455; cv=none; b=i4LVGWmaRGYSTV4LU+pR5hFgcqfCFOmHr0dtbsyaT35crnchfWOzWZ/Ftr1nzNkmn5G2WBfuCb97+ddGfoCcIJ/DRK0MqIqXbrkevuFxdxzWHNpvQjd8EdorzwQN0Z7hBnLHkptxuZgGHUMqxuRZeWKTgGyBBZYkVc556VNL2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721435455; c=relaxed/simple;
	bh=jOC6T90fiszoANKg/V24lIL6eC2l6CmEtvUMC4/uXEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jE6YeizPloPjFz0QNk+c4rUvChNtQkpBtBhmubVFWd6sFw1KH7hyk/3xSkiTzaFDuPTbQkOMJyhbKR3azXg3EtmXVfU67DyzknY+e0GuL8ooyawXm6C1F+FTRVoU+IT6VOBtQN8R+xlnU8NLP6cFvUhyXbrIsl26j7ZT32dYqyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVG22SFH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVG22SFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721435454; x=1752971454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jOC6T90fiszoANKg/V24lIL6eC2l6CmEtvUMC4/uXEs=;
  b=JVG22SFHJ+V8Vm5B9Zwep1Z7VtmCKJ7NDAC9MGICHipW0CFqloyB+6Pb
   6Q6wJTRsejGnR8zPmx1WrLjV64UPe1XDPg7WCYJGQqFvQzW3AsrHjiDLn
   JgZG4r23O8VN4ho2EQVntU5DCHJuNwqgIDHa8UYcFTfdf7Q7ClfCQH3Ii
   71AsAkPoH5ZeTew/Ik+HfpQJVdsGcXKs8YX9SH+P958Yk5fRb8E82nppg
   5lecMoPCVIv9vkDX7pGp6Ak74mEOUOAHeLF4SyvSI6stJ1p4ebeYfbFMp
   2wRpSiVtnQhNoymZz+3VigHEsWLzVwvoof2if1NwXs1Y2XpPZb9amCUtV
   A==;
X-CSE-ConnectionGUID: 4l2syD9CTVmAJa9aa3qgFw==
X-CSE-MsgGUID: T/t2pt3ER8GEVwIfYQZ76Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22838320"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="22838320"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 17:30:53 -0700
X-CSE-ConnectionGUID: HYjM+CYyQhWfeJzuJ0DW8w==
X-CSE-MsgGUID: abDDGLhjTDiNShJwqo4jeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="56119555"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jul 2024 17:30:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUxzt-000ihy-2N;
	Sat, 20 Jul 2024 00:30:49 +0000
Date: Sat, 20 Jul 2024 08:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable3 31/35] mm/memory.c:448:33: error:
 initialization of 'struct ptdesc *' from incompatible pointer type
 'pgtable_t' {aka 'long unsigned int *'}
Message-ID: <202407200817.geeTqtpZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable3
head:   3fb6eb9b0272c82ed231fdf2a20f6b6d265c4259
commit: 91edffa2a9b88000a9aa062ec72e804f3d35cd8a [31/35] pgtable: fully use ptdesc in pte_alloc_one series functions
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407200817.geeTqtpZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200817.geeTqtpZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200817.geeTqtpZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function '__pte_alloc':
>> mm/memory.c:448:33: error: initialization of 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'long unsigned int *'} [-Wincompatible-pointer-types]
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                                 ^~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   include/linux/mm_types.h:504:41: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/memory.c:454:30: note: in expansion of macro 'ptdesc_page'
     454 |                 pte_free(mm, ptdesc_page(ptdesc));
         |                              ^~~~~~~~~~~
   In file included from mm/memory.c:86:
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'long unsigned int *'} but argument is of type 'struct page *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/memory.c: In function '__do_fault':
   include/linux/mm_types.h:502:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:4650:37: note: in expansion of macro 'ptdesc_page'
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ^~~~~~~~~~~
   mm/memory.c: In function 'do_fault_around':
   include/linux/mm_types.h:502:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:5013:37: note: in expansion of macro 'ptdesc_page'
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                     ^~~~~~~~~~~


vim +448 mm/memory.c

   445	
   446	int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
   447	{
 > 448		struct ptdesc *ptdesc = pte_alloc_one(mm);
   449		if (!ptdesc)
   450			return -ENOMEM;
   451	
   452		pmd_install(mm, pmd, (pgtable_t *)ptdesc);
   453		if (ptdesc)
   454			pte_free(mm, ptdesc_page(ptdesc));
   455		return 0;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
