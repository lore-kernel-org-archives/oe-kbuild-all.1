Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7004A200C4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 23:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPoMbjRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700348684; x=1731884684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G6C13KF3Ih6+jkEANJvr7n5wDTK4o0tS9AH+zv1JuBE=;
  b=hPoMbjRntLWaLd1xpmeGmU4F0dWQ9xXCxndVH1SPv04MGEEBSZst49/Z
   x6FVJeTRn8xqKVBxiXzYyvRixHqZ45GvQua+jJ3LXt9xgwWcq+6MFjHVZ
   Hy7DR2r1Bf1cH4xULCvoo6QETNF2QGpwmMp7uRSx6a5Wig7zbo/xbP5AE
   C9svuO1Dj5YVqHvc3gd7mVLXGVdPDjr//wXkN6EQmeYKsuWMEpu9yrGf6
   aiT2C2NKg38322MdCqlHxdtijzjwEgpkeChXWVnOCPXSZq6ZXXQeTCTTH
   0yZ3a7E/1nNZ0b+t7rXgUDZ4ws75s6mYSACaSEel1Vg88PuyRa4dLjZRL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="455756456"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="455756456"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 15:04:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="856653477"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="856653477"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Nov 2023 15:04:42 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4UMi-0004Q3-16;
	Sat, 18 Nov 2023 23:04:40 +0000
Date: Sun, 19 Nov 2023 07:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-attest 1/6] arch/x86/coco/tdx/tdx.c:179:16: error:
 implicit declaration of function '__tdx_module_call'; did you mean
 '__tdx_hypercall'?
Message-ID: <202311190756.X6IRDYp0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-attest
head:   09151f66ca365a6e50b8cc3a834f4441701a2852
commit: 24dc25211f99f6697ee3658c928e1053f469df3f [1/6] virt: tdx-guest: Add VERIFYREPORT support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231119/202311190756.X6IRDYp0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311190756.X6IRDYp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190756.X6IRDYp0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/coco/tdx/tdx.c: In function 'tdx_mcall_verify_report':
>> arch/x86/coco/tdx/tdx.c:179:16: error: implicit declaration of function '__tdx_module_call'; did you mean '__tdx_hypercall'? [-Werror=implicit-function-declaration]
     179 |         return __tdx_module_call(TDX_VERIFYREPORT, virt_to_phys(reportmac),
         |                ^~~~~~~~~~~~~~~~~
         |                __tdx_hypercall
   cc1: some warnings being treated as errors


vim +179 arch/x86/coco/tdx/tdx.c

   164	
   165	/**
   166	 * tdx_mcall_verify_report() - Wrapper for TDG.MR.VERIFYREPORT TDCALL.
   167	 * @reportmac: Address of the input buffer which contains REPORTMACSTRUCT.
   168	 *
   169	 * Refer to section titled "TDG.MR.VERIFYREPORT leaf" in the TDX
   170	 * Module v1.0 specification for more information on TDG.MR.VERIFYREPORT
   171	 * TDCALL. It is used in the TDX guest driver module to verify the
   172	 * REPORTMACSTRUCT (part of TDREPORT struct which was generated via
   173	 * TDG.MR.TDREPORT TDCALL).
   174	 *
   175	 * Return 0 on success, or error code on other TDCALL failures.
   176	 */
   177	u64 tdx_mcall_verify_report(u8 *reportmac)
   178	{
 > 179		return __tdx_module_call(TDX_VERIFYREPORT, virt_to_phys(reportmac),
   180					0, 0, 0, NULL);
   181	}
   182	EXPORT_SYMBOL_GPL(tdx_mcall_verify_report);
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
