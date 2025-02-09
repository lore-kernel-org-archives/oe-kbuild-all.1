Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5860914A0A8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739110137; cv=none; b=oXlJneJOWXelObPv9tVpCCu+0WdV9sHlGono8ayowNpH3hlnNsdtMwQYYceuzUnKdX6l9EW62wMFnq+XJ8Je3n3GKTwGKC9y6QAhqRyc+Uhnw8FlERh5LDtoNNsAiJdX3aGA0gWh/Or0CioT/gij7nEvVt66WP+CBSUPXncwzKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739110137; c=relaxed/simple;
	bh=wQx0sMb4igQvQQ/6/wdXTqk9cSSkraunXRvLSXZaJfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NErDO8h749pbWJeUYZOIR2QNlQpZsFZZYPbQxeC73PS+za/bXi8q+ZFA0TVUWFMvq305tnVP7MakGsam7X8er3Tj4X2lGlnIKNXbvaVJm9xgwVSYuY+FKN1hvN/sm1CMPl6nNWmqUZPkJrJXZ/7Ofc2w7twxU+3sOyZg3Aqzbuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBQsuTZ2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBQsuTZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739110136; x=1770646136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQx0sMb4igQvQQ/6/wdXTqk9cSSkraunXRvLSXZaJfU=;
  b=dBQsuTZ22/EsYcYdjm9l2qq/gEuY+qgB0ouXpk2IKn2kxOobwFVaWroz
   QbrAg/vhIX5SM0UajuYK9+/vmUDP0iFyhvfNm0RZdz8GBlDHpP8egla0T
   jOTFSksIxXF3xACrWLr6Z1L04jVB0er3JnFd9XitIfqLCkvM61PGkaxfC
   BEjwv00dMExXgDL/Fc+6CTlYW35M26RRJATSDlopCnCOSbnbDgXhTWaR3
   byMpltqHatAInWiKzqLqll6dDCv/wCgQrggW1Nbc+aVtSTWyUVpaxOhHX
   8dnnfqjkV62PWfb2f+dBQ/JdsOOeIMsQ+4WwM4WwOZshdFHq8j2yFroLP
   A==;
X-CSE-ConnectionGUID: Kc5qrqW2TpGAeqVh9Jg5vQ==
X-CSE-MsgGUID: kh1kse+eT/iiFvbb+/hwSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39720124"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="39720124"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 06:08:55 -0800
X-CSE-ConnectionGUID: FQAyxtgnRXa7Xg9bN/pW/g==
X-CSE-MsgGUID: 0y119NPjTYWNhWemqSiGtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="116969352"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2025 06:08:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th7zP-0011XP-0j;
	Sun, 09 Feb 2025 14:08:51 +0000
Date: Sun, 9 Feb 2025 22:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1420/1420] mm/mem_reliable.c:349:5:
 sparse: sparse: symbol 'reliable_shmem_bytes_limit_handler' was not
 declared. Should it be static?
Message-ID: <202502092233.9edRdxQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: 7a36955e5c8808a4b45d826a127e136c97f2a6f8 [1420/1420] mm: Introduce shmem mirrored memory limit for memory reliable
config: arm64-randconfig-r131-20250208 (https://download.01.org/0day-ci/archive/20250209/202502092233.9edRdxQm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502092233.9edRdxQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502092233.9edRdxQm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mem_reliable.c:63:14: sparse: sparse: restricted gfp_t degrades to integer
   mm/mem_reliable.c:219:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
   mm/mem_reliable.c:292:5: sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it be static?
   mm/mem_reliable.c:325:5: sparse: sparse: symbol 'reliable_reserve_size_handler' was not declared. Should it be static?
>> mm/mem_reliable.c:349:5: sparse: sparse: symbol 'reliable_shmem_bytes_limit_handler' was not declared. Should it be static?
   mm/mem_reliable.c:219:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     219 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:292:5: warning: no previous prototype for 'reliable_debug_handler' [-Wmissing-prototypes]
     292 | int reliable_debug_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:325:5: warning: no previous prototype for 'reliable_reserve_size_handler' [-Wmissing-prototypes]
     325 | int reliable_reserve_size_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:349:5: warning: no previous prototype for 'reliable_shmem_bytes_limit_handler' [-Wmissing-prototypes]
     349 | int reliable_shmem_bytes_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_shmem_bytes_limit_handler +349 mm/mem_reliable.c

   348	
 > 349	int reliable_shmem_bytes_limit_handler(struct ctl_table *table, int write,
   350		void __user *buffer, size_t *length, loff_t *ppos)
   351	{
   352		unsigned long *data_ptr = (unsigned long *)(table->data);
   353		unsigned long old = *data_ptr;
   354		int ret;
   355	
   356		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   357		if (ret == 0 && write) {
   358			if (*data_ptr > total_reliable_mem_sz()) {
   359				*data_ptr = old;
   360				return -EINVAL;
   361			}
   362	
   363			shmem_reliable_nr_page = *data_ptr >> PAGE_SHIFT;
   364		}
   365	
   366		return ret;
   367	}
   368	#endif
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
