Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855053C3B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 07:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693552651; x=1725088651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k36BmxusoObIR6cPVXCJhgTE4I+sjfA1bPoG9FFMs/U=;
  b=oKdXRc7ckdERhlWDpZ4gXWmUpTcHVVRprcr1WXpM7T293frDo+FYd6KF
   hA26/TEAeiZHE4hqZL2OiCYCpMbNT/NZeDE0Wk+JtIiTolHynp0k7xl9U
   XUWVfbKm8/mOfdST93ZJrI1XN0IDNcFNFl0lyB264kOZtfphD+fJAVstB
   7GmcjGBXT86QMbydwgJE8JAOkSandgoMOv/QgVHyabSXtJK9BmWNm/Lj7
   UjpCozlMa3WqMngCXHxUzawxTJyyFznZFPYz03W8/T1yZspMNoWrDhvKJ
   wgOrODP5erV4Th56WIUXmADTNs8xzvfQnaCS3SvFBV7zOXBab/bWnfsrz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462516782"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="462516782"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 00:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="830026598"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="830026598"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Sep 2023 00:17:29 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbyPH-00012t-1h;
	Fri, 01 Sep 2023 07:17:27 +0000
Date: Fri, 1 Sep 2023 15:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3957/24603]
 drivers/pci/controller/mobiveil/pcie-mobiveil.c:173:6: warning: no previous
 declaration for '__program_ob_windows'
Message-ID: <202309011527.9b2tOS8b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 023710396da10045da1b357e709b9284512c2bdc [3957/24603] PCI: mobiveil: Add the EP driver support
config: x86_64-buildonly-randconfig-004-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011527.9b2tOS8b-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011527.9b2tOS8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011527.9b2tOS8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:173:6: warning: no previous declaration for '__program_ob_windows' [-Wmissing-declarations]
    void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, int win_num,
         ^~~~~~~~~~~~~~~~~~~~


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
