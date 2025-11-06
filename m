Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFB930C35C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762421951; cv=none; b=JwREnzsVs1WnCONJfSOO60qiK+Zu0hWEXsfDMVWWosondZkAp+cV2LkWf4c/nYVdE3T/xhFhQ7OIiWpOlRnVykgobjYI7dXfI1UmETkBKSCenCBB/Wf/k2JfXbXcorErSk7U1DHOAAyjdhKXoe0APTmmbcMRYLQ0TdN1T+G6VMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762421951; c=relaxed/simple;
	bh=viqE8H9PdMxlg2zoBmFgvNr7RGn1Pp2V27HgsS50CLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTVR/4Jb1FvRLiQiz8/DBF5oFfyj8vnKjD02tRSYV+6XUIvSIYdo7QFHJvetT4ixbXZ0ys5+DxEp+hBMWf5HnSzWdygqIbJcWiRbJx3I4aHpHfOb6DM565eiHLFq1tE93Ye/Hx+AcP2H+3nnKl3Reanc2wWPQW4ov+U2m8UHRa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nX0i1xTD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nX0i1xTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762421949; x=1793957949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=viqE8H9PdMxlg2zoBmFgvNr7RGn1Pp2V27HgsS50CLQ=;
  b=nX0i1xTDb52Q+MkAI00DjtNotuV4rkzucdrYNg7aZjTgCbGJKDaIB8Ls
   ySh5OzNcbaiMuK3usSTkMFJnzbvlydiDLfyUfFRPtBjrrB83RD5B1488V
   7QAA1H4MoPT1daSXH5es/2PEypBxTokXMiFKcgZpvU8zPZuUv8CZkQ7zs
   Uv9v/11tjNQecRpQpDDWo3CzY+4tJm0rXep5i0MYliHI1v1wKc89wzJr+
   a1tMsxtQL3GEOgoZ8URyQSroNezMmXOyaBfLPdHzQ46J9hh2D1bcXNhG8
   vKs+qjhP0CiFzECMANbunuvyaqWMRU4aIfbG37+y+KZy0u4qEhyJn8LhD
   g==;
X-CSE-ConnectionGUID: zdzBs+A4TUi11SBOYT59+g==
X-CSE-MsgGUID: IN6qdTSaQdGSSSaIn5f1jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63759017"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="63759017"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 01:39:06 -0800
X-CSE-ConnectionGUID: Lxlo1M/YTrqFwo+LhWuqFA==
X-CSE-MsgGUID: LblCA9SlQh2pN8gv/NkAuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187873146"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Nov 2025 01:39:05 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGwSM-000TjI-2e;
	Thu, 06 Nov 2025 09:39:02 +0000
Date: Thu, 6 Nov 2025 17:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:text-startup-3 1/1] powerpc-linux-ld: warning: orphan
 section `.text' from `arch/powerpc/kernel/head_book3s_32.o' being placed in
 section `.text'
Message-ID: <202511061727.KR83XpB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git text-startup-3
head:   4cd994fa5f39884be972e9486dde1c193e96b3f2
commit: 4cd994fa5f39884be972e9486dde1c193e96b3f2 [1/1] todo
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251106/202511061727.KR83XpB1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061727.KR83XpB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061727.KR83XpB1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/head_book3s_32.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/fpu.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `init/main.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `init/version.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `init/do_mounts.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `init/noinitramfs.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `init/init_task.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/cputable.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/syscalls.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/switch.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/irq.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/align.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/signal_32.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/pmc.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/vdso.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/process.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/systbl.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/idle.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/signal.o' being placed in section `.text'
>> powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/sysfs.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/cacheinfo.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/time.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/prom.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/traps.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/setup-common.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/udbg.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/misc.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/io.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/misc_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/prom_parse.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/firmware.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/hw_breakpoint_constraints.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/interrupt.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/stacktrace.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/syscall.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/ptrace/ptrace.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/ptrace/ptrace-fpu.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/ptrace/ptrace-novsx.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/ptrace/ptrace-noadv.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/sys_ppc32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/vdso32_wrapper.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/proc_powerpc.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/idle_6xx.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/l2cr_6xx.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/cpu_setup_6xx.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/entry_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/setup_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/early_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/static_call.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/iomap.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/kernel/ppc_save_regs.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/fault.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/mem.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/pgtable.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/maccess.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/pageattr.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/init_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/pgtable_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/pgtable-frag.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/ioremap.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/ioremap_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/init-common.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/mmu_context.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/drmem.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/cacheflush.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/book3s32/mmu.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/book3s32/mmu_context.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/book3s32/hash_low.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/mm/book3s32/tlb.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/code-patching.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/pmem.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/string.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/memcmp_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/strlen_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/div64.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/copy_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/crtsavres.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/checksum_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/checksum_wrappers.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/string_32.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/sstep.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `arch/powerpc/lib/ldstfp.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/fork.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/exec_domain.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/panic.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/cpu.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/exit.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/softirq.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/resource.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/sysctl.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/capability.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/ptrace.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/user.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/signal.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/sys.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/umh.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/workqueue.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/pid.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/task_work.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/extable.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/params.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/kthread.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/sys_ni.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/nsproxy.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/nstree.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/nscommon.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/notifier.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/ksysfs.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/cred.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/reboot.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/async.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/range.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/smpboot.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/ucount.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/regset.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/ksyms_common.o' being placed in section `.text'
   powerpc-linux-ld: warning: orphan section `.text' from `kernel/groups.o' being placed in section `.text'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
