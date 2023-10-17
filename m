Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980932D7BE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baWkpBAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697575535; x=1729111535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FZMS0pN1yrRgl8foiqji3lWYHAc4O4dnZzf1MXtbGUk=;
  b=baWkpBAbC9o5tCeCykAISldUeU8NvNEkWS6NH7uz+zEpQRnCokMQf9ay
   wdVgTz4hPyrTkLCmeQHhzluRIdxzuvyL8ALVU0lJdtTp+jvt3tUChV1A9
   RtikasF69eKmNwCqKbYJ59CBzfjZQviGZVDHrHKjfa/jwYo8DvlxTwKBw
   gC2mW9GlS6Wdv56OpXGElEwq4b4u3/gDzPxiVhR+jzgidmIFGJe5B7wUX
   AkPMSDStOv+MSaWfFBEjpxtVKhn+9NfTcLI7NyiunL8VR4+X5n+0aPeik
   JkCdZOdaXylE4GOA5NT+/V0zXJPJ6vgKYaBWwhJlV1j0Do+X6csoIURNZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366134730"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="366134730"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 13:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="4240116"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2023 13:45:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsqwV-000A3z-2D;
	Tue, 17 Oct 2023 20:45:31 +0000
Date: Wed, 18 Oct 2023 04:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-merge-6.7 47/51] include/linux/huge_mm.h:191:31:
 error: logical 'and' of mutually exclusive tests is always false
Message-ID: <202310180455.TaX9RJSP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-merge-6.7
head:   eee9645e1bf5f060c24ab0f52b2fc55a3ff68ec6
commit: 5ae98786123bf094d32671f561362d74160288a5 [47/51] fs: turn on more warnings for the filesystem code we modify most
config: arc-randconfig-001-20231018 (https://download.01.org/0day-ci/archive/20231018/202310180455.TaX9RJSP-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180455.TaX9RJSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180455.TaX9RJSP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:1075,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/dma-map-ops.h:9,
                    from mm/dmapool_test.c:2:
   include/linux/huge_mm.h: In function 'is_swap_pmd':
>> include/linux/huge_mm.h:191:31: error: logical 'and' of mutually exclusive tests is always false [-Werror=logical-op]
     191 |         return !pmd_none(pmd) && !pmd_present(pmd);
         |                               ^~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/mm.h:1075,
                    from mm/memory.c:43:
   include/linux/huge_mm.h: In function 'is_swap_pmd':
>> include/linux/huge_mm.h:191:31: error: logical 'and' of mutually exclusive tests is always false [-Werror=logical-op]
     191 |         return !pmd_none(pmd) && !pmd_present(pmd);
         |                               ^~
   during RTL pass: mach
   mm/memory.c: In function 'handle_mm_fault':
   mm/memory.c:5303:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
    5303 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from include/linux/mm.h:1075,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/shmem_fs.h:6,
                    from mm/shmem_quota.c:32:
   include/linux/huge_mm.h: In function 'is_swap_pmd':
>> include/linux/huge_mm.h:191:31: error: logical 'and' of mutually exclusive tests is always false [-Werror=logical-op]
     191 |         return !pmd_none(pmd) && !pmd_present(pmd);
         |                               ^~
   In function 'shmem_is_empty_dquot',
       inlined from 'shmem_release_dquot' at mm/shmem_quota.c:296:6:
   mm/shmem_quota.c:252:51: warning: 'bhardlimit' may be used uninitialized [-Wmaybe-uninitialized]
     251 |                 (dquot->dq_dqb.dqb_curspace == 0 &&
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     252 |                  dquot->dq_dqb.dqb_curinodes == 0 &&
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
     253 |                  dquot->dq_dqb.dqb_bhardlimit == bhardlimit &&
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem_quota.c: In function 'shmem_release_dquot':
   mm/shmem_quota.c:239:17: note: 'bhardlimit' was declared here
     239 |         qsize_t bhardlimit;
         |                 ^~~~~~~~~~
   In function 'shmem_is_empty_dquot',
       inlined from 'shmem_release_dquot' at mm/shmem_quota.c:296:6:
   mm/shmem_quota.c:253:61: warning: 'ihardlimit' may be used uninitialized [-Wmaybe-uninitialized]
     251 |                 (dquot->dq_dqb.dqb_curspace == 0 &&
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~          
     252 |                  dquot->dq_dqb.dqb_curinodes == 0 &&
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         
     253 |                  dquot->dq_dqb.dqb_bhardlimit == bhardlimit &&
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
     254 |                  dquot->dq_dqb.dqb_ihardlimit == ihardlimit))
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
   mm/shmem_quota.c: In function 'shmem_release_dquot':
   mm/shmem_quota.c:240:17: note: 'ihardlimit' was declared here
     240 |         qsize_t ihardlimit;
         |                 ^~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/mm.h:1075,
                    from mm/vmscan.c:15:
   include/linux/huge_mm.h: In function 'is_swap_pmd':
>> include/linux/huge_mm.h:191:31: error: logical 'and' of mutually exclusive tests is always false [-Werror=logical-op]
     191 |         return !pmd_none(pmd) && !pmd_present(pmd);
         |                               ^~
   during RTL pass: mach
   mm/vmscan.c: In function 'do_try_to_free_pages':
   mm/vmscan.c:6910:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
    6910 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from include/linux/mm.h:1075,
                    from mm/gup.c:7:
   include/linux/huge_mm.h: In function 'is_swap_pmd':
>> include/linux/huge_mm.h:191:31: error: logical 'and' of mutually exclusive tests is always false [-Werror=logical-op]
     191 |         return !pmd_none(pmd) && !pmd_present(pmd);
         |                               ^~
   mm/gup.c: In function 'fault_in_readable':
   mm/gup.c:1990:9: warning: 'c' may be used uninitialized [-Wmaybe-uninitialized]
    1990 |         (void)c;
         |         ^~~~~~~
   mm/gup.c:1970:23: note: 'c' declared here
    1970 |         volatile char c;
         |                       ^
   cc1: all warnings being treated as errors
--
   In file included from include/linux/mm.h:1075,
                    from mm/slub.c:13:
   include/linux/huge_mm.h: In function 'is_swap_pmd':
>> include/linux/huge_mm.h:191:31: error: logical 'and' of mutually exclusive tests is always false [-Werror=logical-op]
     191 |         return !pmd_none(pmd) && !pmd_present(pmd);
         |                               ^~
   during RTL pass: mach
   mm/slub.c: In function 'validate_store':
   mm/slub.c:5786:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
    5786 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.


vim +/and +191 include/linux/huge_mm.h

84c3fc4e9c563d Zi Yan 2017-09-08  188  
84c3fc4e9c563d Zi Yan 2017-09-08  189  static inline int is_swap_pmd(pmd_t pmd)
84c3fc4e9c563d Zi Yan 2017-09-08  190  {
84c3fc4e9c563d Zi Yan 2017-09-08 @191  	return !pmd_none(pmd) && !pmd_present(pmd);
84c3fc4e9c563d Zi Yan 2017-09-08  192  }
84c3fc4e9c563d Zi Yan 2017-09-08  193  

:::::: The code at line 191 was first introduced by commit
:::::: 84c3fc4e9c563d8fb91cfdf5948da48fe1af34d3 mm: thp: check pmd migration entry in common path

:::::: TO: Zi Yan <zi.yan@cs.rutgers.edu>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
