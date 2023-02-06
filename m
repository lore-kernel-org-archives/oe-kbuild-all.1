Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4CA1FC1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 05:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675661874; x=1707197874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Mp7GajM59dd22qhk+1I2QJFGmmOgkTJvGs0i0eUOcM=;
  b=jmaBZtNOlMh62GifGKSlNC5rqbGz9ZJW2u3c5CS8/3aMIsNwOHwStNLh
   12Y1evRWiC8KunkDLMpkag6E6Mhs9gNbJCQ81J+f8LLOqntsdbOI+Ddug
   PwtxKxpbIdgpp0UwwB3ihHZhXmQze/17wtuXpkhS5ejvyR3luOZiGZFVu
   V2ezbygMtO4/fQgdTw2f06y1lVztdPioncalwXjOLEUmPB/aL8wPY5XV8
   zNaXETy1vIa3jb7nOeOcaY1mGUH60z7f7quj/bM4F55Ai/Qhjx858WRvp
   ynQkmfWQz7djyQekRrK8obNEBZgTBwvbDVI6mtFAjs3Swl/oKG3ooz5Su
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="391530513"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="391530513"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 21:37:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="809009777"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="809009777"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2023 21:37:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOuCL-0002PA-11;
	Mon, 06 Feb 2023 05:37:49 +0000
Date: Mon, 6 Feb 2023 13:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 4049/20208]
 include/linux/irqchip/arm-gic-v3.h:602:10: fatal error: 'asm/arch_gicv3.h'
 file not found
Message-ID: <202302061323.BFHMtRRi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anson,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: b86c23dd49687dcd77b99e45dd311157c644dc14 [4049/20208] firmware: imx: scu-pd: Add IRQSTEER wakeup support
config: riscv-randconfig-r026-20230205 (https://download.01.org/0day-ci/archive/20230206/202302061323.BFHMtRRi-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/b86c23dd49687dcd77b99e45dd311157c644dc14
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout b86c23dd49687dcd77b99e45dd311157c644dc14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/imx/scu-pd.c:59:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/firmware/imx/scu-pd.c:59:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/firmware/imx/scu-pd.c:59:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   In file included from drivers/firmware/imx/scu-pd.c:60:
>> include/linux/irqchip/arm-gic-v3.h:602:10: fatal error: 'asm/arch_gicv3.h' file not found
   #include <asm/arch_gicv3.h>
            ^~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +602 include/linux/irqchip/arm-gic-v3.h

7e5802781c3e10 Andre Przywara        2014-11-12  601  
7936e914f7b082 Jean-Philippe Brucker 2015-10-01 @602  #include <asm/arch_gicv3.h>
021f653791ad17 Marc Zyngier          2014-06-30  603  

:::::: The code at line 602 was first introduced by commit
:::::: 7936e914f7b0827c2dcfe63fbefdc21de2d61dcb irqchip/gic-v3: Refactor the arm64 specific parts

:::::: TO: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
