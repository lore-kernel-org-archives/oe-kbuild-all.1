Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19DA137A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 09:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685266023; x=1716802023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6mhlJqjhqlP4LY6Pvn9jWj1zGbcelYAc4Ee/JyCTqVY=;
  b=A+jeOJ3Syf/FGve729YgVwUUFV1Wubn0aVoHR3oVcQffklKRWPtIwMNV
   j+P2KyapUobD1swAzqYEypDV5aunLYEOw1dR0nXPdVYcm3fu0DcCc2Hae
   hS6SfXHM3PNbOFqtHLabVhHlxt4dmQC5UyyU+jTsfUIyOIiJjtvxty5uj
   7zHxe7JeVpePHnUVenNYotydfnY3x77PpRmj9393TH8RIjw8sEM0KTCUL
   R6XEj3u2AVADSu5D6Hz+E7qnUSHn3t175w6b94x+YBzUuKhuxQWD1oPd4
   /VxxzZ9rrGR1HnCubcGKwzn4+pPNituGD4kl4kxdxSLegwyogtsLioqhz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="353341388"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="353341388"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 02:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="656142962"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="656142962"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 May 2023 02:27:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Cg0-000KWA-10;
	Sun, 28 May 2023 09:27:00 +0000
Date: Sun, 28 May 2023 17:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: arch/riscv/include/asm/syscall.h:87 syscall_handler() warn:
 inconsistent indenting
Message-ID: <202305281715.WnNJQvvE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   416839029e3858f61dc7dd346559c03e74ed8380
commit: f0bddf50586da81360627a772be0e355b62f071e riscv: entry: Convert to generic entry
date:   9 weeks ago
config: riscv-randconfig-m031-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281715.WnNJQvvE-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281715.WnNJQvvE-lkp@intel.com/

smatch warnings:
arch/riscv/include/asm/syscall.h:87 syscall_handler() warn: inconsistent indenting

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
