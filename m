Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B10052F6F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 09:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709632006; cv=none; b=lGwXn09ynFHtV6mjU/CuV883q5OCuxdDYa9VA2pB5CEyG9kpO8RxVRr/kdNNuqRL0TVKKaQqMqeiQauPGHrb//SAKhcrlorMbpujOxxyqo4CU+Nn6247bnddB49ytOP6vTIcQcxjndkrfdRz/m6f6MSVpnEkXDUnZSucdOlamvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709632006; c=relaxed/simple;
	bh=UqxdrmxXQp1+aHutrDL1S3p/GgcpJauTpNhWzAyaR1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fx3n08vJw81xeDcfU9IepYNJAn16sqU9sJz8SGj6HfiDUYRo1o5pMyWZrLL0F9+euCwR6SWn/Q7yK7Xji8f/1TRZPMAyhZc2XFUh0w3ik4KnyProZkWm80ZSA0bgeG0hf5SewbFdGVJLHXxL7wCJruUQtiZCLLlXaFoU/OZWifA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCZIOZS8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCZIOZS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709632004; x=1741168004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UqxdrmxXQp1+aHutrDL1S3p/GgcpJauTpNhWzAyaR1c=;
  b=PCZIOZS8QTVlGIuWFX/geOnlSK2qjzxVvgslveQ2PqqO2JUoKxLahtHc
   nzV+n+5KYII8tTuBUcnzHtmPf0OZWHsEOpStv9V6YIwq+8qGTecw1pBOE
   +gPHYVSv2HpfLGxNJQJI5/3HhNkNBNJtp8259CjR7ssNOKn46dpA/hT0a
   hVoo5kSdp/d9dF3+390uceQMADBGxU7BvbxQYSHlcE1ZX0dHIyvN8WdjY
   v1FxLZEn2oRb/6uRih+2JlG1gUnpIXRgpeu4k6EnqZXRCIexnT2YJnhNK
   bIyiWVYHxcOpbResbXqGUi2jgSVLwFpzdqENH60/be+NZSfgG5AU63C9A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4029869"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4029869"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14000739"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2024 01:46:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhRNd-0003Cz-37;
	Tue, 05 Mar 2024 09:46:37 +0000
Date: Tue, 5 Mar 2024 17:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26960/27434] mm/damon/vaddr.c:724:25:
 error: implicit declaration of function 'kfree'; did you mean 'kvfree'?
Message-ID: <202403051718.ww09a0vW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 66163f1b6ff4ecaedbb0d4e165077aad5b669153 [26960/27434] mm/damon: dump the frequency distribution of vaddr space
config: x86_64-buildonly-randconfig-002-20240305 (https://download.01.org/0day-ci/archive/20240305/202403051718.ww09a0vW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051718.ww09a0vW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051718.ww09a0vW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/damon/vaddr.c:652:22: warning: no previous prototype for 'get_damon_target' [-Wmissing-prototypes]
     652 | struct damon_target *get_damon_target(struct task_struct *task,
         |                      ^~~~~~~~~~~~~~~~
   mm/damon/vaddr.c:686:5: warning: no previous prototype for 'proc_damon_map' [-Wmissing-prototypes]
     686 | int proc_damon_map(struct seq_file *m, struct pid_namespace *ns,
         |     ^~~~~~~~~~~~~~
   mm/damon/vaddr.c:713:5: warning: no previous prototype for 'damon_va_dump_freq_map' [-Wmissing-prototypes]
     713 | int damon_va_dump_freq_map(struct damon_ctx *ctx)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/damon/vaddr.c: In function 'damon_va_dump_freq_map':
>> mm/damon/vaddr.c:724:25: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
     724 |                         kfree(t->arr_mm_hint);
         |                         ^~~~~
         |                         kvfree
>> mm/damon/vaddr.c:728:23: error: implicit declaration of function 'kmalloc_array'; did you mean 'kvmalloc_array'? [-Werror=implicit-function-declaration]
     728 |                 arr = kmalloc_array(t->nr_regions, sizeof(struct damon_region_mm_hint), GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
         |                       ^~~~~~~~~~~~~
         |                       kvmalloc_array
>> mm/damon/vaddr.c:728:21: warning: assignment to 'struct damon_region_mm_hint *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     728 |                 arr = kmalloc_array(t->nr_regions, sizeof(struct damon_region_mm_hint), GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
         |                     ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DAMON_DBGFS
   Depends on [n]: DAMON_VADDR [=y] && DAMON_PADDR [=n] && DEBUG_FS [=y]
   Selected by [y]:
   - DAMON [=y]


vim +724 mm/damon/vaddr.c

   685	
 > 686	int proc_damon_map(struct seq_file *m, struct pid_namespace *ns,
   687				struct pid *pid, struct task_struct *task)
   688	{
   689		struct damon_target *t;
   690		struct damon_region_mm_hint *arr = NULL;
   691		unsigned int nr_freq_map;
   692		int i;
   693		unsigned long interval = 0;
   694		if (!task)
   695			return 0;
   696	
   697		t = get_damon_target(task, &interval);
   698		if (!t || !interval)
   699			return 0;
   700	
   701		down_read(&t->dump_freq_lock);
   702		nr_freq_map = t->nr_freq_map;
   703		arr = t->arr_mm_hint;
   704	
   705		for (i = 0; i < nr_freq_map; i++)
   706			seq_printf(m, "%lx-%lx: %u %lums\n", arr[i].start, arr[i].end, arr[i].nr_accesses, interval / 1000 * arr[i].age);
   707	
   708		up_read(&t->dump_freq_lock);
   709	
   710		return 0;
   711	}
   712	
 > 713	int damon_va_dump_freq_map(struct damon_ctx *ctx)
   714	{
   715		unsigned int i = 0;
   716		struct damon_target *t;
   717		struct damon_region *r;
   718		struct damon_region_mm_hint *arr = NULL;
   719		int ret = 0;
   720	
   721		damon_for_each_target(t, ctx) {
   722			down_write(&t->dump_freq_lock);
   723			if (t->arr_mm_hint) {
 > 724				kfree(t->arr_mm_hint);
   725				t->nr_freq_map = 0;
   726				t->arr_mm_hint = NULL;
   727			}
 > 728			arr = kmalloc_array(t->nr_regions, sizeof(struct damon_region_mm_hint), GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
   729			if (!arr) {
   730				up_write(&t->dump_freq_lock);
   731				return -ENOMEM;
   732			}
   733	
   734			damon_for_each_region(r, t) {
   735				arr[i].start = r->ar.start;
   736				arr[i].end = r->ar.end;
   737				arr[i].nr_accesses = r->nr_accesses;
   738				arr[i].age = r->age;
   739				i++;
   740			}
   741			// Add a memory barry?
   742			t->nr_freq_map = t->nr_regions;
   743			t->arr_mm_hint = arr;
   744			i = 0;
   745			arr = NULL;
   746			up_write(&t->dump_freq_lock);
   747		}
   748	
   749		return ret;
   750	}
   751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
