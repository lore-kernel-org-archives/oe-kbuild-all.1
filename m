Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118717CF17
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712649059; cv=none; b=IDrueOdAtx8AWcJiYIYlvgAmYjF8x4pUbYA76bpGOdw5G6XttbYyAEGAU2psFTKq7pD9ZtEFegnloFy+jAPgfaMvDccF/wAC3f4tJ7BYbAQXL+ha0U2KMugUqPI5rQC0RgQXpIdX5PMGBLPnzFL8p8oGlLxo4Uw7ou35zSHQ00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712649059; c=relaxed/simple;
	bh=8ntc97KUnmfcG8DyO5i/8R0TgzWLpzvDwps2cNg/Rwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nLt7MkiUbHXQxGIEiIUWoEKYNVeJYWOMvnqHHt3PwiKg/GlwGyg5b/Ffl79RAefgIMFAOC7MSLJHiK5tWMnlgwG8BvxK3YBXOwjYH8sdZBQm+SZl0j1QzjkOIOSnXcxRUCTfFsUFDZlDcVPrQVa6HLugEq+0MUMUQdEItpvjWpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHbbuw7n; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHbbuw7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712649057; x=1744185057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ntc97KUnmfcG8DyO5i/8R0TgzWLpzvDwps2cNg/Rwo=;
  b=RHbbuw7nD6Hf8oqA7ViwQpYCayYPKlG5epA+ZD3vGQgXK0SfKwlR8pdh
   AlXNdXFXTUuB+0+mMhPIHVCrhZ/x5EBLn7eC1KyPsH5RjGaBxFhuPbHhV
   iiQUAKDyrwtUXWuzF+YWHDLOEqttgi3injPJmJeY9OeS7ScBTOoPtyD+A
   FzC3ik0+B/MFHC0v1qay05nTkCXSsGzB2uF4QnpmAMRWx5K5zONeRYxj4
   r7jejNrywOZsFnWdsWpkum7ga0/utb9esYgxklYX7vIZ4a880DFr57vna
   I6quQH7LwTz4Z/jWEZlrbUsapDq5CyfSvv/+I5arbWBEYNGE262I7I2mO
   g==;
X-CSE-ConnectionGUID: pONCjs10Tbyfwzz7waPpgw==
X-CSE-MsgGUID: t3Yw1GbwTuKbNN3stiJ31w==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18669628"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="18669628"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 00:50:56 -0700
X-CSE-ConnectionGUID: KjW4GQ9ASmOfuWVmq1Avrw==
X-CSE-MsgGUID: vJqHfAepRzm8pqThKoJp1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20037376"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Apr 2024 00:50:55 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru6Fo-0005sI-0R;
	Tue, 09 Apr 2024 07:50:52 +0000
Date: Tue, 9 Apr 2024 15:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4283/4584] mm/internal.h:206:70: warning: suggest
 parentheses around '+' in operand of '&'
Message-ID: <202404091516.9h8IdaMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a053fd3ca5d1b927a8655f239c84b0d790218fda
commit: 3317f7faabc24b500c26d02615ac75ca2786e272 [4283/4584] mm: swap: free_swap_and_cache_nr() as batched free_swap_and_cache()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240409/202404091516.9h8IdaMM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091516.9h8IdaMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091516.9h8IdaMM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/uaccess.h:16,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/dax.h:5,
                    from mm/filemap.c:15:
   mm/internal.h: In function 'pte_next_swp_offset':
>> mm/internal.h:206:70: warning: suggest parentheses around '+' in operand of '&' [-Wparentheses]
     206 |                                                    swp_offset(entry) + 1));
         |                                                    ~~~~~~~~~~~~~~~~~~^~~
   arch/parisc/include/asm/pgtable.h:432:53: note: in definition of macro '__swp_entry_to_pte'
     432 | #define __swp_entry_to_pte(x)           ((pte_t) { (x).val })
         |                                                     ^
   mm/internal.h:205:40: note: in expansion of macro '__swp_entry'
     205 |         pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
         |                                        ^~~~~~~~~~~
>> mm/internal.h:206:70: warning: suggest parentheses around '+' inside '>>' [-Wparentheses]
     206 |                                                    swp_offset(entry) + 1));
         |                                                    ~~~~~~~~~~~~~~~~~~^~~
   arch/parisc/include/asm/pgtable.h:432:53: note: in definition of macro '__swp_entry_to_pte'
     432 | #define __swp_entry_to_pte(x)           ((pte_t) { (x).val })
         |                                                     ^
   mm/internal.h:205:40: note: in expansion of macro '__swp_entry'
     205 |         pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
         |                                        ^~~~~~~~~~~
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/slub.c:13:
   mm/internal.h: In function 'pte_next_swp_offset':
>> mm/internal.h:206:70: warning: suggest parentheses around '+' in operand of '&' [-Wparentheses]
     206 |                                                    swp_offset(entry) + 1));
         |                                                    ~~~~~~~~~~~~~~~~~~^~~
   arch/parisc/include/asm/pgtable.h:432:53: note: in definition of macro '__swp_entry_to_pte'
     432 | #define __swp_entry_to_pte(x)           ((pte_t) { (x).val })
         |                                                     ^
   mm/internal.h:205:40: note: in expansion of macro '__swp_entry'
     205 |         pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
         |                                        ^~~~~~~~~~~
>> mm/internal.h:206:70: warning: suggest parentheses around '+' inside '>>' [-Wparentheses]
     206 |                                                    swp_offset(entry) + 1));
         |                                                    ~~~~~~~~~~~~~~~~~~^~~
   arch/parisc/include/asm/pgtable.h:432:53: note: in definition of macro '__swp_entry_to_pte'
     432 | #define __swp_entry_to_pte(x)           ((pte_t) { (x).val })
         |                                                     ^
   mm/internal.h:205:40: note: in expansion of macro '__swp_entry'
     205 |         pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
         |                                        ^~~~~~~~~~~
   mm/slub.c: In function 'slab_post_alloc_hook':
   mm/slub.c:3831:29: warning: variable 'obj_exts' set but not used [-Wunused-but-set-variable]
    3831 |         struct slabobj_ext *obj_exts;
         |                             ^~~~~~~~


vim +206 mm/internal.h

   194	
   195	/**
   196	 * pte_next_swp_offset - Increment the swap entry offset field of a swap pte.
   197	 * @pte: The initial pte state; is_swap_pte(pte) must be true.
   198	 *
   199	 * Increments the swap offset, while maintaining all other fields, including
   200	 * swap type, and any swp pte bits. The resulting pte is returned.
   201	 */
   202	static inline pte_t pte_next_swp_offset(pte_t pte)
   203	{
   204		swp_entry_t entry = pte_to_swp_entry(pte);
   205		pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
 > 206							   swp_offset(entry) + 1));
   207	
   208		if (pte_swp_soft_dirty(pte))
   209			new = pte_swp_mksoft_dirty(new);
   210		if (pte_swp_exclusive(pte))
   211			new = pte_swp_mkexclusive(new);
   212		if (pte_swp_uffd_wp(pte))
   213			new = pte_swp_mkuffd_wp(new);
   214	
   215		return new;
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
