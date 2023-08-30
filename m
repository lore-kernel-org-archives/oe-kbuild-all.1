Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D8F6AA2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693421175; x=1724957175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PyXluujtCumNe/WZI72O4hS7eVj7wP818BHpCVHJNMU=;
  b=OdYcbZuurk1bWqy+2GpLnKBKlnlA5kev6sTI2sT00rWKRaSGnEcEsz4z
   s0XgMTQzdm1s4dHxIP3n3oe2UN04xTCJGnpRlvcGT8hmL0A4bRPv68vZv
   7mprmTRclGnOxMgMdv0JkiBYBLHp1RqyTxtr0JTCpnfnA4nhG9KC1I4e5
   w+a7t/8fAPZkMsa2/dAq6PzNEQsUxnkyndxvwMtfVlWq1Jy8M8LJJmihz
   PXIhPL1smQQ3qQPNcfV42L2TyR+dfJhlwESg2+1G2b1qYzgGZfmzH2snM
   ZzEYga+u7e7C91Wy3Ml3/WFfjNbiBvRgBx+AtR7i9wlfahLp++BznK6vK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355225636"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="355225636"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 11:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="882850255"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2023 11:46:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbQC7-000A7n-04;
	Wed, 30 Aug 2023 18:45:49 +0000
Date: Thu, 31 Aug 2023 02:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 251/382]
 drivers/dma-buf/heaps/carveout-heap.c:312:12: warning:
 'carveout_dma_heap_export' defined but not used
Message-ID: <202308310224.Czfl0elj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   12887ba38dafb36e03a9f5201493ce46f903f0d4
commit: 0657a5681046633ab41f6505bcdbc292ee2ce3d4 [251/382] dma-buf: heaps: Add Carveout heap to DMA-BUF Heaps
config: sparc64-randconfig-r006-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310224.Czfl0elj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310224.Czfl0elj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310224.Czfl0elj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/heaps/carveout-heap.c:312:12: warning: 'carveout_dma_heap_export' defined but not used [-Wunused-function]
     312 | static int carveout_dma_heap_export(phys_addr_t base, size_t size, const char *name, bool cached)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/carveout_dma_heap_export +312 drivers/dma-buf/heaps/carveout-heap.c

   311	
 > 312	static int carveout_dma_heap_export(phys_addr_t base, size_t size, const char *name, bool cached)
   313	{
   314		struct carveout_dma_heap *carveout_dma_heap;
   315		struct dma_heap_export_info exp_info;
   316		int ret;
   317	
   318		carveout_dma_heap = kzalloc(sizeof(*carveout_dma_heap), GFP_KERNEL);
   319		if (!carveout_dma_heap)
   320			return -ENOMEM;
   321	
   322		carveout_dma_heap->pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
   323		if (IS_ERR(carveout_dma_heap->pool)) {
   324			pr_err("Carveout Heap: Could not create memory pool\n");
   325			ret = PTR_ERR(carveout_dma_heap->pool);
   326			goto free_carveout_dma_heap;
   327		}
   328		ret = gen_pool_add(carveout_dma_heap->pool, base, size, NUMA_NO_NODE);
   329		if (ret) {
   330			pr_err("Carveout Heap: Could not add memory to pool\n");
   331			goto free_pool;
   332		}
   333	
   334		carveout_dma_heap->cached = cached;
   335	
   336		exp_info.name = kasprintf(GFP_KERNEL, "carveout_%s", name);
   337		exp_info.ops = &carveout_dma_heap_ops;
   338		exp_info.priv = carveout_dma_heap;
   339		carveout_dma_heap->heap = dma_heap_add(&exp_info);
   340		if (IS_ERR(carveout_dma_heap->heap)) {
   341			pr_err("Carveout Heap: Could not add DMA-Heap\n");
   342			ret = PTR_ERR(carveout_dma_heap->heap);
   343			goto free_pool;
   344		}
   345	
   346		pr_info("Carveout Heap: Exported %zu MiB at %pa\n", size / SZ_1M, &base);
   347	
   348		return 0;
   349	
   350	free_pool:
   351		gen_pool_destroy(carveout_dma_heap->pool);
   352	free_carveout_dma_heap:
   353		kfree(carveout_dma_heap);
   354		return ret;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
