Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C565278F38
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 04:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737089451; cv=none; b=oiFzzALylD0XJNUbgnigtYH4LmR2xBZF3lFFqvlPUYvd3ztPkFJQO5NExY0vNFrfGiZJJtNRvuGirhmeLLtRrpAOiKqrQDqPRRPkKfBK+6YD1C3HsTNpAKkZOkLVxEFJ9OKo1hpPkvheJrqRNxPNiuI+hL0hXO640mkLSsudx2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737089451; c=relaxed/simple;
	bh=Fvh3WDBnY6UCmjokkpJR14akqAI9CO6TH5jU4q1uk+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVXqKtrm2904rr2P0yucKXc4+iV1sPCjaQ9WW6sYJorJk4iSOq7CVbLW/gb+45ejgq1XUgE4oXst4X8qnTJxWg0ezkiHBzz2Z645VDi9SwTC6/43nUaJ2q0MRrwuZSiAMXwkYQcfxpcOe9leK8YNxeDAAxGIUvmmxe+et+KAGfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dATs46Wr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dATs46Wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737089450; x=1768625450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fvh3WDBnY6UCmjokkpJR14akqAI9CO6TH5jU4q1uk+0=;
  b=dATs46Wr2PBoQS6kyKdOnhbukHQqkrQNXg5QoFR1GLiufbAH35We2HMp
   BlYqvtZw7//BKadVytjbfQNxhMP38pvEsyYwlQfZXSmhZwXHmlQ2/d/ZL
   CNZ/o2IHMv1d8J+wN/XaFlWD/J/ML6EuJKQOAlt0KIk6WoOqcvlsIpXZ8
   5+VCp7EPVZqp6t4KgGUPdNU7s2uljJZ0hKDif5qSwl+sGCorOujCVNoBF
   WczlsT6xqAi6k4uzbe5dCjsLNgJfkWpiJO746jMX/cJAOH0wTjbBbAFjS
   hkyAgI7PuA7tPWzpYT/9FEiLilIYTx8hLWHhZLUOObcbMaxyx+i5g2FFs
   A==;
X-CSE-ConnectionGUID: AO2Pn5yDTrCVAJXidvrJ6A==
X-CSE-MsgGUID: HavZNrriQreDTOsxs7nzng==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="41187882"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="41187882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 20:50:49 -0800
X-CSE-ConnectionGUID: WvNriTUQTRCEq3Eq+lwzyQ==
X-CSE-MsgGUID: 4EFHZX5WSHC8Y1pJbfp8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105660377"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 20:50:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYeJg-000SlP-2N;
	Fri, 17 Jan 2025 04:50:44 +0000
Date: Fri, 17 Jan 2025 12:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Wupeng Ma <mawupeng1@huawei.com>, akpm@linux-foundation.org,
	david@redhat.com, osalvador@suse.de, nao.horiguchi@gmail.com,
	linmiaohe@huawei.com, mhocko@suse.com
Cc: oe-kbuild-all@lists.linux.dev, mawupeng1@huawei.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mm: memory-failure: update ttu flag inside
 unmap_poisoned_folio
Message-ID: <202501171215.KLa8VDaS-lkp@intel.com>
References: <20250116061657.227027-2-mawupeng1@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116061657.227027-2-mawupeng1@huawei.com>

Hi Wupeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Wupeng-Ma/mm-memory-failure-update-ttu-flag-inside-unmap_poisoned_folio/20250116-142614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250116061657.227027-2-mawupeng1%40huawei.com
patch subject: [PATCH v2 1/3] mm: memory-failure: update ttu flag inside unmap_poisoned_folio
config: x86_64-buildonly-randconfig-002-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171215.KLa8VDaS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171215.KLa8VDaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171215.KLa8VDaS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memory_hotplug.c:41:
   mm/internal.h:1142:1: error: expected identifier or '(' before '{' token
    1142 | {
         | ^
>> mm/internal.h:1141:19: warning: 'unmap_poisoned_folio' used but never defined
    1141 | static inline int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, bool must_kill);
         |                   ^~~~~~~~~~~~~~~~~~~~


vim +/unmap_poisoned_folio +1141 mm/internal.h

  1121	
  1122	extern u32 hwpoison_filter_dev_major;
  1123	extern u32 hwpoison_filter_dev_minor;
  1124	extern u64 hwpoison_filter_flags_mask;
  1125	extern u64 hwpoison_filter_flags_value;
  1126	extern u64 hwpoison_filter_memcg;
  1127	extern u32 hwpoison_filter_enable;
  1128	#define MAGIC_HWPOISON	0x48575053U	/* HWPS */
  1129	void SetPageHWPoisonTakenOff(struct page *page);
  1130	void ClearPageHWPoisonTakenOff(struct page *page);
  1131	bool take_page_off_buddy(struct page *page);
  1132	bool put_page_back_buddy(struct page *page);
  1133	struct task_struct *task_early_kill(struct task_struct *tsk, int force_early);
  1134	void add_to_kill_ksm(struct task_struct *tsk, const struct page *p,
  1135			     struct vm_area_struct *vma, struct list_head *to_kill,
  1136			     unsigned long ksm_addr);
  1137	unsigned long page_mapped_in_vma(const struct page *page,
  1138			struct vm_area_struct *vma);
  1139	
  1140	#else
> 1141	static inline int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, bool must_kill);
  1142	{
  1143		return -EBUSY;
  1144	}
  1145	#endif
  1146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
