Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F88156D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687354938; x=1718890938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5zptMe+kUTh6wnpPNcb+h0yGTj0MAfg2raBivVNailU=;
  b=OzDGiw2f1/yZrTuEuHxrM2R0jBrFL8Co1EDC95RXXJKNtRGy5YKBcYz7
   qtAsAOaiqTgnMRgpgxuTMOc5VA+6WMMlBTrThmJNa7FsX9EWZi1tBZspB
   0AxJHJF4bkiQOuYyurp1XLzURTp0QNx3OU5qrNHkcfUkuwlofRCopjfim
   QxxupGrtjYvSwiZS0jnFgc0XZOTbs4Of5z3QM4yZrLVEgB0BtPyLLlaPc
   IYy53NIrbY1lHx42cdUHbS0tsZBLsFUIwYtXI9x+H2EQr7I8LphqnqTiZ
   IZgsfPaIKArZIMHySml9EGCfgtletH0HH+mEm3gjb3k/FShncKdvV3FAN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="339790836"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="339790836"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 06:42:10 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="748689207"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="748689207"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Jun 2023 06:42:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBy63-0006rX-2X;
	Wed, 21 Jun 2023 13:42:07 +0000
Date: Wed, 21 Jun 2023 21:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Subject: [linux-next:master 6157/11436]
 drivers/gpu/drm/i915/soc/intel_gmch.c:41:13: warning: variable 'mchbar_addr'
 set but not used
Message-ID: <202306212119.fBNByIyn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e71592dbae49a674429c618a10401d7f992ac3
commit: 3fecd469da9aa0b24bd965f05a8bf44f9d8e2a2e [6157/11436] drm/i915: re-enable -Wunused-but-set-variable
config: x86_64-buildonly-randconfig-r003-20230621 (https://download.01.org/0day-ci/archive/20230621/202306212119.fBNByIyn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306212119.fBNByIyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306212119.fBNByIyn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/soc/intel_gmch.c: In function 'intel_alloc_mchbar_resource':
>> drivers/gpu/drm/i915/soc/intel_gmch.c:41:13: warning: variable 'mchbar_addr' set but not used [-Wunused-but-set-variable]
      41 |         u64 mchbar_addr;
         |             ^~~~~~~~~~~


vim +/mchbar_addr +41 drivers/gpu/drm/i915/soc/intel_gmch.c

a13144e2286b0f Jani Nikula 2023-01-17  34  
a13144e2286b0f Jani Nikula 2023-01-17  35  /* Allocate space for the MCH regs if needed, return nonzero on error */
a13144e2286b0f Jani Nikula 2023-01-17  36  static int
b1e7d8b0084396 Jani Nikula 2023-01-17  37  intel_alloc_mchbar_resource(struct drm_i915_private *i915)
a13144e2286b0f Jani Nikula 2023-01-17  38  {
b1e7d8b0084396 Jani Nikula 2023-01-17  39  	int reg = GRAPHICS_VER(i915) >= 4 ? MCHBAR_I965 : MCHBAR_I915;
a13144e2286b0f Jani Nikula 2023-01-17  40  	u32 temp_lo, temp_hi = 0;
a13144e2286b0f Jani Nikula 2023-01-17 @41  	u64 mchbar_addr;
a13144e2286b0f Jani Nikula 2023-01-17  42  	int ret;
a13144e2286b0f Jani Nikula 2023-01-17  43  
b1e7d8b0084396 Jani Nikula 2023-01-17  44  	if (GRAPHICS_VER(i915) >= 4)
b1e7d8b0084396 Jani Nikula 2023-01-17  45  		pci_read_config_dword(i915->gmch.pdev, reg + 4, &temp_hi);
b1e7d8b0084396 Jani Nikula 2023-01-17  46  	pci_read_config_dword(i915->gmch.pdev, reg, &temp_lo);
a13144e2286b0f Jani Nikula 2023-01-17  47  	mchbar_addr = ((u64)temp_hi << 32) | temp_lo;
a13144e2286b0f Jani Nikula 2023-01-17  48  
a13144e2286b0f Jani Nikula 2023-01-17  49  	/* If ACPI doesn't have it, assume we need to allocate it ourselves */
a13144e2286b0f Jani Nikula 2023-01-17  50  #ifdef CONFIG_PNP
a13144e2286b0f Jani Nikula 2023-01-17  51  	if (mchbar_addr &&
a13144e2286b0f Jani Nikula 2023-01-17  52  	    pnp_range_reserved(mchbar_addr, mchbar_addr + MCHBAR_SIZE))
a13144e2286b0f Jani Nikula 2023-01-17  53  		return 0;
a13144e2286b0f Jani Nikula 2023-01-17  54  #endif
a13144e2286b0f Jani Nikula 2023-01-17  55  
a13144e2286b0f Jani Nikula 2023-01-17  56  	/* Get some space for it */
b1e7d8b0084396 Jani Nikula 2023-01-17  57  	i915->gmch.mch_res.name = "i915 MCHBAR";
b1e7d8b0084396 Jani Nikula 2023-01-17  58  	i915->gmch.mch_res.flags = IORESOURCE_MEM;
b1e7d8b0084396 Jani Nikula 2023-01-17  59  	ret = pci_bus_alloc_resource(i915->gmch.pdev->bus,
b1e7d8b0084396 Jani Nikula 2023-01-17  60  				     &i915->gmch.mch_res,
a13144e2286b0f Jani Nikula 2023-01-17  61  				     MCHBAR_SIZE, MCHBAR_SIZE,
a13144e2286b0f Jani Nikula 2023-01-17  62  				     PCIBIOS_MIN_MEM,
a13144e2286b0f Jani Nikula 2023-01-17  63  				     0, pcibios_align_resource,
b1e7d8b0084396 Jani Nikula 2023-01-17  64  				     i915->gmch.pdev);
a13144e2286b0f Jani Nikula 2023-01-17  65  	if (ret) {
b1e7d8b0084396 Jani Nikula 2023-01-17  66  		drm_dbg(&i915->drm, "failed bus alloc: %d\n", ret);
b1e7d8b0084396 Jani Nikula 2023-01-17  67  		i915->gmch.mch_res.start = 0;
a13144e2286b0f Jani Nikula 2023-01-17  68  		return ret;
a13144e2286b0f Jani Nikula 2023-01-17  69  	}
a13144e2286b0f Jani Nikula 2023-01-17  70  
b1e7d8b0084396 Jani Nikula 2023-01-17  71  	if (GRAPHICS_VER(i915) >= 4)
b1e7d8b0084396 Jani Nikula 2023-01-17  72  		pci_write_config_dword(i915->gmch.pdev, reg + 4,
b1e7d8b0084396 Jani Nikula 2023-01-17  73  				       upper_32_bits(i915->gmch.mch_res.start));
a13144e2286b0f Jani Nikula 2023-01-17  74  
b1e7d8b0084396 Jani Nikula 2023-01-17  75  	pci_write_config_dword(i915->gmch.pdev, reg,
b1e7d8b0084396 Jani Nikula 2023-01-17  76  			       lower_32_bits(i915->gmch.mch_res.start));
a13144e2286b0f Jani Nikula 2023-01-17  77  	return 0;
a13144e2286b0f Jani Nikula 2023-01-17  78  }
a13144e2286b0f Jani Nikula 2023-01-17  79  

:::::: The code at line 41 was first introduced by commit
:::::: a13144e2286b0fbabd0794218ee699e37a8d4210 drm/i915/gmch: split out soc/intel_gmch

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
