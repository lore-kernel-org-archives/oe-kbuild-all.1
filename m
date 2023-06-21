Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3D15B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 02:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687313761; x=1718849761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qScSC4bBlYqqRzg1M8A/BBNUlIY65qfnfx194lP9nP0=;
  b=OQOgFDKquc8Wk1wUxUo1n0gO9zrgeri5MDmAJq4ujk2NfuMNrlRbe10+
   vOSkYBGFzbvNtG6qfddNbOSz1DcyVw9UNyS70YDu/tJj8WUbSXTd+mf+a
   MbmPtKa86htdL357/1xMjSrWQHnGwy7MXRHsE0TrEosa62WWHZTalYe9a
   j5KwHUvX4E8oLNnqoBbT5EdLu2j+eZ+5jANLBiGdDBmOMqcmbiR7OLXBl
   AXYvnf0NipEa7sTEXhrqrDeoBnYULOTEG8sEIB06hMWcM9yyWh2Ual64o
   c3jMV1EzcKFYRDltMwLPsLa9SMlwPazxAwOQAy3XwaQH2RyXyUw/0XLoQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="362581725"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="362581725"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 19:15:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858802797"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="858802797"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 19:15:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBnNt-0006Rs-2L;
	Wed, 21 Jun 2023 02:15:49 +0000
Date: Wed, 21 Jun 2023 10:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, willy@infradead.org,
	torvalds@linuxfoundation.org, vegard.nossum@oracle.com,
	mpe@ellerman.id.au, Liam.Howlett@oracle.com, lrh2000@pku.edu.cn,
	mgorman@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, surenb@google.com
Subject: Re: [PATCH 3/3] mm: check for VMA being detached before destroying it
Message-ID: <202306211007.hQoEsMrP-lkp@intel.com>
References: <20230620235726.3873043-3-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620235726.3873043-3-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-change-vma_start_read-to-fail-to-lock-a-detached-VMA/20230621-075833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230620235726.3873043-3-surenb%40google.com
patch subject: [PATCH 3/3] mm: check for VMA being detached before destroying it
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230621/202306211007.hQoEsMrP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211007.hQoEsMrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211007.hQoEsMrP-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/alpha/kernel/asm-offsets.c:11:
   include/linux/mm.h: In function 'vma_init':
>> include/linux/mm.h:753:12: error: 'struct vm_area_struct' has no member named 'detached'
     753 |         vma->detached = true;
         |            ^~
   arch/alpha/kernel/asm-offsets.c: At top level:
   arch/alpha/kernel/asm-offsets.c:15:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      15 | void foo(void)
         |      ^~~
   make[2]: *** [scripts/Makefile.build:114: arch/alpha/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +753 include/linux/mm.h

   740	
   741	/*
   742	 * WARNING: vma_init does not initialize vma->vm_lock.
   743	 * Use vm_area_alloc()/vm_area_free() if vma needs locking.
   744	 */
   745	static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
   746	{
   747		static const struct vm_operations_struct dummy_vm_ops = {};
   748	
   749		memset(vma, 0, sizeof(*vma));
   750		vma->vm_mm = mm;
   751		vma->vm_ops = &dummy_vm_ops;
   752		INIT_LIST_HEAD(&vma->anon_vma_chain);
 > 753		vma->detached = true;
   754		vma_numab_state_init(vma);
   755	}
   756	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
