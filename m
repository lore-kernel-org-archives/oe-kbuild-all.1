Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190365;
	b=kUT9uEARZwR2Pa3LGR0OtE3r+VGllULIrMXQgkdt2pQQghr1/62akfGBKFFHvqv0y2MJ
	 sU7d8Nvo4YMWgvY3Z4pqOy2Fu3D8z/L02sQo0oCXaf8YVlm/4eWq0tawEAODVKZrS4uz+
	 9NWQJncTcW9Odyy+pc131K7p27JN9NKFpUSfGCVHLveC38h3J8F2ybjuYWO96IGzOLkEh
	 97KwtcjK307KL65eaBX0hurCheyxNNCW1T1wLYo0PQ2BFgAW5JLvN8JHC4JKOokaE8UvO
	 DPg6o9vLrttHdgpMzEZdbN99UNO+9TyF9ao/BVOjJk0UN+NwjwHAeh8/s+EK/q7sF8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190365;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=osvU82IfX9cl4tEplliRE+fliMVVwMs5Ku7zJUezdUU=;
	b=TFIayTpNzDM5ldwqdxU2tTx9f81qtwxIPdTbyF9lVlutbid3nLxY7jLSLrbeuxPBujwd
	 4vkouo3q49bv620k3usZQaf2hQrkAN+IYhp3Vd0Vl9gDxLs6nWpp33/TyppAvPeJodVTd
	 7zqJUr4yImskW1PNkTC147wIQoxBbA4Kep2q8Wkzn99slANvJz2ggigeKi4Vsz/fl7vcZ
	 sCe1Zb6Rb17YAWRnN6hZqYy6+9ADqAxlHCnzlYPzH0Iw7bk565e3x8938GwyEPssJ70OF
	 snd/Jt6pITcE7yLDHpxmk+/mmXToxvKaDmgP9jo4oN1C/4347hRQhvORyDOcm1BEn/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fokilld0;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC40606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 12:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fokilld0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793190363; x=1824726363;
  h=date:from:to:cc:subject:message-id;
  bh=p0KRQs8dCvMJL9RTbrP4Fcb+JvGy+Q5m+EXu3EzYCVw=;
  b=Fokilld0FOBzaYIfEB4aB7GVtsECyadryWYM1iionEP31FeREwhGrmTf
   175dUNvWNjH30KTete8TQ0+iv+O0NDZo25AdbVjXvBcVCbOursWblQYfB
   VOUkANM8i79POguo8WH2aV9zv/ppAqlAj/Tqq3gytqZsXwSZQdopt81eD
   TozY3V561KsVPK5W1r1KBY+X9SaTbZTzkfu5F5H1a3TxZSIQr+he24j53
   26ai0Vr5byrVoumhkJhzpsliccyJH8Jjd7tTBMQ2dcWcRKgqNGOKkixQS
   HRHd0lUa7E04pRIZE9xukeZxVv2qYqlArM6bnxD98EZ/t4CtIj6PAueDs
   A==;
X-CSE-ConnectionGUID: Ud+nu3S8QryEgfJE2/jWOg==
X-CSE-MsgGUID: 9/1L4PxGQeeyl5llfGJvIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1817899"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1817899"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 05:26:03 -0700
X-CSE-ConnectionGUID: VRFu2MTnQYq/+ONIvMjQnQ==
X-CSE-MsgGUID: B25TsG+XQlC84tqssPcsLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4906668"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2026 05:26:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM2j9-00000000YhQ-1j97;
	Wed, 28 Oct 2026 12:25:59 +0000
Date: Wed, 28 Oct 2026 20:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-lazy-pte 2/6]
 arch/m68k/include/asm/page.h:20:27: error: lvalue required as unary '&'
 operand
Message-ID: <202610282023.2XwwglSs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux arena-lazy-pte
head:   ce19d941e895a85d7dc1e7d49e6b90b1262f7e79
commit: 0ec7dbb5a7536124b8723d262ad2f6e11244767d [2/6] mm: Add lockless kernel PMD populate, clear and range-flush helpers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20261028/202610282023.2XwwglSs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282023.2XwwglSs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282023.2XwwglSs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:107,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:243,
                    from include/linux/once.h:6,
                    from include/linux/prandom.h:12,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/pgtable.h: In function 'pmdp_try_clear':
>> arch/m68k/include/asm/page.h:20:27: error: lvalue required as unary '&' operand
      20 | #define pmd_val(x)      ((&x)->pmd)
         |                           ^
   include/linux/pgtable.h:1119:13: note: in expansion of macro 'pmd_val'
    1119 |         if (pmd_val(pmdp_get(pmdp)) != pmd_val(old))
         |             ^~~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1436: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +20 arch/m68k/include/asm/page.h

138ff3462f53a7 Greg Ungerer   2010-09-07  14  
138ff3462f53a7 Greg Ungerer   2010-09-07  15  /*
138ff3462f53a7 Greg Ungerer   2010-09-07  16   * These are used to make use of C type-checking..
138ff3462f53a7 Greg Ungerer   2010-09-07  17   */
60e50f34b13e9e Mike Rapoport  2019-12-04  18  #if !defined(CONFIG_MMU) || CONFIG_PGTABLE_LEVELS == 3
ef22d8abd876e8 Peter Zijlstra 2020-01-31  19  typedef struct { unsigned long pmd; } pmd_t;
ef22d8abd876e8 Peter Zijlstra 2020-01-31 @20  #define pmd_val(x)	((&x)->pmd)
ef22d8abd876e8 Peter Zijlstra 2020-01-31  21  #define __pmd(x)	((pmd_t) { (x) } )
60e50f34b13e9e Mike Rapoport  2019-12-04  22  #endif
60e50f34b13e9e Mike Rapoport  2019-12-04  23  

:::::: The code at line 20 was first introduced by commit
:::::: ef22d8abd876e805b604e8f655127de2beee2869 m68k: mm: Restructure Motorola MMU page-table layout

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
