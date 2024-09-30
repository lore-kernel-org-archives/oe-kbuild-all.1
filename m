Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708B320B0F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727709566; cv=none; b=IbSJZj6Q539LXYMCqqxZBGjRKnDLrcMawm+fth0zOaD73vkMudQHEN7e/6Q1tpW3cqgp4j2QvoIU05hKtAIZrCWN45OieVSa+RKkA/CurQ0602FughxuIctgMqpdUw3aQXjyjNi9zJNo/WCG8bv4b1uasmgsQBMeQrkb2sCIzoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727709566; c=relaxed/simple;
	bh=T/cUiUrL/X33ROUklEORVOrQeMsaQab4R2gbj9j5Utw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ifn0V3GKWOChLSPV4hRGK7nErq2qfwTZnFqp5jfGoGzJkHxqDkwN91YInzT+lrr2i2rLWKYV9mcXKSSq6ivAfaBZU7JNjjrd91sSJMVVWWXCpz9R6XPEhI47mMqUSGqKZqNbt56jhDa/cuL8UCOgq+ecRAVvOYsomv5ka7K5yGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbHTeBj5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbHTeBj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727709564; x=1759245564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/cUiUrL/X33ROUklEORVOrQeMsaQab4R2gbj9j5Utw=;
  b=AbHTeBj5g96f80snJ2VEQcbavTYVa/NBEYqj/TWWhhMLJsdPXwuc+W4t
   LtqNdYQkHpRoX3hwsW2rYrbc1/pzxUphn2bDHR+pe2pvcJ+5pMG7i+PjT
   5rfYpElMRoss1kEMDDJI79FnT4Gqe9zEgcGKR9JMm/WIltjFpVYYLhQp6
   ebSdnKdHAsf8lHQGNW50yoryXroTaf+g7srZoK3kQQsAL7uj0EIFlVxm0
   Hddez7I2qYqt/+fgdsbJRnl3EWo4LCbw/3dZIEwTBAI+/zaSLz4WwulRw
   CCfUJcIpdyN7hNpEzSKUl1kLp+aCGdC659l40+LC051X0wcAUTb6eFbSy
   w==;
X-CSE-ConnectionGUID: ogxmYjsyR82NqzJYZTvF5A==
X-CSE-MsgGUID: SS/xIaikRXuWijDy7bnEIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26931721"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="26931721"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 08:19:19 -0700
X-CSE-ConnectionGUID: V47YOPYgS9uAFFF7eHwWWA==
X-CSE-MsgGUID: un989bdGThOrFHAridPR5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73605327"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Sep 2024 08:19:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svIB9-000PaB-1L;
	Mon, 30 Sep 2024 15:19:15 +0000
Date: Mon, 30 Sep 2024 23:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16561/23811] mm/pin_mem.c:844:63:
 error: lvalue required as unary '&' operand
Message-ID: <202409302301.ZKaIRM0E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jingxian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 1a378b87531ea80e7847bf0105adedff28a73080 [16561/23811] mm: add pin memory method for checkpoint add restore
config: arm64-randconfig-004-20240930 (https://download.01.org/0day-ci/archive/20240930/202409302301.ZKaIRM0E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409302301.ZKaIRM0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409302301.ZKaIRM0E-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/pin_mem.c:171:6: warning: no previous prototype for 'reserve_page_from_buddy' [-Wmissing-prototypes]
     171 | void reserve_page_from_buddy(unsigned long nr_pages, struct page *page)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:254:6: warning: no previous prototype for 'free_user_map_pages' [-Wmissing-prototypes]
     254 | void free_user_map_pages(unsigned int pid_index, unsigned int entry_index, unsigned int page_index)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:311:6: warning: no previous prototype for 'check_redirect_end_valid' [-Wmissing-prototypes]
     311 | bool check_redirect_end_valid(struct redirect_info *redirect_start,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:392:5: warning: no previous prototype for 'calculate_pin_mem_digest' [-Wmissing-prototypes]
     392 | int calculate_pin_mem_digest(struct pin_mem_dump_info *pmdi, char *digest)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:481:5: warning: no previous prototype for 'collect_pmd_huge_pages' [-Wmissing-prototypes]
     481 | int collect_pmd_huge_pages(struct task_struct *task,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c:544:5: warning: no previous prototype for 'collect_normal_pages' [-Wmissing-prototypes]
     544 | int collect_normal_pages(struct task_struct *task,
         |     ^~~~~~~~~~~~~~~~~~~~
   mm/pin_mem.c: In function 'collect_normal_pages':
   mm/pin_mem.c:549:26: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
     549 |         unsigned long i, nr_pages;
         |                          ^~~~~~~~
   mm/pin_mem.c: At top level:
   mm/pin_mem.c:610:6: warning: no previous prototype for 'free_pin_pages' [-Wmissing-prototypes]
     610 | void free_pin_pages(struct page_map_entry *pme)
         |      ^~~~~~~~~~~~~~
   mm/pin_mem.c:770:12: warning: no previous prototype for 'remap_normal_pages' [-Wmissing-prototypes]
     770 | vm_fault_t remap_normal_pages(struct mm_struct *mm, struct vm_area_struct *vma,
         |            ^~~~~~~~~~~~~~~~~~
   mm/pin_mem.c: In function 'get_hugepage_gfpmask':
>> mm/pin_mem.c:844:63: error: lvalue required as unary '&' operand
     844 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_hugepage_flags))
         |                                                               ^
   mm/pin_mem.c:846:63: error: lvalue required as unary '&' operand
     846 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_hugepage_flags))
         |                                                               ^
   mm/pin_mem.c:848:71: error: lvalue required as unary '&' operand
     848 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG, &transparent_hugepage_flags))
         |                                                                       ^
   mm/pin_mem.c:851:65: error: lvalue required as unary '&' operand
     851 |         if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG, &transparent_hugepage_flags))
         |                                                                 ^
   mm/pin_mem.c: At top level:
   mm/pin_mem.c:857:12: warning: no previous prototype for 'remap_huge_pmd_pages' [-Wmissing-prototypes]
     857 | vm_fault_t remap_huge_pmd_pages(struct mm_struct *mm, struct vm_area_struct *vma,
         |            ^~~~~~~~~~~~~~~~~~~~


vim +844 mm/pin_mem.c

   839	
   840	static inline gfp_t get_hugepage_gfpmask(struct vm_area_struct *vma)
   841	{
   842		const bool vma_madvised = !!(vma->vm_flags & VM_HUGEPAGE);
   843	
 > 844		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_hugepage_flags))
   845			return GFP_TRANSHUGE | (vma_madvised ? 0 : __GFP_NORETRY);
   846		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_hugepage_flags))
   847			return GFP_TRANSHUGE_LIGHT | __GFP_KSWAPD_RECLAIM;
   848		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG, &transparent_hugepage_flags))
   849			return GFP_TRANSHUGE_LIGHT | (vma_madvised ? __GFP_DIRECT_RECLAIM :
   850								     __GFP_KSWAPD_RECLAIM);
   851		if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG, &transparent_hugepage_flags))
   852			return GFP_TRANSHUGE_LIGHT | (vma_madvised ? __GFP_DIRECT_RECLAIM :
   853								     0);
   854		return GFP_TRANSHUGE_LIGHT;
   855	}
   856	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
