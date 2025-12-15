Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794572EC0A6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 06:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765780222; cv=none; b=dOC8jrmV/1cA1fMxHB6/oGQZRc5PDIuYICyu5T25DR91vp3FxBGh5yG9ofRn5WKk8fgGxHknZwA1SsVqGRVKaA8x+drKt7y2hyrO6gAGcf8Z3GyKdjlE43vWYNc3ygC7ObyX9KiW3shjb4kRgFd1OH2jHQbVtxtHm6pU+4lgu8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765780222; c=relaxed/simple;
	bh=MkxzsvyLcI0NFIPx/zjQBBU4jg/U1uqJy0L5A8jTu5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F+YBPCSmYhiNHp2hMDEmb75ryZrRpSOOc4BlwWjfxU7o5knk+4K/bugVA76iQ8aCwiTRnFmeEr/NCYOb6XLvSrctNL71BiI2tCI/JoJ8QggwzWuVQZcA0R9Kluw26+rE4EqbG3f3yzrxU5eK7N0TSLFdFPlNaW5IhO0bRZSnqYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EL9kjhV4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EL9kjhV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765780220; x=1797316220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MkxzsvyLcI0NFIPx/zjQBBU4jg/U1uqJy0L5A8jTu5U=;
  b=EL9kjhV40qv+GU1+IKHHyG63ktHlMsrTS/4s5q9zSBnAwqorzXy1NrvY
   zHtuHjwrolKH/t9uHSC8414FDK9ID0YwSRYiu9BYEgfxsER7yEtUVkvI2
   GFMatLqp79jyjyXIRKI5lngMTzh3hVi8kDzgpbatyCXcxxn/NWvTHf0f7
   lP8SZJrDeJIIuoJN9bMUwL+ZOnm2dZfd5hTvROKnhN03vbMXSuHp8a6nH
   0dPdI16Ufd+sP6vdhRba9iDrkpQezUpB2lB0E3cYnDnl/8NW9bfntHmWS
   H3/K8zAB29D2mmgPFz37hOKr8w6JMbYopvKA7hsZ31R/Tf7X5W634irtP
   g==;
X-CSE-ConnectionGUID: Kj/SH7nDSXawUmV5KEI1Sw==
X-CSE-MsgGUID: xUGtCVyFSdWHR2obERjG1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67552857"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67552857"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 22:30:17 -0800
X-CSE-ConnectionGUID: dAqiHwssT6yeg/Lm3WQY/A==
X-CSE-MsgGUID: 44dGAYesQwGsQ+f8mgrQ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228715789"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 22:30:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV262-000000009sS-1QcH;
	Mon, 15 Dec 2025 06:30:14 +0000
Date: Mon, 15 Dec 2025 14:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous
 prototype for function 'tdm_service_run'
Message-ID: <202512151453.5SnEFp7c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   81b22958142c03b02c766c79cd1554ebfa142be4
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [3542/3542] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-randconfig-012-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151453.5SnEFp7c-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151453.5SnEFp7c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151453.5SnEFp7c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/ccp/hygon/tdm-kernel-guard.c:15:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for function 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         | ^
         | static 
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for function 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         | ^
         | static 
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:308:23: error: use of undeclared identifier 'NR_syscalls'
     308 |                 eh_objs[SCT].size = NR_syscalls * sizeof(char *);
         |                                     ^
   3 warnings and 1 error generated.


vim +/tdm_service_run +151 drivers/crypto/ccp/hygon/tdm-kernel-guard.c

   150	
 > 151	int tdm_service_run(struct tdm_security_enhance *data)
   152	{
   153		int ret = 0;
   154		struct addr_range_info *addr_range = NULL;
   155	
   156		// Allocate memory for addr_range
   157		addr_range = kzalloc(sizeof(struct addr_range_info) + sizeof(struct addr_info), GFP_KERNEL);
   158		if (!addr_range) {
   159			ret = -DYN_ERR_MEM;
   160			pr_err("addr_range kzalloc memory failed\n");
   161			goto end;
   162		}
   163	
   164		// Fill in addr_range
   165		addr_range->count = 1;
   166		addr_range->addr[0].addr_start = data->vaddr;
   167		addr_range->addr[0].length = data->size;
   168		data->mem_range = addr_range;
   169	
   170		// Context configuration
   171		data->context |= TASK_CREATE_VADDR;
   172	
   173		// Allocate memory for authcode
   174		data->authcode = kzalloc(sizeof(struct authcode_2b) + AUTHCODE_MAX, GFP_KERNEL);
   175		if (!data->authcode) {
   176			ret = -DYN_ERR_MEM;
   177			pr_err("authcode_2b kzalloc memory failed\n");
   178			goto free_addr_range_info;
   179		}
   180	
   181		data->authcode->len = AUTHCODE_MAX;
   182	
   183		// Measurement data configuration
   184		data->mdata.hash_algo = HASH_ALGO_SM3;
   185		data->mdata.period_ms = 0;
   186		ret = calc_expected_hash((uint8_t *)data->vaddr, data->size,
   187			data->mdata.expected_measurement);
   188		if (ret) {
   189			pr_err("calculate expected hash failed!\n");
   190			goto free_authcode;
   191		}
   192	
   193		// Create and start tdm task
   194		ret = tdm_task_create_and_run(data);
   195		if (ret) {
   196			pr_err("tdm_task_create_and_run failed!\n");
   197			goto free_authcode;
   198		}
   199	
   200		return ret;
   201	
   202	free_authcode:
   203		kfree(data->authcode);
   204		data->authcode = NULL;
   205	free_addr_range_info:
   206		kfree(data->mem_range);
   207		data->mem_range = NULL;
   208	end:
   209		return ret;
   210	}
   211	
 > 212	int tdm_service_exit(struct tdm_security_enhance *data)
   213	{
   214		int ret = 0;
   215		int task_status = 0;
   216	
   217		task_status = psp_startstop_measure_task(data->task_id, data->authcode, false);
   218		if (task_status < 0) {
   219			ret = task_status;
   220			pr_err("task_id %d stop failed with 0x%x\n", data->task_id, ret);
   221			goto end;
   222		}
   223	
   224		// Waiting for the task to end
   225		msleep(40);
   226	
   227		psp_destroy_measure_task(data->task_id, data->authcode);
   228	
   229		kfree(data->authcode);
   230		data->authcode = NULL;
   231		kfree(data->mem_range);
   232		data->mem_range = NULL;
   233	end:
   234		return ret;
   235	}
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
