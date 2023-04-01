Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98641C27
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 05:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680326248; x=1711862248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7U8bk+oJ73sbdjosMSo1VxI8KIJRHS5e93i33DJNbIg=;
  b=c40QSMjMnQM6Ee1zD+yHSrykd3E/6Up8Zh75q/4WYE9SpJbiTF787tYG
   eXB3Oqd9dwuS2v7xluOcVeA/K9sX/G6dmI8+xgQZ6oiVVZkj2MAbdBG1D
   F7IPipshyfsDK5i6+tieugyaLku2VoL8E22wVgDx/1vkLpZjVtO4AWhsp
   F+7PkVB403mFK1x6MU69Yra+ET9QZ8qr4tZgbS+SA71FM0tKOaTl1718m
   gjtavz+uOr5EO9YfuQ128mvQGWpIqsstD+7TtLtbxZTk2uN4Z9vFJxe2n
   QgPi4yyuIrshD2q/G6ve9btpkAb5SZiS941VBez9mlj3aLj0EFx1dEduP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="427902154"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="427902154"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 22:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="931430205"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="931430205"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Mar 2023 22:17:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piTc1-000MUp-1B;
	Sat, 01 Apr 2023 05:17:13 +0000
Date: Sat, 1 Apr 2023 13:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4167/8375] s390-linux-ld: arc-rimi.c:undefined
 reference to `iounmap'
Message-ID: <202304011327.qfIU8I8B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5
commit: 6ef55060a1cc29dd54ff390f22cb3de266dab2b0 [4167/8375] s390: make use of CONFIG_FUNCTION_ALIGNMENT
config: s390-randconfig-r003-20230329 (https://download.01.org/0day-ci/archive/20230401/202304011327.qfIU8I8B-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6ef55060a1cc29dd54ff390f22cb3de266dab2b0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6ef55060a1cc29dd54ff390f22cb3de266dab2b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304011327.qfIU8I8B-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: s390-linux-ld: DWARF error: could not find abbrev number 60
   drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   irq-al-fic.c:(.init.text+0x26): undefined reference to `of_iomap'
   s390-linux-ld: irq-al-fic.c:(.init.text+0x1ee): undefined reference to `iounmap'
   s390-linux-ld: s390-linux-ld: DWARF error: could not find abbrev number 84172172
   drivers/dma/fsl-edma.o: in function `fsl_edma_probe':
   fsl-edma.c:(.text+0x5fc): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: fsl-edma.c:(.text+0x662): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: s390-linux-ld: DWARF error: could not find abbrev number 283587959
   drivers/dma/idma64.o: in function `idma64_platform_probe':
   idma64.c:(.text+0x1314): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: s390-linux-ld: DWARF error: could not find abbrev number 2979678674
   drivers/dma/qcom/hidma.o: in function `hidma_probe':
   hidma.c:(.text+0xfc4): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: hidma.c:(.text+0x1000): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: s390-linux-ld: DWARF error: could not find abbrev number 1704398
   drivers/net/arcnet/com90xx.o: in function `com90xx_exit':
   com90xx.c:(.exit.text+0x54): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/com90xx.o: in function `check_mirror':
   com90xx.c:(.init.text+0x4c): undefined reference to `ioremap'
   s390-linux-ld: com90xx.c:(.init.text+0x6e): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/com90xx.o: in function `com90xx_found':
   com90xx.c:(.init.text+0x186): undefined reference to `iounmap'
   s390-linux-ld: com90xx.c:(.init.text+0x26c): undefined reference to `iounmap'
   s390-linux-ld: com90xx.c:(.init.text+0x37c): undefined reference to `ioremap'
   s390-linux-ld: com90xx.c:(.init.text+0x456): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/com90xx.o: in function `com90xx_probe':
   com90xx.c:(.init.text+0x708): undefined reference to `ioremap'
   s390-linux-ld: com90xx.c:(.init.text+0x760): undefined reference to `iounmap'
   s390-linux-ld: com90xx.c:(.init.text+0x99a): undefined reference to `iounmap'
   s390-linux-ld: s390-linux-ld: DWARF error: could not find abbrev number 24
   drivers/net/arcnet/arc-rimi.o: in function `check_mirror':
   arc-rimi.c:(.text+0x14c): undefined reference to `ioremap'
>> s390-linux-ld: arc-rimi.c:(.text+0x16e): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `arc_rimi_exit':
   arc-rimi.c:(.exit.text+0x2e): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `arcrimi_found':
   arc-rimi.c:(.init.text+0xb6): undefined reference to `ioremap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x12e): undefined reference to `iounmap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x298): undefined reference to `iounmap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x316): undefined reference to `ioremap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x3e0): undefined reference to `iounmap'
   s390-linux-ld: s390-linux-ld: DWARF error: could not find abbrev number 541732
   drivers/pcmcia/cistpl.o: in function `set_cis_map':
   cistpl.c:(.text+0x4c0): undefined reference to `ioremap'
   s390-linux-ld: cistpl.c:(.text+0x4fa): undefined reference to `iounmap'
   s390-linux-ld: cistpl.c:(.text+0x520): undefined reference to `iounmap'
   s390-linux-ld: cistpl.c:(.text+0x532): undefined reference to `ioremap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
   cistpl.c:(.text+0xd7c): undefined reference to `iounmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
