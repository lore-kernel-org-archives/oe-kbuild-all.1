Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B1A126BF7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 01:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768009711; cv=none; b=mtkrWxCJj1qD6j3eUtQ4klT5ItlGWG+5My8FOhJ8PsUxZ8O22Lq/SwAWIHoEAQxrSc8ztfFy/THWtHV5r+YG/Y4DZIvdqvAR3ZzcNbtKK8NWuSwl0wbFYIKbvHhHfFtyDGJLRrBe+JeJp8g+WN3pECA2fWKH0yU/YIMXL2DIaok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768009711; c=relaxed/simple;
	bh=qFnr0C9gtL862WKzYVgSLAKPMLhqrnRtmyzSRc9N29c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5vmXzCHehal+op2iGbm6Uj28LpNKV0maTRhoiIE99zrppW5QMcvH2FpCHOqN+lz+nNTqao31u8YGttYlirL1JsBKF97D+nUS1ukdnAwQ3UosZKNfzniuZNSIbHagPzlw8IKppo7+vmaf2Z7mnVHwPOiV4EZTa+Xl2x803l/pV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtDkENJs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtDkENJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768009710; x=1799545710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qFnr0C9gtL862WKzYVgSLAKPMLhqrnRtmyzSRc9N29c=;
  b=DtDkENJs5h3XQl+SkqQ8QxOQOuHv1+DLBvRhoHIDA+Qvp7g5aEz96cXe
   L27rg12xsDJ9Le4GRtWfYJ320/P2RYwVDsIZNue791H+GXPRbzdugbJgE
   6zcZyJ+vQI+4eGjCAL+YDOXWRMtaZUFQ7+mVjMKua+EE5CQ3ya/+Z+BXm
   BxNuy9HwxK8OCG2wJ+6DoZ/raQthBUAIvLkpPKmYA5IEO6obYOnyJ7FE+
   Tz/CTB1D8ig3+xTPhODSdxx4Ahs3T5+zF2P8ms3XnjMBz/XGMCoo/DHa5
   gmnG7h7Iqba+UCTMO5nHSpKNOTMihuYRl1A13oU/LAMt/2Ue3Um+xPQKS
   w==;
X-CSE-ConnectionGUID: DBsgz6cjSxOIi6GrN6Wo3Q==
X-CSE-MsgGUID: GKGaSfduQSaBEONXVXtJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="86809085"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="86809085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 17:48:30 -0800
X-CSE-ConnectionGUID: F9LxQyk1QkO+w/hJefHfjg==
X-CSE-MsgGUID: yKGVr1hLSiuBZhe+CXpLQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203682449"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2026 17:48:29 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veO5a-000000002Bk-2x71;
	Sat, 10 Jan 2026 01:48:26 +0000
Date: Sat, 10 Jan 2026 02:47:58 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv2 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <202601100207.HOsQ6xNP-lkp@intel.com>
References: <20260109093454.389295-1-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109093454.389295-1-jolsa@kernel.org>

Hi Jiri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/selftests-bpf-Add-test-for-bpf_override_return-helper/20260109-174224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260109093454.389295-1-jolsa%40kernel.org
patch subject: [PATCHv2 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after bpf_prog_run
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260110/202601100207.HOsQ6xNP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100207.HOsQ6xNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100207.HOsQ6xNP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./include/linux/ftrace.h:115,
                    from arch/riscv/kernel/asm-offsets.c:11:
   ./include/linux/ftrace_regs.h: In function 'ftrace_partial_regs_update':
>> ./include/linux/ftrace_regs.h:57:45: warning: passing argument 1 of 'ftrace_regs_set_instruction_pointer' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      57 |         ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
         |                                             ^~~~~
   In file included from ./include/linux/ftrace.h:23:
   ./arch/riscv/include/asm/ftrace.h:164:85: note: expected 'struct ftrace_regs *' but argument is of type 'const struct ftrace_regs *'
     164 | static __always_inline void ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs,
         |                                                                 ~~~~~~~~~~~~~~~~~~~~^~~~~
>> ./include/linux/ftrace_regs.h:58:38: warning: passing argument 1 of 'ftrace_regs_set_return_value' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      58 |         ftrace_regs_set_return_value(fregs, regs_return_value(regs));
         |                                      ^~~~~
   ./arch/riscv/include/asm/ftrace.h:198:78: note: expected 'struct ftrace_regs *' but argument is of type 'const struct ftrace_regs *'
     198 | static __always_inline void ftrace_regs_set_return_value(struct ftrace_regs *fregs,
         |                                                          ~~~~~~~~~~~~~~~~~~~~^~~~~


vim +57 ./include/linux/ftrace_regs.h

    40	
    41	/*
    42	 * ftrace_partial_regs_update - update the original ftrace_regs from regs
    43	 * @fregs: The ftrace_regs to update from @regs
    44	 * @regs: The partial regs from ftrace_partial_regs() that was updated
    45	 *
    46	 * Some architectures have the partial regs living in the ftrace_regs
    47	 * structure, whereas other architectures need to make a different copy
    48	 * of the @regs. If a partial @regs is retrieved by ftrace_partial_regs() and
    49	 * if the code using @regs updates a field (like the instruction pointer or
    50	 * stack pointer) it may need to propagate that change to the original @fregs
    51	 * it retrieved the partial @regs from. Use this function to guarantee that
    52	 * update happens.
    53	 */
    54	static __always_inline void
    55	ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs)
    56	{
  > 57		ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
  > 58		ftrace_regs_set_return_value(fregs, regs_return_value(regs));
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
