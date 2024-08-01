Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DBC14AA9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 22:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722550137; cv=none; b=cpzlFNlAzROEKuThCwDnadmvlXj0hiYW8MxFAh+AQERFNqRyqrlWj9aY+o8IrfGOC8EWNmdUSpYbDK4tVvZ+kP9WSTXDYRcVoi09REFiwy8xVmh9d6PR+qcPGd+X8M6TtedKhFQxc5HmEf5uRSmOjLi9yn8BOMLFd1LHbnWeVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722550137; c=relaxed/simple;
	bh=H/ieLVCKMOSWo1zMHHSE9TwzVqnXEXQbYqCuVTGt6Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POp12Ztbp+aGwfn5+s40Z/DvTjT6yjOoyCb3F+gv/DdZkZoLkL9uOUiYbQdZWifmcQPNFHx0Y/eZI8UyTSBUZmfM+LwOdAOjOroDO6qsNGMXH1rs/4R5LMpgyGEwSF+GlBjJkGBI+9u8uEubshfG3zmsmEgm2k6c7j8sFA3uHDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9euzL/k; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9euzL/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722550135; x=1754086135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H/ieLVCKMOSWo1zMHHSE9TwzVqnXEXQbYqCuVTGt6Ng=;
  b=d9euzL/kf4OOR7nMhVAXLKxtPDbCV+wSYWhzfE9Zhck/YrtSxEp/+C6q
   hmuyaebmbLOhxZH5fuBUcOQI7vl38bVgA01rwYNCz/hBxjfJLdyhswKme
   qdc66vjMSGvVlbJHqLjwzuP+tQ+5Nkko2J57t97vmNt3p7Pk6VTUYHsuu
   lRS3pBaR0iDoaoFQ+eLi6hjldrwQR89xoXHmMoa9dKGimqiXQVXHGmtKi
   Src3+VXC0RFDiQOyrQGqVd0cxXjX8l8P0elMn1/uAxqHozn7BZmRbNhFP
   mHQWBAm2Cjyzq7/mJNGcZF/QmotoURFOduc7a1AClifFTiERc0SuDD6Q5
   Q==;
X-CSE-ConnectionGUID: EpqDBxcWTDKyONaqcZT3vQ==
X-CSE-MsgGUID: ZW7CRTlHSOuGI3HgsCXiGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20363234"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="20363234"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 15:08:54 -0700
X-CSE-ConnectionGUID: luEDyZXMRDC4w5GXJEUv8A==
X-CSE-MsgGUID: lho6X7B2QrKQVnCUA61QFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="59820491"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Aug 2024 15:08:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZdyc-000w52-0J;
	Thu, 01 Aug 2024 22:08:50 +0000
Date: Fri, 2 Aug 2024 06:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Saeed Mahameed <saeedm@nvidia.com>,
	Willem de Bruijn <willemb@google.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>
Subject: [saeed:temp/zcrx-mlx5 4/44] net/core/devmem.c:39:undefined reference
 to `gen_pool_for_each_chunk'
Message-ID: <202408020513.1XLXje9b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git temp/zcrx-mlx5
head:   86d67e0dea281a7762636cc545694ca81f5b4621
commit: 1df3ceabbf8e2ce712bb39d8c35941800be52829 [4/44] netdev: support binding dma-buf to netdevice
config: i386-randconfig-006-20240801 (https://download.01.org/0day-ci/archive/20240802/202408020513.1XLXje9b-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020513.1XLXje9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020513.1XLXje9b-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/core/devmem.o: in function `__net_devmem_dmabuf_binding_free':
>> net/core/devmem.c:39:(.text+0x3a): undefined reference to `gen_pool_for_each_chunk'
>> ld: net/core/devmem.c:42:(.text+0x42): undefined reference to `gen_pool_size'
>> ld: net/core/devmem.c:43:(.text+0x4c): undefined reference to `gen_pool_avail'
>> ld: net/core/devmem.c:47:(.text+0x58): undefined reference to `gen_pool_destroy'
   ld: net/core/devmem.o: in function `net_devmem_bind_dmabuf':
>> net/core/devmem.c:189:(.text+0x420): undefined reference to `gen_pool_create'
>> ld: net/core/devmem.c:209:(.text+0x4b5): undefined reference to `gen_pool_add_owner'
>> ld: net/core/devmem.c:238:(.text+0x550): undefined reference to `gen_pool_for_each_chunk'
   ld: net/core/devmem.c:240:(.text+0x558): undefined reference to `gen_pool_destroy'


vim +39 net/core/devmem.c

    34	
    35	void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
    36	{
    37		size_t size, avail;
    38	
  > 39		gen_pool_for_each_chunk(binding->chunk_pool,
    40					net_devmem_dmabuf_free_chunk_owner, NULL);
    41	
  > 42		size = gen_pool_size(binding->chunk_pool);
  > 43		avail = gen_pool_avail(binding->chunk_pool);
    44	
    45		if (!WARN(size != avail, "can't destroy genpool. size=%zu, avail=%zu",
    46			  size, avail))
  > 47			gen_pool_destroy(binding->chunk_pool);
    48	
    49		dma_buf_unmap_attachment(binding->attachment, binding->sgt,
    50					 DMA_FROM_DEVICE);
    51		dma_buf_detach(binding->dmabuf, binding->attachment);
    52		dma_buf_put(binding->dmabuf);
    53		xa_destroy(&binding->bound_rxq_list);
    54		kfree(binding);
    55	}
    56	
    57	/* Protected by rtnl_lock() */
    58	static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
    59	
    60	void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
    61	{
    62		struct netdev_rx_queue *rxq;
    63		unsigned long xa_idx;
    64		unsigned int rxq_idx;
    65	
    66		if (!binding)
    67			return;
    68	
    69		if (binding->list.next)
    70			list_del(&binding->list);
    71	
    72		xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
    73			if (rxq->mp_params.mp_priv == binding) {
    74				/* We hold the rtnl_lock while binding/unbinding
    75				 * dma-buf, so we can't race with another thread that
    76				 * is also modifying this value. However, the page_pool
    77				 * may read this config while it's creating its
    78				 * rx-queues. WRITE_ONCE() here to match the
    79				 * READ_ONCE() in the page_pool.
    80				 */
    81				WRITE_ONCE(rxq->mp_params.mp_ops, NULL);
    82				WRITE_ONCE(rxq->mp_params.mp_priv, NULL);
    83	
    84				rxq_idx = get_netdev_rx_queue_index(rxq);
    85	
    86				netdev_rx_queue_restart(binding->dev, rxq_idx);
    87			}
    88		}
    89	
    90		xa_erase(&net_devmem_dmabuf_bindings, binding->id);
    91	
    92		net_devmem_dmabuf_binding_put(binding);
    93	}
    94	
    95	int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
    96					    struct net_devmem_dmabuf_binding *binding)
    97	{
    98		struct netdev_rx_queue *rxq;
    99		u32 xa_idx;
   100		int err;
   101	
   102		if (rxq_idx >= dev->num_rx_queues)
   103			return -ERANGE;
   104	
   105		rxq = __netif_get_rx_queue(dev, rxq_idx);
   106		if (rxq->mp_params.mp_priv)
   107			return -EEXIST;
   108	
   109		err = xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit_32b,
   110			       GFP_KERNEL);
   111		if (err)
   112			return err;
   113	
   114		/* We hold the rtnl_lock while binding/unbinding dma-buf, so we can't
   115		 * race with another thread that is also modifying this value. However,
   116		 * the driver may read this config while it's creating its * rx-queues.
   117		 * WRITE_ONCE() here to match the READ_ONCE() in the driver.
   118		 */
   119		WRITE_ONCE(rxq->mp_params.mp_priv, binding);
   120	
   121		err = netdev_rx_queue_restart(dev, rxq_idx);
   122		if (err)
   123			goto err_xa_erase;
   124	
   125		return 0;
   126	
   127	err_xa_erase:
   128		WRITE_ONCE(rxq->mp_params.mp_ops, NULL);
   129		WRITE_ONCE(rxq->mp_params.mp_priv, NULL);
   130		xa_erase(&binding->bound_rxq_list, xa_idx);
   131	
   132		return err;
   133	}
   134	
   135	int net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
   136				   struct net_devmem_dmabuf_binding **out)
   137	{
   138		struct net_devmem_dmabuf_binding *binding;
   139		static u32 id_alloc_next;
   140		struct scatterlist *sg;
   141		struct dma_buf *dmabuf;
   142		unsigned int sg_idx, i;
   143		unsigned long virtual;
   144		int err;
   145	
   146		dmabuf = dma_buf_get(dmabuf_fd);
   147		if (IS_ERR(dmabuf))
   148			return -EBADFD;
   149	
   150		binding = kzalloc_node(sizeof(*binding), GFP_KERNEL,
   151				       dev_to_node(&dev->dev));
   152		if (!binding) {
   153			err = -ENOMEM;
   154			goto err_put_dmabuf;
   155		}
   156	
   157		binding->dev = dev;
   158	
   159		err = xa_alloc_cyclic(&net_devmem_dmabuf_bindings, &binding->id,
   160				      binding, xa_limit_32b, &id_alloc_next,
   161				      GFP_KERNEL);
   162		if (err < 0)
   163			goto err_free_binding;
   164	
   165		xa_init_flags(&binding->bound_rxq_list, XA_FLAGS_ALLOC);
   166	
   167		refcount_set(&binding->ref, 1);
   168	
   169		binding->dmabuf = dmabuf;
   170	
   171		binding->attachment = dma_buf_attach(binding->dmabuf, dev->dev.parent);
   172		if (IS_ERR(binding->attachment)) {
   173			err = PTR_ERR(binding->attachment);
   174			goto err_free_id;
   175		}
   176	
   177		binding->sgt =
   178			dma_buf_map_attachment(binding->attachment, DMA_BIDIRECTIONAL);
   179		if (IS_ERR(binding->sgt)) {
   180			err = PTR_ERR(binding->sgt);
   181			goto err_detach;
   182		}
   183	
   184		/* For simplicity we expect to make PAGE_SIZE allocations, but the
   185		 * binding can be much more flexible than that. We may be able to
   186		 * allocate MTU sized chunks here. Leave that for future work...
   187		 */
   188		binding->chunk_pool =
 > 189			gen_pool_create(PAGE_SHIFT, dev_to_node(&dev->dev));
   190		if (!binding->chunk_pool) {
   191			err = -ENOMEM;
   192			goto err_unmap;
   193		}
   194	
   195		virtual = 0;
   196		for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
   197			dma_addr_t dma_addr = sg_dma_address(sg);
   198			struct dmabuf_genpool_chunk_owner *owner;
   199			size_t len = sg_dma_len(sg);
   200			struct net_iov *niov;
   201	
   202			owner = kzalloc_node(sizeof(*owner), GFP_KERNEL,
   203					     dev_to_node(&dev->dev));
   204			owner->base_virtual = virtual;
   205			owner->base_dma_addr = dma_addr;
   206			owner->num_niovs = len / PAGE_SIZE;
   207			owner->binding = binding;
   208	
 > 209			err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
   210						 dma_addr, len, dev_to_node(&dev->dev),
   211						 owner);
   212			if (err) {
   213				err = -EINVAL;
   214				goto err_free_chunks;
   215			}
   216	
   217			owner->niovs = kvmalloc_array(owner->num_niovs,
   218						      sizeof(*owner->niovs),
   219						      GFP_KERNEL);
   220			if (!owner->niovs) {
   221				err = -ENOMEM;
   222				goto err_free_chunks;
   223			}
   224	
   225			for (i = 0; i < owner->num_niovs; i++) {
   226				niov = &owner->niovs[i];
   227				niov->owner = owner;
   228			}
   229	
   230			virtual += len;
   231		}
   232	
   233		*out = binding;
   234	
   235		return 0;
   236	
   237	err_free_chunks:
 > 238		gen_pool_for_each_chunk(binding->chunk_pool,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
