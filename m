Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4795DEAC6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 03:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728187128; cv=none; b=NsN4U8N9YIdjqdkw3WfnnvjE5Vbn+lGj+yrQIZ6YUyqCRb6tlX64Cy6d6d/B/yemtrWz6ecvixadiwt1ceJ/1Lrz0m04bMgc5LJZJual/1KlHPiie9Mh4kDL80c210+RN0MxMH9Hntm8WUgrVhu84Nb4aMhmIuUgbXAN67hbKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728187128; c=relaxed/simple;
	bh=Egaa6iZYzMuF2zGWTLQXS5DjvOOEgfe8SqZ+zwAWgrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PdQXeT/SDpRveI/+YUPG2KIMHT06hFqW3EeP6U/lTmVzUEH5VgFBun6KEZaQacGx3I3XIY8TmYW9HeMIrTTb3FGTG6LgzgenJ3d4tM/j0+chtFClDGj1d8Dlw3VQP/zQZy71HI8orip3YziZWWFnhbhmbXCGqfXyLWfTX7RFJA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPPrtI/W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPPrtI/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728187127; x=1759723127;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Egaa6iZYzMuF2zGWTLQXS5DjvOOEgfe8SqZ+zwAWgrc=;
  b=EPPrtI/WaF9tryk7LMxB8KhO/+thRcv4kL3rH4POHo8Rio7kiWiqnpnd
   DyA+kD3s49dCe7yZZSwnuf+oCC4w01zUPoMNSVROax4tt8FO5K/j1tnFi
   wJLGaKmi/vJtDfvj9LP8IuDVRVFtWxn2t3NMcBZuw9HMnnfCVDka5D5UX
   6EgV1lsrh6SA8iL99iCfkTcG7zh4iEivPjDk3Lu5APDehJOFMUY4GzBXs
   tBvDkdQtM+qJAGrczj0RYZhNcpIz3OZNfEMB0WP6h6I+pvwNfqgX9SQZm
   yMkzfb/IJoJbGk/VOfeP+UvFfVQq6ex20ic5RfCGzFgO3+21aC384lnKo
   g==;
X-CSE-ConnectionGUID: oTyacKajSDi2k584F8QE2g==
X-CSE-MsgGUID: jpTO8gjAQUG/vnxy87gl7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="31158736"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="31158736"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 20:58:47 -0700
X-CSE-ConnectionGUID: 060NaE8GTUWICrdkhAd2Vg==
X-CSE-MsgGUID: 9ywUKSkGQqGL9UdC1Dwndg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="74789908"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Oct 2024 20:58:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxIPq-0003aS-1w;
	Sun, 06 Oct 2024 03:58:42 +0000
Date: Sun, 6 Oct 2024 11:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm-generic-entry-v6.12-rc1 30/30]
 kernel/entry/common.c:55:9: error: call to undeclared function
 '__secure_computing'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202410061116.YKl5U8y3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm-generic-entry-v6.12-rc1
head:   073ac3744274d4bf1cf29f48147b13adadb2c6d3
commit: 073ac3744274d4bf1cf29f48147b13adadb2c6d3 [30/30] ARM: entry: Convert to generic entry
config: arm-randconfig-r054-20241006 (https://download.01.org/0day-ci/archive/20241006/202410061116.YKl5U8y3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061116.YKl5U8y3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061116.YKl5U8y3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/entry/common.c:4:
   In file included from include/linux/entry-common.h:6:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/entry/common.c:55:9: error: call to undeclared function '__secure_computing'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |                 ret = __secure_computing(NULL);
         |                       ^
   1 warning and 1 error generated.


vim +/__secure_computing +55 kernel/entry/common.c

142781e108b13b Thomas Gleixner         2020-07-22  27  
221a164035fd8b Sven Schnelle           2023-12-18  28  long syscall_trace_enter(struct pt_regs *regs, long syscall,
2991552447707d Gabriel Krisman Bertazi 2020-11-16  29  				unsigned long work)
142781e108b13b Thomas Gleixner         2020-07-22  30  {
57df4fd32dec86 Jinjie Ruan             2024-06-29  31  	unsigned long saved_reg;
142781e108b13b Thomas Gleixner         2020-07-22  32  	long ret = 0;
142781e108b13b Thomas Gleixner         2020-07-22  33  
11894468e39def Gabriel Krisman Bertazi 2020-11-27  34  	/*
11894468e39def Gabriel Krisman Bertazi 2020-11-27  35  	 * Handle Syscall User Dispatch.  This must comes first, since
11894468e39def Gabriel Krisman Bertazi 2020-11-27  36  	 * the ABI here can be something that doesn't make sense for
11894468e39def Gabriel Krisman Bertazi 2020-11-27  37  	 * other syscall_work features.
11894468e39def Gabriel Krisman Bertazi 2020-11-27  38  	 */
11894468e39def Gabriel Krisman Bertazi 2020-11-27  39  	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
11894468e39def Gabriel Krisman Bertazi 2020-11-27  40  		if (syscall_user_dispatch(regs))
11894468e39def Gabriel Krisman Bertazi 2020-11-27  41  			return -1L;
11894468e39def Gabriel Krisman Bertazi 2020-11-27  42  	}
11894468e39def Gabriel Krisman Bertazi 2020-11-27  43  
142781e108b13b Thomas Gleixner         2020-07-22  44  	/* Handle ptrace */
64eb35f701f04b Gabriel Krisman Bertazi 2020-11-16  45  	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
57df4fd32dec86 Jinjie Ruan             2024-06-29  46  		saved_reg = arch_prepare_report_syscall_entry(regs);
0cfcb2b9ef48bb Eric W. Biederman       2022-01-27  47  		ret = ptrace_report_syscall_entry(regs);
57df4fd32dec86 Jinjie Ruan             2024-06-29  48  		arch_post_report_syscall_entry(regs, saved_reg, ret);
57df4fd32dec86 Jinjie Ruan             2024-06-29  49  		if (ret || work & SYSCALL_WORK_SYSCALL_EMU)
142781e108b13b Thomas Gleixner         2020-07-22  50  			return -1L;
142781e108b13b Thomas Gleixner         2020-07-22  51  	}
142781e108b13b Thomas Gleixner         2020-07-22  52  
142781e108b13b Thomas Gleixner         2020-07-22  53  	/* Do seccomp after ptrace, to catch any tracer changes. */
23d67a54857a76 Gabriel Krisman Bertazi 2020-11-16  54  	if (work & SYSCALL_WORK_SECCOMP) {
142781e108b13b Thomas Gleixner         2020-07-22 @55  		ret = __secure_computing(NULL);
142781e108b13b Thomas Gleixner         2020-07-22  56  		if (ret == -1L)
142781e108b13b Thomas Gleixner         2020-07-22  57  			return ret;
142781e108b13b Thomas Gleixner         2020-07-22  58  	}
142781e108b13b Thomas Gleixner         2020-07-22  59  
b6ec413461034d Kees Cook               2020-09-11  60  	/* Either of the above might have changed the syscall number */
b6ec413461034d Kees Cook               2020-09-11  61  	syscall = syscall_get_nr(current, regs);
b6ec413461034d Kees Cook               2020-09-11  62  
fb13b11d53875e André Rösti             2024-03-11  63  	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT)) {
142781e108b13b Thomas Gleixner         2020-07-22  64  		trace_sys_enter(regs, syscall);
fb13b11d53875e André Rösti             2024-03-11  65  		/*
fb13b11d53875e André Rösti             2024-03-11  66  		 * Probes or BPF hooks in the tracepoint may have changed the
fb13b11d53875e André Rösti             2024-03-11  67  		 * system call number as well.
fb13b11d53875e André Rösti             2024-03-11  68  		 */
fb13b11d53875e André Rösti             2024-03-11  69  		syscall = syscall_get_nr(current, regs);
fb13b11d53875e André Rösti             2024-03-11  70  	}
142781e108b13b Thomas Gleixner         2020-07-22  71  
142781e108b13b Thomas Gleixner         2020-07-22  72  	syscall_enter_audit(regs, syscall);
142781e108b13b Thomas Gleixner         2020-07-22  73  
142781e108b13b Thomas Gleixner         2020-07-22  74  	return ret ? : syscall;
142781e108b13b Thomas Gleixner         2020-07-22  75  }
142781e108b13b Thomas Gleixner         2020-07-22  76  

:::::: The code at line 55 was first introduced by commit
:::::: 142781e108b13b2b0e8f035cfb5bfbbc8f14d887 entry: Provide generic syscall entry functionality

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
