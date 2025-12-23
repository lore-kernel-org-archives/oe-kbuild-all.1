Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA08433032B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766491123; cv=none; b=ggne/SlmqITfQt/HEdkik6eWFyeKG8xik5GQyb0aX73c0y2CP2gLIrGXirw/Ba73iU4aMLy1ohfM4NStU9tFrwpQ5yDKoyXmLjsq+HoDZvJ4d5Eysrq/nEoHq/aH3kaqVH/+JYuPFGi1Y65CpVRKHZUBxRQVW4zYo90uwd9etDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766491123; c=relaxed/simple;
	bh=SrGOy+3teWABqpBs8frHuhqSiTVX68KMj2fgRMvXvcg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lGbz6On+ooFzgx7dSWEvP6ykEFHbnFOv3EZVS5Ef0dZiYXuxEqI7L3P8FOjfKYkd8plZd3ZWukYcJa8HT5QDE57OqSUvONzzbTlzzPoYXV8fqweBlU57dsjwjlsaTQ5IuWLjSrEKp6ouqDF+2rdWiQjL1MKOSg1rb1/xzxv0T7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWAmgOMZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWAmgOMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766491122; x=1798027122;
  h=date:from:to:cc:subject:message-id;
  bh=SrGOy+3teWABqpBs8frHuhqSiTVX68KMj2fgRMvXvcg=;
  b=gWAmgOMZxzNWGHa0K4jAiTF3jOAquE0M1dvrEFBODTYT20kM11bYduFW
   5MlQLRoLFU0F9UORVGJZjs3MvvIGgPy60/mPK0kv3too6exjfZB8xEAgx
   BZSd80WcbJYeZqVffSyYSqLc7GqTYiCAi6NPH4EGcwfdg+nzv5gOVxLIZ
   z2C9z4DunR8eW2t7PI9kn4BmxQWFSqwPYxi5GtqTTwYb/jnnBu8VdSc4D
   y51g5+qcB/nCTFzFfxT40LSewj+rmE3vNrnwcxp+hRLYOJ1dwCHZ7snoc
   JkGEO535IHDpgh1SFASieHUDlp3wl8SD54JXSll/OZ1kI+EoxqEoOozg2
   A==;
X-CSE-ConnectionGUID: mcFNZLzzToWD82AFL6tSpQ==
X-CSE-MsgGUID: GlXRxJnUQNmV+wKiNma3EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85754305"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="85754305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 03:58:39 -0800
X-CSE-ConnectionGUID: Wc64O7bpQgesQdBUA/0q4g==
X-CSE-MsgGUID: o2xsdvmtQFiJTpGpPrxDYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="200067109"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Dec 2025 03:58:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY12B-000000001qx-2M7I;
	Tue, 23 Dec 2025 11:58:35 +0000
Date: Tue, 23 Dec 2025 19:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 20/21]
 kernel/trace/rv/monitors/nomiss/nomiss.c:200:13: error: conflicting types for
 'handle_syscall'; have 'void(void *, struct pt_regs *, long int)'
Message-ID: <202512231906.LlE3scHH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata
head:   4ee25b194d8ceffecc62e47ef7825e84ff983e2b
commit: 5d49442d8069b2f0242f3ee6a01868bc5fc83836 [20/21] rv: Add deadline monitors
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251223/202512231906.LlE3scHH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231906.LlE3scHH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231906.LlE3scHH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/monitors/nomiss/nomiss.c:200:13: error: conflicting types for 'handle_syscall'; have 'void(void *, struct pt_regs *, long int)'
     200 | static void handle_syscall(void *data, struct pt_regs *regs, long id)
         |             ^~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/elf.h:9,
                    from arch/um/include/asm/uaccess.h:10,
                    from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/mm.h:36,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:13,
                    from kernel/trace/rv/monitors/nomiss/nomiss.c:2:
   arch/um/include/shared/skas/skas.h:14:13: note: previous declaration of 'handle_syscall' with type 'void(struct uml_pt_regs *)'
      14 | extern void handle_syscall(struct uml_pt_regs *regs);
         |             ^~~~~~~~~~~~~~
--
>> kernel/trace/rv/monitors/throttle/throttle.c:157:13: error: conflicting types for 'handle_syscall'; have 'void(void *, struct pt_regs *, long int)'
     157 | static void handle_syscall(void *data, struct pt_regs *regs, long id)
         |             ^~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/elf.h:9,
                    from arch/um/include/asm/uaccess.h:10,
                    from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/mm.h:36,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:13,
                    from kernel/trace/rv/monitors/throttle/throttle.c:2:
   arch/um/include/shared/skas/skas.h:14:13: note: previous declaration of 'handle_syscall' with type 'void(struct uml_pt_regs *)'
      14 | extern void handle_syscall(struct uml_pt_regs *regs);
         |             ^~~~~~~~~~~~~~


vim +200 kernel/trace/rv/monitors/nomiss/nomiss.c

   199	
 > 200	static void handle_syscall(void *data, struct pt_regs *regs, long id)
   201	{
   202		struct task_struct *p;
   203		int new_policy = -1;
   204	
   205		new_policy = extract_params(regs, id, &p);
   206		if (new_policy < 0 || new_policy == p->policy)
   207			return;
   208		if (p->policy == SCHED_DEADLINE)
   209			da_reset(EXPAND_ID(&p->dl, DL_TASK));
   210		else if (new_policy == SCHED_DEADLINE)
   211			da_create_or_get(EXPAND_ID(&p->dl, DL_TASK));
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
