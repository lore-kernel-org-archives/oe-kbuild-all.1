Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7EA2113
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683990732; x=1715526732;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kZrjRfAt2x74QNCirpFMNcZM9FPT6kkeyxXU8ijNcAE=;
  b=c5Ok1L8t+zxkmKtCZ+RMMdMNvx/wCO0GYgL9EQU9MyQvabDFg2FMX1cE
   NB0L40XA73Ms6/zMfFEyor5bviYOQuhi6pm6CP3wSqIN07KnVyxPZSazw
   DhBeCO0C2CTlGUtScqPZQBowJTSYyKy24cGzSlKUn2plr5N9NT4rT7CHZ
   U/VWW9DI07Q0bn7KR1yDNn1sBFRJ+PN9rzZIAZF6kg1UCpZl0Oew4CGJA
   D+yVJ//q/ev88ymLlfJFTo60mMFwvObw2qVx+lNaLFIRjifC57s5U5CRQ
   m8VVgylxSkyKdbEvmDsJszaCKAoRfzBFf0aQWZjC5U444cOyKtUxtUlQr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="348460205"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="348460205"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 08:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="731140447"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="731140447"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 May 2023 08:10:12 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxqst-0005Y8-36;
	Sat, 13 May 2023 15:10:11 +0000
Date: Sat, 13 May 2023 23:09:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 92/104]
 drivers/media/platform/chips-media/wave5/wave5-hw.c:122:28: warning: left
 shift count >= width of type
Message-ID: <202305132307.Zw2jTzfq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   d76f380bcb6d6d658d48f40a61349808f5f34be9
commit: 6134dc96ac69c3689f38838b4cf36b4b24fcc9e4 [92/104] wave5: Support 48bit memory address.
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230513/202305132307.Zw2jTzfq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 6134dc96ac69c3689f38838b4cf36b4b24fcc9e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/platform/chips-media/wave5/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305132307.Zw2jTzfq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/chips-media/wave5/wave5-hw.c: In function 'wave5_read_reg_for_mem_addr':
>> drivers/media/platform/chips-media/wave5/wave5-hw.c:122:28: warning: left shift count >= width of type [-Wshift-count-overflow]
     122 |         addr = ((high_addr << 32) | val);
         |                            ^~
--
   In file included from include/linux/printk.h:566,
                    from include/linux/kernel.h:29,
                    from drivers/media/platform/chips-media/wave5/wave5-vpu.c:7:
   drivers/media/platform/chips-media/wave5/wave5-vpu.c: In function 'wave5_vpu_probe':
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:227:37: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     227 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:227:17: note: in expansion of macro 'dev_dbg'
     227 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                 ^~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:227:70: note: format string is defined here
     227 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                                                    ~~^
         |                                                                      |
         |                                                                      long unsigned int
         |                                                                    %x
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:237:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     237 |         dev->ext_addr = ((dev->common_mem.daddr >> 32) & 0xFFFF);
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
