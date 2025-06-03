Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91C8221F09
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 21:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748986194; cv=none; b=U9qiCQ39kCuU60+pAXHjDGrPEoTMX6RceFIJbUD0/vE4xMMavv5s9+ZmUikuatuvJ5zra9rI+sO5durRZEYv6bnM3H5I3CqzqW0DdncClw6AC2ZMMKWEFS+gCHZrKjXuxVJzhQ47KuSdx/qbQm9G6jpFejSqVS1ja4RQSovQ9Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748986194; c=relaxed/simple;
	bh=ZeFsTrB0ZwtZ0dBRuwb3uld0UvFB8AK/vgrpozbld6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JXHMw4In+WDFtXPL6DixkxcgYADxr8DKaS19GbgXa67iJsgnVXxAUOmiXDyu1nDOd7nCYO5iallGEMgUATEzQ/FINNnSMathwyn8Nnvs1wMiNDzsMhYXYKOqLOPTLWBp/Y/UBBNsh3KL+3ir15h3YaDsaw6zaCBRLfCfbaRjppk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtx2Issk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtx2Issk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748986193; x=1780522193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZeFsTrB0ZwtZ0dBRuwb3uld0UvFB8AK/vgrpozbld6k=;
  b=dtx2Issk20yfNEGdExMrErMki44vafWQqq39aMy0xIjVjIdiPcFFKfA8
   k/OQ5uEbPWfq9kMXfTyOaatA29VLLmk0fspjoOQ8+iCrT66hc0N8Wp9QO
   oBaOCB7oDvald12KxkxjNIzrjeB+TMTAe21jdFHyJkfCc7+4FW5XIyCWX
   x/xzjtGkFL7ifPzTeZGU9kEwpZtgNYY9oP/N6DNjgvfpVNUExKH36JHnd
   40gWuHk77qv8RLcA6WGW//LCHCDXGkQFhAHGrJFvjzVNFEkrotYei84s0
   fpqo5EUqQXgJTr9egiMST2feylfgeRxU99MmlH9Z7p7N0uKeM8IEVXgsz
   Q==;
X-CSE-ConnectionGUID: v7Gogdv/RD+eFv9GA+DX3w==
X-CSE-MsgGUID: ySPK2ZajQLq3PM6gKYeu7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50959213"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="50959213"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 14:29:52 -0700
X-CSE-ConnectionGUID: tfKDXzgnSzCMy3oxJudQyQ==
X-CSE-MsgGUID: VtYKARR9T8eQSLas8pnYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="149755641"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2025 14:29:51 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMZCe-0001Ze-2Y;
	Tue, 03 Jun 2025 21:29:48 +0000
Date: Wed, 4 Jun 2025 05:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] mm/memcontrol.c:5402:26: error:
 implicit declaration of function 'ksm_process_profit'
Message-ID: <202506040506.8yAlJEMb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: 0f6fb3570be40b783d8c756d64297be1a8e3d2b3 [2882/2882] memcg: support ksm merge any mode per cgroup
config: x86_64-buildonly-randconfig-2004-20250502 (https://download.01.org/0day-ci/archive/20250604/202506040506.8yAlJEMb-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506040506.8yAlJEMb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506040506.8yAlJEMb-lkp@intel.com/

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
