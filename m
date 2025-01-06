Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F1114D456
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 04:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736137492; cv=none; b=pqFE8P2VEDPKx/8G7htNElW9l285rSWHHFg3t5A9Lwguqpe8HRFxVNlAhCcxqEm6m1+Ameaz/A3D3mnJVO/jp1YZ0R5lGjGXkbNumP3nXaIsV1dVMUxgap1VaR4S+8SqQN4XvR9sHdx6JwlJZ+y/8nGrWdUbAVogOhYsO9MwP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736137492; c=relaxed/simple;
	bh=4TiCROanT1qSTINFTDoj4fM6wHEoL4Su4qfX2vUiP3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6K+AfxRAqIHSW1CiDoBTL5AcZLX2OaZiiLuD9I1Lt3wbSscsG1kxk4BWMz/qyUUx9Z2ZHRyrDP2vA3W2TEf44Yjur7OwmckfxrzHr2VjuIJGErIv71/nUfQivWxxmp4+E9ry9yY88aV59UPJdVes4a7+Zfz/m/4NbjC2njRMIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbVqIXJk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbVqIXJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736137490; x=1767673490;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4TiCROanT1qSTINFTDoj4fM6wHEoL4Su4qfX2vUiP3Q=;
  b=FbVqIXJkp7GixfhUvSJMM2agBhMt+QO7maX89ouEH16bS/0ABOd1aAIA
   pmRXlsVIMDvgi+eLJqW/mp7Qvfww3nO96TFPoRYO4HyOJueNMFilzIATL
   uJ083u7hHiABbKGdf7Tz03g14KMg7XxCqdKc9BsqOze1KBAgaGKxGnG/D
   vl4S6R9pVAXf7xrUyV08GjVQe7qM34oDby9uAgqvl9gu8ymU13714G8VM
   09i89aDOPWat01MKnYmVZ10diyrsB83xfWBdaCFRH+TG7l+DD6wA840Oc
   AZc+XLvPxVtBbh0On6xbnVae5MG1Dk+JpF6moSgdbB4caef4aAz/lHGKD
   A==;
X-CSE-ConnectionGUID: lFFiA6aeSSawX5KNXKIoqQ==
X-CSE-MsgGUID: mwmPqG6lQ4uO/TMLEMJvlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36506529"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36506529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 20:24:49 -0800
X-CSE-ConnectionGUID: pocS8zy4Q4CEY2BYjHAXjw==
X-CSE-MsgGUID: b5r2RiCfR92F+h8zu1pa1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102518852"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jan 2025 20:24:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUefW-000CEh-24;
	Mon, 06 Jan 2025 04:24:46 +0000
Date: Mon, 6 Jan 2025 12:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm-generic-entry-v6.13-rc1 30/32]
 kernel/entry/common.c:52:23: error: implicit declaration of function
 '__secure_computing'
Message-ID: <202501061240.Fzk9qiFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm-generic-entry-v6.13-rc1
head:   72565935c9fa6a95a0e09d94f3041e639828b28b
commit: 01bb4c148b36f75488ad6814f26e927881b969a8 [30/32] ARM: entry: Convert to generic entry
config: arm-randconfig-004-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061240.Fzk9qiFZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061240.Fzk9qiFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061240.Fzk9qiFZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/entry/common.c: In function 'syscall_trace_enter':
>> kernel/entry/common.c:52:23: error: implicit declaration of function '__secure_computing' [-Wimplicit-function-declaration]
      52 |                 ret = __secure_computing(NULL);
         |                       ^~~~~~~~~~~~~~~~~~


vim +/__secure_computing +52 kernel/entry/common.c

142781e108b13b Thomas Gleixner         2020-07-22  27  
221a164035fd8b Sven Schnelle           2023-12-18  28  long syscall_trace_enter(struct pt_regs *regs, long syscall,
2991552447707d Gabriel Krisman Bertazi 2020-11-16  29  				unsigned long work)
142781e108b13b Thomas Gleixner         2020-07-22  30  {
142781e108b13b Thomas Gleixner         2020-07-22  31  	long ret = 0;
142781e108b13b Thomas Gleixner         2020-07-22  32  
11894468e39def Gabriel Krisman Bertazi 2020-11-27  33  	/*
11894468e39def Gabriel Krisman Bertazi 2020-11-27  34  	 * Handle Syscall User Dispatch.  This must comes first, since
11894468e39def Gabriel Krisman Bertazi 2020-11-27  35  	 * the ABI here can be something that doesn't make sense for
11894468e39def Gabriel Krisman Bertazi 2020-11-27  36  	 * other syscall_work features.
11894468e39def Gabriel Krisman Bertazi 2020-11-27  37  	 */
11894468e39def Gabriel Krisman Bertazi 2020-11-27  38  	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
11894468e39def Gabriel Krisman Bertazi 2020-11-27  39  		if (syscall_user_dispatch(regs))
11894468e39def Gabriel Krisman Bertazi 2020-11-27  40  			return -1L;
11894468e39def Gabriel Krisman Bertazi 2020-11-27  41  	}
11894468e39def Gabriel Krisman Bertazi 2020-11-27  42  
142781e108b13b Thomas Gleixner         2020-07-22  43  	/* Handle ptrace */
64eb35f701f04b Gabriel Krisman Bertazi 2020-11-16  44  	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
0cfcb2b9ef48bb Eric W. Biederman       2022-01-27  45  		ret = ptrace_report_syscall_entry(regs);
64eb35f701f04b Gabriel Krisman Bertazi 2020-11-16  46  		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
142781e108b13b Thomas Gleixner         2020-07-22  47  			return -1L;
142781e108b13b Thomas Gleixner         2020-07-22  48  	}
142781e108b13b Thomas Gleixner         2020-07-22  49  
142781e108b13b Thomas Gleixner         2020-07-22  50  	/* Do seccomp after ptrace, to catch any tracer changes. */
23d67a54857a76 Gabriel Krisman Bertazi 2020-11-16  51  	if (work & SYSCALL_WORK_SECCOMP) {
142781e108b13b Thomas Gleixner         2020-07-22 @52  		ret = __secure_computing(NULL);
142781e108b13b Thomas Gleixner         2020-07-22  53  		if (ret == -1L)
142781e108b13b Thomas Gleixner         2020-07-22  54  			return ret;
142781e108b13b Thomas Gleixner         2020-07-22  55  	}
142781e108b13b Thomas Gleixner         2020-07-22  56  
b6ec413461034d Kees Cook               2020-09-11  57  	/* Either of the above might have changed the syscall number */
b6ec413461034d Kees Cook               2020-09-11  58  	syscall = syscall_get_nr(current, regs);
b6ec413461034d Kees Cook               2020-09-11  59  
fb13b11d53875e André Rösti             2024-03-11  60  	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT)) {
142781e108b13b Thomas Gleixner         2020-07-22  61  		trace_sys_enter(regs, syscall);
fb13b11d53875e André Rösti             2024-03-11  62  		/*
fb13b11d53875e André Rösti             2024-03-11  63  		 * Probes or BPF hooks in the tracepoint may have changed the
fb13b11d53875e André Rösti             2024-03-11  64  		 * system call number as well.
fb13b11d53875e André Rösti             2024-03-11  65  		 */
fb13b11d53875e André Rösti             2024-03-11  66  		syscall = syscall_get_nr(current, regs);
fb13b11d53875e André Rösti             2024-03-11  67  	}
142781e108b13b Thomas Gleixner         2020-07-22  68  
142781e108b13b Thomas Gleixner         2020-07-22  69  	syscall_enter_audit(regs, syscall);
142781e108b13b Thomas Gleixner         2020-07-22  70  
142781e108b13b Thomas Gleixner         2020-07-22  71  	return ret ? : syscall;
142781e108b13b Thomas Gleixner         2020-07-22  72  }
142781e108b13b Thomas Gleixner         2020-07-22  73  

:::::: The code at line 52 was first introduced by commit
:::::: 142781e108b13b2b0e8f035cfb5bfbbc8f14d887 entry: Provide generic syscall entry functionality

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
