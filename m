Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D50126BF1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751185930; cv=none; b=ebN+Hu+v2MWfNO27m9oDzbEBBNFY24VB3fqAqQHULK+GlDyipiFtI68m3YGao8NlXoD+mY7Wik6rgcDyB8sPSmyufFgdwl22vR0imoESUBzTloktSILxGBlmutO+iEnQQnwfSxejtOD287e2hX8QWa9gTEFO/US3K0NzRJUi9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751185930; c=relaxed/simple;
	bh=t6yhhtI/uUkkosT+itgueIjYTzNEhSfqBMJUfMoWtco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pv+Oqr6TjjwV0gVW389D0+z3sKOajZv11nNYTc4W6qzD2Gwa9jeS5rTDl6L4Vypsa46zIwNnodjD88f+yLhgdeU+9QQBiXnqcsXJjHVO7gqB3oBEzQ3V+IBDJryzZCZSXHPm0EndHQOGFYk//21dDNf0PuoIkIoGbBto7/Bgea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaMcD1y9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaMcD1y9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751185929; x=1782721929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t6yhhtI/uUkkosT+itgueIjYTzNEhSfqBMJUfMoWtco=;
  b=JaMcD1y94UDWybFXf65kdBQtiyJ/O/QH/4T93y9rq8/wAAakxtLAroop
   CVUyj6LMm+H3C0r40n8x3edT7H/dOIue4A63hAIFr+cl//x+Z37gN5+8L
   RRLSdaDpnS4wAu3THrHmEPfzN6Bppwtwe/zc8UvYkZJjgedA8iuXUrUZb
   aHlMa4h7PwZB8SfVmgsw7Huq/38xdhMJGIDQ5vo5HNq7heDQTpC3kLT1l
   V49Z0LK/Yy1z0LmLPJFK+kgqkRVd8F7zOi/c3ZFQNJKj3+K4vA8+Qf3do
   exCMKNdZVXiOJeLJsBBy2KXkaaVt8nx1zFJjaGgQzLylYH4hOl/6eKgN3
   w==;
X-CSE-ConnectionGUID: 8wc8TwW+Ty+lWlA1csfgtA==
X-CSE-MsgGUID: nl2PCn69Rmm5waMHSj2xrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53586004"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="53586004"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 01:32:08 -0700
X-CSE-ConnectionGUID: 64gLXPAeRnyHQ3HC4r+opQ==
X-CSE-MsgGUID: LSWRVfZNTkytB6oT3O8SHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="152810751"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jun 2025 01:32:07 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVnSH-0000sh-0Q;
	Sun, 29 Jun 2025 08:32:05 +0000
Date: Sun, 29 Jun 2025 10:31:35 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2411/2411]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous
 prototype for 'tdm_service_run'
Message-ID: <202506291019.RJatdUXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [2411/2411] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-buildonly-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250629/202506291019.RJatdUXf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291019.RJatdUXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506291019.RJatdUXf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


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
