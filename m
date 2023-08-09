Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AAA16426
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691584479; x=1723120479;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Z/Z+rg801KeZo4ngy7RBcyfELAObQ+yrPuQQEqWtiJY=;
  b=b8qXBt6jYLF03JpFwyhPv0aaIs/BPqlXml9y5GZ4IBoL4dqHbo1N+1nx
   EhYwIBF+yamNCVdwHLUtmiL5VJpYDBHi4OzmcflJ4lIXiuDKvXU4wpDa4
   z6iVbnW/aQJ9wsFzmmW352GiJgczWXS/aKu+ykGFUYvnCnBhThS4pVjG0
   +PQbXzRBOQiqzESjNZkc5kKGM32M7GYzoLa81bQlRl3MILe4kllb8gddM
   C63+F2lBKbqwoo6LOF8I+sOlnL/w/lE31HEiDkyb7qiNptVrGySY6s6PR
   P1LYvWa0q0NXxhU5zj801SeaiW9xM2XPoAr/z264b450RIMf2MVfkWevE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361236420"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="361236420"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 05:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="978371304"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="978371304"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Aug 2023 05:34:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTiOW-00066a-0p;
	Wed, 09 Aug 2023 12:34:32 +0000
Date: Wed, 9 Aug 2023 20:34:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 79/107]
 drivers/media/platform/chips-media/wave5/wave5-vpu.c:339:34: warning: unused
 variable 'wave5_dt_ids'
Message-ID: <202308092055.tyWnDITG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   b48e8af2b534491c63db33742d2758064b72eb9f
commit: edd2c4feec914122a91c898836255213fa0acab7 [79/107] media: chips-media: wave5: Add the v4l2 layer
config: hexagon-randconfig-r033-20230809 (https://download.01.org/0day-ci/archive/20230809/202308092055.tyWnDITG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092055.tyWnDITG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092055.tyWnDITG-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:228:36: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     228 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                                                    ~~~
         |                                                                    %zx
     229 |                         __func__, &dev->sram_buf.daddr, dev->sram_buf.size);
         |                                                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ~~~    ^~~~~~~~~~~
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:339:34: warning: unused variable 'wave5_dt_ids' [-Wunused-const-variable]
     339 | static const struct of_device_id wave5_dt_ids[] = {
         |                                  ^
   8 warnings generated.


vim +/wave5_dt_ids +339 drivers/media/platform/chips-media/wave5/wave5-vpu.c

   338	
 > 339	static const struct of_device_id wave5_dt_ids[] = {
   340		{ .compatible = "cnm,cm511-vpu", .data = &wave511_data },
   341		{ .compatible = "cnm,cm517-vpu", .data = &default_match_data },
   342		{ .compatible = "cnm,cm521-vpu", .data = &wave521_data },
   343		{ .compatible = "cnm,cm521c-vpu", .data = &wave521c_data },
   344		{ .compatible = "cnm,cm521c-dual-vpu", .data = &wave521c_data },
   345		{ .compatible = "cnm,cm521e1-vpu", .data = &default_match_data },
   346		{ .compatible = "cnm,cm537-vpu", .data = &default_match_data },
   347		{ /* sentinel */ }
   348	};
   349	MODULE_DEVICE_TABLE(of, wave5_dt_ids);
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
