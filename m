Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC0175A66
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 00:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781657464; cv=none; b=pMB/LxMvSLwhq9lo7gFjDjI2fF1BKkyqWVZYQ+76mM1dvZR6lra7U3Saf+y/Dv01pv2EORzwh9yVkFCwkQVqocAn1iMEn+Kx130u3dj9NGyAKvJmkeCGkKquxWHeGMZZ345UqKZ+sHHP8IBri0IKGcgnm3Zqn+RW0jj4OlPNQlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781657464; c=relaxed/simple;
	bh=p+Uux7ESHVl3yy6oryQ7a05ZfrPfD6hR63Nv1l6rdh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fwPMt6BywWTq6hIG5ACZpC5GqrUcEAetixt0Tax++37fVntoqjRhT6NnNQLkqx9Bq2J6wnpBYn629jKW7oDLgc7RZMvyvbxdPvtq8m4oLi73DV/jBcEmDabQmTzy2KoCPc90wgIspRv0upYAJIB476FSdT85ieay4ZwaKZJENYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ns/blalx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ns/blalx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781657462; x=1813193462;
  h=date:from:to:cc:subject:message-id;
  bh=p+Uux7ESHVl3yy6oryQ7a05ZfrPfD6hR63Nv1l6rdh4=;
  b=Ns/blalx9cMW+NJO/NsKL4KBE4rlVRDtKT2hoPG1fcZauH/qim+Sd1ve
   xYrq+48mg2lPgXxMiNjJYyMhCZTEUZPzziMKa1afku2f/Wqgc0LstI77U
   oaCV6ckf1Qzcy2PNjM9ryhxXvmF4ramTIteKzbsz8sFYK4cw6D5HVzqfV
   vj2YqXDQv2mSMBYmKPUyc9414/DFFkOdorI4YA+IlQ344KI7s2HVSZVHJ
   Om5JMKqRyPv0kizwGbjDGkwnVKGZ5JXTr8y0hMFApNNWwLVKReS+qknvg
   0a7XtcNQj3Hyf3CtQrznCT/Hh8/mGgAswbtgkj+qt/ChmLM5xF3axplwr
   Q==;
X-CSE-ConnectionGUID: tg1H3oitRsiOTrU47yWVYA==
X-CSE-MsgGUID: uH/j4m2CRFODjR5ZuHpCxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82539976"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82539976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 17:51:02 -0700
X-CSE-ConnectionGUID: VkTHjM/DRfOVeR6EvdaaFw==
X-CSE-MsgGUID: 1cz5Fg1YS0CPOCtMNh/m6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252239961"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jun 2026 17:50:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZeUb-00000000Txe-0WuL;
	Wed, 17 Jun 2026 00:50:57 +0000
Date: Wed, 17 Jun 2026 08:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/scsi 5/5]
 include/linux/alloc_tag.h:265:1: warning: initialization of 'void *' from
 'int' makes pointer from integer without a cast
Message-ID: <202606170853.axxilhtB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/scsi
head:   8434cdcf311874c86620e4dbacbe17f63b33eca4
commit: 8434cdcf311874c86620e4dbacbe17f63b33eca4 [5/5] scsi: sym53c8xx_2: replace __get_free_pages() with kmalloc()
config: alpha-randconfig-r132-20260617 (https://download.01.org/0day-ci/archive/20260617/202606170853.axxilhtB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170853.axxilhtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170853.axxilhtB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from drivers/scsi/sym53c8xx_2/sym_glue.h:32,
                    from drivers/scsi/sym53c8xx_2/sym_malloc.c:27:
   drivers/scsi/sym53c8xx_2/sym_malloc.c: In function '___mp0_get_mem_cluster':
   drivers/scsi/sym53c8xx_2/sym_hipd.h:1114:30: error: 'M_MEM_PAGE_ORDER' undeclared (first use in this function); did you mean 'SYM_MEM_PAGE_ORDER'?
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
>> include/linux/alloc_tag.h:265:1: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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


vim +265 include/linux/alloc_tag.h

b951aaff503502 Suren Baghdasaryan 2024-03-21  263  
b951aaff503502 Suren Baghdasaryan 2024-03-21  264  #define alloc_hooks(_do_alloc)						\
b951aaff503502 Suren Baghdasaryan 2024-03-21 @265  ({									\
b951aaff503502 Suren Baghdasaryan 2024-03-21  266  	DEFINE_ALLOC_TAG(_alloc_tag);					\
b951aaff503502 Suren Baghdasaryan 2024-03-21  267  	alloc_hooks_tag(&_alloc_tag, _do_alloc);			\
b951aaff503502 Suren Baghdasaryan 2024-03-21  268  })
b951aaff503502 Suren Baghdasaryan 2024-03-21  269  

:::::: The code at line 265 was first introduced by commit
:::::: b951aaff503502a7fe066eeed2744ba8a6413c89 mm: enable page allocation tagging

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
