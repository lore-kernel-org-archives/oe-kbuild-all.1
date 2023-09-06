Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA93D46A2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694020123; x=1725556123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S/ae0AxJDLbgTHSqpdO5a60cR9jIxb7b5xg/tQ5BHgU=;
  b=g0u3GfCtg5Rv/QohkqtyidnbIqepjc8P1fpxxewRNuoZUbnkaEFIir6j
   xbd7SACvfLqMP7Bsx4uAlu6pbg+aaVxYMjr7lnjsVSwD9bFT+CY0mZXOm
   syPDE2EVRkebuzYDRQOlZISqjk4qxU3TYjgDPap9GoGZUDtXVXjpIHmrM
   oixC+AMZCfTY34viQpC0vOZYmcb/cf8S860FEOys8YNlbmq6PK4PBy8T2
   0p4tFCergTtp39wDPNeN0OjsZHKDZau/S6lRPxwcvkyvTQaAc6NjT2VN9
   7okZob1KbvpzHcxJbf/wVGj1ykAroiVjgoHuJGyxHpyl+/Limme8naJxy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380928228"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="380928228"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072465884"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="1072465884"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2023 10:08:41 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdw19-0000Qe-1k;
	Wed, 06 Sep 2023 17:08:39 +0000
Date: Thu, 7 Sep 2023 01:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3957/24606]
 drivers/pci/controller/mobiveil/pcie-mobiveil.c:173:6: warning: no previous
 prototype for function '__program_ob_windows'
Message-ID: <202309070125.eLqHfwCC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   c099d7415137daf904adcd5fdd73a25024627587
commit: 023710396da10045da1b357e709b9284512c2bdc [3957/24606] PCI: mobiveil: Add the EP driver support
config: arm64-randconfig-r014-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070125.eLqHfwCC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070125.eLqHfwCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070125.eLqHfwCC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:173:6: warning: no previous prototype for function '__program_ob_windows' [-Wmissing-prototypes]
     173 | void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, int win_num,
         |      ^
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:173:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     173 | void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, int win_num,
         | ^
         | static 
   1 warning generated.


vim +/__program_ob_windows +173 drivers/pci/controller/mobiveil/pcie-mobiveil.c

   169	
   170	/*
   171	 * routine to program the outbound windows
   172	 */
 > 173	void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, int win_num,
   174				  u64 cpu_addr, u64 pci_addr, u32 type, u64 size)
   175	{
   176		u32 value;
   177		u64 size64 = ~(size - 1);
   178	
   179		/*
   180		 * program Enable Bit to 1, Type Bit to (00) base 2, AXI Window Size Bit
   181		 * to 4 KB in PAB_AXI_AMAP_CTRL register
   182		 */
   183		value = mobiveil_csr_readl(pcie, PAB_AXI_AMAP_CTRL(win_num));
   184		value &= ~(WIN_TYPE_MASK << WIN_TYPE_SHIFT | WIN_SIZE_MASK);
   185		value |= 1 << WIN_ENABLE_SHIFT | type << WIN_TYPE_SHIFT |
   186			 (lower_32_bits(size64) & WIN_SIZE_MASK);
   187		mobiveil_csr_writel(pcie, value, PAB_AXI_AMAP_CTRL(win_num));
   188	
   189		mobiveil_csr_writel(pcie, upper_32_bits(size64),
   190				    PAB_EXT_AXI_AMAP_SIZE(win_num));
   191	
   192		mobiveil_csr_writel(pcie, func_no, PAB_AXI_AMAP_PCI_HDR_PARAM(win_num));
   193		/*
   194		 * program AXI window base with appropriate value in
   195		 * PAB_AXI_AMAP_AXI_WIN0 register
   196		 */
   197		mobiveil_csr_writel(pcie,
   198				    lower_32_bits(cpu_addr) & (~AXI_WINDOW_ALIGN_MASK),
   199				    PAB_AXI_AMAP_AXI_WIN(win_num));
   200		mobiveil_csr_writel(pcie, upper_32_bits(cpu_addr),
   201				    PAB_EXT_AXI_AMAP_AXI_WIN(win_num));
   202	
   203		mobiveil_csr_writel(pcie, lower_32_bits(pci_addr),
   204				    PAB_AXI_AMAP_PEX_WIN_L(win_num));
   205		mobiveil_csr_writel(pcie, upper_32_bits(pci_addr),
   206				    PAB_AXI_AMAP_PEX_WIN_H(win_num));
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
