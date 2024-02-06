Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6284F1798C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 19:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707248782; cv=none; b=LysrzG3Hvuxtjo5ZIGw5K35OKIldiUZxo9P+dXNT7ueI5SBpgmRpftxVTHyjORy7TEgVi0hQhLuk6cNjxqifMd95FM4YKdEgGpycDNN1X4j1lAdFVi1UN1x2DMFMoQ1B52klnHjKbKGds3+rg127q6QXjtytqZq2eWAsiJYXoyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707248782; c=relaxed/simple;
	bh=rLDPa1W0/vxB1CQxENTDDwQVn3Bb9ao38xFsGL/7ZSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kOJq5pf1kVx7cevGuwdtzSNCdQZ848RLrHPOzBChot8MRlKN+duXWWa90FbCpjEjhiJyVilaKNbDEhPaDWXAchUJjISsuAe1f+nmpmcKppMFp5bOqPg8PBI5XeafXmxDrzCNMXc5Ye3B1VyBtnqBJnTWBecP55HEVnzKW6aLObw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcCWNpUY; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcCWNpUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707248780; x=1738784780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rLDPa1W0/vxB1CQxENTDDwQVn3Bb9ao38xFsGL/7ZSY=;
  b=mcCWNpUYN+Ts57fKowKP7y/CtoUV4n1oAvDa8OEDzk7/QvK3S29mQeAe
   5/rmahIiK9HjjOxTMrAric3CaYcuBltTuwJXgZ9O7hPtA2qug5feSukdh
   IdZUTrLkiPa2FkWo75forG+vjdxaueAR1BqgnEGWjf40w7D//N73lGE1I
   ArbYPKMpxPC+hk4WAkO/nodZahNw41lpoyEbO37GqMEO2D1XZOa6gTo4Q
   LMftOeA9WglY9OQVXLDwu4NOO05bgZPWGSF4GuePf3FRO8u2e7d6CZpKj
   ys24ZrOmdgtz93IZsWP/40KDentAvYCfUl4Hj8iqs5XObqrslO2JG6flO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="435967524"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="435967524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 11:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1150312"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Feb 2024 11:46:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXROZ-0001jU-2C;
	Tue, 06 Feb 2024 19:46:15 +0000
Date: Wed, 7 Feb 2024 03:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18972/21616] drivers/char/svm.c:366:43:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202402070354.liyB0qcx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 51d0e1a742714b2599d54fd92a71bd2998b01084 [18972/21616] support multiple node for getting phys interface
config: arm64-randconfig-r131-20240130 (https://download.01.org/0day-ci/archive/20240207/202402070354.liyB0qcx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240207/202402070354.liyB0qcx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070354.liyB0qcx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/char/svm.c:248:20: sparse: sparse: symbol 'svm_find_mem_reg_node' was not declared. Should it be static?
   drivers/char/svm.c:325:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svm_va2pa_slot *slot @@     got void [noderef] __iomem * @@
   drivers/char/svm.c:325:14: sparse:     expected struct svm_va2pa_slot *slot
   drivers/char/svm.c:325:14: sparse:     got void [noderef] __iomem *
>> drivers/char/svm.c:366:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct svm_va2pa_slot *slots @@
   drivers/char/svm.c:366:43: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/char/svm.c:366:43: sparse:     got struct svm_va2pa_slot *slots
   drivers/char/svm.c:449:6: sparse: sparse: symbol 'sysrq_sched_debug_show_export' was not declared. Should it be static?
   drivers/char/svm.c:1272:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/char/svm.c:248:21: warning: no previous prototype for 'svm_find_mem_reg_node' [-Wmissing-prototypes]
     248 | struct device_node *svm_find_mem_reg_node(struct device *dev, const char *compat)
         |                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:449:6: warning: no previous prototype for 'sysrq_sched_debug_show_export' [-Wmissing-prototypes]
     449 | void sysrq_sched_debug_show_export(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:1476:5: warning: no previous prototype for 'svm_get_pasid' [-Wmissing-prototypes]
    1476 | int svm_get_pasid(pid_t vpid, int dev_id __maybe_unused)
         |     ^~~~~~~~~~~~~
   drivers/char/svm.c:2269:36: warning: 'svm_acpi_match' defined but not used [-Wunused-const-variable=]
    2269 | static const struct acpi_device_id svm_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:34,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/arm64/include/asm/bug.h:37,
                    from arch/arm64/include/asm/memory.h:27,
                    from arch/arm64/include/asm/esr.h:21,
                    from drivers/char/svm.c:10:
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'svm_proc_load_flag' at drivers/char/svm.c:1805:12:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds=]
     492 |         asm volatile(                                                   39-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   drivers/char/svm.c:1796:25: note: object 'l2buf_load_flag' of size 4
    1796 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'svm_proc_load_flag' at drivers/char/svm.c:1805:12:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds=]
     492 |         asm volatile(                                                   52-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   drivers/char/svm.c:1796:25: note: object 'l2buf_load_flag' of size 4
    1796 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~

vim +366 drivers/char/svm.c

   357	
   358	static void svm_remove_trunk(struct device *dev)
   359	{
   360		int count;
   361	
   362		for (count = 0; count < SVM_VA2PA_TRUNK_COUNT_MAX; count++) {
   363			if (!va2pa_trunk[count].base)
   364				break;
   365	
 > 366			iounmap(va2pa_trunk[count].slots);
   367			kvfree(va2pa_trunk[count].bitmap);
   368			va2pa_trunk[count].slots = NULL;
   369			va2pa_trunk[count].bitmap = NULL;
   370		}
   371	}
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
