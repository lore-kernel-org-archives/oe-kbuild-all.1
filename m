Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B5E269D18
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773438447; cv=none; b=f/D1Rm8ZSHlejU+0XSXKDaJH9ak5Kvrkw+e7rbAX63vrzbMwzOWpWZJ1LLGZrqB53dNc7si7zW2VbqqgYAesMt63yFl/2LaKvtgOAKHppQN5toDlzcyIeGxfRH1Lne6uHfl5JX+Fs0KhCQ3EvznNLVyeLOtzT1CQj/97XO+ZFdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773438447; c=relaxed/simple;
	bh=gIfiLTuqwVfJJMcry9muDppJ4oBPDLbg03ROVcV7f/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zoc1LVAUjK1fQhh/ccc36p1g0sjdMn+m9ixGglGnXJ+lSHsUpXulZxIyIRlgbx1MM/olaFlrZJrkFQLiCdrPKJ4ymxzOVfgoJ+2ipFUrxnrcqXm70uSvHQ06g3bCKslA48v1arUliEcQxFl+MVkWi3FfCpF5cY8MmJ483R3t+Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNaUV03n; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNaUV03n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773438445; x=1804974445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gIfiLTuqwVfJJMcry9muDppJ4oBPDLbg03ROVcV7f/A=;
  b=QNaUV03n3F05VGCWb64w4AorU4CG5bxJrlJVRn5u0KXdlFxn/dk1xvD5
   DhY7DhooMQdUuFpgPPEqtzRd9Jda4sqzMEdEki1OMxtvSS68ces5POq+n
   EXXfwaj8jCH5i/3J3aJqiPV+l+o3z0Tn6O/7w6tFsZGykc8Z8SZCW3uVD
   pbvf2WwJTwxTOkofEyfug8fmlafpT5ZdnoJNpjsvY5MYDIfKzs28tDeBA
   NIUgPna4e2XDmtbKC0JQApE0ct+I7bz9lIZfM/Qtvr/teFmINkh5rdfry
   O+VNvVEMmY2FNWyosyZh5x1zPcvCc63mNkPUOXk6G5u/Ij5fsAkmhqDvk
   g==;
X-CSE-ConnectionGUID: BaZ5EOE2QJaZXYsFyeUuLw==
X-CSE-MsgGUID: Wi3erEZETe2KuUjazi3G9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74584233"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74584233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 14:47:19 -0700
X-CSE-ConnectionGUID: jLNI8UENR7Srp80qg9RtIg==
X-CSE-MsgGUID: +ci821IdReW1v6jdbniy7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="219013094"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Mar 2026 14:47:18 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1ALk-000000004JL-0l4b;
	Fri, 13 Mar 2026 21:47:16 +0000
Date: Sat, 14 Mar 2026 05:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3] futex: Introduce __vdso_robust_futex_unlock_u32
 and __vdso_robust_pi_futex_try_unlock_u32
Message-ID: <202603140530.l4SSDRzB-lkp@intel.com>
References: <20260312181850.2156985-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312181850.2156985-1-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on linus/master v7.0-rc3 next-20260311]
[cannot apply to tip/x86/core tip/x86/vdso]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/futex-Introduce-__vdso_robust_futex_unlock_u32-and-__vdso_robust_pi_futex_try_unlock_u32/20260313-201027
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20260312181850.2156985-1-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH v3] futex: Introduce __vdso_robust_futex_unlock_u32 and __vdso_robust_pi_futex_try_unlock_u32
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260314/202603140530.l4SSDRzB-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603140530.l4SSDRzB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603140530.l4SSDRzB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/csky/include/asm/thread_info.h:10,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/csky/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/rhashtable-types.h:12,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from kernel/futex/core.c:34:
   kernel/futex/core.c: In function 'handle_futex_death':
>> arch/csky/include/asm/processor.h:81:43: error: implicit declaration of function 'task_stack_page'; did you mean 'task_stack_vm_area'? [-Wimplicit-function-declaration]
      81 |         ((struct pt_regs *)(THREAD_SIZE + task_stack_page(p)) - 1)
         |                                           ^~~~~~~~~~~~~~~
   kernel/futex/core.c:1148:38: note: in expansion of macro 'task_pt_regs'
    1148 |                 futex_vdso_exception(task_pt_regs(curr), &in_futex_vdso, &vdso_need_action);
         |                                      ^~~~~~~~~~~~


vim +81 arch/csky/include/asm/processor.h

e9564df753fd54 Guo Ren 2018-09-05  79  
e9564df753fd54 Guo Ren 2018-09-05  80  #define task_pt_regs(p) \
0f231dcfc664aa Guo Ren 2019-01-24 @81  	((struct pt_regs *)(THREAD_SIZE + task_stack_page(p)) - 1)
e9564df753fd54 Guo Ren 2018-09-05  82  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
