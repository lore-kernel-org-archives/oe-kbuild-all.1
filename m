Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF16E171B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQgUNYuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700819350; x=1732355350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cfakJGm+0YzDEVydWqtocyQ3+ZgIY0IE8qHMvd/qBdQ=;
  b=BQgUNYuNYM8jJXRsJ+BF6+K1ZCrq2sRbtzSjDl+2AQl/Yi/+QU1TrQJv
   Sfdz4oGhvMDYBShZqzz3JEcRGLbEwGvTiCvv09vuvvUB63gIEv8vhNob1
   mED4/Lq/v2ePoacfX9K2gzNed6JFlBk3g0RAa6TbIwXvkH1kojoeZrM9y
   D5K52ZugWV2RUPRWJ6laSCjybk17yQkotS9/1sZ7UKYnzRJQ5kPZfYGTH
   6ZzI+BJLNCjiS4rhiIlzGXGMvUekcZ1kFnVXBVwnlw8K4vlh/OPjYqjSw
   YfCRICHKgVi7HJyg6Mq8y/U8md0DwejJSjxeqlLezhB68rm+cg2eKzWTK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423534629"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="423534629"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="717327110"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="717327110"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Nov 2023 01:49:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6So5-0002L6-2w;
	Fri, 24 Nov 2023 09:49:05 +0000
Date: Fri, 24 Nov 2023 17:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V1 01/11] mm: Fix misused APIs on huge pte
Message-ID: <202311241224.c1p15wQZ-lkp@intel.com>
References: <20231123065708.91345-2-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123065708.91345-2-luxu.kernel@bytedance.com>

Hi Xu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arnd-asm-generic/master linus/master v6.7-rc2 next-20231124]
[cannot apply to efi/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Lu/mm-Fix-misused-APIs-on-huge-pte/20231123-150128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231123065708.91345-2-luxu.kernel%40bytedance.com
patch subject: [RFC PATCH V1 01/11] mm: Fix misused APIs on huge pte
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231124/202311241224.c1p15wQZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241224.c1p15wQZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241224.c1p15wQZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/mprotect.c: In function 'prot_none_hugetlb_entry':
>> mm/mprotect.c:558:43: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
     558 |         return pfn_modify_allowed(pte_pfn(huge_ptep_get(pte)),
         |                                           ^~~~~~~~~~~~~
>> mm/mprotect.c:558:43: error: incompatible type for argument 1 of 'pte_pfn'
     558 |         return pfn_modify_allowed(pte_pfn(huge_ptep_get(pte)),
         |                                           ^~~~~~~~~~~~~~~~~~
         |                                           |
         |                                           int
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/pagewalk.h:5,
                    from mm/mprotect.c:12:
   arch/x86/include/asm/pgtable.h:223:43: note: expected 'pte_t' but argument is of type 'int'
     223 | static inline unsigned long pte_pfn(pte_t pte)
         |                                     ~~~~~~^~~
>> mm/mprotect.c:561:1: warning: control reaches end of non-void function [-Wreturn-type]
     561 | }
         | ^
   cc1: some warnings being treated as errors
--
   mm/rmap.c: In function 'try_to_unmap_one':
>> mm/rmap.c:1611:39: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    1611 |                         pfn = pte_pfn(huge_ptep_get(pvmw.pte));
         |                                       ^~~~~~~~~~~~~
>> mm/rmap.c:1611:39: error: incompatible type for argument 1 of 'pte_pfn'
    1611 |                         pfn = pte_pfn(huge_ptep_get(pvmw.pte));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from mm/rmap.c:56:
   arch/x86/include/asm/pgtable.h:223:43: note: expected 'pte_t' but argument is of type 'int'
     223 | static inline unsigned long pte_pfn(pte_t pte)
         |                                     ~~~~~~^~~
   mm/rmap.c: In function 'try_to_migrate_one':
   mm/rmap.c:1968:39: error: incompatible type for argument 1 of 'pte_pfn'
    1968 |                         pfn = pte_pfn(huge_ptep_get(pvmw.pte));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   arch/x86/include/asm/pgtable.h:223:43: note: expected 'pte_t' but argument is of type 'int'
     223 | static inline unsigned long pte_pfn(pte_t pte)
         |                                     ~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/huge_ptep_get +558 mm/mprotect.c

   553	
   554	static int prot_none_hugetlb_entry(pte_t *pte, unsigned long hmask,
   555					   unsigned long addr, unsigned long next,
   556					   struct mm_walk *walk)
   557	{
 > 558		return pfn_modify_allowed(pte_pfn(huge_ptep_get(pte)),
   559					  *(pgprot_t *)(walk->private)) ?
   560			0 : -EACCES;
 > 561	}
   562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
