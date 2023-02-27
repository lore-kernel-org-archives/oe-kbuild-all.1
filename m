Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426B6AAE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677504886; x=1709040886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/oyfiQXJBsqws/QekMt0OO05MeztRyr8HzVkM1tq8bo=;
  b=MUlUgtk1WmBTIlLnUOcW81Fxo5k5GgAiEj0Bol4y0xU1YNU58BYfh1+b
   JjbSZ0bA0Bj9TatYJ7ODaU37UzVna0T/oxHJGLXHPGiVqftfz5XHzc8Kq
   Xt8s6LW5wu4/4x7WtKco5T/jhvzU4lyGwCxD/zJt6OOzg0Ici8dcH69GG
   fRCrEVVkmmw8XAn2Te5xvGGqzxtc8SiDZjbBfjVc4YKP4pEHbwZm8Ckk6
   NC2jB0tUEwapaqHSSJCyG/Gl43pRBadlzJ66ui9wgTD0BK4PwYxsTM9Qv
   SfoIyaJFJ2UPpnHP3riXkQOZRLNlFovn8Z+qypXRnta8CjsqueA9gcfzw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="314283255"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="314283255"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 05:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="623579878"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="623579878"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Feb 2023 05:34:43 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWdeM-0004Rr-0t;
	Mon, 27 Feb 2023 13:34:42 +0000
Date: Mon, 27 Feb 2023 21:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 312/583]
 drivers/staging/fbtft/fb_st7735r.c:189:5: warning: no previous prototype for
 function 'variant_adafruit18'
Message-ID: <202302272100.hXFjpMCw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: 5b4633cd65ca53a07dca6892c593862589b51249 [312/583] staging/fbtft: Add support for display variants
config: hexagon-randconfig-r045-20230227 (https://download.01.org/0day-ci/archive/20230227/202302272100.hXFjpMCw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/5b4633cd65ca53a07dca6892c593862589b51249
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 5b4633cd65ca53a07dca6892c593862589b51249
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/staging/fbtft/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272100.hXFjpMCw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/fbtft/fb_st7735r.c:13:
   In file included from drivers/staging/fbtft/fbtft.h:7:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
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
   In file included from drivers/staging/fbtft/fb_st7735r.c:13:
   In file included from drivers/staging/fbtft/fbtft.h:7:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
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
   In file included from drivers/staging/fbtft/fb_st7735r.c:13:
   In file included from drivers/staging/fbtft/fbtft.h:7:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
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
>> drivers/staging/fbtft/fb_st7735r.c:189:5: warning: no previous prototype for function 'variant_adafruit18' [-Wmissing-prototypes]
   int variant_adafruit18(struct fbtft_display *display)
       ^
   drivers/staging/fbtft/fb_st7735r.c:189:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int variant_adafruit18(struct fbtft_display *display)
   ^
   static 
>> drivers/staging/fbtft/fb_st7735r.c:195:5: warning: no previous prototype for function 'variant_adafruit18_green' [-Wmissing-prototypes]
   int variant_adafruit18_green(struct fbtft_display *display)
       ^
   drivers/staging/fbtft/fb_st7735r.c:195:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int variant_adafruit18_green(struct fbtft_display *display)
   ^
   static 
   8 warnings generated.


vim +/variant_adafruit18 +189 drivers/staging/fbtft/fb_st7735r.c

   188	
 > 189	int variant_adafruit18(struct fbtft_display *display)
   190	{
   191		display->gamma = ADAFRUIT18_GAMMA;
   192		return 0;
   193	}
   194	
 > 195	int variant_adafruit18_green(struct fbtft_display *display)
   196	{
   197		display->gamma = ADAFRUIT18_GAMMA;
   198		display->fbtftops.set_addr_win = adafruit18_green_tab_set_addr_win;
   199		return 0;
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
