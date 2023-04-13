Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72976BA4E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 23:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681427717; x=1712963717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3iqsZvsejSSB8zhBL0oNvpbaIR8lYSNINceiZItWHWY=;
  b=QBunTlfUT/GJlGMy3CYD/b7yzop1UQs4RO8jYzQVZg77QHF0rLxLxJ77
   wv5SnQDHbszvf8Jwgga9i69SNFcuw0f8EO8wME8+WDDfZsIBU5HFTmRHx
   EVJXeiRHWdblZl9fdN8DW7JaoOMB9gFmMcwwSDc+Tbi+Lycj3ck3d9hqQ
   IdD7zAIcRRuNT/IpHaXIQib8NdOkPICJKtt9rK/MusNPoDP0ZvWwqbkY2
   tFK5Gt19HhaVkCIakGXjYw1WpaGbGgpXYWhB/3ObZnA2QZrd+rKoJwj6A
   J2o+XgXubSDSx6xjdtZGK2k68dBfnEMkscdcsQi1lZQ/u6n/RX6se98Nw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="430619968"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="430619968"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 16:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="683126916"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="683126916"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Apr 2023 16:15:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn69h-000Z1N-2P;
	Thu, 13 Apr 2023 23:15:05 +0000
Date: Fri, 14 Apr 2023 07:14:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 8560/11447] drivers/spi/spi-fsl-cpm.c:134:32:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202304140707.CoH337Ux-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
commit: fc96ec826bced75cc6b9c07a4ac44bbf651337ab [8560/11447] spi: fsl-cpm: Use 16 bit mode for large transfers with even size
config: powerpc-randconfig-s053-20230413 (https://download.01.org/0day-ci/archive/20230414/202304140707.CoH337Ux-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fc96ec826bced75cc6b9c07a4ac44bbf651337ab
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout fc96ec826bced75cc6b9c07a4ac44bbf651337ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140707.CoH337Ux-lkp@intel.com/

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
https://github.com/intel/lkp-tests
