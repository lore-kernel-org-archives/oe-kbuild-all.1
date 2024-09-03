Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA6219005A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 18:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725386548; cv=none; b=F3CvcNi5Z5N5ic2Yl69W/MTXntxTfWfInAB8W6ELcXlz5rARzSdu0bj1PFYlq+ooTcYI5XGjfZEO9pdA4cQ2C1UccKA4Wb2fuDwMbL3jtLsSRdNbJeDH6377oZXXBNFVNI20ToMOM74Vr1A8YZyBkHjek0n0PaHg6wkRJ/RkdFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725386548; c=relaxed/simple;
	bh=VXFpBCxvZcmBUl7OL7sld3eIf1ZMmn6Ft1zrmnLu1mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PSLhtzXVKM3rez5RHucsejkNXaxcZgYgxZnmHaHsbx8xj33XmMb7P/L4Aldds+CDuOPeG0JvcuWPMh6vz7ecKX+tnYunNEgVznXdGyiq5BpVvFiwygpbRVNdavXr8JAwIdzQnYULJK4uL6vIiK6vC2BD0N60yFt9Id2sT9diVWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHdTCqWM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHdTCqWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725386546; x=1756922546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VXFpBCxvZcmBUl7OL7sld3eIf1ZMmn6Ft1zrmnLu1mg=;
  b=gHdTCqWMMgarqU7eziG7T10xJ6njLr57DCDbTZqR/NfHuRBPmnNkKNNq
   MiNRcaK8xd7Grz7YDkfCBlxtR2msgRR1fg1rdhzi/0tU4VDyiuBqJudMn
   XuJkRciXhNuaurxsTPY8pqlCqv9gXiUBsIhCX2hK3gFHsS/ktYQ5EUGvz
   y37PWP39dqaWtz8rQ0PU6jaXyCmuO0tBIIgssecTMescFv7iq1RqM3mqO
   FqgABqxZ4J/YTspVQ0vNWB7U+jH8D3dsxVkm4OBzDXDrtFGc0xe3ftmTV
   pLSuQAM8Z0sAMgTHapi/TrpFvVpImyKySgq3gvGCWUHK7L+SkMAIMGCDU
   w==;
X-CSE-ConnectionGUID: hwySwCK2RnWZ/S+Wh/hwDg==
X-CSE-MsgGUID: 58g5pEQ0RFmF0n+h/KLh7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46532665"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="46532665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 11:02:26 -0700
X-CSE-ConnectionGUID: co4eCvCdQ2+jEnQ18xREDw==
X-CSE-MsgGUID: WFdrbHvjTlC6Pj6MlGD3jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="102409509"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Sep 2024 11:02:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slXrC-00070S-1Q;
	Tue, 03 Sep 2024 18:02:22 +0000
Date: Wed, 4 Sep 2024 02:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 16259/30000] mm/memcontrol.c:5402:40: error:
 implicit declaration of function 'ksm_process_profit'
Message-ID: <202409040111.5iXDLbsV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b7bed6628b750ffd687d1da0a170dece4b0c08bd
commit: 0f6fb3570be40b783d8c756d64297be1a8e3d2b3 [16259/30000] memcg: support ksm merge any mode per cgroup
config: x86_64-buildonly-randconfig-004-20240903 (https://download.01.org/0day-ci/archive/20240904/202409040111.5iXDLbsV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040111.5iXDLbsV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040111.5iXDLbsV-lkp@intel.com/

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
