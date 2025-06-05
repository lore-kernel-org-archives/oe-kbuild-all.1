Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F471C6FF5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 04:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749099140; cv=none; b=Mb0nzs2/X407rgDHpAuOlX8wGoP/6KJEX7YZsoB7Jym52Avgwa2Z4WjknF2H9I0Km3ln4509sgQsZ/DPxET2Unt65ydQY07jtyFCv8CFNJXYTlmeTirtCZYyBtMT1kxjxoF+eUvB/fSvVNBL7tFmD/KsnWn3DHsuFAzvHkEhFGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749099140; c=relaxed/simple;
	bh=MFSK2xAoqx42bHAOTCjrpXBnNyFznmATG9aiyJFU/tA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+3lFhKYBk+CXdMIJDt/YfZfWOxiSYuB4DsfwFUstPCWm/28YQvCsj48sH4NAeHLLWC9TUlskasjQV2Bllo/gOYnv9BnCE/HHBTR8Pg7L/bB22Q439uplUo2J9kPW4J0NJoYiu68Ug8mtXuM0xXteqwX5B8kZ67kzcIzBnfhpJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xq7qRI0P; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xq7qRI0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749099138; x=1780635138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MFSK2xAoqx42bHAOTCjrpXBnNyFznmATG9aiyJFU/tA=;
  b=Xq7qRI0PrMdPCXr7YtWCBK7OpcyPQb1QXk7USchzuKP45TtLYOKhrvNM
   utOYzVq2ZgX64EjcpR/8L+iYE1tc7zzeFfZ3wdxHF4nekQGqUCqFoYwSq
   2CqC4ROGbrZMPKb96OdFNvD+g2JLa8wTQhU7CmSEtS701VUhMvgOoL2Vo
   3LluM5NL4UAZTzRnzm3EXJ02RaynZci08GKVKBMJvqCQfhKjF46iGAb1a
   ptb6aKdQGufuaIaZLTzc4FD+64c+lwYkLJntixdFdjgwON+JLREAg4bRU
   2yAyl31LtQBQj7clJPXDfdEDm1PnpFWyMlciodvtiPUy04OLybDhiv6qU
   w==;
X-CSE-ConnectionGUID: hLj26GDCQKiw0p6dOQVRAQ==
X-CSE-MsgGUID: OCpjkA/SQuS/mJP5Vxy1Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54864885"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="54864885"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 21:52:15 -0700
X-CSE-ConnectionGUID: 6c1NXbj9SS2Q7+myXYPtzw==
X-CSE-MsgGUID: wZBD59maQh29jYDlkKffKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="176266702"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2025 21:52:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN2aJ-0003jN-1t;
	Thu, 05 Jun 2025 04:52:11 +0000
Date: Thu, 5 Jun 2025 12:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2357/2357] mm/mem_sampling.c:293:1: sparse:
 sparse: symbol 'mm_damon_mem_sampling' was not declared. Should it be
 static?
Message-ID: <202506051214.xnjA9eFd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3160da23afe10e66040ac00ed17174cb467c79b3
commit: 2e9ef6c3ea086c85d489898471e527aeb3f7460b [2357/2357] mm/damon/vaddr: Support hardware-assisted memory access sampling
config: arm64-randconfig-r123-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051214.xnjA9eFd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506051214.xnjA9eFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051214.xnjA9eFd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mem_sampling.c:48:33: sparse: sparse: symbol 'mem_sampling_saved_state' was not declared. Should it be static?
   mm/mem_sampling.c:61:1: sparse: sparse: symbol 'mem_sampling_record_cb_list' was not declared. Should it be static?
   mm/mem_sampling.c:69:6: sparse: sparse: symbol 'mem_sampling_record_cb_register' was not declared. Should it be static?
   mm/mem_sampling.c:86:6: sparse: sparse: symbol 'mem_sampling_record_cb_unregister' was not declared. Should it be static?
>> mm/mem_sampling.c:293:1: sparse: sparse: symbol 'mm_damon_mem_sampling' was not declared. Should it be static?

vim +/mm_damon_mem_sampling +293 mm/mem_sampling.c

   292	
 > 293	DEFINE_STATIC_KEY_FALSE(mm_damon_mem_sampling);
   294	#ifdef CONFIG_DAMON_MEM_SAMPLING
   295	static void damon_mem_sampling_record_cb(struct mem_sampling_record *record)
   296	{
   297		struct damon_mem_sampling_fifo *damon_fifo;
   298		struct damon_mem_sampling_record domon_record;
   299		struct task_struct *task = NULL;
   300		struct mm_struct *mm;
   301	
   302		/* Discard kernel address accesses */
   303		if (record->virt_addr & (1UL << 63))
   304			return;
   305	
   306		task = find_get_task_by_vpid((pid_t)record->context_id);
   307		if (!task)
   308			return;
   309	
   310		mm = get_task_mm(task);
   311		put_task_struct(task);
   312		if (!mm)
   313			return;
   314	
   315		damon_fifo = mm->damon_fifo;
   316		mmput(mm);
   317	
   318		domon_record.vaddr = record->virt_addr;
   319	
   320		/* only the proc under monitor now has damon_fifo */
   321		if (damon_fifo) {
   322			if (kfifo_is_full(&damon_fifo->rx_kfifo))
   323				return;
   324	
   325			kfifo_in_locked(&damon_fifo->rx_kfifo, &domon_record,
   326					sizeof(struct damon_mem_sampling_record),
   327					&damon_fifo->rx_kfifo_lock);
   328			return;
   329		}
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
