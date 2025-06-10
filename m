Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D63125B676
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 02:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749521936; cv=none; b=kGj1fERlI4L5w/DY9KCzQhcUz1ExJ4tT/K5KMMAVZleibzPEhf/x3TFejSqHK7iCxSoD5h1DidGKtUMfKoXTvOMz8AnzKuIZAVNcD4+x5YFCa+s98bOVAKjWBEihUGt/tfYF80eUiQEBj/irXaHo3OmmolO/KWsMUoACKmy6poI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749521936; c=relaxed/simple;
	bh=3bq6eYyTNy4xxWqLfnRL4WD5Pv5EeXo3/1V4BkFKL6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJ1O9cbcIdvv7dnxQZ56kSuDwlEXvoYAUTtFZh8V+rwyxnQ+EygYeky/5UvOexjr+1cyVhnKJNVoLsbi2K/pLzdmck8Z+TJINYdL/bhAbAkMX+Wu9uIe4CshfJQUMVwtbzorTEJcP7gB06tHbktemw74LRoBnNlg7hF1OR3Ov90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCE2styA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCE2styA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749521934; x=1781057934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3bq6eYyTNy4xxWqLfnRL4WD5Pv5EeXo3/1V4BkFKL6M=;
  b=LCE2styAdcAs634ng+bRSWrZ2xkkIpArwmKN0Po/ZRD7mcton6VM5KSd
   /kUCOM88FGz/Ml0vrAvXgnP2wmgN0oS6piISxOtECEEIrlqi8ISlEA6fJ
   70AdudC5YQtwpDf2ahwN4zeWgPt77dHZ0e5eQLWolxG02yRh7Bg9c0K5m
   lIsp0WWR7t+QzhqgulO7g25SYSic0Fiaoh8n9XBqcaDrq6uT49r0FfWJ/
   qJuVYfsUP0E/iszLX2l+6GW7VUmjhWZWxKMvnRBgkxvDdML7eHHnAmrG3
   b+mZox7FTAE06h1ED6Yn+TxqjdI9/MqVTaW4N59fb1UUlVIrk+623RB3/
   w==;
X-CSE-ConnectionGUID: z+ypBe/mR06rA/85xcuO8g==
X-CSE-MsgGUID: JK+qxlkxTvuJ1g34gOoUAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50841748"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="50841748"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 19:18:52 -0700
X-CSE-ConnectionGUID: VDP4aVUyQG+WnGaJ1rw/gw==
X-CSE-MsgGUID: wZ8UWS3GT+mO44i/KLcv7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="147254426"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2025 19:18:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOoZc-0007eT-2C;
	Tue, 10 Jun 2025 02:18:48 +0000
Date: Tue, 10 Jun 2025 10:18:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2380/2380] mm/mem_sampling.c:35:18: warning:
 unused variable 'mem_sampling_min_value'
Message-ID: <202506101037.VkwcnAFd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a7f4bf73c34996ee6cdda292e8f906a9c30879de
commit: 390982f28c5796a1e590381044630b768e6b9696 [2380/2380] mm/mem_sampling: Add sysctl control for NUMA balancing integration
config: arm64-randconfig-r112-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101037.VkwcnAFd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250610/202506101037.VkwcnAFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101037.VkwcnAFd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mem_sampling.c:68:6: warning: no previous prototype for function 'mem_sampling_record_cb_register' [-Wmissing-prototypes]
      68 | void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
         |      ^
   mm/mem_sampling.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
         | ^
         | static 
   mm/mem_sampling.c:85:6: warning: no previous prototype for function 'mem_sampling_record_cb_unregister' [-Wmissing-prototypes]
      85 | void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
         |      ^
   mm/mem_sampling.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      85 | void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
         | ^
         | static 
>> mm/mem_sampling.c:35:18: warning: unused variable 'mem_sampling_min_value' [-Wunused-const-variable]
      35 | static const int mem_sampling_min_value = MEM_SAMPLING_MIN_VALUE;
         |                  ^~~~~~~~~~~~~~~~~~~~~~
>> mm/mem_sampling.c:36:18: warning: unused variable 'mem_sampling_max_value' [-Wunused-const-variable]
      36 | static const int mem_sampling_max_value = MEM_SAMPLING_MAX_VALUE;
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +/mem_sampling_min_value +35 mm/mem_sampling.c

    34	
  > 35	static const int mem_sampling_min_value = MEM_SAMPLING_MIN_VALUE;
  > 36	static const int mem_sampling_max_value = MEM_SAMPLING_MAX_VALUE;
    37	
    38	/* keep track of who use the SPE */
    39	DEFINE_PER_CPU(enum arm_spe_user_e, arm_spe_user);
    40	EXPORT_PER_CPU_SYMBOL_GPL(arm_spe_user);
    41	
    42	enum mem_sampling_saved_state_e {
    43		MEM_SAMPLING_STATE_ENABLE,
    44		MEM_SAMPLING_STATE_DISABLE,
    45		MEM_SAMPLING_STATE_EMPTY,
    46	};
    47	enum mem_sampling_saved_state_e mem_sampling_saved_state = MEM_SAMPLING_STATE_EMPTY;
    48	
    49	/*
    50	 * Callbacks should be registered using mem_sampling_record_cb_register()
    51	 * by NUMA, DAMON and etc during their initialisation.
    52	 * Callbacks will be invoked on new hardware pmu records caputured.
    53	 */
    54	typedef void (*mem_sampling_record_cb_type)(struct mem_sampling_record *record);
    55	
    56	struct mem_sampling_record_cb_list_entry {
    57		struct list_head list;
    58		mem_sampling_record_cb_type cb;
    59	};
    60	LIST_HEAD(mem_sampling_record_cb_list);
    61	
    62	struct mem_sampling_numa_access_work {
    63		struct callback_head work;
    64		u64 vaddr, paddr;
    65		int cpu;
    66	};
    67	
    68	void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
    69	{
    70		struct mem_sampling_record_cb_list_entry *cb_entry, *tmp;
    71	
    72		list_for_each_entry_safe(cb_entry, tmp, &mem_sampling_record_cb_list, list) {
    73			if (cb_entry->cb == cb)
    74				return;
    75		}
    76	
    77		cb_entry = kmalloc(sizeof(struct mem_sampling_record_cb_list_entry), GFP_KERNEL);
    78		if (!cb_entry)
    79			return;
    80	
    81		cb_entry->cb = cb;
    82		list_add(&(cb_entry->list), &mem_sampling_record_cb_list);
    83	}
    84	
  > 85	void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
    86	{
    87		struct mem_sampling_record_cb_list_entry *cb_entry, *tmp;
    88	
    89		list_for_each_entry_safe(cb_entry, tmp, &mem_sampling_record_cb_list, list) {
    90			if (cb_entry->cb == cb) {
    91				list_del(&cb_entry->list);
    92				kfree(cb_entry);
    93				return;
    94			}
    95		}
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
