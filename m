Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C18631A07B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 22:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774132456; cv=none; b=EJLKiGMDqDyTe6eVx4e+jJIryOIsIU88LvbFKD/raul5w7hhltcZo9XXxa0Vb3m/+6Q/2uXck0DaY8rNU5mRHFlRdDjsr7s6/ld1HHDJAJ0mvY4QnoKc0yFBqenz8SNnSdPgr5lPv6UM+rYFC9lxvYSqDaBPKO3tZMhiCuy++i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774132456; c=relaxed/simple;
	bh=Udt6WWl8ebdi5A5qaEVcw9KETUlpILVmL80yd/xP/uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvECR+vL9Rn+j/I8FqMW38AOA9wZIe0VXzd9s6Z00KJ3a84479JkOL/KYVBcQkG6xbWVS+G+4TH2NCNcntgV+W56wjvmOT1xgpwAn7vlPSjWR3hunJWWhifG7zH7Wy1Xxd/KPNhKilaHWfnG1YCW+d9BVClHcRZdu0Mc7UTjFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8a8qnry; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8a8qnry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774132455; x=1805668455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Udt6WWl8ebdi5A5qaEVcw9KETUlpILVmL80yd/xP/uc=;
  b=W8a8qnryBe0bz3JzgpTs2rgFakxouIHdsAPqTSRnRZrGI7YFEtpsbxQP
   Kaf9fmXK8ugZIxc45EeFkbKxkH36zBg0F3JXmQZZ/B2qIK33QpXy5UkAb
   q78YQI+R9C6WhUTl6h2dWVlyxrgGJhIIejDhNYwXZlwuwCVRRg1URqIOw
   OkrtSywj8kpPIwbxqA+RALMy9V+G4vBAQFHtxh6tg7DDz5hsyA0DaW7FA
   j6Q4s91MkfzG3gZRzpmlKTrbsWzvqqsuE6CuozNzGi3GilLU8eKiHlLWZ
   kNt6SvpEw7atFWuPLjmPVFmMm+8I0iYeIjLejkgM7I5NLjLvOH3ODvr4Y
   A==;
X-CSE-ConnectionGUID: VDOX78M6TeiAaOft29Zd5g==
X-CSE-MsgGUID: ZSq/EFunQHOPdkOzFXCdGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75066008"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="75066008"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 15:34:14 -0700
X-CSE-ConnectionGUID: pSAuPprtQ36fYb0IRyLtWg==
X-CSE-MsgGUID: 1Yc1P1L/SRy0dFeGY3+LEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="227747036"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2026 15:34:12 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w44tU-000000001KX-3oUx;
	Sat, 21 Mar 2026 22:34:08 +0000
Date: Sun, 22 Mar 2026 06:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Simplify access_ok()
Message-ID: <202603220648.5ZKgsQIu-lkp@intel.com>
References: <56dd1a892279fade2292b7eef7a52112901ae2fd.1773770778.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56dd1a892279fade2292b7eef7a52112901ae2fd.1773770778.git.chleroy@kernel.org>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0-rc3]
[cannot apply to powerpc/next powerpc/fixes v7.0-rc4 linus/master next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy-CS-GROUP/powerpc-Simplify-access_ok/20260318-080252
base:   v7.0-rc3
patch link:    https://lore.kernel.org/r/56dd1a892279fade2292b7eef7a52112901ae2fd.1773770778.git.chleroy%40kernel.org
patch subject: [PATCH] powerpc: Simplify access_ok()
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260322/202603220648.5ZKgsQIu-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603220648.5ZKgsQIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603220648.5ZKgsQIu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:13:
   arch/powerpc/include/asm/uaccess.h: In function '__access_ok':
>> arch/powerpc/include/asm/uaccess.h:42:77: error: expected ';' before ')' token
      42 |                         return size <= TASK_SIZE && addr <= TASK_SIZE - size);
         |                                                                             ^
         |                                                                             ;
>> arch/powerpc/include/asm/uaccess.h:41:17: warning: this 'else' clause does not guard... [-Wmisleading-indentation]
      41 |                 else
         |                 ^~~~
   arch/powerpc/include/asm/uaccess.h:42:77: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'else'
      42 |                         return size <= TASK_SIZE && addr <= TASK_SIZE - size);
         |                                                                             ^
>> arch/powerpc/include/asm/uaccess.h:42:77: error: expected statement before ')' token
   make[3]: *** [scripts/Makefile.build:184: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +42 arch/powerpc/include/asm/uaccess.h

    21	
    22	/*
    23	 * On powerpc64, TASK_SIZE_MAX is 0x0010000000000000 then even if both ptr and size
    24	 * are TASK_SIZE_MAX we are still inside the memory gap. So make it simple.
    25	 */
    26	static __always_inline int __access_ok(const void __user *ptr, unsigned long size)
    27	{
    28		unsigned long addr = (unsigned long)ptr;
    29	
    30		if (IS_ENABLED(CONFIG_PPC64)) {
    31			BUILD_BUG_ON(!is_power_of_2(TASK_SIZE_MAX));
    32			BUILD_BUG_ON(TASK_SIZE_MAX > 0x0010000000000000);
    33	
    34			if (__builtin_constant_p(size))
    35				return size <= TASK_SIZE_MAX && !(addr & ~(TASK_SIZE_MAX - 1));
    36			else
    37				return !((size | addr) & ~(TASK_SIZE_MAX - 1));
    38		} else {
    39			if (__builtin_constant_p(size) && size < SZ_128K)
    40				return addr < TASK_SIZE;
  > 41			else
  > 42				return size <= TASK_SIZE && addr <= TASK_SIZE - size);
    43		}
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
