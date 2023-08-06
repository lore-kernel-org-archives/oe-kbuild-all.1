Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D89515B7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 03:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691291942; x=1722827942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ScmOnTXq6deJiStHxhinP1/Sh4Q6nqP68b+5e4/rojk=;
  b=c1VCy+hlj8k2XaiRZXWzokutsZKLva30qjbPHon3DYKREpE42xcdZ+YZ
   w4Vgx+ej1qZ0ZUUHV7TUGXbVn8PaV3pHRY7e9q3NWcGg/TT2lQzOdv+Oe
   tPLXXpLqy4pDq3hRCwSuqtvYcC2kOW4l97lfvZNcZflqLuMmovD4qwPUH
   u3eJopQqcKUwKmwO16bO4vea2VRhxKOF9b4GD9ijiWYkrCPlHON3kif56
   TQEx3F6qGnG5qC855eaUB0x/ICqsDb7F3oZ3FNhGiLGXDiZ40bhxABk+H
   krN2l3APgi73wMuf4xCuTJ+Czc+fFQAmXJn8JmxZTC8BgMyMR0a2jA999
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="355283886"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="355283886"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 20:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="873845917"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2023 20:19:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSUIF-00040F-15;
	Sun, 06 Aug 2023 03:18:59 +0000
Date: Sun, 6 Aug 2023 11:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/5] fprobe: rethook: Use fprobe_regs in fprobe exit
 handler and rethook
Message-ID: <202308061111.cUlfueXw-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master tip/x86/core linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/fprobe-Use-fprobe_regs-in-fprobe-entry-handler/20230805-230025
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/169124749229.186149.1426658495303367593.stgit%40devnote2
patch subject: [RFC PATCH 2/5] fprobe: rethook: Use fprobe_regs in fprobe exit handler and rethook
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230806/202308061111.cUlfueXw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061111.cUlfueXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061111.cUlfueXw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kprobes.c: In function 'kretprobe_rethook_handler':
   kernel/kprobes.c:2146:32: error: implicit declaration of function 'ftrace_get_regs' [-Werror=implicit-function-declaration]
    2146 |         struct pt_regs *regs = ftrace_get_regs(fregs);
         |                                ^~~~~~~~~~~~~~~
>> kernel/kprobes.c:2146:32: warning: initialization of 'struct pt_regs *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors
--
   arch/x86/kernel/rethook.c: In function 'arch_rethook_fixup_return':
   arch/x86/kernel/rethook.c:111:32: error: implicit declaration of function 'ftrace_get_regs' [-Werror=implicit-function-declaration]
     111 |         struct pt_regs *regs = ftrace_get_regs(fregs);
         |                                ^~~~~~~~~~~~~~~
>> arch/x86/kernel/rethook.c:111:32: warning: initialization of 'struct pt_regs *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   arch/x86/kernel/rethook.c: In function 'arch_rethook_prepare':
   arch/x86/kernel/rethook.c:121:32: warning: initialization of 'struct pt_regs *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     121 |         struct pt_regs *regs = ftrace_get_regs(fregs);
         |                                ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2146 kernel/kprobes.c

  2140	
  2141	static void kretprobe_rethook_handler(struct rethook_node *rh, void *data,
  2142					      unsigned long ret_addr,
  2143					      struct ftrace_regs *fregs)
  2144	{
  2145		struct kretprobe *rp = (struct kretprobe *)data;
> 2146		struct pt_regs *regs = ftrace_get_regs(fregs);
  2147		struct kretprobe_instance *ri;
  2148		struct kprobe_ctlblk *kcb;
  2149	
  2150		/* This is bug because this depends on HAVE_PT_REGS_COMPAT_FTRACE_REGS */
  2151		if (WARN_ON_ONCE(!regs))
  2152			return;
  2153	
  2154		/* The data must NOT be null. This means rethook data structure is broken. */
  2155		if (WARN_ON_ONCE(!data) || !rp->handler)
  2156			return;
  2157	
  2158		__this_cpu_write(current_kprobe, &rp->kp);
  2159		kcb = get_kprobe_ctlblk();
  2160		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
  2161	
  2162		ri = container_of(rh, struct kretprobe_instance, node);
  2163		rp->handler(ri, regs);
  2164	
  2165		__this_cpu_write(current_kprobe, NULL);
  2166	}
  2167	NOKPROBE_SYMBOL(kretprobe_rethook_handler);
  2168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
