Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414BB9479
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742898919; cv=none; b=ladlKpT2L207QENeCygb43F7sS23pF4LJq2lEXakL6Hthmr88mZJ2KEQz4LXH9wgQWAerAiVGpKsfr2G/LTM6tSrfVcQ9JGQ2PYtBuGPpkMXWsN9COfCBuVmgHRafvK3PVgcE86W/+WAeSJq2o7/pBung+RNQClq2+3xrJXKLbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742898919; c=relaxed/simple;
	bh=ycP3mMQPAOKzKDKjIDVVYewp4IUPamtXf7w5T6JOlUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LLs4zuygCpK/ltAyNphTe+KBPtabTCf7i/U8GvpIQkvgKExyB373KTnRSLHlBRSS1B5GeVPDIEnLTtIm8eVHKe8q3INTspAv/uCqMkPymq60cpNJdI1p/W+EwS6XsM+4yIhF9W5NBId+vizqHBU8IRQgWd7BouLzmZiUUmEkCDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOOikI76; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOOikI76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742898917; x=1774434917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ycP3mMQPAOKzKDKjIDVVYewp4IUPamtXf7w5T6JOlUU=;
  b=KOOikI76IWmO6tH5dIKyphjSJIWAqq3WYoUbX9AIP1U9erxzt6tssk7R
   PiG5sZA3eXb3uYv9cil4goPRGuTehb4ug2XbjLsMF7akadmitTkhA5ebH
   +IlQi3yIK86xIN2gC+dFfFav+7Eo4/jbwuIyepVlKmiIvCtRzTTpnHBf7
   opTGLOVG5R3C7wTv8o9aXeMwmDu1bQh0YBbv3ATP8eS6fJoRmLZjZQEJB
   z3d2iH4TSw9Zf6tIO53ontLP/olvlYIG7bLda76Ao6XAeb1fL7J0XXvhq
   V399eRO5b9ovE0qAaOt5jpWZMtHY/C8OXl0X8g2V/+h7fS8ApZOKPLkMT
   A==;
X-CSE-ConnectionGUID: Bhl5/HNhS9iVZpfjux33qQ==
X-CSE-MsgGUID: 7NQF2aJiRGWU19k7KjMXZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55508808"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="55508808"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 03:35:17 -0700
X-CSE-ConnectionGUID: kdXXtvksRvaYETe9stiWug==
X-CSE-MsgGUID: RKcen/ugQui/vaD3FKpOkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="124294339"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Mar 2025 03:35:15 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx1cn-0004IZ-21;
	Tue, 25 Mar 2025 10:35:13 +0000
Date: Tue, 25 Mar 2025 18:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2059/2059]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: sparse: sparse: symbol
 'tdm_service_run' was not declared. Should it be static?
Message-ID: <202503251859.zDW2wWzp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0278be80a99934144f0e708459f3475248f280c4
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [2059/2059] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-randconfig-121-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251859.zDW2wWzp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251859.zDW2wWzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251859.zDW2wWzp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: sparse: sparse: symbol 'tdm_service_run' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: sparse: sparse: symbol 'tdm_service_exit' was not declared. Should it be static?

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
