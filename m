Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04061474CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 02:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761185673; cv=none; b=SwtmwjE8XXZyThuOAhwM4Ly5kcmmY+OVZti29tRLdkCDGhlRNALotpiTwsU2/ZMXWWQmbF0CUM3gvk6cEXUi+Ivra7z7SPu1aPBUFI8zqo7EMBixzThVZxhJwXzOvmh7RAixBosKHPLgAtaSH2Csi89qxobSHZ5k22gKyEgUlg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761185673; c=relaxed/simple;
	bh=wTEGZ521gT3ciyXgUBcl1d64F3ujZpB+52CoM9BfXPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0KWs+D/23e36sEms42TYoeYw8PQr/DwFGMYaJHireQyuJC282Hh8CFJMdj5x/gX5imxPhOpxFigxYEcXfhoNI9kVKy/fqampmORyorrf0R8TPwP0rUw6/rV/SLtyf3Tjd8fRuNa8hp1kdfghCGNr1NVTkZlak1WMfnuXUGpcL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6uX4wuB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6uX4wuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761185672; x=1792721672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wTEGZ521gT3ciyXgUBcl1d64F3ujZpB+52CoM9BfXPk=;
  b=G6uX4wuB2fbEM73AtbbLofcEkiiTOXwarCd/cOgB+2rjhSJVrMqLcIhA
   1NGNU7+hW4X04wd+d5dbd+fJxnrjJBPBb/UEtqhdEnglv3o0zWfzxtKoq
   liyzv6wT7pYfS3Dmc+Ow+g8RS6IOyWjYAFgIq7ygL/EzENh8KtF8IDuxf
   JjtpMPNJULQi9/CPxRT5AXgoEY1tNTKoXpU0U5SdGsIXnIgWBx3kyWDyR
   GcDnm4iXFBPWuh2ql1Kg4+M/nx82lAH3mh8fDQWCKTxL4v7F5CSCO1qWz
   W/+6+m68Oat0VUB2SLjQp+6FcakvR74jaTtjo19WH7QPoWbgZBMjJPVaI
   g==;
X-CSE-ConnectionGUID: M64KfChJR0WurXEZzzcOfA==
X-CSE-MsgGUID: noOeE3izSZW+ougx9rB9LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50924157"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="50924157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:14:27 -0700
X-CSE-ConnectionGUID: IvarJn6YTcidRHmGDd2cuA==
X-CSE-MsgGUID: MpwlP1QZQZWV1gk1nOXzTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="189156658"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Oct 2025 19:14:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkqN-000CvR-2x;
	Thu, 23 Oct 2025 02:14:23 +0000
Date: Thu, 23 Oct 2025 10:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 3/9] include/linux/ftrace.h:563:5:
 warning: no previous prototype for function 'update_ftrace_direct_del'
Message-ID: <202510231023.nCcJ6zK7-lkp@intel.com>
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
commit: 6fc33ce4c35edf7fb4fd8c760ad1bb2e472d82cb [3/9] ftrace: Add update_ftrace_direct_del function
config: loongarch-randconfig-r071-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231023.nCcJ6zK7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231023.nCcJ6zK7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231023.nCcJ6zK7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/asm-offsets.c:14:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:558:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:563:5: warning: no previous prototype for function 'update_ftrace_direct_del' [-Wmissing-prototypes]
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:563:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   2 warnings generated.
--
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:558:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:563:5: warning: no previous prototype for function 'update_ftrace_direct_del' [-Wmissing-prototypes]
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:563:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
    3743 |         struct cpumask *cpumask;
         |                         ^
   3 warnings generated.
--
   In file included from kernel/sched/fair.c:57:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:558:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:563:5: warning: no previous prototype for function 'update_ftrace_direct_del' [-Wmissing-prototypes]
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:563:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   kernel/sched/fair.c:6726:19: warning: unused function 'cfs_rq_throttled' [-Wunused-function]
    6726 | static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
         |                   ^~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from kernel/time/posix-timers.c:25:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:558:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:563:5: warning: no previous prototype for function 'update_ftrace_direct_del' [-Wmissing-prototypes]
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:563:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
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
   3 warnings generated.
--
   In file included from arch/loongarch/kernel/asm-offsets.c:14:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:558:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:563:5: warning: no previous prototype for function 'update_ftrace_direct_del' [-Wmissing-prototypes]
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:563:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   2 warnings generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:558:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:563:5: warning: no previous prototype for function 'update_ftrace_direct_del' [-Wmissing-prototypes]
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:563:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     563 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
    3743 |         struct cpumask *cpumask;
         |                         ^
   3 warnings generated.


vim +/update_ftrace_direct_del +563 include/linux/ftrace.h

   557	
 > 558	int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
   559	{
   560		return -ENODEV;
   561	}
   562	
 > 563	int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
   564	{
   565		return -ENODEV;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
