Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C1D158DA8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721828734; cv=none; b=qzZHaF6nlitg/ucFwpqMJ8HPwUyggzt6zlWSdMcm/qKJjXpX5cyRtBIpeneVYyQNMX4GsKC0eYsrH7xn+plvmPmoPLCP3oA4Z082aAxgwzn2KBzHIBCzmMVt4KGFCXlQzBWrTy0Tf6jSmU0Hu4Yt/kEl5cABZIGxj6EKyimA/Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721828734; c=relaxed/simple;
	bh=GIDj0YKphk4JBiKSMylf0r6vSrieDSDaK/N71B3DyG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FcnT9LOODzSbMu8Eb6EhH6S50R7Y3D4KKDWmyWgMyVJChujgPldf6a0AWuZbC7i6bQ3b5T41S3r4aKxDI8MPlYIgkxbsGgBf3iHckdLJ49larB0Fj/oe2wOsnVHKkT9D8p5Z4EEU8ZhSeG7+HuvO6Ie+H3/ph4BgFDBHVDZjIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9KoGZvZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9KoGZvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721828730; x=1753364730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GIDj0YKphk4JBiKSMylf0r6vSrieDSDaK/N71B3DyG8=;
  b=R9KoGZvZB4XSYebBGMbk4Cl3ot70fuLwz+6yAnE3StsYrpKjEDJGHz4n
   iTezr/YaQfAQOc9Lpg0VStFsuFf7kuIYg9HDYg5GL5LPNguN7jJkBHkgz
   cfZ9KW/+ADNP2niJtSFk9/qNYX7JYLKQouA7WGUNDftRDJeCXhPA5syXW
   Z25GQIrALFgJQAisgyxiVlyNsF4vH34DfjS6V+dt5pKYAvTQ7SsV4G7xX
   5X26eTnRP1g2olBOPKf2CXXHHM7fF5Cuc/iU2IfcvU47erNW9sBB8ParG
   as2lpXMzrsuEUs9DTUul1HOhR8OgWrQ96mH+YPkhXNARfG+wpZjKM66Je
   w==;
X-CSE-ConnectionGUID: lv7Tk/fYTFmgBt9534yrNw==
X-CSE-MsgGUID: haE44RV1RBCIV+2TSlha2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30897345"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="30897345"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:45:24 -0700
X-CSE-ConnectionGUID: J2Ha88i+RzazEg5cmA+egQ==
X-CSE-MsgGUID: 41/TtSX9QGqSQgFoBj3obQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="52284228"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2024 06:45:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWcIw-000n2T-0F;
	Wed, 24 Jul 2024 13:45:18 +0000
Date: Wed, 24 Jul 2024 21:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 37/41] include/asm-generic/memory_model.h:19:57:
 error: invalid operands to binary - (have 'struct ptdesc *' and 'struct page
 *')
Message-ID: <202407242153.I7eA8mVl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   45de53e1a6ceb1ede64b54126f9ee514f50c4e4c
commit: 5f711d4ecc7f0a6cf15ad4c1bd3eba8224c7dca0 [37/41] mm/pgtable: introduce ptdesc_pfn and pass ptdesc to pmd_populate
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20240724/202407242153.I7eA8mVl-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242153.I7eA8mVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242153.I7eA8mVl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from include/linux/percpu.h:13,
                    from include/linux/kernel_stat.h:7,
                    from mm/memory.c:43:
   mm/memory.c: In function 'pmd_install':
>> include/asm-generic/memory_model.h:19:57: error: invalid operands to binary - (have 'struct ptdesc *' and 'struct page *')
      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
         |                                                  ~~~~~~ ^
   arch/xtensa/include/asm/page.h:193:36: note: in definition of macro '__va'
     193 |         ((void *)((unsigned long) (x) - PHYS_OFFSET + PAGE_OFFSET))
         |                                    ^
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   arch/xtensa/include/asm/page.h:196:38: note: in expansion of macro 'page_to_pfn'
     196 | #define page_to_virt(page)      __va(page_to_pfn(page) << PAGE_SHIFT)
         |                                      ^~~~~~~~~~~
   arch/xtensa/include/asm/pgalloc.h:27:45: note: in expansion of macro 'page_to_virt'
      27 |         (pmd_val(*(pmdp)) = ((unsigned long)page_to_virt(page)))
         |                                             ^~~~~~~~~~~~
   mm/memory.c:440:17: note: in expansion of macro 'pmd_populate'
     440 |                 pmd_populate(mm, pmd, page_ptdesc(*pte));
         |                 ^~~~~~~~~~~~


vim +19 include/asm-generic/memory_model.h

a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  17  
67de648211fa04 Andy Whitcroft    2006-06-23  18  #define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
67de648211fa04 Andy Whitcroft    2006-06-23 @19  #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  20  				 ARCH_PFN_OFFSET)
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  21  

:::::: The code at line 19 was first introduced by commit
:::::: 67de648211fa041fe08a0c25241a4980bbb90698 [PATCH] squash duplicate page_to_pfn and pfn_to_page

:::::: TO: Andy Whitcroft <apw@shadowen.org>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
