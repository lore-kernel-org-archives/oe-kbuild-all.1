Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05132500AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 04:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732509962; cv=none; b=s+Zvq3mwK9tW4V11xdC0eXGJ2KIY90fzdcY3CWbGYnCNikyFTyoInJSxdxDN0bzsEGBpQ+Ve1eFRHHUiHreON3H2IsQIBPtgopXZU6bteNpNZOMYmlcGRjuib2En1GA0P9ovUpv6ITN7PZ9fh0X1Wg4unEzrdd7HfadAHiePO48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732509962; c=relaxed/simple;
	bh=qyXGkNXwN716pREKDjann4GfuGsJBPFzUU9WPKE/SvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUK4tFdajHKN11yvLjb21c1H7WSIp9NaRZ6utZxonst01/MgqXUVlM7JX34RQD58D6Y0zJUlbwhEN1EN9RiYZDUgEjcdvCW6EHpEF5cZu/XJrbWxvxcZY+KYFW1RuppORw4/mttqB0ap2jg0kQjcYjNtPjQaMiWkQ+EHxMKWyS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hm+vQDBm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hm+vQDBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732509960; x=1764045960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qyXGkNXwN716pREKDjann4GfuGsJBPFzUU9WPKE/SvI=;
  b=hm+vQDBmfxNEaJHNKgpW8R0lu8DgBN6gPu3T+Q2cxn0DtW5udhe/tk8d
   rK47LMfLBrPv6ssTLCWl8QNGJhEiE/aCi6/Z96mlQ/UfkXTC0d/Ot4sLN
   ypeF6q8ehZak/BeH7fjHEq5ueYxzD7ehjzNCF5CXFfoymc9yVRRwqQIL/
   8XA16MDkoge/SduMLh3kkYTsxFVYRvZAoBKVOf0NlajBkdGeXS10GtKbq
   mX+fbTbES3jPnXJJfGImKvakYFx5vnPQwwF3yJ3pn3lyVUV8esvODptmL
   9QiSRvSpb7ub8j2Qi/LpkAscR6bC0X1a9J2yzSavy74o9E2Jm0+FC7mrk
   w==;
X-CSE-ConnectionGUID: aiM/iyFFQBCmN/0PBNXSMw==
X-CSE-MsgGUID: vJIq4v77RvWX4XRsRHYdUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43097394"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43097394"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 20:45:59 -0800
X-CSE-ConnectionGUID: lBr86IXqQEiLCNye/7VnsQ==
X-CSE-MsgGUID: Icbo1psNSqCuygTclwe55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91110684"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Nov 2024 20:45:58 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFQyx-0005tr-2s;
	Mon, 25 Nov 2024 04:45:55 +0000
Date: Mon, 25 Nov 2024 12:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2415/2415] mm/memcontrol.c:5402:40: error:
 implicit declaration of function 'ksm_process_profit'
Message-ID: <202411251245.WgcEUBZC-lkp@intel.com>
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
head:   c09bf9815abdd0805b9c0cd61353271d7ecf156f
commit: 0f6fb3570be40b783d8c756d64297be1a8e3d2b3 [2415/2415] memcg: support ksm merge any mode per cgroup
config: x86_64-buildonly-randconfig-004-20241111 (https://download.01.org/0day-ci/archive/20241125/202411251245.WgcEUBZC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251245.WgcEUBZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251245.WgcEUBZC-lkp@intel.com/

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
