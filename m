Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95B68F4F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690287486; x=1721823486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z7HsKqmM3E/Nt6pqoCqWj8ykfvJ8J/ccZiVx3Xv3BCY=;
  b=fpQ+cv85AdVgs+jO79BWKF4huQKBkh9rJAJo+nZ5Y0u/MZiyEmpQGILy
   f/C7R9PQqfH1vxyN+D4vP1+EgjSuc/bcwQS7gSwnisKfheDaIfZnhKYpV
   17r6zekUvLtJAtJ8freJKlVvNsb+AES9dN8d9stOx6W7wpqtAm4mQHSiW
   4sz0gjOrc6rcDLYe/2bVtFTCgqo/uNCXfCTGdjAsV+DZSrCZosrEsMV3i
   49xySlKC2y3M9BBkiVrqkOAMOQtaoDUS0wQyhdKNKca5uly1OKiDtqUm+
   NFsyeU0FgbQp7c7GmUFIrUCVXwLi7ullnEqTXONe6r0rsGi9w0JCBidz0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367729508"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="367729508"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 05:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972653139"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="972653139"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 05:18:02 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOGzJ-000AbM-1i;
	Tue, 25 Jul 2023 12:18:01 +0000
Date: Tue, 25 Jul 2023 20:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/spi/spi-fsl-cpm.c:134:32: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202307252052.7RqHxFZj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0b5547c51827e053cc754db47d3ec3e6c2c451d2
commit: fc96ec826bced75cc6b9c07a4ac44bbf651337ab spi: fsl-cpm: Use 16 bit mode for large transfers with even size
date:   4 months ago
config: powerpc-randconfig-r081-20230725 (https://download.01.org/0day-ci/archive/20230725/202307252052.7RqHxFZj-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307252052.7RqHxFZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307252052.7RqHxFZj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/spi/spi-fsl-cpm.c:59:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:59:39: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:59:39: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:60:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:60:39: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:60:39: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:61:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:61:47: sparse:     expected unsigned short const volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:61:47: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:62:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:62:39: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:62:39: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:63:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:63:39: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:63:39: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:64:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:64:47: sparse:     expected unsigned short const volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:64:47: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:78:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsl_spi_reg *reg_base @@     got void [noderef] __iomem *reg_base @@
   drivers/spi/spi-fsl-cpm.c:78:44: sparse:     expected struct fsl_spi_reg *reg_base
   drivers/spi/spi-fsl-cpm.c:78:44: sparse:     got void [noderef] __iomem *reg_base
   drivers/spi/spi-fsl-cpm.c:98:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected restricted __be32 [noderef] [usertype] __iomem *reg @@     got restricted __be32 * @@
   drivers/spi/spi-fsl-cpm.c:98:32: sparse:     expected restricted __be32 [noderef] [usertype] __iomem *reg
   drivers/spi/spi-fsl-cpm.c:98:32: sparse:     got restricted __be32 *
   drivers/spi/spi-fsl-cpm.c:105:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsl_spi_reg *reg_base @@     got void [noderef] __iomem *reg_base @@
   drivers/spi/spi-fsl-cpm.c:105:44: sparse:     expected struct fsl_spi_reg *reg_base
   drivers/spi/spi-fsl-cpm.c:105:44: sparse:     got void [noderef] __iomem *reg_base
>> drivers/spi/spi-fsl-cpm.c:134:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 @@
   drivers/spi/spi-fsl-cpm.c:134:32: sparse:     expected unsigned short [usertype]
   drivers/spi/spi-fsl-cpm.c:134:32: sparse:     got restricted __le16
   drivers/spi/spi-fsl-cpm.c:165:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected restricted __be32 [noderef] [usertype] __iomem *reg @@     got restricted __be32 * @@
   drivers/spi/spi-fsl-cpm.c:165:32: sparse:     expected restricted __be32 [noderef] [usertype] __iomem *reg
   drivers/spi/spi-fsl-cpm.c:165:32: sparse:     got restricted __be32 *
   drivers/spi/spi-fsl-cpm.c:205:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsl_spi_reg *reg_base @@     got void [noderef] __iomem *reg_base @@
   drivers/spi/spi-fsl-cpm.c:205:44: sparse:     expected struct fsl_spi_reg *reg_base
   drivers/spi/spi-fsl-cpm.c:205:44: sparse:     got void [noderef] __iomem *reg_base
   drivers/spi/spi-fsl-cpm.c:217:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected restricted __be32 [noderef] [usertype] __iomem *reg @@     got restricted __be32 * @@
   drivers/spi/spi-fsl-cpm.c:217:32: sparse:     expected restricted __be32 [noderef] [usertype] __iomem *reg
   drivers/spi/spi-fsl-cpm.c:217:32: sparse:     got restricted __be32 *
   drivers/spi/spi-fsl-cpm.c:333:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pram @@     got void [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:333:22: sparse:     expected void *pram
   drivers/spi/spi-fsl-cpm.c:333:22: sparse:     got void [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:338:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct spi_pram [noderef] __iomem *pram @@     got void *pram @@
   drivers/spi/spi-fsl-cpm.c:338:36: sparse:     expected struct spi_pram [noderef] __iomem *pram
   drivers/spi/spi-fsl-cpm.c:338:36: sparse:     got void *pram
   drivers/spi/spi-fsl-cpm.c:377:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:377:23: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:377:23: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:378:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:378:23: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:378:23: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:381:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:381:23: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:381:23: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:382:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:382:23: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:382:23: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:383:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:383:23: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:383:23: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:384:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:384:23: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:384:23: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:385:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:385:23: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:385:23: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:386:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:386:23: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:386:23: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:387:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:387:23: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:387:23: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:388:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:388:23: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:388:23: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:389:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:389:23: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:389:23: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:390:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:390:23: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:390:23: sparse:     got restricted __be16 [noderef] __iomem *
   drivers/spi/spi-fsl-cpm.c:391:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/spi/spi-fsl-cpm.c:391:23: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/spi/spi-fsl-cpm.c:391:23: sparse:     got restricted __be32 [noderef] __iomem *

vim +134 drivers/spi/spi-fsl-cpm.c

   100	
   101	int fsl_spi_cpm_bufs(struct mpc8xxx_spi *mspi,
   102			     struct spi_transfer *t, bool is_dma_mapped)
   103	{
   104		struct device *dev = mspi->dev;
   105		struct fsl_spi_reg *reg_base = mspi->reg_base;
   106	
   107		if (is_dma_mapped) {
   108			mspi->map_tx_dma = 0;
   109			mspi->map_rx_dma = 0;
   110		} else {
   111			mspi->map_tx_dma = 1;
   112			mspi->map_rx_dma = 1;
   113		}
   114	
   115		if (!t->tx_buf) {
   116			mspi->tx_dma = mspi->dma_dummy_tx;
   117			mspi->map_tx_dma = 0;
   118		}
   119	
   120		if (!t->rx_buf) {
   121			mspi->rx_dma = mspi->dma_dummy_rx;
   122			mspi->map_rx_dma = 0;
   123		}
   124		if (t->bits_per_word == 16 && t->tx_buf) {
   125			const u16 *src = t->tx_buf;
   126			u16 *dst;
   127			int i;
   128	
   129			dst = kmalloc(t->len, GFP_KERNEL);
   130			if (!dst)
   131				return -ENOMEM;
   132	
   133			for (i = 0; i < t->len >> 1; i++)
 > 134				dst[i] = cpu_to_le16p(src + i);
   135	
   136			mspi->tx = dst;
   137			mspi->map_tx_dma = 1;
   138		}
   139	
   140		if (mspi->map_tx_dma) {
   141			void *nonconst_tx = (void *)mspi->tx; /* shut up gcc */
   142	
   143			mspi->tx_dma = dma_map_single(dev, nonconst_tx, t->len,
   144						      DMA_TO_DEVICE);
   145			if (dma_mapping_error(dev, mspi->tx_dma)) {
   146				dev_err(dev, "unable to map tx dma\n");
   147				return -ENOMEM;
   148			}
   149		} else if (t->tx_buf) {
   150			mspi->tx_dma = t->tx_dma;
   151		}
   152	
   153		if (mspi->map_rx_dma) {
   154			mspi->rx_dma = dma_map_single(dev, mspi->rx, t->len,
   155						      DMA_FROM_DEVICE);
   156			if (dma_mapping_error(dev, mspi->rx_dma)) {
   157				dev_err(dev, "unable to map rx dma\n");
   158				goto err_rx_dma;
   159			}
   160		} else if (t->rx_buf) {
   161			mspi->rx_dma = t->rx_dma;
   162		}
   163	
   164		/* enable rx ints */
   165		mpc8xxx_spi_write_reg(&reg_base->mask, SPIE_RXB);
   166	
   167		mspi->xfer_in_progress = t;
   168		mspi->count = t->len;
   169	
   170		/* start CPM transfers */
   171		fsl_spi_cpm_bufs_start(mspi);
   172	
   173		return 0;
   174	
   175	err_rx_dma:
   176		if (mspi->map_tx_dma)
   177			dma_unmap_single(dev, mspi->tx_dma, t->len, DMA_TO_DEVICE);
   178		return -ENOMEM;
   179	}
   180	EXPORT_SYMBOL_GPL(fsl_spi_cpm_bufs);
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
