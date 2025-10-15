Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137E83254BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 20:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760561933; cv=none; b=IAmvt6Kqm6G9NGKrEFjiYtbfAaOUfyq552+xaIgnJj4VBd9q62/xHvAPjH9n4onHmCRCCyC44iOwi22CSFcK/sQi2SqdOxCVi9FjIS7XaScUpK5P4ki0gn5i8c+jje3e/FryBiL3w+Xagdn2I7pol7yKBW8Uf6lydUghF/sW0bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760561933; c=relaxed/simple;
	bh=A4fdVrUg1ptmzPxMf5nTFWsW6MKmhCFNO0NLS8TnGCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m8KE3wLrZlVVWDTGRLi6oANfEs5cJrLTbmiHiUcX3LI0zcmUY+H+ElG3GWeeY3l9IhciSrb2VPueurXE4aeDWz6lClr1WRaqUycP9YQjvvJvak47Roa04Y6Ym/H2EUPSEAXpHmt8ruXrtdxf90cKuUG/m3lHsG1DraEF8R8Gf1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+/5bBuL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+/5bBuL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760561932; x=1792097932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A4fdVrUg1ptmzPxMf5nTFWsW6MKmhCFNO0NLS8TnGCg=;
  b=m+/5bBuLgV7drcd7LF6wMFYWs8b1AVS6CDfYqmLY/hrmwZyQsV8GiC77
   R5pVE70WzbNnCTLoqAIuBcIMNIbiNKj24SBNjtlKypPxjXeKElvvOJOWM
   8sxLYWY+29c2UoIJ8V6u3vmn4/WO4AojgrQLOcdGvu3Ds/bA8nmfqSx5t
   uj8PpzYqrog9GoOA5K2EDDdq7LdiG45vyuaeE56C8Ug7eD55CjRPo2S/g
   bGk7N+76URWA9WUIQgObMwFrPhnxKKjM1+J3+IPfbi/HAJ04N2iLyP6c1
   m0wMQMLX6V0zmVsA99Amz+yFvqP9edpqEHDfH9qaqr4zfyhXejxBTI9L5
   A==;
X-CSE-ConnectionGUID: wVClDdQbRYund7OUfYt0fQ==
X-CSE-MsgGUID: 6GY+Yd8/SryhpvoFUkf6wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74088861"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="74088861"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 13:58:50 -0700
X-CSE-ConnectionGUID: 9vyuoSEuRZaHQMNhlXWsOQ==
X-CSE-MsgGUID: M1FhYP8tSh2wyulC6bQXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="213229272"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2025 13:58:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v98a6-0004E5-2V;
	Wed, 15 Oct 2025 20:58:46 +0000
Date: Thu, 16 Oct 2025 04:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/cid 60/64] include/linux/compiler.h:85:20: error:
 expected expression before '__asm__'
Message-ID: <202510160407.PRl7dIAf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/cid
head:   e196d67a03daa4beb27afc2961845664ac3ef3d5
commit: a430e9c31893c17c9c13bcef7dfbdad1aa857761 [60/64] sched/mmcid: Provide new scheduler CID mechanism
config: s390-randconfig-002-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160407.PRl7dIAf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160407.PRl7dIAf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160407.PRl7dIAf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
   kernel/sched/sched.h: In function 'mm_get_cid':
>> include/linux/compiler.h:85:20: error: expected expression before '__asm__'
      85 | # define barrier() __asm__ __volatile__("": : :"memory")
         |                    ^~~~~~~
   arch/s390/include/asm/processor.h:291:21: note: in expansion of macro 'barrier'
     291 | #define cpu_relax() barrier()
         |                     ^~~~~~~
   kernel/sched/sched.h:3595:37: note: in expansion of macro 'cpu_relax'
    3595 |         for (; cid == MM_CID_UNSET; cpu_relax())
         |                                     ^~~~~~~~~


vim +/__asm__ +85 include/linux/compiler.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  81  
^1da177e4c3f41 Linus Torvalds 2005-04-16  82  /* Optimization barrier */
^1da177e4c3f41 Linus Torvalds 2005-04-16  83  #ifndef barrier
3347acc6fcd4ee Arvind Sankar  2020-11-13  84  /* The "volatile" is due to gcc bugs */
3347acc6fcd4ee Arvind Sankar  2020-11-13 @85  # define barrier() __asm__ __volatile__("": : :"memory")
^1da177e4c3f41 Linus Torvalds 2005-04-16  86  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  87  

:::::: The code at line 85 was first introduced by commit
:::::: 3347acc6fcd4ee71ad18a9ff9d9dac176b517329 compiler.h: fix barrier_data() on clang

:::::: TO: Arvind Sankar <nivedita@alum.mit.edu>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
