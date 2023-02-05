Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3876B28ED
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 12:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675600281; x=1707136281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X9I4RfIL6T0U56jkFfltdWbjmSXzsESI7SqNgNFwEdk=;
  b=Mnb9bBhdFHeEAga/liFmjxbr1iud0B5c3BkpsZxZQXvEwY3cyxq87nlV
   PG8JYo8J3Ft/vy2nbfkgSuEKaUJru6i75ggiCmEsvnoCZuWmOE3PwgHnE
   b0x7TKrku7I/6/7JzcabSHI8T3N13WHSITJ/P1E1guKUqL9CcHPlcv+Tg
   XgcBFBwO4jmwfxkeZT3DpKqkWmPqmEWEb5sp9UBc92n2lwVe/25XjVN1H
   S2ZMicNzAfhOnUdrffJ0GCcMafZqZD+uK/r0VlR2ncLcuCyeq7cdkKQQd
   EkNkD67nagwd/rckQ3a8c9YqafbQrvfzZGazOP9gsc/OcO6e8CYrWR1DJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415258479"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="415258479"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 04:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="668156377"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="668156377"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Feb 2023 04:31:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOeAw-0001zq-2Q;
	Sun, 05 Feb 2023 12:31:18 +0000
Date: Sun, 5 Feb 2023 20:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 3957/20208]
 drivers/pci/controller/mobiveil/pcie-mobiveil.c:173:6: warning: no previous
 prototype for function '__program_ob_windows'
Message-ID: <202302052013.S3fFoTn8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xiaowei,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 023710396da10045da1b357e709b9284512c2bdc [3957/20208] PCI: mobiveil: Add the EP driver support
config: powerpc-buildonly-randconfig-r005-20230205 (https://download.01.org/0day-ci/archive/20230205/202302052013.S3fFoTn8-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/023710396da10045da1b357e709b9284512c2bdc
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 023710396da10045da1b357e709b9284512c2bdc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:173:6: warning: no previous prototype for function '__program_ob_windows' [-Wmissing-prototypes]
   void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, int win_num,
        ^
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:173:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, int win_num,
   ^
   static 
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
https://github.com/intel/lkp-tests
