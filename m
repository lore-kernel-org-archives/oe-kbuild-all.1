Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74CE7472
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPURyUKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702228919; x=1733764919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oRbxwfWwdB5QeP4fZH7lG1k44b/KYWanf3Z6SNboqps=;
  b=aPURyUKL11STG55U7OW1oqQ8UbNSBW1iqYJyDK0ritR+MrilHl5LUg+s
   k0TSRZREumpwqRLReTK5OKdxLsaJXIUj4DEHf4iimA9sQRx9LmrCcOlOy
   PD6TnLzLIHUb1YMdq9Q+ZjfuOLrwxxwFdFLoTht4FC0sYwoWWFhrcewPD
   qPxkQ7FbU4jJWj9g5f+1NQjzR2ztPbU0d0HVgq754K4WJchdQdvZ+ktJi
   Od7nC+VdlZijh3HwPji8Rnz5JL1McdNlaRHqWG3pdsE1kRA1socnQccXf
   4NR36hy5HWOM1Ve1FghkYSfPdbhA1WzdjTGxWPDaUPYIuR0xz3cysD2NZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379563134"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="379563134"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 09:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1019943991"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1019943991"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 10 Dec 2023 09:21:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCNV4-000H5N-3C;
	Sun, 10 Dec 2023 17:21:54 +0000
Date: Mon, 11 Dec 2023 01:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>
Subject: [isilence:zc/rx-pp-provider 6/31] net/core/dev.c:2111: undefined
 reference to `gen_pool_has_addr'
Message-ID: <202312110138.BOpmBqbx-lkp@intel.com>
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
commit: e7b5106a5691ba635345115e6d394960d47bcdee [6/31] netdev: netdevice devmem allocator
config: i386-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231211/202312110138.BOpmBqbx-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110138.BOpmBqbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110138.BOpmBqbx-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/core/dev.o: in function `__netdev_devmem_binding_free':
   net/core/dev.c:2066: undefined reference to `gen_pool_for_each_chunk'
   ld: net/core/dev.c:2069: undefined reference to `gen_pool_size'
   ld: net/core/dev.c:2070: undefined reference to `gen_pool_avail'
   ld: net/core/dev.c:2074: undefined reference to `gen_pool_destroy'
   ld: net/core/dev.o: in function `gen_pool_alloc_owner':
   include/linux/genalloc.h:131: undefined reference to `gen_pool_alloc_algo_owner'
   ld: net/core/dev.o: in function `netdev_free_devmem':
>> net/core/dev.c:2111: undefined reference to `gen_pool_has_addr'
   ld: net/core/dev.o: in function `gen_pool_free':
   include/linux/genalloc.h:172: undefined reference to `gen_pool_free_owner'
   ld: net/core/dev.o: in function `netdev_bind_dmabuf':
   net/core/dev.c:2217: undefined reference to `gen_pool_create'
   ld: net/core/dev.c:2238: undefined reference to `gen_pool_add_owner'
   ld: net/core/dev.c:2269: undefined reference to `gen_pool_for_each_chunk'
   ld: net/core/dev.c:2271: undefined reference to `gen_pool_destroy'


vim +2111 net/core/dev.c

  2061	
  2062	void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
  2063	{
  2064		size_t size, avail;
  2065	
> 2066		gen_pool_for_each_chunk(binding->chunk_pool,
  2067					netdev_devmem_free_chunk_owner, NULL);
  2068	
  2069		size = gen_pool_size(binding->chunk_pool);
  2070		avail = gen_pool_avail(binding->chunk_pool);
  2071	
  2072		if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
  2073			  size, avail))
  2074			gen_pool_destroy(binding->chunk_pool);
  2075	
  2076		dma_buf_unmap_attachment(binding->attachment, binding->sgt,
  2077					 DMA_BIDIRECTIONAL);
  2078		dma_buf_detach(binding->dmabuf, binding->attachment);
  2079		dma_buf_put(binding->dmabuf);
  2080		kfree(binding);
  2081	}
  2082	
  2083	struct page_pool_iov *netdev_alloc_devmem(struct netdev_dmabuf_binding *binding)
  2084	{
  2085		struct dmabuf_genpool_chunk_owner *owner;
  2086		struct page_pool_iov *ppiov;
  2087		unsigned long dma_addr;
  2088		ssize_t offset;
  2089		ssize_t index;
  2090	
  2091		dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
  2092						(void **)&owner);
  2093		if (!dma_addr)
  2094			return NULL;
  2095	
  2096		offset = dma_addr - owner->base_dma_addr;
  2097		index = offset / PAGE_SIZE;
  2098		ppiov = &owner->ppiovs[index];
  2099	
  2100		netdev_devmem_binding_get(binding);
  2101	
  2102		return ppiov;
  2103	}
  2104	
  2105	void netdev_free_devmem(struct page_pool_iov *ppiov)
  2106	{
  2107		struct netdev_dmabuf_binding *binding = page_pool_iov_binding(ppiov);
  2108	
  2109		refcount_set(&ppiov->refcount, 1);
  2110	
> 2111		if (gen_pool_has_addr(binding->chunk_pool,
  2112				      page_pool_iov_dma_addr(ppiov), PAGE_SIZE))
  2113			gen_pool_free(binding->chunk_pool,
  2114				      page_pool_iov_dma_addr(ppiov), PAGE_SIZE);
  2115	
  2116		netdev_devmem_binding_put(binding);
  2117	}
  2118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
