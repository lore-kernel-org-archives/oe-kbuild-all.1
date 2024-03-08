Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E285477C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709892590; cv=none; b=bol2VG+/Nr8gL9gV0uGz/ed333IGFG8GmyQ44hdQqA34Eswy7ymSIV3QiKluARqKRjiwkNBAytN2Me8+XRkGkiAnHwX9AjPaSsHe10OMJQLQ5PzxnuyfGQ9xKieDzDZ4PuR/k+aMGOmPEw4/hj/ifiS886DUtVZzq3WQ3t/VO30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709892590; c=relaxed/simple;
	bh=ajBqsl0vHz0UpTXp3Xhdy7S+lNaoR+soro2kz+JwMn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fl+CKjIB18Hs60BaM2R+U+JeR/lpwEpr8bVQye5mdfebxDoqukQMqTTg3SgaPLxCRtyS0WTuERg6pRlXYP32GSS6fgkWAXZdA69hVjTKFGktAKe4vvNKCgYU7ifNSfkgCc9AExPGXoID9CimW/qc/f2x14A4WyWhVQ5KwUSy4vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTvqRGsN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTvqRGsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709892588; x=1741428588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ajBqsl0vHz0UpTXp3Xhdy7S+lNaoR+soro2kz+JwMn0=;
  b=YTvqRGsN9y6uHCIlxTrGLyDBlPGKgJCNC0aEp7FPmzA8RBWONfO7VYJG
   dX7HDkfhNzKrCwg8MbFVuxMgn0NqVmK0cMgBCCMYfavm2VLc40v1Rhqir
   aShqmmSdDVAotJmjeNuOqkpfZTlKgb2pCLAYZK78VtqVqCs0A8dfUhORd
   R/v4zrpg/dnWcqebSKCYMKslLnh9rWoBH0UtobOl9DWAVdvRPdjlhkXvl
   KHwDZz+3Cgu+u1EABo9+Gdprq73kmq89e+WJeb7UOvl2ZB5e+FX1XEj8U
   HoGy533UzVEaVt43mrRE9vTQfIeAOEjDrAf2AatN1g0BtfLsjNR7C7XHC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4465441"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4465441"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 02:09:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="14900030"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Mar 2024 02:09:46 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riXAe-0006Gl-0U;
	Fri, 08 Mar 2024 10:09:44 +0000
Date: Fri, 8 Mar 2024 18:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 29/36] arch/parisc/include/asm/io.h:128:22:
 error: called object is not a function or function pointer
Message-ID: <202403081833.YWkPz1F0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   765f146fe3ca453ecbec8aaa4545f82f6878c488
commit: 7052019eb3591061228a2ca4d91f197ebdfa69b0 [29/36] asm/io.h: Add ioremap_cache_shared
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240308/202403081833.YWkPz1F0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081833.YWkPz1F0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081833.YWkPz1F0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from lib/devres.c:3:
   lib/devres.c: In function '__devm_ioremap':
   arch/parisc/include/asm/io.h:143:22: warning: passing argument 1 of 'ioremap_prot' makes integer from pointer without a cast [-Wint-conversion]
     143 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |                      ^~~~~~
         |                      |
         |                      void *
   lib/devres.c:42:24: note: in expansion of macro 'ioremap_uc'
      42 |                 addr = ioremap_uc(offset, size);
         |                        ^~~~~~~~~~
   In file included from arch/parisc/include/asm/io.h:279:
   include/asm-generic/io.h:1053:40: note: expected 'phys_addr_t' {aka 'unsigned int'} but argument is of type 'void *'
    1053 | void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
         |                            ~~~~~~~~~~~~^~~~~~~~~
>> arch/parisc/include/asm/io.h:128:22: error: called object is not a function or function pointer
     128 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/parisc/include/asm/io.h:143:9: note: in expansion of macro 'ioremap_prot'
     143 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |         ^~~~~~~~~~~~
   lib/devres.c:42:24: note: in expansion of macro 'ioremap_uc'
      42 |                 addr = ioremap_uc(offset, size);
         |                        ^~~~~~~~~~


vim +128 arch/parisc/include/asm/io.h

^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  124  
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  125  /*
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  126   * The standard PCI ioremap interfaces
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  127   */
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06 @128  #define ioremap_prot ioremap_prot
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06  129  

:::::: The code at line 128 was first introduced by commit
:::::: 426b313f356a314af335899c51250dc0f49cd4a7 parisc: mm: convert to GENERIC_IOREMAP

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
