Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD2620E302
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740565184; cv=none; b=Ap9Ag3qu5E/3H6pIFzC4bFjQAkxXKvet4nkq1VmFNUJp9Mdsh4K5LHq40MGS2NolI3TJ+bjFOAvEOy8Qb0qozFeIwo8tar4DkYLs9oOR4iGhMxl/b2aB9c+MiKvUKGZwP/96WYVp87nWk35/CpZ/7W0uGaaU3wsncdGeNKtu0Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740565184; c=relaxed/simple;
	bh=8d9CVNzqcYfSzoJgfNngDaaby3oPszbs0ganm3V11sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sk4Lo15RvwniQSDGVt5Nqr8T6jld4j9ghi37xs0B6a5c5I3H1vgFyHtpj2xAS2E525Xo63+Bd03WEtu8Ihc5OoFlvSWJ9ICYxli3L0ZpQlq/QqNAGoyv8ozp4nupbg1TQNASNpObKXz75nCuVJpGlOuPQKWxFN6pdoaoj3RGpl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAdMNrcP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAdMNrcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740565183; x=1772101183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8d9CVNzqcYfSzoJgfNngDaaby3oPszbs0ganm3V11sI=;
  b=VAdMNrcPF+96pXSeFuUmTYwqfhAKV4swom3i6apcwsNW/0srJkXmxb1j
   VsJKcZsrANzLFBsjqQRYuvcQXDI3vB3oFRa9+ONosuHiV7gpvrv2ezdKG
   fiEKAIwPH+lROZTRNyqWC/AYScPiKqSlb2Eqk1ES1nHOZzce5EblBJRcL
   umsrOdId/ZeRUd7YmuMLqpRUBoKpdcsMhWQ39sO1teXzuX//lSz4tcddQ
   umwokq8d2g0JJWYKmH+s5CT3N0cnbCO4nfbGgaxjujcTdXtOSO1+Pqa1F
   tdxOCt1eozTpnNrthQM7rkZuSVtXZCl8VuDK2vqIMYPegw05W0/arAQuv
   w==;
X-CSE-ConnectionGUID: KVmRpJtuRK2/TiPerRLohg==
X-CSE-MsgGUID: u9hfWc+ESea9+yHlugCDDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40585669"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="40585669"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 02:19:40 -0800
X-CSE-ConnectionGUID: 2hGPj51yScWPMgjpYIgbWw==
X-CSE-MsgGUID: qNJHC2izSSGtM7m13e3MRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116856288"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2025 02:19:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnEVs-000BX9-2y;
	Wed, 26 Feb 2025 10:19:36 +0000
Date: Wed, 26 Feb 2025 18:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5933/6583]
 include/asm-generic/memory_model.h:47:21: error: implicit declaration of
 function 'page_to_section'; did you mean 'present_section'?
Message-ID: <202502261825.F56aq7iS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: a2d6e9c1a867bb9f13943cb8483e2ab85b630bcd [5933/6583] mm: page_ext: add an iteration API for page extensions
config: i386-buildonly-randconfig-001-20250226 (https://download.01.org/0day-ci/archive/20250226/202502261825.F56aq7iS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261825.F56aq7iS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261825.F56aq7iS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/page.h:89,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/page_ext.h: In function 'page_ext_iter_begin':
>> include/asm-generic/memory_model.h:47:21: error: implicit declaration of function 'page_to_section'; did you mean 'present_section'? [-Werror=implicit-function-declaration]
      47 |         int __sec = page_to_section(__pg);                      \
         |                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/page_ext.h:131:27: note: in expansion of macro 'page_to_pfn'
     131 |         iter->start_pfn = page_to_pfn(page);
         |                           ^~~~~~~~~~~
   In file included from include/linux/memcontrol.h:21,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
   include/linux/mm.h: At top level:
>> include/linux/mm.h:1965:29: error: conflicting types for 'page_to_section'; have 'long unsigned int(const struct page *)'
    1965 | static inline unsigned long page_to_section(const struct page *page)
         |                             ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:47:21: note: previous implicit declaration of 'page_to_section' with type 'int()'
      47 |         int __sec = page_to_section(__pg);                      \
         |                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/page_ext.h:131:27: note: in expansion of macro 'page_to_pfn'
     131 |         iter->start_pfn = page_to_pfn(page);
         |                           ^~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1418848070
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=1418848070
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1418848070
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1418848070
   make: Target 'prepare' not remade because of errors.


vim +47 include/asm-generic/memory_model.h

8f6aac419bd590 Christoph Lameter 2007-10-16  39  
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  40  #elif defined(CONFIG_SPARSEMEM)
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  41  /*
1a49123b343461 Zhang Yanfei      2013-10-03  42   * Note: section's mem_map is encoded to reflect its start_pfn.
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  43   * section[i].section_mem_map == mem_map's address - start_pfn;
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  44   */
67de648211fa04 Andy Whitcroft    2006-06-23  45  #define __page_to_pfn(pg)					\
aa462abe8aaf21 Ian Campbell      2011-08-17  46  ({	const struct page *__pg = (pg);				\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27 @47  	int __sec = page_to_section(__pg);			\
f05b6284ee5d3b Randy Dunlap      2007-02-10  48  	(unsigned long)(__pg - __section_mem_map_addr(__nr_to_section(__sec)));	\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  49  })
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  50  

:::::: The code at line 47 was first introduced by commit
:::::: a117e66ed45ac0569c039ea60bd7a9a61e031858 [PATCH] unify pfn_to_page: generic functions

:::::: TO: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
