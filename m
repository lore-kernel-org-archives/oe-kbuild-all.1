Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709FD1D68A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMW3QvJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704438434; x=1735974434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xO1bGmS092tk6BgERaiEcSWWFchlw/IimEaNy+tX5Mc=;
  b=GMW3QvJeEvxHyYlO5tZ5LcOYHos8g/+eJJml+VXEUbSoggAYdsUJmni+
   DwFRM+PRMPgaC0QdgIzKzi7Gxxvs0dg/mPktB9cLDLNXrcijqj5ZkYkh8
   4Pe8wGOeHiZgoRSYBNpxjBJOrA3yFYs5Xk1l/syZkvcPm2MnQefaRTXil
   vFzxnk6y4bmiGxY0PW3X3gvsVk6jaGIy2e3eMmvHYDm7QPNymqZsWzNm0
   e1xRi2GG909XdTZq9QdNilLhEhQ8eBREY2mLieInL4w//9a25uaLfk1w1
   xDj+JLwRLbp2U1jMD3lDHEM2WB0aZuqLNttdSpeAASRX0QiLdYN/EeKs4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="396333677"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="396333677"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 23:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="953865931"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="953865931"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Jan 2024 23:07:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLeIO-0000v6-1m;
	Fri, 05 Jan 2024 07:07:08 +0000
Date: Fri, 5 Jan 2024 15:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Zhu Lingshan <lingshan.zhu@intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [ls-zhu:v6.7-rc7-tdx 81/294] arch/x86/kvm/vmx/tdx.c:108:32: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202401051446.gQKWDKpt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ls-zhu/linux v6.7-rc7-tdx
head:   62a15ffb17f55ec915aedff138ef7dd490f44532
commit: 7f4072ee937dcbe671fb23ef19fa9a48bb2bfc16 [81/294] KVM: TDX: create/destroy VM structure
config: x86_64-randconfig-123-20231229 (https://download.01.org/0day-ci/archive/20240105/202401051446.gQKWDKpt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051446.gQKWDKpt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051446.gQKWDKpt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/tdx.c:108:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *dst @@     got void * @@
   arch/x86/kvm/vmx/tdx.c:108:32: sparse:     expected void [noderef] __iomem *dst
   arch/x86/kvm/vmx/tdx.c:108:32: sparse:     got void *
   arch/x86/kvm/vmx/tdx.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +108 arch/x86/kvm/vmx/tdx.c

    92	
    93	static void tdx_clear_page(unsigned long page_pa)
    94	{
    95		const void *zero_page = (const void *) __va(page_to_phys(ZERO_PAGE(0)));
    96		void *page = __va(page_pa);
    97		unsigned long i;
    98	
    99		/*
   100		 * When re-assign one page from old keyid to a new keyid, MOVDIR64B is
   101		 * required to clear/write the page with new keyid to prevent integrity
   102		 * error when read on the page with new keyid.
   103		 *
   104		 * clflush doesn't flush cache with HKID set.  The cache line could be
   105		 * poisoned (even without MKTME-i), clear the poison bit.
   106		 */
   107		for (i = 0; i < PAGE_SIZE; i += 64)
 > 108			movdir64b(page + i, zero_page);
   109		/*
   110		 * MOVDIR64B store uses WC buffer.  Prevent following memory reads
   111		 * from seeing potentially poisoned cache.
   112		 */
   113		__mb();
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
