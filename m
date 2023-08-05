Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFCD1FA0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 18:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691258937; x=1722794937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3k30z60D6fayYhHFuac8dXSMyUoOB4Sp/06IH8tyUSY=;
  b=eqAoKqWNM4GlsNQW7bvcXabDWcHxkHJR0dUy/M3fW99E7uzTDQXPZsii
   iz8pegXWaVaLsZYWEYz2vMrmEAsNG50zIlMD0nXJTG6andzVDYicwyX/O
   RMyPUbiEC4kD9KQyQFtIGk41DtCo3x9h3pE6dkl/6Rvg7idOAaLL0uYlx
   eHoAEoepuD66MZXluF+tptFnlb7vRh4LwtxIyVnNDxvk33za4w+YOmitr
   3bJXudF8v7wRs2qNrKYOey0031pQFCaZAYXuIagbxGUu7WVD0pSb7a9iC
   4IlJIPBR1L6cfwyH7NKPBgY3iU9cMDhorPTWM4pgzMJuSXCLuUCdETWUC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="349920740"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="349920740"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 11:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="854158161"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="854158161"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Aug 2023 11:08:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSLhk-0003op-2p;
	Sat, 05 Aug 2023 18:08:44 +0000
Date: Sun, 6 Aug 2023 02:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] ftrace: Add ftrace_partial_regs() for converting
 ftrace_regs to pt_regs
Message-ID: <202308060110.eb8bH6SE-lkp@intel.com>
References: <169124751584.186149.17291016280237570755.stgit@devnote2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169124751584.186149.17291016280237570755.stgit@devnote2>

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
patch link:    https://lore.kernel.org/r/169124751584.186149.17291016280237570755.stgit%40devnote2
patch subject: [RFC PATCH 4/5] ftrace: Add ftrace_partial_regs() for converting ftrace_regs to pt_regs
config: arm64-randconfig-r034-20230805 (https://download.01.org/0day-ci/archive/20230806/202308060110.eb8bH6SE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308060110.eb8bH6SE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308060110.eb8bH6SE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ftrace.h:23,
                    from arch/arm64/kernel/asm-offsets.c:12:
   arch/arm64/include/asm/ftrace.h: In function 'ftrace_partial_regs':
>> arch/arm64/include/asm/ftrace.h:146:13: error: 'struct pt_regs' has no member named 'x'
     146 |         regs->x[29] = fregs->fp;
         |             ^~
   arch/arm64/include/asm/ftrace.h:147:13: error: 'struct pt_regs' has no member named 'x'
     147 |         regs->x[30] = fregs->lr;
         |             ^~
   make[3]: *** [scripts/Makefile.build:116: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=1275155403
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2 shuffle=1275155403
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1275155403
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1275155403
   make: Target 'prepare' not remade because of errors.


vim +146 arch/arm64/include/asm/ftrace.h

   139	
   140	static __always_inline struct pt_regs *
   141	ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
   142	{
   143		memcpy(regs->regs, fregs->regs, sizeof(u64) * 10);
   144		regs->sp = fregs->sp;
   145		regs->pc = fregs->pc;
 > 146		regs->x[29] = fregs->fp;
   147		regs->x[30] = fregs->lr;
   148		return regs;
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
