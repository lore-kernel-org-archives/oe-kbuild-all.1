Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD2F12B94
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 22:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770674591; cv=none; b=DKRVVvo2XmIKz6VVpFxnyDgF0hVsRT5RSJewKAjhv1CEKzIvKYdyQs4Nx8AklmmcmQn6s3S+yrHKvcFT9hFOysxgXS+TUMsEaMORuO80TaTeK/EKPnk3YKPKmITtNmO1K3X+kNT6E/cUylpp7iZdqZ5EgajFrDWX+2tEdS17UsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770674591; c=relaxed/simple;
	bh=TEjzoEz/L6TVnoV6fg4t0EBMP+G8wl8JzBZe9s7sf5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwDWpGfuTa1jMEGPQukxXd9C0bJe9O+ejH5xxQJnk7APlVufEjvqLSlaE5FTzZZbPb0APhLlWbBmXQwqw/22+s4DI3DdtLJyBV4LUcIBHZgWstD7PSZrIOCaOdWqSR0xCiSa7gyiZ6Yqt6nXPAL5LTLRyzy79tdlu7gMrstRfbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9tzBUCX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9tzBUCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770674589; x=1802210589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TEjzoEz/L6TVnoV6fg4t0EBMP+G8wl8JzBZe9s7sf5o=;
  b=h9tzBUCXb+VrXGaHbOXdyaECvEhkFf7LNLBlrwGZ8JHtfMbNFTsx2LKE
   fvkFwx9harOK8UsWomJmZdOLPCYf/5sZ3yCMbTUf7oIvMUe+w19CsJkEm
   Pi4aGsOZ3dTS0BNE8tJAH7Y3aZRMK2kXewdK2Hs5CdRHjHXdVI4MLoJFu
   YEIUOZRTQwe9C4MRY00s0QJIer3OBWd3Lf2P0Xv2XqYsSzX3DyP7HrA0R
   sT/t8hiK/csFSm1hsVrFc6wXBYQJpHjdDsL5jRNT7BtLgomlqqkqqcgt/
   xq47bN41AqSyM6+HNKTjDbnXNXhScU6r6BnvkLrCglH2GYdakvMxLQ9ST
   g==;
X-CSE-ConnectionGUID: xTK7lEy7TKatSAvANvdCcw==
X-CSE-MsgGUID: GUhj4bjeQNy19MgPRUXQyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="97254692"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="97254692"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 14:03:08 -0800
X-CSE-ConnectionGUID: aplQZOqQQiyfd9eh+WWKoA==
X-CSE-MsgGUID: SIiIlaB6SUO3yVJyYXLM5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211782190"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 14:03:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpZLO-00000000oMo-2R8o;
	Mon, 09 Feb 2026 22:02:58 +0000
Date: Tue, 10 Feb 2026 06:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, pmladek@suse.com,
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com,
	kees@kernel.org, elver@google.com, arnd@arndb.de,
	lirongqing@baidu.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
Message-ID: <202602100514.wpEJ9A7Y-lkp@intel.com>
References: <20260209095931.2813152-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209095931.2813152-2-ruanjinjie@huawei.com>

Hi Jinjie,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes arm64/for-next/core tip/x86/core linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/crash-Exclude-crash-kernel-memory-in-crash-core/20260209-180157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260209095931.2813152-2-ruanjinjie%40huawei.com
patch subject: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
config: powerpc-ps3_defconfig (https://download.01.org/0day-ci/archive/20260210/202602100514.wpEJ9A7Y-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100514.wpEJ9A7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100514.wpEJ9A7Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/kexec.h:126,
                    from include/linux/kexec.h:38,
                    from arch/powerpc/kexec/ranges.c:20:
   arch/powerpc/include/asm/kexec_ranges.h:7:32: warning: 'struct crash_mem' declared inside parameter list will not be visible outside of this definition or declaration
       7 | void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
         |                                ^~~~~~~~~
>> arch/powerpc/kexec/ranges.c:146:6: error: conflicting types for 'sort_memory_ranges'; have 'void(struct crash_mem *, bool)' {aka 'void(struct crash_mem *, _Bool)'}
     146 | void sort_memory_ranges(struct crash_mem *mem_rngs, bool merge)
         |      ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kexec_ranges.h:7:6: note: previous declaration of 'sort_memory_ranges' with type 'void(struct crash_mem *, bool)' {aka 'void(struct crash_mem *, _Bool)'}
       7 | void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
         |      ^~~~~~~~~~~~~~~~~~


vim +146 arch/powerpc/kexec/ranges.c

180adfc532a83c Hari Bathini 2020-07-29   18  
180adfc532a83c Hari Bathini 2020-07-29   19  #include <linux/sort.h>
180adfc532a83c Hari Bathini 2020-07-29  @20  #include <linux/kexec.h>
81d7cac4d11cc6 Rob Herring  2023-07-24   21  #include <linux/of.h>
180adfc532a83c Hari Bathini 2020-07-29   22  #include <linux/slab.h>
f5f0da5a7b18fa Sourabh Jain 2024-03-26   23  #include <linux/memblock.h>
f5f0da5a7b18fa Sourabh Jain 2024-03-26   24  #include <linux/crash_core.h>
180adfc532a83c Hari Bathini 2020-07-29   25  #include <asm/sections.h>
180adfc532a83c Hari Bathini 2020-07-29   26  #include <asm/kexec_ranges.h>
f5f0da5a7b18fa Sourabh Jain 2024-03-26   27  #include <asm/crashdump-ppc64.h>
180adfc532a83c Hari Bathini 2020-07-29   28  
f5f0da5a7b18fa Sourabh Jain 2024-03-26   29  #if defined(CONFIG_KEXEC_FILE) || defined(CONFIG_CRASH_DUMP)
180adfc532a83c Hari Bathini 2020-07-29   30  /**
180adfc532a83c Hari Bathini 2020-07-29   31   * get_max_nr_ranges - Get the max no. of ranges crash_mem structure
180adfc532a83c Hari Bathini 2020-07-29   32   *                     could hold, given the size allocated for it.
180adfc532a83c Hari Bathini 2020-07-29   33   * @size:              Allocation size of crash_mem structure.
180adfc532a83c Hari Bathini 2020-07-29   34   *
180adfc532a83c Hari Bathini 2020-07-29   35   * Returns the maximum no. of ranges.
180adfc532a83c Hari Bathini 2020-07-29   36   */
180adfc532a83c Hari Bathini 2020-07-29   37  static inline unsigned int get_max_nr_ranges(size_t size)
180adfc532a83c Hari Bathini 2020-07-29   38  {
180adfc532a83c Hari Bathini 2020-07-29   39  	return ((size - sizeof(struct crash_mem)) /
cade589fdf697d Li Chen      2022-09-29   40  		sizeof(struct range));
180adfc532a83c Hari Bathini 2020-07-29   41  }
180adfc532a83c Hari Bathini 2020-07-29   42  
180adfc532a83c Hari Bathini 2020-07-29   43  /**
180adfc532a83c Hari Bathini 2020-07-29   44   * get_mem_rngs_size - Get the allocated size of mem_rngs based on
180adfc532a83c Hari Bathini 2020-07-29   45   *                     max_nr_ranges and chunk size.
180adfc532a83c Hari Bathini 2020-07-29   46   * @mem_rngs:          Memory ranges.
180adfc532a83c Hari Bathini 2020-07-29   47   *
180adfc532a83c Hari Bathini 2020-07-29   48   * Returns the maximum size of @mem_rngs.
180adfc532a83c Hari Bathini 2020-07-29   49   */
180adfc532a83c Hari Bathini 2020-07-29   50  static inline size_t get_mem_rngs_size(struct crash_mem *mem_rngs)
180adfc532a83c Hari Bathini 2020-07-29   51  {
180adfc532a83c Hari Bathini 2020-07-29   52  	size_t size;
180adfc532a83c Hari Bathini 2020-07-29   53  
180adfc532a83c Hari Bathini 2020-07-29   54  	if (!mem_rngs)
180adfc532a83c Hari Bathini 2020-07-29   55  		return 0;
180adfc532a83c Hari Bathini 2020-07-29   56  
180adfc532a83c Hari Bathini 2020-07-29   57  	size = (sizeof(struct crash_mem) +
cade589fdf697d Li Chen      2022-09-29   58  		(mem_rngs->max_nr_ranges * sizeof(struct range)));
180adfc532a83c Hari Bathini 2020-07-29   59  
180adfc532a83c Hari Bathini 2020-07-29   60  	/*
180adfc532a83c Hari Bathini 2020-07-29   61  	 * Memory is allocated in size multiple of MEM_RANGE_CHUNK_SZ.
180adfc532a83c Hari Bathini 2020-07-29   62  	 * So, align to get the actual length.
180adfc532a83c Hari Bathini 2020-07-29   63  	 */
180adfc532a83c Hari Bathini 2020-07-29   64  	return ALIGN(size, MEM_RANGE_CHUNK_SZ);
180adfc532a83c Hari Bathini 2020-07-29   65  }
180adfc532a83c Hari Bathini 2020-07-29   66  
180adfc532a83c Hari Bathini 2020-07-29   67  /**
180adfc532a83c Hari Bathini 2020-07-29   68   * __add_mem_range - add a memory range to memory ranges list.
180adfc532a83c Hari Bathini 2020-07-29   69   * @mem_ranges:      Range list to add the memory range to.
180adfc532a83c Hari Bathini 2020-07-29   70   * @base:            Base address of the range to add.
180adfc532a83c Hari Bathini 2020-07-29   71   * @size:            Size of the memory range to add.
180adfc532a83c Hari Bathini 2020-07-29   72   *
180adfc532a83c Hari Bathini 2020-07-29   73   * (Re)allocates memory, if needed.
180adfc532a83c Hari Bathini 2020-07-29   74   *
180adfc532a83c Hari Bathini 2020-07-29   75   * Returns 0 on success, negative errno on error.
180adfc532a83c Hari Bathini 2020-07-29   76   */
180adfc532a83c Hari Bathini 2020-07-29   77  static int __add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
180adfc532a83c Hari Bathini 2020-07-29   78  {
180adfc532a83c Hari Bathini 2020-07-29   79  	struct crash_mem *mem_rngs = *mem_ranges;
180adfc532a83c Hari Bathini 2020-07-29   80  
180adfc532a83c Hari Bathini 2020-07-29   81  	if (!mem_rngs || (mem_rngs->nr_ranges == mem_rngs->max_nr_ranges)) {
180adfc532a83c Hari Bathini 2020-07-29   82  		mem_rngs = realloc_mem_ranges(mem_ranges);
180adfc532a83c Hari Bathini 2020-07-29   83  		if (!mem_rngs)
180adfc532a83c Hari Bathini 2020-07-29   84  			return -ENOMEM;
180adfc532a83c Hari Bathini 2020-07-29   85  	}
180adfc532a83c Hari Bathini 2020-07-29   86  
180adfc532a83c Hari Bathini 2020-07-29   87  	mem_rngs->ranges[mem_rngs->nr_ranges].start = base;
180adfc532a83c Hari Bathini 2020-07-29   88  	mem_rngs->ranges[mem_rngs->nr_ranges].end = base + size - 1;
180adfc532a83c Hari Bathini 2020-07-29   89  	pr_debug("Added memory range [%#016llx - %#016llx] at index %d\n",
180adfc532a83c Hari Bathini 2020-07-29   90  		 base, base + size - 1, mem_rngs->nr_ranges);
180adfc532a83c Hari Bathini 2020-07-29   91  	mem_rngs->nr_ranges++;
180adfc532a83c Hari Bathini 2020-07-29   92  	return 0;
180adfc532a83c Hari Bathini 2020-07-29   93  }
180adfc532a83c Hari Bathini 2020-07-29   94  
180adfc532a83c Hari Bathini 2020-07-29   95  /**
180adfc532a83c Hari Bathini 2020-07-29   96   * __merge_memory_ranges - Merges the given memory ranges list.
180adfc532a83c Hari Bathini 2020-07-29   97   * @mem_rngs:              Range list to merge.
180adfc532a83c Hari Bathini 2020-07-29   98   *
180adfc532a83c Hari Bathini 2020-07-29   99   * Assumes a sorted range list.
180adfc532a83c Hari Bathini 2020-07-29  100   *
180adfc532a83c Hari Bathini 2020-07-29  101   * Returns nothing.
180adfc532a83c Hari Bathini 2020-07-29  102   */
180adfc532a83c Hari Bathini 2020-07-29  103  static void __merge_memory_ranges(struct crash_mem *mem_rngs)
180adfc532a83c Hari Bathini 2020-07-29  104  {
cade589fdf697d Li Chen      2022-09-29  105  	struct range *ranges;
180adfc532a83c Hari Bathini 2020-07-29  106  	int i, idx;
180adfc532a83c Hari Bathini 2020-07-29  107  
180adfc532a83c Hari Bathini 2020-07-29  108  	if (!mem_rngs)
180adfc532a83c Hari Bathini 2020-07-29  109  		return;
180adfc532a83c Hari Bathini 2020-07-29  110  
180adfc532a83c Hari Bathini 2020-07-29  111  	idx = 0;
180adfc532a83c Hari Bathini 2020-07-29  112  	ranges = &(mem_rngs->ranges[0]);
180adfc532a83c Hari Bathini 2020-07-29  113  	for (i = 1; i < mem_rngs->nr_ranges; i++) {
180adfc532a83c Hari Bathini 2020-07-29  114  		if (ranges[i].start <= (ranges[i-1].end + 1))
180adfc532a83c Hari Bathini 2020-07-29  115  			ranges[idx].end = ranges[i].end;
180adfc532a83c Hari Bathini 2020-07-29  116  		else {
180adfc532a83c Hari Bathini 2020-07-29  117  			idx++;
180adfc532a83c Hari Bathini 2020-07-29  118  			if (i == idx)
180adfc532a83c Hari Bathini 2020-07-29  119  				continue;
180adfc532a83c Hari Bathini 2020-07-29  120  
180adfc532a83c Hari Bathini 2020-07-29  121  			ranges[idx] = ranges[i];
180adfc532a83c Hari Bathini 2020-07-29  122  		}
180adfc532a83c Hari Bathini 2020-07-29  123  	}
180adfc532a83c Hari Bathini 2020-07-29  124  	mem_rngs->nr_ranges = idx + 1;
180adfc532a83c Hari Bathini 2020-07-29  125  }
180adfc532a83c Hari Bathini 2020-07-29  126  
180adfc532a83c Hari Bathini 2020-07-29  127  /* cmp_func_t callback to sort ranges with sort() */
180adfc532a83c Hari Bathini 2020-07-29  128  static int rngcmp(const void *_x, const void *_y)
180adfc532a83c Hari Bathini 2020-07-29  129  {
cade589fdf697d Li Chen      2022-09-29  130  	const struct range *x = _x, *y = _y;
180adfc532a83c Hari Bathini 2020-07-29  131  
180adfc532a83c Hari Bathini 2020-07-29  132  	if (x->start > y->start)
180adfc532a83c Hari Bathini 2020-07-29  133  		return 1;
180adfc532a83c Hari Bathini 2020-07-29  134  	if (x->start < y->start)
180adfc532a83c Hari Bathini 2020-07-29  135  		return -1;
180adfc532a83c Hari Bathini 2020-07-29  136  	return 0;
180adfc532a83c Hari Bathini 2020-07-29  137  }
180adfc532a83c Hari Bathini 2020-07-29  138  
180adfc532a83c Hari Bathini 2020-07-29  139  /**
180adfc532a83c Hari Bathini 2020-07-29  140   * sort_memory_ranges - Sorts the given memory ranges list.
180adfc532a83c Hari Bathini 2020-07-29  141   * @mem_rngs:           Range list to sort.
180adfc532a83c Hari Bathini 2020-07-29  142   * @merge:              If true, merge the list after sorting.
180adfc532a83c Hari Bathini 2020-07-29  143   *
180adfc532a83c Hari Bathini 2020-07-29  144   * Returns nothing.
180adfc532a83c Hari Bathini 2020-07-29  145   */
180adfc532a83c Hari Bathini 2020-07-29 @146  void sort_memory_ranges(struct crash_mem *mem_rngs, bool merge)
180adfc532a83c Hari Bathini 2020-07-29  147  {
180adfc532a83c Hari Bathini 2020-07-29  148  	int i;
180adfc532a83c Hari Bathini 2020-07-29  149  
180adfc532a83c Hari Bathini 2020-07-29  150  	if (!mem_rngs)
180adfc532a83c Hari Bathini 2020-07-29  151  		return;
180adfc532a83c Hari Bathini 2020-07-29  152  
180adfc532a83c Hari Bathini 2020-07-29  153  	/* Sort the ranges in-place */
180adfc532a83c Hari Bathini 2020-07-29  154  	sort(&(mem_rngs->ranges[0]), mem_rngs->nr_ranges,
180adfc532a83c Hari Bathini 2020-07-29  155  	     sizeof(mem_rngs->ranges[0]), rngcmp, NULL);
180adfc532a83c Hari Bathini 2020-07-29  156  
180adfc532a83c Hari Bathini 2020-07-29  157  	if (merge)
180adfc532a83c Hari Bathini 2020-07-29  158  		__merge_memory_ranges(mem_rngs);
180adfc532a83c Hari Bathini 2020-07-29  159  
180adfc532a83c Hari Bathini 2020-07-29  160  	/* For debugging purpose */
180adfc532a83c Hari Bathini 2020-07-29  161  	pr_debug("Memory ranges:\n");
180adfc532a83c Hari Bathini 2020-07-29  162  	for (i = 0; i < mem_rngs->nr_ranges; i++) {
180adfc532a83c Hari Bathini 2020-07-29  163  		pr_debug("\t[%03d][%#016llx - %#016llx]\n", i,
180adfc532a83c Hari Bathini 2020-07-29  164  			 mem_rngs->ranges[i].start,
180adfc532a83c Hari Bathini 2020-07-29  165  			 mem_rngs->ranges[i].end);
180adfc532a83c Hari Bathini 2020-07-29  166  	}
180adfc532a83c Hari Bathini 2020-07-29  167  }
180adfc532a83c Hari Bathini 2020-07-29  168  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
