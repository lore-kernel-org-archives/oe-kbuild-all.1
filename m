Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EA14276
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfT5Jtxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702223197; x=1733759197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M4TP+9XOBg5Zxor4spS7P8hmBhFdBlvVfVlmKBLaNxo=;
  b=dfT5Jtxd3j2/pZBkwA+w/rWG3n19XZVqYGfmmfe4vfaQzk0ddzc+NfdV
   ivVBmDS2/xkohPF3/96PmrdSn6tMVZu0jOVX0psfZzRBtTfIZmntnuML0
   Qhyv3QEQr10OC+IHk2F39Vq9P4FNhneSWjP7GgIaZYPSDhuuo4rPfAYLE
   zZ55hkhwfihwXYqHDwRiaDaFfgZua4ALf3aAJPsTVSbdB/jQ0sN7dUvrP
   29u8sgA2Tb2MZPTafLerMDx3mG+zIk5v3sR6Gqzl7WZPMYHhx/WmChgjc
   NpSrlmAOChphUVfxm0wyGPFPJ1W1U36VIS9q52wo5XwpCdBlHb/Yk08GQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379559750"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="379559750"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 07:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1104159413"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1104159413"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Dec 2023 07:46:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCM0m-000GzG-2e;
	Sun, 10 Dec 2023 15:46:32 +0000
Date: Sun, 10 Dec 2023 23:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>
Subject: [isilence:zc/rx-pp-provider 5/31] net/core/dev.c:2065: undefined
 reference to `gen_pool_for_each_chunk'
Message-ID: <202312102313.zJHWVLAZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-pp-provider
head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
commit: 161f99ad49ca48fa141161b409eac11a6b63c105 [5/31] netdev: support binding dma-buf to netdevice
config: i386-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102313.zJHWVLAZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/core/dev.o: in function `__netdev_devmem_binding_free':
>> net/core/dev.c:2065: undefined reference to `gen_pool_for_each_chunk'
>> ld: net/core/dev.c:2068: undefined reference to `gen_pool_size'
>> ld: net/core/dev.c:2069: undefined reference to `gen_pool_avail'
>> ld: net/core/dev.c:2073: undefined reference to `gen_pool_destroy'
   ld: net/core/dev.o: in function `netdev_bind_dmabuf':
>> net/core/dev.c:2180: undefined reference to `gen_pool_create'
>> ld: net/core/dev.c:2201: undefined reference to `gen_pool_add_owner'
>> ld: net/core/dev.c:2232: undefined reference to `gen_pool_for_each_chunk'
   ld: net/core/dev.c:2234: undefined reference to `gen_pool_destroy'


vim +2065 net/core/dev.c

  2060	
  2061	void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
  2062	{
  2063		size_t size, avail;
  2064	
> 2065		gen_pool_for_each_chunk(binding->chunk_pool,
  2066					netdev_devmem_free_chunk_owner, NULL);
  2067	
> 2068		size = gen_pool_size(binding->chunk_pool);
> 2069		avail = gen_pool_avail(binding->chunk_pool);
  2070	
  2071		if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
  2072			  size, avail))
> 2073			gen_pool_destroy(binding->chunk_pool);
  2074	
  2075		dma_buf_unmap_attachment(binding->attachment, binding->sgt,
  2076					 DMA_BIDIRECTIONAL);
  2077		dma_buf_detach(binding->dmabuf, binding->attachment);
  2078		dma_buf_put(binding->dmabuf);
  2079		kfree(binding);
  2080	}
  2081	
  2082	void netdev_unbind_dmabuf(struct netdev_dmabuf_binding *binding)
  2083	{
  2084		struct netdev_rx_queue *rxq;
  2085		unsigned long xa_idx;
  2086	
  2087		if (!binding)
  2088			return;
  2089	
  2090		list_del_rcu(&binding->list);
  2091	
  2092		xa_for_each(&binding->bound_rxq_list, xa_idx, rxq)
  2093			if (rxq->binding == binding)
  2094				/* We hold the rtnl_lock while binding/unbinding
  2095				 * dma-buf, so we can't race with another thread that
  2096				 * is also modifying this value. However, the driver
  2097				 * may read this config while it's creating its
  2098				 * rx-queues. WRITE_ONCE() here to match the
  2099				 * READ_ONCE() in the driver.
  2100				 */
  2101				WRITE_ONCE(rxq->binding, NULL);
  2102	
  2103		netdev_devmem_binding_put(binding);
  2104	}
  2105	
  2106	int netdev_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
  2107					struct netdev_dmabuf_binding *binding)
  2108	{
  2109		struct netdev_rx_queue *rxq;
  2110		u32 xa_idx;
  2111		int err;
  2112	
  2113		rxq = __netif_get_rx_queue(dev, rxq_idx);
  2114	
  2115		if (rxq->binding)
  2116			return -EEXIST;
  2117	
  2118		err = xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit_32b,
  2119			       GFP_KERNEL);
  2120		if (err)
  2121			return err;
  2122	
  2123		/*We hold the rtnl_lock while binding/unbinding dma-buf, so we can't
  2124		 * race with another thread that is also modifying this value. However,
  2125		 * the driver may read this config while it's creating its * rx-queues.
  2126		 * WRITE_ONCE() here to match the READ_ONCE() in the driver.
  2127		 */
  2128		WRITE_ONCE(rxq->binding, binding);
  2129	
  2130		return 0;
  2131	}
  2132	
  2133	int netdev_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
  2134			       struct netdev_dmabuf_binding **out)
  2135	{
  2136		struct netdev_dmabuf_binding *binding;
  2137		struct scatterlist *sg;
  2138		struct dma_buf *dmabuf;
  2139		unsigned int sg_idx, i;
  2140		unsigned long virtual;
  2141		int err;
  2142	
  2143		if (!capable(CAP_NET_ADMIN))
  2144			return -EPERM;
  2145	
  2146		dmabuf = dma_buf_get(dmabuf_fd);
  2147		if (IS_ERR_OR_NULL(dmabuf))
  2148			return -EBADFD;
  2149	
  2150		binding = kzalloc_node(sizeof(*binding), GFP_KERNEL,
  2151				       dev_to_node(&dev->dev));
  2152		if (!binding) {
  2153			err = -ENOMEM;
  2154			goto err_put_dmabuf;
  2155		}
  2156	
  2157		xa_init_flags(&binding->bound_rxq_list, XA_FLAGS_ALLOC);
  2158	
  2159		refcount_set(&binding->ref, 1);
  2160	
  2161		binding->dmabuf = dmabuf;
  2162	
  2163		binding->attachment = dma_buf_attach(binding->dmabuf, dev->dev.parent);
  2164		if (IS_ERR(binding->attachment)) {
  2165			err = PTR_ERR(binding->attachment);
  2166			goto err_free_binding;
  2167		}
  2168	
  2169		binding->sgt = dma_buf_map_attachment(binding->attachment,
  2170						      DMA_BIDIRECTIONAL);
  2171		if (IS_ERR(binding->sgt)) {
  2172			err = PTR_ERR(binding->sgt);
  2173			goto err_detach;
  2174		}
  2175	
  2176		/* For simplicity we expect to make PAGE_SIZE allocations, but the
  2177		 * binding can be much more flexible than that. We may be able to
  2178		 * allocate MTU sized chunks here. Leave that for future work...
  2179		 */
> 2180		binding->chunk_pool = gen_pool_create(PAGE_SHIFT,
  2181						      dev_to_node(&dev->dev));
  2182		if (!binding->chunk_pool) {
  2183			err = -ENOMEM;
  2184			goto err_unmap;
  2185		}
  2186	
  2187		virtual = 0;
  2188		for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
  2189			dma_addr_t dma_addr = sg_dma_address(sg);
  2190			struct dmabuf_genpool_chunk_owner *owner;
  2191			size_t len = sg_dma_len(sg);
  2192			struct page_pool_iov *ppiov;
  2193	
  2194			owner = kzalloc_node(sizeof(*owner), GFP_KERNEL,
  2195					     dev_to_node(&dev->dev));
  2196			owner->base_virtual = virtual;
  2197			owner->base_dma_addr = dma_addr;
  2198			owner->num_ppiovs = len / PAGE_SIZE;
  2199			owner->binding = binding;
  2200	
> 2201			err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
  2202						 dma_addr, len, dev_to_node(&dev->dev),
  2203						 owner);
  2204			if (err) {
  2205				err = -EINVAL;
  2206				goto err_free_chunks;
  2207			}
  2208	
  2209			owner->ppiovs = kvmalloc_array(owner->num_ppiovs,
  2210						       sizeof(*owner->ppiovs),
  2211						       GFP_KERNEL);
  2212			if (!owner->ppiovs) {
  2213				err = -ENOMEM;
  2214				goto err_free_chunks;
  2215			}
  2216	
  2217			for (i = 0; i < owner->num_ppiovs; i++) {
  2218				ppiov = &owner->ppiovs[i];
  2219				ppiov->owner = owner;
  2220				refcount_set(&ppiov->refcount, 1);
  2221			}
  2222	
  2223			dma_addr += len;
  2224			virtual += len;
  2225		}
  2226	
  2227		*out = binding;
  2228	
  2229		return 0;
  2230	
  2231	err_free_chunks:
> 2232		gen_pool_for_each_chunk(binding->chunk_pool,
  2233					netdev_devmem_free_chunk_owner, NULL);
  2234		gen_pool_destroy(binding->chunk_pool);
  2235	err_unmap:
  2236		dma_buf_unmap_attachment(binding->attachment, binding->sgt,
  2237					 DMA_BIDIRECTIONAL);
  2238	err_detach:
  2239		dma_buf_detach(dmabuf, binding->attachment);
  2240	err_free_binding:
  2241		kfree(binding);
  2242	err_put_dmabuf:
  2243		dma_buf_put(dmabuf);
  2244		return err;
  2245	}
  2246	#endif
  2247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
