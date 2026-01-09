Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC61BF33
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 22:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767996509; cv=none; b=ChK2yHAC0wP0n5Dx44YiWqsLk8yS3eC3hiMM80OXsXN7hbjYzRMRC1iSnz5TEHGkIqE4cZ1cpwE+yz8MMkFvuWtzP2Kv1+r24JJ6qPc7hTN8cXT/M/+2hktaoHknw3PW7jabQlVPeIO+F4OqZOzkqpzejFF+QObY4j+IiXeQ2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767996509; c=relaxed/simple;
	bh=9iM+bV8JMAVzc0y5+cV8nNtb6uoGnSMbRmKPlPodvxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfDEi9Nw8J7272ufbctq7PhYg/5f1+7lXJeNOxgIgQeKIM0wPv8yTkv7GBYpi+CYZopZDsqZHbwPEFkIBbeXX1ChLK1LTzXxEEVMtIyQIkVLlmDPTGHTlBmteDZv7vMHb/ePSQUcb+WZsJGE1/s/CzH8WYtXUoqylfFjD7d71U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzkbK72e; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzkbK72e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767996508; x=1799532508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9iM+bV8JMAVzc0y5+cV8nNtb6uoGnSMbRmKPlPodvxg=;
  b=UzkbK72eyCfXKpuV7Rp/sIFM/cp/k3puMLUMuAIeR/vdXR27zCbpLTW7
   I1RuPSIyyCt6acBUhvh3PLU4JDLsSfH7eSMRv+mlGFav33isKysztkA+p
   7g8J4G/+CPOLSpUaM8A568ir0x1xcbdLY7BV4OkpAdm7Y9F2SeldM9qEF
   wkyDXWW950HLuagt8aESZSjuyvNgz2an4B7yOuGdoKwc0cgTvaR5eFQ4q
   62SGLGV9hL44bcCfHHmaH519yICB/ChkA9z224ijW9q+NYlzUgvJVxluy
   +SrODwTt5FT1TNCOsMNp6H4O3LcB3/l28ZHR/gNp8Npw0esG7CYmdIaU/
   g==;
X-CSE-ConnectionGUID: TxCr+xWVSjKJnskI6jTCWQ==
X-CSE-MsgGUID: 1gHaf1KKSzyNwb/uHay74w==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73226113"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="73226113"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 14:08:28 -0800
X-CSE-ConnectionGUID: 7QWgmnptQ+yNGWB7EGoeVg==
X-CSE-MsgGUID: CbJHL+IvQWaPbXqy1yVToQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203362924"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 Jan 2026 14:08:27 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veKee-0000000028y-2MSP;
	Fri, 09 Jan 2026 22:08:24 +0000
Date: Fri, 9 Jan 2026 23:07:43 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv2 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <202601092301.bUagWzKk-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/selftests-bpf-Add-test-for-bpf_override_return-helper/20260109-174224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260109093454.389295-1-jolsa%40kernel.org
patch subject: [PATCHv2 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after bpf_prog_run
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260109/202601092301.bUagWzKk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601092301.bUagWzKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601092301.bUagWzKk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:13:
   In file included from ./include/linux/ftrace.h:115:
>> ./include/linux/ftrace_regs.h:57:38: error: passing 'const struct ftrace_regs *' to parameter of type 'struct ftrace_regs *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      57 |         ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
         |                                             ^~~~~
   ./arch/arm64/include/asm/ftrace.h:95:57: note: passing argument to parameter 'fregs' here
      95 | ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs,
         |                                                         ^
   In file included from arch/arm64/kernel/asm-offsets.c:13:
   In file included from ./include/linux/ftrace.h:115:
   ./include/linux/ftrace_regs.h:58:31: error: passing 'const struct ftrace_regs *' to parameter of type 'struct ftrace_regs *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      58 |         ftrace_regs_set_return_value(fregs, regs_return_value(regs));
         |                                      ^~~~~
   ./arch/arm64/include/asm/ftrace.h:122:50: note: passing argument to parameter 'fregs' here
     122 | ftrace_regs_set_return_value(struct ftrace_regs *fregs,
         |                                                  ^
   2 errors generated.


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
    58		ftrace_regs_set_return_value(fregs, regs_return_value(regs));
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
