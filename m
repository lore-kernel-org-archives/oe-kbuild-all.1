Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CC91D52A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 16:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695487673; x=1727023673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNPKlNqWk8AVd6hG7dY/IP96NkRL+McsxxFf/IKIjiU=;
  b=A0bg9aiGdsADcu/F5aWrT96KIckKdAOhFI3qiHqec7fv6GNsXP6dviqM
   TLeHzRmGiKuZeVLbZcQrSrW4nyRl4mpSugSdHJ/IrDNO1m0EdKRQkeEnj
   BNo16M7A+ob60tHdvWU8UHeB63pDGF8LzNDRLojDqM79Vf5Z0MNUVgao9
   0YSJdKX4pOybMEbh9XPf8BuAZGLz66mfTfC/ah9LGtbYSn9vLocCD9qv0
   Wd229ubM0Ngcb8tZRLU9GHlLehZvgqbJnmh+n/2SRc7dRrMqvubl6y3Uo
   c2QgyRdajsPSFWMMAW7bjv91bT1mH0JXh8d+U75nnJSXhKe+/1HJCG8tf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="378312464"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="378312464"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 09:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="838122569"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="838122569"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2023 09:47:50 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk5nI-0002eH-21;
	Sat, 23 Sep 2023 16:47:48 +0000
Date: Sun, 24 Sep 2023 00:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>
Subject: [mhiramat:topic/fprobe-ftrace-regs 6/12]
 arch/riscv/kernel/probes/rethook.h:6:6: error: conflicting types for
 'arch_rethook_prepare'; have 'void(struct rethook_node *, struct pt_regs *,
 bool)' {aka 'void(struct rethook_node *, struct pt_regs *, _Bool)'}
Message-ID: <202309240017.4xH1djGi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   e3d3f130d76aaae33dd6594a9c48a163d788e300
commit: e980157752a5b317f9909c47e0f5d3acbf0a04f5 [6/12] fprobe: rethook: Use ftrace_regs in fprobe exit handler and rethook
config: riscv-randconfig-001-20230923 (https://download.01.org/0day-ci/archive/20230924/202309240017.4xH1djGi-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240017.4xH1djGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240017.4xH1djGi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/probes/rethook.c:8:
>> arch/riscv/kernel/probes/rethook.h:6:6: error: conflicting types for 'arch_rethook_prepare'; have 'void(struct rethook_node *, struct pt_regs *, bool)' {aka 'void(struct rethook_node *, struct pt_regs *, _Bool)'}
       6 | void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kprobes.h:31,
                    from arch/riscv/kernel/probes/rethook.c:6:
   include/linux/rethook.h:73:6: note: previous declaration of 'arch_rethook_prepare' with type 'void(struct rethook_node *, struct ftrace_regs *, bool)' {aka 'void(struct rethook_node *, struct ftrace_regs *, _Bool)'}
      73 | void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/probes/rethook.c: In function 'arch_rethook_trampoline_callback':
>> arch/riscv/kernel/probes/rethook.c:13:43: error: passing argument 1 of 'rethook_trampoline_handler' from incompatible pointer type [-Werror=incompatible-pointer-types]
      13 |         return rethook_trampoline_handler(regs, regs->s0);
         |                                           ^~~~
         |                                           |
         |                                           struct pt_regs *
   include/linux/rethook.h:92:62: note: expected 'struct ftrace_regs *' but argument is of type 'struct pt_regs *'
      92 | unsigned long rethook_trampoline_handler(struct ftrace_regs *regs,
         |                                          ~~~~~~~~~~~~~~~~~~~~^~~~
   arch/riscv/kernel/probes/rethook.c: At top level:
>> arch/riscv/kernel/probes/rethook.c:18:6: error: conflicting types for 'arch_rethook_prepare'; have 'void(struct rethook_node *, struct pt_regs *, bool)' {aka 'void(struct rethook_node *, struct pt_regs *, _Bool)'}
      18 | void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
         |      ^~~~~~~~~~~~~~~~~~~~
   include/linux/rethook.h:73:6: note: previous declaration of 'arch_rethook_prepare' with type 'void(struct rethook_node *, struct ftrace_regs *, bool)' {aka 'void(struct rethook_node *, struct ftrace_regs *, _Bool)'}
      73 | void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +6 arch/riscv/kernel/probes/rethook.h

b57c2f12409845 Binglei Wang 2022-10-25  4  
b57c2f12409845 Binglei Wang 2022-10-25  5  unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs);
b57c2f12409845 Binglei Wang 2022-10-25 @6  void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
b57c2f12409845 Binglei Wang 2022-10-25  7  

:::::: The code at line 6 was first introduced by commit
:::::: b57c2f124098459a4acc15d5044f87cba31c87f0 riscv: add riscv rethook implementation

:::::: TO: Binglei Wang <l3b2w1@gmail.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
