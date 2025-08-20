Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D5627E7EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 22:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755730725; cv=none; b=GK2epxPL6K0pLfnt0Puyj9jTIWOCPkWg/sxzj//LIKaYeJEzEPjyMNMyJchDkBwTdF6MRTo7iFCtE/Vatr2QtQoiAokIuBgdvq3xKuMh+npyWlwhxBdL1FHSDKnjzvMrPxPqwu66NYWkKyLi5C1jp4uRmB1AHa7YGLNQzUN3xIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755730725; c=relaxed/simple;
	bh=ldA2F5SXeEDtqWf+5mYLegq/AYYUtkJN2V7g/+gMxys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lEBEG03sT5Nnr5mbMkUhKLsg4XWskardzjC9JA3D5JI073P2S668gq2Ad+vmzemVgeQZoqKV19YxEFr/xD/yoq+ozJIBNxP6OdbZ+HqVzaf6HQYJqZdB6nNlYaj0epZOySIf6UYwjDkl+IrP15nrK2rBKAw/BlXshyCs4F4bh9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTpcyUKy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTpcyUKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755730723; x=1787266723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ldA2F5SXeEDtqWf+5mYLegq/AYYUtkJN2V7g/+gMxys=;
  b=lTpcyUKybJmsMc9bOsyF+0dzf4OqhJndKQDNFsG/RD8ruEPAKYRz2MoS
   w2ToFVLvFCEtvliTpyLZcqUwFrYuEUizW8qwV4vEm8GNHjwdDe4RbJ9j/
   wkZGQkuX27JcnUrlcZppzY6rh9/W/hkI0z6x5Kg71/9XYndd/38lUr5pv
   SvJf4P9+iAU6+h2JrK/TggsMQHcfWPIhjjMsqNUK4pERdKnfiAxxYxzLV
   TaR8SmmsAHK2yycOdA0CNIod0ltqOkxtkGX9knIpNLIQrr/6ufXVqOcZa
   +deiZSPl8Olyawfhy22iFnABlsvPgzUQb1YNu0ZS/6zn4WUkHIDAlGr4K
   g==;
X-CSE-ConnectionGUID: FJ2mceahS5uSdatgmc1nfw==
X-CSE-MsgGUID: 4Islqb3dTtyz1iyn6vb6Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="60638122"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="60638122"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 15:58:42 -0700
X-CSE-ConnectionGUID: +3B3DvbiTo2gKexfSinjOw==
X-CSE-MsgGUID: bAKA708FSSqEWe6zo9cMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168613188"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2025 15:58:41 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uorlP-0001cp-1V;
	Wed, 20 Aug 2025 22:58:39 +0000
Date: Thu, 21 Aug 2025 00:58:03 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3135/3135] mm/memcontrol.c:5402:40: error:
 implicit declaration of function 'ksm_process_profit'
Message-ID: <202508210046.tLQzvmwk-lkp@intel.com>
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
head:   28d3b936dc6be28156ddfb85879ccdf7b3cf2ded
commit: 0f6fb3570be40b783d8c756d64297be1a8e3d2b3 [3135/3135] memcg: support ksm merge any mode per cgroup
config: x86_64-buildonly-randconfig-2002-20250820 (https://download.01.org/0day-ci/archive/20250821/202508210046.tLQzvmwk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210046.tLQzvmwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210046.tLQzvmwk-lkp@intel.com/

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
