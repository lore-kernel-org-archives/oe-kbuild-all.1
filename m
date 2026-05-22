Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543BC3A4521
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 05:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779429570; cv=none; b=ay6lDf0zGJEel2W0HJ7gU/NbfsbuuTxV9YeEnHFJupxWQrVNHJV8WHVxXBt3jBvN1iYB4y9GxKI8tlqyyXOoNpdhuTauQjkXrc6FACl1pbhy51n8qFbRZyU0jeB8dmqzRLAeY7Z7jYIh5j1rr843oPyKNmDymY/kmi4ay3n0oG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779429570; c=relaxed/simple;
	bh=qWCFAGIUCLqQmXoxQrRdtVuCCULvRbv6XdLWDUO/hwQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=doP9Qbug60oZLnOIkWbkMgZBbDEoYiQBHL6UeT1G3Nk7ve9lb6Gl1YuyRc7kbb1lSzdE8SvruwD06J/ydM2ORvJTm1PtL3AWTA+q8zE12wkWJQF2YB22KMx4Fa0wH32+UwW6FzoynIhRcj4kbHNMyCQ2XuooCBcausZGjSqRiS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWgFcX+I; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWgFcX+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779429569; x=1810965569;
  h=date:from:to:cc:subject:message-id;
  bh=qWCFAGIUCLqQmXoxQrRdtVuCCULvRbv6XdLWDUO/hwQ=;
  b=TWgFcX+IL1J6w50pIUeIBZ8n7xV8obZUuGzyCnclJEbdVziyouueDJwU
   MJZiSKzgU7E+pkNRdKJNQQqcnDDvsXNwM4Y4TbKWMxSy6tj9W5o3AowUi
   mCYpH0EyhDMq4JlgWmsBm9CFFQAb5j31wZgG7RNSYSG5jTZSoqre9TrFQ
   FeZ0Zx3OenPDlsG0KJXFt48Ah1gMKBQDfWZM7cmQHas5usiDuG/qIUgEw
   Zzt4K+CPes1C9oFOybtcNYWrp4TzkorFsD+7U7J4wA+jIPdtNWCepHFh5
   ygZ7xYodDlCZooh3gLhWxPsivhcFAMUu/gAXX1HHQwYJ3Qh/miKYGGE1K
   w==;
X-CSE-ConnectionGUID: IvBkmkZqTWGs6Qr8GMoyWw==
X-CSE-MsgGUID: 1zeA6/QgRBuK5kXSox3tLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="103034007"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="103034007"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 22:59:28 -0700
X-CSE-ConnectionGUID: jJspGpa/QqCPwUkOhSuHuQ==
X-CSE-MsgGUID: 32hZB+9RSmeUyfhp0VlPSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="245806732"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 May 2026 22:59:27 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQIup-000000001pf-3LzT;
	Fri, 22 May 2026 05:59:23 +0000
Date: Fri, 22 May 2026 13:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 482/1197]
 arch/arm64/kernel/ptrace.c:2250:12: warning: 'compat_ptrace_write_user'
 defined but not used
Message-ID: <202605221357.YujWkP3D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: a93fa733361823e6b689f707d4ae3d0a3d591b0a [482/1197] [CHERRY-PICK] arm64: ptrace: Preserve capability in tls_set()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260522/202605221357.YujWkP3D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221357.YujWkP3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221357.YujWkP3D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from include/linux/audit.h:13,
                    from arch/arm64/kernel/ptrace.c:11:
   include/linux/uaccess.h:1078:9: warning: 'get_user_ptr' redefined
    1078 | #define get_user_ptr(x,y) __get_user(x,y)
         |         ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:13:
   arch/arm64/include/asm/uaccess.h:470:9: note: this is the location of the previous definition
     470 | #define get_user_ptr    __get_user_ptr
         |         ^~~~~~~~~~~~
   include/linux/uaccess.h:1079:9: warning: 'put_user_ptr' redefined
    1079 | #define put_user_ptr(x,y) __put_user(x,y)
         |         ^~~~~~~~~~~~
   arch/arm64/include/asm/uaccess.h:479:9: note: this is the location of the previous definition
     479 | #define put_user_ptr    __put_user_ptr
         |         ^~~~~~~~~~~~
>> arch/arm64/kernel/ptrace.c:2250:12: warning: 'compat_ptrace_write_user' defined but not used [-Wunused-function]
    2250 | static int compat_ptrace_write_user(struct task_struct *tsk, compat_ulong_t off,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/ptrace.c:2226:12: warning: 'compat_ptrace_read_user' defined but not used [-Wunused-function]
    2226 | static int compat_ptrace_read_user(struct task_struct *tsk, compat_ulong_t off,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/ptrace.c:2221:38: warning: 'user_aarch32_ptrace_view' defined but not used [-Wunused-const-variable=]
    2221 | static const struct user_regset_view user_aarch32_ptrace_view = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/ptrace.c:2163:38: warning: 'user_aarch32_view' defined but not used [-Wunused-const-variable=]
    2163 | static const struct user_regset_view user_aarch32_view = {
         |                                      ^~~~~~~~~~~~~~~~~


vim +/compat_ptrace_write_user +2250 arch/arm64/kernel/ptrace.c

478fcb2cdb2351 Will Deacon     2012-03-05  2162  
478fcb2cdb2351 Will Deacon     2012-03-05 @2163  static const struct user_regset_view user_aarch32_view = {
478fcb2cdb2351 Will Deacon     2012-03-05  2164  	.name = "aarch32", .e_machine = EM_ARM,
478fcb2cdb2351 Will Deacon     2012-03-05  2165  	.regsets = aarch32_regsets, .n = ARRAY_SIZE(aarch32_regsets)
478fcb2cdb2351 Will Deacon     2012-03-05  2166  };
478fcb2cdb2351 Will Deacon     2012-03-05  2167  
5d220ff9420f8b Catalin Marinas 2015-07-14  2168  static const struct user_regset aarch32_ptrace_regsets[] = {
5d220ff9420f8b Catalin Marinas 2015-07-14  2169  	[REGSET_GPR] = {
87b0d081dc9811 Dave Martin     2025-07-01  2170  		USER_REGSET_NOTE_TYPE(PRSTATUS),
5d220ff9420f8b Catalin Marinas 2015-07-14  2171  		.n = COMPAT_ELF_NGREG,
5d220ff9420f8b Catalin Marinas 2015-07-14  2172  		.size = sizeof(compat_elf_greg_t),
5d220ff9420f8b Catalin Marinas 2015-07-14  2173  		.align = sizeof(compat_elf_greg_t),
759de58f28b1cd Al Viro         2020-05-27  2174  		.regset_get = compat_gpr_get,
5d220ff9420f8b Catalin Marinas 2015-07-14  2175  		.set = compat_gpr_set
5d220ff9420f8b Catalin Marinas 2015-07-14  2176  	},
5d220ff9420f8b Catalin Marinas 2015-07-14  2177  	[REGSET_FPR] = {
87b0d081dc9811 Dave Martin     2025-07-01  2178  		USER_REGSET_NOTE_TYPE(ARM_VFP),
5d220ff9420f8b Catalin Marinas 2015-07-14  2179  		.n = VFP_STATE_SIZE / sizeof(compat_ulong_t),
5d220ff9420f8b Catalin Marinas 2015-07-14  2180  		.size = sizeof(compat_ulong_t),
5d220ff9420f8b Catalin Marinas 2015-07-14  2181  		.align = sizeof(compat_ulong_t),
759de58f28b1cd Al Viro         2020-05-27  2182  		.regset_get = compat_vfp_get,
5d220ff9420f8b Catalin Marinas 2015-07-14  2183  		.set = compat_vfp_set
5d220ff9420f8b Catalin Marinas 2015-07-14  2184  	},
5d220ff9420f8b Catalin Marinas 2015-07-14  2185  	[REGSET_TLS] = {
87b0d081dc9811 Dave Martin     2025-07-01  2186  		USER_REGSET_NOTE_TYPE(ARM_TLS),
5d220ff9420f8b Catalin Marinas 2015-07-14  2187  		.n = 1,
5d220ff9420f8b Catalin Marinas 2015-07-14  2188  		.size = sizeof(compat_ulong_t),
5d220ff9420f8b Catalin Marinas 2015-07-14  2189  		.align = sizeof(compat_ulong_t),
759de58f28b1cd Al Viro         2020-05-27  2190  		.regset_get = compat_tls_get,
5d220ff9420f8b Catalin Marinas 2015-07-14  2191  		.set = compat_tls_set,
5d220ff9420f8b Catalin Marinas 2015-07-14  2192  	},
5d220ff9420f8b Catalin Marinas 2015-07-14  2193  #ifdef CONFIG_HAVE_HW_BREAKPOINT
5d220ff9420f8b Catalin Marinas 2015-07-14  2194  	[REGSET_HW_BREAK] = {
87b0d081dc9811 Dave Martin     2025-07-01  2195  		USER_REGSET_NOTE_TYPE(ARM_HW_BREAK),
5d220ff9420f8b Catalin Marinas 2015-07-14  2196  		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
5d220ff9420f8b Catalin Marinas 2015-07-14  2197  		.size = sizeof(u32),
5d220ff9420f8b Catalin Marinas 2015-07-14  2198  		.align = sizeof(u32),
759de58f28b1cd Al Viro         2020-05-27  2199  		.regset_get = hw_break_get,
5d220ff9420f8b Catalin Marinas 2015-07-14  2200  		.set = hw_break_set,
5d220ff9420f8b Catalin Marinas 2015-07-14  2201  	},
5d220ff9420f8b Catalin Marinas 2015-07-14  2202  	[REGSET_HW_WATCH] = {
87b0d081dc9811 Dave Martin     2025-07-01  2203  		USER_REGSET_NOTE_TYPE(ARM_HW_WATCH),
5d220ff9420f8b Catalin Marinas 2015-07-14  2204  		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
5d220ff9420f8b Catalin Marinas 2015-07-14  2205  		.size = sizeof(u32),
5d220ff9420f8b Catalin Marinas 2015-07-14  2206  		.align = sizeof(u32),
759de58f28b1cd Al Viro         2020-05-27  2207  		.regset_get = hw_break_get,
5d220ff9420f8b Catalin Marinas 2015-07-14  2208  		.set = hw_break_set,
5d220ff9420f8b Catalin Marinas 2015-07-14  2209  	},
5d220ff9420f8b Catalin Marinas 2015-07-14  2210  #endif
5d220ff9420f8b Catalin Marinas 2015-07-14  2211  	[REGSET_SYSTEM_CALL] = {
87b0d081dc9811 Dave Martin     2025-07-01  2212  		USER_REGSET_NOTE_TYPE(ARM_SYSTEM_CALL),
5d220ff9420f8b Catalin Marinas 2015-07-14  2213  		.n = 1,
5d220ff9420f8b Catalin Marinas 2015-07-14  2214  		.size = sizeof(int),
5d220ff9420f8b Catalin Marinas 2015-07-14  2215  		.align = sizeof(int),
759de58f28b1cd Al Viro         2020-05-27  2216  		.regset_get = system_call_get,
5d220ff9420f8b Catalin Marinas 2015-07-14  2217  		.set = system_call_set,
5d220ff9420f8b Catalin Marinas 2015-07-14  2218  	},
5d220ff9420f8b Catalin Marinas 2015-07-14  2219  };
5d220ff9420f8b Catalin Marinas 2015-07-14  2220  
5d220ff9420f8b Catalin Marinas 2015-07-14 @2221  static const struct user_regset_view user_aarch32_ptrace_view = {
5d220ff9420f8b Catalin Marinas 2015-07-14  2222  	.name = "aarch32", .e_machine = EM_ARM,
5d220ff9420f8b Catalin Marinas 2015-07-14  2223  	.regsets = aarch32_ptrace_regsets, .n = ARRAY_SIZE(aarch32_ptrace_regsets)
5d220ff9420f8b Catalin Marinas 2015-07-14  2224  };
5d220ff9420f8b Catalin Marinas 2015-07-14  2225  
478fcb2cdb2351 Will Deacon     2012-03-05 @2226  static int compat_ptrace_read_user(struct task_struct *tsk, compat_ulong_t off,
478fcb2cdb2351 Will Deacon     2012-03-05  2227  				   compat_ulong_t __user *ret)
478fcb2cdb2351 Will Deacon     2012-03-05  2228  {
478fcb2cdb2351 Will Deacon     2012-03-05  2229  	compat_ulong_t tmp;
478fcb2cdb2351 Will Deacon     2012-03-05  2230  
478fcb2cdb2351 Will Deacon     2012-03-05  2231  	if (off & 3)
478fcb2cdb2351 Will Deacon     2012-03-05  2232  		return -EIO;
478fcb2cdb2351 Will Deacon     2012-03-05  2233  
7606c37d4a447e Catalin Marinas 2012-10-10  2234  	if (off == COMPAT_PT_TEXT_ADDR)
478fcb2cdb2351 Will Deacon     2012-03-05  2235  		tmp = tsk->mm->start_code;
7606c37d4a447e Catalin Marinas 2012-10-10  2236  	else if (off == COMPAT_PT_DATA_ADDR)
478fcb2cdb2351 Will Deacon     2012-03-05  2237  		tmp = tsk->mm->start_data;
7606c37d4a447e Catalin Marinas 2012-10-10  2238  	else if (off == COMPAT_PT_TEXT_END_ADDR)
478fcb2cdb2351 Will Deacon     2012-03-05  2239  		tmp = tsk->mm->end_code;
478fcb2cdb2351 Will Deacon     2012-03-05  2240  	else if (off < sizeof(compat_elf_gregset_t))
b44f384074d09d Al Viro         2020-05-15  2241  		tmp = compat_get_user_reg(tsk, off >> 2);
478fcb2cdb2351 Will Deacon     2012-03-05  2242  	else if (off >= COMPAT_USER_SZ)
478fcb2cdb2351 Will Deacon     2012-03-05  2243  		return -EIO;
478fcb2cdb2351 Will Deacon     2012-03-05  2244  	else
478fcb2cdb2351 Will Deacon     2012-03-05  2245  		tmp = 0;
478fcb2cdb2351 Will Deacon     2012-03-05  2246  
478fcb2cdb2351 Will Deacon     2012-03-05  2247  	return put_user(tmp, ret);
478fcb2cdb2351 Will Deacon     2012-03-05  2248  }
478fcb2cdb2351 Will Deacon     2012-03-05  2249  
478fcb2cdb2351 Will Deacon     2012-03-05 @2250  static int compat_ptrace_write_user(struct task_struct *tsk, compat_ulong_t off,
478fcb2cdb2351 Will Deacon     2012-03-05  2251  				    compat_ulong_t val)
478fcb2cdb2351 Will Deacon     2012-03-05  2252  {
d547175b54fa81 Al Viro         2020-06-06  2253  	struct pt_regs newregs = *task_pt_regs(tsk);
d547175b54fa81 Al Viro         2020-06-06  2254  	unsigned int idx = off / 4;
478fcb2cdb2351 Will Deacon     2012-03-05  2255  
478fcb2cdb2351 Will Deacon     2012-03-05  2256  	if (off & 3 || off >= COMPAT_USER_SZ)
478fcb2cdb2351 Will Deacon     2012-03-05  2257  		return -EIO;
478fcb2cdb2351 Will Deacon     2012-03-05  2258  
478fcb2cdb2351 Will Deacon     2012-03-05  2259  	if (off >= sizeof(compat_elf_gregset_t))
478fcb2cdb2351 Will Deacon     2012-03-05  2260  		return 0;
478fcb2cdb2351 Will Deacon     2012-03-05  2261  
d547175b54fa81 Al Viro         2020-06-06  2262  	switch (idx) {
d547175b54fa81 Al Viro         2020-06-06  2263  	case 15:
d547175b54fa81 Al Viro         2020-06-06  2264  		newregs.pc = val;
d547175b54fa81 Al Viro         2020-06-06  2265  		break;
d547175b54fa81 Al Viro         2020-06-06  2266  	case 16:
d547175b54fa81 Al Viro         2020-06-06  2267  		newregs.pstate = compat_psr_to_pstate(val);
d547175b54fa81 Al Viro         2020-06-06  2268  		break;
d547175b54fa81 Al Viro         2020-06-06  2269  	case 17:
d547175b54fa81 Al Viro         2020-06-06  2270  		newregs.orig_x0 = val;
d547175b54fa81 Al Viro         2020-06-06  2271  		break;
d547175b54fa81 Al Viro         2020-06-06  2272  	default:
d547175b54fa81 Al Viro         2020-06-06  2273  		newregs.regs[idx] = val;
d547175b54fa81 Al Viro         2020-06-06  2274  	}
d547175b54fa81 Al Viro         2020-06-06  2275  
d547175b54fa81 Al Viro         2020-06-06  2276  	if (!valid_user_regs(&newregs.user_regs, tsk))
d547175b54fa81 Al Viro         2020-06-06  2277  		return -EINVAL;
c168870704bcde Will Deacon     2014-06-02  2278  
d547175b54fa81 Al Viro         2020-06-06  2279  	*task_pt_regs(tsk) = newregs;
d547175b54fa81 Al Viro         2020-06-06  2280  	return 0;
478fcb2cdb2351 Will Deacon     2012-03-05  2281  }
478fcb2cdb2351 Will Deacon     2012-03-05  2282  

:::::: The code at line 2250 was first introduced by commit
:::::: 478fcb2cdb2351dcfc3fb23f42d76f4436ee4149 arm64: Debugging support

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
