Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F37478
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 01:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771463839; cv=none; b=fjxRbPAuIPnothLArkwRRp7Gq6J86giFkApamrd5hpSvTDlkrnQo62+Y8OuUNJB11/uQ5W9ppL31SlQzJd7br/yZTWP3AJV/+1pUBAe5GDbK4b5OM7m8LMb4F3MfFSqFOOP2vI8Zf9aYURCGWRt6KD0jShAaz3BviTXVQ0kiw2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771463839; c=relaxed/simple;
	bh=Ja9SGwJ87ILljnRkYsUKDc53ccou1nFZ3fTleLrCiHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rKtOiN5T/ojx06zXnMtb1+R9u8EtNJH4hR/PxXS+fUCiUW0Pxg/DpS4B376p+xeHgjj8AecIKgWA4+ZsLeEbyTfxZbabb+e1NdV2IwJOhCyq1/LUiICm22CBrwpU13PnhRzMLdZ64Jnpx5aLN27kY5zymWBS9a6bWWNhfBPLqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/scU2+j; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/scU2+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771463838; x=1802999838;
  h=date:from:to:cc:subject:message-id;
  bh=Ja9SGwJ87ILljnRkYsUKDc53ccou1nFZ3fTleLrCiHg=;
  b=W/scU2+jhktfoZ0Q9oPZMZnWYgYJShpqOMRNUEj9joBSwk0YeD7KvHEW
   e/5G4xjeRkynufgwSUfVms+Lta9lRAfnT9sz/SZMNvKeKLWt3/aVugGlH
   M3pM4klzYjFiMSu/A5llXOB3ktIxPuLTepV98aR6mI4rRwPauLEpF/RO9
   m4GVhBuw2IeKPSfTQSmKH99Fs7zTBO2jgW8JDtTFfyaHo0q2x2gOTizvV
   lJD4AkXuRpkmPto75mHuuXrxv9FNG6g1IwfMnCUllBlBwDIgS9dBEE4nD
   sdCRqSgLv5mGywSSvXZ4uq0KgCEj2O7rCZdTqFLR/5v9xaKFYcfKWuGB2
   Q==;
X-CSE-ConnectionGUID: MLR+n02TR/a/EGuI5FBGcg==
X-CSE-MsgGUID: O1q5CIo4R5yHB1GkDQdIHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76411190"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="76411190"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 17:17:17 -0800
X-CSE-ConnectionGUID: G55t0p43QQW8Ykc2Kk1RlQ==
X-CSE-MsgGUID: YhWQBTZkTe+PB3GKKPc+RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="218893645"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2026 17:17:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vssfJ-000000012rY-26be;
	Thu, 19 Feb 2026 01:17:13 +0000
Date: Thu, 19 Feb 2026 09:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 14/27] include/linux/mm.h:1809:42: error:
 suggest parentheses around arithmetic in operand of '|'
Message-ID: <202602190941.LUg9MGdn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   1903e57e83c0c0526b0ee193ce32e6aac90863af
commit: 8a48b8586ecc217f251fd845643e34839cbb1e9d [14/27] mm: Introduce mkpte() and folio_mkpte()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602190941.LUg9MGdn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190941.LUg9MGdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190941.LUg9MGdn-lkp@intel.com/

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
>> include/linux/mm.h:1809:42: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
    1809 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1809:16: note: in expansion of macro 'pfn_pte'
    1809 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:1828:41: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
    1828 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1828:16: note: in expansion of macro 'pfn_pte'
    1828 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ^~~~~~~
   cc1: all warnings being treated as errors


vim +1809 include/linux/mm.h

  1803	
  1804	#ifdef CONFIG_MMU
  1805	static inline pte_t mkpte(struct page *page, unsigned long pteoff, pgprot_t pgprot)
  1806	{
  1807		unsigned long off = pteoff & ((1UL << (PG_SHIFT - PTE_SHIFT)) - 1);
  1808	
> 1809		return pfn_pte(page_to_pfn(page) + off, pgprot);
  1810	}
  1811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
