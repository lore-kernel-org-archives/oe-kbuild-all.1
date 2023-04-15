Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7E32F39
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 22:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681598457; x=1713134457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MIJWJyM+TBOnDlSMUInosxOiV9rLEBKD40AZWAktwqw=;
  b=hiQrWMHHhk//lvNSpXQEw4YEGWS7Lci1JP2nPIRMJ18mbf7muLS/S4fC
   f/5q6g9If8BBwwFSLjY1LGZXGqBxHth0fUMGk45rxvc9rpnbQt82m+KBZ
   btcQWRz6F1EwEhhrfbJa3JCBCLcA7GvKmM773Fr4vss23uR7r6gt7PyJ3
   whj1Par6XsqLhPDjr56dF/ShnCb+C7d+AcxVkkQI4haWfUttA61hSHghK
   vaYOvZccV44OuMs71NKdjxYQMIX7YqWlNI+ecx45nzMZTeUdQop+GzIq3
   S+De/4st+1Cx3NprFNlNUoxFQ0YSHW14seIF36Q8BDZqHXAhFTKUXrU4r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="430977507"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="430977507"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 15:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="814330346"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="814330346"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2023 15:40:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnoZi-000bOF-2o;
	Sat, 15 Apr 2023 22:40:54 +0000
Date: Sun, 16 Apr 2023 06:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 14/48]
 sound/soc/soc-utils.c:243:34: warning: unused variable 'soc_dummy_ids'
Message-ID: <202304160603.aJbUChKN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   81cfa47ce512c163ac0f26afd1b161d7f69b92f0
commit: b4e0343e19f09995f6db80eee41e67211d334674 [14/48] ASoC: soc-utils: HACK: DT binding for snd-soc-dummy
config: hexagon-randconfig-r003-20230416 (https://download.01.org/0day-ci/archive/20230416/202304160603.aJbUChKN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/omap-audio/linux-audio/commit/b4e0343e19f09995f6db80eee41e67211d334674
        git remote add omap-audio https://github.com/omap-audio/linux-audio
        git fetch --no-tags omap-audio peter/linux-next-wip
        git checkout b4e0343e19f09995f6db80eee41e67211d334674
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160603.aJbUChKN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/soc-utils.c:16:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from sound/soc/soc-utils.c:16:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from sound/soc/soc-utils.c:16:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> sound/soc/soc-utils.c:243:34: warning: unused variable 'soc_dummy_ids' [-Wunused-const-variable]
   static const struct of_device_id soc_dummy_ids[] = {
                                    ^
   7 warnings generated.


vim +/soc_dummy_ids +243 sound/soc/soc-utils.c

   242	
 > 243	static const struct of_device_id soc_dummy_ids[] = {
   244		{ .compatible = "linux,snd-soc-dummy", },
   245		{ }
   246	};
   247	MODULE_DEVICE_TABLE(of, soc_dummy_ids);
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
