Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01A537165
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 01:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725932680; cv=none; b=fQ/xttBUW+ojQ5PsX0+7KINt2J+UQNxgvADgOsovto8DinIxPDxrOFZzTYQ6Mbn1FLV+nDLVbF3HalZ9UhX4/aXVFlWzCEx5ERN0QWaFc+CtbFmy7R2TSy7TkuVeNYv0u92yC1eCwvnwO/eF0iTxViXYgEDnZrCAq5QNagOswdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725932680; c=relaxed/simple;
	bh=Zg8aFtpow3FIgR/GhSZ63yXN3JiMRVrz0PuNRvJtgTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JU21qOY0ZNvzWuvNZoW663lMejA2ebn/K4HR3v7Re71d77lhIlwXsMaqmtT17EpuCca4psJwNXl66ufHTMi8naVwIDkEt0ucSKbW2595bPzBoYffrmpJ8C9c8OGfxYRbxTqEIwYuwMWqiF3UDgjf8jcL8NDzjhvoXQ/BLzXCNZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwDHaZYH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwDHaZYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725932679; x=1757468679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zg8aFtpow3FIgR/GhSZ63yXN3JiMRVrz0PuNRvJtgTo=;
  b=hwDHaZYHSPVnebJTJ6mBG+9Q2Wp2Pqdz+DLEzJnyDG6SozzEJr5GhfGm
   rDc0esuOOSR1jdFTLed9CIjEJHLglqh9dZI5tBm83SjtH1SlkfEIPvF7X
   VuacRpir6LOKgKKcLOO7rXud5CQ4XEiTgKY57U5VQemCKsejJMeeMp63W
   WhJuPMV4KctTABlUIVu0L4Y4HDZg2zpuAOCXusCpONredyrAtg10jAEYq
   m/gC9CvpND90XR1KY0NxtPi6utcDATWgBqe0COhJI8T/OcTqVCPZ5XkvE
   CYTGDBH6zlORRmwrkS3/NNVBYEmBreOY11mTkgVVNOryvsokTLAOP6pRZ
   Q==;
X-CSE-ConnectionGUID: zt3Lq9PvQfu1iRntHxUrKQ==
X-CSE-MsgGUID: ClnvOKdNRGu1OlSSQ8DwcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28399889"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="28399889"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 18:44:38 -0700
X-CSE-ConnectionGUID: I9TDRQS1TN69VhQcQIIfYw==
X-CSE-MsgGUID: Sxe11dIlSby8p77ygUKMpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66884237"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2024 18:44:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snpvm-000FTA-29;
	Tue, 10 Sep 2024 01:44:34 +0000
Date: Tue, 10 Sep 2024 09:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st 1077/2602] drivers/spi/spi-fsl-cpm.c:137:17:
 warning: comparison between signed and unsigned integer expressions
Message-ID: <202409100909.u0q9WSyw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st
head:   c18783f114b390babddc2dde4162ae03709497b2
commit: 8cfd8c7919b40a5c5c5646f4eefaa8b46090b610 [1077/2602] spi: fsl-cpm: Use 16 bit mode for large transfers with even size
config: powerpc-randconfig-002-20240910 (https://download.01.org/0day-ci/archive/20240910/202409100909.u0q9WSyw-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100909.u0q9WSyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100909.u0q9WSyw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/scatterlist.h:7:0,
                    from include/linux/dma-mapping.h:10,
                    from drivers/spi/spi-fsl-cpm.c:20:
   include/linux/mm.h: In function 'is_vmalloc_addr':
   include/linux/mm.h:386:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return addr >= VMALLOC_START && addr < VMALLOC_END;
                 ^~
   drivers/spi/spi-fsl-cpm.c: In function 'fsl_spi_cpm_bufs':
>> drivers/spi/spi-fsl-cpm.c:137:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < t->len >> 1; i++)
                    ^
   drivers/spi/spi-fsl-cpm.c: In function 'fsl_spi_cpm_bufs_complete':
   drivers/spi/spi-fsl-cpm.c:200:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (i = 0; i < t->len; i += 2)
                    ^
--
   powerpc-linux-ld: drivers/built-in.o: in function `phy_print_status':
>> (.text+0x1ee380): undefined reference to `netdev_info'
   powerpc-linux-ld: (.text+0x1ee38c): undefined reference to `netdev_info'
   powerpc-linux-ld: drivers/built-in.o: in function `phy_state_machine':
>> (.text+0x1eef78): undefined reference to `netif_carrier_off'
   powerpc-linux-ld: (.text+0x1ef0dc): undefined reference to `netif_carrier_on'
   powerpc-linux-ld: (.text+0x1ef200): undefined reference to `netif_carrier_on'
   powerpc-linux-ld: (.text+0x1ef210): undefined reference to `netif_carrier_off'
   powerpc-linux-ld: (.text+0x1ef290): undefined reference to `netif_carrier_off'
   powerpc-linux-ld: (.text+0x1ef358): undefined reference to `netif_carrier_on'
   powerpc-linux-ld: (.text+0x1ef3dc): undefined reference to `netif_carrier_on'


vim +137 drivers/spi/spi-fsl-cpm.c

  > 20	#include <linux/dma-mapping.h>
    21	#include <linux/fsl_devices.h>
    22	#include <linux/kernel.h>
    23	#include <linux/module.h>
    24	#include <linux/of_address.h>
    25	#include <linux/spi/spi.h>
    26	#include <linux/types.h>
    27	#include <linux/platform_device.h>
    28	#include <linux/byteorder/generic.h>
    29	
    30	#include "spi-fsl-cpm.h"
    31	#include "spi-fsl-lib.h"
    32	#include "spi-fsl-spi.h"
    33	
    34	/* CPM1 and CPM2 are mutually exclusive. */
    35	#ifdef CONFIG_CPM1
    36	#include <asm/cpm1.h>
    37	#define CPM_SPI_CMD mk_cr_cmd(CPM_CR_CH_SPI, 0)
    38	#else
    39	#include <asm/cpm2.h>
    40	#define CPM_SPI_CMD mk_cr_cmd(CPM_CR_SPI_PAGE, CPM_CR_SPI_SBLOCK, 0, 0)
    41	#endif
    42	
    43	#define	SPIE_TXB	0x00000200	/* Last char is written to tx fifo */
    44	#define	SPIE_RXB	0x00000100	/* Last char is written to rx buf */
    45	
    46	/* SPCOM register values */
    47	#define	SPCOM_STR	(1 << 23)	/* Start transmit */
    48	
    49	#define	SPI_PRAM_SIZE	0x100
    50	#define	SPI_MRBLR	((unsigned int)PAGE_SIZE)
    51	
    52	static void *fsl_dummy_rx;
    53	static DEFINE_MUTEX(fsl_dummy_rx_lock);
    54	static int fsl_dummy_rx_refcnt;
    55	
    56	void fsl_spi_cpm_reinit_txrx(struct mpc8xxx_spi *mspi)
    57	{
    58		if (mspi->flags & SPI_QE) {
    59			qe_issue_cmd(QE_INIT_TX_RX, mspi->subblock,
    60				     QE_CR_PROTOCOL_UNSPECIFIED, 0);
    61		} else {
    62			if (mspi->flags & SPI_CPM1) {
    63				out_be32(&mspi->pram->rstate, 0);
    64				out_be16(&mspi->pram->rbptr,
    65					 in_be16(&mspi->pram->rbase));
    66				out_be32(&mspi->pram->tstate, 0);
    67				out_be16(&mspi->pram->tbptr,
    68					 in_be16(&mspi->pram->tbase));
    69			} else {
    70				cpm_command(CPM_SPI_CMD, CPM_CR_INIT_TRX);
    71			}
    72		}
    73	}
    74	EXPORT_SYMBOL_GPL(fsl_spi_cpm_reinit_txrx);
    75	
    76	static void fsl_spi_cpm_bufs_start(struct mpc8xxx_spi *mspi)
    77	{
    78		struct cpm_buf_desc __iomem *tx_bd = mspi->tx_bd;
    79		struct cpm_buf_desc __iomem *rx_bd = mspi->rx_bd;
    80		unsigned int xfer_len = min(mspi->count, SPI_MRBLR);
    81		unsigned int xfer_ofs;
    82		struct fsl_spi_reg *reg_base = mspi->reg_base;
    83	
    84		xfer_ofs = mspi->xfer_in_progress->len - mspi->count;
    85	
    86		if (mspi->rx_dma == mspi->dma_dummy_rx)
    87			out_be32(&rx_bd->cbd_bufaddr, mspi->rx_dma);
    88		else
    89			out_be32(&rx_bd->cbd_bufaddr, mspi->rx_dma + xfer_ofs);
    90		out_be16(&rx_bd->cbd_datlen, 0);
    91		out_be16(&rx_bd->cbd_sc, BD_SC_EMPTY | BD_SC_INTRPT | BD_SC_WRAP);
    92	
    93		if (mspi->tx_dma == mspi->dma_dummy_tx)
    94			out_be32(&tx_bd->cbd_bufaddr, mspi->tx_dma);
    95		else
    96			out_be32(&tx_bd->cbd_bufaddr, mspi->tx_dma + xfer_ofs);
    97		out_be16(&tx_bd->cbd_datlen, xfer_len);
    98		out_be16(&tx_bd->cbd_sc, BD_SC_READY | BD_SC_INTRPT | BD_SC_WRAP |
    99					 BD_SC_LAST);
   100	
   101		/* start transfer */
   102		mpc8xxx_spi_write_reg(&reg_base->command, SPCOM_STR);
   103	}
   104	
   105	int fsl_spi_cpm_bufs(struct mpc8xxx_spi *mspi,
   106			     struct spi_transfer *t, bool is_dma_mapped)
   107	{
   108		struct device *dev = mspi->dev;
   109		struct fsl_spi_reg *reg_base = mspi->reg_base;
   110	
   111		if (is_dma_mapped) {
   112			mspi->map_tx_dma = 0;
   113			mspi->map_rx_dma = 0;
   114		} else {
   115			mspi->map_tx_dma = 1;
   116			mspi->map_rx_dma = 1;
   117		}
   118	
   119		if (!t->tx_buf) {
   120			mspi->tx_dma = mspi->dma_dummy_tx;
   121			mspi->map_tx_dma = 0;
   122		}
   123	
   124		if (!t->rx_buf) {
   125			mspi->rx_dma = mspi->dma_dummy_rx;
   126			mspi->map_rx_dma = 0;
   127		}
   128		if (t->bits_per_word == 16 && t->tx_buf) {
   129			const u16 *src = t->tx_buf;
   130			u16 *dst;
   131			int i;
   132	
   133			dst = kmalloc(t->len, GFP_KERNEL);
   134			if (!dst)
   135				return -ENOMEM;
   136	
 > 137			for (i = 0; i < t->len >> 1; i++)
   138				dst[i] = cpu_to_le16p(src + i);
   139	
   140			mspi->tx = dst;
   141			mspi->map_tx_dma = 1;
   142		}
   143	
   144		if (mspi->map_tx_dma) {
   145			void *nonconst_tx = (void *)mspi->tx; /* shut up gcc */
   146	
   147			mspi->tx_dma = dma_map_single(dev, nonconst_tx, t->len,
   148						      DMA_TO_DEVICE);
   149			if (dma_mapping_error(dev, mspi->tx_dma)) {
   150				dev_err(dev, "unable to map tx dma\n");
   151				return -ENOMEM;
   152			}
   153		} else if (t->tx_buf) {
   154			mspi->tx_dma = t->tx_dma;
   155		}
   156	
   157		if (mspi->map_rx_dma) {
   158			mspi->rx_dma = dma_map_single(dev, mspi->rx, t->len,
   159						      DMA_FROM_DEVICE);
   160			if (dma_mapping_error(dev, mspi->rx_dma)) {
   161				dev_err(dev, "unable to map rx dma\n");
   162				goto err_rx_dma;
   163			}
   164		} else if (t->rx_buf) {
   165			mspi->rx_dma = t->rx_dma;
   166		}
   167	
   168		/* enable rx ints */
   169		mpc8xxx_spi_write_reg(&reg_base->mask, SPIE_RXB);
   170	
   171		mspi->xfer_in_progress = t;
   172		mspi->count = t->len;
   173	
   174		/* start CPM transfers */
   175		fsl_spi_cpm_bufs_start(mspi);
   176	
   177		return 0;
   178	
   179	err_rx_dma:
   180		if (mspi->map_tx_dma)
   181			dma_unmap_single(dev, mspi->tx_dma, t->len, DMA_TO_DEVICE);
   182		return -ENOMEM;
   183	}
   184	EXPORT_SYMBOL_GPL(fsl_spi_cpm_bufs);
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
