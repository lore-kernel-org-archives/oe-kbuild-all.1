Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D260D28E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 21:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677533945; x=1709069945;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qMmhw7p81IiBhD6Pn8FfHk63VNlXVZXiS0zWqz6PA3M=;
  b=GjxgvErNNF4VlkYzA4125g0fIH4BFH3TUl5i1d17ytkgwx4DB+Z4DqP5
   HNcB7b1dOfAJrVO6GujAykf8mvd74gDxCeS2I5RnoA1wUYZmd06sbiOvU
   sxziDcT6E6HcvSIFiRmpguO16RqO6BgvWF6eSONxdHUzG4jWyyF8qtFeh
   WfDUa96Oc/0OKs5HIQWQKZLJn7jqT7736D5nu8iRg5Bs/enzmscSgGGIl
   R2HRI8oW26Y8JB/kOzeZWIwvAkiOKcwR+HEej7qMlYXaGUT63A387f9nD
   7ui9HP2v/lt64Qq7XTDuZovcgwhNYiXjeJG8puFvC9YDSaOs6RK0iHBoV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332698867"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="332698867"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 13:39:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="797810304"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="797810304"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Feb 2023 13:39:03 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWlD4-0004oB-1I;
	Mon, 27 Feb 2023 21:39:02 +0000
Date: Tue, 28 Feb 2023 05:38:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>, Andrew Davis <afd@ti.com>
Subject: [ti:ti-rt-linux-5.10.y-cicd 21251/22727]
 drivers/media/platform/chips-media/wave5/wave5-hw.c:122:28: warning: left
 shift count >= width of type
Message-ID: <202302280523.RDc33Fm4-lkp@intel.com>
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

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   d14fbab5ccb21ffeb010ce57792c56a1308ed314
commit: 0701e20ef09c97d8bd786ac9489284e8eb5401b7 [21251/22727] wave5: Support 48bit memory address.
config: h8300-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280523.RDc33Fm4-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout 0701e20ef09c97d8bd786ac9489284e8eb5401b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 SHELL=/bin/bash drivers/char/tpm/ drivers/dma/ drivers/media/dvb-frontends/ drivers/media/i2c/ drivers/media/platform/chips-media/wave5/ drivers/media/rc/ drivers/mmc/core/ drivers/net/ethernet/cadence/ drivers/usb/dwc2/ drivers/usb/misc/sisusbvga/ drivers/usb/storage/ drivers/w1/ fs/cifs/ fs/jfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280523.RDc33Fm4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/iopoll.h:9,
                    from drivers/media/platform/chips-media/wave5/wave5-hw.c:8:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/asm-generic/page.h:93:51: warning: ordered comparison of pointer with null pointer [-Wextra]
      93 | #define virt_addr_valid(kaddr)  (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
         |                                                   ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-hw.c: In function 'wave5_read_reg_for_mem_addr':
>> drivers/media/platform/chips-media/wave5/wave5-hw.c:122:28: warning: left shift count >= width of type [-Wshift-count-overflow]
     122 |         addr = ((high_addr << 32) | val);
         |                            ^~
--
   In file included from include/linux/kernel.h:11,
                    from drivers/media/platform/chips-media/wave5/wave5-vpu.c:7:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/asm-generic/page.h:93:51: warning: ordered comparison of pointer with null pointer [-Wextra]
      93 | #define virt_addr_valid(kaddr)  (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
         |                                                   ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c: In function 'wave5_vpu_probe':
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
