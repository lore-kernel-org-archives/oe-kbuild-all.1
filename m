Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9A0AD23
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685088805; x=1716624805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SDWTVuw0iunhjfE2CuvUzNqc8mxK1dwvb8AaTW1sbc0=;
  b=CppIvXxIMYyiTtY/DVckUWd4SdwUVMpOPUEPG3QfNHFTY13gY7C0uGDB
   VJjX84I3Wqr9PEHX6vLilckjqEHrVaCiPhYSUuMCo7nnFkQ8I3YNyekh9
   6wHMZI+kaCxkKPak+rOC88sM3yLyYDl0oxJMwiMeCWQFWhN3vQvh6e/Ju
   SsXe8n8v3BTlTLBaJzJvoB/qabmLqvyy6uBXp0n5mNhYQizPmmPK9/J02
   CUXLWuTXn9zchEUCeRjGKxJWnmg5Q1ikQI72PZHaJcT/hYM+PJIHbpNRO
   OK9gykNA88s2ahXFA79doYTpGfn9bYH0gDqoqY5NZlOUBMLHXSVrs/Kpk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="417632048"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="417632048"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 01:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="795022319"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="795022319"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 May 2023 01:13:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2SZf-000JBB-0w;
	Fri, 26 May 2023 08:13:23 +0000
Date: Fri, 26 May 2023 16:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 3031/9879]
 drivers/mailbox/imx-mailbox.c:140:10: warning: no previous prototype for
 function 'get_mu_buf'
Message-ID: <202305261637.SUkfgrc3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: 94cd15eaa1a2683afc6b0949be818d597f51eb2e [3031/9879] LF-6580-1: drivers: imx-mailbox: MU Buffer
config: hexagon-randconfig-r041-20230524 (https://download.01.org/0day-ci/archive/20230526/202305261637.SUkfgrc3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/94cd15eaa1a2683afc6b0949be818d597f51eb2e
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 94cd15eaa1a2683afc6b0949be818d597f51eb2e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mailbox/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261637.SUkfgrc3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mailbox/imx-mailbox.c:10:
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
   In file included from drivers/mailbox/imx-mailbox.c:10:
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
   In file included from drivers/mailbox/imx-mailbox.c:10:
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
>> drivers/mailbox/imx-mailbox.c:140:10: warning: no previous prototype for function 'get_mu_buf' [-Wmissing-prototypes]
   uint8_t *get_mu_buf(struct mbox_chan *chan)
            ^
   drivers/mailbox/imx-mailbox.c:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   uint8_t *get_mu_buf(struct mbox_chan *chan)
   ^
   static 
   7 warnings generated.


vim +/get_mu_buf +140 drivers/mailbox/imx-mailbox.c

   139	
 > 140	uint8_t *get_mu_buf(struct mbox_chan *chan)
   141	{
   142		uint8_t *addr;
   143		struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
   144	
   145		addr = priv->base + priv->dcfg->xBUF;
   146		return addr;
   147	}
   148	EXPORT_SYMBOL(get_mu_buf);
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
