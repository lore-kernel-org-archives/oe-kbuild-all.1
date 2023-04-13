Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D017F7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 07:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681369905; x=1712905905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z60Pofy+NU6TkPVnnNk7vujB9MCn8EWjtwu8PiGfuGs=;
  b=dVUEDzk5OrQ5AixIlRqkoReu/5H9ZPN7Ru33WHq+DzF+c+uUv831N+2W
   bLxX+JWDl2uU/XxQlpeI3TGZsUWxOvssD5nZE0H6PFjZDPZ2LgaGJsGQl
   M0636Gkk/fpXEknCTrtrLxKPC8SCQLCH8ZdGdLY6rMTtAtKQj4/nJyaw7
   kEVuc8rNlouIgSArato0k4LeIl3c3yJP+ld0Vd0K63P76dIzrbczh5O/8
   fCg/kp2RITguvgWrvxnLt99BqJB5worWuSlH+hkzc4NR7abNNBZ5ksA/u
   +Z9AJCADmsf3da8Mxm22hwE9FLknocOjtZcvmyg6wHyUlo6tl2Ib+hcJ/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="324463013"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="324463013"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 00:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="753878447"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="753878447"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2023 00:11:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmr7K-000YSX-2t;
	Thu, 13 Apr 2023 07:11:38 +0000
Date: Thu, 13 Apr 2023 15:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Kelley <mikelley@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Tianyu Lan <Tianyu.Lan@microsoft.com>
Subject: [hyperv:hyperv-next 11/17] arch/x86/hyperv/hv_init.c:69:20: sparse:
 sparse: cast removes address space '__iomem' of expression
Message-ID: <202304131513.il1242tP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   cad7807c90ba26f9c3e49cde444b120ce6e12b9e
commit: 42e4bb681cf6795305bb7abdd690c2f6a373e969 [11/17] Drivers: hv: Don't remap addresses that are above shared_gpa_boundary
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230413/202304131513.il1242tP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/commit/?id=42e4bb681cf6795305bb7abdd690c2f6a373e969
        git remote add hyperv https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
        git fetch --no-tags hyperv hyperv-next
        git checkout 42e4bb681cf6795305bb7abdd690c2f6a373e969
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131513.il1242tP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/hyperv/hv_init.c:69:20: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/x86/hyperv/hv_init.c:223:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/x86/hyperv/hv_init.c:223:33: sparse:     expected void volatile [noderef] __iomem *addr
   arch/x86/hyperv/hv_init.c:223:33: sparse:     got void *
--
>> drivers/hv/hv.c:224:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/hv/hv.c:243:28: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/hv/hv.c:322:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *synic_message_page @@
   drivers/hv/hv.c:322:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/hv/hv.c:322:31: sparse:     got void *synic_message_page
>> drivers/hv/hv.c:334:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *synic_event_page @@
   drivers/hv/hv.c:334:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/hv/hv.c:334:31: sparse:     got void *synic_event_page

vim +/__iomem +69 arch/x86/hyperv/hv_init.c

    47	
    48	static int hyperv_init_ghcb(void)
    49	{
    50		u64 ghcb_gpa;
    51		void *ghcb_va;
    52		void **ghcb_base;
    53	
    54		if (!hv_isolation_type_snp())
    55			return 0;
    56	
    57		if (!hv_ghcb_pg)
    58			return -EINVAL;
    59	
    60		/*
    61		 * GHCB page is allocated by paravisor. The address
    62		 * returned by MSR_AMD64_SEV_ES_GHCB is above shared
    63		 * memory boundary and map it here.
    64		 */
    65		rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
    66	
    67		/* Mask out vTOM bit. ioremap_cache() maps decrypted */
    68		ghcb_gpa &= ~ms_hyperv.shared_gpa_boundary;
  > 69		ghcb_va = (void *)ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
    70		if (!ghcb_va)
    71			return -ENOMEM;
    72	
    73		ghcb_base = (void **)this_cpu_ptr(hv_ghcb_pg);
    74		*ghcb_base = ghcb_va;
    75	
    76		return 0;
    77	}
    78	
    79	static int hv_cpu_init(unsigned int cpu)
    80	{
    81		union hv_vp_assist_msr_contents msr = { 0 };
    82		struct hv_vp_assist_page **hvp = &hv_vp_assist_page[cpu];
    83		int ret;
    84	
    85		ret = hv_common_cpu_init(cpu);
    86		if (ret)
    87			return ret;
    88	
    89		if (!hv_vp_assist_page)
    90			return 0;
    91	
    92		if (hv_root_partition) {
    93			/*
    94			 * For root partition we get the hypervisor provided VP assist
    95			 * page, instead of allocating a new page.
    96			 */
    97			rdmsrl(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
    98			*hvp = memremap(msr.pfn << HV_X64_MSR_VP_ASSIST_PAGE_ADDRESS_SHIFT,
    99					PAGE_SIZE, MEMREMAP_WB);
   100		} else {
   101			/*
   102			 * The VP assist page is an "overlay" page (see Hyper-V TLFS's
   103			 * Section 5.2.1 "GPA Overlay Pages"). Here it must be zeroed
   104			 * out to make sure we always write the EOI MSR in
   105			 * hv_apic_eoi_write() *after* the EOI optimization is disabled
   106			 * in hv_cpu_die(), otherwise a CPU may not be stopped in the
   107			 * case of CPU offlining and the VM will hang.
   108			 */
   109			if (!*hvp)
   110				*hvp = __vmalloc(PAGE_SIZE, GFP_KERNEL | __GFP_ZERO);
   111			if (*hvp)
   112				msr.pfn = vmalloc_to_pfn(*hvp);
   113	
   114		}
   115		if (!WARN_ON(!(*hvp))) {
   116			msr.enable = 1;
   117			wrmsrl(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
   118		}
   119	
   120		return hyperv_init_ghcb();
   121	}
   122	
   123	static void (*hv_reenlightenment_cb)(void);
   124	
   125	static void hv_reenlightenment_notify(struct work_struct *dummy)
   126	{
   127		struct hv_tsc_emulation_status emu_status;
   128	
   129		rdmsrl(HV_X64_MSR_TSC_EMULATION_STATUS, *(u64 *)&emu_status);
   130	
   131		/* Don't issue the callback if TSC accesses are not emulated */
   132		if (hv_reenlightenment_cb && emu_status.inprogress)
   133			hv_reenlightenment_cb();
   134	}
   135	static DECLARE_DELAYED_WORK(hv_reenlightenment_work, hv_reenlightenment_notify);
   136	
   137	void hyperv_stop_tsc_emulation(void)
   138	{
   139		u64 freq;
   140		struct hv_tsc_emulation_status emu_status;
   141	
   142		rdmsrl(HV_X64_MSR_TSC_EMULATION_STATUS, *(u64 *)&emu_status);
   143		emu_status.inprogress = 0;
   144		wrmsrl(HV_X64_MSR_TSC_EMULATION_STATUS, *(u64 *)&emu_status);
   145	
   146		rdmsrl(HV_X64_MSR_TSC_FREQUENCY, freq);
   147		tsc_khz = div64_u64(freq, 1000);
   148	}
   149	EXPORT_SYMBOL_GPL(hyperv_stop_tsc_emulation);
   150	
   151	static inline bool hv_reenlightenment_available(void)
   152	{
   153		/*
   154		 * Check for required features and privileges to make TSC frequency
   155		 * change notifications work.
   156		 */
   157		return ms_hyperv.features & HV_ACCESS_FREQUENCY_MSRS &&
   158			ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE &&
   159			ms_hyperv.features & HV_ACCESS_REENLIGHTENMENT;
   160	}
   161	
   162	DEFINE_IDTENTRY_SYSVEC(sysvec_hyperv_reenlightenment)
   163	{
   164		ack_APIC_irq();
   165		inc_irq_stat(irq_hv_reenlightenment_count);
   166		schedule_delayed_work(&hv_reenlightenment_work, HZ/10);
   167	}
   168	
   169	void set_hv_tscchange_cb(void (*cb)(void))
   170	{
   171		struct hv_reenlightenment_control re_ctrl = {
   172			.vector = HYPERV_REENLIGHTENMENT_VECTOR,
   173			.enabled = 1,
   174		};
   175		struct hv_tsc_emulation_control emu_ctrl = {.enabled = 1};
   176	
   177		if (!hv_reenlightenment_available()) {
   178			pr_warn("Hyper-V: reenlightenment support is unavailable\n");
   179			return;
   180		}
   181	
   182		if (!hv_vp_index)
   183			return;
   184	
   185		hv_reenlightenment_cb = cb;
   186	
   187		/* Make sure callback is registered before we write to MSRs */
   188		wmb();
   189	
   190		re_ctrl.target_vp = hv_vp_index[get_cpu()];
   191	
   192		wrmsrl(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *((u64 *)&re_ctrl));
   193		wrmsrl(HV_X64_MSR_TSC_EMULATION_CONTROL, *((u64 *)&emu_ctrl));
   194	
   195		put_cpu();
   196	}
   197	EXPORT_SYMBOL_GPL(set_hv_tscchange_cb);
   198	
   199	void clear_hv_tscchange_cb(void)
   200	{
   201		struct hv_reenlightenment_control re_ctrl;
   202	
   203		if (!hv_reenlightenment_available())
   204			return;
   205	
   206		rdmsrl(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *(u64 *)&re_ctrl);
   207		re_ctrl.enabled = 0;
   208		wrmsrl(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *(u64 *)&re_ctrl);
   209	
   210		hv_reenlightenment_cb = NULL;
   211	}
   212	EXPORT_SYMBOL_GPL(clear_hv_tscchange_cb);
   213	
   214	static int hv_cpu_die(unsigned int cpu)
   215	{
   216		struct hv_reenlightenment_control re_ctrl;
   217		unsigned int new_cpu;
   218		void **ghcb_va;
   219	
   220		if (hv_ghcb_pg) {
   221			ghcb_va = (void **)this_cpu_ptr(hv_ghcb_pg);
   222			if (*ghcb_va)
 > 223				iounmap(*ghcb_va);
   224			*ghcb_va = NULL;
   225		}
   226	
   227		hv_common_cpu_die(cpu);
   228	
   229		if (hv_vp_assist_page && hv_vp_assist_page[cpu]) {
   230			union hv_vp_assist_msr_contents msr = { 0 };
   231			if (hv_root_partition) {
   232				/*
   233				 * For root partition the VP assist page is mapped to
   234				 * hypervisor provided page, and thus we unmap the
   235				 * page here and nullify it, so that in future we have
   236				 * correct page address mapped in hv_cpu_init.
   237				 */
   238				memunmap(hv_vp_assist_page[cpu]);
   239				hv_vp_assist_page[cpu] = NULL;
   240				rdmsrl(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
   241				msr.enable = 0;
   242			}
   243			wrmsrl(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
   244		}
   245	
   246		if (hv_reenlightenment_cb == NULL)
   247			return 0;
   248	
   249		rdmsrl(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *((u64 *)&re_ctrl));
   250		if (re_ctrl.target_vp == hv_vp_index[cpu]) {
   251			/*
   252			 * Reassign reenlightenment notifications to some other online
   253			 * CPU or just disable the feature if there are no online CPUs
   254			 * left (happens on hibernation).
   255			 */
   256			new_cpu = cpumask_any_but(cpu_online_mask, cpu);
   257	
   258			if (new_cpu < nr_cpu_ids)
   259				re_ctrl.target_vp = hv_vp_index[new_cpu];
   260			else
   261				re_ctrl.enabled = 0;
   262	
   263			wrmsrl(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *((u64 *)&re_ctrl));
   264		}
   265	
   266		return 0;
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
