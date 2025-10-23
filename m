Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934567483
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761179137; cv=none; b=U/yMtIFhxF9bqCOuQCj8Vm6KXB6foaYEhBH551cbyzZeGAMXpgyB0kjYkCN5rqjydHVZ7TJCRLlUxE5EYZA+BGragW6Nx0kWxHwJWA8lMUorZJl2a8axmS9vatiwY3tL3lkZ00gYYA1EUO2LR2aVL01l47acGN5QYHWRYhSlJPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761179137; c=relaxed/simple;
	bh=EZToJpHuAJbkoE2CMHnHzN4hOJ6+hJ1hQ8iYNiyWFcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PGg0RVsv3bsGNakKrBuwlsFoMFk6VMcI2qt5a6nnjqDAI7ffBf8u97yWlgG6lqeL3HYgPjjiGVYVmMaQHqFBzr3UOqCDXkQtdo/sz5QMerURQ2iH36HBafvaKZ8XmsNiW7pkTRNUa0PNkwtBl6jCQKQ4uWnqjVF1he5FjBEaTi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lx50f4En; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lx50f4En"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761179135; x=1792715135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZToJpHuAJbkoE2CMHnHzN4hOJ6+hJ1hQ8iYNiyWFcA=;
  b=Lx50f4EnuT1gimm670vID1CLbwD+uKSpaSqhEIbqHHBoJkos6pcBBEDm
   vCp2XUF7pBI+2z+MznlTRR4MF9KGmKalH/4GcKWz4nHA7fEov4AjNA8dX
   bKhO2FvnEqh4y1JK69FYKcmymLeatexOyusED3FZZu9lUZrSunfu+06xp
   3rGaKkzxr7+YUliV3EfNtO25hEKU6SRQp0S4bRAeF+JKVIwsroPv0WuUh
   Ka4cjgZGa0fd2IY8aPTsqECZVvBGZfDYvko6i/9aEsjxKqtJ8vMg/hA80
   L0E50LumxUg2Z1BgpJmJPAMcpIC0lnc1U9vquY7r8w5BUMz6TD9hiYZ4N
   g==;
X-CSE-ConnectionGUID: xqKSRHs4SzetAswYmBL12Q==
X-CSE-MsgGUID: BMl6BOYISsum6pgmQ+psSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63377096"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63377096"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 17:25:35 -0700
X-CSE-ConnectionGUID: gl+jcF4tQNa2Qh7nOZ3rRw==
X-CSE-MsgGUID: 5Az9SLQUQfuaLy/SjWDHdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183183408"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Oct 2025 17:25:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBj91-000CrF-2C;
	Thu, 23 Oct 2025 00:25:31 +0000
Date: Thu, 23 Oct 2025 08:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 2/9] include/linux/ftrace.h:557:5:
 warning: no previous prototype for function 'update_ftrace_direct_add'
Message-ID: <202510230807.t5FHz9vD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   3d31a310468694e4395d61e15c65edaa618fbb5c
commit: c40f09f4f868f69ec494cbe90165980d549c4a6e [2/9] ftrace: Add update_ftrace_direct_add function
config: loongarch-randconfig-r071-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230807.t5FHz9vD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230807.t5FHz9vD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230807.t5FHz9vD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/asm-offsets.c:14:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
>> include/linux/ftrace.h:557:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   1 warning generated.
--
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
>> include/linux/ftrace.h:557:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
    3743 |         struct cpumask *cpumask;
         |                         ^
   2 warnings generated.
--
   In file included from kernel/sched/fair.c:57:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
>> include/linux/ftrace.h:557:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   kernel/sched/fair.c:6726:19: warning: unused function 'cfs_rq_throttled' [-Wunused-function]
    6726 | static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
         |                   ^~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from kernel/time/posix-timers.c:25:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
>> include/linux/ftrace.h:557:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   kernel/time/posix-timers.c:89:1: warning: unused function 'class_lock_timer_lock_err' [-Wunused-function]
      89 | DEFINE_CLASS_IS_COND_GUARD(lock_timer);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:376:2: note: expanded from macro 'DEFINE_CLASS_IS_COND_GUARD'
     376 |         __DEFINE_GUARD_LOCK_PTR(_name, _T)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:358:20: note: expanded from macro '__DEFINE_GUARD_LOCK_PTR'
     358 |         static inline int class_##_name##_lock_err(class_##_name##_t *_T)   \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:71:1: note: expanded from here
      71 | class_lock_timer_lock_err
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from arch/loongarch/kernel/asm-offsets.c:14:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
>> include/linux/ftrace.h:557:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   1 warning generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
>> include/linux/ftrace.h:557:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
    3743 |         struct cpumask *cpumask;
         |                         ^
   2 warnings generated.


vim +/update_ftrace_direct_add +557 include/linux/ftrace.h

   556	
 > 557	int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
   558	{
   559		return -ENODEV;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
