Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6288F1C8611
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 04:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764910563; cv=none; b=JXFia7nxiCYPRbrjbUtB1e9qXK2CNQ2opppaI1glxTmNlNq7bsUuHPxY47U6W2INK4d6NM12Vcg6vVhdjrYdeY/Dk7swVECAL57xapgJWFpjbtalMRrHvJG+6XzJfstuhQUvsFuFAybsyDynIfptQXf03xgVVuZeTfGnRKxKq5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764910563; c=relaxed/simple;
	bh=yPZVPVdMlN9gGwGOC78fcfSb7vHD0bptmFKIZdPd11M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B9eqpvO3/REt0HENbrm+FrrCXb3pIFv8LT5FlKtXV65GnUR10UYzPzuoB/3vliAuwY2ZQemtyj4NV5SAnMiSA1ptN0g+ELIZsCamlO/WhGBgUoi8gHst8KYe8zNJ/ODI8Tdg5KBN2fuZxNlQx9juJuzTEreGurold7/11TviBsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0ov6bh1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0ov6bh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764910560; x=1796446560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yPZVPVdMlN9gGwGOC78fcfSb7vHD0bptmFKIZdPd11M=;
  b=d0ov6bh1DXixkNRDlzkarXODJ2R18sAH0WrNJJMSwUTB4CpyUdTdBEGG
   GOoApk++K5ZjeH1923k76t/xxkiJ2XVOugQ4BlbP6JVh4WSYVadVecfI0
   xbVOlCnek/f7LwEbQuFeb8nWgWJ5UqSgJRl7u5WWcqHbrxwItiyseQ00u
   qKd/lvVbn/TyusN2dx2+Oix0HVOkK7tEgw+Vx2Ze8shrubvjyXXZrkPzc
   FRP3q5RR2gnvMl/WUdbIzcFo9RmQAemR7AAZ92DVosuoRbSR5wB4W8y2v
   NbzeM+LWwM7zbvRFEJ+QqT8UzQIMfEZXEgmJ50sSQ6cJqHZfdIvfGI2at
   w==;
X-CSE-ConnectionGUID: 4CZpgzAXSUqlzJb2GbI2tQ==
X-CSE-MsgGUID: SlFn2VHoT+6qWtYqiXtvMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66978531"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="66978531"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 20:55:59 -0800
X-CSE-ConnectionGUID: QYI7ft1qQnqNcpNb3viz/g==
X-CSE-MsgGUID: JKzfunjaT6qTADb+VhhOlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="199628357"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Dec 2025 20:55:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRNrH-00000000Ecb-3dpj;
	Fri, 05 Dec 2025 04:55:55 +0000
Date: Fri, 5 Dec 2025 12:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3479/3479] include/linux/mmzone.h:1788:2: error:
 Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <202512051233.eoZixxMi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f9a278cf61499e631038cf7d7847bb990cf89d7e
commit: c93eb12529e21dbb59796132f4fdf75fad4eddaf [3479/3479] LoongArch: Adapted SECTION_SIZE_BITS with page size
config: loongarch-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051233.eoZixxMi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d8b43edf552840e59a22a7f3cc332697bd434782)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051233.eoZixxMi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051233.eoZixxMi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1788:2: error: Allocator MAX_ORDER exceeds SECTION_SIZE
    1788 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
         |  ^
   In file included from arch/loongarch/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:1100:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:1100:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:1100:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:1100:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     100 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:1100:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:1100:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:1100:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:1100:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:


vim +1788 include/linux/mmzone.h

d41dee369bff3b Andy Whitcroft     2005-06-23  1783  
835c134ec4dd75 Mel Gorman         2007-10-16  1784  #define SECTION_BLOCKFLAGS_BITS \
d9c2340052278d Mel Gorman         2007-10-16  1785  	((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
835c134ec4dd75 Mel Gorman         2007-10-16  1786  
23baf831a32c04 Kirill A. Shutemov 2023-03-15  1787  #if (MAX_ORDER + PAGE_SHIFT) > SECTION_SIZE_BITS
d41dee369bff3b Andy Whitcroft     2005-06-23 @1788  #error Allocator MAX_ORDER exceeds SECTION_SIZE
d41dee369bff3b Andy Whitcroft     2005-06-23  1789  #endif
d41dee369bff3b Andy Whitcroft     2005-06-23  1790  

:::::: The code at line 1788 was first introduced by commit
:::::: d41dee369bff3b9dcb6328d4d822926c28cc2594 [PATCH] sparsemem memory model

:::::: TO: Andy Whitcroft <apw@shadowen.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
