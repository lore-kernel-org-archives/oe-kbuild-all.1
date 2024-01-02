Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89C5156E7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jan 2024 18:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cqi98zd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704219659; x=1735755659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xo3PcLOBlVb9KtxwmTT9WcgEH1LD+Te7ZTomXRveBdg=;
  b=Cqi98zd0PjTAW1LhuuzifcNerXdvQagrirokp6nje/Yc/Y+Xj8EQ1Jp1
   eyThJSG+ZIjyVv5iujVFr2AGwS/8+NvMpEpQU1VUuExW5E1mUUbXFNU/c
   gV3Oc3sHGe1SaG6gIlk5qDgRb67Gr+F+AgcKl97IZjTCk2c8ryrNKk3tt
   eMnXIt9Ts+7F/ZZdqlalMhVc8c17nunkxwtcnaPqrhcTPpIEG7MyDE4eR
   kT1WRnBdFwNagLcXmCyQtTRdtyD3IQNUdpha3Fm1v0Mr/Z7aaw7qYoZFU
   Wk51sT1oclqn3iIxwRLjrkjUQlAsG6mJSE1EmIZFQ0LLXvHilXjurfdis
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396636031"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="396636031"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 10:20:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="870328699"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="870328699"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jan 2024 10:20:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKjNn-000LNP-2p;
	Tue, 02 Jan 2024 18:20:55 +0000
Date: Wed, 3 Jan 2024 02:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:misc 1/2] fork.c:(.text+0xea0): multiple definition of
 `bpf_user_writable_register';
 arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
Message-ID: <202401030205.7aCx2kTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git misc
head:   20d435f75e5c821a24146995afca94cdcf6a4d34
commit: 5214acb8d02febb2238f4f74dc27cf5bc460c206 [1/2] bpf: Introduce bpf_probe_write_user_registered()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240103/202401030205.7aCx2kTB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401030205.7aCx2kTB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401030205.7aCx2kTB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:98:
>> include/linux/bpf.h:2744:5: warning: no previous prototype for 'bpf_user_writable_register' [-Wmissing-prototypes]
    2744 | int bpf_user_writable_register(void __user *start, size_t size, u32 tag)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf.h:2749:5: warning: no previous prototype for 'bpf_user_writable_unregister' [-Wmissing-prototypes]
    2749 | int bpf_user_writable_unregister(void __user *start, size_t size)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf.h:2754:6: warning: no previous prototype for 'bpf_user_writable_free' [-Wmissing-prototypes]
    2754 | void bpf_user_writable_free(struct task_struct *t)
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   ld: kernel/fork.o: in function `bpf_user_writable_register':
>> fork.c:(.text+0xea0): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: kernel/fork.o: in function `bpf_user_writable_unregister':
>> fork.c:(.text+0xeb0): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: kernel/fork.o: in function `bpf_user_writable_free':
>> fork.c:(.text+0xec0): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here
   ld: kernel/sysctl.o: in function `bpf_user_writable_register':
   sysctl.c:(.text+0x2090): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: kernel/sysctl.o: in function `bpf_user_writable_unregister':
   sysctl.c:(.text+0x20a0): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: kernel/sysctl.o: in function `bpf_user_writable_free':
   sysctl.c:(.text+0x20b0): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here
   ld: kernel/sys.o: in function `bpf_user_writable_register':
   sys.c:(.text+0x1340): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: kernel/sys.o: in function `bpf_user_writable_unregister':
   sys.c:(.text+0x1350): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: kernel/sys.o: in function `bpf_user_writable_free':
   sys.c:(.text+0x1360): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here
   ld: kernel/extable.o: in function `bpf_user_writable_free':
   extable.c:(.text+0x20): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here
   ld: kernel/extable.o: in function `bpf_user_writable_register':
   extable.c:(.text+0x0): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: kernel/extable.o: in function `bpf_user_writable_unregister':
   extable.c:(.text+0x10): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: kernel/kallsyms.o: in function `bpf_user_writable_register':
   kallsyms.c:(.text+0x790): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: kernel/kallsyms.o: in function `bpf_user_writable_unregister':
   kallsyms.c:(.text+0x7a0): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: kernel/kallsyms.o: in function `bpf_user_writable_free':
   kallsyms.c:(.text+0x7b0): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here
   ld: kernel/events/core.o: in function `bpf_user_writable_register':
   core.c:(.text+0x8480): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: kernel/events/core.o: in function `bpf_user_writable_unregister':
   core.c:(.text+0x8490): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: kernel/events/core.o: in function `bpf_user_writable_free':
   core.c:(.text+0x84a0): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here
   ld: fs/exec.o: in function `bpf_user_writable_register':
   exec.c:(.text+0x1bb0): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: fs/exec.o: in function `bpf_user_writable_unregister':
   exec.c:(.text+0x1bc0): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: fs/exec.o: in function `bpf_user_writable_free':
   exec.c:(.text+0x1bd0): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here
   ld: fs/select.o: in function `bpf_user_writable_register':
   select.c:(.text+0x3f0): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: fs/select.o: in function `bpf_user_writable_unregister':
   select.c:(.text+0x400): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: fs/select.o: in function `bpf_user_writable_free':
   select.c:(.text+0x410): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here
   ld: fs/eventpoll.o: in function `bpf_user_writable_register':
   eventpoll.c:(.text+0x1640): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: fs/eventpoll.o: in function `bpf_user_writable_unregister':
   eventpoll.c:(.text+0x1650): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: fs/eventpoll.o: in function `bpf_user_writable_free':
   eventpoll.c:(.text+0x1660): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here
   ld: fs/proc/proc_sysctl.o: in function `bpf_user_writable_register':
   proc_sysctl.c:(.text+0x2390): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: fs/proc/proc_sysctl.o: in function `bpf_user_writable_unregister':
   proc_sysctl.c:(.text+0x23a0): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: fs/proc/proc_sysctl.o: in function `bpf_user_writable_free':
   proc_sysctl.c:(.text+0x23b0): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here
   ld: block/blk-core.o: in function `bpf_user_writable_register':
   blk-core.c:(.text+0x3e0): multiple definition of `bpf_user_writable_register'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x730): first defined here
   ld: block/blk-core.o: in function `bpf_user_writable_unregister':
   blk-core.c:(.text+0x3f0): multiple definition of `bpf_user_writable_unregister'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x740): first defined here
   ld: block/blk-core.o: in function `bpf_user_writable_free':
   blk-core.c:(.text+0x400): multiple definition of `bpf_user_writable_free'; arch/x86/kernel/cpu/bugs.o:bugs.c:(.text+0x750): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
