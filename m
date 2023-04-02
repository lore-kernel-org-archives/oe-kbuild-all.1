Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AABB17CF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Apr 2023 02:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680401509; x=1711937509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TSRXxY1GK7cARfaf3QRa+0+lK0W9nr+gk2a1wVlK1MM=;
  b=T6unSz0eWarMzZbLdFbc2yFjD0bnlJjtaaeOlUmfypg3OA5VUKZ0qrkN
   YI6f2Y5a2v0MJt/pgHfwzz0tu4S2QPCZYIspG6OL0Lb47sdT4bXYveduD
   LAoRyPPZI4FQUpV6bBMydynJ7yeUtSaxaawumbojPv9U9cDBD/i/wockW
   mGvi6bv8zAy6FJxALgesdYEc3FFn2/5VzWfxpDU6iXwM2B3szcbNMrF/I
   eoEEH8KuvxfKiLx4JYLdQ6hFL45X5gdW3CZLDjBQ3keHxlOlkJsYeY9pO
   ltxj0ug+p8F3hpy26rg5Ze1D8Sd+uVM+CLzovNZGYxxyd9z2n+mg+5nD0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="343380746"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="343380746"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 19:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="750087025"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="750087025"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Apr 2023 19:11:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pinC5-000NAv-2V;
	Sun, 02 Apr 2023 02:11:45 +0000
Date: Sun, 2 Apr 2023 10:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: [linux-next:master 5598/8375] arch/riscv/include/asm/syscall.h:87
 syscall_handler() warn: inconsistent indenting
Message-ID: <202304021048.J6a5T08T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5
commit: f0bddf50586da81360627a772be0e355b62f071e [5598/8375] riscv: entry: Convert to generic entry
config: riscv-randconfig-m031-20230402 (https://download.01.org/0day-ci/archive/20230402/202304021048.J6a5T08T-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304021048.J6a5T08T-lkp@intel.com/

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
https://github.com/intel/lkp-tests
