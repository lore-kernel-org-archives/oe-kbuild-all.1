Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5423A6FB6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 01:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721180495; cv=none; b=gfqccvpfniz6pNoXfeAYLanP5o6wHlajixJJRyMoAGDJfXsQO9o1QJgQ5ndccEoYXYknw6CpOXbQVi13d3K6hrp/biqFjymzMwIvsqio9k0K0NJ2afhpDyOOJqcLkFC4Nlz0ohylteAtADq5e4NOqCwCzK0tS/cGwf2pMxt88ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721180495; c=relaxed/simple;
	bh=qbJH45YuLvziJw9a6o04WGYsFV0t/S9CD0kFPUlbR00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TqUrJp2gOFipY8wEQ985slZJvpq2IDim5KxlvDduc9b59axM1YzJFVuOMbXHWS5tX/PnLWeMByQEkhtVfasO5KbKByKZoxPhf37KNor4V+m6EMcn8osksB68Z22qSFSFJxuAX3HuXGGKVAzHZjPhDj+nT4RC3p8oa+1Zw/bG+e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhKcQzWP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhKcQzWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721180493; x=1752716493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qbJH45YuLvziJw9a6o04WGYsFV0t/S9CD0kFPUlbR00=;
  b=BhKcQzWPeuEWg/Mw8p1ncAQ9Jy9H7ISEgW6/Es0nyNyEUs+Wddu+ehOU
   SbZWUodciPvDPnKZR7Op/0YP80lm7pyYEZ4ebBLII5UU6LpcwsWKBs9BV
   C9glXLCI+dLYneqyovfsMQHUfa8ATIhUDlx+JjXKufdMcH3tPCuKDxJnB
   ds3yM5PV5z2pfPN0D0vKuCBk8Fo6Zihft1U6oyP/jzLECvaNNIeo7SJws
   jPB1ZEriFShwobiJ4U8E25VL/q/QLCj5i7K/yKTBMkx3phs5d5rokne6M
   /Pp/j4DRjBu+WBaDFytm2OLntd5VNXD5yI0GRQ/E0ezqfBuGURdsW8CbN
   g==;
X-CSE-ConnectionGUID: 64Pm+ze3R52Z4RaUzKng0Q==
X-CSE-MsgGUID: Fi2vX4N+TYCh1Po9a+XguQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18790461"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="18790461"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 18:41:33 -0700
X-CSE-ConnectionGUID: dWbBBkvZTFu586QkYV5GnQ==
X-CSE-MsgGUID: FjPQWf4URMO1crt2rcMfBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="50091766"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jul 2024 18:41:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTtfd-000frQ-1o;
	Wed, 17 Jul 2024 01:41:29 +0000
Date: Wed, 17 Jul 2024 09:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/protected-guest 3/6] drivers/hv/hv.c:132:31: error:
 implicit declaration of function 'set_memory_decrypted'
Message-ID: <202407170942.73IsuynN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/protected-guest
head:   81f07d5d3a25051dcd143600b617ab1d989cb0fd
commit: 8883e2f11ca0c27bb6b1ca6d1aa79a9a20576fd9 [3/6] arm64: mm: Add top-level dispatcher for internal mem_encrypt API
config: arm64-randconfig-r112-20240716 (https://download.01.org/0day-ci/archive/20240717/202407170942.73IsuynN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240717/202407170942.73IsuynN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170942.73IsuynN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hv/hv.c: In function 'hv_synic_alloc':
>> drivers/hv/hv.c:132:31: error: implicit declaration of function 'set_memory_decrypted' [-Wimplicit-function-declaration]
     132 |                         ret = set_memory_decrypted((unsigned long)hv_cpu->post_msg_page, 1);
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/hv/hv.c: In function 'hv_synic_free':
>> drivers/hv/hv.c:217:39: error: implicit declaration of function 'set_memory_encrypted' [-Wimplicit-function-declaration]
     217 |                                 ret = set_memory_encrypted((unsigned long)
         |                                       ^~~~~~~~~~~~~~~~~~~~
--
   drivers/hv/connection.c: In function 'vmbus_connect':
>> drivers/hv/connection.c:236:15: error: implicit declaration of function 'set_memory_decrypted' [-Wimplicit-function-declaration]
     236 |         ret = set_memory_decrypted((unsigned long)
         |               ^~~~~~~~~~~~~~~~~~~~
   drivers/hv/connection.c: In function 'vmbus_disconnect':
>> drivers/hv/connection.c:350:22: error: implicit declaration of function 'set_memory_encrypted' [-Wimplicit-function-declaration]
     350 |                 if (!set_memory_encrypted(
         |                      ^~~~~~~~~~~~~~~~~~~~
--
   drivers/hv/channel.c: In function '__vmbus_establish_gpadl':
>> drivers/hv/channel.c:453:15: error: implicit declaration of function 'set_memory_decrypted' [-Wimplicit-function-declaration]
     453 |         ret = set_memory_decrypted((unsigned long)kbuffer,
         |               ^~~~~~~~~~~~~~~~~~~~
>> drivers/hv/channel.c:547:22: error: implicit declaration of function 'set_memory_encrypted' [-Wimplicit-function-declaration]
     547 |                 if (!set_memory_encrypted((unsigned long)kbuffer, PFN_UP(size)))
         |                      ^~~~~~~~~~~~~~~~~~~~


vim +/set_memory_decrypted +132 drivers/hv/hv.c

3e7ee4902fe699 drivers/staging/hv/Hv.c Hank Janssen      2009-07-13   96  
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19   97  int hv_synic_alloc(void)
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19   98  {
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18   99  	int cpu, ret = -ENOMEM;
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  100  	struct hv_per_cpu_context *hv_cpu;
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  101  
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  102  	/*
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  103  	 * First, zero all per-cpu memory areas so hv_synic_free() can
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  104  	 * detect what memory has been allocated and cleanup properly
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  105  	 * after any failures.
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  106  	 */
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  107  	for_each_present_cpu(cpu) {
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  108  		hv_cpu = per_cpu_ptr(hv_context.cpu_context, cpu);
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  109  		memset(hv_cpu, 0, sizeof(*hv_cpu));
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  110  	}
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  111  
6396bb221514d2 drivers/hv/hv.c         Kees Cook         2018-06-12  112  	hv_context.hv_numa_map = kcalloc(nr_node_ids, sizeof(struct cpumask),
597ff72f3de850 drivers/hv/hv.c         Jia-Ju Bai        2018-03-04  113  					 GFP_KERNEL);
831bcbcead6668 drivers/hv/hv.c         Aditya Nagesh     2024-05-31  114  	if (!hv_context.hv_numa_map) {
9f01ec53458d9e drivers/hv/hv.c         K. Y. Srinivasan  2015-08-05  115  		pr_err("Unable to allocate NUMA map\n");
9f01ec53458d9e drivers/hv/hv.c         K. Y. Srinivasan  2015-08-05  116  		goto err;
9f01ec53458d9e drivers/hv/hv.c         K. Y. Srinivasan  2015-08-05  117  	}
9f01ec53458d9e drivers/hv/hv.c         K. Y. Srinivasan  2015-08-05  118  
421b8f20d3c381 drivers/hv/hv.c         Vitaly Kuznetsov  2016-12-07  119  	for_each_present_cpu(cpu) {
f25a7ece08bdb1 drivers/hv/hv.c         Michael Kelley    2018-08-10  120  		hv_cpu = per_cpu_ptr(hv_context.cpu_context, cpu);
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  121  
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  122  		tasklet_init(&hv_cpu->msg_dpc,
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  123  			     vmbus_on_msg_dpc, (unsigned long)hv_cpu);
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  124  
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  125  		if (ms_hyperv.paravisor_present && hv_isolation_type_tdx()) {
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  126  			hv_cpu->post_msg_page = (void *)get_zeroed_page(GFP_ATOMIC);
831bcbcead6668 drivers/hv/hv.c         Aditya Nagesh     2024-05-31  127  			if (!hv_cpu->post_msg_page) {
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  128  				pr_err("Unable to allocate post msg page\n");
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  129  				goto err;
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  130  			}
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  131  
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24 @132  			ret = set_memory_decrypted((unsigned long)hv_cpu->post_msg_page, 1);
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  133  			if (ret) {
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  134  				pr_err("Failed to decrypt post msg page: %d\n", ret);
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  135  				/* Just leak the page, as it's unsafe to free the page. */
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  136  				hv_cpu->post_msg_page = NULL;
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  137  				goto err;
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  138  			}
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  139  
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  140  			memset(hv_cpu->post_msg_page, 0, PAGE_SIZE);
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  141  		}
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  142  
faff44069ff538 drivers/hv/hv.c         Tianyu Lan        2021-10-25  143  		/*
faff44069ff538 drivers/hv/hv.c         Tianyu Lan        2021-10-25  144  		 * Synic message and event pages are allocated by paravisor.
faff44069ff538 drivers/hv/hv.c         Tianyu Lan        2021-10-25  145  		 * Skip these pages allocation here.
faff44069ff538 drivers/hv/hv.c         Tianyu Lan        2021-10-25  146  		 */
d3a9d7e49d1531 drivers/hv/hv.c         Dexuan Cui        2023-08-24  147  		if (!ms_hyperv.paravisor_present && !hv_root_partition) {
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  148  			hv_cpu->synic_message_page =
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  149  				(void *)get_zeroed_page(GFP_ATOMIC);
831bcbcead6668 drivers/hv/hv.c         Aditya Nagesh     2024-05-31  150  			if (!hv_cpu->synic_message_page) {
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  151  				pr_err("Unable to allocate SYNIC message page\n");
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  152  				goto err;
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  153  			}
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  154  
faff44069ff538 drivers/hv/hv.c         Tianyu Lan        2021-10-25  155  			hv_cpu->synic_event_page =
faff44069ff538 drivers/hv/hv.c         Tianyu Lan        2021-10-25  156  				(void *)get_zeroed_page(GFP_ATOMIC);
831bcbcead6668 drivers/hv/hv.c         Aditya Nagesh     2024-05-31  157  			if (!hv_cpu->synic_event_page) {
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  158  				pr_err("Unable to allocate SYNIC event page\n");
68f2f2bc163d44 drivers/hv/hv.c         Dexuan Cui        2023-08-24  159  
68f2f2bc163d44 drivers/hv/hv.c         Dexuan Cui        2023-08-24  160  				free_page((unsigned long)hv_cpu->synic_message_page);
68f2f2bc163d44 drivers/hv/hv.c         Dexuan Cui        2023-08-24  161  				hv_cpu->synic_message_page = NULL;
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  162  				goto err;
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  163  			}
faff44069ff538 drivers/hv/hv.c         Tianyu Lan        2021-10-25  164  		}
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  165  
68f2f2bc163d44 drivers/hv/hv.c         Dexuan Cui        2023-08-24  166  		if (!ms_hyperv.paravisor_present &&
e3131f1c81448a drivers/hv/hv.c         Dexuan Cui        2023-08-24  167  		    (hv_isolation_type_snp() || hv_isolation_type_tdx())) {
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  168  			ret = set_memory_decrypted((unsigned long)
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  169  				hv_cpu->synic_message_page, 1);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  170  			if (ret) {
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  171  				pr_err("Failed to decrypt SYNIC msg page: %d\n", ret);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  172  				hv_cpu->synic_message_page = NULL;
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  173  
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  174  				/*
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  175  				 * Free the event page here so that hv_synic_free()
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  176  				 * won't later try to re-encrypt it.
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  177  				 */
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  178  				free_page((unsigned long)hv_cpu->synic_event_page);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  179  				hv_cpu->synic_event_page = NULL;
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  180  				goto err;
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  181  			}
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  182  
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  183  			ret = set_memory_decrypted((unsigned long)
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  184  				hv_cpu->synic_event_page, 1);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  185  			if (ret) {
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  186  				pr_err("Failed to decrypt SYNIC event page: %d\n", ret);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  187  				hv_cpu->synic_event_page = NULL;
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  188  				goto err;
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  189  			}
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  190  
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  191  			memset(hv_cpu->synic_message_page, 0, PAGE_SIZE);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  192  			memset(hv_cpu->synic_event_page, 0, PAGE_SIZE);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  193  		}
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  194  	}
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  195  
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  196  	return 0;
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  197  
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  198  err:
572086325ce9a9 drivers/hv/hv.c         Michael Kelley    2018-08-02  199  	/*
572086325ce9a9 drivers/hv/hv.c         Michael Kelley    2018-08-02  200  	 * Any memory allocations that succeeded will be freed when
572086325ce9a9 drivers/hv/hv.c         Michael Kelley    2018-08-02  201  	 * the caller cleans up by calling hv_synic_free()
572086325ce9a9 drivers/hv/hv.c         Michael Kelley    2018-08-02  202  	 */
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  203  	return ret;
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  204  }
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  205  
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  206  void hv_synic_free(void)
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  207  {
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  208  	int cpu, ret;
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  209  
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  210  	for_each_present_cpu(cpu) {
831bcbcead6668 drivers/hv/hv.c         Aditya Nagesh     2024-05-31  211  		struct hv_per_cpu_context *hv_cpu =
831bcbcead6668 drivers/hv/hv.c         Aditya Nagesh     2024-05-31  212  			per_cpu_ptr(hv_context.cpu_context, cpu);
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  213  
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  214  		/* It's better to leak the page if the encryption fails. */
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  215  		if (ms_hyperv.paravisor_present && hv_isolation_type_tdx()) {
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  216  			if (hv_cpu->post_msg_page) {
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24 @217  				ret = set_memory_encrypted((unsigned long)
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  218  					hv_cpu->post_msg_page, 1);
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  219  				if (ret) {
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  220  					pr_err("Failed to encrypt post msg page: %d\n", ret);
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  221  					hv_cpu->post_msg_page = NULL;
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  222  				}
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  223  			}
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  224  		}
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  225  
68f2f2bc163d44 drivers/hv/hv.c         Dexuan Cui        2023-08-24  226  		if (!ms_hyperv.paravisor_present &&
e3131f1c81448a drivers/hv/hv.c         Dexuan Cui        2023-08-24  227  		    (hv_isolation_type_snp() || hv_isolation_type_tdx())) {
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  228  			if (hv_cpu->synic_message_page) {
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  229  				ret = set_memory_encrypted((unsigned long)
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  230  					hv_cpu->synic_message_page, 1);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  231  				if (ret) {
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  232  					pr_err("Failed to encrypt SYNIC msg page: %d\n", ret);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  233  					hv_cpu->synic_message_page = NULL;
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  234  				}
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  235  			}
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  236  
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  237  			if (hv_cpu->synic_event_page) {
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  238  				ret = set_memory_encrypted((unsigned long)
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  239  					hv_cpu->synic_event_page, 1);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  240  				if (ret) {
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  241  					pr_err("Failed to encrypt SYNIC event page: %d\n", ret);
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  242  					hv_cpu->synic_event_page = NULL;
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  243  				}
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  244  			}
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  245  		}
193061ea0a50c1 drivers/hv/hv.c         Tianyu Lan        2023-08-18  246  
23378295042a4b drivers/hv/hv.c         Dexuan Cui        2023-08-24  247  		free_page((unsigned long)hv_cpu->post_msg_page);
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  248  		free_page((unsigned long)hv_cpu->synic_event_page);
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  249  		free_page((unsigned long)hv_cpu->synic_message_page);
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  250  	}
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger 2017-02-11  251  
9f01ec53458d9e drivers/hv/hv.c         K. Y. Srinivasan  2015-08-05  252  	kfree(hv_context.hv_numa_map);
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  253  }
2608fb65310341 drivers/hv/hv.c         Jason Wang        2013-06-19  254  

:::::: The code at line 132 was first introduced by commit
:::::: 23378295042a4bcaeec350733a4771678e7a1f3a Drivers: hv: vmbus: Bring the post_msg_page back for TDX VMs with the paravisor

:::::: TO: Dexuan Cui <decui@microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
