Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A139B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 00:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693701218; x=1725237218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8d011BYiN6lqxS2jEiNkFOsSbhpIxWZqzeSOee3/FFw=;
  b=MyOFE0T13DDpa0mrN4ouAY6UKe6ddDLOAK/7lbN6KPfvacIyYHXdU316
   Tbw7E3xXy/RaH5iFizDJF+vQ66opgXLDdtYnZOXjLI9U788P2OZP68mJT
   0D8ZnbCJ3u+uhfdNKnu+9UiApbMYpCn4p1pyOakkXFzI6OWB4ZlSBzq/L
   ETQ5Xr4NntNz+BoXNNSJd798nhdXAHpbnmRCauroz9G/ALsQ6e0rddEQd
   P4TKyfiT2p8TcUM3RLatuCtXMluPFNN2nlzdgnEAgsBL36ceg6U0o1x0o
   hoh1Xp3QKiAR9wbglaXu2qw8AvrV4xEsWBahwI1iMuUnrmUU1Ss+ugfFp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="356722799"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="356722799"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 17:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="830520741"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="830520741"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2023 17:33:36 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcb3W-0002jj-0x;
	Sun, 03 Sep 2023 00:33:34 +0000
Date: Sun, 3 Sep 2023 08:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 15/20]
 arch/loongarch/kernel/rethook.h:6:6: error: conflicting types for
 'arch_rethook_prepare'; have 'void(struct rethook_node *, struct pt_regs *,
 bool)' {aka 'void(struct rethook_node *, struct pt_regs *, _Bool)'}
Message-ID: <202309030856.rC0FVJcb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   398bcb2fcb442bac23d5e514b6144ef4c32d74e8
commit: 166a921c48f9d2159816f6b8339679b8c7d844a5 [15/20] fprobe: rethook: Use ftrace_regs in fprobe exit handler and rethook
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230903/202309030856.rC0FVJcb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030856.rC0FVJcb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030856.rC0FVJcb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/rethook.c:8:
>> arch/loongarch/kernel/rethook.h:6:6: error: conflicting types for 'arch_rethook_prepare'; have 'void(struct rethook_node *, struct pt_regs *, bool)' {aka 'void(struct rethook_node *, struct pt_regs *, _Bool)'}
       6 | void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kprobes.h:31,
                    from arch/loongarch/kernel/rethook.c:6:
   include/linux/rethook.h:73:6: note: previous declaration of 'arch_rethook_prepare' with type 'void(struct rethook_node *, struct ftrace_regs *, bool)' {aka 'void(struct rethook_node *, struct ftrace_regs *, _Bool)'}
      73 | void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/rethook.c: In function 'arch_rethook_trampoline_callback':
>> arch/loongarch/kernel/rethook.c:13:43: error: passing argument 1 of 'rethook_trampoline_handler' from incompatible pointer type [-Werror=incompatible-pointer-types]
      13 |         return rethook_trampoline_handler(regs, 0);
         |                                           ^~~~
         |                                           |
         |                                           struct pt_regs *
   include/linux/rethook.h:92:62: note: expected 'struct ftrace_regs *' but argument is of type 'struct pt_regs *'
      92 | unsigned long rethook_trampoline_handler(struct ftrace_regs *regs,
         |                                          ~~~~~~~~~~~~~~~~~~~~^~~~
   arch/loongarch/kernel/rethook.c: At top level:
>> arch/loongarch/kernel/rethook.c:17:6: error: conflicting types for 'arch_rethook_prepare'; have 'void(struct rethook_node *, struct pt_regs *, bool)' {aka 'void(struct rethook_node *, struct pt_regs *, _Bool)'}
      17 | void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
         |      ^~~~~~~~~~~~~~~~~~~~
   include/linux/rethook.h:73:6: note: previous declaration of 'arch_rethook_prepare' with type 'void(struct rethook_node *, struct ftrace_regs *, bool)' {aka 'void(struct rethook_node *, struct ftrace_regs *, _Bool)'}
      73 | void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +6 arch/loongarch/kernel/rethook.h

7b0a096436c2dac Haoran Jiang 2023-06-29  4  
7b0a096436c2dac Haoran Jiang 2023-06-29  5  unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs);
7b0a096436c2dac Haoran Jiang 2023-06-29 @6  void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
7b0a096436c2dac Haoran Jiang 2023-06-29  7  

:::::: The code at line 6 was first introduced by commit
:::::: 7b0a096436c2dac6de77d132e751a8a3328798d5 LoongArch: Replace kretprobe with rethook

:::::: TO: Haoran Jiang <jianghaoran@kylinos.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
