Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EECF433B6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 22:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709246850; cv=none; b=J11Q+5P8aClwJx9RR+EK+rvD23DbV0V2OrTjxDBOfJqvjQoyXU6cjQZbU6UvlQYLZzjll3Eom0AfkUtjg8nv5mES8lauLTMComAt9n1K3XeuOnmjifvNmt6DBkfKe0AwkOGj7Q+rbS6/JMf/tipBDPnquDsB/d0FqH0+cE2OUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709246850; c=relaxed/simple;
	bh=lHPgga5SkCVYalzP8oJKxwPaAHX97NW1mzxjTXrNC24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OGr/utVmjrD9JtSk11aJFUOh+aaAdNIYFfKgY+tArmttqpWa/ki0ddhuS0DJEPpGr53JtZBvcR98Jjbrk7OENlG0UzU/WbSDd3Pa3mv9epBpiKeDjcOSIwcU2u7JRCUga1D7NE+w7Hgnykno2Ng1lWUa2pbfhhyiq15fqDD7DaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIGgaqOH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIGgaqOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709246848; x=1740782848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lHPgga5SkCVYalzP8oJKxwPaAHX97NW1mzxjTXrNC24=;
  b=ZIGgaqOHcPZ/a2A5MuXCVsQTYUd4dHPtgP1D1w9K4xMzm2TGQgcclvm5
   kYN2xOSN4s5uU58Mg7XAS4aROkUxNm7gzUNNt+EL0Y2LOwMHdiuHDkMbZ
   LVXltZ72b3nKq5xvk54gXgVj3nppAevSTIjtv3ggBnklk1stbawIfFHXZ
   I43MFx3atd3dKjH3bv6JMnutTmUv5KFcIvAi3YGPH6MlA9i6JmTHOBBLR
   RlZW9IGhcY93vaIQ+7G953BzAK3fFX3hfshffG4TmJ0brAN4vSPYKwYaC
   mPa65GDQJvXQvZ+u+QAmvS1DXi84iBXlYj2sViBmTNBY3wuDv/cr7kdH+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14398651"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14398651"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 14:47:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12674242"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Feb 2024 14:47:26 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfpBS-000DL9-2C;
	Thu, 29 Feb 2024 22:47:22 +0000
Date: Fri, 1 Mar 2024 06:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 10835/11156]
 include/asm-generic/pgtable-nop4d.h:11:33: error: 'PGDIR_SHIFT' undeclared;
 did you mean 'PUD_SHIFT'?
Message-ID: <202403010621.qsTLLsab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: d67cd9f23139ddfd7e0ef1e18474c16445188433 [10835/11156] mm: add __dump_folio()
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20240301/202403010621.qsTLLsab-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010621.qsTLLsab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010621.qsTLLsab-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/pgtable-nopud.h:7,
                    from arch/m68k/include/asm/pgtable_no.h:5,
                    from arch/m68k/include/asm/pgtable.h:6,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from mm/debug.c:10:
   mm/debug.c: In function '__dump_page':
>> include/asm-generic/pgtable-nop4d.h:11:33: error: 'PGDIR_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/linux/pgtable.h:9:26: note: in expansion of macro 'PUD_SHIFT'
       9 | #define PUD_ORDER       (PUD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   mm/debug.c:128:35: note: in expansion of macro 'PUD_ORDER'
     128 |                 if (idx < (1UL << PUD_ORDER)) {
         |                                   ^~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: each undeclared identifier is reported only once for each function it appears in
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/linux/pgtable.h:9:26: note: in expansion of macro 'PUD_SHIFT'
       9 | #define PUD_ORDER       (PUD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   mm/debug.c:128:35: note: in expansion of macro 'PUD_ORDER'
     128 |                 if (idx < (1UL << PUD_ORDER)) {
         |                                   ^~~~~~~~~


vim +11 include/asm-generic/pgtable-nop4d.h

048456dcf2c56a Kirill A. Shutemov 2017-03-09  10  
048456dcf2c56a Kirill A. Shutemov 2017-03-09 @11  #define P4D_SHIFT		PGDIR_SHIFT
048456dcf2c56a Kirill A. Shutemov 2017-03-09  12  #define PTRS_PER_P4D		1
048456dcf2c56a Kirill A. Shutemov 2017-03-09  13  #define P4D_SIZE		(1UL << P4D_SHIFT)
048456dcf2c56a Kirill A. Shutemov 2017-03-09  14  #define P4D_MASK		(~(P4D_SIZE-1))
048456dcf2c56a Kirill A. Shutemov 2017-03-09  15  

:::::: The code at line 11 was first introduced by commit
:::::: 048456dcf2c56ad6f6248e2899dda92fb6a613f6 asm-generic: introduce <asm-generic/pgtable-nop4d.h>

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
