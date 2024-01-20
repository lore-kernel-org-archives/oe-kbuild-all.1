Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705D320F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 07:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705736738; cv=none; b=ZCF7zAeBLc7EHa7PkSh54yJDO9dfBnfslL7ftDwey0TPVGHxyJPb3gcvp/osFBg2RoKWTjrpBKVeidOn07xFF7mhgwoE6sV+l3PgVrR8OM9W4Ke+W337nImLsCtMvfxI483wAC8PjG/o83HOHo6a1FZxBducxq6INNPU9xrwzGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705736738; c=relaxed/simple;
	bh=SKKkUmw3gdHWR/jh0aTL/CHmvC4Y8GhWnwVjwSY14KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZLEYJk6/ovXM2KhRcoaEOpIbI7bwM4zy6tXdkCzbCerlJXIqPKdwB/J4MWH74vUiXVi5MmZq/5M9C8pNZJr2XpvbOs5qLnzCAWZOgt8kFCnDXgeYbGRr8RdYkRQZPp+BSIkAoy0zu6Mnx4540naUx+RfZ69wp2jcchQJVGvi0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5xoDP5Z; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5xoDP5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705736736; x=1737272736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SKKkUmw3gdHWR/jh0aTL/CHmvC4Y8GhWnwVjwSY14KQ=;
  b=H5xoDP5ZCi30A1mer4VGMzWMlWFJxUa9dtmkcXGfR5tehJoQ3lU8wPI2
   zUx8gUJ0/+s3JjahHJ9kIekRIad274dQIfoXty808XAYLVbecrdcy+fE7
   2uRKPsznQw6fCJiP4LVfQVpIRmXPPRRNB5fSvFBRWfz0dtiwwkrYM0KV5
   9sVMKrpierGy/K/8+YAGx4FA+AhlxMNNIXSMxLdoBnLTXKBHJpsBUe8qf
   euJh/dmatzW4jjiQ06trAPkasnOpRfrm9xn/SP0wYc2CR1cox9DAgmVB1
   9H6etxkDNmUnnDIVZqWfcde60VbX8hNX96tna2/K7OVaRRrexeJQdpMVY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="467301378"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="467301378"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 23:45:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="908511098"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="908511098"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2024 23:45:32 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR62j-0004sE-2D;
	Sat, 20 Jan 2024 07:45:29 +0000
Date: Sat, 20 Jan 2024 15:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_batching 3/11] sound/pci/sonicvibes.c:37:12:
 warning: 'index' defined but not used
Message-ID: <202401201503.BSntoUAh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_batching
head:   c54f3b69b7a799efa06dbf58a60db9b3fac04111
commit: d84c9158468598cb15b038bca27fd80e113b456c [3/11] mm/memory: optimize fork() with PTE-mapped THP
config: sparc-randconfig-002-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201503.BSntoUAh-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201503.BSntoUAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201503.BSntoUAh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:29,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dmapool.h:14,
                    from include/linux/pci.h:1648,
                    from sound/pci/sonicvibes.c:14:
   include/linux/pgtable.h: In function 'wrprotect_ptes':
   include/linux/pgtable.h:227:17: error: implicit declaration of function 'ptep_set_wrprotect'; did you mean 'pte_wrprotect'? [-Werror=implicit-function-declaration]
     227 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 pte_wrprotect
   include/linux/pgtable.h: At top level:
   include/linux/pgtable.h:638:20: warning: conflicting types for 'ptep_set_wrprotect'; have 'void(struct mm_struct *, long unsigned int,  pte_t *)' {aka 'void(struct mm_struct *, long unsigned int,  long unsigned int *)'}
     638 | static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:638:20: error: static declaration of 'ptep_set_wrprotect' follows non-static declaration
   include/linux/pgtable.h:227:17: note: previous implicit declaration of 'ptep_set_wrprotect' with type 'void(struct mm_struct *, long unsigned int,  pte_t *)' {aka 'void(struct mm_struct *, long unsigned int,  long unsigned int *)'}
     227 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:21,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sparc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:22,
                    from sound/pci/sonicvibes.c:11:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:228:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/sonicvibes.c:44:1: note: in expansion of macro 'module_param_array'
      44 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/sonicvibes.c:37:12: warning: 'index' defined but not used [-Wunused-variable]
      37 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
   cc1: some warnings being treated as errors


vim +/index +37 sound/pci/sonicvibes.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  36  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @37  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* Index 0-MAX */
^1da177e4c3f41 Linus Torvalds 2005-04-16  38  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
a67ff6a54095e2 Rusty Russell  2011-12-15  39  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;	/* Enable this card */
a67ff6a54095e2 Rusty Russell  2011-12-15  40  static bool reverb[SNDRV_CARDS];
a67ff6a54095e2 Rusty Russell  2011-12-15  41  static bool mge[SNDRV_CARDS];
^1da177e4c3f41 Linus Torvalds 2005-04-16  42  static unsigned int dmaio = 0x7a00;	/* DDMA i/o address */
^1da177e4c3f41 Linus Torvalds 2005-04-16  43  

:::::: The code at line 37 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
