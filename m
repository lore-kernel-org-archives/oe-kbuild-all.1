Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7517F8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 20:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710102931; cv=none; b=tEZxCPrxFoVRX9wgNOar5/KrHCA7LCdhfcxN41AU8AENnce3jx1OAlOCxpDOzwKh9bhvuLoWBnkjVA0h50ZkcLLRyNl5BTOlJLuWgXFjA6F4x020rJcFXJjuCzSqGVwn8xdzdvBdvuHyvFjpPARYwtrTgRwSc4A5wNxPPGGGVVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710102931; c=relaxed/simple;
	bh=uxqD6coRuuFaakBhgDzIQiDu7i9mBqg1XkGtHc4Dvoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qDLWH52VBH0ScstZpNrfuMEYGYgbXFB1lgHWkpgr6RDl2RulqFVFFxM4pUUNlRWHzfzkgpoQS6eJ6hjwfrww3GVsL/0FbsM4V5mWaZ54AK3BUxgcW2mWDkAM5vXVOi9FWrhVzWi2ZtYF7RXhEE3Ae2eQ5bk1ltlyn8xGcw7Am7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPrg0EMX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPrg0EMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710102930; x=1741638930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uxqD6coRuuFaakBhgDzIQiDu7i9mBqg1XkGtHc4Dvoo=;
  b=hPrg0EMXDYfNSTmMdfHHSuCck1O3qxkmoxt2DBbXI28xP+ZkHwDcU4QA
   Cvt3IOddVbSbcsHsJMjkIAwI+zQogq+ETO0aBBFHyp11cFSzVavJ/JEec
   chrkcvij816tHVc6hU0NVT7J524yo8uXvXODRyfJlZG83uoJlTuuAc+Ti
   yRodbYJ8pjIRqym6ZKbgAxq37uBQsBxygiXw4yOeOaa69g3ONhLJywsH9
   Q3Zn7+DBG3j6nYhrDGOp+HbzaO3C4AzpBRI8+/9G0zJ2VuvXPRr+afq2J
   gDkhoPLmulY7FmEtEBNXbWW3vYNTUGk5gDiQZK4X9hv15lB8aN9x8FNfC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="22216289"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="22216289"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 13:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="11064460"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Mar 2024 13:35:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjPtD-0008Wl-0c;
	Sun, 10 Mar 2024 20:35:23 +0000
Date: Mon, 11 Mar 2024 04:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26960/27506] mm/damon/vaddr.c:728:7:
 warning: assignment makes pointer from integer without a cast
Message-ID: <202403110403.enyArQjL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: 66163f1b6ff4ecaedbb0d4e165077aad5b669153 [26960/27506] mm/damon: dump the frequency distribution of vaddr space
config: x86_64-randconfig-004-20240310 (https://download.01.org/0day-ci/archive/20240311/202403110403.enyArQjL-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110403.enyArQjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110403.enyArQjL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/damon/vaddr.c: In function 'damon_va_dump_freq_map':
   mm/damon/vaddr.c:724:4: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
       kfree(t->arr_mm_hint);
       ^~~~~
       kvfree
   mm/damon/vaddr.c:728:9: error: implicit declaration of function 'kmalloc_array'; did you mean 'kvmalloc_array'? [-Werror=implicit-function-declaration]
      arr = kmalloc_array(t->nr_regions, sizeof(struct damon_region_mm_hint), GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
            ^~~~~~~~~~~~~
            kvmalloc_array
>> mm/damon/vaddr.c:728:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      arr = kmalloc_array(t->nr_regions, sizeof(struct damon_region_mm_hint), GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
          ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DAMON_DBGFS
   Depends on [n]: DAMON_VADDR [=y] && DAMON_PADDR [=n] && DEBUG_FS [=y]
   Selected by [y]:
   - DAMON [=y]


vim +728 mm/damon/vaddr.c

   712	
   713	int damon_va_dump_freq_map(struct damon_ctx *ctx)
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
