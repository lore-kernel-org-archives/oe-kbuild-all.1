Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DAC14012
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpUWEpLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700410476; x=1731946476;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FmOlT/eU9lPAXEVQ1c/7DIysKvt2THMLPBoSU26qtck=;
  b=YpUWEpLxdDNhZ73iMq5bvUOUnTk5hMrM13bOVE+PxtzKN+YS0t4giQwC
   W7LqfTxmk+YNgsFOY954y+emRBJ1L1kCP1q9kf4JuUNilxu3Bf/2p5n8/
   ySsLopbn2821vglVGg1Hfq0vKuvHySo4cZFudUXXeOoPorCR1Bl/WELsH
   N70JuTUbT/WrBXUw62th6BbwtD4/h/DRLXCGQftIqYm8aonw3UqPO8wQR
   7gGcoNypSGvA6OOuNIv77CrZoyNhx3wP8Jo1RzK3kj0LCTmxCVZRllIye
   jRiUBWh+UxWEqukYLbuMtwte2/ITMQxmHqvuu9POKBe4r/irnV+CtHfBU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="422601332"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="422601332"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 08:14:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="13946937"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2023 08:14:33 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4kRK-0005Gr-25;
	Sun, 19 Nov 2023 16:14:30 +0000
Date: Mon, 20 Nov 2023 00:14:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>,
	Brandon Brnich <b-brnich@ti.com>, Andrew Davis <afd@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 1/26]
 drivers/media/platform/chips-media/wave5/wave5-hw.c:122:21: warning: shift
 count >= width of type
Message-ID: <202311192325.aMqD8wEm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   3d320fa61172b4a33d1c11e57374cc6880562ae0
commit: 30bcc25e7cb1b25667db88d61828728f0f0b5f4b [1/26] wave5: Support 48bit memory address.
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20231119/202311192325.aMqD8wEm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311192325.aMqD8wEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311192325.aMqD8wEm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/chips-media/wave5/wave5-hw.c:8:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/chips-media/wave5/wave5-hw.c:8:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/chips-media/wave5/wave5-hw.c:8:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/media/platform/chips-media/wave5/wave5-hw.c:122:21: warning: shift count >= width of type [-Wshift-count-overflow]
     122 |         addr = ((high_addr << 32) | val);
         |                            ^  ~~
   7 warnings generated.
--
   In file included from drivers/media/platform/chips-media/wave5/wave5-vpu.c:11:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/chips-media/wave5/wave5-vpu.c:11:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/chips-media/wave5/wave5-vpu.c:11:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:275:36: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     275 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                                                    ~~~
         |                                                                    %zx
     276 |                         __func__, &dev->sram_buf.daddr, dev->sram_buf.size);
         |                                                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:273:19: note: expanded from macro 'dynamic_dev_dbg'
     273 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:284:42: warning: shift count >= width of type [-Wshift-count-overflow]
     284 |         dev->ext_addr = ((dev->common_mem.daddr >> 32) & 0xFFFF);
         |                                                 ^  ~~
   8 warnings generated.


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
https://github.com/intel/lkp-tests/wiki
