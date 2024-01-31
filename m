Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D23378662
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706700611; cv=none; b=oAafXJnayLnBmfI6nhL/R3q8IMo2TtOgo7B5a8+FPKipuW4/gJee03QG4hN4dDpIdoWs0epaTxy8rRZnWtly6HyCgx0J4HrX6YG5eIaKP58JndOG6VlSQjAUEe2bcFp8eV+XrqMuZMDeqrEZRQtdVmm8AH2Ez6nBGQCiWaiwa7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706700611; c=relaxed/simple;
	bh=XIRlOxmQoKVWE5sZtPFDvLAhrChOgtBOVSGQ3wy8Ja4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Goy5vTwEsYKxyl2KEJkfz4sjJJYTpp7GqUr4va/8gGPnzTI2HH5ecqNhTM4E+n0GDLQ9ApH+e2pL/EDmhrgS9wYO8A0zkTG/P+RsC0M2KLitUzV/f1MM6mo5teWJDQHs8NpQkPn27xEzTqSSAloClkwCBn+OVDGFHVbWa3P+kBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3FGjcTz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3FGjcTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706700609; x=1738236609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIRlOxmQoKVWE5sZtPFDvLAhrChOgtBOVSGQ3wy8Ja4=;
  b=P3FGjcTzOVuKfJtoQmnynuARq03BMUBahYWi4wBz4TuKM1o7/+J4tZv3
   1MKNcoA+VwfQVpFJkm3mnnHxe6qdY13u+69h2lwRG3b1LAA3OFAoM9BL+
   9NBttfg3a6va1PiyJFCevRfl+THelIrxSt6wAaiZ5NnAJEutKMY1qs6Fo
   Esjb+fEa6JE0+jRpGUicux+zMLofmXurLldrKKpAxJuHYSNb5XimdvfDd
   YOkqRQ0IFXvTMVJ619W6UgVOlBodM9oJgnIkDYvxs4N5VbUsbuVTHQgrT
   xoJcWEkc18Ny9rHEVp9DuSIBJFpsqk7+kk/z0TMPpD+Fg5b30ppCm/pGR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3439209"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3439209"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 03:30:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4020599"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 31 Jan 2024 03:30:07 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV8n5-0001Vg-1e;
	Wed, 31 Jan 2024 11:30:03 +0000
Date: Wed, 31 Jan 2024 19:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/enable-unsigned-sanitizer 58/119]
 arch/x86/kernel/nmi.c:564:13: error: argument 3 in call to function
 '__builtin_add_overflow' has pointer to enumerated type
Message-ID: <202401311941.GHYNblap-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/enable-unsigned-sanitizer
head:   5cbd2e2d0a54374525cec9a5a1167daf38feddee
commit: ef341fb241454b950e310efdd75763462a25d9fc [58/119] [WIP] arch/x86/include/asm/percpu.h: wrapping math: use add_wrap()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240131/202401311941.GHYNblap-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311941.GHYNblap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311941.GHYNblap-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/nmi.c: In function 'exc_nmi':
>> arch/x86/kernel/nmi.c:564:13: error: argument 3 in call to function '__builtin_add_overflow' has pointer to enumerated type
     564 |         if (this_cpu_dec_return(nmi_state))
         |             ^~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/nmi.c:564:13: error: argument 3 in call to function '__builtin_add_overflow' has pointer to enumerated type
>> arch/x86/kernel/nmi.c:564:13: error: argument 3 in call to function '__builtin_add_overflow' has pointer to enumerated type
>> arch/x86/kernel/nmi.c:564:13: error: argument 3 in call to function '__builtin_add_overflow' has pointer to enumerated type


vim +/__builtin_add_overflow +564 arch/x86/kernel/nmi.c

228bdaa95fb830e Steven Rostedt   2011-12-09  491  
71ed49d8fb33023 Thomas Gleixner  2020-06-12  492  DEFINE_IDTENTRY_RAW(exc_nmi)
ccd49c2391773ff Steven Rostedt   2011-12-13  493  {
b6be002bcd1dd1d Thomas Gleixner  2020-11-02  494  	irqentry_state_t irq_state;
1a3ea611fc10575 Paul E. McKenney 2022-12-16  495  	struct nmi_stats *nsp = this_cpu_ptr(&nmi_stats);
ba1f2b2eaa2a529 Peter Zijlstra   2020-05-27  496  
4ca68e023b11e4d Joerg Roedel     2020-09-07  497  	/*
4ca68e023b11e4d Joerg Roedel     2020-09-07  498  	 * Re-enable NMIs right here when running as an SEV-ES guest. This might
4ca68e023b11e4d Joerg Roedel     2020-09-07  499  	 * cause nested NMIs, but those can be handled safely.
4ca68e023b11e4d Joerg Roedel     2020-09-07  500  	 */
4ca68e023b11e4d Joerg Roedel     2020-09-07  501  	sev_es_nmi_complete();
1a3ea611fc10575 Paul E. McKenney 2022-12-16  502  	if (IS_ENABLED(CONFIG_NMI_CHECK_CPU))
0f613bfa8268a89 Mark Rutland     2023-06-05  503  		raw_atomic_long_inc(&nsp->idt_calls);
4ca68e023b11e4d Joerg Roedel     2020-09-07  504  
8f849ff63bcbc77 Thomas Gleixner  2023-10-02  505  	if (IS_ENABLED(CONFIG_SMP) && arch_cpu_is_offline(smp_processor_id())) {
8f849ff63bcbc77 Thomas Gleixner  2023-10-02  506  		if (microcode_nmi_handler_enabled())
8f849ff63bcbc77 Thomas Gleixner  2023-10-02  507  			microcode_offline_nmi_handler();
60dcaad5736faff Thomas Gleixner  2019-07-24  508  		return;
8f849ff63bcbc77 Thomas Gleixner  2023-10-02  509  	}
60dcaad5736faff Thomas Gleixner  2019-07-24  510  
9d05041679904b1 Andy Lutomirski  2015-07-15  511  	if (this_cpu_read(nmi_state) != NMI_NOT_RUNNING) {
9d05041679904b1 Andy Lutomirski  2015-07-15  512  		this_cpu_write(nmi_state, NMI_LATCHED);
9d05041679904b1 Andy Lutomirski  2015-07-15  513  		return;
9d05041679904b1 Andy Lutomirski  2015-07-15  514  	}
9d05041679904b1 Andy Lutomirski  2015-07-15  515  	this_cpu_write(nmi_state, NMI_EXECUTING);
9d05041679904b1 Andy Lutomirski  2015-07-15  516  	this_cpu_write(nmi_cr2, read_cr2());
f44075ecafb7268 Paul E. McKenney 2023-10-11  517  
f44075ecafb7268 Paul E. McKenney 2023-10-11  518  nmi_restart:
1a3ea611fc10575 Paul E. McKenney 2022-12-16  519  	if (IS_ENABLED(CONFIG_NMI_CHECK_CPU)) {
1a3ea611fc10575 Paul E. McKenney 2022-12-16  520  		WRITE_ONCE(nsp->idt_seq, nsp->idt_seq + 1);
1a3ea611fc10575 Paul E. McKenney 2022-12-16  521  		WARN_ON_ONCE(!(nsp->idt_seq & 0x1));
1a3ea611fc10575 Paul E. McKenney 2022-12-16  522  		WRITE_ONCE(nsp->recv_jiffies, jiffies);
1a3ea611fc10575 Paul E. McKenney 2022-12-16  523  	}
9d05041679904b1 Andy Lutomirski  2015-07-15  524  
315562c9af3d583 Joerg Roedel     2020-09-07  525  	/*
315562c9af3d583 Joerg Roedel     2020-09-07  526  	 * Needs to happen before DR7 is accessed, because the hypervisor can
315562c9af3d583 Joerg Roedel     2020-09-07  527  	 * intercept DR7 reads/writes, turning those into #VC exceptions.
315562c9af3d583 Joerg Roedel     2020-09-07  528  	 */
315562c9af3d583 Joerg Roedel     2020-09-07  529  	sev_es_ist_enter(regs);
315562c9af3d583 Joerg Roedel     2020-09-07  530  
fd338e3564b0b85 Peter Zijlstra   2020-05-29  531  	this_cpu_write(nmi_dr7, local_db_save());
ccd49c2391773ff Steven Rostedt   2011-12-13  532  
b6be002bcd1dd1d Thomas Gleixner  2020-11-02  533  	irq_state = irqentry_nmi_enter(regs);
1d48922c14b6363 Don Zickus       2011-09-30  534  
1d48922c14b6363 Don Zickus       2011-09-30  535  	inc_irq_stat(__nmi_count);
1d48922c14b6363 Don Zickus       2011-09-30  536  
1a3ea611fc10575 Paul E. McKenney 2022-12-16  537  	if (IS_ENABLED(CONFIG_NMI_CHECK_CPU) && ignore_nmis) {
1a3ea611fc10575 Paul E. McKenney 2022-12-16  538  		WRITE_ONCE(nsp->idt_ignored, nsp->idt_ignored + 1);
1a3ea611fc10575 Paul E. McKenney 2022-12-16  539  	} else if (!ignore_nmis) {
1a3ea611fc10575 Paul E. McKenney 2022-12-16  540  		if (IS_ENABLED(CONFIG_NMI_CHECK_CPU)) {
1a3ea611fc10575 Paul E. McKenney 2022-12-16  541  			WRITE_ONCE(nsp->idt_nmi_seq, nsp->idt_nmi_seq + 1);
1a3ea611fc10575 Paul E. McKenney 2022-12-16  542  			WARN_ON_ONCE(!(nsp->idt_nmi_seq & 0x1));
1a3ea611fc10575 Paul E. McKenney 2022-12-16  543  		}
1d48922c14b6363 Don Zickus       2011-09-30  544  		default_do_nmi(regs);
1a3ea611fc10575 Paul E. McKenney 2022-12-16  545  		if (IS_ENABLED(CONFIG_NMI_CHECK_CPU)) {
1a3ea611fc10575 Paul E. McKenney 2022-12-16  546  			WRITE_ONCE(nsp->idt_nmi_seq, nsp->idt_nmi_seq + 1);
1a3ea611fc10575 Paul E. McKenney 2022-12-16  547  			WARN_ON_ONCE(nsp->idt_nmi_seq & 0x1);
1a3ea611fc10575 Paul E. McKenney 2022-12-16  548  		}
1a3ea611fc10575 Paul E. McKenney 2022-12-16  549  	}
1d48922c14b6363 Don Zickus       2011-09-30  550  
b6be002bcd1dd1d Thomas Gleixner  2020-11-02  551  	irqentry_nmi_exit(regs, irq_state);
228bdaa95fb830e Steven Rostedt   2011-12-09  552  
fd338e3564b0b85 Peter Zijlstra   2020-05-29  553  	local_db_restore(this_cpu_read(nmi_dr7));
9d05041679904b1 Andy Lutomirski  2015-07-15  554  
315562c9af3d583 Joerg Roedel     2020-09-07  555  	sev_es_ist_exit();
315562c9af3d583 Joerg Roedel     2020-09-07  556  
9d05041679904b1 Andy Lutomirski  2015-07-15  557  	if (unlikely(this_cpu_read(nmi_cr2) != read_cr2()))
9d05041679904b1 Andy Lutomirski  2015-07-15  558  		write_cr2(this_cpu_read(nmi_cr2));
1a3ea611fc10575 Paul E. McKenney 2022-12-16  559  	if (IS_ENABLED(CONFIG_NMI_CHECK_CPU)) {
1a3ea611fc10575 Paul E. McKenney 2022-12-16  560  		WRITE_ONCE(nsp->idt_seq, nsp->idt_seq + 1);
1a3ea611fc10575 Paul E. McKenney 2022-12-16  561  		WARN_ON_ONCE(nsp->idt_seq & 0x1);
1a3ea611fc10575 Paul E. McKenney 2022-12-16  562  		WRITE_ONCE(nsp->recv_jiffies, jiffies);
1a3ea611fc10575 Paul E. McKenney 2022-12-16  563  	}
f44075ecafb7268 Paul E. McKenney 2023-10-11 @564  	if (this_cpu_dec_return(nmi_state))
f44075ecafb7268 Paul E. McKenney 2023-10-11  565  		goto nmi_restart;
f44075ecafb7268 Paul E. McKenney 2023-10-11  566  
f44075ecafb7268 Paul E. McKenney 2023-10-11  567  	if (user_mode(regs))
f44075ecafb7268 Paul E. McKenney 2023-10-11  568  		mds_user_clear_cpu_buffers();
1d48922c14b6363 Don Zickus       2011-09-30  569  }
1d48922c14b6363 Don Zickus       2011-09-30  570  

:::::: The code at line 564 was first introduced by commit
:::::: f44075ecafb726830e63d33fbca29413149eeeb8 x86/nmi: Fix out-of-order NMI nesting checks & false positive warning

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
