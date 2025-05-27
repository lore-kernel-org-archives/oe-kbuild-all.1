Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D5C1DF749
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 06:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748327799; cv=none; b=KIJdS/U7V0/7U3Vs1J/AJ/k/1l3dZTn2/+E81GDQRxeqeXEJFM7WALffOJ95ld5A9wthlDHsGMGLyjPANuCGl6Ml/2N6ZjTJnDLe248lpMbgfrSQLt/f6rFS15dzEozcxz5/15UqQ8DFKWB5MaSO3ZSVIhd6hVzmWpYlvwGyxeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748327799; c=relaxed/simple;
	bh=W0LWsFnlobDD/7uhsjE60vOXGYjM/SXRRgUobso2FWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quYvxKfPq56tIzEO0n4aCFWPXSF2pRsluMv3rbYNxkKs/wHLGVhvhgsk/AQ2nisDSFcOoDkS3rL7OVsSXfbpxgjoNi1r2ScAUOev4PHy7+1cJKbALhPx97JgJI+RGKYR6UySTQK1ajQafH4HsMzPdOb/pS21NO8iFXBlXnBuGwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKW64f2N; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKW64f2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748327797; x=1779863797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W0LWsFnlobDD/7uhsjE60vOXGYjM/SXRRgUobso2FWY=;
  b=TKW64f2Nslew646YzbClShtuoDs/gVdIprVZm0Iiz33wTBpYvTPCN+MB
   hK+YPJ4ePFnlPhPzF5dle9/hZ3NIEmhrzdA8ZZYDag2e33py40479X27Z
   KuLMlcy/ySwFYFYt2OfxVFowNlm/BcxRNxjrIq/nZPWmEkhocUAWEQDGh
   EmWCXlqkasG00F1J5o+OwpLzmB3mBuMpJsde9hFk/bCCr1/5bgrSfAOA9
   kNlqSIj9U53P5ephlw+/YEeu119AHMazXHwbsXBedx0QYS1mdflcdN6Jv
   Z8EpFx70Enk2fJkcZ4GkIWZgay7deIu6iGT+QuTcPCiLCShAWRgnBTkFH
   A==;
X-CSE-ConnectionGUID: ng2hHk98QhGh/XCUXVBnaQ==
X-CSE-MsgGUID: OgeVbiuJRjq9BYWcyLrgXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="53957501"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="53957501"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:36:37 -0700
X-CSE-ConnectionGUID: zyvKh2zIRJKecS2Ek7nTZg==
X-CSE-MsgGUID: CqvwtJImRoiYJy0qGQSgZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="179859119"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2025 23:36:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJnvO-000Sy1-0a;
	Tue, 27 May 2025 06:36:34 +0000
Date: Tue, 27 May 2025 14:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] mm: move huge_zero_folio from huge_memory.c to memory.c
Message-ID: <202505271410.SJwiKbW7-lkp@intel.com>
References: <20250527050452.817674-2-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527050452.817674-2-p.raghav@samsung.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on f1f6aceb82a55f87d04e2896ac3782162e7859bd]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/mm-move-huge_zero_folio-from-huge_memory-c-to-memory-c/20250527-130644
base:   f1f6aceb82a55f87d04e2896ac3782162e7859bd
patch link:    https://lore.kernel.org/r/20250527050452.817674-2-p.raghav%40samsung.com
patch subject: [RFC 1/3] mm: move huge_zero_folio from huge_memory.c to memory.c
config: arc-randconfig-002-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271410.SJwiKbW7-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271410.SJwiKbW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271410.SJwiKbW7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:1030,
                    from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/huge_mm.h:618:20: error: redefinition of 'is_huge_zero_folio'
     618 | static inline bool is_huge_zero_folio(const struct folio *folio)
         |                    ^~~~~~~~~~~~~~~~~~
   In file included from arch/arc/kernel/asm-offsets.c:7:
   include/linux/mm.h:75:20: note: previous definition of 'is_huge_zero_folio' was here
      75 | static inline bool is_huge_zero_folio(const struct folio *folio)
         |                    ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm.h:1030,
                    from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/huge_mm.h:623:20: error: redefinition of 'is_huge_zero_pmd'
     623 | static inline bool is_huge_zero_pmd(pmd_t pmd)
         |                    ^~~~~~~~~~~~~~~~
   In file included from arch/arc/kernel/asm-offsets.c:7:
   include/linux/mm.h:80:20: note: previous definition of 'is_huge_zero_pmd' was here
      80 | static inline bool is_huge_zero_pmd(pmd_t pmd)
         |                    ^~~~~~~~~~~~~~~~
   In file included from include/linux/mm.h:1030,
                    from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/huge_mm.h:628:20: error: static declaration of 'mm_put_huge_zero_folio' follows non-static declaration
     628 | static inline void mm_put_huge_zero_folio(struct mm_struct *mm)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arc/kernel/asm-offsets.c:7:
   include/linux/mm.h:86:6: note: previous declaration of 'mm_put_huge_zero_folio' was here
      86 | void mm_put_huge_zero_folio(struct mm_struct *mm);
         |      ^~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:98: arch/arc/kernel/asm-offsets.s] Error 1 shuffle=3066463275
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=3066463275
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3066463275
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3066463275
   make: Target 'prepare' not remade because of errors.


vim +/is_huge_zero_folio +618 include/linux/huge_mm.h

d10e63f29488b0 Mel Gorman              2012-10-25  617  
5beaee54a324ba Matthew Wilcox (Oracle  2024-03-26 @618) static inline bool is_huge_zero_folio(const struct folio *folio)
5beaee54a324ba Matthew Wilcox (Oracle  2024-03-26  619) {
5beaee54a324ba Matthew Wilcox (Oracle  2024-03-26  620) 	return false;
5beaee54a324ba Matthew Wilcox (Oracle  2024-03-26  621) }
5beaee54a324ba Matthew Wilcox (Oracle  2024-03-26  622) 
3b77e8c8cde581 Hugh Dickins            2021-06-15 @623  static inline bool is_huge_zero_pmd(pmd_t pmd)
3b77e8c8cde581 Hugh Dickins            2021-06-15  624  {
3b77e8c8cde581 Hugh Dickins            2021-06-15  625  	return false;
3b77e8c8cde581 Hugh Dickins            2021-06-15  626  }
3b77e8c8cde581 Hugh Dickins            2021-06-15  627  
632230ff193954 Matthew Wilcox (Oracle  2024-03-26 @628) static inline void mm_put_huge_zero_folio(struct mm_struct *mm)
aa88b68c3b1dce Kirill A. Shutemov      2016-04-28  629  {
6fcb52a56ff60d Aaron Lu                2016-10-07  630  	return;
aa88b68c3b1dce Kirill A. Shutemov      2016-04-28  631  }
3565fce3a6597e Dan Williams            2016-01-15  632  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
