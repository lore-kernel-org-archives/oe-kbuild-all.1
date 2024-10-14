Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAC8E571
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 14:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915503; cv=none; b=l87oNfHqMqpSxIqCwzK0qzzeB7uwyfe87QiZO4YppNQIWWI2ZJEzVLwEBOJPoNjKSJq6DR9rbIwB1v74v/dqAa07hP2RC7wck1wbVc1Q6k3CsTD+I28cJc8MVJnnJJ45fmUZjvV7pOD0xamFpfodoDa/8123jAh8X8bzpomFmss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915503; c=relaxed/simple;
	bh=1gu0+jP4h1z4vpINpNyItu+7gAGY9ooBlxTL2UNRuxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H5vHnXpl2h8Dqx6AtTq8ErcPMnn1+MElnVzVZzp5z9hGAk+T8fqJe19j0wNcDng01bpupCS0JgxtOIpghomUNiSe2dUMFcRE55oxH/I4iS1kXnO2DHgQddeQ8FiHQJI6Y7aE3HjG/pxrebtVsxO6sCuyaALS1aeliMJ1/HUxM94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOqCU8dL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOqCU8dL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728915501; x=1760451501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1gu0+jP4h1z4vpINpNyItu+7gAGY9ooBlxTL2UNRuxA=;
  b=TOqCU8dL4CZFTQdiOoOHtaiQg2cbA8z1meftXhwBY6j7R87RC4VoCIWa
   IorAz25sOysi1wkHk1H0gvxSRMk3824BGJZsFFGLGVXGyEQAgWAsKziU2
   i3xOZoUolNDRXHC4HqUfkz9mvZ2eaJBigh4JyeKldWfoJs74YPVjO/cac
   nv24qvNb6wIBwBZHpmXLVLVYXDtlxlgneCMRvN9qZi791UwQ50OdDN5/V
   X+5YV3HY9TFHM0XQoYHMq6joZbPmMY2gqQtghOXjQPvz6EmY8IoEssNpR
   48l0c28ZmMLZTdjXRLww3vHoNC0jDvjR0HAoobDq5wwtqYjdo+MUFnpBU
   g==;
X-CSE-ConnectionGUID: gUGsP16pRui6sFizRAWkKQ==
X-CSE-MsgGUID: ugtnMNd3S5qz9QYPv/ULgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39645173"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="39645173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:18:09 -0700
X-CSE-ConnectionGUID: AeGNGHesQUqvJ+u15+/3CQ==
X-CSE-MsgGUID: ldOMJDPqQeyuybSJS+y62A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="100930199"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2024 07:18:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Lte-000FNB-0a;
	Mon, 14 Oct 2024 14:18:06 +0000
Date: Mon, 14 Oct 2024 22:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 15571/30000] mm/memcontrol.c:5402:40: error:
 implicit declaration of function 'ksm_process_profit'
Message-ID: <202410142209.nmkFxV8P-lkp@intel.com>
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
head:   748eeb7da1ecddfb1ace5ec61a512befe217702e
commit: 0f6fb3570be40b783d8c756d64297be1a8e3d2b3 [15571/30000] memcg: support ksm merge any mode per cgroup
config: x86_64-buildonly-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241014/202410142209.nmkFxV8P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410142209.nmkFxV8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410142209.nmkFxV8P-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memcontrol.c: In function 'memory_ksm_show':
>> mm/memcontrol.c:5402:40: error: implicit declaration of function 'ksm_process_profit' [-Werror=implicit-function-declaration]
    5402 |                 ksm_process_profits += ksm_process_profit(mm);
         |                                        ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
