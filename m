Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF73132C65
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 20:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iS+zvRsD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699477072; x=1731013072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sFuQhkRTFxzouI9towUa5BcbqRgdZsPFNsdzzLsLf4s=;
  b=iS+zvRsDIjn7DIconDqzPDC5dLUj0wZdLtJzaeksrD1JVgYFypWSd+JO
   wFMngBu1fSpaZpsGlbUQZ32ysNWJ3kXZMKnWTQSQEGOK6TjIrsHQcMbG0
   +DezMaO5wQFu5QmTgGZFJxyNSiXmB4soenaXd8uXwxAorfvMN4F+Vsy1y
   2RAZup0mEzTvQZAlnkNhpAp/6uv94mRdBNr+JYMsXrhvIk1qu8qMc9RuD
   rmUAmwx+nEvfeJ1rNMxNbhNlW6IhNrpKASyzPfHUceDdi+MG0g62mDztv
   TaZzX2ZfCC4eRqPpnvjv0t5F4JZ5A7T4pXgJeCS23WFtKllsRuMA53cLq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="11413039"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="11413039"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 12:57:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1010402383"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="1010402383"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Nov 2023 12:57:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0pcR-0008BU-2v;
	Wed, 08 Nov 2023 20:57:47 +0000
Date: Thu, 9 Nov 2023 04:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 3/3] arch/x86/events/core.c:2880:13: error:
 implicit declaration of function 'perf_callchain_user32'; did you mean
 'perf_callchain_store'?
Message-ID: <202311090431.3MPzdWqW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   31b014690f119ab819b20786a567f66715bce1a4
commit: 31b014690f119ab819b20786a567f66715bce1a4 [3/3] todo
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231109/202311090431.3MPzdWqW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311090431.3MPzdWqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311090431.3MPzdWqW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/events/core.c:2854:6: warning: no previous prototype for '__perf_callchain_user' [-Wmissing-prototypes]
    2854 | void __perf_callchain_user(struct perf_callchain_entry_ctx *ctx,
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/core.c: In function '__perf_callchain_user':
>> arch/x86/events/core.c:2880:13: error: implicit declaration of function 'perf_callchain_user32'; did you mean 'perf_callchain_store'? [-Werror=implicit-function-declaration]
    2880 |             perf_callchain_user32(regs, ctx);
         |             ^~~~~~~~~~~~~~~~~~~~~
         |             perf_callchain_store
   arch/x86/events/core.c: At top level:
   arch/x86/events/core.c:2896:1: warning: no previous prototype for 'perf_callchain_user' [-Wmissing-prototypes]
    2896 | perf_callchain_user(struct perf_callchain_entry_ctx *ctx, struct pt_regs *regs)
         | ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2880 arch/x86/events/core.c

  2853	
  2854	void __perf_callchain_user(struct perf_callchain_entry_ctx *ctx,
  2855				   struct pt_regs *regs, bool atomic)
  2856	{
  2857		struct user_unwind_state state;
  2858	
  2859		if (perf_guest_state()) {
  2860			/* TODO: We don't support guest os callchain now */
  2861			return;
  2862		}
  2863	
  2864		/*
  2865		 * We don't know what to do with VM86 stacks.. ignore them for now.
  2866		 */
  2867		if (regs->flags & (X86_VM_MASK | PERF_EFLAGS_VM))
  2868			return;
  2869	
  2870		perf_callchain_store_context(ctx, PERF_CONTEXT_USER);
  2871		perf_callchain_store(ctx, regs->ip);
  2872	
  2873		if (atomic && !nmi_uaccess_okay())
  2874			return;
  2875	
  2876		if (atomic)
  2877			pagefault_disable();
  2878	
  2879		if (!user_64bit_mode(regs)) {
> 2880		    perf_callchain_user32(regs, ctx);
  2881		    goto done;
  2882		}
  2883	
  2884		for_each_user_frame(state, USER_UNWIND_TYPE_AUTO) {
  2885			if (perf_callchain_store(ctx, state.ip)) {
  2886				goto done;
  2887			}
  2888		}
  2889	done:
  2890		if (atomic)
  2891			pagefault_enable();
  2892	}
  2893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
