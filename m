Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2064E29B793
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762934972; cv=none; b=ZbQrxJigRR1D2xloMN3HGUSwxVMIxdpZQFIsmb79AP7RpB2Ghzm7oPuXGgrn6GpnjMLTBSINFd1in/K3K3ZpNmEHHdsvbROpfL2kG0sK0SAXZPciTfmKVW86hBJb4zg8jWQcYL8gThgPan6DdT9MwrpLkTygssCc2OIxPLU/cgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762934972; c=relaxed/simple;
	bh=2QxP35OhHsWgTq06Uon4G8bNG0l9ad4FHGsrYSpakao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtrO2weAm6uW/H0vx5Kd5celdViVdRWR3pvU/xKEy0OLVNFh/fmbMBczBQ814pIpuuSaNmh6FAvVJP1vYVDg40de4JmzjhVc8BZDKb6RyPZkkXr0b4/kZGSID5m1olYHRKGWcCfd+69NRhbp9Xe0lunjnL4kqXppbOZIBxnjbRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGGuMf2n; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGGuMf2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762934970; x=1794470970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2QxP35OhHsWgTq06Uon4G8bNG0l9ad4FHGsrYSpakao=;
  b=gGGuMf2nXOaDsy7f4Nhj1nslgycsS5pUJCkes3lNCjQ9fyo+kgy8tzLQ
   wo1TKeskQukJyxx9hoNhizFvoSnOgS57JG4OtyNJPRsfb448ad8iBE9Q8
   17HZP9w734d/oxeXA4IR/MexzjdQqWCKzO9f5zgR6k6PCvBna4x6dOBQC
   KohyUkyNkVkWlZwwmUFwCWCpLuSOKtxp70QFg8t7Ld3puq/jXL5xT0fhc
   DQOX+nEtSb+E66461Z7afdSc4Zwy25dTi8LlOA8P40uhiK4dTYN88yVyw
   DGaNkzPFR9oOWpnrQ+VRq+AcVnRj3AljYUxu9BgRmKn9fairQFCR0zSO1
   g==;
X-CSE-ConnectionGUID: 5T8wXqqNT+uxENAlETiuDA==
X-CSE-MsgGUID: ZpRO9D0kTVycdfZyc8p8gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="52552507"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="52552507"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 00:09:30 -0800
X-CSE-ConnectionGUID: CVAdG/LdTgC1s0Fic16BYw==
X-CSE-MsgGUID: RGPH8JxSRNCDbWm/iRyx4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="193542798"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Nov 2025 00:09:23 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ5ur-000409-1Q;
	Wed, 12 Nov 2025 08:09:21 +0000
Date: Wed, 12 Nov 2025 16:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3282/3282] mm/memcontrol.c:5402:26: error:
 implicit declaration of function 'ksm_process_profit'
Message-ID: <202511121630.TEi1Z7Hc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nanyong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   36c423f81858a53a2f8b9ac653a4ee48a6b4a3ae
commit: 0f6fb3570be40b783d8c756d64297be1a8e3d2b3 [3282/3282] memcg: support ksm merge any mode per cgroup
config: x86_64-buildonly-randconfig-004-20251112 (https://download.01.org/0day-ci/archive/20251112/202511121630.TEi1Z7Hc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121630.TEi1Z7Hc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121630.TEi1Z7Hc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:5402:26: error: implicit declaration of function 'ksm_process_profit' [-Werror,-Wimplicit-function-declaration]
    5402 |                 ksm_process_profits += ksm_process_profit(mm);
         |                                        ^
   1 error generated.


vim +/ksm_process_profit +5402 mm/memcontrol.c

  5379	
  5380	static int memory_ksm_show(struct seq_file *m, void *v)
  5381	{
  5382		unsigned long ksm_merging_pages = 0;
  5383		unsigned long ksm_rmap_items = 0;
  5384		long ksm_process_profits = 0;
  5385		unsigned int tasks = 0;
  5386		struct task_struct *task;
  5387		struct mm_struct *mm;
  5388		struct css_task_iter it;
  5389		struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
  5390	
  5391		css_task_iter_start(&memcg->css, CSS_TASK_ITER_PROCS, &it);
  5392		while ((task = css_task_iter_next(&it))) {
  5393			mm = get_task_mm(task);
  5394			if (!mm)
  5395				continue;
  5396	
  5397			if (test_bit(MMF_VM_MERGE_ANY, &mm->flags))
  5398				tasks++;
  5399	
  5400			ksm_rmap_items += mm->ksm_rmap_items;
  5401			ksm_merging_pages += mm->ksm_merging_pages;
> 5402			ksm_process_profits += ksm_process_profit(mm);
  5403			mmput(mm);
  5404		}
  5405		css_task_iter_end(&it);
  5406	
  5407		seq_printf(m, "merge any state: %d\n", READ_ONCE(memcg->ksm_merge_any));
  5408		seq_printf(m, "merge any tasks: %u\n", tasks);
  5409		seq_printf(m, "ksm_rmap_items %lu\n", ksm_rmap_items);
  5410		seq_printf(m, "ksm_merging_pages %lu\n", ksm_merging_pages);
  5411		seq_printf(m, "ksm_process_profits %ld\n", ksm_process_profits);
  5412		return 0;
  5413	}
  5414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
