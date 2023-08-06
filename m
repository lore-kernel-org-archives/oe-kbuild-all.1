Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04649179
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 00:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691283300; x=1722819300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3OfJWuY8V6EO+WE6Dl9ar/5erV83YgWQYhyAhUBqx1A=;
  b=T7xBPGizRNP42OTTTMiiVAtWbJcXWbH15kUo4g46havcaSGoul7Cz3if
   rjD3t6IgBtxyi0m8sw7o03wist/bYKpeucSHG3Er+v9nWnMeKtclVDU1u
   qYCBi7Ibv0OWtGByYZ6rUnxFLfe+QRuJsXwHwypMZu6A1TtwuB2IGtc1v
   ty77LxadxuEYW8/Ep6GePO9jk3PYZwfB8/zX1HU7Jfzrz8iL6PMUwSr/V
   MBWnSf8Dkr+lYR3/BNVY4NoRBydlkGARapz97JdU2k/4AxNcd64gT6i6p
   pM6QDBiZt1wjMrAvrtXb4n0wZ/1qqOl9UER4671wvpuv4y/NiDLr0AC9A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="360415955"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="360415955"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 17:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="844549500"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="844549500"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2023 17:54:58 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSS2s-0003xz-0Q;
	Sun, 06 Aug 2023 00:54:58 +0000
Date: Sun, 6 Aug 2023 08:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/5] fprobe: rethook: Use fprobe_regs in fprobe exit
 handler and rethook
Message-ID: <202308060800.K6He4Vzv-lkp@intel.com>
References: <169124749229.186149.1426658495303367593.stgit@devnote2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169124749229.186149.1426658495303367593.stgit@devnote2>

Hi Masami,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master tip/x86/core linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/fprobe-Use-fprobe_regs-in-fprobe-entry-handler/20230805-230025
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/169124749229.186149.1426658495303367593.stgit%40devnote2
patch subject: [RFC PATCH 2/5] fprobe: rethook: Use fprobe_regs in fprobe exit handler and rethook
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230806/202308060800.K6He4Vzv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308060800.K6He4Vzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308060800.K6He4Vzv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/rethook.c:6:6: error: conflicting types for 'arch_rethook_prepare'; have 'void(struct rethook_node *, struct pt_regs *, bool)' {aka 'void(struct rethook_node *, struct pt_regs *, _Bool)'}
       6 | void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/rethook.c:2:
   include/linux/rethook.h:73:6: note: previous declaration of 'arch_rethook_prepare' with type 'void(struct rethook_node *, struct ftrace_regs *, bool)' {aka 'void(struct rethook_node *, struct ftrace_regs *, _Bool)'}
      73 | void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
         |      ^~~~~~~~~~~~~~~~~~~~
>> arch/s390/kernel/rethook.c:16:6: error: conflicting types for 'arch_rethook_fixup_return'; have 'void(struct pt_regs *, long unsigned int)'
      16 | void arch_rethook_fixup_return(struct pt_regs *regs,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rethook.h:88:6: note: previous declaration of 'arch_rethook_fixup_return' with type 'void(struct ftrace_regs *, long unsigned int)'
      88 | void arch_rethook_fixup_return(struct ftrace_regs *regs,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/rethook.c: In function 'arch_rethook_trampoline_callback':
>> arch/s390/kernel/rethook.c:29:43: error: passing argument 1 of 'rethook_trampoline_handler' from incompatible pointer type [-Werror=incompatible-pointer-types]
      29 |         return rethook_trampoline_handler(regs, regs->gprs[15]);
         |                                           ^~~~
         |                                           |
         |                                           struct pt_regs *
   include/linux/rethook.h:92:62: note: expected 'struct ftrace_regs *' but argument is of type 'struct pt_regs *'
      92 | unsigned long rethook_trampoline_handler(struct ftrace_regs *regs,
         |                                          ~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +6 arch/s390/kernel/rethook.c

1a280f48c0e403 Vasily Gorbik 2023-01-17   5  
1a280f48c0e403 Vasily Gorbik 2023-01-17  @6  void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
1a280f48c0e403 Vasily Gorbik 2023-01-17   7  {
1a280f48c0e403 Vasily Gorbik 2023-01-17   8  	rh->ret_addr = regs->gprs[14];
1a280f48c0e403 Vasily Gorbik 2023-01-17   9  	rh->frame = regs->gprs[15];
1a280f48c0e403 Vasily Gorbik 2023-01-17  10  
1a280f48c0e403 Vasily Gorbik 2023-01-17  11  	/* Replace the return addr with trampoline addr */
1a280f48c0e403 Vasily Gorbik 2023-01-17  12  	regs->gprs[14] = (unsigned long)&arch_rethook_trampoline;
1a280f48c0e403 Vasily Gorbik 2023-01-17  13  }
1a280f48c0e403 Vasily Gorbik 2023-01-17  14  NOKPROBE_SYMBOL(arch_rethook_prepare);
1a280f48c0e403 Vasily Gorbik 2023-01-17  15  
1a280f48c0e403 Vasily Gorbik 2023-01-17 @16  void arch_rethook_fixup_return(struct pt_regs *regs,
1a280f48c0e403 Vasily Gorbik 2023-01-17  17  			       unsigned long correct_ret_addr)
1a280f48c0e403 Vasily Gorbik 2023-01-17  18  {
1a280f48c0e403 Vasily Gorbik 2023-01-17  19  	/* Replace fake return address with real one. */
1a280f48c0e403 Vasily Gorbik 2023-01-17  20  	regs->gprs[14] = correct_ret_addr;
1a280f48c0e403 Vasily Gorbik 2023-01-17  21  }
1a280f48c0e403 Vasily Gorbik 2023-01-17  22  NOKPROBE_SYMBOL(arch_rethook_fixup_return);
1a280f48c0e403 Vasily Gorbik 2023-01-17  23  
1a280f48c0e403 Vasily Gorbik 2023-01-17  24  /*
1a280f48c0e403 Vasily Gorbik 2023-01-17  25   * Called from arch_rethook_trampoline
1a280f48c0e403 Vasily Gorbik 2023-01-17  26   */
1a280f48c0e403 Vasily Gorbik 2023-01-17  27  unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs)
1a280f48c0e403 Vasily Gorbik 2023-01-17  28  {
1a280f48c0e403 Vasily Gorbik 2023-01-17 @29  	return rethook_trampoline_handler(regs, regs->gprs[15]);
1a280f48c0e403 Vasily Gorbik 2023-01-17  30  }
1a280f48c0e403 Vasily Gorbik 2023-01-17  31  NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
1a280f48c0e403 Vasily Gorbik 2023-01-17  32  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
