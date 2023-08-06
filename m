Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AF01FAF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691308050; x=1722844050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t08RSmzicbcmGiNpE8LC7aFjt7lryEJ2ye6V1SM9Cso=;
  b=l5uNg1Z5xZAb4CdQzrK1L3B8rsuJuYUEiW91hJ70nYbSQ9d7aezUkC16
   9LpyL4uSmtBR7JdJKmrIpSpo46fLpQsN8+s4F6kVkx55CYRUTB4dslRUR
   DwBNvaePmywQvYGaFocYECxV6pMx40G6zVf5hf38ZjMRI9iCGdQ+vxAqJ
   bOatRzrlOrQ36ZO8UBKRdsO+GukJilxfVkxMXPQfwK5gRQOizhqBo8c51
   h/E8iF/zlz4dkLxsBF7Hq5RNM6cLmRdq9Poq9aqaEf0/MhI8LgQ+TSMCy
   4vMh3MAYrJYM8kPk7pKqYRIK+Xzh3gsiETqHahug+GSEEryysh0ph7exQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="349956646"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="349956646"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 00:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="733738613"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="733738613"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Aug 2023 00:47:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSYTh-00047T-0K;
	Sun, 06 Aug 2023 07:47:05 +0000
Date: Sun, 6 Aug 2023 15:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 2/5]
 arch/loongarch/kernel/rethook.h:6:6: error: conflicting types for
 'arch_rethook_prepare'; have 'void(struct rethook_node *, struct pt_regs *,
 bool)' {aka 'void(struct rethook_node *, struct pt_regs *, _Bool)'}
Message-ID: <202308061556.hIXTUcGt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   069e6430a717ff19937b79b565595cc7765791d0
commit: 5d93c6a3e4c0b1911bb29f888466aea92f1fae05 [2/5] fprobe: rethook: Use fprobe_regs in fprobe exit handler and rethook
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230806/202308061556.hIXTUcGt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061556.hIXTUcGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061556.hIXTUcGt-lkp@intel.com/

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

7b0a096436c2da Haoran Jiang 2023-06-29  4  
7b0a096436c2da Haoran Jiang 2023-06-29  5  unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs);
7b0a096436c2da Haoran Jiang 2023-06-29 @6  void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
7b0a096436c2da Haoran Jiang 2023-06-29  7  

:::::: The code at line 6 was first introduced by commit
:::::: 7b0a096436c2dac6de77d132e751a8a3328798d5 LoongArch: Replace kretprobe with rethook

:::::: TO: Haoran Jiang <jianghaoran@kylinos.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
