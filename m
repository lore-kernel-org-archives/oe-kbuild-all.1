Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77362367CC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744466965; cv=none; b=Pictmaf+CV93O8jOP2dRP5Em0SEMjwoxFHFIRueL6q8Po5IsC6YoEhlr7DldqZxzZjASFvch0HL9K/G1gSmJwfguvSFVJe2rUxF42SuC/fxBud+SayLAGyFJFaxuEBNuRF9qlMw+6qY+nE0ATZSwH5BWD1gP3J7nv87WBTKgAfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744466965; c=relaxed/simple;
	bh=4+oVleCTuz37mxGel3l3UuJolpaz0dEJ1tetBiWFw8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=atyftYnJ6cg2/haP3NGlDSXMa/HsiUhcgYs5uWW7+kLoYZhFs7BDQ5QVi3DTtxQ8r42VTAuhZ4kwyhzedzVfodjzg7ypkOuYqVk+PZHzGgGgS1V/fLnQeDcXvYHsPJRX2aLs20JvCBcnGwLmKY8NnWM+7dfoFzF5E2rume4c2wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rvtxuiir; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rvtxuiir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744466963; x=1776002963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+oVleCTuz37mxGel3l3UuJolpaz0dEJ1tetBiWFw8g=;
  b=Rvtxuiir3zQwy7jbDqNwfJu0kPeNRrf27XzJB57bBUN7mWsb9OfCp25l
   7hFfji8opU18NeB3Pw8J3tfqGHpgRTc69jTsMgFaleABnPBhZH9TuZGl6
   N3HCwAtk71lf0eRUCfu1yr4cbNA9LGZ/7CjnZoqlxvpVe9KUUm4vyhgNj
   u8uA/sohRdwwneJHF5HC7I1awlsaBBTeOwamxe4M027Vn2Y1ezLBoutHP
   jZAGfMY3EjJQe9etTVwp6w93shxvjs7OR3TklLWq1xIGjojsCgjHPVCYI
   zBHdOSuqvguPCmdDXeSZoe19jpZAdqgYl7avcMzBqVTpeoD3LSHU43gzA
   A==;
X-CSE-ConnectionGUID: CRZASO7TSBCVTlO+NvrfXg==
X-CSE-MsgGUID: SYXXMrI9SamGG9sIF9uh6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46129969"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="46129969"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 07:09:22 -0700
X-CSE-ConnectionGUID: wfUmNB36QxSxdOzA8+jzcg==
X-CSE-MsgGUID: /eNNrvUKS6+U4OeceEoV7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="129192027"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Apr 2025 07:09:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3bXq-000Bpu-2F;
	Sat, 12 Apr 2025 14:09:18 +0000
Date: Sat, 12 Apr 2025 22:08:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 16/16]
 include/linux/page-flags.h:989:45: error: 'const struct page' has no member
 named 'type'
Message-ID: <202504122207.SBWWU5Gv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   803af5b7e068ea5c68e5b908e799abf3f254c646
commit: 803af5b7e068ea5c68e5b908e799abf3f254c646 [16/16] tmp
config: arc-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504122207.SBWWU5Gv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504122207.SBWWU5Gv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504122207.SBWWU5Gv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/ptrace.h:11,
                    from arch/arc/include/asm/processor.h:16,
                    from include/linux/sched.h:13,
                    from arch/arc/kernel/asm-offsets.c:6:
   include/linux/page-flags.h: In function 'page_has_non_folio_type':
>> include/linux/page-flags.h:989:45: error: 'const struct page' has no member named 'type'
     989 |         const int page_type = data_race(page->type);
         |                                             ^~
   include/linux/compiler.h:189:28: note: in definition of macro 'data_race'
     189 |         __auto_type __v = (expr);                                       \
         |                            ^~~~
>> include/linux/compiler.h:191:9: error: '__v' undeclared (first use in this function)
     191 |         __v;                                                            \
         |         ^~~
   include/linux/page-flags.h:989:31: note: in expansion of macro 'data_race'
     989 |         const int page_type = data_race(page->type);
         |                               ^~~~~~~~~
   include/linux/compiler.h:191:9: note: each undeclared identifier is reported only once for each function it appears in
     191 |         __v;                                                            \
         |         ^~~
   include/linux/page-flags.h:989:31: note: in expansion of macro 'data_race'
     989 |         const int page_type = data_race(page->type);
         |                               ^~~~~~~~~
   In file included from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/arc/kernel/asm-offsets.c:7:
   include/linux/page-flags.h: In function 'page_test_non_folio_movable':
>> include/linux/page-flags.h:1198:74: error: expected ';' before '}' token
    1198 |         return PageNonFolioMovable(page) && page_has_non_folio_type(page)
         |                                                                          ^
         |                                                                          ;
    1199 | }
         | ~                                                                         
   make[3]: *** [scripts/Makefile.build:98: arch/arc/kernel/asm-offsets.s] Error 1 shuffle=2434624089
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1277: prepare0] Error 2 shuffle=2434624089
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2434624089
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2434624089
   make: Target 'prepare' not remade because of errors.


vim +989 include/linux/page-flags.h

   977	
   978	/**
   979	 * page_has_non_folio_type - test whether the page has a non-folio type
   980	 * @page: The page.
   981	 *
   982	 * Test whether the page has a non-folio type. Helpful to identify pages
   983	 * that might be non-folio movable.
   984	 *
   985	 * Returns true if the page has a non-folio type, otherwise false.
   986	 */
   987	static inline bool page_has_non_folio_type(const struct page *page)
   988	{
 > 989		const int page_type = data_race(page->type);
   990	
   991		return page_type_has_type(page_type) &&
   992		       (page_type >> 24 != PGTY_hugetlb);
   993	}
   994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
