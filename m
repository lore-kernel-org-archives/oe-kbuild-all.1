Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36663153800
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317896; cv=none; b=u4tj2m1rDkI7Zu5hS/83VIikiVpRtaFJaJAfDT88nfCF0MI52vwoH26IHHLzwIwg+rvEB6jJ7NF3bXTCtvasqIDIfuIaH0FNGDDlW4o5+4c5/dxXbdVoCtvHVvwuvCJ7lNvplT3NyLkrvvcqj7EbYijfC1q3/RXj41vpcmOgDf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317896; c=relaxed/simple;
	bh=8daWUOsKuGRiMCeAsZdChIsRAipNZGh3Atz3ZxuTnpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMxCBI26qamTTXgebJHo21cvdMOqMcfC5hFGj+5nk+LjRw/zXtCIygeSJQQxaWECTl0RnvSNYINyLbP+/3Y/1pPblS3XaU3EPs+DNgVKjYoZBhXF2xsEuASVWsy68ohBjFbFmamCKSWWyX3MzOl5HKVuaO0KbUbhJZ5K0SGEnfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4Ln8pM0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4Ln8pM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317894; x=1778853894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8daWUOsKuGRiMCeAsZdChIsRAipNZGh3Atz3ZxuTnpw=;
  b=V4Ln8pM0bxMlxOjUNdv5hRLylLBTSUu9UfwRV72V64YR5bBFCaenPBvs
   tsukd0eiCrTX3/Aw+iBj9YdrgZJ1XbWkYTVPyZbyQHVZ2f+yCzTJ9we6G
   YchvQgSBlYXMTOFtn4oCxDlzdkXQHmUTpwER5pLMDWIOxF0XvXLuujrut
   o8IID3+f896AJNu2vl6q1dIry/JHSETWa+4wGwWH6K7BCJhUsC32EF2AC
   1DzdlBJzg3d6p4Ez+akrNMo2CTFawyL8jI5gaIki4+yZVF5qnLZK+6Hnz
   RY7ovsFOg2RAjR8ahiNVOZMlb1tH/PGgyUbypZvWVqM6ZM6e+esyflvxy
   A==;
X-CSE-ConnectionGUID: WgmEtBpISEiZwE25U8w1bQ==
X-CSE-MsgGUID: qYjGbSUYTXGbd/0vXb+KmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943623"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943623"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:04:52 -0700
X-CSE-ConnectionGUID: FvgjEvutQUaZEw7R41luNw==
X-CSE-MsgGUID: oUfluzNYTpChe3yAEn2MwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138778840"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 07:04:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZCa-0000F1-1T;
	Thu, 15 May 2025 14:04:48 +0000
Date: Thu, 15 May 2025 22:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous
 prototype for function 'tdm_service_run'
Message-ID: <202505150403.myIeqBlp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [2229/2229] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250515/202505150403.myIeqBlp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150403.myIeqBlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150403.myIeqBlp-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:15: warning: no previous prototype for function 'kprobe_symbol_address_byname' [-Wmissing-prototypes]
     243 | unsigned long kprobe_symbol_address_byname(const char *name)
         |               ^
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     243 | unsigned long kprobe_symbol_address_byname(const char *name)
         | ^
         | static 
   3 warnings generated.


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
   237	#if !IS_BUILTIN(CONFIG_TDM_KERNEL_GUARD)
   238	static int p_tmp_kprobe_handler(struct kprobe *p_ri, struct pt_regs *p_regs)
   239	{
   240		return 0;
   241	}
   242	
 > 243	unsigned long kprobe_symbol_address_byname(const char *name)
   244	{
   245		int p_ret;
   246		struct kprobe p_kprobe;
   247		unsigned long addr = 0;
   248	
   249		memset(&p_kprobe, 0, sizeof(p_kprobe));
   250	
   251		p_kprobe.pre_handler = p_tmp_kprobe_handler;
   252		p_kprobe.symbol_name = name;
   253	
   254		p_ret = register_kprobe(&p_kprobe);
   255		if (p_ret < 0) {
   256			pr_err("register_kprobe error [%d] :(\n", p_ret);
   257			return 0;
   258		}
   259	
   260		addr = (unsigned long)p_kprobe.addr;
   261		unregister_kprobe(&p_kprobe);
   262	
   263		return addr;
   264	}
   265	#endif
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
