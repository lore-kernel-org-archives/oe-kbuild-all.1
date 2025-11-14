Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FD331DDBB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 15:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133899; cv=none; b=f7d2rkOzXcs7kczSMSgW/oq/xQCnAl+iYnYL61W9e9OkIePPe0eLu9VUdAh+1AO8elFTavTFJroI8exDKnYU3EZ51cu0un1Yc+doTeWdPhukGI63d5ihp9XXVu0XrpQ/RhUabgqoTtFtw8LVr69DANOUPtimeL1OXvtzyUr4u7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133899; c=relaxed/simple;
	bh=BiK+fqpRBTWp4mUrFhUYkAdEjCSI4//VP7gZQIis1tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrY5eShPvSHlIvuJEVT1nXoVI12PlOHxhQ6eSCZcy+2ttf6WcCOdrRtQk0G5y0sg8heY+R+vP8W1Jjbrd+7DlnKiK9H0OyAeHjGkNBbqxTtA58f+VXEaol3RHQb07qQuU13PW3a50eKGWuIjvMct1i+rKn13HI8nHW5qnY7gQPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnOk83ff; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnOk83ff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763133897; x=1794669897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BiK+fqpRBTWp4mUrFhUYkAdEjCSI4//VP7gZQIis1tM=;
  b=OnOk83ffVsoskeDbQCciNiDy9CShYWInEr8j7kOoVngf4REbrK2V6MEN
   LRQoqhIIZ04iIXvtcSGQIuj5KoSh3jiMTZCfqb1TpkTi45jIFJbDHSZsZ
   CzJJlicztKD/ya9VYtUKpi3fegOmAEUcfKuuxKq5jj799pDWxtGf6IUYv
   MpWUxKTcjuH7YedpJ+xz69OtB0hdK9xIN6RoUkX7psRgXY0BhzYYSzQjV
   iA1covohGbhSPgFI5+63kPi4LMFL8aZiabQXnbNOPMAIT2fUwttsDbzYV
   xBI/L95SQSvvkTMs/tUM+BjHlzMtgWyUD8s5hIhy93HVF2CEizC/yWMkw
   Q==;
X-CSE-ConnectionGUID: K7zO9Kh+TieM2JY2ptMIvA==
X-CSE-MsgGUID: mib5decnTUSX+8nsQNKQWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82861592"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="82861592"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 07:24:56 -0800
X-CSE-ConnectionGUID: P4ubDkTKSKmCq1wPZrc8iA==
X-CSE-MsgGUID: lj8S5HHjS6e9N05+APrXRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189990414"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Nov 2025 07:24:50 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJvfL-0006i5-15;
	Fri, 14 Nov 2025 15:24:47 +0000
Date: Fri, 14 Nov 2025 23:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@redhat.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Peter Xu <peterx@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Kees Cook <kees@kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 1/4] mm: declare VMA flags by bit
Message-ID: <202511142325.rDmlXFxr-lkp@intel.com>
References: <6289d60b6731ea7a111c87c87fb8486881151c25.1763126447.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6289d60b6731ea7a111c87c87fb8486881151c25.1763126447.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20251114]
[cannot apply to rust/rust-next tip/sched/core brauner-vfs/vfs.all kees/for-next/execve linus/master v6.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-declare-VMA-flags-by-bit/20251114-213237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/6289d60b6731ea7a111c87c87fb8486881151c25.1763126447.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH v2 1/4] mm: declare VMA flags by bit
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251114/202511142325.rDmlXFxr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511142325.rDmlXFxr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511142325.rDmlXFxr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:46,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/mm.h: In function 'is_nommu_shared_mapping':
>> include/linux/mm.h:1734:39: error: 'VM_MAYOVERLAY' undeclared (first use in this function); did you mean 'VMA_MAYOVERLAY_BIT'?
    1734 |         return flags & (VM_MAYSHARE | VM_MAYOVERLAY);
         |                                       ^~~~~~~~~~~~~
         |                                       VMA_MAYOVERLAY_BIT
   include/linux/mm.h:1734:39: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1734 include/linux/mm.h

97a7e4733b9b22 Peter Xu          2021-03-12  1722  
fc4f4be9b5271e David Hildenbrand 2023-01-02  1723  #ifndef CONFIG_MMU
fc4f4be9b5271e David Hildenbrand 2023-01-02  1724  static inline bool is_nommu_shared_mapping(vm_flags_t flags)
fc4f4be9b5271e David Hildenbrand 2023-01-02  1725  {
fc4f4be9b5271e David Hildenbrand 2023-01-02  1726  	/*
fc4f4be9b5271e David Hildenbrand 2023-01-02  1727  	 * NOMMU shared mappings are ordinary MAP_SHARED mappings and selected
fc4f4be9b5271e David Hildenbrand 2023-01-02  1728  	 * R/O MAP_PRIVATE file mappings that are an effective R/O overlay of
fc4f4be9b5271e David Hildenbrand 2023-01-02  1729  	 * a file mapping. R/O MAP_PRIVATE mappings might still modify
fc4f4be9b5271e David Hildenbrand 2023-01-02  1730  	 * underlying memory if ptrace is active, so this is only possible if
fc4f4be9b5271e David Hildenbrand 2023-01-02  1731  	 * ptrace does not apply. Note that there is no mprotect() to upgrade
fc4f4be9b5271e David Hildenbrand 2023-01-02  1732  	 * write permissions later.
fc4f4be9b5271e David Hildenbrand 2023-01-02  1733  	 */
b6b7a8faf05c70 David Hildenbrand 2023-01-02 @1734  	return flags & (VM_MAYSHARE | VM_MAYOVERLAY);
fc4f4be9b5271e David Hildenbrand 2023-01-02  1735  }
fc4f4be9b5271e David Hildenbrand 2023-01-02  1736  #endif
fc4f4be9b5271e David Hildenbrand 2023-01-02  1737  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
