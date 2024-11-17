Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9659C634
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 04:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731817372; cv=none; b=Z4kE6NnnDESgkrGVwE3LUXJZyxF2zUVpJznPoQRYso2s/sfCV0Q20gOohASZHVs9xP+RATnOEOYGUWVHGJJL5ffHLnTgDf2W5cD9X28YM8FlNKkFP2OrSB4EWf5e4D8W8sgtkpBlgotdoo6UKnoScVcKzacsi83qTNJkloLByB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731817372; c=relaxed/simple;
	bh=h+570u109RPs9chA7GZB0v5wOnYZ+Kqy4niQlFPhCIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rCsw9KPiPzPqB994lpIW6HsHjTIK2hkvfla5PzHEPURD5oXNiBMbwykUi54LJ+zrmjWN6MBoEye753dm/pPb8FzWfKD6w6dLQxW+teDY8Yi6nUW7cCPEohGqO/jzRdk9UNEx2s9Bp1PbyjI526tt3Gbi5oz/qnNcpdYcauvk+hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABliokvc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABliokvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731817371; x=1763353371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h+570u109RPs9chA7GZB0v5wOnYZ+Kqy4niQlFPhCIY=;
  b=ABliokvcUONHpTa4oqWZRJoQxymdAYk9e+FP4ePUqTQTpFge742IAYqo
   42+XWY7ri47zEqFXVpuuw5VCF9X5XwyODZeSQJSQJ3eKraXPqxtekk4pr
   1bhaIzUuiiVjh4y2vgktMeWoPsiPJ7qWgx7q+9kgUFfz6x/gqImWQR1a2
   /INTzn0BF9FEaa9RdFzR69RXaC14BFZb6c8n00bubKO+EnnoBzy3en98r
   6XT1S6fguteW1xikbiwcivmnaAj5IYp+7yvvxRd1VkSoRxWu5RcAZT6Z5
   FU5lrUrytTRC3rPpAemcKhQX1QyhTVligh8Uh9nCaV21QPF59f+qzW+ym
   w==;
X-CSE-ConnectionGUID: Df0VXTIMQhWMf2jg9aRdiQ==
X-CSE-MsgGUID: eUxqt2KURv+/5Mv0K3whPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54290824"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="54290824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 20:22:51 -0800
X-CSE-ConnectionGUID: 9WCgD/l3Teau98AbJnCIaQ==
X-CSE-MsgGUID: n6SLkHVYSPmqKwJ4jkpwDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="89325848"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Nov 2024 20:22:48 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCWoA-0001Rd-16;
	Sun, 17 Nov 2024 04:22:46 +0000
Date: Sun, 17 Nov 2024 12:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 10/10]
 arch/x86/include/asm/paravirt.h:59:2: error: expected ')'
Message-ID: <202411171202.xH9bNHwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   ec22210e550d285543b6dd26e6be038407086200
commit: ec22210e550d285543b6dd26e6be038407086200 [10/10] objtool: Collect all annotations in objtool.h
config: i386-randconfig-053-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171202.xH9bNHwn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171202.xH9bNHwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171202.xH9bNHwn-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
   In file included from arch/x86/include/asm/pgtable.h:980:
   In file included from arch/x86/include/asm/pgtable_32.h:19:
>> arch/x86/include/asm/paravirt.h:59:2: error: expected ')'
      59 |         PVOP_VCALL0(cpu.io_delay);
         |         ^
   arch/x86/include/asm/paravirt_types.h:460:2: note: expanded from macro 'PVOP_VCALL0'
     460 |         __PVOP_VCALL(op)
         |         ^
   arch/x86/include/asm/paravirt_types.h:440:8: note: expanded from macro '__PVOP_VCALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^
   arch/x86/include/asm/paravirt_types.h:397:28: note: expanded from macro '____PVOP_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^
   arch/x86/include/asm/paravirt_types.h:251:2: note: expanded from macro 'PARAVIRT_CALL'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
   In file included from arch/x86/include/asm/pgtable.h:980:
   In file included from arch/x86/include/asm/pgtable_32.h:19:
   arch/x86/include/asm/paravirt.h:75:2: error: expected ')'
      75 |         PVOP_VCALL0(mmu.flush_tlb_user);
         |         ^
   arch/x86/include/asm/paravirt_types.h:460:2: note: expanded from macro 'PVOP_VCALL0'
     460 |         __PVOP_VCALL(op)
         |         ^
   arch/x86/include/asm/paravirt_types.h:440:8: note: expanded from macro '__PVOP_VCALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^
   arch/x86/include/asm/paravirt_types.h:397:28: note: expanded from macro '____PVOP_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^
   arch/x86/include/asm/paravirt_types.h:251:2: note: expanded from macro 'PARAVIRT_CALL'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
   In file included from arch/x86/include/asm/pgtable.h:980:
   In file included from arch/x86/include/asm/pgtable_32.h:19:
   arch/x86/include/asm/paravirt.h:80:2: error: expected ')'
      80 |         PVOP_VCALL0(mmu.flush_tlb_kernel);
         |         ^
   arch/x86/include/asm/paravirt_types.h:460:2: note: expanded from macro 'PVOP_VCALL0'
     460 |         __PVOP_VCALL(op)
         |         ^
   arch/x86/include/asm/paravirt_types.h:440:8: note: expanded from macro '__PVOP_VCALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^
   arch/x86/include/asm/paravirt_types.h:397:28: note: expanded from macro '____PVOP_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^
   arch/x86/include/asm/paravirt_types.h:251:2: note: expanded from macro 'PARAVIRT_CALL'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
   In file included from arch/x86/include/asm/pgtable.h:980:
   In file included from arch/x86/include/asm/pgtable_32.h:19:
   arch/x86/include/asm/paravirt.h:85:2: error: expected ')'
      85 |         PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
         |         ^
   arch/x86/include/asm/paravirt_types.h:479:2: note: expanded from macro 'PVOP_VCALL1'
     479 |         __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
         |         ^
   arch/x86/include/asm/paravirt_types.h:440:8: note: expanded from macro '__PVOP_VCALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^
   arch/x86/include/asm/paravirt_types.h:397:28: note: expanded from macro '____PVOP_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \


vim +59 arch/x86/include/asm/paravirt.h

4e6292114c7412 Juergen Gross  2021-03-11  55  
fdc0269e8958a1 Juergen Gross  2018-08-28  56  /* The paravirtualized I/O functions */
fdc0269e8958a1 Juergen Gross  2018-08-28  57  static inline void slow_down_io(void)
fdc0269e8958a1 Juergen Gross  2018-08-28  58  {
eac46b323b2821 Peter Zijlstra 2021-06-24 @59  	PVOP_VCALL0(cpu.io_delay);
fdc0269e8958a1 Juergen Gross  2018-08-28  60  #ifdef REALLY_SLOW_IO
eac46b323b2821 Peter Zijlstra 2021-06-24  61  	PVOP_VCALL0(cpu.io_delay);
eac46b323b2821 Peter Zijlstra 2021-06-24  62  	PVOP_VCALL0(cpu.io_delay);
eac46b323b2821 Peter Zijlstra 2021-06-24  63  	PVOP_VCALL0(cpu.io_delay);
fdc0269e8958a1 Juergen Gross  2018-08-28  64  #endif
fdc0269e8958a1 Juergen Gross  2018-08-28  65  }
fdc0269e8958a1 Juergen Gross  2018-08-28  66  

:::::: The code at line 59 was first introduced by commit
:::::: eac46b323b28215ad19d53390737df4aa336ac14 x86/paravirt: Use PVOP_* for paravirt calls

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
