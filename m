Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54966136F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 04:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693370348; x=1724906348;
  h=date:from:cc:subject:message-id:mime-version;
  bh=q3/CR+kAaEzQ6ZFIyjJmYPpxDqkdhs7KKz7iLfo+PCY=;
  b=kjzVYz3UcuU+8tsUMmzFL67tEX3LcJHcaYNE6KHb47ALl69kehDLvyx2
   DxDWhU6e+vWxc0Sy7Fkdn187x/O7buYxUXnx8YmRmau148tXXv9lBaoTf
   WL7fppBmAYaUCAPn+agwQVG3N6v+g5xMYCCzUImf3mky2Lo7kjmxtttBr
   mvn/KToVldKitsm1gLHlxmIBndUZb7a5E5xj9Vl2FTZtb+9tNm3Allrs4
   CeBhmfAV7UHZMf4fz9OKJVK087GZondoSVdoZyghCdZPUtmLrso7n69n6
   KsezShAwWnoBtJG+oW0Zcw8VP9KdcMD1UyUvf+3n1oUrnAVbzta1vXSGD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="439495973"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="439495973"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 21:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="773972809"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="773972809"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Aug 2023 21:39:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbCyp-0009Qh-2A
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Aug 2023 04:39:00 +0000
Date: Wed, 30 Aug 2023 12:38:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14-rebase 4170/9999]
 sound/soc/intel/skylake/skl.c:104:6: warning: no previous prototype for
 function 'skl_clock_power_gating'
Message-ID: <202308301241.3PRWWFkK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 823458db70476ac7af7d103fa4fd99d62e8f989d [4170/9999] CHROMIUM: ASoC: Intel: Fix skylake backports
config: x86_64-buildonly-randconfig-002-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301241.3PRWWFkK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301241.3PRWWFkK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301241.3PRWWFkK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/intel/skylake/skl.c:104:6: warning: no previous prototype for function 'skl_clock_power_gating' [-Wmissing-prototypes]
   void skl_clock_power_gating(struct device *dev, bool enable)
        ^
   sound/soc/intel/skylake/skl.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void skl_clock_power_gating(struct device *dev, bool enable)
   ^
   static 
   1 warning generated.
   sound/soc/intel/skylake/.tmp_skl.o: warning: objtool: missing symbol for section .init.text


vim +/skl_clock_power_gating +104 sound/soc/intel/skylake/skl.c

    97	
    98	/**
    99	 * skl_clock_power_gating: Enable/Disable clock and power gating
   100	 *
   101	 * @dev: Device pointer
   102	 * @enable: Enable/Disable flag
   103	 */
 > 104	void skl_clock_power_gating(struct device *dev, bool enable)
   105	{
   106		struct pci_dev *pci = to_pci_dev(dev);
   107		struct hdac_bus *bus = pci_get_drvdata(pci);
   108		u32 val;
   109	
   110		/* Update PDCGE bit of CGCTL register */
   111		val = enable ? AZX_CGCTL_ADSPDCGE : 0;
   112		update_pci_dword(pci, AZX_PCIREG_CGCTL, AZX_CGCTL_ADSPDCGE, val);
   113	
   114		/* Update L1SEN bit of EM2 register */
   115		val = enable ? AZX_REG_VS_EM2_L1SEN : 0;
   116		snd_hdac_chip_updatel(bus, VS_EM2, AZX_REG_VS_EM2_L1SEN, val);
   117	
   118		/* Update ADSPPGD bit of PGCTL register */
   119		val = enable ? 0 : AZX_PGCTL_ADSPPGD;
   120		update_pci_dword(pci, AZX_PCIREG_PGCTL, AZX_PGCTL_ADSPPGD, val);
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
