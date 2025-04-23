Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072120B80E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745386310; cv=none; b=pHFHSAPac2rKOA9rKU+yQriP/RAnvFLB69MchcSyDqL+PfAWlrd4eWP0yASRMkZW4FXmto5vFWhtu699OqDQeArKtJ6OigfXkJuoHw8K8/oFzsisT1ST+G3Y9qfncm7iO+1FjL2BMjmcJq81LFxUB4Q5MeCeRHmBBdOkQiSBuvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745386310; c=relaxed/simple;
	bh=FrHdBAJIcIePwaK6NqhsNvRk48eflaDwTBb2jnboi90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHytarlzUdHhxdsLdWIHAbY6JHr58xioaCLswHA6uDNN2pPmScwU3NQAcTkZDvv8Dki1lxZRad79zdgF0P0Hso5ll40HXj8AAMLuGui4T8ueJW3xVMcMFReNQ64wMNQrBsZsCoRmio5NgZHe73wJP0mfagUmK76nbJp6/erdipU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCJvJWZg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCJvJWZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745386309; x=1776922309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FrHdBAJIcIePwaK6NqhsNvRk48eflaDwTBb2jnboi90=;
  b=FCJvJWZg2lE20UNNXXOlnNNtlBpXcyuaORJoUtjksqr+lCA419fQCQej
   snWEU4oGizkNAB3rmWGbbr69tb3H3ZJxglqXfzKyZx/bcu7X8p5SUI6H0
   hQ142hzSM6Nm99zzm2/mNUNjfJIT3cXYIWiwCqQFQNO8McXerhU11bHlE
   huE0NLXhjRZI3K8CPL1aJltAOJctXRaTb9o9sThU3h0H4IUG/BzNBB2J1
   QP7aOyi6MDDHB0WwChwKAmo/txRXZMmbLqIE/m0jxgifzYtLzl/EYLUji
   crZMVgjnzwE6wLx60THz+y4vier874PgCHPA/neVUCy6hLBv4vfkZpPAG
   Q==;
X-CSE-ConnectionGUID: XIyOsoBUQDGp5QlsNvGnrw==
X-CSE-MsgGUID: xvGowA1+SvKvMn+bN4t++w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46664692"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46664692"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 22:31:48 -0700
X-CSE-ConnectionGUID: yVCDLFSeRKWVzmlpPoXCWQ==
X-CSE-MsgGUID: /V03BVM0SwS2a7XULOZvlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="169419970"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2025 22:31:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7Si0-0001cp-1w;
	Wed, 23 Apr 2025 05:31:44 +0000
Date: Wed, 23 Apr 2025 13:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jianlin Lv <iecedge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH  bpf-next 1/2] Enhance BPF execution timing by
 excluding IRQ time
Message-ID: <202504231319.Ruutd2WV-lkp@intel.com>
References: <73fdbbf9aafd3e24e12bb58f89c70959fb3a37f1.1745250534.git.iecedge@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73fdbbf9aafd3e24e12bb58f89c70959fb3a37f1.1745250534.git.iecedge@gmail.com>

Hi Jianlin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianlin-Lv/Enhance-BPF-execution-timing-by-excluding-IRQ-time/20250422-214957
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/73fdbbf9aafd3e24e12bb58f89c70959fb3a37f1.1745250534.git.iecedge%40gmail.com
patch subject: [RFC PATCH  bpf-next 1/2] Enhance BPF execution timing by excluding IRQ time
config: i386-buildonly-randconfig-001-20250423 (https://download.01.org/0day-ci/archive/20250423/202504231319.Ruutd2WV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504231319.Ruutd2WV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504231319.Ruutd2WV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/kallsyms.c:25:
   include/linux/filter.h: In function '__bpf_prog_run':
>> include/linux/filter.h:708:30: warning: unused variable 'cpu' [-Wunused-variable]
     708 |                 unsigned int cpu;
         |                              ^~~
>> include/linux/filter.h:706:60: warning: unused variable 'irq_delta' [-Wunused-variable]
     706 |                 u64 duration, start, start_time, end_time, irq_delta;
         |                                                            ^~~~~~~~~
>> include/linux/filter.h:706:50: warning: unused variable 'end_time' [-Wunused-variable]
     706 |                 u64 duration, start, start_time, end_time, irq_delta;
         |                                                  ^~~~~~~~
>> include/linux/filter.h:706:38: warning: unused variable 'start_time' [-Wunused-variable]
     706 |                 u64 duration, start, start_time, end_time, irq_delta;
         |                                      ^~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


vim +/cpu +708 include/linux/filter.h

   686	
   687	extern struct mutex nf_conn_btf_access_lock;
   688	extern int (*nfct_btf_struct_access)(struct bpf_verifier_log *log,
   689					     const struct bpf_reg_state *reg,
   690					     int off, int size);
   691	
   692	typedef unsigned int (*bpf_dispatcher_fn)(const void *ctx,
   693						  const struct bpf_insn *insnsi,
   694						  unsigned int (*bpf_func)(const void *,
   695									   const struct bpf_insn *));
   696	
   697	static __always_inline u32 __bpf_prog_run(const struct bpf_prog *prog,
   698						  const void *ctx,
   699						  bpf_dispatcher_fn dfunc)
   700	{
   701		u32 ret;
   702	
   703		cant_migrate();
   704		if (static_branch_unlikely(&bpf_stats_enabled_key)) {
   705			struct bpf_prog_stats *stats;
 > 706			u64 duration, start, start_time, end_time, irq_delta;
   707			unsigned long flags;
 > 708			unsigned int cpu;
   709	
   710			#ifdef CONFIG_IRQ_TIME_ACCOUNTING
   711			if (in_task()) {
   712				cpu = get_cpu();
   713				put_cpu();
   714				start_time = irq_time_read(cpu);
   715			}
   716			#endif
   717	
   718			start = sched_clock();
   719			ret = dfunc(ctx, prog->insnsi, prog->bpf_func);
   720			duration = sched_clock() - start;
   721	
   722			#ifdef CONFIG_IRQ_TIME_ACCOUNTING
   723			if (in_task()) {
   724				end_time = irq_time_read(cpu);
   725				if (end_time > start_time) {
   726					irq_delta = end_time - start_time;
   727					duration -= irq_delta;
   728				}
   729			}
   730			#endif
   731	
   732			stats = this_cpu_ptr(prog->stats);
   733			flags = u64_stats_update_begin_irqsave(&stats->syncp);
   734			u64_stats_inc(&stats->cnt);
   735			u64_stats_add(&stats->nsecs, duration);
   736			u64_stats_update_end_irqrestore(&stats->syncp, flags);
   737		} else {
   738			ret = dfunc(ctx, prog->insnsi, prog->bpf_func);
   739		}
   740		return ret;
   741	}
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
