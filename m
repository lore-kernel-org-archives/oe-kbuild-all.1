Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7381C4A29
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 23:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945532; cv=none; b=ZM3rNI6l5CIw10JVtrg/o2cJI5B/IXS7X238mVQmHU7VxN/exmm91W3+3A8/QvrPPsBkvQwOkRw9XgDh+B4gez7cX96h7OMPtLvqCg1F8SJJt4/dQqhQDLQRBIKdeq9r2q7F1r7ldMcr18V8KEEU+ZaU08QoBh+guV5hyiqwBMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945532; c=relaxed/simple;
	bh=B8W+q9xxGmRh9DkOnC+lZU+X1RSdxitAqgxldKE5xgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxDuIq3PPjYJQbv4p3RVtfdBkhIztuLCTgnKKFf2YX4OOV2s4Pma4Q+IzkevTjikn2tqsq7YHlz6Xxan2zrM4N6fD3h+VZvjef8JPc5iJAacwZcpPM9ZUmWWjS/Kxjxt0GC9UjI+4ev01AbUTIzcRYhsA9S+yda3GQsfJF/0Sfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nf1rayRc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nf1rayRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735945530; x=1767481530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B8W+q9xxGmRh9DkOnC+lZU+X1RSdxitAqgxldKE5xgg=;
  b=Nf1rayRc+QfmJY3JoVYA4FVtba4CEUlhp5wIzk+9ftT7H43K2kJvaiMy
   V+yt9jEyLsLUMAtuTUnCLTZNJE3dqHgpn8+NKUPX1sd7pYuz0GNdgbenn
   RJE7QQMqgWmCmZzVjROnG9VZAVqrk8WBZQcnWaDhLkgMMj1tzFeLX+n/2
   dtWwzcKpYuM+e7LEl3LLhvOKy0htg2huXnU5NoPVMpjeVui8UxmOQxU5J
   FcEHRfuGRTmsI0cZPzrv3QJfJmIk0qbHkWEKHIjrji+wdiiXV0OV0R8gq
   Bo3IR6aWD9VVE4MDm1SLmnGvMYS7FOPJOGjZwl9hQFilHOJNAY2hIho9o
   g==;
X-CSE-ConnectionGUID: XEHGVlEiSXKB/1N6Q3t8yA==
X-CSE-MsgGUID: VLHmXa5YSL64mP/O54pXEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36343365"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="36343365"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 15:05:29 -0800
X-CSE-ConnectionGUID: VkR9Cq0ISJukE/I8kQdvBQ==
X-CSE-MsgGUID: Q8W+7y/DSROwbGJBnMWuyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="102417339"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jan 2025 15:05:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTqjM-000APz-29;
	Fri, 03 Jan 2025 23:05:24 +0000
Date: Sat, 4 Jan 2025 07:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
	maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, sshegde@linux.ibm.com, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] powerpc: Enable dynamic preemption
Message-ID: <202501040657.5tSQad1Y-lkp@intel.com>
References: <20250102191856.499424-2-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102191856.499424-2-sshegde@linux.ibm.com>

Hi Shrikanth,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[cannot apply to powerpc/fixes linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/powerpc-Enable-dynamic-preemption/20250103-032131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250102191856.499424-2-sshegde%40linux.ibm.com
patch subject: [PATCH v2 1/1] powerpc: Enable dynamic preemption
config: powerpc-randconfig-r072-20250104 (https://download.01.org/0day-ci/archive/20250104/202501040657.5tSQad1Y-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040657.5tSQad1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040657.5tSQad1Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
>> arch/powerpc/include/asm/preempt.h:8:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
       8 | DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
         | ^
         | int
>> arch/powerpc/include/asm/preempt.h:8:25: error: a parameter list without types is only allowed in a function definition
       8 | DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
         |                         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \


vim +/int +8 arch/powerpc/include/asm/preempt.h

     6	
     7	#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
   > 8	DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
     9	#endif
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
