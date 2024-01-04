Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E157A1A70F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egx7uxVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704345701; x=1735881701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Moy+EyEs1vDwsiVSdc37FpZT/7jPidvqfZaoxXnx2Wk=;
  b=egx7uxVidjyp2smou0PU/x2SVoUxRskeLkrFUadV9tmJ7otB+njbLmn1
   PG+BRmX8JFK4BDwhiAM4sT2FX5MVG4LEJ+B2qP1wXz/lFI9G2BqK9x5GO
   j/2M2U20Nwp8dwRdurorclGAONOpZ24vXJLoWVFVi59VtbeasXupcjuwJ
   g5im0WVnnvXdCFzQp/sJExSv8zZA/jxPgb8R9pPEQOVOPpaediYjtqnXP
   agcfIsWq9YH1gMxOEBP7SxXA/QRhBEkBq4D8ka1E+NG2cAJdyt852KS00
   5yDLVOP4ubvN5nis1noqvv7zKjBfOLtRxvfY2tU1LWjsI7awlrHR/LodL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="394304749"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="394304749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 21:21:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="28645820"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Jan 2024 21:21:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLGAi-000Mvc-2g;
	Thu, 04 Jan 2024 05:21:36 +0000
Date: Thu, 4 Jan 2024 13:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Zhu Lingshan <lingshan.zhu@intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Yuan Yao <yuan.yao@intel.com>
Subject: [ls-zhu:test 49/294] arch/x86/virt/vmx/tdx/tdx.c:663:27: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202401041358.t9lMogsI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ls-zhu/linux test
head:   62a15ffb17f55ec915aedff138ef7dd490f44532
commit: d111994fe80fd5a91e4677d6e7e624b10de7b66e [49/294] x86/virt/tdx: Configure global KeyID on all packages
config: x86_64-randconfig-123-20231229 (https://download.01.org/0day-ci/archive/20240104/202401041358.t9lMogsI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401041358.t9lMogsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401041358.t9lMogsI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/virt/vmx/tdx/tdx.c:663:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *dst @@     got void * @@
   arch/x86/virt/vmx/tdx/tdx.c:663:27: sparse:     expected void [noderef] __iomem *dst
   arch/x86/virt/vmx/tdx/tdx.c:663:27: sparse:     got void *
   arch/x86/virt/vmx/tdx/tdx.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   arch/x86/virt/vmx/tdx/tdx.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +663 arch/x86/virt/vmx/tdx/tdx.c

   650	
   651	/*
   652	 * Convert TDX private pages back to normal by using MOVDIR64B to
   653	 * clear these pages.  Note this function doesn't flush cache of
   654	 * these TDX private pages.  The caller should make sure of that.
   655	 */
   656	static void reset_tdx_pages(unsigned long base, unsigned long size)
   657	{
   658		const void *zero_page = (const void *)page_address(ZERO_PAGE(0));
   659		unsigned long phys, end;
   660	
   661		end = base + size;
   662		for (phys = base; phys < end; phys += 64)
 > 663			movdir64b(__va(phys), zero_page);
   664	
   665		/*
   666		 * MOVDIR64B uses WC protocol.  Use memory barrier to
   667		 * make sure any later user of these pages sees the
   668		 * updated data.
   669		 */
   670		mb();
   671	}
   672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
