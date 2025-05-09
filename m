Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBFF275841
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 07:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776986; cv=none; b=id5b+b8o5aPeg39M3AlZ3D/Ade94rniWkTAggUKk2cJWmMhrN30qvXqRe/1gE+UpxLBYeEs1X14Cy/YBJYWn71hGi6xRGnyLCHFFYe9+R5uNqhs88/R3sImDhXfBZDV9+SZ36QO9/0ikSuk7kUM61pEMJaS5PmxH1WjiP4Atys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776986; c=relaxed/simple;
	bh=hHyS+BKFg05l+jdbUgXNqDao47Qbetqcq0rM4PnJZlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=baN0IYFKVDDFPerh2zJ+JX5CpPl01toI+GX4sXyqsRchPuTJ9n5Iaj8kIvqF0UqSy3EMB8Lgfb8IeSYs8CCUGn0AbJ99uToSK/97HuBNpbQz8jkEwsHOfCzhWHhhP7pusIgGkktKCye5q+fiGbmWV+ocyPnIWfpxn97RMEKC154=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3xUww7u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3xUww7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746776985; x=1778312985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hHyS+BKFg05l+jdbUgXNqDao47Qbetqcq0rM4PnJZlA=;
  b=h3xUww7ud0pvX2pDpnwSOJGaBqto+IlslGQpuPkqaN8wfK98vHinzHoI
   C+jj1nZpbAtLttuQvtlzRYN3ttrfXgFMv5S9bQKbfyYRjFrmy16PEVw6G
   rAPttsjUbvpOc9x4cJqI0NhbsKoFVcKa2VTiRV80DOtkgl4yw/EB58DFs
   Y/HWgSIaFZIhV5eIe+Y1WSEScoeWxn7p7efOiXsO+9z4Go8Qngz1xgycd
   mpI70TybCFHjfnjusClTkAvuN8l334Qq5zorJMwmIiWoeNdwsU327eZNr
   i139uiK1vNofOcMOy/wbP9GCiGJhS7jATWx5d0CggMxal18V9DNwGyEnV
   Q==;
X-CSE-ConnectionGUID: 9AvcqNo1T/impI59xNaItQ==
X-CSE-MsgGUID: JhzZojv5SMehua5HMl/qtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48749068"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48749068"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 00:49:42 -0700
X-CSE-ConnectionGUID: ntK0CbaxQX2ff0Fv2pDdoA==
X-CSE-MsgGUID: 4GvHmYVzQjqm4chCEgAZEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136246095"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2025 00:49:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDIUE-000Blz-15;
	Fri, 09 May 2025 07:49:38 +0000
Date: Fri, 9 May 2025 15:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Juan Yescas <jyescas@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 333/334] include/linux/mmzone.h:1816:8:
 warning: left shift count is negative
Message-ID: <202505091548.FuKO4b4v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   930c125f685d7e8eef566fcd563390b76a28d824
commit: 16994f2b09a22523885d371caa59f17999686805 [333/334] mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order
config: powerpc64-randconfig-003-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091548.FuKO4b4v-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091548.FuKO4b4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/sparse.c:5:
   mm/sparse.c: In function 'usemap_size':
>> include/linux/mmzone.h:1816:8: warning: left shift count is negative [-Wshift-count-negative]
    1816 |  ((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
         |        ^~
   include/uapi/linux/const.h:51:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   mm/sparse.c:301:9: note: in expansion of macro 'BITS_TO_LONGS'
     301 |  return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsigned long);
         |         ^~~~~~~~~~~~~
   mm/sparse.c:301:23: note: in expansion of macro 'SECTION_BLOCKFLAGS_BITS'
     301 |  return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsigned long);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~


vim +1816 include/linux/mmzone.h

d41dee369bff3b Andy Whitcroft 2005-06-23  1814  
835c134ec4dd75 Mel Gorman     2007-10-16  1815  #define SECTION_BLOCKFLAGS_BITS \
d9c2340052278d Mel Gorman     2007-10-16 @1816  	((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
835c134ec4dd75 Mel Gorman     2007-10-16  1817  

:::::: The code at line 1816 was first introduced by commit
:::::: d9c2340052278d8eb2ffb16b0484f8f794def4de Do not depend on MAX_ORDER when grouping pages by mobility

:::::: TO: Mel Gorman <mel@csn.ul.ie>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
