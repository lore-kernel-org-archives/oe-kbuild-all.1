Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F189018C2E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687362380; x=1718898380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6aeZt3AGr6ft5yHMkjJnVz9mKRAHdriZ/qLt81RNsCk=;
  b=eOnkERFWMP/jRvKEvw+8KvZ/iN/UHFEGBYO8OKThB9G7oSwo/npuK1ga
   80Da7AWqjhLfCEhJLu/XZ9ykfxqWNL+66yp5aWJjpS1ZskrUL2zq5dGcf
   VgYyFvvOx+kQj/bGLYM39tAsIvq7R7GtgzCU03+wQHtopZpvnwfqXfqqX
   UiyVvjLCEhTn+C5YmbPZC3WtG0orcb7qxDInsTbi+2o5Jb3et7FFjtPI0
   5qdU/+dHGraEFjV9/+GJQsJYOh8naUmn7yXb24qmuE5cdK4hJ0JWKTXjo
   Anmm39BVqbxTvpVfTzsTooJQeehOrwcQbBpAY6VaLdNVnV5WKvBY/ICyJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="359082024"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="359082024"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 08:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="717704974"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="717704974"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jun 2023 08:46:10 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC025-0006uv-2s;
	Wed, 21 Jun 2023 15:46:09 +0000
Date: Wed, 21 Jun 2023 23:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arc-rimi.c:undefined reference to `ioremap'
Message-ID: <202306212350.fgz5R8Xv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiko,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e660abd551f1172e428b4e4003de887176a8a1fd
commit: 6ef55060a1cc29dd54ff390f22cb3de266dab2b0 s390: make use of CONFIG_FUNCTION_ALIGNMENT
date:   3 months ago
config: s390-randconfig-r035-20230621 (https://download.01.org/0day-ci/archive/20230621/202306212350.fgz5R8Xv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306212350.fgz5R8Xv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306212350.fgz5R8Xv-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/clk/clk-fixed-mmio.o: in function `fixed_mmio_clk_setup':
   clk-fixed-mmio.c:(.text+0x92): undefined reference to `of_iomap'
   s390-linux-ld: clk-fixed-mmio.c:(.text+0xda): undefined reference to `iounmap'
   s390-linux-ld: drivers/dma/fsl-edma.o: in function `fsl_edma_probe':
   fsl-edma.c:(.text+0xa02): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: fsl-edma.c:(.text+0xc86): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/dma/qcom/hidma.o: in function `hidma_probe':
   hidma.c:(.text+0x137a): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: hidma.c:(.text+0x13d4): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/tty/ipwireless/main.o: in function `ipwireless_detach':
   main.c:(.text+0x90): undefined reference to `iounmap'
   s390-linux-ld: main.c:(.text+0xd4): undefined reference to `iounmap'
   s390-linux-ld: drivers/tty/ipwireless/main.o: in function `config_ipwireless':
   main.c:(.text+0x23e): undefined reference to `iounmap'
   s390-linux-ld: main.c:(.text+0x35c): undefined reference to `iounmap'
   s390-linux-ld: drivers/tty/ipwireless/main.o: in function `ipwireless_probe.part.0':
   main.c:(.text+0x468): undefined reference to `ioremap'
   s390-linux-ld: main.c:(.text+0x51c): undefined reference to `ioremap'
   s390-linux-ld: main.c:(.text+0x56a): undefined reference to `iounmap'
   s390-linux-ld: main.c:(.text+0x59e): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `check_mirror':
>> arc-rimi.c:(.text+0x2ba): undefined reference to `ioremap'
>> s390-linux-ld: arc-rimi.c:(.text+0x2dc): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `arc_rimi_exit':
   arc-rimi.c:(.exit.text+0x2e): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/arcnet/arc-rimi.o: in function `arcrimi_found':
   arc-rimi.c:(.init.text+0xec): undefined reference to `ioremap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x184): undefined reference to `iounmap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x2a4): undefined reference to `iounmap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x37e): undefined reference to `ioremap'
   s390-linux-ld: arc-rimi.c:(.init.text+0x466): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/ethernet/smsc/smc91c92_cs.o: in function `smc91c92_release':
   smc91c92_cs.c:(.text+0x9ce): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/ethernet/smsc/smc91c92_cs.o: in function `smc91c92_config':
   smc91c92_cs.c:(.text+0x1a3a): undefined reference to `ioremap'
   s390-linux-ld: drivers/net/ethernet/xircom/xirc2ps_cs.o: in function `xirc2ps_release':
   xirc2ps_cs.c:(.text+0x39e): undefined reference to `iounmap'
   s390-linux-ld: drivers/net/ethernet/xircom/xirc2ps_cs.o: in function `xirc2ps_config':
   xirc2ps_cs.c:(.text+0x1674): undefined reference to `ioremap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
   cistpl.c:(.text+0x4a4): undefined reference to `ioremap'
   s390-linux-ld: cistpl.c:(.text+0x4de): undefined reference to `iounmap'
   s390-linux-ld: cistpl.c:(.text+0x562): undefined reference to `iounmap'
   s390-linux-ld: cistpl.c:(.text+0x574): undefined reference to `ioremap'
   s390-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
   cistpl.c:(.text+0xdb6): undefined reference to `iounmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
