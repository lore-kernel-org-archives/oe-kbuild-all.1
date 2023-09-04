Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218D87FE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 05:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693806691; x=1725342691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33y3RQRj6M6X39khhbLCZjeFfA6lx2g8I1cDfC0zMkk=;
  b=mY/DprS6QIz6MOFuFsdOnhUr5/dr+wfG3F+NVa/S9T3XdH6djwh+/vuM
   ka+ch1ENXTr5IaLpVvZZbkGfcuX9UsFG3UoqyDoRHWb0Y5KuKTR+4U2QB
   T+Q7bZZuSQElblHPFApGQtEb9vYjdwS1An+nfFn1JQjCmRU2mQ+HIeeA7
   bqEnAAzw6VYGfKYqmNamTS9k9+VhUI0IawTIupMcAFCUGy2hRB3vFBMxX
   8tyJXFrWarV1mQizdmawE8MygCwhbhBgbgQ3q1cjywapkeH6fWJ2MINzz
   KVBKc8y//niVdjFNOfK5AEcsxqD1awDaxWEkSl4ac18bN2qz+g8BNwl2q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="361542749"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="361542749"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 22:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="855483803"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="855483803"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2023 22:51:28 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qd2Ug-0000D1-2W;
	Mon, 04 Sep 2023 05:51:26 +0000
Date: Mon, 4 Sep 2023 13:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 43/60]
 drivers/spi/spi-qcom-qspi.c:68:53: error: 'DMA_CHAIN_DONE' undeclared
Message-ID: <202309041312.IOxEJS14-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   887b5a8cc798ec5eedc8c46cb37d9822e630b47c
commit: 32779ce9190a3732474dad753356aedbf5ff862f [43/60] spi: spi-qcom-qspi: Add DMA_CHAIN_DONE to ALL_IRQS
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230904/202309041312.IOxEJS14-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309041312.IOxEJS14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309041312.IOxEJS14-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/arm64/include/uapi/asm/byteorder.h:23,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arm64/include/asm/bitops.h:29,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/clk.h:13,
                    from drivers/spi/spi-qcom-qspi.c:4:
   drivers/spi/spi-qcom-qspi.c: In function 'qcom_qspi_pio_xfer':
>> drivers/spi/spi-qcom-qspi.c:68:53: error: 'DMA_CHAIN_DONE' undeclared (first use in this function)
      68 |                                  TRANSACTION_DONE | DMA_CHAIN_DONE)
         |                                                     ^~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__cpu_to_le32'
      33 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   arch/arm64/include/asm/io.h:142:47: note: in expansion of macro 'writel_relaxed'
     142 | #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
         |                                               ^~~~~~~~~~~~~~
   drivers/spi/spi-qcom-qspi.c:204:9: note: in expansion of macro 'writel'
     204 |         writel(QSPI_ALL_IRQS, ctrl->base + MSTR_INT_STATUS);
         |         ^~~~~~
   drivers/spi/spi-qcom-qspi.c:204:16: note: in expansion of macro 'QSPI_ALL_IRQS'
     204 |         writel(QSPI_ALL_IRQS, ctrl->base + MSTR_INT_STATUS);
         |                ^~~~~~~~~~~~~
   drivers/spi/spi-qcom-qspi.c:68:53: note: each undeclared identifier is reported only once for each function it appears in
      68 |                                  TRANSACTION_DONE | DMA_CHAIN_DONE)
         |                                                     ^~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__cpu_to_le32'
      33 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   arch/arm64/include/asm/io.h:142:47: note: in expansion of macro 'writel_relaxed'
     142 | #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
         |                                               ^~~~~~~~~~~~~~
   drivers/spi/spi-qcom-qspi.c:204:9: note: in expansion of macro 'writel'
     204 |         writel(QSPI_ALL_IRQS, ctrl->base + MSTR_INT_STATUS);
         |         ^~~~~~
   drivers/spi/spi-qcom-qspi.c:204:16: note: in expansion of macro 'QSPI_ALL_IRQS'
     204 |         writel(QSPI_ALL_IRQS, ctrl->base + MSTR_INT_STATUS);
         |                ^~~~~~~~~~~~~


vim +/DMA_CHAIN_DONE +68 drivers/spi/spi-qcom-qspi.c

     3	
   > 4	#include <linux/clk.h>
     5	#include <linux/interconnect.h>
     6	#include <linux/interrupt.h>
     7	#include <linux/io.h>
     8	#include <linux/module.h>
     9	#include <linux/of.h>
    10	#include <linux/of_platform.h>
    11	#include <linux/pm_runtime.h>
    12	#include <linux/pm_opp.h>
    13	#include <linux/spi/spi.h>
    14	#include <linux/spi/spi-mem.h>
    15	
    16	
    17	#define QSPI_NUM_CS		2
    18	#define QSPI_BYTES_PER_WORD	4
    19	
    20	#define MSTR_CONFIG		0x0000
    21	#define FULL_CYCLE_MODE		BIT(3)
    22	#define FB_CLK_EN		BIT(4)
    23	#define PIN_HOLDN		BIT(6)
    24	#define PIN_WPN			BIT(7)
    25	#define DMA_ENABLE		BIT(8)
    26	#define BIG_ENDIAN_MODE		BIT(9)
    27	#define SPI_MODE_MSK		0xc00
    28	#define SPI_MODE_SHFT		10
    29	#define CHIP_SELECT_NUM		BIT(12)
    30	#define SBL_EN			BIT(13)
    31	#define LPA_BASE_MSK		0x3c000
    32	#define LPA_BASE_SHFT		14
    33	#define TX_DATA_DELAY_MSK	0xc0000
    34	#define TX_DATA_DELAY_SHFT	18
    35	#define TX_CLK_DELAY_MSK	0x300000
    36	#define TX_CLK_DELAY_SHFT	20
    37	#define TX_CS_N_DELAY_MSK	0xc00000
    38	#define TX_CS_N_DELAY_SHFT	22
    39	#define TX_DATA_OE_DELAY_MSK	0x3000000
    40	#define TX_DATA_OE_DELAY_SHFT	24
    41	
    42	#define AHB_MASTER_CFG				0x0004
    43	#define HMEM_TYPE_START_MID_TRANS_MSK		0x7
    44	#define HMEM_TYPE_START_MID_TRANS_SHFT		0
    45	#define HMEM_TYPE_LAST_TRANS_MSK		0x38
    46	#define HMEM_TYPE_LAST_TRANS_SHFT		3
    47	#define USE_HMEMTYPE_LAST_ON_DESC_OR_CHAIN_MSK	0xc0
    48	#define USE_HMEMTYPE_LAST_ON_DESC_OR_CHAIN_SHFT	6
    49	#define HMEMTYPE_READ_TRANS_MSK			0x700
    50	#define HMEMTYPE_READ_TRANS_SHFT		8
    51	#define HSHARED					BIT(11)
    52	#define HINNERSHARED				BIT(12)
    53	
    54	#define MSTR_INT_EN		0x000C
    55	#define MSTR_INT_STATUS		0x0010
    56	#define RESP_FIFO_UNDERRUN	BIT(0)
    57	#define RESP_FIFO_NOT_EMPTY	BIT(1)
    58	#define RESP_FIFO_RDY		BIT(2)
    59	#define HRESP_FROM_NOC_ERR	BIT(3)
    60	#define WR_FIFO_EMPTY		BIT(9)
    61	#define WR_FIFO_FULL		BIT(10)
    62	#define WR_FIFO_OVERRUN		BIT(11)
    63	#define TRANSACTION_DONE	BIT(16)
    64	#define QSPI_ERR_IRQS		(RESP_FIFO_UNDERRUN | HRESP_FROM_NOC_ERR | \
    65					 WR_FIFO_OVERRUN)
    66	#define QSPI_ALL_IRQS		(QSPI_ERR_IRQS | RESP_FIFO_RDY | \
    67					 WR_FIFO_EMPTY | WR_FIFO_FULL | \
  > 68					 TRANSACTION_DONE | DMA_CHAIN_DONE)
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
