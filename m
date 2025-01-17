Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3B51ABED9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 22:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737152204; cv=none; b=GATDiKpu8YX/AkqwVpaBY/hKzzZxjcM4s2FaKbbMYq36jwLWmsUI8tPoJk0MtQv+20IeMRm/CacFrI1rOLPrwCQTny/i7ufOBvlcLCgQwUfkm1R/sgzKs6eAu8azoyFKWGVCUe4XfmxKy/agURl8hd7oulweIPnGzqizM1crdnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737152204; c=relaxed/simple;
	bh=q0uag4saSSepKbCuspi2MRKZX9SlhJpj6FurMqo4Q4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tw/eRHWrt/HxuhAGYlmRkM01jc0+9CySzU6PEkGZWx6F1OhltuQunFo2PilRD1wV875ANRyji57pneu2VIX/NTJIsBgkUkSaRAOOxD71nlrGFexOk0uHmgobWd9K6kSlNQG14lYMjMuAsZxB3UwybNenTh0nkdv3DIG4ujsPbY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqHHnefE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqHHnefE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737152203; x=1768688203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q0uag4saSSepKbCuspi2MRKZX9SlhJpj6FurMqo4Q4Q=;
  b=aqHHnefEI25+MD1F4gT8w/VtagvE15wAZ1h/N4qcs0QpkQZ0+2RqL2Cp
   Exhd6ANE8ucJc/CqZLJVPw0b/Kkw0sWdt1I2VFhA5ujuY/s9GT8JEI5pd
   3riCuBtUMJ2WqFhUVWEAISXL4nqdiNH9LAn6/Khym3rNy6c0nWDs3bDp9
   a+26//Do0v6fYIwdPz2ysYTh+1YgrXqU2taSGzOyQV7ungVEDXtNncq4r
   ycs6FLb8pRUZwB5t/DUOwQqZsJRRZWd1VSc2XoG1zEdJTyKk3WehujVd8
   46nNFXTrrqfhtEu/FeGLKdPQrRM0qjN3/gPgKs6IP0L5cbTq2kQsM+SRW
   A==;
X-CSE-ConnectionGUID: 7xQ3A2IJQbG2nE2jPJXu9A==
X-CSE-MsgGUID: lJJzxxRjS7ug/zv5ogWzdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37509520"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37509520"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 14:16:42 -0800
X-CSE-ConnectionGUID: VJPHOl46QzClIUDeeqdo/g==
X-CSE-MsgGUID: 2WOrK2LqTseh4YtXcMps3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="110922519"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2025 14:16:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYudq-000Tm1-2h;
	Fri, 17 Jan 2025 22:16:38 +0000
Date: Sat, 18 Jan 2025 06:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1826/1826] mm/mem_reliable.c:131:52: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202501180645.GOqTUifa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a5cbe5b715d9cac271b2c6175e728f0c4167f675
commit: 200321e8a69ef82350d070de35ac4a666ab79ba6 [1826/1826] mm: mem_reliable: Add limiting the usage of reliable memory
config: arm64-randconfig-r123-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180645.GOqTUifa-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20250118/202501180645.GOqTUifa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180645.GOqTUifa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_reliable.c:131:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/mem_reliable.c:131:52: sparse:     expected void *
   mm/mem_reliable.c:131:52: sparse:     got void [noderef] __user *buffer
   mm/mem_reliable.c:150:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/mem_reliable.c:150:52: sparse:     expected void *
   mm/mem_reliable.c:150:52: sparse:     got void [noderef] __user *buffer
   mm/mem_reliable.c:172:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/mem_reliable.c:172:52: sparse:     expected void *
   mm/mem_reliable.c:172:52: sparse:     got void [noderef] __user *buffer
>> mm/mem_reliable.c:190:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/mem_reliable.c:190:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/mem_reliable.c:190:33: sparse:     got int ( * )( ... )
   mm/mem_reliable.c:197:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/mem_reliable.c:197:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/mem_reliable.c:197:33: sparse:     got int ( * )( ... )
   mm/mem_reliable.c:205:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/mem_reliable.c:205:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/mem_reliable.c:205:33: sparse:     got int ( * )( ... )

vim +131 mm/mem_reliable.c

   123	
   124	static int reliable_pagecache_max_bytes_write(struct ctl_table *table,
   125						      int write, void __user *buffer,
   126						      size_t *length, loff_t *ppos)
   127	{
   128		unsigned long old_value = pagecache_reliable_limit;
   129		int ret;
   130	
 > 131		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   132		if (!ret && write) {
   133			if (pagecache_reliable_limit >
   134			    PAGES_TO_B(total_reliable_pages())) {
   135				pagecache_reliable_limit = old_value;
   136				return -EINVAL;
   137			}
   138		}
   139	
   140		return ret;
   141	}
   142	
   143	static int reliable_limit_handler(struct ctl_table *table, int write,
   144					  void __user *buffer, size_t *length,
   145					  loff_t *ppos)
   146	{
   147		unsigned long old = task_reliable_limit;
   148		int ret;
   149	
   150		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   151		if (!ret && write) {
   152			if (task_reliable_limit > PAGES_TO_B(total_reliable_pages()) ||
   153			    task_reliable_limit <
   154				    (task_reliable_used_pages() << PAGE_SHIFT)) {
   155				task_reliable_limit = old;
   156				return -EINVAL;
   157			}
   158		}
   159	
   160		return ret;
   161	}
   162	
   163	#ifdef CONFIG_SHMEM
   164	static int reliable_shmem_bytes_limit_handler(struct ctl_table *table,
   165						      int write, void __user *buffer,
   166						      size_t *length, loff_t *ppos)
   167	{
   168		unsigned long *data_ptr = (unsigned long *)(table->data);
   169		unsigned long old = *data_ptr;
   170		int ret;
   171	
   172		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   173		if (!ret && write) {
   174			if (*data_ptr > PAGES_TO_B(total_reliable_pages())) {
   175				*data_ptr = old;
   176				return -EINVAL;
   177			}
   178		}
   179	
   180		return ret;
   181	}
   182	#endif
   183	
   184	static struct ctl_table reliable_ctl_table[] = {
   185		{
   186			.procname = "reliable_pagecache_max_bytes",
   187			.data = &pagecache_reliable_limit,
   188			.maxlen = sizeof(pagecache_reliable_limit),
   189			.mode = 0644,
 > 190			.proc_handler = reliable_pagecache_max_bytes_write,
   191		},
   192		{
   193			.procname = "task_reliable_limit",
   194			.data = &task_reliable_limit,
   195			.maxlen = sizeof(task_reliable_limit),
   196			.mode = 0644,
   197			.proc_handler = reliable_limit_handler,
   198		},
   199	#ifdef CONFIG_SHMEM
   200		{
   201			.procname = "shmem_reliable_bytes_limit",
   202			.data = &shmem_reliable_limit,
   203			.maxlen = sizeof(shmem_reliable_limit),
   204			.mode = 0644,
   205			.proc_handler = reliable_shmem_bytes_limit_handler,
   206		},
   207	#endif
   208		{}
   209	};
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
