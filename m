Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8A33164B4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 05:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982449; cv=none; b=n4/NFPa/2mGHtS2d8tR+C2XR27mYy2qyxl/EQ7NJwdpQeF6u8ybdqeeLOeqvo0rrKTxeZR8ZNWOmXnlPojruAHoCDD3/S5N8N/q4WuXhgvfhRMZRvrdds0+Rv89eA+lAjk0LZn/lQbT9yP+AuTA6bdTOqzLsnZnAxl08WalcLT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982449; c=relaxed/simple;
	bh=u/JjQb3gVZ/5MWTG8e0LUXXP69yottg3AuoK/fU7++s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U85ATS60xXPnc1Tq8JG9xgrCP4zxb41Y+ijtDD8EfrsXmuFEEx6S5yb5aPSVQpn1FrHQ/Qm2RJxYm1mx31Gbf73b64La93nbn2dr/OP96hyUzqKQhTf/UyRAFGf7S9FKG3EWj3QBBYyHZiGpRIxisOApquOBU4eAzbuDOlfNErg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wh3XLdvM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wh3XLdvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787982447; x=1819518447;
  h=date:from:to:cc:subject:message-id;
  bh=u/JjQb3gVZ/5MWTG8e0LUXXP69yottg3AuoK/fU7++s=;
  b=Wh3XLdvMnCO8IRcWjtD7gXcBjpkfvnFVQ6Mk0CLWztrbAqefaFsM1d94
   DZnRzjDITHQXZ3V9FFgiEryEMbN5ctCpzuFSBTJjxZZYZ9imvychFarrM
   Bimy2vyAkrjYCulf+MkxAovZaFDK7jst9+V+DhJyR4KAQLqrTsaNGMLEd
   4FlO4KgYmR0gemy5X1AeA95sMuMN1NFs9JfaqSaEe+aYKCBXFt329v8wJ
   M6YjQGu6zaPA6fV76bzqiVMk+w1QxXuEYpoMObtxv+dNSyAjQE/46+Qa7
   TrNVhUTUUa0npKDEeyCbzUOO6yPffF3tK/833fkfZE8Aml0kdTNQGf4WF
   w==;
X-CSE-ConnectionGUID: iOOk49izRdKIsjnIEqz3mQ==
X-CSE-MsgGUID: ncIOCBqETi2mv/14jLDmHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="76027304"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="76027304"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 22:47:25 -0700
X-CSE-ConnectionGUID: 52E9eUaGT/G1w4tyEGNxMQ==
X-CSE-MsgGUID: Kkl1CBCIR++VqhKuGBlMnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="271857671"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 28 Aug 2026 22:47:24 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0BuT-000000001Jt-1QaZ;
	Sat, 29 Aug 2026 05:47:21 +0000
Date: Sat, 29 Aug 2026 07:46:50 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
 Lyude Paul <lyude@redhat.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [tglx-devel:irqflags 2/20] rust/helpers/interrupt.c:7:2:
 error: call to undeclared function 'local_interrupt_disable'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202608290725.a5kydlkP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   59394501f5a285ef270931207a67d2f129403151
commit: 80deadb1a815addda89fa7d485109a13b4a851a7 [2/20] Revert: irq,spin_lock: Add counted interrupt disabling/enabling
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260829/202608290725.a5kydlkP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290725.a5kydlkP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608290725.a5kydlkP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:69:
>> rust/helpers/interrupt.c:7:2: error: call to undeclared function 'local_interrupt_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
       7 |         local_interrupt_disable();
         |         ^
>> rust/helpers/interrupt.c:12:2: error: call to undeclared function 'local_interrupt_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      12 |         local_interrupt_enable();
         |         ^
   In file included from rust/helpers/helpers.c:97:
>> rust/helpers/spinlock.c:42:2: error: call to undeclared function 'spin_lock_irq_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      42 |         spin_lock_irq_disable(lock);
         |         ^
   rust/helpers/spinlock.c:42:2: note: did you mean 'arch_local_irq_disable'?
   arch/x86/include/asm/irqflags.h:112:29: note: 'arch_local_irq_disable' declared here
     112 | static __always_inline void arch_local_irq_disable(void)
         |                             ^
   In file included from rust/helpers/helpers.c:97:
>> rust/helpers/spinlock.c:47:2: error: call to undeclared function 'spin_unlock_irq_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      47 |         spin_unlock_irq_enable(lock);
         |         ^
   rust/helpers/spinlock.c:47:2: note: did you mean 'spin_unlock_irqrestore'?
   include/linux/spinlock.h:405:29: note: 'spin_unlock_irqrestore' declared here
     405 | static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
         |                             ^
   In file included from rust/helpers/helpers.c:97:
>> rust/helpers/spinlock.c:52:9: error: call to undeclared function 'spin_trylock_irq_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      52 |         return spin_trylock_irq_disable(lock);
         |                ^
   rust/helpers/spinlock.c:52:9: note: did you mean '_spin_trylock_irqsave'?
   include/linux/spinlock.h:423:29: note: '_spin_trylock_irqsave' declared here
     423 | static __always_inline bool _spin_trylock_irqsave(spinlock_t *lock, unsigned long *flags)
         |                             ^
   5 errors generated.
--
>> rust/helpers/interrupt.c:7:2: error: call to undeclared function 'local_interrupt_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/interrupt.c:12:2: error: call to undeclared function 'local_interrupt_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.c:42:2: error: call to undeclared function 'spin_lock_irq_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.c:47:2: error: call to undeclared function 'spin_unlock_irq_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.c:52:9: error: call to undeclared function 'spin_trylock_irq_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> Unable to generate bindings: clang diagnosed error: rust/helpers/interrupt.c:7:2: error: call to undeclared function 'local_interrupt_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/interrupt.c:12:2: error: call to undeclared function 'local_interrupt_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.c:42:2: error: call to undeclared function 'spin_lock_irq_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.c:47:2: error: call to undeclared function 'spin_unlock_irq_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.c:52:9: error: call to undeclared function 'spin_trylock_irq_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]


vim +/local_interrupt_disable +7 rust/helpers/interrupt.c

c1f0451ec748f7 Lyude Paul 2026-08-07   4  
c1f0451ec748f7 Lyude Paul 2026-08-07   5  __rust_helper void rust_helper_local_interrupt_disable(void)
c1f0451ec748f7 Lyude Paul 2026-08-07   6  {
c1f0451ec748f7 Lyude Paul 2026-08-07  @7  	local_interrupt_disable();
c1f0451ec748f7 Lyude Paul 2026-08-07   8  }
c1f0451ec748f7 Lyude Paul 2026-08-07   9  
c1f0451ec748f7 Lyude Paul 2026-08-07  10  __rust_helper void rust_helper_local_interrupt_enable(void)
c1f0451ec748f7 Lyude Paul 2026-08-07  11  {
c1f0451ec748f7 Lyude Paul 2026-08-07 @12  	local_interrupt_enable();

:::::: The code at line 7 was first introduced by commit
:::::: c1f0451ec748f7a58a4e50bcb8f75bd89718be78 rust: Introduce interrupt module

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
