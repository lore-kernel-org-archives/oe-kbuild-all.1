Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CD237C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 14:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691505983; x=1723041983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QyCWV3QjNzfUnZv2+pg0lwlA/f/GlJHPMfP1AGZDu20=;
  b=NAP/3ZpgiymDKurHMiF/WSXzMtsa9kO5mPe+e6s9n1hPYXfRg5+ZiX/U
   Q6CKllPkUeQk07RawdP1CGQ7fFjpt6KI8FdRXgdU/VkuGtWNZQKnrCbIn
   0P+u0GGssmacCCJqhKZCCynt8JrdxjB6xkbNWTWw7gbqIzJTF4YiCkN88
   y+XaH5E5g+D1fmgjvmsjdlrijUecErSwgq93bgwsSJs/BH1LKPX6IjSIY
   z8WfMsXruQ+6JlNErgTTJddkx1GgDkxD90rKlmNE3BoqGLTlIZlxHa7Zj
   Qcv1kRDhinT56pWNL0WBPN4lcg/goVS160rl/BzVMIfZw20atQ5eBvEYj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457230503"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="457230503"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 07:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="855118140"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="855118140"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Aug 2023 07:46:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTNyB-0005P6-0p;
	Tue, 08 Aug 2023 14:45:59 +0000
Date: Tue, 8 Aug 2023 22:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: arch/riscv/include/asm/syscall.h:87 syscall_handler() warn:
 inconsistent indenting
Message-ID: <202308082206.4tGQS0Nb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   14f9643dc90adea074a0ffb7a17d337eafc6a5cc
commit: f0bddf50586da81360627a772be0e355b62f071e riscv: entry: Convert to generic entry
date:   5 months ago
config: riscv-randconfig-m031-20230808 (https://download.01.org/0day-ci/archive/20230808/202308082206.4tGQS0Nb-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308082206.4tGQS0Nb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308082206.4tGQS0Nb-lkp@intel.com/

New smatch warnings:
arch/riscv/include/asm/syscall.h:87 syscall_handler() warn: inconsistent indenting

Old smatch warnings:
arch/riscv/kernel/traps.c:327 is_valid_bugaddr() warn: unsigned 'pc' is never less than zero.

vim +87 arch/riscv/include/asm/syscall.h

    76	
    77	typedef long (*syscall_t)(ulong, ulong, ulong, ulong, ulong, ulong, ulong);
    78	static inline void syscall_handler(struct pt_regs *regs, ulong syscall)
    79	{
    80		syscall_t fn;
    81	
    82	#ifdef CONFIG_COMPAT
    83		if ((regs->status & SR_UXL) == SR_UXL_32)
    84			fn = compat_sys_call_table[syscall];
    85		else
    86	#endif
  > 87			fn = sys_call_table[syscall];
    88	
    89		regs->a0 = fn(regs->orig_a0, regs->a1, regs->a2,
    90			      regs->a3, regs->a4, regs->a5, regs->a6);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
