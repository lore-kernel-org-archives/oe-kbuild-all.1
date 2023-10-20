Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C613AC4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vg93KNp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697808373; x=1729344373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sX7Lb7/FYPlNXLS9YDKQuLZEibOifQqieYyHTB6TRTc=;
  b=Vg93KNp99MtILnzWPgfpqTyFJkbLbmM+nPbBhTGBXbPW6nWpujp4B+nG
   ajH61CC1ZB/PMJV5qaIn7kw0IZQm41yfqqapEDdXY4mbjuUaBvcVjdd+Q
   NE2Kpkhf+qXA/SpMSOQEqCgDS94w8ozIHSH/35r2LqKcQzC8iROUEuLtI
   7p83hYap36rMJEz06degLBmnRaMXrK3XDglfupIuKNrAs7cTnU+ki2dCK
   vIpNUfkHDpU+JfCf0HPUa4rIM/u1H8qah+CL66kc7cyurgxa8jxufRWzT
   P6Hwx4mfv6fy01vp+ug1ndo1hyjcIcnQqfePXv7DXW6eTZTIDVs/PO3CP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417625959"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="417625959"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 06:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5389327"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2023 06:26:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtpVw-0003Ys-2k;
	Fri, 20 Oct 2023 13:26:08 +0000
Date: Fri, 20 Oct 2023 21:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.4-2.3.x-imx 1982/30000]
 sound/soc/sof/sof-pci-dev.c:116:35: error: 'snd_soc_acpi_intel_cfl_machines'
 undeclared here (not in a function); did you mean
 'snd_soc_acpi_intel_cnl_machines'?
Message-ID: <202310202136.uHTB3z8Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liam,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.4-2.3.x-imx
head:   bcde5677c4cabfef7080ffc2fef17275144a0517
commit: 0e821afb9450c1001d502039fdf95d463d2680e3 [1982/30000] ASoC: SOF: Intel: Fix CFL and CML FW nocodec binary names.
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310202136.uHTB3z8Y-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310202136.uHTB3z8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310202136.uHTB3z8Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/firmware.h:6,
                    from sound/soc/sof/sof-pci-dev.c:11:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/xtensa/include/asm/page.h:182:16: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     182 |         ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
         |                ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   arch/xtensa/include/asm/page.h:190:33: note: in expansion of macro 'pfn_valid'
     190 | #define virt_addr_valid(kaddr)  pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   In file included from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/firmware.h:7:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/xtensa/include/asm/page.h:182:16: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     182 |         ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
         |                ^~
   include/asm-generic/bug.h:139:34: note: in definition of macro 'WARN_ON_ONCE'
     139 |         int __ret_warn_once = !!(condition);                    \
         |                                  ^~~~~~~~~
   include/linux/dma-mapping.h:355:26: note: in expansion of macro 'pfn_valid'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |                          ^~~~~~~~~
   sound/soc/sof/sof-pci-dev.c: At top level:
>> sound/soc/sof/sof-pci-dev.c:116:35: error: 'snd_soc_acpi_intel_cfl_machines' undeclared here (not in a function); did you mean 'snd_soc_acpi_intel_cnl_machines'?
     116 |         .machines               = snd_soc_acpi_intel_cfl_machines,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snd_soc_acpi_intel_cnl_machines
>> sound/soc/sof/sof-pci-dev.c:136:35: error: 'snd_soc_acpi_intel_cml_machines' undeclared here (not in a function); did you mean 'snd_soc_acpi_intel_cnl_machines'?
     136 |         .machines               = snd_soc_acpi_intel_cml_machines,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snd_soc_acpi_intel_cnl_machines


vim +116 sound/soc/sof/sof-pci-dev.c

   113	
   114	#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
   115	static const struct sof_dev_desc cfl_desc = {
 > 116		.machines		= snd_soc_acpi_intel_cfl_machines,
   117		.resindex_lpe_base	= 0,
   118		.resindex_pcicfg_base	= -1,
   119		.resindex_imr_base	= -1,
   120		.irqindex_host_ipc	= -1,
   121		.resindex_dma_base	= -1,
   122		.chip_info = &cnl_chip_info,
   123		.default_fw_path = "intel/sof",
   124		.default_tplg_path = "intel/sof-tplg",
   125		.nocodec_fw_filename = "sof-cfl.ri",
   126		.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
   127		.ops = &sof_cnl_ops,
   128		.arch_ops = &sof_xtensa_arch_ops
   129	};
   130	#endif
   131	
   132	#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP) || \
   133		IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
   134	
   135	static const struct sof_dev_desc cml_desc = {
 > 136		.machines		= snd_soc_acpi_intel_cml_machines,
   137		.resindex_lpe_base	= 0,
   138		.resindex_pcicfg_base	= -1,
   139		.resindex_imr_base	= -1,
   140		.irqindex_host_ipc	= -1,
   141		.resindex_dma_base	= -1,
   142		.chip_info = &cnl_chip_info,
   143		.default_fw_path = "intel/sof",
   144		.default_tplg_path = "intel/sof-tplg",
   145		.nocodec_fw_filename = "sof-cml.ri",
   146		.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
   147		.ops = &sof_cnl_ops,
   148		.arch_ops = &sof_xtensa_arch_ops
   149	};
   150	#endif
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
