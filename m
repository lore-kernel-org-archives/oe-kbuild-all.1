Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C4D1FA2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 03:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710213021; cv=none; b=OTuRA/V2r8zyVxDOAG1X0xqApYFFtWM1Ish1aKDiSn2Q4mA7U9jo4BiDD712pMx0tH28k+gR7DqzlMTI16cErIqaZGcUlR3ClWJ5J11+d6A+FZfyQFXplRtq5lFstrA1Yz+1pC7IcAjbGAqRMw97dtHGj2PbQH7VTJHNhYm6oR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710213021; c=relaxed/simple;
	bh=U+oyrS5uehra0ABMQj1QjaJjTjEQmFXvp5HcqmT36kY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BfO6hD1GRR8LLTjoem9qFtUKhnjceEelEVznJcHN1tVh0s0sMQsaq/sLyn1QjrXW4zE2AZlr6LtpLTn3lG5A5mBL8sCExOsLBsIwd9YovLVLBPE/j30ShMtxEgPVna/ngodkDO36KFDBnGvYDOoaZDrEdTR1kY0zVtp+pbnkXTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHPe9VuR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHPe9VuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710213016; x=1741749016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+oyrS5uehra0ABMQj1QjaJjTjEQmFXvp5HcqmT36kY=;
  b=eHPe9VuRlNsmfMs2jU4WaeLWqZ1mZ7zHyMBeGpSduMvoO1TBtuE3zUSF
   jEcy4+drgnm/gCYoEr7JIBJBpNBlq/xJqRJ6bfhWdxLxqIwFTwgjH+VCf
   p3iO4HH1M1T0uT0j+9vyH48X0wRsYD8MiY2kq6t/SDk8el5ooMvK87Rh3
   4NzcuGe/8yxFq3tyWpyBG+LXmWZ+PZYhIcho2MAxrtu+njG/3BW6yPi+/
   lQaDCBIST4FoMvEPXhJSA5YYjFDob4fBOKtwAQ/1isZky2Sd2IL8BQzLR
   +ljI13jielWAa4J4vOJn4ZIBKg4LIeE67/u7i+ZK+082+zn55FIwCKU3I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="30346281"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="30346281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 20:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="16079281"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Mar 2024 20:10:14 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjsWp-0009gZ-2d;
	Tue, 12 Mar 2024 03:10:11 +0000
Date: Tue, 12 Mar 2024 11:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/18] mm/page_size_compat.c:137:41:
 warning: implicit conversion from 'unsigned long long' to 'unsigned long'
 changes value from 9223372036854775858 to 50
Message-ID: <202403121133.X3RkzMqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   23e5041bd90d0f3c526a3821c5f06b88c17784a9
commit: 66197e927d9f4f6fe4d6cc90da3894a95daa71d8 [1/18] ANDROID: 16K: Handle filemap faults
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240312/202403121133.X3RkzMqp-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121133.X3RkzMqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121133.X3RkzMqp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_size_compat.c:12:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_size_compat.c:13:
   include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/page_size_compat.c:137:41: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 9223372036854775858 to 50 [-Wconstant-conversion]
     136 |         anon_addr = do_mmap(NULL, anon_addr, anon_len, prot,
         |                     ~~~~~~~
     137 |                                         MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED|__MAP_NO_COMPAT,
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   4 warnings generated.


vim +137 mm/page_size_compat.c

  > 13	#include <linux/mm_inline.h>
    14	#include <linux/page_size_compat.h>
    15	
    16	#define MIN_PAGE_SHIFT_COMPAT (PAGE_SHIFT + 1)
    17	#define MAX_PAGE_SHIFT_COMPAT 16 /* Max of 64KB */
    18	#define __MMAP_RND_BITS(x)      (x - (__PAGE_SHIFT - PAGE_SHIFT))
    19	
    20	DEFINE_STATIC_KEY_FALSE(page_shift_compat_enabled);
    21	
    22	int page_shift_compat = MIN_PAGE_SHIFT_COMPAT;
    23	
    24	static int __init early_page_shift_compat(char *buf)
    25	{
    26		int ret;
    27	
    28		ret = kstrtoint(buf, 10, &page_shift_compat);
    29		if (ret)
    30			return ret;
    31	
    32		/* Only supported on 4KB kernel */
    33		if (PAGE_SHIFT != 12)
    34			return -ENOTSUPP;
    35	
    36		if (page_shift_compat < MIN_PAGE_SHIFT_COMPAT ||
    37			page_shift_compat > MAX_PAGE_SHIFT_COMPAT)
    38			return -EINVAL;
    39	
    40		static_branch_enable(&page_shift_compat_enabled);
    41	
    42		return 0;
    43	}
    44	early_param("androidboot.page_shift", early_page_shift_compat);
    45	
    46	static int __init init_mmap_rnd_bits(void)
    47	{
    48		if (!static_branch_unlikely(&page_shift_compat_enabled))
    49			return 0;
    50	
    51	#ifdef CONFIG_HAVE_ARCH_MMAP_RND_BITS
    52		mmap_rnd_bits_min = __MMAP_RND_BITS(CONFIG_ARCH_MMAP_RND_BITS_MIN);
    53		mmap_rnd_bits_max = __MMAP_RND_BITS(CONFIG_ARCH_MMAP_RND_BITS_MAX);
    54		mmap_rnd_bits = __MMAP_RND_BITS(CONFIG_ARCH_MMAP_RND_BITS);
    55	#endif
    56	
    57		return 0;
    58	}
    59	core_initcall(init_mmap_rnd_bits);
    60	
    61	/*
    62	 * Updates len to avoid mapping off the end of the file.
    63	 *
    64	 * The length of the original mapping must be updated before
    65	 * it's VMA is created to avoid an unaligned munmap in the
    66	 * MAP_FIXED fixup mapping.
    67	 */
    68	unsigned long ___filemap_len(struct inode *inode, unsigned long pgoff, unsigned long len,
    69				     unsigned long flags)
    70	{
    71		unsigned long file_size;
    72		unsigned long new_len;
    73		pgoff_t max_pgcount;
    74		pgoff_t last_pgoff;
    75	
    76		if (flags & __MAP_NO_COMPAT)
    77			return len;
    78	
    79		file_size = (unsigned long) i_size_read(inode);
    80	
    81		/*
    82		 * Round up, so that this is a count (not an index). This simplifies
    83		 * the following calculations.
    84		 */
    85		max_pgcount = DIV_ROUND_UP(file_size, PAGE_SIZE);
    86		last_pgoff = pgoff + (len >> PAGE_SHIFT);
    87	
    88		if (unlikely(last_pgoff >= max_pgcount)) {
    89			new_len = (max_pgcount - pgoff)  << PAGE_SHIFT;
    90			/* Careful of underflows in special files */
    91			if (new_len > 0 && new_len < len)
    92				return new_len;
    93		}
    94	
    95		return len;
    96	}
    97	
    98	/*
    99	 * This is called to fill any holes created by ___filemap_len()
   100	 * with an anonymous mapping.
   101	 */
   102	void ___filemap_fixup(unsigned long addr, unsigned long prot, unsigned long old_len,
   103			      unsigned long new_len)
   104	{
   105		unsigned long anon_len = old_len - new_len;
   106		unsigned long anon_addr = addr + new_len;
   107		struct mm_struct *mm = current->mm;
   108		unsigned long populate = 0;
   109		struct vm_area_struct *vma;
   110	
   111		if (!anon_len)
   112			return;
   113	
   114		BUG_ON(new_len > old_len);
   115	
   116		/* The original do_mmap() failed */
   117		if (IS_ERR_VALUE(addr))
   118			return;
   119	
   120		vma = find_vma(mm, addr);
   121	
   122		/*
   123		 * This should never happen, VMA was inserted and we still
   124		 * haven't released the mmap write lock.
   125		 */
   126		BUG_ON(!vma);
   127	
   128		/* Only handle fixups for filemap faults */
   129		if (vma->vm_ops && vma->vm_ops->fault != filemap_fault)
   130			return;
   131	
   132		/*
   133		 * Override the end of the file mapping that is off the file
   134		 * with an anonymous mapping.
   135		 */
   136		anon_addr = do_mmap(NULL, anon_addr, anon_len, prot,
 > 137						MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED|__MAP_NO_COMPAT,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
