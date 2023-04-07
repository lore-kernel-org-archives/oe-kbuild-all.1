Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345402582
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 21:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680901750; x=1712437750;
  h=date:from:cc:subject:message-id:mime-version;
  bh=BTVwYSGLpAhvepUrFYoawLj55oO0lv18h4MJtDyJfBg=;
  b=YVwOTnmCksFHUiy+LCpPyjS5H7N6IsvDR0gtVB6HWl6aJd3JQL5EsigO
   /ldSaFv49V/7ZUWc0BZ922DheU5c3/X9rentbVMqshkn2EJ0wK4FCyxfX
   5K01W9FLmm0pQLBUumNJIxa2ocYxiGS318RVdGcJEyiAggoFpj9NwD0R+
   ONpxEcjvdHjRXA1OtjAm7x2lDntVBk5+3L/DCH1FSuvenENh2zkprqjdH
   m4eid5HngoEp3MUk1DUeso2zLFgibR2oMMw8YMQ9lZhmye7+o6CbLiGZt
   P0dvUvVqx1VaYuYLCbzn4HQsBEQStJ6KuNKjjAiiQH+Ey2P1AB/yVvUCc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405890967"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="405890967"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 14:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="1017369896"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="1017369896"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2023 14:09:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pktKT-000St8-1V;
	Fri, 07 Apr 2023 21:09:05 +0000
Date: Sat, 8 Apr 2023 05:08:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>, Andrew Davis <afd@ti.com>
Subject: [ti:ti-linux-5.10.y-cicd 20597/22025]
 drivers/media/platform/chips-media/wave5/wave5-hw.c:122:28: warning: left
 shift count >= width of type
Message-ID: <202304080448.GBgDUT04-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nas,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: 0701e20ef09c97d8bd786ac9489284e8eb5401b7 [20597/22025] wave5: Support 48bit memory address.
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230408/202304080448.GBgDUT04-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 0701e20ef09c97d8bd786ac9489284e8eb5401b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/platform/chips-media/wave5/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080448.GBgDUT04-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/chips-media/wave5/wave5-hw.c: In function 'wave5_read_reg_for_mem_addr':
>> drivers/media/platform/chips-media/wave5/wave5-hw.c:122:28: warning: left shift count >= width of type [-Wshift-count-overflow]
     122 |         addr = ((high_addr << 32) | val);
         |                            ^~
--
   In file included from include/linux/printk.h:409,
                    from include/linux/kernel.h:17,
                    from drivers/media/platform/chips-media/wave5/wave5-vpu.c:7:
   drivers/media/platform/chips-media/wave5/wave5-vpu.c: In function 'wave5_vpu_probe':
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:274:37: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     274 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:126:29: note: in definition of macro '__dynamic_func_call'
     126 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:158:9: note: in expansion of macro '_dynamic_func_call'
     158 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:9: note: in expansion of macro 'dynamic_dev_dbg'
     123 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:30: note: in expansion of macro 'dev_fmt'
     123 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:274:17: note: in expansion of macro 'dev_dbg'
     274 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                 ^~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:274:70: note: format string is defined here
     274 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                                                    ~~^
         |                                                                      |
         |                                                                      long unsigned int
         |                                                                    %x
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:284:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     284 |         dev->ext_addr = ((dev->common_mem.daddr >> 32) & 0xFFFF);
         |                                                 ^~


vim +122 drivers/media/platform/chips-media/wave5/wave5-hw.c

   113	
   114	static dma_addr_t wave5_read_reg_for_mem_addr(struct vpu_instance *inst,
   115						      unsigned int reg_addr)
   116	{
   117		dma_addr_t addr;
   118		dma_addr_t high_addr = inst->dev->ext_addr;
   119		u32 val;
   120	
   121		val = vpu_read_reg(inst->dev, reg_addr);
 > 122		addr = ((high_addr << 32) | val);
   123	
   124		return addr;
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
