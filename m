Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F38310957
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688036426; x=1719572426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xd1a4n+L2Xlm2tvqnE3q+uiupZt6PBqVwgzHo7MzWmc=;
  b=gkyOOWX9Phm3F7P5x7b9srCVH3fqxpGlSes40o1R6iOumkLBoTiEWbrT
   3jmSQ2/G4uLEorbJy5VVUHqzKAw9OlrCaJKyIDGmMbYYMKSN9Qq2Hm6Zl
   P5I7Q0KAgIufmFbOHew8kSQACErm5+eAStVuouTflmYHNA7XTgKunIviv
   QXaIEWGq2pcnKhQoq0HASCKsWHkAQ8j4uArR6rH6WUy+UFj2CuEqYB0cP
   qDrS2WOiwAh8m3lJVrlzbcmhRJALusSDrVBPCRieFR3r6zm3Up90KFp9w
   WtQfoFCjy46bo5cG34JWT3M7FuXB7KPYbva8VFkr6mkXTqo7TGmks2BMD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351880549"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="351880549"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 04:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="807266642"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="807266642"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jun 2023 04:00:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEpNu-000E4n-22;
	Thu, 29 Jun 2023 11:00:22 +0000
Date: Thu, 29 Jun 2023 19:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Subject: [linux-next:master 6078/12721]
 drivers/gpu/drm/i915/soc/intel_gmch.c:41:13: error: variable 'mchbar_addr'
 set but not used
Message-ID: <202306291857.nyJjYwqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8b14b70331aa4b721b8c489fc43a24c1eb323e1f
commit: 3fecd469da9aa0b24bd965f05a8bf44f9d8e2a2e [6078/12721] drm/i915: re-enable -Wunused-but-set-variable
config: i386-buildonly-randconfig-r005-20230629 (https://download.01.org/0day-ci/archive/20230629/202306291857.nyJjYwqk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306291857.nyJjYwqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306291857.nyJjYwqk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/soc/intel_gmch.c: In function 'intel_alloc_mchbar_resource':
>> drivers/gpu/drm/i915/soc/intel_gmch.c:41:13: error: variable 'mchbar_addr' set but not used [-Werror=unused-but-set-variable]
      41 |         u64 mchbar_addr;
         |             ^~~~~~~~~~~
   cc1: all warnings being treated as errors


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
