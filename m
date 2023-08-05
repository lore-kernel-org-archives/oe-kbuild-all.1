Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC58489
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691243554; x=1722779554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=roohVJXHYT1oHF1vLfHxM18pAt1mj936bZ7unKnPwow=;
  b=c9TW6SuYAfhHiBKNgsCdLo/FmXkvpAbKC/jN96hHMc78uVNmUgMaog+2
   Iu5FizmxmHAy1gCA+FDi8m8GW5xk64ycMo9B/MLqNkvkfExWZcs2vsFb1
   LYcMPWB0qgJBCvVDCCEws0ddk33x8jbfk03JSAdbahZkGktr3C2sx8iBE
   b9Azc9oP0hCTJL6XzP4jF5ljYPN9jW++gPecswbwEvrnFuGmYbsgtr0qI
   7UGi+0yifjdXTs0V4lpkMj9z8m+7oOHraHoQjLHXB4EsUAuBXEQPMI+rv
   rYcv8rCmKOtgx7u/3+DjsPVG6FwPdkH6R1JDMDcWGK8QKCJSgF5Wje2QQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="350624214"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="350624214"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 06:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="1061097973"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="1061097973"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2023 06:52:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSHhn-0003Xd-1z;
	Sat, 05 Aug 2023 13:52:31 +0000
Date: Sat, 5 Aug 2023 21:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [hyperv:hyperv-next 4/8] drivers/hv/hv.c:128:21: error: implicit
 declaration of function 'hv_isolation_type_en_snp'; did you mean
 'hv_isolation_type_snp'?
Message-ID: <202308052124.BBq1lUOQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   3a5274c555c28bd6906103b0d9bbfd6e9e9df1ff
commit: 60b9b192d99af072986315bfbf720965f5190eed [4/8] drivers: hv: Mark percpu hvcall input arg page unencrypted in SEV-SNP enlightened guest
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308052124.BBq1lUOQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308052124.BBq1lUOQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308052124.BBq1lUOQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hv/hv.c: In function 'hv_synic_alloc':
>> drivers/hv/hv.c:128:21: error: implicit declaration of function 'hv_isolation_type_en_snp'; did you mean 'hv_isolation_type_snp'? [-Werror=implicit-function-declaration]
     128 |                 if (hv_isolation_type_en_snp()) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
         |                     hv_isolation_type_snp
   cc1: some warnings being treated as errors
--
   drivers/hv/hv_common.c: In function 'hv_common_cpu_init':
>> drivers/hv/hv_common.c:384:21: error: implicit declaration of function 'hv_isolation_type_en_snp'; did you mean 'hv_isolation_type_snp'? [-Werror=implicit-function-declaration]
     384 |                 if (hv_isolation_type_en_snp()) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
         |                     hv_isolation_type_snp
   drivers/hv/hv_common.c: At top level:
   drivers/hv/hv_common.c:518:13: warning: no previous prototype for 'hv_isolation_type_en_snp' [-Wmissing-prototypes]
     518 | bool __weak hv_isolation_type_en_snp(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hv/hv_common.c:518:13: error: conflicting types for 'hv_isolation_type_en_snp'; have 'bool(void)' {aka '_Bool(void)'}
   drivers/hv/hv_common.c:384:21: note: previous implicit declaration of 'hv_isolation_type_en_snp' with type 'int()'
     384 |                 if (hv_isolation_type_en_snp()) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +128 drivers/hv/hv.c

    79	
    80	int hv_synic_alloc(void)
    81	{
    82		int cpu, ret = -ENOMEM;
    83		struct hv_per_cpu_context *hv_cpu;
    84	
    85		/*
    86		 * First, zero all per-cpu memory areas so hv_synic_free() can
    87		 * detect what memory has been allocated and cleanup properly
    88		 * after any failures.
    89		 */
    90		for_each_present_cpu(cpu) {
    91			hv_cpu = per_cpu_ptr(hv_context.cpu_context, cpu);
    92			memset(hv_cpu, 0, sizeof(*hv_cpu));
    93		}
    94	
    95		hv_context.hv_numa_map = kcalloc(nr_node_ids, sizeof(struct cpumask),
    96						 GFP_KERNEL);
    97		if (hv_context.hv_numa_map == NULL) {
    98			pr_err("Unable to allocate NUMA map\n");
    99			goto err;
   100		}
   101	
   102		for_each_present_cpu(cpu) {
   103			hv_cpu = per_cpu_ptr(hv_context.cpu_context, cpu);
   104	
   105			tasklet_init(&hv_cpu->msg_dpc,
   106				     vmbus_on_msg_dpc, (unsigned long) hv_cpu);
   107	
   108			/*
   109			 * Synic message and event pages are allocated by paravisor.
   110			 * Skip these pages allocation here.
   111			 */
   112			if (!hv_isolation_type_snp() && !hv_root_partition) {
   113				hv_cpu->synic_message_page =
   114					(void *)get_zeroed_page(GFP_ATOMIC);
   115				if (hv_cpu->synic_message_page == NULL) {
   116					pr_err("Unable to allocate SYNIC message page\n");
   117					goto err;
   118				}
   119	
   120				hv_cpu->synic_event_page =
   121					(void *)get_zeroed_page(GFP_ATOMIC);
   122				if (hv_cpu->synic_event_page == NULL) {
   123					pr_err("Unable to allocate SYNIC event page\n");
   124					goto err;
   125				}
   126			}
   127	
 > 128			if (hv_isolation_type_en_snp()) {
   129				ret = set_memory_decrypted((unsigned long)
   130					hv_cpu->synic_message_page, 1);
   131				if (ret) {
   132					pr_err("Failed to decrypt SYNIC msg page: %d\n", ret);
   133					hv_cpu->synic_message_page = NULL;
   134	
   135					/*
   136					 * Free the event page here so that hv_synic_free()
   137					 * won't later try to re-encrypt it.
   138					 */
   139					free_page((unsigned long)hv_cpu->synic_event_page);
   140					hv_cpu->synic_event_page = NULL;
   141					goto err;
   142				}
   143	
   144				ret = set_memory_decrypted((unsigned long)
   145					hv_cpu->synic_event_page, 1);
   146				if (ret) {
   147					pr_err("Failed to decrypt SYNIC event page: %d\n", ret);
   148					hv_cpu->synic_event_page = NULL;
   149					goto err;
   150				}
   151	
   152				memset(hv_cpu->synic_message_page, 0, PAGE_SIZE);
   153				memset(hv_cpu->synic_event_page, 0, PAGE_SIZE);
   154			}
   155		}
   156	
   157		return 0;
   158	
   159	err:
   160		/*
   161		 * Any memory allocations that succeeded will be freed when
   162		 * the caller cleans up by calling hv_synic_free()
   163		 */
   164		return ret;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
