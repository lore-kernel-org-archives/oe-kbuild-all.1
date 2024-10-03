Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFE8433C1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 17:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727975026; cv=none; b=L/6imcTSXqcWhY+iJfMh5wWxAcH+2rBlXxs4Z949zjVaMB1ggSEfmKGsS2fG/Uw5P2PgsDgzRM67KPCYy1zx0vOIqry4eaigfi5jPYSv9sIg4afu/F0FTU8IOEK4inmW9anVFofLXmqg6poQs4P6RtWjgPanRwffd++00IjxmfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727975026; c=relaxed/simple;
	bh=uxQOr29/fYToe5Zmd3Oc4xt9i+r5Dc7RT8Afx9kumGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lHkfovdLC8VtH2VDY2fhvRKHzXyzYg2dRhScHj0iHgTqVt3cnYWBwN94LpI9ckOhWK+Lv0KbUyypHVdh3j6cBPzQ46uQfICU3yIo9HgA/0PaiMoV1IyDeAL6Ez2ays+PHgXR6JZWcvVsl/Na9OLboYjstyqTdY5z9f5J2P6aA/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhcpCiuO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhcpCiuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727975026; x=1759511026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uxQOr29/fYToe5Zmd3Oc4xt9i+r5Dc7RT8Afx9kumGs=;
  b=lhcpCiuOBmXQEmxb7i1G70DWZBVp++m/WBCB62f6YwWxo40bCNer/2M4
   WP8mjeE3V4iw6rz45Sbg9iTLZJuDF+wvvYaDi61UbbfW9mUDQStHCIN/2
   vCgOFsPjzOsWd1OvT9BLePiPLRCe3+T+gvFD1UFUre/m8Cd3KiFz75Y8P
   MBWi6CeVXA9fYnlCXcZtwESbbpi2csTrwkYRzsd3JszZN+n5a8ZGiEfOQ
   hMePJD6TG8VW9eD+8bN1gxIgezIOKOK+cFVZrEvi9mbbKZ/SUzOO6mzHu
   tUlmci1kVKTzzx/BGiPzuSbvRC4jgTcbbaG6qbSm1ydXWZHfVXJx7FmZC
   A==;
X-CSE-ConnectionGUID: shOAMaH5TqaRXmKe6WNuCQ==
X-CSE-MsgGUID: yFkuFf3wQnS7M+KkSWhQUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26993144"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="26993144"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 10:03:45 -0700
X-CSE-ConnectionGUID: MNeqQD8ZT7mqODQ9dKGtwA==
X-CSE-MsgGUID: tFvmLY+ASOuClwPSAhiw/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="111882546"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2024 10:03:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swPEr-0000hW-10;
	Thu, 03 Oct 2024 17:03:41 +0000
Date: Fri, 4 Oct 2024 01:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rc 1077/2707] drivers/spi/spi-fsl-cpm.c:137:17:
 warning: comparison between signed and unsigned integer expressions
Message-ID: <202410040044.rcbPKuWD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   aea4aaf86b7212944b7bf66d6becb8c7bb51093e
commit: 8cfd8c7919b40a5c5c5646f4eefaa8b46090b610 [1077/2707] spi: fsl-cpm: Use 16 bit mode for large transfers with even size
config: powerpc-randconfig-003-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040044.rcbPKuWD-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040044.rcbPKuWD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040044.rcbPKuWD-lkp@intel.com/

All warnings (new ones prefixed by >>):

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


vim +137 drivers/spi/spi-fsl-cpm.c

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
