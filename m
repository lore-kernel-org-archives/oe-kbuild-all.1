Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79841E766F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668531; cv=none; b=Kdvsyd1ci/yPMxFRZdEshHGzgG93jZVqkpVx9QPZ2XrNL7zP6zUyTqhiuuNR8GtoB3r6qWbCWlscTzqwycflmrqB4iRRNVySWNEOYLModHqX+b+m4c/8oec+8isJeu1VJhkdxGk4t9XSmwn5DfleNqxHi3x1Aw4gzmWVG8fwNh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668531; c=relaxed/simple;
	bh=FjnxV6D62MA5ZEE1nXjuSbVar5Sqk311BNJ1j9Ee38A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WyZsBbc5Cgwb31r/eDuE7qISAzlGMBXO7tMucTq41TzTTf/b5BeQBo4SELnLW5ECYz8mrwvYpwwamVD8lxk3Pwuhgq0I48IbUCpG2PU4HzO+Q3rl/R70eBNgrSZ0cGkhuBLBUITN3i1qH6kIitdx0BWvpj52beR5buwRTcVRjS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4drY9PJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4drY9PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780668528; x=1812204528;
  h=date:from:to:cc:subject:message-id;
  bh=FjnxV6D62MA5ZEE1nXjuSbVar5Sqk311BNJ1j9Ee38A=;
  b=Q4drY9PJgOK4iRgnkuzSW6G+nMroDOhATF1DkgceRJiI/nm0PaWIVkOK
   6IR6CMTCbKGUjCnrks1hCkQncoy9yWrXj7QREeH4PqrKA4+4TiIqbvscB
   /ek3Mn5F6sZDT/KdbHUioeWYpalwthaEeL1/YjaqtKHejZv5AvzogfjIF
   gqtHZTp8VbS1HJ8hiY1ge7VZ+mhdr5egIPiHkgRC5E9qTasbFtcwLPz5Q
   g+7dDgSjbZ4Jc53jlADtKPBlAdRkldo2jmCrT/RQi/2pXEJ9kAbDJ9gji
   ucdiDSBq2LifD2ET+3dKllzpFJmK60i1JRHQcTpI3GGXlTFZ3HKMsZkIp
   w==;
X-CSE-ConnectionGUID: fq0DC6PnQSS6FhGK0KIyUQ==
X-CSE-MsgGUID: z/MocHjgSve35YjDE9Mq4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85355250"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="85355250"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 07:08:48 -0700
X-CSE-ConnectionGUID: ZfoMCTeZQ+C6/dT1xIAENg==
X-CSE-MsgGUID: 1RQHZLXIQI2RDTe3u21hxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="282932478"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Jun 2026 07:08:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVVE3-00000000G6o-1u41;
	Fri, 05 Jun 2026 14:08:43 +0000
Date: Fri, 05 Jun 2026 22:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>
Subject: arch/um/os-Linux/start_up.c:309:39: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202606052233.u8VbrhuG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
commit: beddc9fb1cb161e1bf779b180750b648ff9690c7 um: Add SECCOMP support detection and initialization
date:   1 year ago
config: um-randconfig-r113-20260605 (https://download.01.org/0day-ci/archive/20260605/202606052233.u8VbrhuG-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052233.u8VbrhuG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: beddc9fb1cb1 ("um: Add SECCOMP support detection and initialization")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052233.u8VbrhuG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/um/os-Linux/start_up.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/start_up.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:595:10: sparse: this was the original definition
   arch/um/os-Linux/start_up.c: note: in included file (through arch/um/include/shared/init.h):
   include/linux/compiler_types.h:348:10: sparse: sparse: preprocessor token __counted_by redefined
   arch/um/os-Linux/start_up.c: note: in included file (through /usr/include/linux/posix_types.h, /usr/include/linux/types.h, /usr/include/bits/sched.h, /usr/include/sched.h):
   /usr/include/linux/stddef.h:62:9: sparse: this was the original definition
   arch/um/os-Linux/start_up.c: note: in included file (through arch/um/include/shared/init.h):
   include/linux/compiler_types.h:367:9: sparse: sparse: preprocessor token __counted_by_le redefined
   arch/um/os-Linux/start_up.c: note: in included file (through /usr/include/linux/posix_types.h, /usr/include/linux/types.h, /usr/include/bits/sched.h, /usr/include/sched.h):
   /usr/include/linux/stddef.h:66:9: sparse: this was the original definition
   arch/um/os-Linux/start_up.c: note: in included file (through arch/um/include/shared/init.h):
   include/linux/compiler_types.h:368:9: sparse: sparse: preprocessor token __counted_by_be redefined
   arch/um/os-Linux/start_up.c: note: in included file (through /usr/include/linux/posix_types.h, /usr/include/linux/types.h, /usr/include/bits/sched.h, /usr/include/sched.h):
   /usr/include/linux/stddef.h:70:9: sparse: this was the original definition
>> arch/um/os-Linux/start_up.c:309:39: sparse: sparse: Using plain integer as NULL pointer

vim +309 arch/um/os-Linux/start_up.c

   287	
   288	static bool __init init_seccomp(void)
   289	{
   290		int pid;
   291		int status;
   292		int n;
   293		unsigned long sp;
   294	
   295		/* doesn't work on 32-bit right now */
   296		if (!IS_ENABLED(CONFIG_64BIT))
   297			return false;
   298	
   299		/*
   300		 * We check that we can install a seccomp filter and then exit(0)
   301		 * from a trapped syscall.
   302		 *
   303		 * Note that we cannot verify that no seccomp filter already exists
   304		 * for a syscall that results in the process/thread to be killed.
   305		 */
   306	
   307		os_info("Checking that seccomp filters can be installed...");
   308	
 > 309		seccomp_test_stub_data = mmap(0, sizeof(*seccomp_test_stub_data),
   310					      PROT_READ | PROT_WRITE,
   311					      MAP_SHARED | MAP_ANON, 0, 0);
   312	
   313		/* Use the syscall data area as stack, we just need something */
   314		sp = (unsigned long)&seccomp_test_stub_data->syscall_data +
   315		     sizeof(seccomp_test_stub_data->syscall_data) -
   316		     sizeof(void *);
   317		pid = clone(seccomp_helper, (void *)sp, CLONE_VFORK | CLONE_VM, NULL);
   318	
   319		if (pid < 0)
   320			fatal_perror("check_seccomp : clone failed");
   321	
   322		CATCH_EINTR(n = waitpid(pid, &status, __WCLONE));
   323		if (n < 0)
   324			fatal_perror("check_seccomp : waitpid failed");
   325	
   326		if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
   327			struct uml_pt_regs *regs;
   328			unsigned long fp_size;
   329			int r;
   330	
   331			/* Fill in the host_fp_size from the mcontext. */
   332			regs = calloc(1, sizeof(struct uml_pt_regs));
   333			get_stub_state(regs, seccomp_test_stub_data, &fp_size);
   334			host_fp_size = fp_size;
   335			free(regs);
   336	
   337			/* Repeat with the correct size */
   338			regs = calloc(1, sizeof(struct uml_pt_regs) + host_fp_size);
   339			r = get_stub_state(regs, seccomp_test_stub_data, NULL);
   340	
   341			/* Store as the default startup registers */
   342			exec_fp_regs = malloc(host_fp_size);
   343			memcpy(exec_regs, regs->gp, sizeof(exec_regs));
   344			memcpy(exec_fp_regs, regs->fp, host_fp_size);
   345	
   346			munmap(seccomp_test_stub_data, sizeof(*seccomp_test_stub_data));
   347	
   348			free(regs);
   349	
   350			if (r) {
   351				os_info("failed to fetch registers: %d\n", r);
   352				return false;
   353			}
   354	
   355			os_info("OK\n");
   356			return true;
   357		}
   358	
   359		if (WIFEXITED(status) && WEXITSTATUS(status) == 2)
   360			os_info("missing\n");
   361		else
   362			os_info("error\n");
   363	
   364		munmap(seccomp_test_stub_data, sizeof(*seccomp_test_stub_data));
   365		return false;
   366	}
   367	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
