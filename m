Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F8938A73F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 19:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770665283; cv=none; b=Aq/5F2Qehwycbvi4WBU5jmaHni3a8euqKSAFadaKILBESX9+PLFsJhocF290u3Ixt1C3OWin8Ry0DFGNbjvEQ3htQv5Ia/LpYzrZrcsYnYVtRv4URSAxjLITiA9W5/bnAbD9BHQnB8zU7CVajLCcqkXKPoOoDBUN+Cy9L3/AzBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770665283; c=relaxed/simple;
	bh=Hgr93aPZdGCLGNGDyL4y/gpPEg+5CYDC+qXeG2yDZcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ix/fDTvX8uipRLCT54Ioz8wv+VPeQR84URbhmBpIUbGCpI5WvDauKbKboTFdLIYuRKGUMwObQ7n4DudTAlYIQSbEJvrDT22hM+aEz7s0o+XPTcWI4AQShdUNoSOXWpjF7vFEZMBW1zSLhy648KDUIyMuosEfWpkTGJAxDXuamIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Djve7P05; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Djve7P05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770665283; x=1802201283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hgr93aPZdGCLGNGDyL4y/gpPEg+5CYDC+qXeG2yDZcU=;
  b=Djve7P05fg7MKFgEx1ht0DxFm12A5B2UfO5N1bPGXpVpFD6j7k0tVuev
   1qb8RZh8FbAWK4Gk/zRWUbeDmS78rfECrRYR17KeKs0jrBMBMaKVhrbte
   dAaXOuH/T5uUnsgA39XWYxd9sVhCu9joOQJgxd+u58/T+qzsb17jj8EoE
   /N253kfG0VMgtz6rUW5WfhUfWXTUuSkQnm2NqF0msOn/pLpSmGWWaFnSl
   QdTOiNpfIrl1CTXtC2AgKC5hPaKoq6JQ1MY2AxbV+qsXXov+SOVG/XpyN
   HFjGCEoM54mcg0MIuvkv5aoyW7WcNRhBUY8U8AuJ3WpVOFBeSw7lN3HHi
   A==;
X-CSE-ConnectionGUID: gDbmhRtlQ4mky75RJ0XLpA==
X-CSE-MsgGUID: FhYlA31cSZyEpOpSCpGDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71680973"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71680973"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 11:28:02 -0800
X-CSE-ConnectionGUID: HNEZuK3hS9CDAXistX4mXg==
X-CSE-MsgGUID: DFz/mQDhSSuQ57epLYYVkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216185620"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Feb 2026 11:27:56 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpWvJ-000000000Lx-423u;
	Mon, 09 Feb 2026 19:27:53 +0000
Date: Mon, 9 Feb 2026 20:27:11 +0100
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, pmladek@suse.com,
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com,
	kees@kernel.org, elver@google.com, arnd@arndb.de,
	lirongqing@baidu.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
Message-ID: <202602092033.NAb0Gkva-lkp@intel.com>
References: <20260209095931.2813152-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209095931.2813152-2-ruanjinjie@huawei.com>

Hi Jinjie,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes arm64/for-next/core tip/x86/core next-20260209]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/crash-Exclude-crash-kernel-memory-in-crash-core/20260209-180157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260209095931.2813152-2-ruanjinjie%40huawei.com
patch subject: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260209/202602092033.NAb0Gkva-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092033.NAb0Gkva-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092033.NAb0Gkva-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/crash_core.o: in function `__crash_kexec':
>> kernel/crash_core.c:143:(.text+0xaae): undefined reference to `arch_get_system_nr_ranges'
   riscv64-linux-ld: kernel/crash_core.o: in function `crash_kexec':
>> kernel/crash_core.c:156:(.text+0xaf0): undefined reference to `arch_prepare_elf64_ram_headers'


vim +143 kernel/crash_core.c

e1280f3071f11a Jiri Bohac   2025-06-12  115  
02aff848053381 Baoquan He   2024-01-24  116  /*
02aff848053381 Baoquan He   2024-01-24  117   * No panic_cpu check version of crash_kexec().  This function is called
02aff848053381 Baoquan He   2024-01-24  118   * only when panic_cpu holds the current CPU number; this is the only CPU
02aff848053381 Baoquan He   2024-01-24  119   * which processes crash_kexec routines.
02aff848053381 Baoquan He   2024-01-24  120   */
02aff848053381 Baoquan He   2024-01-24  121  void __noclone __crash_kexec(struct pt_regs *regs)
02aff848053381 Baoquan He   2024-01-24  122  {
02aff848053381 Baoquan He   2024-01-24  123  	/* Take the kexec_lock here to prevent sys_kexec_load
02aff848053381 Baoquan He   2024-01-24  124  	 * running on one cpu from replacing the crash kernel
02aff848053381 Baoquan He   2024-01-24  125  	 * we are using after a panic on a different cpu.
02aff848053381 Baoquan He   2024-01-24  126  	 *
02aff848053381 Baoquan He   2024-01-24  127  	 * If the crash kernel was not located in a fixed area
02aff848053381 Baoquan He   2024-01-24  128  	 * of memory the xchg(&kexec_crash_image) would be
02aff848053381 Baoquan He   2024-01-24  129  	 * sufficient.  But since I reuse the memory...
02aff848053381 Baoquan He   2024-01-24  130  	 */
02aff848053381 Baoquan He   2024-01-24  131  	if (kexec_trylock()) {
02aff848053381 Baoquan He   2024-01-24  132  		if (kexec_crash_image) {
02aff848053381 Baoquan He   2024-01-24  133  			struct pt_regs fixed_regs;
02aff848053381 Baoquan He   2024-01-24  134  
02aff848053381 Baoquan He   2024-01-24  135  			crash_setup_regs(&fixed_regs, regs);
02aff848053381 Baoquan He   2024-01-24  136  			crash_save_vmcoreinfo();
02aff848053381 Baoquan He   2024-01-24  137  			machine_crash_shutdown(&fixed_regs);
e1280f3071f11a Jiri Bohac   2025-06-12  138  			crash_cma_clear_pending_dma();
02aff848053381 Baoquan He   2024-01-24  139  			machine_kexec(kexec_crash_image);
02aff848053381 Baoquan He   2024-01-24  140  		}
02aff848053381 Baoquan He   2024-01-24  141  		kexec_unlock();
02aff848053381 Baoquan He   2024-01-24  142  	}
02aff848053381 Baoquan He   2024-01-24 @143  }
02aff848053381 Baoquan He   2024-01-24  144  STACK_FRAME_NON_STANDARD(__crash_kexec);
02aff848053381 Baoquan He   2024-01-24  145  
02aff848053381 Baoquan He   2024-01-24  146  __bpf_kfunc void crash_kexec(struct pt_regs *regs)
02aff848053381 Baoquan He   2024-01-24  147  {
33effbcaf110a6 Jinchao Wang 2025-08-25  148  	if (panic_try_start()) {
02aff848053381 Baoquan He   2024-01-24  149  		/* This is the 1st CPU which comes here, so go ahead. */
02aff848053381 Baoquan He   2024-01-24  150  		__crash_kexec(regs);
02aff848053381 Baoquan He   2024-01-24  151  
02aff848053381 Baoquan He   2024-01-24  152  		/*
02aff848053381 Baoquan He   2024-01-24  153  		 * Reset panic_cpu to allow another panic()/crash_kexec()
02aff848053381 Baoquan He   2024-01-24  154  		 * call.
02aff848053381 Baoquan He   2024-01-24  155  		 */
33effbcaf110a6 Jinchao Wang 2025-08-25 @156  		panic_reset();
02aff848053381 Baoquan He   2024-01-24  157  	}
02aff848053381 Baoquan He   2024-01-24  158  }
02aff848053381 Baoquan He   2024-01-24  159  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
