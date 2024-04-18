Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67BF3FB81
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 22:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713480971; cv=none; b=roC8Ff57EbqXPgaMmol1qH8G5DgmEBjrvSNkoFiRZXmkEoNJeMO3LhrUPt2K4ZzwQq7usZuVjn658wT+3NqV4E48ZwhwXHYmjflYvwq9g6Ldiq579fj9Yrn2/5w1Inu22wKNnLEoNtxICqXBdgP4RRcx8pHg4aoJp/OiHyFOPZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713480971; c=relaxed/simple;
	bh=bL5uMaHZaIN/+1ra3eZ4zaIqkegk3coSHBCH3CXOzp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXVxWerj8/PH0tfrP4Ao1N24b/TVc7lFSqDXMmabF7RXisM6iTVF3veoba7IFBaz6++eqosntUQRz3mLusmd8Sw95FMiBPiobenI4vmakrHcnnjBt36FdVD8wMrviNfY8bdpXBtsl4AUpqWqQVQVeL4heQfk9TH42rMs4twjGe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZc+zGIL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZc+zGIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713480970; x=1745016970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bL5uMaHZaIN/+1ra3eZ4zaIqkegk3coSHBCH3CXOzp0=;
  b=QZc+zGILYojLp/rzKq0jXIdQ5gPIxxR9SVg664D0bGVVlJFF748nLAKL
   5k9aoC0QsttEC36pK564xL98OISp7xR3SMWusvWzZFvHbkCdjj4+TI3PX
   NXGhJdaK5qEFmrpxlBBSOMVUvKLybuzYjNUjIroENY4WiOdv2gaWwcEIx
   nvGA+aRzmR3WVaMak58CIw12OmxSBIkxJ9vdNUaoqX9dphBvmyTNo5C1l
   59rOX1yGTupkp/Hx1wkVTo42esRPgKiHDRoiOvF2Lp2cRwUTGsTa8IZ6o
   pwklQ1gwcYyvC1v9DvN7qpD+KmSVsrgZTrN5teVoasB1Crc89gja7zied
   g==;
X-CSE-ConnectionGUID: 9q/DSZ7yRDS1vUQOCQJIKw==
X-CSE-MsgGUID: X5dGdVLrRsWZMZl3n5/bGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8898606"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8898606"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 15:56:09 -0700
X-CSE-ConnectionGUID: 0UOajTtpSQqZYreqDHdk/A==
X-CSE-MsgGUID: rhRqx8e5RHywjtry3E+ExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="27695120"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Apr 2024 15:56:08 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxafl-0009Jl-3B;
	Thu, 18 Apr 2024 22:56:05 +0000
Date: Fri, 19 Apr 2024 06:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tdx-fixes 23/23]
 arch/x86/include/asm/pgtable_types.h:176:48: error: 'cc_mask' undeclared;
 did you mean 'cpumask'?
Message-ID: <202404190653.OVyhcEVt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tdx-fixes
head:   64a348797e6c6e01ca7e759a23856fbf49cf8754
commit: 64a348797e6c6e01ca7e759a23856fbf49cf8754 [23/23] x86/tdx: Preserve shared bit on mprotect()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240419/202404190653.OVyhcEVt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190653.OVyhcEVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190653.OVyhcEVt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/list.h:9,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/pgtable.h: In function 'pte_modify':
>> arch/x86/include/asm/pgtable_types.h:176:48: error: 'cc_mask' undeclared (first use in this function); did you mean 'cpumask'?
     176 | #define _PAGE_CC                (_AT(pteval_t, cc_mask))
         |                                                ^~~~~~~
   include/uapi/linux/const.h:22:30: note: in definition of macro '_AT'
      22 | #define _AT(T,X)        ((T)(X))
         |                              ^
   arch/x86/include/asm/pgtable_types.h:151:49: note: in expansion of macro '_PAGE_CC'
     151 |                                  _PAGE_DEVMAP | _PAGE_CC | _PAGE_UFFD_WP)
         |                                                 ^~~~~~~~
   arch/x86/include/asm/pgtable_types.h:152:26: note: in expansion of macro '_COMMON_PAGE_CHG_MASK'
     152 | #define _PAGE_CHG_MASK  (_COMMON_PAGE_CHG_MASK | _PAGE_PAT)
         |                          ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:809:16: note: in expansion of macro '_PAGE_CHG_MASK'
     809 |         val &= _PAGE_CHG_MASK;
         |                ^~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:176:48: note: each undeclared identifier is reported only once for each function it appears in
     176 | #define _PAGE_CC                (_AT(pteval_t, cc_mask))
         |                                                ^~~~~~~
   include/uapi/linux/const.h:22:30: note: in definition of macro '_AT'
      22 | #define _AT(T,X)        ((T)(X))
         |                              ^
   arch/x86/include/asm/pgtable_types.h:151:49: note: in expansion of macro '_PAGE_CC'
     151 |                                  _PAGE_DEVMAP | _PAGE_CC | _PAGE_UFFD_WP)
         |                                                 ^~~~~~~~
   arch/x86/include/asm/pgtable_types.h:152:26: note: in expansion of macro '_COMMON_PAGE_CHG_MASK'
     152 | #define _PAGE_CHG_MASK  (_COMMON_PAGE_CHG_MASK | _PAGE_PAT)
         |                          ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:809:16: note: in expansion of macro '_PAGE_CHG_MASK'
     809 |         val &= _PAGE_CHG_MASK;
         |                ^~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h: In function 'pmd_modify':
>> arch/x86/include/asm/pgtable_types.h:176:48: error: 'cc_mask' undeclared (first use in this function); did you mean 'cpumask'?
     176 | #define _PAGE_CC                (_AT(pteval_t, cc_mask))
         |                                                ^~~~~~~
   include/uapi/linux/const.h:22:30: note: in definition of macro '_AT'
      22 | #define _AT(T,X)        ((T)(X))
         |                              ^
   arch/x86/include/asm/pgtable_types.h:151:49: note: in expansion of macro '_PAGE_CC'
     151 |                                  _PAGE_DEVMAP | _PAGE_CC | _PAGE_UFFD_WP)
         |                                                 ^~~~~~~~
   arch/x86/include/asm/pgtable_types.h:153:26: note: in expansion of macro '_COMMON_PAGE_CHG_MASK'
     153 | #define _HPAGE_CHG_MASK (_COMMON_PAGE_CHG_MASK | _PAGE_PSE | _PAGE_PAT_LARGE)
         |                          ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:838:17: note: in expansion of macro '_HPAGE_CHG_MASK'
     838 |         val &= (_HPAGE_CHG_MASK & ~_PAGE_DIRTY);
         |                 ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h: In function 'pgprot_modify':
>> arch/x86/include/asm/pgtable_types.h:176:48: error: 'cc_mask' undeclared (first use in this function); did you mean 'cpumask'?
     176 | #define _PAGE_CC                (_AT(pteval_t, cc_mask))
         |                                                ^~~~~~~
   include/uapi/linux/const.h:22:30: note: in definition of macro '_AT'
      22 | #define _AT(T,X)        ((T)(X))
         |                              ^
   arch/x86/include/asm/pgtable_types.h:151:49: note: in expansion of macro '_PAGE_CC'
     151 |                                  _PAGE_DEVMAP | _PAGE_CC | _PAGE_UFFD_WP)
         |                                                 ^~~~~~~~
   arch/x86/include/asm/pgtable_types.h:152:26: note: in expansion of macro '_COMMON_PAGE_CHG_MASK'
     152 | #define _PAGE_CHG_MASK  (_COMMON_PAGE_CHG_MASK | _PAGE_PAT)
         |                          ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:869:58: note: in expansion of macro '_PAGE_CHG_MASK'
     869 |         pgprotval_t preservebits = pgprot_val(oldprot) & _PAGE_CHG_MASK;
         |                                                          ^~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +176 arch/x86/include/asm/pgtable_types.h

   175	
 > 176	#define _PAGE_CC		(_AT(pteval_t, cc_mask))
   177	#define _PAGE_ENC		(_AT(pteval_t, sme_me_mask))
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
