Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE3B7B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675610724; x=1707146724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pa/8m/351rVYwlfRPM9Klt4gSjkAihWBr46CVhLgzzw=;
  b=JhqNoijtbo1PMTc6Clw/UZfdsXF/j6GLZm+KaWThea0TdvH36VsehN/H
   0W7hObc7ptb27SGPt3qfYSSdaZB24TNMyxx/phXgXC9coXLxuMTL0s6h8
   byNTphckjSo54j5b29PhejYgGh9Z+jpYoM5wxFlBPHqlNwtzZdWxSSMyJ
   0siW4SirnPX1MV4p/ExVWonwBTqELFvMJI1NoidkrN6hAflyfkBFAFaK5
   bChsKvFjFzg7dc4oa2thoZq52S9yQ0ExAQSIIgl2hkabLehDvU2IJerXs
   shVgSkIgZ9ZgVrGCejnI4lTIxnPpfc6CoGpNldgEPzastwlzdI6CBRtyU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="329067255"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="329067255"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 07:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="616218121"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="616218121"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Feb 2023 07:25:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOgtN-00024e-3C;
	Sun, 05 Feb 2023 15:25:22 +0000
Date: Sun, 5 Feb 2023 23:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 3957/20208]
 drivers/pci/controller/mobiveil/pcie-mobiveil.c:173:6: warning: no previous
 prototype for '__program_ob_windows'
Message-ID: <202302052331.ZBzjHUaK-lkp@intel.com>
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
config: ia64-buildonly-randconfig-r004-20230205 (https://download.01.org/0day-ci/archive/20230205/202302052331.ZBzjHUaK-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/023710396da10045da1b357e709b9284512c2bdc
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 023710396da10045da1b357e709b9284512c2bdc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/pci/controller/mobiveil/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:173:6: warning: no previous prototype for '__program_ob_windows' [-Wmissing-prototypes]
     173 | void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, int win_num,
         |      ^~~~~~~~~~~~~~~~~~~~


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
