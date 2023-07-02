Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366463212
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 23:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688340175; x=1719876175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NEq4ToSEgrKeeTzGaMz4URFIiIuc//I+OmLHwnqqqug=;
  b=Y75vULGe2huP/ZgOhpYq26lNiGtTJuyGOEx9Iu/rE+40+UY0i+dlgVEv
   n53Y19Op6HuMC2f5TzZij+310TyrIvEPThxeJtlrs6x7GRrgdahwKVvHx
   J/YkXaLAflS6paZaxPSGG74A2p556OzONNGai13I/4ljyE72oeA/vTGz8
   vPw/OKg3Op7JACcGq04y7eGx6wrmBVF+Isd7S3OSlZ7qbeCcMVVx7qM+0
   awhDOKKmevMFqKujylqEpAKFBQyvVFPylVKTgd0+tM1A7+9EOczUREneR
   j0JoG2p9nGHiz2elek8KJ00PsE5JWwHZy+/fTJ+m27RR2ax6RqifDvFxr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="428793529"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="428793529"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 16:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="808374811"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="808374811"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2023 16:22:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qG6P4-000Gw6-0M;
	Sun, 02 Jul 2023 23:22:50 +0000
Date: Mon, 3 Jul 2023 07:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_virt_to_page 6/6]
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:1853:67: error: 'page_offset'
 undeclared; did you mean 'pgd_offset'?
Message-ID: <202307030732.khCLSeix-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_virt_to_page
head:   4d390b969a98bdee1a1521f8facec4560a7acea8
commit: 4d390b969a98bdee1a1521f8facec4560a7acea8 [6/6] net: introduce skb_fill_data_desc() variant
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230703/202307030732.khCLSeix-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307030732.khCLSeix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307030732.khCLSeix-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/freescale/dpaa/dpaa_eth.c: In function 'sg_fd_to_skb':
>> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:1853:67: error: 'page_offset' undeclared (first use in this function); did you mean 'pgd_offset'?
    1853 |                         frag_off = qm_sg_entry_get_off(&sgt[i]) + page_offset;
         |                                                                   ^~~~~~~~~~~
         |                                                                   pgd_offset
   drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:1853:67: note: each undeclared identifier is reported only once for each function it appears in


vim +1853 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c

9ad1a37493338c Madalin Bucur 2016-11-15  1794  
9ad1a37493338c Madalin Bucur 2016-11-15  1795  /* Build an skb with the data of the first S/G entry in the linear portion and
9ad1a37493338c Madalin Bucur 2016-11-15  1796   * the rest of the frame as skb fragments.
9ad1a37493338c Madalin Bucur 2016-11-15  1797   *
9ad1a37493338c Madalin Bucur 2016-11-15  1798   * The page fragment holding the S/G Table is recycled here.
9ad1a37493338c Madalin Bucur 2016-11-15  1799   */
9ad1a37493338c Madalin Bucur 2016-11-15  1800  static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
9ad1a37493338c Madalin Bucur 2016-11-15  1801  				    const struct qm_fd *fd)
9ad1a37493338c Madalin Bucur 2016-11-15  1802  {
9ad1a37493338c Madalin Bucur 2016-11-15  1803  	ssize_t fd_off = qm_fd_get_offset(fd);
9ad1a37493338c Madalin Bucur 2016-11-15  1804  	dma_addr_t addr = qm_fd_addr(fd);
9ad1a37493338c Madalin Bucur 2016-11-15  1805  	const struct qm_sg_entry *sgt;
9ad1a37493338c Madalin Bucur 2016-11-15  1806  	struct dpaa_bp *dpaa_bp;
9ad1a37493338c Madalin Bucur 2016-11-15  1807  	void *vaddr, *sg_vaddr;
9ad1a37493338c Madalin Bucur 2016-11-15  1808  	int frag_off, frag_len;
9ad1a37493338c Madalin Bucur 2016-11-15  1809  	struct sk_buff *skb;
9ad1a37493338c Madalin Bucur 2016-11-15  1810  	dma_addr_t sg_addr;
9ad1a37493338c Madalin Bucur 2016-11-15  1811  	unsigned int sz;
9ad1a37493338c Madalin Bucur 2016-11-15  1812  	int *count_ptr;
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1813  	int i, j;
9ad1a37493338c Madalin Bucur 2016-11-15  1814  
9ad1a37493338c Madalin Bucur 2016-11-15  1815  	vaddr = phys_to_virt(addr);
9ad1a37493338c Madalin Bucur 2016-11-15  1816  	WARN_ON(!IS_ALIGNED((unsigned long)vaddr, SMP_CACHE_BYTES));
9ad1a37493338c Madalin Bucur 2016-11-15  1817  
9ad1a37493338c Madalin Bucur 2016-11-15  1818  	/* Iterate through the SGT entries and add data buffers to the skb */
9ad1a37493338c Madalin Bucur 2016-11-15  1819  	sgt = vaddr + fd_off;
f21506cb42112b Arnd Bergmann 2017-11-03  1820  	skb = NULL;
9ad1a37493338c Madalin Bucur 2016-11-15  1821  	for (i = 0; i < DPAA_SGT_MAX_ENTRIES; i++) {
9ad1a37493338c Madalin Bucur 2016-11-15  1822  		/* Extension bit is not supported */
9ad1a37493338c Madalin Bucur 2016-11-15  1823  		WARN_ON(qm_sg_entry_is_ext(&sgt[i]));
9ad1a37493338c Madalin Bucur 2016-11-15  1824  
9ad1a37493338c Madalin Bucur 2016-11-15  1825  		sg_addr = qm_sg_addr(&sgt[i]);
9ad1a37493338c Madalin Bucur 2016-11-15  1826  		sg_vaddr = phys_to_virt(sg_addr);
3c68b8fffb48c0 Madalin Bucur 2020-03-04  1827  		WARN_ON(!PTR_IS_ALIGNED(sg_vaddr, SMP_CACHE_BYTES));
9ad1a37493338c Madalin Bucur 2016-11-15  1828  
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1829  		dma_unmap_page(priv->rx_dma_dev, sg_addr,
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1830  			       DPAA_BP_RAW_SIZE, DMA_FROM_DEVICE);
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1831  
9ad1a37493338c Madalin Bucur 2016-11-15  1832  		/* We may use multiple Rx pools */
9ad1a37493338c Madalin Bucur 2016-11-15  1833  		dpaa_bp = dpaa_bpid2pool(sgt[i].bpid);
9ad1a37493338c Madalin Bucur 2016-11-15  1834  		if (!dpaa_bp)
9ad1a37493338c Madalin Bucur 2016-11-15  1835  			goto free_buffers;
9ad1a37493338c Madalin Bucur 2016-11-15  1836  
f21506cb42112b Arnd Bergmann 2017-11-03  1837  		if (!skb) {
9ad1a37493338c Madalin Bucur 2016-11-15  1838  			sz = dpaa_bp->size +
9ad1a37493338c Madalin Bucur 2016-11-15  1839  				SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
9ad1a37493338c Madalin Bucur 2016-11-15  1840  			skb = build_skb(sg_vaddr, sz);
0fdc0d675b92ba Igor Stoppa   2018-09-07  1841  			if (WARN_ON(!skb))
9ad1a37493338c Madalin Bucur 2016-11-15  1842  				goto free_buffers;
9ad1a37493338c Madalin Bucur 2016-11-15  1843  
5accb28241e027 Madalin Bucur 2017-01-26  1844  			skb->ip_summed = rx_csum_offload(priv, fd);
9ad1a37493338c Madalin Bucur 2016-11-15  1845  
9ad1a37493338c Madalin Bucur 2016-11-15  1846  			/* Make sure forwarded skbs will have enough space
9ad1a37493338c Madalin Bucur 2016-11-15  1847  			 * on Tx, if extra headers are added.
9ad1a37493338c Madalin Bucur 2016-11-15  1848  			 */
9ad1a37493338c Madalin Bucur 2016-11-15  1849  			WARN_ON(fd_off != priv->rx_headroom);
9ad1a37493338c Madalin Bucur 2016-11-15  1850  			skb_reserve(skb, fd_off);
9ad1a37493338c Madalin Bucur 2016-11-15  1851  			skb_put(skb, qm_sg_entry_get_len(&sgt[i]));
9ad1a37493338c Madalin Bucur 2016-11-15  1852  		} else {
9ad1a37493338c Madalin Bucur 2016-11-15 @1853  			frag_off = qm_sg_entry_get_off(&sgt[i]) + page_offset;
9ad1a37493338c Madalin Bucur 2016-11-15  1854  			frag_len = qm_sg_entry_get_len(&sgt[i]);
4d390b969a98bd Yunsheng Lin  2023-07-02  1855  			skb_add_rx_frag_data(skb, i - 1, sg_vaddr + frag_off,
9ad1a37493338c Madalin Bucur 2016-11-15  1856  					     frag_len, dpaa_bp->size);
9ad1a37493338c Madalin Bucur 2016-11-15  1857  		}
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1858  
9ad1a37493338c Madalin Bucur 2016-11-15  1859  		/* Update the pool count for the current {cpu x bpool} */
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1860  		count_ptr = this_cpu_ptr(dpaa_bp->percpu_count);
9ad1a37493338c Madalin Bucur 2016-11-15  1861  		(*count_ptr)--;
9ad1a37493338c Madalin Bucur 2016-11-15  1862  
9ad1a37493338c Madalin Bucur 2016-11-15  1863  		if (qm_sg_entry_is_final(&sgt[i]))
9ad1a37493338c Madalin Bucur 2016-11-15  1864  			break;
9ad1a37493338c Madalin Bucur 2016-11-15  1865  	}
9ad1a37493338c Madalin Bucur 2016-11-15  1866  	WARN_ONCE(i == DPAA_SGT_MAX_ENTRIES, "No final bit on SGT\n");
9ad1a37493338c Madalin Bucur 2016-11-15  1867  
9ad1a37493338c Madalin Bucur 2016-11-15  1868  	/* free the SG table buffer */
8151ee88bad568 Madalin Bucur 2019-10-31  1869  	free_pages((unsigned long)vaddr, 0);
9ad1a37493338c Madalin Bucur 2016-11-15  1870  
9ad1a37493338c Madalin Bucur 2016-11-15  1871  	return skb;
9ad1a37493338c Madalin Bucur 2016-11-15  1872  
9ad1a37493338c Madalin Bucur 2016-11-15  1873  free_buffers:
9ad1a37493338c Madalin Bucur 2016-11-15  1874  	/* free all the SG entries */
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1875  	for (j = 0; j < DPAA_SGT_MAX_ENTRIES ; j++) {
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1876  		sg_addr = qm_sg_addr(&sgt[j]);
9ad1a37493338c Madalin Bucur 2016-11-15  1877  		sg_vaddr = phys_to_virt(sg_addr);
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1878  		/* all pages 0..i were unmaped */
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1879  		if (j > i)
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1880  			dma_unmap_page(priv->rx_dma_dev, qm_sg_addr(&sgt[j]),
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1881  				       DPAA_BP_RAW_SIZE, DMA_FROM_DEVICE);
8151ee88bad568 Madalin Bucur 2019-10-31  1882  		free_pages((unsigned long)sg_vaddr, 0);
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1883  		/* counters 0..i-1 were decremented */
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1884  		if (j >= i) {
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1885  			dpaa_bp = dpaa_bpid2pool(sgt[j].bpid);
9ad1a37493338c Madalin Bucur 2016-11-15  1886  			if (dpaa_bp) {
9ad1a37493338c Madalin Bucur 2016-11-15  1887  				count_ptr = this_cpu_ptr(dpaa_bp->percpu_count);
9ad1a37493338c Madalin Bucur 2016-11-15  1888  				(*count_ptr)--;
9ad1a37493338c Madalin Bucur 2016-11-15  1889  			}
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1890  		}
9ad1a37493338c Madalin Bucur 2016-11-15  1891  
c27569fcd6e1b1 Madalin Bucur 2019-12-23  1892  		if (qm_sg_entry_is_final(&sgt[j]))
9ad1a37493338c Madalin Bucur 2016-11-15  1893  			break;
9ad1a37493338c Madalin Bucur 2016-11-15  1894  	}
9ad1a37493338c Madalin Bucur 2016-11-15  1895  	/* free the SGT fragment */
8151ee88bad568 Madalin Bucur 2019-10-31  1896  	free_pages((unsigned long)vaddr, 0);
9ad1a37493338c Madalin Bucur 2016-11-15  1897  
9ad1a37493338c Madalin Bucur 2016-11-15  1898  	return NULL;
9ad1a37493338c Madalin Bucur 2016-11-15  1899  }
9ad1a37493338c Madalin Bucur 2016-11-15  1900  

:::::: The code at line 1853 was first introduced by commit
:::::: 9ad1a37493338cacf04e2c93acf44d151a7adda8 dpaa_eth: add support for DPAA Ethernet

:::::: TO: Madalin Bucur <madalin.bucur@nxp.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
