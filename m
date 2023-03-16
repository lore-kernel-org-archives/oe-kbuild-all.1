Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421EB376
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 05:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678943904; x=1710479904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CzgSYMUrVQGJeSNR81v/7aKXhdlX6dlT9RLBYyCUTpI=;
  b=T5iehGVLwRnYG6MpyeOpVUP0MWHKfFYa7UGQdEHFWSFyrN41IoGYWQwf
   rEuIBGlXXQNz6PjL7ectt1OVyClHOOfauebsj5wy9rTTuCzAyZZaMj/Ww
   sy8M37K2YYJTzTFBDJ2NyrdSVq9BVS74zEgT20rtpkQ/fjw9cLjPPCWzD
   tsWYJEyebyRGzK1wvXSHXB2AgLD3OiD5EwKkAZOv1wmRlZ0ndvct0ucjF
   DanJDepG0SLvuxRxkfNU8tMpIsTeVxfhy4kqCs0NKjRRLm/1ArU7fSc+Z
   7Si8+qWGSdpXKutpCUU8m9Uvj71BHVdG9RzNl8wbrHrw+2qYj6qdEozyo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365581648"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="365581648"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 22:18:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743972027"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="743972027"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 22:18:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcg0L-0008Jv-20;
	Thu, 16 Mar 2023 05:18:21 +0000
Date: Thu, 16 Mar 2023 13:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [linux-next:master 2408/3406] cc_driver.c:undefined reference to
 `devm_platform_get_and_ioremap_resource'
Message-ID: <202303161354.T2OZFUFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
commit: 0c70bc9dedd441b7dc0efc7426d2f5adbdd1b8e4 [2408/3406] crypto: ccree - Use devm_platform_get_and_ioremap_resource()
config: s390-randconfig-r032-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161354.T2OZFUFZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0c70bc9dedd441b7dc0efc7426d2f5adbdd1b8e4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0c70bc9dedd441b7dc0efc7426d2f5adbdd1b8e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161354.T2OZFUFZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/dma/coherent.o: in function `_dma_release_coherent_memory':
   coherent.c:(.text+0x306): undefined reference to `memunmap'
   s390-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
   coherent.c:(.text+0x532): undefined reference to `memremap'
   s390-linux-ld: coherent.c:(.text+0x5e0): undefined reference to `memunmap'
   s390-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   irq-al-fic.c:(.init.text+0xd4): undefined reference to `of_iomap'
   s390-linux-ld: irq-al-fic.c:(.init.text+0x216): undefined reference to `iounmap'
   s390-linux-ld: drivers/misc/open-dice.o: in function `open_dice_wipe':
   open-dice.c:(.text+0x2fa): undefined reference to `devm_memremap'
   s390-linux-ld: open-dice.c:(.text+0x3ee): undefined reference to `devm_memunmap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
   cistpl.c:(.text+0x1a10): undefined reference to `ioremap'
   s390-linux-ld: cistpl.c:(.text+0x1c34): undefined reference to `iounmap'
   s390-linux-ld: cistpl.c:(.text+0x1cc2): undefined reference to `ioremap'
   s390-linux-ld: cistpl.c:(.text+0x1d72): undefined reference to `iounmap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
   cistpl.c:(.text+0x4788): undefined reference to `iounmap'
   s390-linux-ld: drivers/crypto/ccree/cc_driver.o: in function `init_cc_resources':
>> cc_driver.c:(.text+0x1232): undefined reference to `devm_platform_get_and_ioremap_resource'
   s390-linux-ld: drivers/crypto/ccree/cc_debugfs.o: in function `cc_debugfs_init':
   cc_debugfs.c:(.text+0x21c): undefined reference to `debugfs_create_regset32'
   s390-linux-ld: cc_debugfs.c:(.text+0x3e8): undefined reference to `debugfs_create_regset32'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
