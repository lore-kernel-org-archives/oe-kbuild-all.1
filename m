Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A273EDE54
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 22:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845406; cv=none; b=bCpAZYNw9gyzn2mvI1N+DsoVx7difPk5MULLwRjPf2l1dmgxQdhGFnZt3hVmqlBc8FflG+PuOp+ImYMYiA5oJbsrfgyy+ljQVtiCJio43yf3wYcXctVt9YpVx/moLJ87lzzbqCFc4Ah/DmIfSKZlkbL/pSro33mCig09BnqeQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845406; c=relaxed/simple;
	bh=vSgNmDRo80dikFqWhK3E4B1I9POZcE0Eddyflo9RSyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I+yQQY7n0p6ptVrXgm0RK+GVSiHgMaClnffjbA7DhocBJHgUEFNZPfI65FnSZ6UC/cEGgUjmf5LT9RXUIA63F33ha55VEqpa45lfOukpDjucf2osyNGvNa9orTtauq5bCpvIhmz8cxXbPNw1ZnlnsHlXdOjNr6WVdgSLrBzf3Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjrperqn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjrperqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784845402; x=1816381402;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vSgNmDRo80dikFqWhK3E4B1I9POZcE0Eddyflo9RSyA=;
  b=hjrperqn4udmclyUolAQJkcQl4ktkhJSn48lnyl6gPU5H5KGcujGHiD8
   fHR2JaJcpHcjfGLamh/huW3m+fZLlRMeE3g4qHIDShCN8AHXjLHO0j6HA
   WlDPBkvjGfqEHq6MZ99ofDXX4AJrHIqWI/ej2grZWFPnA0WSqoAlSCSjL
   0CgdsGJ7xnl9j9vCrI4NcF06UiWZUdb3pKM51hv4zAgBTz1BuKGd7ZhRX
   Ph/waCHK/gNVnOZaBUGPqNhjhooTiqBfbWHb5zPauzUdcN3U3nlRBpHux
   uQw7dQ+IAJzmrC8S4JWN/hRbxhRKfNK5ajGltR0Fg24RmA3kxQ6yjhqNo
   w==;
X-CSE-ConnectionGUID: /XamohIPQkaD/SH7uSaAVg==
X-CSE-MsgGUID: z53xVZyPSVO/JXJ5uOY8Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="73054997"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="73054997"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 15:23:17 -0700
X-CSE-ConnectionGUID: f29Vc4yJRCO5Wxx642/mkQ==
X-CSE-MsgGUID: 6tDT6gsjQWSvBIsJtEw8rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="281838647"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jul 2026 15:23:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wn1ov-00000000a8y-1hvg;
	Thu, 23 Jul 2026 22:23:13 +0000
Date: Fri, 24 Jul 2026 06:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>
Subject: arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202607240216.UvhA86WO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 818d78ba1b3f88d2bfee249f25020211488a26c3 riscv: signal: abstract he=
ader saving for setup_sigcontext
date:   7 months ago
config: riscv-randconfig-r131-20260723 (https://download.01.org/0day-ci/arc=
hive/20260724/202607240216.UvhA86WO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260724/202607240216.UvhA86WO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 818d78ba1b3f ("riscv: signal: abstract header saving for setup_sig=
context")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607240216.UvhA86WO-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void [noderef] __user *d=
atap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] _=
_user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void [noderef] __user *d=
atap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] _=
_user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void [noderef] __user *d=
atap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] _=
_user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void [noderef] __user *d=
atap @@     got void * @@
   arch/riscv/kernel/signal.c:133:15: sparse:     expected void [noderef] _=
_user *datap
   arch/riscv/kernel/signal.c:133:15: sparse:     got void *
   arch/riscv/kernel/signal.c:148:22: sparse: sparse: symbol 'arch_ext_list=
' was not declared. Should it be static?
   arch/riscv/kernel/signal.c:155:14: sparse: sparse: symbol 'nr_arch_exts'=
 was not declared. Should it be static?
   arch/riscv/kernel/signal.c:300:39: sparse: sparse: cast removes address =
space '__user' of expression
   arch/riscv/kernel/signal.c:300:36: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct __riscv_ctx_hdr [=
noderef] __user *sc_ext_ptr @@     got void * @@
   arch/riscv/kernel/signal.c:300:36: sparse:     expected struct __riscv_c=
tx_hdr [noderef] __user *sc_ext_ptr
   arch/riscv/kernel/signal.c:300:36: sparse:     got void *

vim +133 arch/riscv/kernel/signal.c

8ee0b41898fa26 Greentime Hu 2023-06-05  107 =20
8ee0b41898fa26 Greentime Hu 2023-06-05  108  /*
8ee0b41898fa26 Greentime Hu 2023-06-05  109   * Restore Vector extension co=
ntext from the user's signal frame. This function
8ee0b41898fa26 Greentime Hu 2023-06-05  110   * assumes a valid extension h=
eader. So magic and size checking must be done by
8ee0b41898fa26 Greentime Hu 2023-06-05  111   * the caller.
8ee0b41898fa26 Greentime Hu 2023-06-05  112   */
8ee0b41898fa26 Greentime Hu 2023-06-05  113  static long __restore_v_state(=
struct pt_regs *regs, void __user *sc_vec)
8ee0b41898fa26 Greentime Hu 2023-06-05  114  {
8ee0b41898fa26 Greentime Hu 2023-06-05  115  	long err;
8ee0b41898fa26 Greentime Hu 2023-06-05  116  	struct __sc_riscv_v_state __u=
ser *state =3D sc_vec;
8ee0b41898fa26 Greentime Hu 2023-06-05  117  	void __user *datap;
8ee0b41898fa26 Greentime Hu 2023-06-05  118 =20
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  119  	/*
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  120  	 * Mark the vstate =
as clean prior performing the actual copy,
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  121  	 * to avoid getting=
 the vstate incorrectly clobbered by the
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  122  	 *  discarded vecto=
r state.
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  123  	 */
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  124  	riscv_v_vstate_set_=
restore(current, regs);
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  125 =20
8ee0b41898fa26 Greentime Hu 2023-06-05  126  	/* Copy everything of __sc_ri=
scv_v_state except datap. */
8ee0b41898fa26 Greentime Hu 2023-06-05  127  	err =3D __copy_from_user(&cur=
rent->thread.vstate, &state->v_state,
8ee0b41898fa26 Greentime Hu 2023-06-05  128  			       offsetof(struct __ri=
scv_v_ext_state, datap));
8ee0b41898fa26 Greentime Hu 2023-06-05  129  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  130  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  131 =20
8ee0b41898fa26 Greentime Hu 2023-06-05  132  	/* Copy the pointer datap its=
elf. */
8ee0b41898fa26 Greentime Hu 2023-06-05 @133  	err =3D __get_user(datap, &st=
ate->v_state.datap);
8ee0b41898fa26 Greentime Hu 2023-06-05  134  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  135  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  136  	/*
8ee0b41898fa26 Greentime Hu 2023-06-05  137  	 * Copy the whole vector cont=
ent from user space datap. Use
8ee0b41898fa26 Greentime Hu 2023-06-05  138  	 * copy_from_user to prevent =
information leak.
8ee0b41898fa26 Greentime Hu 2023-06-05  139  	 */
c27fa53b858b4e Bj=C3=B6rn T=C3=B6pel  2024-04-03  140  	return copy_from_us=
er(current->thread.vstate.datap, datap, riscv_v_vsize);
8ee0b41898fa26 Greentime Hu 2023-06-05  141  }
818d78ba1b3f88 Andy Chiu    2025-11-12  142 =20

:::::: The code at line 133 was first introduced by commit
:::::: 8ee0b41898fa26f66e32237f179b6989c65600d6 riscv: signal: Add sigconte=
xt save/restore for vector

:::::: TO: Greentime Hu <greentime.hu@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
