Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8683019D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758610744; cv=none; b=MuDqNXbpM/uelkNODacc6Xdchjggz1rYSSOezL4Uho+GtXWIk0EQi+Rw5oqfZiMuVOtjOnR9eSWsQ+JZCmd/J39p2vA/7P1QP5W+YLZX+0vBeiZZnvXbXKBc1nJTUlG71KSBflM0LqoZNISvLiI3kBKoia0RJnFBBXxdrepKC48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758610744; c=relaxed/simple;
	bh=mFUI4bNm0zKnBM/hdVOBPvYufSFH2n+TmZcSNm1RmX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PH0ltgspTTK+VzpSroLVtYzIH2Uo3vkMuQeVDu4O29tga7cYOLQDauCLoQwZxcKtvA6kQJ6VGD1TNtvUh+J+r8Jh3KAPf95SD0uOtaEBLsoajGElrcM6d4MWRXt0Gyjd61WnLDDqmNy2Oo4SU6XS68NYNZszGsAH3PJOL3PSM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXT8Fx/E; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXT8Fx/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758610743; x=1790146743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mFUI4bNm0zKnBM/hdVOBPvYufSFH2n+TmZcSNm1RmX0=;
  b=SXT8Fx/EpheeC7GS1v8QVMcMUWThr+WotBOO5n5+aPsYw3CzCOFWfucl
   y7oDAW3oTZLg+l+dSB/kq26YbJVizn66p+wMmZDGEWHhurA6DmqR/bVPA
   iWlmhYc3ly7hQDfDXwqAciSRBJqxXnel9HL2MbBUPZ9SvNXIXTlGyJqzv
   S2De2Z8dX4isBQb9Bb7JQfYeGHsHnit6y/KDhRxA7uUDK93Tr8RI9b99l
   Ph8gE2nnGwQJpLzKmb3G7lvvK7tD7dkUKGG77btVgpUE0s5pVLeiy8y0V
   XDgUHKSu8smI7XWBT9L2vA6zJm6dSYREQr8tIHk+16AUbmhOYNbcXQe4u
   A==;
X-CSE-ConnectionGUID: TW6QlusRTk6nSIXEQfIuxA==
X-CSE-MsgGUID: t4ne3Gi3S6meE0rdlrJ2Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60102185"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="60102185"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 23:59:00 -0700
X-CSE-ConnectionGUID: 0Rb/zh6kRm2lp5q+nXN4dg==
X-CSE-MsgGUID: qSBmkKC7SB6yh12LEhpUJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="176284143"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2025 23:58:59 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0wzI-0002pp-30;
	Tue, 23 Sep 2025 06:58:56 +0000
Date: Tue, 23 Sep 2025 14:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2909/2909] mm/mem_sampling.c:293:1: sparse:
 sparse: symbol 'mm_damon_mem_sampling' was not declared. Should it be
 static?
Message-ID: <202509231424.83tDZFT5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   be758a5796c3d280deb877699c41fd0cd04e1deb
commit: 2e9ef6c3ea086c85d489898471e527aeb3f7460b [2909/2909] mm/damon/vaddr: Support hardware-assisted memory access sampling
config: arm64-randconfig-r121-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231424.83tDZFT5-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231424.83tDZFT5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231424.83tDZFT5-lkp@intel.com/

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
