Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4152E739F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781665756; cv=none; b=QtdxQN9C1DNrWYHYAPoL9eOMwkhrRwAZjBqDPrDGNggCokmGrrDxZuPGBvxBXTb3G+MurgmdcPeUrMiW16mRgn0AwZd4I5YK2a2tlmXK3v5DsqKFGQ0pQvZ7TeaZ2HTexJOzdww/fkyDWxvVzzlp7B6j6z9DPy8KO+bUrMeas84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781665756; c=relaxed/simple;
	bh=z9UXdgmLX6cLrkzUo39xNNJoXBREq2RrIe7BkxfmqLE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KrPPCeDAHXX/wGALFiC6gOeSZfDJsI6EMr+ykAP5SwrT/MaFbYg96lkcLtTZpzqIAlTXcOTrLG9NnK7jOwgOkuuTn5P9muO431mrnqLsUj/vbFtR7cUDTyQH2mmvOTdCKuKOBSiViQB/wMAKdGNc5jZ2IY5ZlEU5uT+ibXzDIHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPx3fF4L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPx3fF4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781665754; x=1813201754;
  h=date:from:to:cc:subject:message-id;
  bh=z9UXdgmLX6cLrkzUo39xNNJoXBREq2RrIe7BkxfmqLE=;
  b=GPx3fF4LGXjRNQ9wzL5IamYb411cgL0X+/EdnXPQ3dTehT0iWhWMmWGW
   DcbVf04pul96xiyZoSNNadtti1j2FuhvSlCc+aTp8m8QJ87HC9joEKjr+
   4zhbEzgHCAsXyjhgSpMASaNHaH/AsAWA65EuB+cwjMtfhOfKYPPSs9SRI
   9AMwMb9DYaZHNd8HXvqaN2N94+0xKLSOxPXC3al1dDOkH6imizxh4eeAR
   O8+KfxapDDCBE76WvdJeT+bFx2SLtlTfUP2QfDI/AZ3nj3uN0eW95/FKk
   E56Vnx4gjff8RDVNqvEM+gBhtxAVXMhOsSgT7cxlVjrjgy1PBkJQZdgzR
   g==;
X-CSE-ConnectionGUID: ghkXs2pqRwKJL+CwNybmFA==
X-CSE-MsgGUID: WRzeD2r5Q3GKxFtyIaEHcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86289065"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="86289065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 20:09:13 -0700
X-CSE-ConnectionGUID: XczITEsWQFSwIUqxVsBdgw==
X-CSE-MsgGUID: YQQruJ9QRoe+QDb3pQ3wqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247816439"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jun 2026 20:09:07 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZgeG-00000000U3I-1SpP;
	Wed, 17 Jun 2026 03:09:04 +0000
Date: Wed, 17 Jun 2026 11:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/scsi 5/5]
 drivers/scsi/sym53c8xx_2/sym_hipd.h:1114:30: error: 'M_MEM_PAGE_ORDER'
 undeclared; did you mean 'SYM_MEM_PAGE_ORDER'?
Message-ID: <202606171041.3GpQKydM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/scsi
head:   8434cdcf311874c86620e4dbacbe17f63b33eca4
commit: 8434cdcf311874c86620e4dbacbe17f63b33eca4 [5/5] scsi: sym53c8xx_2: replace __get_free_pages() with kmalloc()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260617/202606171041.3GpQKydM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171041.3GpQKydM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171041.3GpQKydM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from drivers/scsi/sym53c8xx_2/sym_glue.h:32,
                    from drivers/scsi/sym53c8xx_2/sym_malloc.c:27:
   drivers/scsi/sym53c8xx_2/sym_malloc.c: In function '___mp0_get_mem_cluster':
>> drivers/scsi/sym53c8xx_2/sym_hipd.h:1114:30: error: 'M_MEM_PAGE_ORDER' undeclared (first use in this function); did you mean 'SYM_MEM_PAGE_ORDER'?
    1114 |         kmalloc(PAGE_SIZE << M_MEM_PAGE_ORDER, GFP_ATOMIC)
         |                              ^~~~~~~~~~~~~~~~
   include/linux/alloc_tag.h:253:16: note: in definition of macro 'alloc_hooks_tag'
     253 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/scsi/sym53c8xx_2/sym_hipd.h:1114:9: note: in expansion of macro 'kmalloc'
    1114 |         kmalloc(PAGE_SIZE << M_MEM_PAGE_ORDER, GFP_ATOMIC)
         |         ^~~~~~~
   drivers/scsi/sym53c8xx_2/sym_malloc.c:182:19: note: in expansion of macro 'sym_get_mem_cluster'
     182 |         void *m = sym_get_mem_cluster();
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/sym53c8xx_2/sym_hipd.h:1114:30: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/alloc_tag.h:253:16: note: in definition of macro 'alloc_hooks_tag'
     253 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/scsi/sym53c8xx_2/sym_hipd.h:1114:9: note: in expansion of macro 'kmalloc'
    1114 |         kmalloc(PAGE_SIZE << M_MEM_PAGE_ORDER, GFP_ATOMIC)
         |         ^~~~~~~
   drivers/scsi/sym53c8xx_2/sym_malloc.c:182:19: note: in expansion of macro 'sym_get_mem_cluster'
     182 |         void *m = sym_get_mem_cluster();
         |                   ^~~~~~~~~~~~~~~~~~~
>> include/linux/alloc_tag.h:265:1: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     265 | ({                                                                      \
         | ^
   include/linux/slab.h:956:49: note: in expansion of macro 'alloc_hooks'
     956 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/scsi/sym53c8xx_2/sym_hipd.h:1114:9: note: in expansion of macro 'kmalloc'
    1114 |         kmalloc(PAGE_SIZE << M_MEM_PAGE_ORDER, GFP_ATOMIC)
         |         ^~~~~~~
   drivers/scsi/sym53c8xx_2/sym_malloc.c:182:19: note: in expansion of macro 'sym_get_mem_cluster'
     182 |         void *m = sym_get_mem_cluster();
         |                   ^~~~~~~~~~~~~~~~~~~


vim +1114 drivers/scsi/sym53c8xx_2/sym_hipd.h

  1108	
  1109	/*
  1110	 *  MEMORY ALLOCATOR.
  1111	 */
  1112	
  1113	#define sym_get_mem_cluster()	\
> 1114		kmalloc(PAGE_SIZE << M_MEM_PAGE_ORDER, GFP_ATOMIC)
  1115	#define sym_free_mem_cluster(p)	\
  1116		kfree(p)
  1117	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
