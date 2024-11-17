Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255B12E5B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 04:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731817377; cv=none; b=Ar+H/XIo3OrfAffa1lRvS6wnQ/akH/hBhiTxNBAxBIrlHjlp7khdZt8cjHzoEWko5onK6/9FWTfOG/MgePiAkjgzdSJfVyaI4pzok8QqmMKRBDUFza9b8ofl7W1zG2v6Rp7dq+hVR33oxZho4lMMRuotFQvM9ek/yVLmQQn5qzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731817377; c=relaxed/simple;
	bh=X8+BytxBAo2SssqYDDQjTk/KwUtj3WrZ4IFY4boTnfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mu5B9n2RTLXOWZD8KJanjK+FkEjLn6drSaruIb8FEDl2UcUH80Kudebfx5R7ALVQutDurwzwkT6Mne80fH5vpHYXNbEySsi7NLocMp1ZSUTI34N8pfkYqqEuUuQkC07uwH8CyNrJNoZwLCYmxCgdL4x0ZRmmyHPtxLCQkd2JxLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKkBxtye; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKkBxtye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731817376; x=1763353376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X8+BytxBAo2SssqYDDQjTk/KwUtj3WrZ4IFY4boTnfE=;
  b=aKkBxtye3ZEdBQEaSIbh+Ho2OrwOZlquM9O0g6ggdXBpyDdwjPb5rmIm
   QN82qiK2rld6UDXfj5tL350HZDmM93RfuvzCoNKP7IQGfxm1NMqYkZaDR
   l7PHJE58OVcyFLb7UNPOkGEbUxXuDP30GziiGrwXr/kuiVOogeBCk/5Ae
   vHoI1dNBfhf++nNHfsSWt3gjDQ1fioOrLimqUpLyNhh6GcEZTXQ9lETwB
   tu/cK36RszsX5O32SykW18br77qpmVkZ9P4z38LR/aRt366+6faw40w2R
   OjhKclazcsLbEQsZCDTC92zfHJFSm86o3vEikAjquTgXqC5VufK9S/4iX
   w==;
X-CSE-ConnectionGUID: 1F+eRBomT8KdGmTstfkVyw==
X-CSE-MsgGUID: r7l07vK5Q0aRt6RTglYDzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54290831"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="54290831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 20:22:51 -0800
X-CSE-ConnectionGUID: ByvanW5yQC+2U5ALWZK5Hw==
X-CSE-MsgGUID: e0u9aeqgSq+NbUuikqriIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="89325845"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Nov 2024 20:22:48 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCWoA-0001Rb-11;
	Sun, 17 Nov 2024 04:22:46 +0000
Date: Sun, 17 Nov 2024 12:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 10/10]
 arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')'
 before 'ANNOTATE_RETPOLINE_SAFE'
Message-ID: <202411171259.pKbPlM0i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   ec22210e550d285543b6dd26e6be038407086200
commit: ec22210e550d285543b6dd26e6be038407086200 [10/10] objtool: Collect all annotations in objtool.h
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411171259.pKbPlM0i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171259.pKbPlM0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171259.pKbPlM0i-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/paravirt.h: In function 'slow_down_io':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:460:9: note: in expansion of macro '__PVOP_VCALL'
     460 |         __PVOP_VCALL(op)
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:59:9: note: in expansion of macro 'PVOP_VCALL0'
      59 |         PVOP_VCALL0(cpu.io_delay);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function '__flush_tlb_local':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:460:9: note: in expansion of macro '__PVOP_VCALL'
     460 |         __PVOP_VCALL(op)
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:75:9: note: in expansion of macro 'PVOP_VCALL0'
      75 |         PVOP_VCALL0(mmu.flush_tlb_user);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function '__flush_tlb_global':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:460:9: note: in expansion of macro '__PVOP_VCALL'
     460 |         __PVOP_VCALL(op)
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:80:9: note: in expansion of macro 'PVOP_VCALL0'
      80 |         PVOP_VCALL0(mmu.flush_tlb_kernel);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function '__flush_tlb_one_user':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:479:9: note: in expansion of macro '__PVOP_VCALL'
     479 |         __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:85:9: note: in expansion of macro 'PVOP_VCALL1'
      85 |         PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function '__flush_tlb_multi':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:496:9: note: in expansion of macro '__PVOP_VCALL'
     496 |         __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:91:9: note: in expansion of macro 'PVOP_VCALL2'
      91 |         PVOP_VCALL2(mmu.flush_tlb_multi, cpumask, info);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_tlb_remove_table':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:496:9: note: in expansion of macro '__PVOP_VCALL'
     496 |         __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:96:9: note: in expansion of macro 'PVOP_VCALL2'
      96 |         PVOP_VCALL2(mmu.tlb_remove_table, tlb, table);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_arch_exit_mmap':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:479:9: note: in expansion of macro '__PVOP_VCALL'
     479 |         __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:101:9: note: in expansion of macro 'PVOP_VCALL1'
     101 |         PVOP_VCALL1(mmu.exit_mmap, mm);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'notify_page_enc_status_changed':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:502:9: note: in expansion of macro '__PVOP_VCALL'
     502 |         __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1),                          \
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:107:9: note: in expansion of macro 'PVOP_VCALL3'
     107 |         PVOP_VCALL3(mmu.notify_page_enc_status_changed, pfn, npages, enc);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'pv_queued_spin_lock_slowpath':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:496:9: note: in expansion of macro '__PVOP_VCALL'
     496 |         __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:584:9: note: in expansion of macro 'PVOP_VCALL2'
     584 |         PVOP_VCALL2(lock.queued_spin_lock_slowpath, lock, val);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'pv_queued_spin_unlock':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/alternative.h:184:9: note: in expansion of macro 'ALTERNATIVE'
     184 |         ALTERNATIVE(ALTERNATIVE(oldinstr, newinstr1, ft_flags1), newinstr2, ft_flags2)
         |         ^~~~~~~~~~~
   arch/x86/include/asm/alternative.h:179:9: note: in expansion of macro 'OLDINSTR'
     179 |         OLDINSTR(oldinstr)                                              \
         |         ^~~~~~~~
   arch/x86/include/asm/alternative.h:184:21: note: in expansion of macro 'ALTERNATIVE'
     184 |         ALTERNATIVE(ALTERNATIVE(oldinstr, newinstr1, ft_flags1), newinstr2, ft_flags2)
         |                     ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:411:30: note: in expansion of macro 'ALTERNATIVE_2'
     411 |                 asm volatile(ALTERNATIVE_2(PARAVIRT_CALL,               \
         |                              ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:411:44: note: in expansion of macro 'PARAVIRT_CALL'
     411 |                 asm volatile(ALTERNATIVE_2(PARAVIRT_CALL,               \
         |                                            ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:453:15: note: in expansion of macro '____PVOP_ALT_CALL'
     453 |         (void)____PVOP_ALT_CALL(, op.func, alt, cond,                   \
         |               ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:490:9: note: in expansion of macro '__PVOP_ALT_VCALLEESAVE'
     490 |         __PVOP_ALT_VCALLEESAVE(op, alt, cond, PVOP_CALL_ARG1(arg1))
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:589:9: note: in expansion of macro 'PVOP_ALT_VCALLEE1'
     589 |         PVOP_ALT_VCALLEE1(lock.queued_spin_unlock, lock,
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'pv_wait':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:496:9: note: in expansion of macro '__PVOP_VCALL'
     496 |         __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:596:9: note: in expansion of macro 'PVOP_VCALL2'
     596 |         PVOP_VCALL2(lock.wait, ptr, val);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'pv_kick':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:30: note: in expansion of macro 'ALTERNATIVE'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                              ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:397:42: note: in expansion of macro 'PARAVIRT_CALL'
     397 |                 asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR, \
         |                                          ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:440:15: note: in expansion of macro '____PVOP_CALL'
     440 |         (void)____PVOP_CALL(, op, PVOP_VCALL_CLOBBERS,                  \
         |               ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:479:9: note: in expansion of macro '__PVOP_VCALL'
     479 |         __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:601:9: note: in expansion of macro 'PVOP_VCALL1'
     601 |         PVOP_VCALL1(lock.kick, cpu);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'pv_vcpu_is_preempted':
>> arch/x86/include/asm/paravirt_types.h:251:9: error: expected ':' or ')' before 'ANNOTATE_RETPOLINE_SAFE'
     251 |         ANNOTATE_RETPOLINE_SAFE                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:156:20: note: in definition of macro 'OLDINSTR'
     156 |         "771:\n\t" oldinstr "\n772:\n"                                  \
         |                    ^~~~~~~~
   arch/x86/include/asm/alternative.h:184:9: note: in expansion of macro 'ALTERNATIVE'
     184 |         ALTERNATIVE(ALTERNATIVE(oldinstr, newinstr1, ft_flags1), newinstr2, ft_flags2)
         |         ^~~~~~~~~~~
   arch/x86/include/asm/alternative.h:179:9: note: in expansion of macro 'OLDINSTR'
     179 |         OLDINSTR(oldinstr)                                              \
         |         ^~~~~~~~
   arch/x86/include/asm/alternative.h:184:21: note: in expansion of macro 'ALTERNATIVE'
     184 |         ALTERNATIVE(ALTERNATIVE(oldinstr, newinstr1, ft_flags1), newinstr2, ft_flags2)
         |                     ^~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:411:30: note: in expansion of macro 'ALTERNATIVE_2'
     411 |                 asm volatile(ALTERNATIVE_2(PARAVIRT_CALL,               \
         |                              ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:411:44: note: in expansion of macro 'PARAVIRT_CALL'
     411 |                 asm volatile(ALTERNATIVE_2(PARAVIRT_CALL,               \
         |                                            ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:435:9: note: in expansion of macro '____PVOP_ALT_CALL'
     435 |         ____PVOP_ALT_CALL(PVOP_RETVAL(rettype), op.func, alt, cond,     \
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:488:9: note: in expansion of macro '__PVOP_ALT_CALLEESAVE'
     488 |         __PVOP_ALT_CALLEESAVE(rettype, op, alt, cond, PVOP_CALL_ARG1(arg1))
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:606:16: note: in expansion of macro 'PVOP_ALT_CALLEE1'
     606 |         return PVOP_ALT_CALLEE1(bool, lock.vcpu_is_preempted, cpu,
         |                ^~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +251 arch/x86/include/asm/paravirt_types.h

ac5672f82c39ff Jeremy Fitzhardinge 2009-04-14  248  
60bc276b129eef Juergen Gross       2023-12-10  249  /* This generates an indirect call based on the operation type number. */
a4da3d86a285f0 Ingo Molnar         2018-12-19  250  #define PARAVIRT_CALL					\
a4da3d86a285f0 Ingo Molnar         2018-12-19 @251  	ANNOTATE_RETPOLINE_SAFE				\
2e1f8e55f9e054 Jan Beulich         2021-09-30  252  	"call *%[paravirt_opptr];"
a4da3d86a285f0 Ingo Molnar         2018-12-19  253  

:::::: The code at line 251 was first introduced by commit
:::::: a4da3d86a285f0035a21bae776846c5077a535df Revert "x86/paravirt: Work around GCC inlining bugs when compiling paravirt ops"

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
