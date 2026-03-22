Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DC233ADBF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774209676; cv=none; b=Yr1j1x5P+qQO/3Q9Th7HMNUAoJU6BvH6OZ4msl/eUNie/2nxBpikcfFotDUkhticYYSOwH7Ksc8YoN3ZJdGbRs8bnbd2woh0AzylAjA6reHz+dyfGtEH+HmazlSLPkmmGih70kiP9AFj3UkIetxEnRyFlfu4r6oNK61lS+LUu6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774209676; c=relaxed/simple;
	bh=4I70fhAjpqtwvLRAESxpo3HLJmdZMe5uZSAixH5clnI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RB3Rcp5+mqpqS4giNkNtRoaaJwq4xrfqA7t5gmrLIARcXvEMKuqio3XaMcvaj4jFUvxmY9/Qrb08tbWJc7+kWnNaiHXbSygZfbVgM2m9Tc2oL7FUNLUMVESqrpNN1Br5xWu1nRtBpeNBoU5szHpsFlZqJI3DImiQZWjrAN3/9ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCejXGUO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCejXGUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774209674; x=1805745674;
  h=date:from:to:cc:subject:message-id;
  bh=4I70fhAjpqtwvLRAESxpo3HLJmdZMe5uZSAixH5clnI=;
  b=nCejXGUOII41L47ANuFZ9yl7U90XOynvJXXyNpcEhld2K/sOk+KijG2q
   8pnDG7pCxW86845uMWDGiJ/EirrRyq+5nt9qpklxRI6VghYkwOhsvSa9S
   HtXv0lt17NZaQ0+SB298LOYZm7fRjMvTB6lrb6SNrmmLmwoZUv0XVQjbX
   qS27/fT9/GaPhSCKNOmUnqf6j3Up9E1s8gPDsiEoy4bQeMAhlJ0BE5U1b
   1IP1au8Cr2RiInP3gTRvOsIYypmAcx6YkA8x1+fZe8PrbpDzMgjKoDwhV
   fjuBAM1kPBbcA8uyL99kOIFM91c0JGFxmRtlYY3lbkC3MaOpP9p6oju2/
   Q==;
X-CSE-ConnectionGUID: yydtQtPATI6qrnBfUBUFfg==
X-CSE-MsgGUID: j2VyEYPWRWOlk3lxRqzznQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75101470"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75101470"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 13:01:14 -0700
X-CSE-ConnectionGUID: 3bRt3LAwRQinwylbfLeY8Q==
X-CSE-MsgGUID: 5Oi4X1VjSn2D/UB6GA4YSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="222908179"
Received: from lkp-server02.sh.intel.com (HELO c2cbc2b066eb) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Mar 2026 13:01:12 -0700
Received: from kbuild by c2cbc2b066eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Oz0-00000000032-0tKU;
	Sun, 22 Mar 2026 20:01:10 +0000
Date: Mon, 23 Mar 2026 04:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 14/30] include/linux/mm.h:2290:42: error:
 suggest parentheses around arithmetic in operand of '|'
Message-ID: <202603230325.JWMF5d91-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3ecd2bc82d7d0382233099de8d07616df26745c4
commit: cdc06b03f4725681883e0faf3b429849cd5c3475 [14/30] mm: Introduce mkpte() and folio_mkpte()
config: nios2-randconfig-001-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230325.JWMF5d91-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230325.JWMF5d91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230325.JWMF5d91-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from lib/test_bitops.c:10:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:2290:42: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2290:16: note: in expansion of macro 'pfn_pte'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:2309:41: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2309:16: note: in expansion of macro 'pfn_pte'
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ^~~~~~~
   cc1: all warnings being treated as errors


vim +2290 include/linux/mm.h

  2283	
  2284	#ifdef CONFIG_MMU
  2285	static inline pte_t mkpte(const struct page *page, unsigned long pteoff,
  2286			pgprot_t pgprot)
  2287	{
  2288		unsigned long off = pteoff & ((1UL << (PG_SHIFT - PTE_SHIFT)) - 1);
  2289	
> 2290		return pfn_pte(page_to_pfn(page) + off, pgprot);
  2291	}
  2292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
