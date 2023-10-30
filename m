Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208946AB7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrhqqKHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698677628; x=1730213628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dbi8eAWkmgrDAkTQfRhLbyCweAwF/wMXJJuUc9A1nv8=;
  b=HrhqqKHPTXXtolq77xt+etAIkhTakfKMEZDnx4npHYOqs+33dMsGoEXn
   H6aE2kzV6MkGUN1Wcl8l/Iy53StJZHxfdmh0XdOdZ+77YKjVkl7rHBMl7
   a0BocJao6hWEp/aEVZZxvNe5wrarTYfT3DZFRFo09pYhY3iXmEppK/hx8
   +Vhhp3/hZKqVocRKQGsjwbZddOR5TgIIWZs//fVZ/q5qP/slytZ/jJZCl
   SPXMD3TkgW54bfQeEEXVRk05QmsZ4iAoVW/pnoAeYBh2XG0lSt/wLxndF
   7t+Bev67ZzgL3sCHJzK20Y/v13qJT7aVv44vs/uYTTII7+Wzwt/gabqjd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="956551"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="956551"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 07:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="830705160"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="830705160"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Oct 2023 07:53:46 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxTeC-000DL1-0X;
	Mon, 30 Oct 2023 14:53:44 +0000
Date: Mon, 30 Oct 2023 22:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 15770/16121]
 arch/riscv/include/asm/mmio.h:67:undefined reference to `pci_print_aer'
Message-ID: <202310302206.Pkr5eBDi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c503e3eec382ac708ee7adf874add37b77c5d312
commit: 9f39bd073634bb8747e87332aa510172c5f3701c [15770/16121] Merge branch 'for-6.7/cxl-qtg' into cxl/next
config: riscv-randconfig-r002-20220124 (https://download.01.org/0day-ci/archive/20231030/202310302206.Pkr5eBDi-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310302206.Pkr5eBDi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310302206.Pkr5eBDi-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/cxl/core/pci.o: in function `.L0 ':
>> arch/riscv/include/asm/mmio.h:67:(.text+0xd66): undefined reference to `pci_print_aer'
   riscv64-linux-ld: drivers/cxl/core/pci.o: in function `.L0 ':
   drivers/cxl/core/pci.c:711:(.text+0xd9a): undefined reference to `pci_print_aer'
   riscv64-linux-ld: drivers/cxl/core/pci.o: in function `.LVL326':
   drivers/cxl/core/pci.c:753:(.text+0xde4): undefined reference to `pci_print_aer'


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
https://github.com/intel/lkp-tests/wiki
