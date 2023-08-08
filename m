Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF4115481
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 18:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691519710; x=1723055710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2QTJF118qtyYmWyCjBld+aEOtg73Vpqw3ABNSgKVIWs=;
  b=NA7fBaUlWkRVek6LGg7/Cj1Ia1q43CPSqGF7uhIyAGm5fwCWgRkNH/Wu
   frmKuOIe5GLK5Qo58iJ/TdKhtoOOv8IHSwisSi7oQu08OxZQe0coxw+q/
   ZAurchCudah20u+MLamrJXi5ax0hYWjfykuakqpgIXkmN+SSzp5vw+j23
   De8GOQS8b4pgO/MtnmRss+ZTxOpsCwjMLkBm+s59Qld6Whgd5R7/GDETb
   sKW9fU04p4TsI/XKnd0XZ7sO0k1jmTXtzmkCQOc6RENtyFidxP7M7gmlq
   eRnGboH6gxD0d30cgIrRwRQV+M9hCjlwOPJPNCEkb0a3GskGu3qatq2iU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369815558"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="369815558"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 11:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="978016739"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="978016739"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2023 11:35:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTRXv-0005XS-11;
	Tue, 08 Aug 2023 18:35:07 +0000
Date: Wed, 9 Aug 2023 02:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slub-percpu-caches-v1 5/5] lib/maple_tree.c:5561: undefined
 reference to `kmem_cache_prefill_percpu_array'
Message-ID: <202308090227.VQNrrinl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v1
head:   23793c9cd4b2fc31144dba68dd67554b8e4308e9
commit: 23793c9cd4b2fc31144dba68dd67554b8e4308e9 [5/5] maple_tree: replace preallocation with slub percpu array prefill
config: riscv-randconfig-r042-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090227.VQNrrinl-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090227.VQNrrinl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090227.VQNrrinl-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: lib/maple_tree.o: in function `.L0 ':
>> lib/maple_tree.c:5561: undefined reference to `kmem_cache_prefill_percpu_array'
>> riscv32-linux-ld: lib/maple_tree.c:6202: undefined reference to `kmem_cache_setup_percpu_array'


vim +5561 lib/maple_tree.c

  5547	
  5548	/**
  5549	 * mas_preallocate() - Preallocate enough nodes for a store operation
  5550	 * @mas: The maple state
  5551	 * @gfp: The GFP_FLAGS to use for allocations.
  5552	 *
  5553	 * Return: 0 on success, -ENOMEM if memory could not be allocated.
  5554	 */
  5555	int mas_preallocate(struct ma_state *mas, gfp_t gfp)
  5556	{
  5557		int ret;
  5558		int count = 1 + mas_mt_height(mas) * 3;
  5559	
  5560		mas_node_count_gfp(mas, 1, gfp);
> 5561		kmem_cache_prefill_percpu_array(maple_node_cache, count, gfp);
  5562		if (likely(!mas_is_err(mas)))
  5563			return 0;
  5564	
  5565		mas_set_alloc_req(mas, 0);
  5566		ret = xa_err(mas->node);
  5567		mas_reset(mas);
  5568		mas_destroy(mas);
  5569		mas_reset(mas);
  5570		return ret;
  5571	}
  5572	EXPORT_SYMBOL_GPL(mas_preallocate);
  5573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
