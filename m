Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5573F54C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532663; cv=none; b=ukufjI/qDzhP9Ca53w/bId7mamJ9aFyZoAb1BtGNmUHIcjAL3m1Wnv+0IY/W07/5FoP2X7VsJr7M7tM5E57Qu+hpJVMXPTD9sDRdQ1yCpxCdwfh3oxE1QYWGdr1oTrjPJCy9RqWlWvl0vABI8D2FC84NJjkqOuHXjIjViocjdxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532663; c=relaxed/simple;
	bh=dDIOVkCX+wFveJ8hpk5AXemH0/ngJY6Mw/8C0GbS2Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bRyUMlQ1HXdIbNouH5JU81ZwvkiwaFUK0CcF+bxemFCjsaAIRZGmdgwRJhm70sTtqHbe6J5BLd39vPQmyr1CXk2cG4ppFYEOFD2uhxabhM7rxPSOMxAHQkMCNuDySwWNkaC4c0nKnUsZThNPQ6GgRSYtrQQ4AOBFoPqouyb1UBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O01fingN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O01fingN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781532663; x=1813068663;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dDIOVkCX+wFveJ8hpk5AXemH0/ngJY6Mw/8C0GbS2Mk=;
  b=O01fingNV5lIg4DgWG7ivymWGZlOmzzh+apRJgkI99G9D8F5E7aCuZhU
   L+qBW+X5WqREbY602k5vdP5ibnPI/MaMoNNyqh/bDJ93AFkpX1hy71jn0
   CCTk2P2kOrO8PD03ZhKG8M+98kZtyKRsmOdvmdldjfkU9AjUKy5wI/VRN
   LjNKQUkEL0DtQbW+wEJZeVnQZAcP8n+9LGpd2O2Dv42iwHHvcd7hG9BtA
   Y3FyyH1m5+rGeAwhnZWN9XBoKO8ThbRKKuuuA7QjzlnrH/cNyxJRReAJt
   a1HEu7xuloGPad8NcgXgNUxacsINfhAPq36kPaDADoTaT98VtNjLQQDID
   Q==;
X-CSE-ConnectionGUID: ho1hO9ScTW2IufKnF/6tRw==
X-CSE-MsgGUID: amSSmys8TyOYrb1Ok5Kerg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82171511"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82171511"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:11:02 -0700
X-CSE-ConnectionGUID: 0XzP/bs3Rp6BdnXFx62YHQ==
X-CSE-MsgGUID: U2a1SAiNS+GxtGipD97lbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="244576865"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2026 07:10:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ81h-00000000RvK-20gt;
	Mon, 15 Jun 2026 14:10:57 +0000
Date: Mon, 15 Jun 2026 22:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>
Subject: arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202606152154.La53Y9wL-lkp@intel.com>
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
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: 818d78ba1b3f88d2bfee249f25020211488a26c3 riscv: signal: abstract he=
ader saving for setup_sigcontext
date:   6 months ago
config: riscv-randconfig-r123-20260615 (https://download.01.org/0day-ci/arc=
hive/20260615/202606152154.La53Y9wL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260615/202606152154.La53Y9wL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 818d78ba1b3f ("riscv: signal: abstract header saving for setup_sig=
context")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606152154.La53Y9wL-lkp@i=
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
