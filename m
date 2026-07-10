Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DEE25B09D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 18:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706657; cv=none; b=qQ61OTB1egmNwdo8bVxOIxQzdWhvpj+kNXV1xXZwNWu5z5ZlkR2sZD3G0qFNkBpGfV30LC5Fu13fYg1YseBpr1RWl+OzeUjlpUc3+XUd9cy1/sTw8jiKUCkMWX14ypmTCm7EPCHrWNusEHQ31ZSYuOq8HbB1eoUK7WBB974qoTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706657; c=relaxed/simple;
	bh=8m/lgNYINFa9veiMBmbuETRMgiq0F8RNX8U93fdypCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l7I6tkBtopb9jNWrB0LAxdMfrT7U7BRiwR4kSQ4vwnYqAQ5DIMYfJasKPG1FSFaKdF1L92hfhCYKOgIeKTZ0mFysu4soBFL2oEfClnhbIKDAWzo6M6wcJB6Jmfezah7BkPx8Z2zmp3B8tRNLwJC1bdp+hdUh6DHmOVu/HszCbE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VezwwJ5o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VezwwJ5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783706656; x=1815242656;
  h=date:from:to:cc:subject:message-id;
  bh=8m/lgNYINFa9veiMBmbuETRMgiq0F8RNX8U93fdypCo=;
  b=VezwwJ5o1aZjIeWxMdbWS1OsY0b8bxuBkU96DKy9yIAAT3IS8dbj0QCP
   kwRVHP9+AoSYD6mmGDnhC4OidATE9E2n3iuJTCPB8zQkVgy4EImcc6FUC
   AG2Lor5HE+bfLEYxc6jk0ngq+CxCFLJC/DyAmgQ6tNmKGFo2NHJURDPHq
   O82wX76+t3YqoRx6EVwz+1FPPATUYH4b0+ftWTzoaaRKbnyvoStt9Y0dt
   hTabtemxO5f8nRonRhwagUB5xgumt3uxwlxsTa18Z7PY65h5MisJ8PDCF
   157j3sparRzq4E8o0GGzZR4wLvvGzrvnfPfmIhFk7MIeus6+PwibSqTGc
   g==;
X-CSE-ConnectionGUID: k9/lkUdYQs+6+YNiPHr5OA==
X-CSE-MsgGUID: tdSDdu+fSDC3BnAI5Ld2Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107206304"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107206304"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 11:04:15 -0700
X-CSE-ConnectionGUID: UcC8ZieeS3uMQEXTgL8Gvw==
X-CSE-MsgGUID: 3mUvsQy7RtyItq1CKZzqcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255601635"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 10 Jul 2026 11:04:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiFa6-00000000JCn-2xbH;
	Fri, 10 Jul 2026 18:04:10 +0000
Date: Sat, 11 Jul 2026 02:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 55/56]
 drivers/media/platform/apple/avd/avd-hw.c:96:72: warning: right shift count
 >= width of type
Message-ID: <202607110132.JRWh1CDJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   edd1529cbf30f69240acea99fa8225683c555200
commit: 9d77b27426e338bbf4f4df0676c1e064e046527e [55/56] media: apple: add avd driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260711/202607110132.JRWh1CDJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110132.JRWh1CDJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110132.JRWh1CDJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/io.h:12,
                    from include/linux/iopoll.h:14,
                    from drivers/media/platform/apple/avd/avd-hw.c:4:
   drivers/media/platform/apple/avd/avd-hw.c: In function 't8112_configure_stream':
>> drivers/media/platform/apple/avd/avd-hw.c:96:72: warning: right shift count >= width of type [-Wshift-count-overflow]
      96 |                 w32(AVD_V4_VP_INSN_FIFO_IOVA_HI + (fifo_idx * 4), addr >> 32);
         |                                                                        ^~
   arch/sh/include/asm/io.h:30:83: note: in definition of macro '__raw_writel'
      30 | #define __raw_writel(v,a)       (__chk_io_ptr(a), *(volatile u32 __force *)(a) = (v))
         |                                                                                   ^
   arch/sh/include/asm/io.h:45:66: note: in expansion of macro 'ioswabl'
      45 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)ioswabl(v),c))
         |                                                                  ^~~~~~~
   drivers/media/platform/apple/avd/avd-hw.c:74:24: note: in expansion of macro 'writel_relaxed'
      74 | #define w32(reg, val) (writel_relaxed(val, avd->ctrl + (reg)))
         |                        ^~~~~~~~~~~~~~
   drivers/media/platform/apple/avd/avd-hw.c:96:17: note: in expansion of macro 'w32'
      96 |                 w32(AVD_V4_VP_INSN_FIFO_IOVA_HI + (fifo_idx * 4), addr >> 32);
         |                 ^~~
   drivers/media/platform/apple/avd/avd-hw.c: In function 't8122_configure_stream':
   drivers/media/platform/apple/avd/avd-hw.c:110:64: warning: right shift count >= width of type [-Wshift-count-overflow]
     110 |         w32(AVD_V5_VP_INSN_FIFO_IOVA_HI + (fifo_idx * 4), addr >> 32);
         |                                                                ^~
   arch/sh/include/asm/io.h:30:83: note: in definition of macro '__raw_writel'
      30 | #define __raw_writel(v,a)       (__chk_io_ptr(a), *(volatile u32 __force *)(a) = (v))
         |                                                                                   ^
   arch/sh/include/asm/io.h:45:66: note: in expansion of macro 'ioswabl'
      45 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)ioswabl(v),c))
         |                                                                  ^~~~~~~
   drivers/media/platform/apple/avd/avd-hw.c:74:24: note: in expansion of macro 'writel_relaxed'
      74 | #define w32(reg, val) (writel_relaxed(val, avd->ctrl + (reg)))
         |                        ^~~~~~~~~~~~~~
   drivers/media/platform/apple/avd/avd-hw.c:110:9: note: in expansion of macro 'w32'
     110 |         w32(AVD_V5_VP_INSN_FIFO_IOVA_HI + (fifo_idx * 4), addr >> 32);
         |         ^~~
--
   In file included from drivers/media/platform/apple/avd/avd-h264.c:24:
   drivers/media/platform/apple/avd/avd-inst.h: In function 'push_address':
>> drivers/media/platform/apple/avd/avd-inst.h:41:43: warning: right shift count >= width of type [-Wshift-count-overflow]
      41 |                 push(avd, ctx, (u32)(addr >> 32));
         |                                           ^~
   drivers/media/platform/apple/avd/avd-h264.c: In function 'stream_slice':
>> drivers/media/platform/apple/avd/avd-h264.c:383:41: warning: right shift count >= width of type [-Wshift-count-overflow]
     383 |                         | (u32)(slc_a84 >> 32), "slc_a7c_cmd_set_coded_slice");
         |                                         ^~
   drivers/media/platform/apple/avd/avd-inst.h:64:41: note: in definition of macro 'push'
      64 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~


vim +96 drivers/media/platform/apple/avd/avd-hw.c

     2	
     3	#include "linux/dev_printk.h"
   > 4	#include <linux/iopoll.h>
     5	
     6	#include "avd.h"
     7	#include "avd-regs.h"
     8	
     9	/* The plan is to move this to the cm3 */
    10	
    11	#define AVD_V3_VP_INSN_FIFO_IOVA	0x4068
    12	#define AVD_V3_VP_INSN_FIFO_MASK	0x4084
    13	#define AVD_V3_VP_INSN_FIFO_CACH	0x40a0
    14	#define AVD_V3_VP_INSN_FIFO_XFER	0x40bc
    15	#define AVD_V3_VP_CTRL_UNK	  0x4040
    16	#define AVD_V3_CTRL_CM3_IRQ_MASK	0x405c
    17	
    18	#define AVD_V4_VP_INSN_FIFO_IOVA_HI	0x30c
    19	#define AVD_V4_VP_INSN_FIFO_IOVA_LO	0x150
    20	#define AVD_V4_VP_INSN_FIFO_MASK	0x18c
    21	#define AVD_V4_VP_INSN_FIFO_CACH	0x1c8
    22	#define AVD_V4_VP_INSN_FIFO_XFER	0x204
    23	#define AVD_V4_VP_CTRL_CM3_IRQ_MASK	0x0fc
    24	#define AVD_V4_PP_CTRL_CM3_IRQ_MASK	0x120
    25	
    26	/* seems stabile after this */
    27	#define AVD_V5_VP_INSN_FIFO_IOVA_HI	0x20c
    28	#define AVD_V5_VP_INSN_FIFO_IOVA_LO	0x1d0
    29	#define AVD_V5_VP_INSN_FIFO_MASK	0x248
    30	#define AVD_V5_VP_INSN_FIFO_CACH	0x284
    31	#define AVD_V5_VP_INSN_FIFO_XFER	0x2c0
    32	#define AVD_V5_VP_CTRL_CM3_IRQ_MASK	0x15c
    33	#define AVD_V5_PP_CTRL_CM3_IRQ_MASK	0x190
    34	
    35	#define AVD_CM3_UNK	  BIT(0)
    36	#define AVD_CM3_ERROR	BIT(1)
    37	#define AVD_CM3_DONE	BIT(2)
    38	#define AVD_CM3_FULL	BIT(3)
    39	
    40	#define AVD_VP_CM3_MASK (AVD_CM3_UNK | AVD_CM3_ERROR | AVD_CM3_DONE)
    41	#define AVD_PP_CM3_MASK (AVD_CM3_UNK | AVD_CM3_DONE)
    42	
    43	int avd_boot(struct avd_dev *avd)
    44	{
    45		u32 val;
    46		int ret;
    47	
    48		if (avd->variant->revision != 3)
    49			dev_info_once(avd->dev, "booting hw version: %04x",
    50					readl_relaxed(avd->ctrl));
    51	
    52		memcpy_toio(avd->code, avd->fw->data, avd->fw->size);
    53	
    54		writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX1_STATUS);
    55		writel_relaxed(AVD_MBOX1_NOT_EMPTY, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
    56		writel_relaxed(AVD_RUN_CTRL_UNK_RUN, avd->mbox + AVD_REG_RUN_CTRL);
    57	
    58		/* wait for cm3 to boot */
    59		ret = readl_poll_timeout(avd->mbox + AVD_REG_FLAG0_SET,
    60				val, val == 1, 10, 10000);
    61		if (ret)
    62			return ret;
    63	
    64		return 0;
    65	}
    66	
    67	void avd_shutdown(struct avd_dev *avd)
    68	{
    69		writel_relaxed(AVD_RUN_CTRL_UNK_STOP, avd->mbox + AVD_REG_RUN_CTRL);
    70		writel_relaxed(1, avd->mbox + AVD_REG_FLAG0_CLR);
    71		writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
    72	}
    73	
    74	#define w32(reg, val) (writel_relaxed(val, avd->ctrl + (reg)))
    75	#define m32(reg, val) (w32(reg, (val) | readl_relaxed(avd->ctrl + (reg))))
    76	
    77	void t8103_configure_stream(struct avd_dev *avd, dma_addr_t addr, u8 fifo_idx,
    78				  u32 vp_slot)
    79	{
    80		w32(AVD_V3_VP_INSN_FIFO_IOVA + (fifo_idx * 4), addr >> 8);
    81		w32(AVD_V3_VP_INSN_FIFO_MASK + (fifo_idx * 4), 0x100000);
    82		w32(AVD_V3_VP_INSN_FIFO_CACH + (fifo_idx * 4), 0);
    83		w32(AVD_V3_VP_INSN_FIFO_XFER + (fifo_idx * 4), 0);
    84	
    85		w32(AVD_V3_VP_CTRL_UNK + (vp_slot * 4), 0);
    86		m32(AVD_V3_CTRL_CM3_IRQ_MASK,
    87		    AVD_VP_CM3_MASK << (vp_slot * 5) | (AVD_PP_CM3_MASK << 20));
    88	}
    89	
    90	void t8112_configure_stream(struct avd_dev *avd, dma_addr_t addr, u8 fifo_idx,
    91				  u32 vp_slot)
    92	{
    93		if (avd->variant->quirks & AVD_QUIRK_LSR) {
    94			w32(AVD_V4_VP_INSN_FIFO_IOVA_LO + (fifo_idx * 4), addr >> 8);
    95		} else {
  > 96			w32(AVD_V4_VP_INSN_FIFO_IOVA_HI + (fifo_idx * 4), addr >> 32);
    97			w32(AVD_V4_VP_INSN_FIFO_IOVA_LO + (fifo_idx * 4), addr & 0xffffffff);
    98		}
    99		w32(AVD_V4_VP_INSN_FIFO_MASK + (fifo_idx * 4), 0);
   100		w32(AVD_V4_VP_INSN_FIFO_CACH + (fifo_idx * 4), 0);
   101		w32(AVD_V4_VP_INSN_FIFO_XFER + (fifo_idx * 4), 0);
   102	
   103		m32(AVD_V4_VP_CTRL_CM3_IRQ_MASK + (vp_slot * 4), AVD_VP_CM3_MASK);
   104		m32(AVD_V4_PP_CTRL_CM3_IRQ_MASK, AVD_PP_CM3_MASK);
   105	}
   106	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
