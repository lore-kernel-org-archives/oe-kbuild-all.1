Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A73315A6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLZN9z/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702050072; x=1733586072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vk4IqCpi+NX1MZyIa7D4htw9yBU65+VDEjC38YIU4n4=;
  b=FLZN9z/LLwFAkPIwB8b18InY7izzu3cseQhZydCRyQRo8BqGPH59IpJF
   RW/KVp14CiwkQ0ekiGUOGlTR6qvY4bb+9h9PQRrgwXQQfcjuWDFkd6/Os
   0AeLbE9bisnS1IjDwqBKBtcj9COFR2Y6ij2w79Lz3Xwrufloud4Gdhbpi
   qJ9aAUnLuRQpzIedK52l1+2MPiHg0ms58otGL+pumHnjnXuT3Fyl427Um
   KHw6MYJElU+rkB42buAEeN5sLSy7QM3JwIbsu5hJ4CzR4TVoO0ymqXKGt
   mt8mTU3XPBTLmJRVq41fivXa7cS68ztJHVGpOq1arZUdXpyR+Q7koBdgc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1276350"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1276350"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 07:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="20136874"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 08 Dec 2023 07:40:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBcyG-000DuZ-0B;
	Fri, 08 Dec 2023 15:40:56 +0000
Date: Fri, 8 Dec 2023 23:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 9/18]
 arch/arm64/kvm/hyp_trace.c:245:6: sparse: sparse: symbol 'hyp_poke_tracing'
 was not declared. Should it be static?
Message-ID: <202312082354.RUEKuSlB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   bd5883688256f8eaf708cad509ce2a47ec8384aa
commit: 64f573257e8c787e0e7bd1bcfd216feca4a0f6bd [9/18] ANDROID: KVM: arm64: Flush hyp trace pipe when tracing stops
config: arm64-randconfig-r121-20231207 (https://download.01.org/0day-ci/archive/20231208/202312082354.RUEKuSlB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312082354.RUEKuSlB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312082354.RUEKuSlB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp_trace.c:102:27: sparse: sparse: symbol 'hyp_cb' was not declared. Should it be static?
>> arch/arm64/kvm/hyp_trace.c:245:6: sparse: sparse: symbol 'hyp_poke_tracing' was not declared. Should it be static?
   arch/arm64/kvm/hyp_trace.c:713:5: sparse: sparse: symbol 'hyp_trace_release' was not declared. Should it be static?

vim +/hyp_poke_tracing +245 arch/arm64/kvm/hyp_trace.c

   101	
 > 102	struct ring_buffer_ext_cb hyp_cb = {
   103		.update_footers = __update_footers,
   104		.swap_reader = __swap_reader_page,
   105	};
   106	
   107	static inline int share_page(unsigned long va)
   108	{
   109		return kvm_call_hyp_nvhe(__pkvm_host_share_hyp, virt_to_pfn(va), 1);
   110	}
   111	
   112	static inline int unshare_page(unsigned long va)
   113	{
   114		return kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, virt_to_pfn(va), 1);
   115	}
   116	
   117	static int trace_pack_pages_apply(struct trace_buffer_pack *trace_pack,
   118					  int (*func)(unsigned long))
   119	{
   120		struct ring_buffer_pack *rb_pack;
   121		int cpu, i, ret;
   122	
   123		for_each_ring_buffer_pack(rb_pack, cpu, trace_pack) {
   124			ret = func(rb_pack->reader_page_va);
   125			if (ret)
   126				return ret;
   127	
   128			for (i = 0; i < rb_pack->nr_pages; i++) {
   129				ret = func(rb_pack->page_va[i]);
   130				if (ret)
   131					return ret;
   132			}
   133		}
   134	
   135		return 0;
   136	}
   137	
   138	/*
   139	 * hyp_trace_pack size depends on trace_buffer_pack's, so
   140	 * trace_buffer_setup is in charge of the allocation for the former.
   141	 */
   142	static int trace_buffer_setup(struct hyp_trace_pack **pack, size_t *pack_size)
   143	{
   144		struct trace_buffer_pack *trace_pack;
   145		int ret;
   146	
   147		hyp_trace_buffer = ring_buffer_alloc_ext(hyp_trace_buffer_size, &hyp_cb);
   148		if (!hyp_trace_buffer)
   149			return -ENOMEM;
   150	
   151		*pack_size = offsetof(struct hyp_trace_pack, trace_buffer_pack) +
   152			     trace_buffer_pack_size(hyp_trace_buffer);
   153		/*
   154		 * The hypervisor will unmap the pack from the host to protect the
   155		 * reading. Page granularity for the pack allocation ensures no other
   156		 * useful data will be unmapped.
   157		 */
   158		*pack_size = PAGE_ALIGN(*pack_size);
   159		*pack = alloc_pages_exact(*pack_size, GFP_KERNEL);
   160		if (!*pack) {
   161			ret = -ENOMEM;
   162			goto err;
   163		}
   164	
   165		trace_pack = &(*pack)->trace_buffer_pack;
   166		WARN_ON(trace_buffer_pack(hyp_trace_buffer, trace_pack));
   167	
   168		ret = trace_pack_pages_apply(trace_pack, share_page);
   169		if (ret) {
   170			trace_pack_pages_apply(trace_pack, unshare_page);
   171			free_pages_exact(*pack, *pack_size);
   172			goto err;
   173		}
   174	
   175		return 0;
   176	err:
   177		ring_buffer_free(hyp_trace_buffer);
   178		hyp_trace_buffer = NULL;
   179	
   180		return ret;
   181	}
   182	
   183	static void trace_buffer_teardown(struct trace_buffer_pack *trace_pack)
   184	{
   185		bool alloc_trace_pack = !trace_pack;
   186	
   187		if (alloc_trace_pack) {
   188			trace_pack = kzalloc(trace_buffer_pack_size(hyp_trace_buffer), GFP_KERNEL);
   189			if (!trace_pack) {
   190				WARN_ON(1);
   191				goto end;
   192			}
   193		}
   194	
   195		WARN_ON(trace_buffer_pack(hyp_trace_buffer, trace_pack));
   196		WARN_ON(trace_pack_pages_apply(trace_pack, unshare_page));
   197	
   198		if (alloc_trace_pack)
   199			kfree(trace_pack);
   200	end:
   201		ring_buffer_free(hyp_trace_buffer);
   202		hyp_trace_buffer = NULL;
   203	}
   204	
   205	static int hyp_load_tracing(void)
   206	{
   207		struct hyp_trace_pack *pack;
   208		size_t pack_size;
   209		int ret;
   210	
   211		ret = trace_buffer_setup(&pack, &pack_size);
   212		if (ret)
   213			return ret;
   214	
   215		hyp_clock_setup(pack);
   216	
   217		ret = bpage_backing_setup(pack);
   218		if (ret)
   219			goto end_buffer_teardown;
   220	
   221		ret = kvm_call_hyp_nvhe(__pkvm_load_tracing, (unsigned long)pack, pack_size);
   222		if (!ret)
   223			goto end_free_pack;
   224	
   225		bpage_backing_teardown();
   226	end_buffer_teardown:
   227		trace_buffer_teardown(&pack->trace_buffer_pack);
   228	end_free_pack:
   229		free_pages_exact(pack, pack_size);
   230	
   231		return ret;
   232	}
   233	
   234	static void hyp_free_tracing(void)
   235	{
   236		WARN_ON(hyp_trace_readers || hyp_trace_on);
   237	
   238		if (WARN_ON(kvm_call_hyp_nvhe(__pkvm_teardown_tracing)))
   239			return;
   240	
   241		trace_buffer_teardown(NULL);
   242		bpage_backing_teardown();
   243	}
   244	
 > 245	void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
   246	{
   247		if (cpu == RING_BUFFER_ALL_CPUS) {
   248			for_each_cpu(cpu, cpus)
   249				WARN_ON_ONCE(ring_buffer_poke(hyp_trace_buffer, cpu));
   250		} else {
   251			WARN_ON_ONCE(ring_buffer_poke(hyp_trace_buffer, cpu));
   252		}
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
