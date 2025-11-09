Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F534D3B3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Nov 2025 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762690911; cv=none; b=f4acc0cTRLDQ2Gfhbksfg2PhUmcoguhAgpb1eO23r+//xwkNrpmkgOSn7bS5/hw+T/T4XxlM7C3wvcAO9r8/zNxZvSktjac7hLUxmvw4xYx/95aktg2G1wQp7LROUgGlSMRBZiwEpQ0/QAZQUL0AryQal9STVQLipYt2HUF2n6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762690911; c=relaxed/simple;
	bh=Oh82QHsajy24bpTs0Ebf2tJuTtxU1crHA/w0gk89OaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dveEo+hZZeXWmAcMfV7fmoGo8UoxbWWxDBgWy62k3ta1wx5XffctsgXeO52OXULvb6yChRLunhwmJoWGaN3ViidhCEUZL+xDOvtV5i6cZT63lft782x1nrQKs8yrjRmrr81fIdQOa5azebjuWQLsDr2513mls6NWrElYhcHN3/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dH46Tglg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dH46Tglg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762690910; x=1794226910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oh82QHsajy24bpTs0Ebf2tJuTtxU1crHA/w0gk89OaQ=;
  b=dH46TglgUgnzphdcGZUlJVknPPb9armlkU69R6+u27/sZ1jo3UeYt0NF
   aqkd2JNYUF6wRKHDQm9FRgqzZTqxYiapR4OSU4TjXe+5FD3r6jfzQ05YW
   JCh3PEYTTVCtdK3xONPPCl8X+mX91fM9a6sKkGiCSNgLS4xFLtSeD51jM
   8R0e6zBqrSRvXmFK+vrGkpGeQF8JgtRgk7rrdt2bEbBw0reYBXpn0M5n9
   qpik1ctDQTo2ewx6nx2RziNrXp18S2ZfHP2cAk2TOMah2SRHFYn22js+n
   6MonFeEorf9xCU10ChBWjC/bKMu+BH0TF3ymc632nHL0QetCs4h4UT8yR
   Q==;
X-CSE-ConnectionGUID: m5SbISOHQPymv+tibQeinw==
X-CSE-MsgGUID: TV5vx+9UQ0CunC4dgSwCxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="64679878"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="64679878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 04:21:49 -0800
X-CSE-ConnectionGUID: LCDBbT5+T4WaBp2vbZEifA==
X-CSE-MsgGUID: OfxmXkVpSnayGjQaz/3wUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="225703496"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2025 04:21:42 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI4QN-0001zP-2I;
	Sun, 09 Nov 2025 12:21:39 +0000
Date: Sun, 9 Nov 2025 20:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: Xie Yuanbin <qq570070308@gmail.com>, david@redhat.com,
	tglx@linutronix.de, segher@kernel.crashing.org, riel@surriel.com,
	peterz@infradead.org, linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com, paulmck@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
	andreas@gaisler.com, luto@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/4] Make enter_lazy_tlb inline on x86
Message-ID: <202511091959.kfmo9kPB-lkp@intel.com>
References: <20251108172346.263590-2-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251108172346.263590-2-qq570070308@gmail.com>

Hi Xie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/x86/core tip/x86/mm s390/features perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master v6.18-rc4 next-20251107]
[cannot apply to acme/perf/core tip/timers/nohz]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xie-Yuanbin/Make-enter_lazy_tlb-inline-on-x86/20251109-013003
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251108172346.263590-2-qq570070308%40gmail.com
patch subject: [PATCH v2 1/4] Make enter_lazy_tlb inline on x86
config: i386-randconfig-014-20251109 (https://download.01.org/0day-ci/archive/20251109/202511091959.kfmo9kPB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511091959.kfmo9kPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511091959.kfmo9kPB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:108,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from arch/x86/kvm/vmx/vmx.c:17:
   arch/x86/include/asm/mmu_context.h: In function 'enter_lazy_tlb':
   arch/x86/include/asm/mmu_context.h:155:27: error: 'cpu_tlbstate' undeclared (first use in this function); did you mean 'cpuhp_state'?
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |                           ^~~~~~~~~~~~
   include/linux/compiler.h:244:47: note: in definition of macro 'TYPEOF_UNQUAL'
     244 | # define TYPEOF_UNQUAL(exp) __typeof_unqual__(exp)
         |                                               ^~~
   include/linux/percpu-defs.h:499:41: note: in expansion of macro '__pcpu_size_call_return'
     499 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:155:13: note: in expansion of macro 'this_cpu_read'
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |             ^~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:155:27: note: each undeclared identifier is reported only once for each function it appears in
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |                           ^~~~~~~~~~~~
   include/linux/compiler.h:244:47: note: in definition of macro 'TYPEOF_UNQUAL'
     244 | # define TYPEOF_UNQUAL(exp) __typeof_unqual__(exp)
         |                                               ^~~
   include/linux/percpu-defs.h:499:41: note: in expansion of macro '__pcpu_size_call_return'
     499 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:155:13: note: in expansion of macro 'this_cpu_read'
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |             ^~~~~~~~~~~~~
   In file included from arch/x86/kvm/vmx/vmx.c:46:
>> arch/x86/include/asm/mmu_context.h:155:51: warning: comparison between pointer and integer
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |                                                   ^~
   In file included from include/asm-generic/percpu.h:7,
                    from arch/x86/include/asm/percpu.h:597,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7:
   arch/x86/include/asm/mmu_context.h:158:24: error: 'cpu_tlbstate_shared' undeclared (first use in this function)
     158 |         this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
         |                        ^~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:158:9: note: in expansion of macro 'this_cpu_write'
     158 |         this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
         |         ^~~~~~~~~~~~~~


vim +155 arch/x86/include/asm/mmu_context.h

   138	
   139	/*
   140	 * Please ignore the name of this function.  It should be called
   141	 * switch_to_kernel_thread().
   142	 *
   143	 * enter_lazy_tlb() is a hint from the scheduler that we are entering a
   144	 * kernel thread or other context without an mm.  Acceptable implementations
   145	 * include doing nothing whatsoever, switching to init_mm, or various clever
   146	 * lazy tricks to try to minimize TLB flushes.
   147	 *
   148	 * The scheduler reserves the right to call enter_lazy_tlb() several times
   149	 * in a row.  It will notify us that we're going back to a real mm by
   150	 * calling switch_mm_irqs_off().
   151	 */
   152	#define enter_lazy_tlb enter_lazy_tlb
   153	static __always_inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
   154	{
 > 155		if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
   156			return;
   157	
   158		this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
