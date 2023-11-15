Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B803EA62
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 22:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4dziSf9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700087382; x=1731623382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EiC7gsbr7b2lX/ptHSJXPvI6xefRfK//8GO+TYZnEmw=;
  b=J4dziSf9tGrdXH8X8lgNJugU9ILH0rSKmcrWy26aU7KrGovRXKJ8SRHH
   FwfyG4hOIB6u4GfYA6AmqPiPjEz9I24VuN7Pr69C8BsUenFmAM5/sZ7Hk
   BwivoAeMLouv2vwzTq+oFGTr5HJCzmvZoXwVtwQL58gsUfxoqWRI8LBF7
   JNDn5DSTWza4YI0wumnZ7Y7kVGXd9pvUFUKNosMeHtGihCswcEZILot+A
   8jCsxEQRkPUNi00atA7K2O3Py8ZMjaToA0CpbQuCxm+5vrxK5elCJ7K5T
   TE8Q7B9SZEMfRZausKZVtmOUb1U//x8IH6F3exgRoD2q/4i1H1/zR1wLv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370326107"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="370326107"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 14:29:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="888717426"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="888717426"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Nov 2023 14:29:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3OO7-0000uq-2b;
	Wed, 15 Nov 2023 22:29:35 +0000
Date: Thu, 16 Nov 2023 06:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: arch/riscv/kernel/traps_misaligned.c:249:21: sparse: sparse:
 dereference of noderef expression
Message-ID: <202311160606.obGOOwB3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 7c83232161f609bbc452a1255f823f41afc411dd riscv: add support for misaligned trap handling in S-mode
date:   2 weeks ago
config: riscv-randconfig-r122-20231115 (https://download.01.org/0day-ci/archive/20231116/202311160606.obGOOwB3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160606.obGOOwB3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160606.obGOOwB3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> arch/riscv/kernel/traps_misaligned.c:249:21: sparse: sparse: dereference of noderef expression
   arch/riscv/kernel/traps_misaligned.c:261:21: sparse: sparse: dereference of noderef expression
   arch/riscv/kernel/traps_misaligned.c:269:21: sparse: sparse: dereference of noderef expression
>> arch/riscv/kernel/traps_misaligned.c:210:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char const [noderef] __user *__gu_ptr @@     got unsigned char const [usertype] *addr @@
   arch/riscv/kernel/traps_misaligned.c:210:24: sparse:     expected unsigned char const [noderef] __user *__gu_ptr
   arch/riscv/kernel/traps_misaligned.c:210:24: sparse:     got unsigned char const [usertype] *addr
>> arch/riscv/kernel/traps_misaligned.c:249:21: sparse: sparse: dereference of noderef expression
   arch/riscv/kernel/traps_misaligned.c:261:21: sparse: sparse: dereference of noderef expression
   arch/riscv/kernel/traps_misaligned.c:269:21: sparse: sparse: dereference of noderef expression
>> arch/riscv/kernel/traps_misaligned.c:220:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [noderef] __user *__gu_ptr @@     got unsigned char [usertype] *addr @@
   arch/riscv/kernel/traps_misaligned.c:220:24: sparse:     expected unsigned char [noderef] __user *__gu_ptr
   arch/riscv/kernel/traps_misaligned.c:220:24: sparse:     got unsigned char [usertype] *addr

vim +249 arch/riscv/kernel/traps_misaligned.c

   172	
   173	static inline int get_insn(struct pt_regs *regs, ulong mepc, ulong *r_insn)
   174	{
   175		register ulong __mepc asm ("a2") = mepc;
   176		ulong val, rvc_mask = 3, tmp;
   177	
   178		asm ("and %[tmp], %[addr], 2\n"
   179			"bnez %[tmp], 1f\n"
   180	#if defined(CONFIG_64BIT)
   181			__stringify(LWU) " %[insn], (%[addr])\n"
   182	#else
   183			__stringify(LW) " %[insn], (%[addr])\n"
   184	#endif
   185			"and %[tmp], %[insn], %[rvc_mask]\n"
   186			"beq %[tmp], %[rvc_mask], 2f\n"
   187			"sll %[insn], %[insn], %[xlen_minus_16]\n"
   188			"srl %[insn], %[insn], %[xlen_minus_16]\n"
   189			"j 2f\n"
   190			"1:\n"
   191			"lhu %[insn], (%[addr])\n"
   192			"and %[tmp], %[insn], %[rvc_mask]\n"
   193			"bne %[tmp], %[rvc_mask], 2f\n"
   194			"lhu %[tmp], 2(%[addr])\n"
   195			"sll %[tmp], %[tmp], 16\n"
   196			"add %[insn], %[insn], %[tmp]\n"
   197			"2:"
   198		: [insn] "=&r" (val), [tmp] "=&r" (tmp)
   199		: [addr] "r" (__mepc), [rvc_mask] "r" (rvc_mask),
   200		  [xlen_minus_16] "i" (XLEN_MINUS_16));
   201	
   202		*r_insn = val;
   203	
   204		return 0;
   205	}
   206	#else
   207	static inline int load_u8(struct pt_regs *regs, const u8 *addr, u8 *r_val)
   208	{
   209		if (user_mode(regs)) {
 > 210			return __get_user(*r_val, addr);
   211		} else {
   212			*r_val = *addr;
   213			return 0;
   214		}
   215	}
   216	
   217	static inline int store_u8(struct pt_regs *regs, u8 *addr, u8 val)
   218	{
   219		if (user_mode(regs)) {
 > 220			return __put_user(val, addr);
   221		} else {
   222			*addr = val;
   223			return 0;
   224		}
   225	}
   226	
   227	#define __read_insn(regs, insn, insn_addr)		\
   228	({							\
   229		int __ret;					\
   230								\
   231		if (user_mode(regs)) {				\
   232			__ret = __get_user(insn, insn_addr);	\
   233		} else {					\
   234			insn = *insn_addr;			\
   235			__ret = 0;				\
   236		}						\
   237								\
   238		__ret;						\
   239	})
   240	
   241	static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
   242	{
   243		ulong insn = 0;
   244	
   245		if (epc & 0x2) {
   246			ulong tmp = 0;
   247			u16 __user *insn_addr = (u16 __user *)epc;
   248	
 > 249			if (__read_insn(regs, insn, insn_addr))
   250				return -EFAULT;
   251			/* __get_user() uses regular "lw" which sign extend the loaded
   252			 * value make sure to clear higher order bits in case we "or" it
   253			 * below with the upper 16 bits half.
   254			 */
   255			insn &= GENMASK(15, 0);
   256			if ((insn & __INSN_LENGTH_MASK) != __INSN_LENGTH_32) {
   257				*r_insn = insn;
   258				return 0;
   259			}
   260			insn_addr++;
   261			if (__read_insn(regs, tmp, insn_addr))
   262				return -EFAULT;
   263			*r_insn = (tmp << 16) | insn;
   264	
   265			return 0;
   266		} else {
   267			u32 __user *insn_addr = (u32 __user *)epc;
   268	
   269			if (__read_insn(regs, insn, insn_addr))
   270				return -EFAULT;
   271			if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) {
   272				*r_insn = insn;
   273				return 0;
   274			}
   275			insn &= GENMASK(15, 0);
   276			*r_insn = insn;
   277	
   278			return 0;
   279		}
   280	}
   281	#endif
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
