Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE99C64D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714436027; cv=none; b=XCCa801rlReVaJab5oAwt9xOU9ydwQCKMiK9rV4G/swC8VDEyvkOa3LcumWf3RhdBFBzDQ7CyhwZEeA0gsozsq07MCAoGCdOn24pTLogVO2bP0Qu4R4vANWDrE94CDKgFvAVT7WqIvU5MiCFK/6QuaxVVm+4MeTO4Aa7kXi3y0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714436027; c=relaxed/simple;
	bh=Qz9vithT9VY/HS8n05tHhmZLqtfcN2QJoEqCOXlwCss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/qc85VNuGZnt5BaiadzMITWEiEkv3odb4VsGsvLWSNqfZY+n3+72dMOQMKLtp21EdIBPN3vmw6kHFHbcF9f0pI2cpGizPL9h+in6x9U2FXJAGdH+0x5xdDUnZzs3bGHc+JFy142yTOjF6Qg8q+zXCuxZS6KjKgqexhhlJG/HS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwXG+F6b; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwXG+F6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714436025; x=1745972025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qz9vithT9VY/HS8n05tHhmZLqtfcN2QJoEqCOXlwCss=;
  b=cwXG+F6bUabThhEjuvgJR84de5dLZa5PxKwj6Bddc/N9Cp8ybFPXfvgK
   lBAe83LV86YLt4XPvKt1dF2Gsc/Uk1t3BCy+Rcrtj7xnLIYLbDymWCM3z
   no70+4GGPIvccrtpd7czl8ay5Dj68hGnRbfJCD6Z2QRa1k2KkzQz9AuZS
   BmBdtTtWTqEbhbH+SpTmBJAmlaL9GuMkbC2rXTPGLsaArDPVoKo1eDnu5
   aWOCjoYPhNqBqoHzSOJ71xni7ogBgExZcwFFL2N83frGL6j5/TfzHyIKh
   K5rrivBL3p+Yu2BgSyK531PJXkkG73q0xSmdSPX+/m2RTANonOMHnAgia
   w==;
X-CSE-ConnectionGUID: azLRHPuyRUWmBY5jMzxVEA==
X-CSE-MsgGUID: w6zTxT0eR3uABwZRArJbeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10043632"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10043632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:13:43 -0700
X-CSE-ConnectionGUID: uo7l4etSRcWy1ilxhqp4lQ==
X-CSE-MsgGUID: TJOYVfPKQq2wtIhSs2i6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="57473213"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Apr 2024 17:13:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1b7q-0007Xs-2n;
	Tue, 30 Apr 2024 00:13:38 +0000
Date: Tue, 30 Apr 2024 08:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20217/22256] mm/hugetlb.c:3967:41:
 warning: array subscript 0 is outside array bounds of 'struct
 small_page_pool[0]'
Message-ID: <202404300835.ONBQ5gRx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3c3550371ac3e9d3326c8263a6eb52d3bb0b43a8
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [20217/22256] dhugetlb: backport dynamic hugetlb feature
config: x86_64-randconfig-005-20240430 (https://download.01.org/0day-ci/archive/20240430/202404300835.ONBQ5gRx-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300835.ONBQ5gRx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300835.ONBQ5gRx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:10,
                    from mm/hugetlb.c:7:
   mm/hugetlb.c: In function 'dhugetlb_acct_memory':
   mm/hugetlb.c:4172:57: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
    4172 |                         WARN_ON(hpool->mmap_reserved_1G < 0);
         |                                                         ^
   include/asm-generic/bug.h:124:32: note: in definition of macro 'WARN_ON'
     124 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/hugetlb.c:4188:57: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
    4188 |                         WARN_ON(hpool->mmap_reserved_2M < 0);
         |                                                         ^
   include/asm-generic/bug.h:124:32: note: in definition of macro 'WARN_ON'
     124 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   In file included from mm/hugetlb.c:14:
   include/linux/mempolicy.h: At top level:
   include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   mm/hugetlb.c: In function 'free_back_hugetlb':
   mm/hugetlb.c:3748:51: warning: array subscript idx is outside array bounds of 'struct dhugetlb_pool *[0]' [-Warray-bounds=]
    3748 |                         dhugetlb_pagelist_t->hpool[idx] = NULL;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/migrate.h:8,
                    from mm/hugetlb.c:34:
   include/linux/hugetlb.h:676:31: note: while referencing 'hpool'
     676 |         struct dhugetlb_pool *hpool[0];
         |                               ^~~~~
   mm/hugetlb.c: In function 'hugetlb_migrate_pages':
>> mm/hugetlb.c:3967:41: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    3967 |                                         list_len(&hpool->smpool[i].head_page);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   mm/hugetlb.c:3966:46: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    3966 |                                 hpool->smpool[i].free_pages =
         |                                 ~~~~~~~~~~~~~^~~
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In file included from include/linux/mmzone.h:9,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:11:
   In function 'spin_unlock',
       inlined from 'hugetlb_migrate_pages' at mm/hugetlb.c:3972:5:
>> include/linux/spinlock.h:369:25: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
     369 |         raw_spin_unlock(&lock->rlock);
         |                         ^~~~~~~~~~~~
   include/linux/spinlock.h:273:58: note: in definition of macro 'raw_spin_unlock'
     273 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                                          ^~~~
   include/linux/hugetlb.h: In function 'hugetlb_migrate_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'spin_lock',
       inlined from 'hugetlb_migrate_pages' at mm/hugetlb.c:3980:5:
   include/linux/spinlock.h:329:23: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
     329 |         raw_spin_lock(&lock->rlock);
         |                       ^~~~~~~~~~~~
   include/linux/spinlock.h:214:48: note: in definition of macro 'raw_spin_lock'
     214 | #define raw_spin_lock(lock)     _raw_spin_lock(lock)
         |                                                ^~~~
   include/linux/hugetlb.h: In function 'hugetlb_migrate_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'spin_lock',
       inlined from 'dhugetlb_collect_2M_pages' at mm/hugetlb.c:4096:4:
   include/linux/spinlock.h:329:23: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
     329 |         raw_spin_lock(&lock->rlock);
         |                       ^~~~~~~~~~~~
   include/linux/spinlock.h:214:48: note: in definition of macro 'raw_spin_lock'
     214 | #define raw_spin_lock(lock)     _raw_spin_lock(lock)
         |                                                ^~~~
   include/linux/hugetlb.h: In function 'dhugetlb_collect_2M_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'merge_free_small_page',
       inlined from 'dhugetlb_collect_2M_pages' at mm/hugetlb.c:4098:3:
   mm/hugetlb.c:4076:33: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    4076 |                                 list_len(&hpool->smpool[i].head_page);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hugetlb.h: In function 'dhugetlb_collect_2M_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'merge_free_small_page',
       inlined from 'dhugetlb_collect_2M_pages' at mm/hugetlb.c:4098:3:
   mm/hugetlb.c:4075:30: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    4075 |                 hpool->smpool[i].free_pages =
         |                 ~~~~~~~~~~~~~^~~
   include/linux/hugetlb.h: In function 'dhugetlb_collect_2M_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'spin_unlock',
       inlined from 'dhugetlb_collect_2M_pages' at mm/hugetlb.c:4100:4:
>> include/linux/spinlock.h:369:25: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
     369 |         raw_spin_unlock(&lock->rlock);
         |                         ^~~~~~~~~~~~
   include/linux/spinlock.h:273:58: note: in definition of macro 'raw_spin_unlock'
     273 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                                          ^~~~
   include/linux/hugetlb.h: In function 'dhugetlb_collect_2M_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'spin_unlock',
       inlined from 'try_migrate_pages' at mm/hugetlb.c:3641:3:
>> include/linux/spinlock.h:369:25: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
     369 |         raw_spin_unlock(&lock->rlock);
         |                         ^~~~~~~~~~~~
   include/linux/spinlock.h:273:58: note: in definition of macro 'raw_spin_unlock'
     273 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                                          ^~~~
   include/linux/hugetlb.h: In function 'try_migrate_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'spin_lock',
       inlined from 'try_migrate_pages' at mm/hugetlb.c:3650:3:
   include/linux/spinlock.h:329:23: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
     329 |         raw_spin_lock(&lock->rlock);
         |                       ^~~~~~~~~~~~
   include/linux/spinlock.h:214:48: note: in definition of macro 'raw_spin_lock'
     214 | #define raw_spin_lock(lock)     _raw_spin_lock(lock)
         |                                                ^~~~
   include/linux/hugetlb.h: In function 'try_migrate_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   mm/hugetlb.c:3651:47: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    3651 |                 nr_free_pages += hpool->smpool[i].free_pages;
         |                                  ~~~~~~~~~~~~~^~~
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'spin_lock',
       inlined from 'try_migrate_pages' at mm/hugetlb.c:3674:3:
   include/linux/spinlock.h:329:23: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
     329 |         raw_spin_lock(&lock->rlock);
         |                       ^~~~~~~~~~~~
   include/linux/spinlock.h:214:48: note: in definition of macro 'raw_spin_lock'
     214 | #define raw_spin_lock(lock)     _raw_spin_lock(lock)
         |                                                ^~~~
   include/linux/hugetlb.h: In function 'try_migrate_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   mm/hugetlb.c: In function 'free_dhugetlb_pages':
   mm/hugetlb.c:3692:44: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    3692 |                 used_pages += hpool->smpool[i].used_pages;
         |                               ~~~~~~~~~~~~~^~~
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'free_dhugetlb_pcpool',
       inlined from 'free_dhugetlb_pages' at mm/hugetlb.c:3711:3:
   mm/hugetlb.c:3474:26: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    3474 |                 smpool = &hpool->smpool[i];
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/hugetlb.h: In function 'free_dhugetlb_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'free_dhugetlb_pcpool',
       inlined from 'free_dhugetlb_pages' at mm/hugetlb.c:3711:3:
   mm/hugetlb.c:3475:29: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    3475 |                 list_splice(&smpool->head_page, &hpool->dhugetlb_4K_freelists);
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/hugetlb.h: In function 'free_dhugetlb_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'free_dhugetlb_pcpool',
       inlined from 'free_dhugetlb_pages' at mm/hugetlb.c:3711:3:
   mm/hugetlb.c:3474:40: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    3474 |                 smpool = &hpool->smpool[i];
         |                           ~~~~~~~~~~~~~^~~
   include/linux/hugetlb.h: In function 'free_dhugetlb_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'free_dhugetlb_pcpool',
       inlined from 'free_dhugetlb_pages' at mm/hugetlb.c:3711:3:
   mm/hugetlb.c:3474:40: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    3474 |                 smpool = &hpool->smpool[i];
         |                           ~~~~~~~~~~~~~^~~
   include/linux/hugetlb.h: In function 'free_dhugetlb_pages':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   mm/hugetlb.c: In function 'hpool_alloc':
   include/linux/spinlock.h:324:28: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
     324 |         raw_spin_lock_init(&(_lock)->rlock);            \
         |                            ^
   include/linux/spinlock.h:100:31: note: in definition of macro 'raw_spin_lock_init'
     100 |         __raw_spin_lock_init((lock), #lock, &__key);            \
         |                               ^~~~
   mm/hugetlb.c:3327:17: note: in expansion of macro 'spin_lock_init'
    3327 |                 spin_lock_init(&hpool->smpool[i].lock);
         |                 ^~~~~~~~~~~~~~
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   mm/hugetlb.c:3328:17: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    3328 |                 INIT_LIST_HEAD(&hpool->smpool[i].head_page);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   mm/hugetlb.c: In function 'update_dhugetlb_pagelist':
   mm/hugetlb.c:3408:35: warning: array subscript idx is outside array bounds of 'struct dhugetlb_pool *[0]' [-Warray-bounds=]
    3408 |         dhugetlb_pagelist_t->hpool[idx] = hpool;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/hugetlb.h:676:31: note: while referencing 'hpool'
     676 |         struct dhugetlb_pool *hpool[0];
         |                               ^~~~~
   mm/hugetlb.c: In function 'get_dhugetlb_pool_from_dhugetlb_pagelist':
   mm/hugetlb.c:3421:51: warning: array subscript idx is outside array bounds of 'struct dhugetlb_pool *[0]' [-Warray-bounds=]
    3421 |                 hpool = dhugetlb_pagelist_t->hpool[idx];
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/hugetlb.h:676:31: note: while referencing 'hpool'
     676 |         struct dhugetlb_pool *hpool[0];
         |                               ^~~~~
   In function 'spin_lock',
       inlined from 'free_dhugetlb_pool' at mm/hugetlb.c:3766:3:
   include/linux/spinlock.h:329:23: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
     329 |         raw_spin_lock(&lock->rlock);
         |                       ^~~~~~~~~~~~
   include/linux/spinlock.h:214:48: note: in definition of macro 'raw_spin_lock'
     214 | #define raw_spin_lock(lock)     _raw_spin_lock(lock)
         |                                                ^~~~
   include/linux/hugetlb.h: In function 'free_dhugetlb_pool':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'spin_unlock',
       inlined from 'free_dhugetlb_pool' at mm/hugetlb.c:3778:3:
>> include/linux/spinlock.h:369:25: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
     369 |         raw_spin_unlock(&lock->rlock);
         |                         ^~~~~~~~~~~~
   include/linux/spinlock.h:273:58: note: in definition of macro 'raw_spin_unlock'
     273 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                                          ^~~~
   include/linux/hugetlb.h: In function 'free_dhugetlb_pool':
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
--
         |                            ^~~
   In file included from include/linux/shmem_fs.h:7,
                    from mm/memcontrol.c:39:
   include/linux/mempolicy.h: At top level:
   include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   In function 'free_mem_cgroup_per_node_info',
       inlined from '__mem_cgroup_free' at mm/memcontrol.c:5315:3:
   mm/memcontrol.c:5296:57: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
    5296 |         struct mem_cgroup_per_node *pn = memcg->nodeinfo[node];
         |                                          ~~~~~~~~~~~~~~~^~~~~~
   In file included from mm/memcontrol.c:35:
   include/linux/memcontrol.h: In function '__mem_cgroup_free':
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   mm/memcontrol.c: In function 'alloc_mem_cgroup_per_node_info.constprop':
   mm/memcontrol.c:5290:24: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
    5290 |         memcg->nodeinfo[node] = pn;
         |         ~~~~~~~~~~~~~~~^~~~~~
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'memcg_free_shrinker_maps.part.0' at mm/memcontrol.c:375:8:
   include/linux/memcontrol.h:399:31: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     399 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'memcg_free_shrinker_maps.part.0':
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'memcg_expand_one_shrinker_map' at mm/memcontrol.c:344:9:
   include/linux/memcontrol.h:399:31: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     399 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'memcg_expand_one_shrinker_map':
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In file included from arch/x86/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from include/linux/page_counter.h:5:
   mm/memcontrol.c:358:51: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     358 |                 rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_map, new);
         |                                    ~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:296:29: note: in definition of macro 'WRITE_ONCE'
     296 |         __write_once_size(&(x), __u.__c, sizeof(x));    \
         |                             ^
   include/linux/rcupdate.h:409:17: note: in expansion of macro 'smp_store_release'
     409 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
         |                 ^~~~~~~~~~~~~~~~~
   mm/memcontrol.c:358:17: note: in expansion of macro 'rcu_assign_pointer'
     358 |                 rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_map, new);
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from '__invalidate_reclaim_iterators' at mm/memcontrol.c:1185:8,
       inlined from 'invalidate_reclaim_iterators' at mm/memcontrol.c:1211:3,
       inlined from 'mem_cgroup_css_released' at mm/memcontrol.c:5520:2:
   include/linux/memcontrol.h:399:31: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     399 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_css_released':
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from '__invalidate_reclaim_iterators' at mm/memcontrol.c:1185:8,
       inlined from 'invalidate_reclaim_iterators' at mm/memcontrol.c:1200:3,
       inlined from 'mem_cgroup_css_released' at mm/memcontrol.c:5520:2:
   include/linux/memcontrol.h:399:31: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     399 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_css_released':
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   mm/memcontrol.c: In function 'memcg_flush_percpu_vmstats':
   mm/memcontrol.c:3318:65: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
    3318 |                 struct mem_cgroup_per_node *pn = memcg->nodeinfo[node];
         |                                                  ~~~~~~~~~~~~~~~^~~~~~
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'parent_nodeinfo' at mm/memcontrol.c:726:9,
       inlined from 'memcg_flush_percpu_vmstats' at mm/memcontrol.c:3331:26:
   include/linux/memcontrol.h:399:31: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     399 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'memcg_flush_percpu_vmstats':
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   mm/memcontrol.c: In function '__alloc_page_from_dhugetlb_pool':
>> mm/memcontrol.c:4769:18: warning: array subscript 0 is outside array bounds of 'struct small_page_pool[0]' [-Warray-bounds=]
    4769 |         smpool = &hpool->smpool[smp_processor_id()];
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/memcontrol.c:40:
   include/linux/hugetlb.h:725:32: note: while referencing 'smpool'
     725 |         struct small_page_pool smpool[0];
         |                                ^~~~~~
   In function 'memcg_alloc_shrinker_maps',
       inlined from 'mem_cgroup_css_online' at mm/memcontrol.c:5472:6:
   mm/memcontrol.c:400:51: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     400 |                 rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_map, map);
         |                                    ~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:296:29: note: in definition of macro 'WRITE_ONCE'
     296 |         __write_once_size(&(x), __u.__c, sizeof(x));    \
         |                             ^
   include/linux/rcupdate.h:409:17: note: in expansion of macro 'smp_store_release'
     409 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
         |                 ^~~~~~~~~~~~~~~~~
   mm/memcontrol.c:400:17: note: in expansion of macro 'rcu_assign_pointer'
     400 |                 rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_map, map);
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_css_online':
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'mem_cgroup_remove_from_trees' at mm/memcontrol.c:643:8,
       inlined from 'mem_cgroup_css_free' at mm/memcontrol.c:5535:2:
   include/linux/memcontrol.h:399:31: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     399 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_css_free':
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   mm/memcontrol.c: In function '__mem_cgroup_threshold':
   mm/memcontrol.c:4055:45: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    4055 |         for (; i >= 0 && unlikely(t->entries[i].threshold > usage); i--)
         |                                   ~~~~~~~~~~^~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/memcontrol.h:170:37: note: while referencing 'entries'
     170 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:4056:42: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    4056 |                 eventfd_signal(t->entries[i].eventfd, 1);
         |                                ~~~~~~~~~~^~~
   include/linux/memcontrol.h:170:37: note: while referencing 'entries'
     170 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:4067:50: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    4067 |         for (; i < t->size && unlikely(t->entries[i].threshold <= usage); i++)
         |                                        ~~~~~~~~~~^~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/memcontrol.h:170:37: note: while referencing 'entries'
     170 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:4068:42: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    4068 |                 eventfd_signal(t->entries[i].eventfd, 1);
         |                                ~~~~~~~~~~^~~
   include/linux/memcontrol.h:170:37: note: while referencing 'entries'
     170 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   In function 'mem_cgroup_page_nodeinfo',
       inlined from 'mem_cgroup_update_tree' at mm/memcontrol.c:613:8,
       inlined from 'memcg_check_events.part.0' at mm/memcontrol.c:904:4:
   mm/memcontrol.c:507:31: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     507 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'memcg_check_events.part.0':
   include/linux/memcontrol.h:324:37: note: while referencing 'nodeinfo'
     324 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   mm/memcontrol.c: In function '__mem_cgroup_usage_unregister_event':
   mm/memcontrol.c:4268:49: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    4268 |                 if (thresholds->primary->entries[i].eventfd == eventfd)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/memcontrol.h:170:37: note: while referencing 'entries'
     170 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:4271:63: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    4271 |                 new->entries[j] = thresholds->primary->entries[i];
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/memcontrol.h:170:37: note: while referencing 'entries'
     170 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:4271:29: warning: array subscript j is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    4271 |                 new->entries[j] = thresholds->primary->entries[i];
         |                 ~~~~~~~~~~~~^~~
   include/linux/memcontrol.h:170:37: note: while referencing 'entries'
     170 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:4272:33: warning: array subscript j is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    4272 |                 if (new->entries[j].threshold <= usage) {
         |                     ~~~~~~~~~~~~^~~
   include/linux/memcontrol.h:170:37: note: while referencing 'entries'
     170 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
..


vim +3967 mm/hugetlb.c

  3938	
  3939	static void hugetlb_migrate_pages(struct dhugetlb_pool *hpool,
  3940					  unsigned long count)
  3941	{
  3942		int i, try;
  3943		struct page *page;
  3944		struct split_pages *split_huge, *split_next;
  3945		unsigned long nr_pages = 1 << (PMD_SHIFT - PAGE_SHIFT);
  3946		LIST_HEAD(wait_page_list);
  3947	
  3948		list_for_each_entry_safe(split_huge, split_next,
  3949					 &hpool->split_2M_freelists, list) {
  3950			/*
  3951			 * Isolate free page first because we dont want them to be
  3952			 * allocated.
  3953			 */
  3954			for (i = 0; i < nr_pages; i++) {
  3955				page = pfn_to_page(split_huge->start_pfn + i);
  3956				if (!PagePool(page))
  3957					list_move(&page->lru, &wait_page_list);
  3958			}
  3959	
  3960			for (try = 0; try < HPOOL_RECLAIM_RETRIES; try++) {
  3961				/*
  3962				 * Unlock and try migration, after migration we need
  3963				 * to lock back.
  3964				 */
  3965				for (i = 0; i < NR_SMPOOL; i++)
  3966					hpool->smpool[i].free_pages =
> 3967						list_len(&hpool->smpool[i].head_page);
  3968				hpool->free_pages =
  3969					list_len(&hpool->dhugetlb_4K_freelists);
  3970				spin_unlock(&hpool->lock);
  3971				for (i = NR_SMPOOL - 1; i >= 0; i--)
  3972					spin_unlock(&hpool->smpool[i].lock);
  3973	
  3974				for (i = 0; i < nr_pages; i++) {
  3975					page = pfn_to_page(split_huge->start_pfn + i);
  3976					if (PagePool(page))
  3977						try_migrate_page(page, hpool->nid);
  3978				}
  3979				for (i = 0; i < NR_SMPOOL; i++)
  3980					spin_lock(&hpool->smpool[i].lock);
  3981				spin_lock(&hpool->lock);
  3982	
  3983				/*
  3984				 * Isolate free page. If all page in the split_huge
  3985				 * is free, return it.
  3986				 */
  3987				split_huge->free_pages = 0;
  3988				for (i = 0; i < nr_pages; i++) {
  3989					page = pfn_to_page(split_huge->start_pfn + i);
  3990					if (!PagePool(page)) {
  3991						list_move(&page->lru, &wait_page_list);
  3992						split_huge->free_pages++;
  3993					}
  3994				}
  3995				if (split_huge->free_pages == nr_pages)
  3996					break;
  3997			}
  3998			if (split_huge->free_pages == nr_pages) {
  3999				for (i = 0; i < nr_pages; i++) {
  4000					page = pfn_to_page(split_huge->start_pfn + i);
  4001					list_del(&page->lru);
  4002				}
  4003				INIT_LIST_HEAD(&wait_page_list);
  4004				page = pfn_to_page(split_huge->start_pfn);
  4005				add_new_huge_page_to_pool(hpool, page, false);
  4006				list_del(&split_huge->list);
  4007				kfree(split_huge);
  4008				hpool->nr_split_2M--;
  4009	
  4010				trace_dhugetlb_split_merge(hpool, page,
  4011							   DHUGETLB_MIGRATE_4K);
  4012	
  4013				if (--count == 0)
  4014					return;
  4015			} else {
  4016				/* Failed, put back the isolate pages */
  4017				list_splice(&wait_page_list,
  4018					    &hpool->dhugetlb_4K_freelists);
  4019				INIT_LIST_HEAD(&wait_page_list);
  4020			}
  4021		}
  4022	}
  4023	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
