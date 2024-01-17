Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622D25560
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 21:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705526362; cv=none; b=gJ6fAnMnLxbtHdOv/1wC8zQeKxZIMxEX/FSjtgifOH0p6+42eLgaDnAECT8tVkkXEbHOtjX7RP2HlGRQmvzIJvmWBbm0TtoQDkYp7QQHDA7DBC2D9vnaZm/ZvD/ZbVruOVC5yLF3blYiNk1MEjBa4BvvUlN8lfGETbh8etVF8Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705526362; c=relaxed/simple;
	bh=c0V2y36o/2h5LciWfHf/pJgoJZMlPZQSvMEvw/+SqHY=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=ggs2dauPfNR716bekG1PYSxa+czZQmFjXpXSFU17PVasd8O2TNFUyXhmqV5gDlg0AWfBxR67ZYsl1o12ibnuGq/IzLo9U2QTfqNo0LkCwtMuAcachaGpmvKPvX56miTms6vf58+ywDJ5rh8mwra79KBNo0EzSJmdhTZCIfmuatA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHSy6/Dp; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHSy6/Dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705526360; x=1737062360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c0V2y36o/2h5LciWfHf/pJgoJZMlPZQSvMEvw/+SqHY=;
  b=nHSy6/DpZ3gmv6SesHxFeKSmNOara0FR1Ugsdlc1V5a2tPoap0L9pn4V
   vffPmOLnqd2Lab+yHAc3n3jAu/VEqtcA1lJMHLb7hLv8wirxqYQCr7Gme
   o/Az/OgXljyq9m1UbkLGjPr9yRq7YphgC0WaPPx6WiG8cBsYgLiBtPIqR
   fcOa9iDuwLHDoYeVz03E/6aY9cdyjWToFmXcEiZRl8fAqyLm5lI2qaJuX
   oWDplgNRznRl01TJ4Ful5Gq/xmHn8HDRibn4csnYWQp8TLzscWuwy7Wfy
   uaWYpk8LS/7Y0bNtIshgZdILAo14Q2fGLq5ZTQIpmGn7KUdzNIyn9rR8U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="466661104"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="466661104"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 13:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="32911292"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2024 13:19:19 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQDJc-0002LW-2O;
	Wed, 17 Jan 2024 21:19:16 +0000
Date: Thu, 18 Jan 2024 05:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1793/2425] mm/memcontrol.c:5167:40: error:
 implicit declaration of function 'ksm_process_profit'
Message-ID: <202401180555.Vs8p7eUg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ec7d78798bfb669efc713c2c416a553a40d4dc77
commit: 8bafb5eac5a6196aaa16024999cc5244a8c99fe6 [1793/2425] memcg: support ksm merge any mode per cgroup
config: loongarch-randconfig-001-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180555.Vs8p7eUg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180555.Vs8p7eUg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180555.Vs8p7eUg-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memcontrol.c: In function 'memory_ksm_show':
>> mm/memcontrol.c:5167:40: error: implicit declaration of function 'ksm_process_profit' [-Werror=implicit-function-declaration]
    5167 |                 ksm_process_profits += ksm_process_profit(mm);
         |                                        ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ksm_process_profit +5167 mm/memcontrol.c

  5144	
  5145	static int memory_ksm_show(struct seq_file *m, void *v)
  5146	{
  5147		unsigned long ksm_merging_pages = 0;
  5148		unsigned long ksm_rmap_items = 0;
  5149		long ksm_process_profits = 0;
  5150		unsigned int tasks = 0;
  5151		struct task_struct *task;
  5152		struct mm_struct *mm;
  5153		struct css_task_iter it;
  5154		struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
  5155	
  5156		css_task_iter_start(&memcg->css, CSS_TASK_ITER_PROCS, &it);
  5157		while ((task = css_task_iter_next(&it))) {
  5158			mm = get_task_mm(task);
  5159			if (!mm)
  5160				continue;
  5161	
  5162			if (test_bit(MMF_VM_MERGE_ANY, &mm->flags))
  5163				tasks++;
  5164	
  5165			ksm_rmap_items += mm->ksm_rmap_items;
  5166			ksm_merging_pages += mm->ksm_merging_pages;
> 5167			ksm_process_profits += ksm_process_profit(mm);
  5168			mmput(mm);
  5169		}
  5170		css_task_iter_end(&it);
  5171	
  5172		seq_printf(m, "merge any tasks: %u\n", tasks);
  5173		seq_printf(m, "ksm_rmap_items %lu\n", ksm_rmap_items);
  5174		seq_printf(m, "ksm_merging_pages %lu\n", ksm_merging_pages);
  5175		seq_printf(m, "ksm_process_profits %ld\n", ksm_process_profits);
  5176		return 0;
  5177	}
  5178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
