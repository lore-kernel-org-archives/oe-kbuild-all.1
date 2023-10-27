Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D81C05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 02:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWy6h0OO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698372117; x=1729908117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9wl1fn5OCDJbFx27deXP8MrBM8vEcaM3WdOsTqdpBHw=;
  b=gWy6h0OOX0AMPZ/nhgV/dz+5icoAPXLmagrGkG6Ao4/o7dWjfxn3rGgw
   +Ay0syT2BINFtES40U2+vVTdCOXZc9AkRzpEEIg1hVUa15ft8m7UUQxOj
   PEezELBcVro5RBXcHvVHurnOnuOyjtadT2zfM7cmpvizN/AIYNcDSH2GG
   u11oIMilT6V2v1D9Cy16G9aKlH3sfHywsEqmZUHaeuThHID4ZoHD2xpYO
   WEb+h+IDUCiSN2zn+inSE5zKl3OclpiCjWLa3lr6OZrthW49l+PbhxnP0
   Eth4ai3baBK4bGMf/HTpqLts/OMOaOSrljODkpZLImKRiwJEWSuVhheUc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="378058716"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="378058716"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 19:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="829818439"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="829818439"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2023 19:01:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwCAa-000AKN-29;
	Fri, 27 Oct 2023 02:01:52 +0000
Date: Fri, 27 Oct 2023 10:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Nadav Amit <namit@vmware.com>
Subject: [tip:x86/percpu 21/22] arch/x86/include/asm/processor.h:522:24:
 sparse: sparse: dereference of noderef expression
Message-ID: <202310270909.QBAOkiZP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   0548eb067ed664b93043e033295ca71e3e706245
commit: ed2f752e0e0a21d941ca0ee539ef3d4cd576bc5e [21/22] x86/percpu: Introduce const-qualified const_pcpu_hot to micro-optimize code generation
config: x86_64-randconfig-122-20231027 (https://download.01.org/0day-ci/archive/20231027/202310270909.QBAOkiZP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270909.QBAOkiZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270909.QBAOkiZP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
>> arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
>> arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
>> arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
>> arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
>> arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression

vim +522 arch/x86/include/asm/processor.h

   513	
   514	static __always_inline unsigned long current_top_of_stack(void)
   515	{
   516		/*
   517		 *  We can't read directly from tss.sp0: sp0 on x86_32 is special in
   518		 *  and around vm86 mode and sp0 on x86_64 is special because of the
   519		 *  entry trampoline.
   520		 */
   521		if (IS_ENABLED(CONFIG_USE_X86_SEG_SUPPORT))
 > 522			return pcpu_hot.top_of_stack;
   523	
   524		return this_cpu_read_stable(pcpu_hot.top_of_stack);
   525	}
   526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
