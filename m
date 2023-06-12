Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0648C881E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 19:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686598922; x=1718134922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dw0XeBLXOJPKGcyzzK90gJDZYPDyw/7xh4roIRjV3wc=;
  b=Es/4bjdn7I9paLYsTBgY2N47VBdhsv4QPBLZjL1oq10+zkHJXQkJmRgy
   nvgcIssivvFObngOGVRZGucDB9m++FALWlBTWv5nqGmtzEFLxO7VpFvxt
   EJnX3bK6qMAzKxa7K+T+d0mpRirVOuLWZNp3iaeqAKenkpNeq3g7PzzgA
   +JyXqvLL4rWfqwdxIThNQmFkCobHYRaFO0s+4fGjnVrTdmZlpGdmXSc7/
   xZlzF3b5yhs4wn98c5p7MM4ZCVJ319Njmvp/esdSt0eqatNFVCp2UPYpx
   WF176ui32VDuHvaXLhiqrzkbyoYYy6nLnD9IsjxPgDSC+U05M1zL/mHYc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="347797855"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347797855"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 12:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="705519294"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="705519294"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2023 12:41:58 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8nQL-0000cu-20;
	Mon, 12 Jun 2023 19:41:57 +0000
Date: Tue, 13 Jun 2023 03:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [atorgue-stm32:stm32-mp25-for-v6.5 38/44]
 drivers/remoteproc/stm32_rproc.c:121:22: warning: format '%x' expects
 argument of type 'unsigned int', but argument 5 has type 'size_t' {aka 'long
 unsigned int'}
Message-ID: <202306130355.NNCcVi5Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandre,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-mp25-for-v6.5
head:   c9cb7e72e293141d0d6c1d74c26788d3a0605172
commit: 9e4e24414cc6b45bd887d746a59691e295431ddf [38/44] arm64: introduce STM32 family on Armv8 architecture
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230613/202306130355.NNCcVi5Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git/commit/?id=9e4e24414cc6b45bd887d746a59691e295431ddf
        git remote add atorgue-stm32 https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git
        git fetch --no-tags atorgue-stm32 stm32-mp25-for-v6.5
        git checkout 9e4e24414cc6b45bd887d746a59691e295431ddf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/remoteproc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130355.NNCcVi5Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/dma-mapping.h:6,
                    from drivers/remoteproc/stm32_rproc.c:9:
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_mem_alloc':
>> drivers/remoteproc/stm32_rproc.c:121:22: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     121 |         dev_dbg(dev, "map memory: %pa+%x\n", &mem->dma, mem->len);
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/remoteproc/stm32_rproc.c:121:9: note: in expansion of macro 'dev_dbg'
     121 |         dev_dbg(dev, "map memory: %pa+%x\n", &mem->dma, mem->len);
         |         ^~~~~~~
   drivers/remoteproc/stm32_rproc.c:121:40: note: format string is defined here
     121 |         dev_dbg(dev, "map memory: %pa+%x\n", &mem->dma, mem->len);
         |                                       ~^
         |                                        |
         |                                        unsigned int
         |                                       %lx
   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7:
   drivers/remoteproc/stm32_rproc.c:124:30: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     124 |                 dev_err(dev, "Unable to map memory region: %pa+%x\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/remoteproc/stm32_rproc.c:124:17: note: in expansion of macro 'dev_err'
     124 |                 dev_err(dev, "Unable to map memory region: %pa+%x\n",
         |                 ^~~~~~~
   drivers/remoteproc/stm32_rproc.c:124:65: note: format string is defined here
     124 |                 dev_err(dev, "Unable to map memory region: %pa+%x\n",
         |                                                                ~^
         |                                                                 |
         |                                                                 unsigned int
         |                                                                %lx
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_get_loaded_rsc_table':
>> drivers/remoteproc/stm32_rproc.c:630:30: warning: format '%zx' expects argument of type 'size_t', but argument 4 has type 'int' [-Wformat=]
     630 |                 dev_err(dev, "Unable to map memory region: %pa+%zx\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/remoteproc/stm32_rproc.c:630:17: note: in expansion of macro 'dev_err'
     630 |                 dev_err(dev, "Unable to map memory region: %pa+%zx\n",
         |                 ^~~~~~~
   drivers/remoteproc/stm32_rproc.c:630:66: note: format string is defined here
     630 |                 dev_err(dev, "Unable to map memory region: %pa+%zx\n",
         |                                                                ~~^
         |                                                                  |
         |                                                                  long unsigned int
         |                                                                %x


vim +121 drivers/remoteproc/stm32_rproc.c

13140de09cc2dd Fabien Dessenne 2019-05-14  114  
13140de09cc2dd Fabien Dessenne 2019-05-14  115  static int stm32_rproc_mem_alloc(struct rproc *rproc,
13140de09cc2dd Fabien Dessenne 2019-05-14  116  				 struct rproc_mem_entry *mem)
13140de09cc2dd Fabien Dessenne 2019-05-14  117  {
13140de09cc2dd Fabien Dessenne 2019-05-14  118  	struct device *dev = rproc->dev.parent;
13140de09cc2dd Fabien Dessenne 2019-05-14  119  	void *va;
13140de09cc2dd Fabien Dessenne 2019-05-14  120  
13140de09cc2dd Fabien Dessenne 2019-05-14 @121  	dev_dbg(dev, "map memory: %pa+%x\n", &mem->dma, mem->len);
13140de09cc2dd Fabien Dessenne 2019-05-14  122  	va = ioremap_wc(mem->dma, mem->len);
13140de09cc2dd Fabien Dessenne 2019-05-14  123  	if (IS_ERR_OR_NULL(va)) {
13140de09cc2dd Fabien Dessenne 2019-05-14  124  		dev_err(dev, "Unable to map memory region: %pa+%x\n",
13140de09cc2dd Fabien Dessenne 2019-05-14  125  			&mem->dma, mem->len);
13140de09cc2dd Fabien Dessenne 2019-05-14  126  		return -ENOMEM;
13140de09cc2dd Fabien Dessenne 2019-05-14  127  	}
13140de09cc2dd Fabien Dessenne 2019-05-14  128  
13140de09cc2dd Fabien Dessenne 2019-05-14  129  	/* Update memory entry va */
13140de09cc2dd Fabien Dessenne 2019-05-14  130  	mem->va = va;
13140de09cc2dd Fabien Dessenne 2019-05-14  131  
13140de09cc2dd Fabien Dessenne 2019-05-14  132  	return 0;
13140de09cc2dd Fabien Dessenne 2019-05-14  133  }
13140de09cc2dd Fabien Dessenne 2019-05-14  134  

:::::: The code at line 121 was first introduced by commit
:::::: 13140de09cc2dd5e5166ad42292bb82af4e23cef remoteproc: stm32: add an ST stm32_rproc driver

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
