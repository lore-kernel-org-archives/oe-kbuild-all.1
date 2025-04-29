Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9EC2749ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 22:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745965654; cv=none; b=cYfzdOVmbAyVnHVelfIP1HVONgqvZcDRAZ1kH5p6z+gSdXlnms1Ea75UqEyTB+PJln5zYgJWOG4bhryD8Z+12VxyTTpJpTvnKQf/HJt9tGm8n5R8AWFRoGA5c8ETKm3ZZBCa2y15OYUFPErvyTIFQSus6h+t77XduqYFbjhmjDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745965654; c=relaxed/simple;
	bh=EF/llFBqxbp4O1MYThfbLAGwNU5vaeWwv/fU42/Rauw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DnjnqnuWleRNYeOhNsMxRRq9s0QAkmJep9Fsne6HvoUrtQ3yO6L5EdOKeFphIJEZOMe/s9YjXZEuSaKd5UY1yEb5K9dC4Fe5+A8M02qejcX4Fuy/GwpZ4w8rpqUybEynTEfquni189kWrQ30UBXkuOudvtyAk7IRMwwSMNRdIHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iefOedCc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iefOedCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745965653; x=1777501653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EF/llFBqxbp4O1MYThfbLAGwNU5vaeWwv/fU42/Rauw=;
  b=iefOedCcwjCN4Dcv4A73t0MhEyJfpbDYRa14qNmkQmVr304kEmcYfRH+
   MvJ4oBZb/R9iwOopYtR/B/oSN8JUc9FL5b0YP5XlMuhfYPAgHeD+CEz3G
   oGIKid72sYjCgUmvIS2jjk5makiR4/d0GXZ1b60LFIBGWozjpeAcVifGB
   iGPWqvE8K464pdNE1QNE+VvCAW0+Z3oqdair22XKhT97xDS4fXT93MH77
   0kN0uyMEj21LMxTlA04MtVySabHPv6euoF8ncGAqc2Wh/WMjyRGff/ojc
   ftIfV5n9FIJE9INQTDge4Ky//6kBSlNGKygOoLr9L7J/hn/lrbSifp97R
   w==;
X-CSE-ConnectionGUID: towaRTEYQrStpr/nla1dww==
X-CSE-MsgGUID: 5n7ZYNZ+Rhucokby+Ct4Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47323028"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="47323028"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 15:27:31 -0700
X-CSE-ConnectionGUID: oD+r/TIBTIeUk+nKAJY8Rw==
X-CSE-MsgGUID: IfgYQvZoTteC086CtrC5qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133884050"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2025 15:27:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9tQF-0002zF-12;
	Tue, 29 Apr 2025 22:27:27 +0000
Date: Wed, 30 Apr 2025 06:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:pat 5/10] include/linux/pgtable.h:1766:1: warning:
 'gnu_inline' attribute ignored
Message-ID: <202504300609.ETGTDOAa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux pat
head:   f60106362383c7fbbe2d6fc75c7fc17a85ed2da9
commit: 198b01f86519142d65d84243c329c8beb5f9117a [5/10] x86/mm/pat: remove old pfnmap tracking interface
config: sparc-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300609.ETGTDOAa-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300609.ETGTDOAa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300609.ETGTDOAa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:31,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dmapool.h:14,
                    from include/linux/pci.h:1659,
                    from arch/sparc/lib/iomap.c:5:
   include/linux/pgtable.h:1493:1: error: expected declaration specifiers or '...' before '{' token
    1493 | {
         | ^
   include/linux/pgtable.h:1766:20: error: storage class specified for parameter 'init_espfix_bsp'
    1766 | static inline void init_espfix_bsp(void) { }
         |                    ^~~~~~~~~~~~~~~
   include/linux/pgtable.h:1766:20: warning: parameter 'init_espfix_bsp' declared 'inline'
>> include/linux/pgtable.h:1766:1: warning: 'gnu_inline' attribute ignored [-Wattributes]
    1766 | static inline void init_espfix_bsp(void) { }
         | ^~~~~~
   include/linux/pgtable.h:1766:20: error: 'no_instrument_function' attribute applies only to functions
    1766 | static inline void init_espfix_bsp(void) { }
         | ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:1766:42: error: expected ';', ',' or ')' before '{' token
    1766 | static inline void init_espfix_bsp(void) { }
         |                                          ^


vim +/gnu_inline +1766 include/linux/pgtable.h

458aa76d132dc1 include/asm-generic/pgtable.h Aneesh Kumar K.V 2016-03-17  1760  
08ea8c07fb56d6 include/asm-generic/pgtable.h Baoyou Xie       2016-10-07  1761  struct file;
08ea8c07fb56d6 include/asm-generic/pgtable.h Baoyou Xie       2016-10-07  1762  int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
08ea8c07fb56d6 include/asm-generic/pgtable.h Baoyou Xie       2016-10-07  1763  			unsigned long size, pgprot_t *vma_prot);
613e396bc0d4c7 include/asm-generic/pgtable.h Thomas Gleixner  2017-12-17  1764  
613e396bc0d4c7 include/asm-generic/pgtable.h Thomas Gleixner  2017-12-17  1765  #ifndef CONFIG_X86_ESPFIX64
613e396bc0d4c7 include/asm-generic/pgtable.h Thomas Gleixner  2017-12-17 @1766  static inline void init_espfix_bsp(void) { }
613e396bc0d4c7 include/asm-generic/pgtable.h Thomas Gleixner  2017-12-17  1767  #endif
613e396bc0d4c7 include/asm-generic/pgtable.h Thomas Gleixner  2017-12-17  1768  

:::::: The code at line 1766 was first introduced by commit
:::::: 613e396bc0d4c7604fba23256644e78454c68cf6 init: Invoke init_espfix_bsp() from mm_init()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
