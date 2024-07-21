Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA52E1FBA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 03:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721533389; cv=none; b=NQ0ChZ1HFBRUGgq46sVbYBPT8IThHWk26UVmEqcu8vSBVEmC+kB/g3FmKevpuM/UDGhsgztt+v/SwSDxGDCeiqcAuGWE/RgAQjqvF8gmuAMD/UBOzMosdY/XNyoqL3RcKJZiUZBIRz5MOIBiJsrAZsF1ekKTcE+eLpMmihnqmsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721533389; c=relaxed/simple;
	bh=OzTHAhg7Z7xD1+4tQa7qfNjczh/x0YHSxFQVl71d6dI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QxJn5K8IHgNtBHJ1Tsl4Jf6vBsx2nS/EbnrW2SmmtLD0oTk65vyozrtnBtrlo0KFJDnGXuvq8u4fbWEF+7eyDLH41t3VWL7nc6Lr2mHmAm/VN/g6PXXmd9JZJA08J92C7gDw0A6VvJXUElHmw9Yjjq5VymbJOEnT6TntOPgZtVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVT/wj9s; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVT/wj9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721533387; x=1753069387;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OzTHAhg7Z7xD1+4tQa7qfNjczh/x0YHSxFQVl71d6dI=;
  b=SVT/wj9sVLGH/6DElyQj8cEETmuzUDUyOx7uf42BRcnpYsWiXTsCUKEg
   TNmfMxhxV0rXxk/I76CmmFCVuFP77Y0T81RFM6a05B52BxNPaDASUCzyR
   3+srZxXM35+YKr+t3+KHXgReM3LZK8e+i8pIT0oJ3L0c1etaue5u6UPwM
   UWSSbEokI1+rtOdCR0cRsJGri4xN8TpPEB0EkfO61jSrO/nMyMqnMGDrB
   PqYE0E8zUjCckI7jUuM43aCLxwp71nHrMTGcNG49LQO3v3zTfWDVYfR8i
   nKaPd+ZP5jYp0c4wIb0nOjp+exHY0TC953MZzkuBWcc3pBEmdzTmR0TLX
   g==;
X-CSE-ConnectionGUID: mAGhm75ATOqC554VNuMjCw==
X-CSE-MsgGUID: KZG+XsKPRm+ljo+6IG9ZbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19081825"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="19081825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 20:43:05 -0700
X-CSE-ConnectionGUID: QN47s+L/RC20bdiYQuRN8g==
X-CSE-MsgGUID: SgI+rVYsSTGXEWvbNtFMzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="56366281"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jul 2024 20:43:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVNTR-000ju8-0y;
	Sun, 21 Jul 2024 03:43:01 +0000
Date: Sun, 21 Jul 2024 11:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 32/43] arch/arm/mm/pgd.c:171:22: error: passing
 argument 2 of 'pte_free' from incompatible pointer type
Message-ID: <202407211139.qmTzbHfG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/alexshi/linux.git mmunstable
head:   6c298a18633e397b8be4d6f48fc8cd1f860dd896
commit: dfd6e54129e6900af4a60fccebed4ebb9f1dbacf [32/43] mm/pgtable: return ptdesc in pte_free
config: arm-randconfig-001-20240721 (https://download.01.org/0day-ci/archive/20240721/202407211139.qmTzbHfG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211139.qmTzbHfG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211139.qmTzbHfG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/mm/pgd.c: In function 'pgd_free':
>> arch/arm/mm/pgd.c:171:22: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     171 |         pte_free(mm, pte);
         |                      ^~~
         |                      |
         |                      pgtable_t {aka struct page *}
   In file included from arch/arm/include/asm/pgalloc.h:75,
                    from arch/arm/mm/pgd.c:13:
   include/asm-generic/pgalloc.h:108:66: note: expected 'struct ptdesc *' but argument is of type 'pgtable_t' {aka 'struct page *'}
     108 | static inline void pte_free(struct mm_struct *mm, struct ptdesc *ptdesc)
         |                                                   ~~~~~~~~~~~~~~~^~~~~~


vim +/pte_free +171 arch/arm/mm/pgd.c

^1da177e4c3f41 arch/arm/mm/mm-armv.c Linus Torvalds         2005-04-16  141  
6e4beb5e682953 arch/arm/mm/pgd.c     Russell King           2010-11-21  142  void pgd_free(struct mm_struct *mm, pgd_t *pgd_base)
^1da177e4c3f41 arch/arm/mm/mm-armv.c Linus Torvalds         2005-04-16  143  {
6e4beb5e682953 arch/arm/mm/pgd.c     Russell King           2010-11-21  144  	pgd_t *pgd;
84e6ffb2c49c79 arch/arm/mm/pgd.c     Mike Rapoport          2020-06-04  145  	p4d_t *p4d;
516295e5ab4bf9 arch/arm/mm/pgd.c     Russell King           2010-11-21  146  	pud_t *pud;
^1da177e4c3f41 arch/arm/mm/mm-armv.c Linus Torvalds         2005-04-16  147  	pmd_t *pmd;
0c82d83cb09a1c arch/arm/mm/pgd.c     Uwe Kleine-König       2008-02-27  148  	pgtable_t pte;
^1da177e4c3f41 arch/arm/mm/mm-armv.c Linus Torvalds         2005-04-16  149  
6e4beb5e682953 arch/arm/mm/pgd.c     Russell King           2010-11-21  150  	if (!pgd_base)
^1da177e4c3f41 arch/arm/mm/mm-armv.c Linus Torvalds         2005-04-16  151  		return;
^1da177e4c3f41 arch/arm/mm/mm-armv.c Linus Torvalds         2005-04-16  152  
6e4beb5e682953 arch/arm/mm/pgd.c     Russell King           2010-11-21  153  	pgd = pgd_base + pgd_index(0);
6e4beb5e682953 arch/arm/mm/pgd.c     Russell King           2010-11-21  154  	if (pgd_none_or_clear_bad(pgd))
6e4beb5e682953 arch/arm/mm/pgd.c     Russell King           2010-11-21  155  		goto no_pgd;
6e4beb5e682953 arch/arm/mm/pgd.c     Russell King           2010-11-21  156  
84e6ffb2c49c79 arch/arm/mm/pgd.c     Mike Rapoport          2020-06-04  157  	p4d = p4d_offset(pgd, 0);
84e6ffb2c49c79 arch/arm/mm/pgd.c     Mike Rapoport          2020-06-04  158  	if (p4d_none_or_clear_bad(p4d))
84e6ffb2c49c79 arch/arm/mm/pgd.c     Mike Rapoport          2020-06-04  159  		goto no_p4d;
84e6ffb2c49c79 arch/arm/mm/pgd.c     Mike Rapoport          2020-06-04  160  
84e6ffb2c49c79 arch/arm/mm/pgd.c     Mike Rapoport          2020-06-04  161  	pud = pud_offset(p4d, 0);
516295e5ab4bf9 arch/arm/mm/pgd.c     Russell King           2010-11-21  162  	if (pud_none_or_clear_bad(pud))
516295e5ab4bf9 arch/arm/mm/pgd.c     Russell King           2010-11-21  163  		goto no_pud;
516295e5ab4bf9 arch/arm/mm/pgd.c     Russell King           2010-11-21  164  
516295e5ab4bf9 arch/arm/mm/pgd.c     Russell King           2010-11-21  165  	pmd = pmd_offset(pud, 0);
6e4beb5e682953 arch/arm/mm/pgd.c     Russell King           2010-11-21  166  	if (pmd_none_or_clear_bad(pmd))
6e4beb5e682953 arch/arm/mm/pgd.c     Russell King           2010-11-21  167  		goto no_pmd;
^1da177e4c3f41 arch/arm/mm/mm-armv.c Linus Torvalds         2005-04-16  168  
0c82d83cb09a1c arch/arm/mm/pgd.c     Uwe Kleine-König       2008-02-27  169  	pte = pmd_pgtable(*pmd);
^1da177e4c3f41 arch/arm/mm/mm-armv.c Linus Torvalds         2005-04-16  170  	pmd_clear(pmd);
5e5419734c8719 arch/arm/mm/pgd.c     Benjamin Herrenschmidt 2008-02-04 @171  	pte_free(mm, pte);

:::::: The code at line 171 was first introduced by commit
:::::: 5e5419734c8719cbc01af959ad9c0844002c0df5 add mm argument to pte/pmd/pud/pgd_free

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
