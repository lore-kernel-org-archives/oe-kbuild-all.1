Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F65510ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 03:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674618642; x=1706154642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sWPZCv7dbw7YO2Dx4HsSaSC5NQAI95HqjpgZRHkV9sk=;
  b=IeLSKtlIeHpKkjr1oph6kNGoN/ZrAt7Jbs0zppkhwSpyTfFbLxdPNI/F
   aU9812Kovrsa2YcI9Lmhz5DVNwsprfCazlXd8OC4wvT1YTPRo0ah9+Ouq
   AUzJw8DD8e/lYSs4vy2tCK9HvDOZz8tRgJj0t2YiMv8AeBuPY3A+C7ayP
   QdaZWZgnX0zJkA2MJROa6Mx2jNynjwnzUzNjtrTTFOLi8cHLC0mtHiImE
   rtTAXEOXwuy5sK/7j0yh9GQDonQQNBjvhIMMIOxrJtf+g7GvkiRFmEwHY
   FjXd2CI41QTyvvb3Pvb7qRHSmEBmq4aetEFAxO7XkMz7S2ua28aMbRZV0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324173519"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="324173519"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 19:50:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="662371435"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="662371435"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Jan 2023 19:50:37 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKWo0-00071C-1S;
	Wed, 25 Jan 2023 03:50:36 +0000
Date: Wed, 25 Jan 2023 11:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [krzk-github:wip/qcom-rt 85/2161] arch/riscv/include/asm/mmio.h:67:
 undefined reference to `dw_edma_remove'
Message-ID: <202301251109.22XhDTxJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/qcom-rt
head:   f7d4b0a1ee324a641519bdddf78909c47b39198d
commit: 3ffee7408c93dd4e2f70e400b6327bae3ec2fc9a [85/2161] PCI: dwc: Add DW eDMA engine support
config: riscv-randconfig-r012-20230124 (https://download.01.org/0day-ci/archive/20230125/202301251109.22XhDTxJ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/3ffee7408c93dd4e2f70e400b6327bae3ec2fc9a
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/qcom-rt
        git checkout 3ffee7408c93dd4e2f70e400b6327bae3ec2fc9a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/pci/controller/dwc/pcie-designware.o: in function `.L0 ':
   drivers/pci/controller/dwc/pcie-designware.c:713: undefined reference to `dw_edma_probe'
   riscv32-linux-ld: drivers/pci/controller/dwc/pcie-designware.o: in function `.L0 ':
>> arch/riscv/include/asm/mmio.h:67: undefined reference to `dw_edma_remove'


vim +67 arch/riscv/include/asm/mmio.h

0c3ac28931d578 Paul Walmsley 2019-10-28  61  
0c3ac28931d578 Paul Walmsley 2019-10-28  62  #define __raw_readl __raw_readl
0c3ac28931d578 Paul Walmsley 2019-10-28  63  static inline u32 __raw_readl(const volatile void __iomem *addr)
0c3ac28931d578 Paul Walmsley 2019-10-28  64  {
0c3ac28931d578 Paul Walmsley 2019-10-28  65  	u32 val;
0c3ac28931d578 Paul Walmsley 2019-10-28  66  
0c3ac28931d578 Paul Walmsley 2019-10-28 @67  	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
0c3ac28931d578 Paul Walmsley 2019-10-28  68  	return val;
0c3ac28931d578 Paul Walmsley 2019-10-28  69  }
0c3ac28931d578 Paul Walmsley 2019-10-28  70  

:::::: The code at line 67 was first introduced by commit
:::::: 0c3ac28931d578324e93afab6ee7b740dfdaff6f riscv: separate MMIO functions into their own header file

:::::: TO: Paul Walmsley <paul.walmsley@sifive.com>
:::::: CC: Paul Walmsley <paul.walmsley@sifive.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
