Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424F215AC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 02:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAy7edVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701399513; x=1732935513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wdvBZ8su6BzCH0pvDOFCAEL64MObSJT6YQ27J5lu+I8=;
  b=HAy7edVwKDnhHKvRl62l+3HoifACToErLe1fuul/2V5x8tStmoLFpsqR
   jjpuoVe8CB5ZOsk9IIB71HsuCaQQW5LzR7TCABi59Yon7RE3l4Ddt8gKz
   stQI7UbP7Oi887hI0SdnO0C5jrdzgo/sQbiZdu3nQ24yeT6T/3N8AXmQr
   B04sNm8aNUbVWqbBSJ33nmFHMFUfbQsP2UG0fblrtyBK55eZCgfRHOtya
   dsI0F0q/RY/ET5dPoIPwf0OwPUd0qb4V6UKjz4o/tzkNMJdrkcnxB8xJU
   Zo+dDlV8c9BEWWwwe2yvsg29fOwa/rXMaM4h+T6WmVWiFIaM/pxfT7hup
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="378460397"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="378460397"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 18:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="803904341"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="803904341"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Nov 2023 18:58:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8tjZ-000300-0U;
	Fri, 01 Dec 2023 02:58:29 +0000
Date: Fri, 1 Dec 2023 10:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 5/10] arch/x86/events/core.c:2856:6: sparse:
 sparse: symbol '__perf_callchain_user' was not declared. Should it be
 static?
Message-ID: <202312011047.XIJZ7Hn0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   ec004e900e02c9c85cf8c89d4c26d4168a6c5d18
commit: f19cd074272c3fd160c2d637cc0f65cfffad1e81 [5/10] perf/x86: Add HAVE_PERF_CALLCHAIN_DEFERRED
config: x86_64-randconfig-121-20231111 (https://download.01.org/0day-ci/archive/20231201/202312011047.XIJZ7Hn0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312011047.XIJZ7Hn0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312011047.XIJZ7Hn0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/events/core.c:2856:6: sparse: sparse: symbol '__perf_callchain_user' was not declared. Should it be static?
   arch/x86/events/core.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +/__perf_callchain_user +2856 arch/x86/events/core.c

  2855	
> 2856	void __perf_callchain_user(struct perf_callchain_entry_ctx *entry,
  2857				   struct pt_regs *regs, bool atomic)
  2858	{
  2859		struct stack_frame frame;
  2860		const struct stack_frame __user *fp;
  2861	
  2862		if (perf_guest_state()) {
  2863			/* TODO: We don't support guest os callchain now */
  2864			return;
  2865		}
  2866	
  2867		/*
  2868		 * We don't know what to do with VM86 stacks.. ignore them for now.
  2869		 */
  2870		if (regs->flags & (X86_VM_MASK | PERF_EFLAGS_VM))
  2871			return;
  2872	
  2873		fp = (void __user *)regs->bp;
  2874	
  2875		perf_callchain_store(entry, regs->ip);
  2876	
  2877		if (atomic && !nmi_uaccess_okay())
  2878			return;
  2879	
  2880		if (atomic)
  2881			pagefault_disable();
  2882	
  2883		if (__perf_callchain_user32(regs, entry))
  2884			goto done;
  2885	
  2886		while (entry->nr < entry->max_stack) {
  2887			if (!valid_user_frame(fp, sizeof(frame)))
  2888				break;
  2889	
  2890			if (__get_user(frame.next_frame, &fp->next_frame))
  2891				break;
  2892			if (__get_user(frame.return_address, &fp->return_address))
  2893				break;
  2894	
  2895			perf_callchain_store(entry, frame.return_address);
  2896			fp = (void __user *)frame.next_frame;
  2897		}
  2898	done:
  2899		if (atomic)
  2900			pagefault_enable();
  2901	}
  2902	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
