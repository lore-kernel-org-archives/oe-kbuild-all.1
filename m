Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E63C37DEAE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205787; cv=none; b=GaWN0C4iEgZU1bf4WAu0y6CMYeYY70NSjTnFiRhefily/iuDY1RiAbw5wRBhSnJJzThnFjzdObcP1nv/uMkEzZjHRXpM1Konc7AVYSYPhDTyWJ1gqfDQQDrz9NNj0RmCKZAMAAo7oUzlK39Gt3PmQ3x1a7XLo6woKyJVRhGagR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205787; c=relaxed/simple;
	bh=Xh0EgZQZBe+P+f3oFHONEFv5OnD6NShqkt2nwRuRRfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g8HNZGNUTUFJdtwjvvFm+WbuYmbbfkCRf7AVMJJNe4UfK0xSwHZtIKCZHPWPpUIv9rIbgLBFeCaGE0lcoOcdtSRRKHPMp8DoYlmFNCF30MJ5AqW6k1NAE2P3yhrA2aNz3f0CW65ExfThRDmmmC/H49YFwhYfXkbHpCmLAl1q7PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdIS9mx9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdIS9mx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205785; x=1806741785;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Xh0EgZQZBe+P+f3oFHONEFv5OnD6NShqkt2nwRuRRfI=;
  b=kdIS9mx9TXDEFWu0FEZMfX9vVDY9/DbcB25LvU8FXsQiVIMe3cnSxvt1
   n0rx2I5t8JulQF2Pwf4z6YJC2IwMzJIgeonpDVRuGd3O9NXAsPPOJZAP8
   TZeQw2QpNYS3StwoG4zKlrKWQkvidHEKlmXLhiE7P4R3gagfArp0NIO4y
   cxyUGUzO/4G8tMvQb7LEJwL5v4+RjPJAQu5uA5PJJJqBgrbChe1rf7t1K
   ErjQmpOgY/R1hc+LVwze9f9bR7bBEy0L3C7wvQnFH1UJwQloUttr82qvN
   Fk46o/zoPocrn4E+2rGHNl8tVh4WYk2ZmdqiCh6I9vLBBzih2zPRpxhG6
   w==;
X-CSE-ConnectionGUID: agghUCIlQKipUfW05DSL2w==
X-CSE-MsgGUID: 2OXNBAa1Q4uO1xd+iBTZBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311908"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311908"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:59 -0700
X-CSE-ConnectionGUID: uiPxbso0Ti6yE/WZ0qZpYg==
X-CSE-MsgGUID: kwlq+Jy3TqawIQ3LPet2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286610"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013r-2ZBC;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>
Subject: arch/riscv/kernel/signal.c:133:15: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202604030009.T0N2kopM-lkp@intel.com>
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
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: 818d78ba1b3f88d2bfee249f25020211488a26c3 riscv: signal: abstract he=
ader saving for setup_sigcontext
date:   3 months ago
config: riscv-randconfig-r131-20260402 (https://download.01.org/0day-ci/arc=
hive/20260403/202604030009.T0N2kopM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260403/202604030009.T0N2kopM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 818d78ba1b3f ("riscv: signal: abstract header saving for setup_sig=
context")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030009.T0N2kopM-lkp@i=
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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
