Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8D3207
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 00:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730160757; cv=none; b=uwefPUcYzXo0dyXS1tFvV9g/W1ds1OEp5wKeXSijrRZZSDxmgLE2Ln7IJjMhr2SyJM1spvHXogrrnGADwu5CsbRoC0TEuXENGDRJE+8NAYZZQzQhuaU0CPrKydjukGXsWEWSNthy9vLL3rKGauerLTr+Lk22tYTJEzZ2Amh0LIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730160757; c=relaxed/simple;
	bh=ioKV80Uqy8ffnpwuv+bo2temtWUnlZsZ04Od6tkSakQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cec22sXhzTKceVCIti3OvMWCpn9w+ssQPuRLWEXMLVNBI3wVEy57yRus4Me59J+XlJl9lIiwZtfcawFCqznmahO8HU8HHKgeIklc3eFtrkBSFCBJrT8BjjOvNGU2ToZJr4v933sKi++c0cwNEsVWdE5nmP9o+gZu3QSOspQVIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgsZQB+a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgsZQB+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730160754; x=1761696754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ioKV80Uqy8ffnpwuv+bo2temtWUnlZsZ04Od6tkSakQ=;
  b=MgsZQB+a0ILPDDlSmDCQ44pMg0xWUksWRZZTEhWDnvP3zcG2mYC8QcDf
   2DI50res4EWeeSoaud+ChwTYi3JEZVRQbYw90gyHFHkzAEqzMZYrPh9bF
   fBsMkaQEuHK3D6Z9q47nh95mZH8k9Dfbx7kBS/0utpIcqBV9iAQ4cBETq
   ALIHDx/msj0DvrGDPjlixMdeMTFpJT+jkxn2kWwmOcn6A4YIE+mpcJG+h
   c0Bmdb7f7jQ64cOPaIEwsCodVKMPFwVya4WGxf7Ws7TKHGjFMlkI71heM
   7yh/0GD/11wbhb+YZKH1O9U7+3wqGAgOoCqTR/t3bG3nRdX/ojzW5j4Rq
   g==;
X-CSE-ConnectionGUID: gR+nU6sqQsm4fmjldwxhvg==
X-CSE-MsgGUID: LbyrcbFsQQa5/mk4sQFSDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="40360464"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="40360464"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 17:12:34 -0700
X-CSE-ConnectionGUID: Y6DCyJKhTgmo6vGXVOXS/Q==
X-CSE-MsgGUID: 4xeJJUODRqCd7+C4WjOLEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="81343834"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2024 17:12:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5ZqY-000d2w-1V;
	Tue, 29 Oct 2024 00:12:30 +0000
Date: Tue, 29 Oct 2024 08:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 15345/30000] mm/memcontrol.c:5402:40: error:
 implicit declaration of function 'ksm_process_profit'
Message-ID: <202410290835.BHKldai7-lkp@intel.com>
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
head:   8dcdd5a432518f8f8deb6ab608551ecda71bda40
commit: 0f6fb3570be40b783d8c756d64297be1a8e3d2b3 [15345/30000] memcg: support ksm merge any mode per cgroup
config: x86_64-buildonly-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290835.BHKldai7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290835.BHKldai7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290835.BHKldai7-lkp@intel.com/

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
