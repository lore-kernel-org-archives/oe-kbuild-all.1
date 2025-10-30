Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFB437A3BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761806206; cv=none; b=gMMY8m/s7RBjhPrV4mvgJLvGtvdeF1UjbH2F6KEyYQiBGrsdeNcPvfUO89zSo8eFyx2iHNCb5GJYlus0LOS6k75U0wWo+je2QPzLGOBVCHSNyyDuMn1cyTmoRY3cjlAkBKRn+K4P9ezILa0h89vrqhHo8JCYlKAmfXkNh37g/rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761806206; c=relaxed/simple;
	bh=XQIJejRyBg3IdSBeZGwLQoDUPhfxDF30DgLUcLKR3c4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OI32slJOnO2XRwBQBf4mICQrca8PC+08JqnfTfdf50p2qA15PEydS8Ne5eXEtgU89yC/i797MazEdTAEP6I+eGDh5Ya3o80trHrxiZMVrGUnugBjr+39/gTtSNMU9soK0RYD2Rnm9o9RZjRmNK5aRCXOE5pnhN4H/cQpfG16NXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kfs5iHAH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kfs5iHAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761806204; x=1793342204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XQIJejRyBg3IdSBeZGwLQoDUPhfxDF30DgLUcLKR3c4=;
  b=Kfs5iHAHXAsXLTMzOffLTcVgLDYWumPgwkZB85VJXZvs6s2+qnKMyU3r
   cIEAi8cC2lCEEOmzBc21PhyTr9kpVyLSncoD6dzIqMZ2OaBtWSle1Cpma
   R2DNOjT71NDlUzXlyVq4bJDKK9RWf9LV+ojvFy/yOT8QVU9z1bjW0OJw1
   wG7J6veCeNqYZifEAzm3RbiWisg0bN4FVgHp+14bt+MfXxe4BUbIEYrZR
   Wd6UN1mEKn8DrUkaPlT0ZUgcHrINXkRykpfeTJR0WsqPWxh5SfM882ieI
   WICfsnsajWtMryx8PLHGJuuxyyVjuUYPn+lDkJp8P5vfetRTDo/c9PDKJ
   Q==;
X-CSE-ConnectionGUID: T77OIb2HSCyEIKcnPhlJOw==
X-CSE-MsgGUID: iGqLzG0tQM+4e5tBliaxsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67590564"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="67590564"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:36:43 -0700
X-CSE-ConnectionGUID: A3GvoLBVS4atTQZYkiy8ow==
X-CSE-MsgGUID: 5sCfE16PRe6qs5BQ6Uc0gQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2025 23:36:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEMH2-000LYC-0j;
	Thu, 30 Oct 2025 06:36:40 +0000
Date: Thu, 30 Oct 2025 14:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3257/3257] mm/mem_reliable.c:214:52: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202510301407.l2kqHqRB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   13f149450a6b4609c03a79beee0859dfe43ca949
commit: 714b582e1796fefd9d81f83fdc12a56390af1a99 [3257/3257] mm: Enable reliable memory for x86 platform
config: x86_64-randconfig-121-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301407.l2kqHqRB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301407.l2kqHqRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301407.l2kqHqRB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_reliable.c:214:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/mem_reliable.c:214:52: sparse:     expected void *
   mm/mem_reliable.c:214:52: sparse:     got void [noderef] __user *buffer
   mm/mem_reliable.c:234:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/mem_reliable.c:234:52: sparse:     expected void *
   mm/mem_reliable.c:234:52: sparse:     got void [noderef] __user *buffer
   mm/mem_reliable.c:298:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/mem_reliable.c:298:52: sparse:     expected void *
   mm/mem_reliable.c:298:52: sparse:     got void [noderef] __user *buffer
   mm/mem_reliable.c:332:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/mem_reliable.c:332:52: sparse:     expected void *
   mm/mem_reliable.c:332:52: sparse:     got void [noderef] __user *buffer
>> mm/mem_reliable.c:352:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/mem_reliable.c:352:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/mem_reliable.c:352:33: sparse:     got int ( * )( ... )
   mm/mem_reliable.c:359:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/mem_reliable.c:359:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/mem_reliable.c:359:33: sparse:     got int ( * )( ... )
   mm/mem_reliable.c:367:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/mem_reliable.c:367:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/mem_reliable.c:367:33: sparse:     got int ( * )( ... )
   mm/mem_reliable.c:375:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/mem_reliable.c:375:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/mem_reliable.c:375:33: sparse:     got int ( * )( ... )

vim +214 mm/mem_reliable.c

6e6cf0d7d67425 Chen Wandun 2022-11-11  205  
2525d04c630800 Ma Wupeng   2022-11-11  206  #ifdef CONFIG_SYSCTL
8968270eb5fbed Ma Wupeng   2022-11-11  207  static int reliable_limit_handler(struct ctl_table *table, int write,
8968270eb5fbed Ma Wupeng   2022-11-11  208  				  void __user *buffer, size_t *length,
8968270eb5fbed Ma Wupeng   2022-11-11  209  				  loff_t *ppos)
8968270eb5fbed Ma Wupeng   2022-11-11  210  {
8968270eb5fbed Ma Wupeng   2022-11-11  211  	unsigned long old = task_reliable_limit;
8968270eb5fbed Ma Wupeng   2022-11-11  212  	int ret;
8968270eb5fbed Ma Wupeng   2022-11-11  213  
8968270eb5fbed Ma Wupeng   2022-11-11 @214  	ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
8968270eb5fbed Ma Wupeng   2022-11-11  215  	if (ret == 0 && write) {
8968270eb5fbed Ma Wupeng   2022-11-11  216  		if (task_reliable_limit > PAGES_TO_B(total_reliable_pages()) ||
8968270eb5fbed Ma Wupeng   2022-11-11  217  		    task_reliable_limit <
8968270eb5fbed Ma Wupeng   2022-11-11  218  			    (task_reliable_used_pages() << PAGE_SHIFT)) {
8968270eb5fbed Ma Wupeng   2022-11-11  219  			task_reliable_limit = old;
8968270eb5fbed Ma Wupeng   2022-11-11  220  			return -EINVAL;
8968270eb5fbed Ma Wupeng   2022-11-11  221  		}
8968270eb5fbed Ma Wupeng   2022-11-11  222  	}
8968270eb5fbed Ma Wupeng   2022-11-11  223  
8968270eb5fbed Ma Wupeng   2022-11-11  224  	return ret;
8968270eb5fbed Ma Wupeng   2022-11-11  225  }
8968270eb5fbed Ma Wupeng   2022-11-11  226  
4021a0d53e3e0d Chen Wandun 2022-11-11  227  static int reliable_pagecache_max_bytes_write(struct ctl_table *table,
4021a0d53e3e0d Chen Wandun 2022-11-11  228  					      int write, void __user *buffer,
4021a0d53e3e0d Chen Wandun 2022-11-11  229  					      size_t *length, loff_t *ppos)
4021a0d53e3e0d Chen Wandun 2022-11-11  230  {
4021a0d53e3e0d Chen Wandun 2022-11-11  231  	unsigned long old_value = reliable_pagecache_max_bytes;
4021a0d53e3e0d Chen Wandun 2022-11-11  232  	int ret;
4021a0d53e3e0d Chen Wandun 2022-11-11  233  
4021a0d53e3e0d Chen Wandun 2022-11-11  234  	ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
4021a0d53e3e0d Chen Wandun 2022-11-11  235  	if (!ret && write) {
4021a0d53e3e0d Chen Wandun 2022-11-11  236  		if (reliable_pagecache_max_bytes >
4021a0d53e3e0d Chen Wandun 2022-11-11  237  		    PAGES_TO_B(total_reliable_pages())) {
4021a0d53e3e0d Chen Wandun 2022-11-11  238  			reliable_pagecache_max_bytes = old_value;
4021a0d53e3e0d Chen Wandun 2022-11-11  239  			return -EINVAL;
4021a0d53e3e0d Chen Wandun 2022-11-11  240  		}
4021a0d53e3e0d Chen Wandun 2022-11-11  241  	}
4021a0d53e3e0d Chen Wandun 2022-11-11  242  
4021a0d53e3e0d Chen Wandun 2022-11-11  243  	return ret;
4021a0d53e3e0d Chen Wandun 2022-11-11  244  }
4021a0d53e3e0d Chen Wandun 2022-11-11  245  
2525d04c630800 Ma Wupeng   2022-11-11  246  static void mem_reliable_feature_disable(int idx);
2525d04c630800 Ma Wupeng   2022-11-11  247  
2525d04c630800 Ma Wupeng   2022-11-11  248  #define CTRL_BITS_SHIFT MEM_RELIABLE_MAX
2525d04c630800 Ma Wupeng   2022-11-11  249  #define CTRL_BITS_MASK ((1 << CTRL_BITS_SHIFT) - 1)
2525d04c630800 Ma Wupeng   2022-11-11  250  
2525d04c630800 Ma Wupeng   2022-11-11  251  static unsigned long mem_reliable_ctrl_bits = CTRL_BITS_MASK;
2525d04c630800 Ma Wupeng   2022-11-11  252  
2525d04c630800 Ma Wupeng   2022-11-11  253  static void mem_reliable_ctrl_bit_disable(int idx)
2525d04c630800 Ma Wupeng   2022-11-11  254  {
2525d04c630800 Ma Wupeng   2022-11-11  255  	clear_bit(idx, &mem_reliable_ctrl_bits);
2525d04c630800 Ma Wupeng   2022-11-11  256  }
2525d04c630800 Ma Wupeng   2022-11-11  257  
2525d04c630800 Ma Wupeng   2022-11-11  258  static bool mem_reliable_ctrl_bit_is_enabled(int idx)
2525d04c630800 Ma Wupeng   2022-11-11  259  {
2525d04c630800 Ma Wupeng   2022-11-11  260  	return !!test_bit(idx, &mem_reliable_ctrl_bits);
2525d04c630800 Ma Wupeng   2022-11-11  261  }
2525d04c630800 Ma Wupeng   2022-11-11  262  
2525d04c630800 Ma Wupeng   2022-11-11  263  static void mem_reliable_parse_ctrl_bits(unsigned long ctrl_bits)
2525d04c630800 Ma Wupeng   2022-11-11  264  {
2525d04c630800 Ma Wupeng   2022-11-11  265  	bool status;
2525d04c630800 Ma Wupeng   2022-11-11  266  	int i;
2525d04c630800 Ma Wupeng   2022-11-11  267  
2525d04c630800 Ma Wupeng   2022-11-11  268  	for (i = MEM_RELIABLE_FALLBACK; i < MEM_RELIABLE_MAX; i++) {
2525d04c630800 Ma Wupeng   2022-11-11  269  		status = !!test_bit(i, &ctrl_bits);
2525d04c630800 Ma Wupeng   2022-11-11  270  
2525d04c630800 Ma Wupeng   2022-11-11  271  		if (mem_reliable_ctrl_bit_is_enabled(i) && !status)
2525d04c630800 Ma Wupeng   2022-11-11  272  			mem_reliable_feature_disable(i);
2525d04c630800 Ma Wupeng   2022-11-11  273  	}
2525d04c630800 Ma Wupeng   2022-11-11  274  }
2525d04c630800 Ma Wupeng   2022-11-11  275  
2525d04c630800 Ma Wupeng   2022-11-11  276  static void mem_reliable_disable_all(void)
2525d04c630800 Ma Wupeng   2022-11-11  277  {
2525d04c630800 Ma Wupeng   2022-11-11  278  	mem_reliable_ctrl_bits = 0;
2525d04c630800 Ma Wupeng   2022-11-11  279  
2525d04c630800 Ma Wupeng   2022-11-11  280  	reliable_allow_fallback = false;
2525d04c630800 Ma Wupeng   2022-11-11  281  	shmem_reliable = false;
2525d04c630800 Ma Wupeng   2022-11-11  282  	pagecache_use_reliable_mem = false;
2525d04c630800 Ma Wupeng   2022-11-11  283  	static_branch_disable(&mem_reliable);
2525d04c630800 Ma Wupeng   2022-11-11  284  
2525d04c630800 Ma Wupeng   2022-11-11  285  	pr_info("memory reliable feature disabled.\n");
2525d04c630800 Ma Wupeng   2022-11-11  286  }
2525d04c630800 Ma Wupeng   2022-11-11  287  
2525d04c630800 Ma Wupeng   2022-11-11  288  static int reliable_debug_handler(struct ctl_table *table, int write,
2525d04c630800 Ma Wupeng   2022-11-11  289  				  void __user *buffer, size_t *length,
2525d04c630800 Ma Wupeng   2022-11-11  290  				  loff_t *ppos)
2525d04c630800 Ma Wupeng   2022-11-11  291  {
2525d04c630800 Ma Wupeng   2022-11-11  292  	unsigned long old_ctrl_bits, new_ctrl_bits;
2525d04c630800 Ma Wupeng   2022-11-11  293  	static DEFINE_MUTEX(reliable_debug_mutex);
2525d04c630800 Ma Wupeng   2022-11-11  294  	int ret;
2525d04c630800 Ma Wupeng   2022-11-11  295  
2525d04c630800 Ma Wupeng   2022-11-11  296  	mutex_lock(&reliable_debug_mutex);
2525d04c630800 Ma Wupeng   2022-11-11  297  	old_ctrl_bits = mem_reliable_ctrl_bits;
2525d04c630800 Ma Wupeng   2022-11-11  298  	ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
2525d04c630800 Ma Wupeng   2022-11-11  299  	if (ret == 0 && write) {
2525d04c630800 Ma Wupeng   2022-11-11  300  		if (!mem_reliable_is_enabled() ||
2525d04c630800 Ma Wupeng   2022-11-11  301  		    (mem_reliable_ctrl_bits > (1 << CTRL_BITS_SHIFT) - 1)) {
2525d04c630800 Ma Wupeng   2022-11-11  302  			mem_reliable_ctrl_bits = old_ctrl_bits;
2525d04c630800 Ma Wupeng   2022-11-11  303  			mutex_unlock(&reliable_debug_mutex);
2525d04c630800 Ma Wupeng   2022-11-11  304  
2525d04c630800 Ma Wupeng   2022-11-11  305  			return -EINVAL;
2525d04c630800 Ma Wupeng   2022-11-11  306  		}
2525d04c630800 Ma Wupeng   2022-11-11  307  
2525d04c630800 Ma Wupeng   2022-11-11  308  		new_ctrl_bits = mem_reliable_ctrl_bits;
2525d04c630800 Ma Wupeng   2022-11-11  309  		mem_reliable_ctrl_bits = old_ctrl_bits;
2525d04c630800 Ma Wupeng   2022-11-11  310  		if (!!test_bit(MEM_RELIABLE_ALL, &new_ctrl_bits))
2525d04c630800 Ma Wupeng   2022-11-11  311  			mem_reliable_parse_ctrl_bits(new_ctrl_bits);
2525d04c630800 Ma Wupeng   2022-11-11  312  		else
2525d04c630800 Ma Wupeng   2022-11-11  313  			mem_reliable_disable_all();
2525d04c630800 Ma Wupeng   2022-11-11  314  	}
2525d04c630800 Ma Wupeng   2022-11-11  315  
2525d04c630800 Ma Wupeng   2022-11-11  316  	mutex_unlock(&reliable_debug_mutex);
2525d04c630800 Ma Wupeng   2022-11-11  317  
2525d04c630800 Ma Wupeng   2022-11-11  318  	return ret;
2525d04c630800 Ma Wupeng   2022-11-11  319  }
2525d04c630800 Ma Wupeng   2022-11-11  320  
f30c7817f982da Ma Wupeng   2022-11-11  321  #ifdef CONFIG_SHMEM
f30c7817f982da Ma Wupeng   2022-11-11  322  static unsigned long sysctl_shmem_reliable_bytes_limit = ULONG_MAX;
f30c7817f982da Ma Wupeng   2022-11-11  323  
f30c7817f982da Ma Wupeng   2022-11-11  324  static int reliable_shmem_bytes_limit_handler(struct ctl_table *table,
f30c7817f982da Ma Wupeng   2022-11-11  325  					      int write, void __user *buffer,
f30c7817f982da Ma Wupeng   2022-11-11  326  					      size_t *length, loff_t *ppos)
f30c7817f982da Ma Wupeng   2022-11-11  327  {
f30c7817f982da Ma Wupeng   2022-11-11  328  	unsigned long *data_ptr = (unsigned long *)(table->data);
f30c7817f982da Ma Wupeng   2022-11-11  329  	unsigned long old = *data_ptr;
f30c7817f982da Ma Wupeng   2022-11-11  330  	int ret;
f30c7817f982da Ma Wupeng   2022-11-11  331  
f30c7817f982da Ma Wupeng   2022-11-11  332  	ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
f30c7817f982da Ma Wupeng   2022-11-11  333  	if (!ret && write) {
f30c7817f982da Ma Wupeng   2022-11-11  334  		if (*data_ptr > PAGES_TO_B(total_reliable_pages())) {
f30c7817f982da Ma Wupeng   2022-11-11  335  			*data_ptr = old;
f30c7817f982da Ma Wupeng   2022-11-11  336  			return -EINVAL;
f30c7817f982da Ma Wupeng   2022-11-11  337  		}
f30c7817f982da Ma Wupeng   2022-11-11  338  
f30c7817f982da Ma Wupeng   2022-11-11  339  		shmem_reliable_nr_page = *data_ptr >> PAGE_SHIFT;
f30c7817f982da Ma Wupeng   2022-11-11  340  	}
f30c7817f982da Ma Wupeng   2022-11-11  341  
f30c7817f982da Ma Wupeng   2022-11-11  342  	return ret;
f30c7817f982da Ma Wupeng   2022-11-11  343  }
f30c7817f982da Ma Wupeng   2022-11-11  344  #endif
f30c7817f982da Ma Wupeng   2022-11-11  345  
4021a0d53e3e0d Chen Wandun 2022-11-11  346  static struct ctl_table reliable_ctl_table[] = {
4021a0d53e3e0d Chen Wandun 2022-11-11  347  	{
4021a0d53e3e0d Chen Wandun 2022-11-11  348  		.procname = "reliable_pagecache_max_bytes",
4021a0d53e3e0d Chen Wandun 2022-11-11  349  		.data = &reliable_pagecache_max_bytes,
4021a0d53e3e0d Chen Wandun 2022-11-11  350  		.maxlen = sizeof(reliable_pagecache_max_bytes),
4021a0d53e3e0d Chen Wandun 2022-11-11  351  		.mode = 0644,
4021a0d53e3e0d Chen Wandun 2022-11-11 @352  		.proc_handler = reliable_pagecache_max_bytes_write,
4021a0d53e3e0d Chen Wandun 2022-11-11  353  	},
8968270eb5fbed Ma Wupeng   2022-11-11  354  	{
8968270eb5fbed Ma Wupeng   2022-11-11  355  		.procname = "task_reliable_limit",
8968270eb5fbed Ma Wupeng   2022-11-11  356  		.data = &task_reliable_limit,
8968270eb5fbed Ma Wupeng   2022-11-11  357  		.maxlen = sizeof(task_reliable_limit),
8968270eb5fbed Ma Wupeng   2022-11-11  358  		.mode = 0644,
8968270eb5fbed Ma Wupeng   2022-11-11  359  		.proc_handler = reliable_limit_handler,
8968270eb5fbed Ma Wupeng   2022-11-11  360  	},
f30c7817f982da Ma Wupeng   2022-11-11  361  #ifdef CONFIG_SHMEM
f30c7817f982da Ma Wupeng   2022-11-11  362  	{
f30c7817f982da Ma Wupeng   2022-11-11  363  		.procname = "shmem_reliable_bytes_limit",
f30c7817f982da Ma Wupeng   2022-11-11  364  		.data = &sysctl_shmem_reliable_bytes_limit,
f30c7817f982da Ma Wupeng   2022-11-11  365  		.maxlen = sizeof(sysctl_shmem_reliable_bytes_limit),
f30c7817f982da Ma Wupeng   2022-11-11  366  		.mode = 0644,
f30c7817f982da Ma Wupeng   2022-11-11  367  		.proc_handler = reliable_shmem_bytes_limit_handler,
f30c7817f982da Ma Wupeng   2022-11-11  368  	},
f30c7817f982da Ma Wupeng   2022-11-11  369  #endif
2525d04c630800 Ma Wupeng   2022-11-11  370  	{
2525d04c630800 Ma Wupeng   2022-11-11  371  		.procname = "reliable_debug",
2525d04c630800 Ma Wupeng   2022-11-11  372  		.data = &mem_reliable_ctrl_bits,
2525d04c630800 Ma Wupeng   2022-11-11  373  		.maxlen = sizeof(mem_reliable_ctrl_bits),
2525d04c630800 Ma Wupeng   2022-11-11  374  		.mode = 0600,
2525d04c630800 Ma Wupeng   2022-11-11  375  		.proc_handler = reliable_debug_handler,
2525d04c630800 Ma Wupeng   2022-11-11  376  	},
4021a0d53e3e0d Chen Wandun 2022-11-11  377  	{}
4021a0d53e3e0d Chen Wandun 2022-11-11  378  };
4021a0d53e3e0d Chen Wandun 2022-11-11  379  

:::::: The code at line 214 was first introduced by commit
:::::: 8968270eb5fbedb9c62e265e49228ef59a4f2321 mm: Add reliable memory use limit for user tasks

:::::: TO: Ma Wupeng <mawupeng1@huawei.com>
:::::: CC: Wang Wensheng <wangwensheng4@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
