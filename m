Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF942E637
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 18:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706467361; cv=none; b=Zf2cwBsNx3PkuLBjr6Wp7wJoCnkoWmF2PgaLBG210DDO6dLfFSsByoo37I5lC7+yMEG1C16z4OSwy+Fj8s1L8Gm6n8CvxHpPodQ4rauyTdlK+dBIPwR73+jMyKlrk0y+xpLqBKS3dOPDvEoSiRv49iXgIsvFA4wbNR7mVOt0ZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706467361; c=relaxed/simple;
	bh=OEXgJuVsqFYmy9O/vhvZyI2uPJoE5RVnUEIY/dnKopA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tt89AMTjIesELQ7xD2+JlDn13GYZQzJlrAkjhRGFzGKEGpfF27sRT9Kq0WqxnYIBZferLOQo/rftmtkWlJ+syrNJipwgOI0d1hxJM/rpJKQQjqevR8iU60vBXay3KmRQIFpPfAoQNV5prMpfYoSx45Muk/JJ7rU5EoTq6XYGXs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPk5iChZ; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPk5iChZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706467359; x=1738003359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OEXgJuVsqFYmy9O/vhvZyI2uPJoE5RVnUEIY/dnKopA=;
  b=jPk5iChZ4O8I/lvGl5yagItay9ScxlzgIkos1I0lHDNkNEVx0p5xF5xT
   CEoSBgZrHltGbX0GvC6cAw997QlSuOb0STNvgmxyCp9D1eJ80o+ROMlBp
   X4BGML6BtBioM7cpDncZWjpmeGJ7XK56hZsX3iinVNssT5TuAV/x1B0Ba
   dwpkhHjSdzu73W9/SoWXIRFodgJS0d8VfVCgyb2sgq0qTCcLEyHAMPhh8
   fTV+hIzwa+1I8XmOnpWpM5NaKVnFbtqVLYAMtxP5i5lxnBXYS5S86eHGD
   IAy0BhbMpOrlSt/5Ftbpe1k+UIOjErN8N2/cRKWuTr5g8TgspShyKrGK/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="433958461"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="433958461"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 10:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29565683"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jan 2024 10:42:37 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUA70-0003f0-2S;
	Sun, 28 Jan 2024 18:42:34 +0000
Date: Mon, 29 Jan 2024 02:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/enable-unsigned-sanitizer 78/100]
 arch/x86/kernel/nmi.c:564:6: error: argument 3 in call to function
 '__builtin_add_overflow' has pointer to enumerated type
Message-ID: <202401290202.YmJoP4IM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/enable-unsigned-sanitizer
head:   a7e79409b1cc59a7f181e2b04e0cb4835b620b81
commit: 9e59daafd0fb1cc2fa26cc07216ef6af4f88aa9e [78/100] [WIP] include/asm-generic/percpu.h: wrapping math: use *_wrap()
config: i386-randconfig-012-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290202.YmJoP4IM-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290202.YmJoP4IM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290202.YmJoP4IM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/nmi.c: In function 'exc_nmi':
>> arch/x86/kernel/nmi.c:564:6: error: argument 3 in call to function '__builtin_add_overflow' has pointer to enumerated type
     if (this_cpu_dec_return(nmi_state))
         ^~~~~~~~~~~~~~~~~~~


vim +/__builtin_add_overflow +564 arch/x86/kernel/nmi.c

228bdaa95fb830 Steven Rostedt   2011-12-09  491  
71ed49d8fb3302 Thomas Gleixner  2020-06-12  492  DEFINE_IDTENTRY_RAW(exc_nmi)
ccd49c2391773f Steven Rostedt   2011-12-13  493  {
b6be002bcd1dd1 Thomas Gleixner  2020-11-02  494  	irqentry_state_t irq_state;
1a3ea611fc1057 Paul E. McKenney 2022-12-16  495  	struct nmi_stats *nsp = this_cpu_ptr(&nmi_stats);
ba1f2b2eaa2a52 Peter Zijlstra   2020-05-27  496  
4ca68e023b11e4 Joerg Roedel     2020-09-07  497  	/*
4ca68e023b11e4 Joerg Roedel     2020-09-07  498  	 * Re-enable NMIs right here when running as an SEV-ES guest. This might
4ca68e023b11e4 Joerg Roedel     2020-09-07  499  	 * cause nested NMIs, but those can be handled safely.
4ca68e023b11e4 Joerg Roedel     2020-09-07  500  	 */
4ca68e023b11e4 Joerg Roedel     2020-09-07  501  	sev_es_nmi_complete();
1a3ea611fc1057 Paul E. McKenney 2022-12-16  502  	if (IS_ENABLED(CONFIG_NMI_CHECK_CPU))
0f613bfa8268a8 Mark Rutland     2023-06-05  503  		raw_atomic_long_inc(&nsp->idt_calls);
4ca68e023b11e4 Joerg Roedel     2020-09-07  504  
8f849ff63bcbc7 Thomas Gleixner  2023-10-02  505  	if (IS_ENABLED(CONFIG_SMP) && arch_cpu_is_offline(smp_processor_id())) {
8f849ff63bcbc7 Thomas Gleixner  2023-10-02  506  		if (microcode_nmi_handler_enabled())
8f849ff63bcbc7 Thomas Gleixner  2023-10-02  507  			microcode_offline_nmi_handler();
60dcaad5736faf Thomas Gleixner  2019-07-24  508  		return;
8f849ff63bcbc7 Thomas Gleixner  2023-10-02  509  	}
60dcaad5736faf Thomas Gleixner  2019-07-24  510  
9d05041679904b Andy Lutomirski  2015-07-15  511  	if (this_cpu_read(nmi_state) != NMI_NOT_RUNNING) {
9d05041679904b Andy Lutomirski  2015-07-15  512  		this_cpu_write(nmi_state, NMI_LATCHED);
9d05041679904b Andy Lutomirski  2015-07-15  513  		return;
9d05041679904b Andy Lutomirski  2015-07-15  514  	}
9d05041679904b Andy Lutomirski  2015-07-15  515  	this_cpu_write(nmi_state, NMI_EXECUTING);
9d05041679904b Andy Lutomirski  2015-07-15  516  	this_cpu_write(nmi_cr2, read_cr2());
f44075ecafb726 Paul E. McKenney 2023-10-11  517  
f44075ecafb726 Paul E. McKenney 2023-10-11  518  nmi_restart:
1a3ea611fc1057 Paul E. McKenney 2022-12-16  519  	if (IS_ENABLED(CONFIG_NMI_CHECK_CPU)) {
1a3ea611fc1057 Paul E. McKenney 2022-12-16  520  		WRITE_ONCE(nsp->idt_seq, nsp->idt_seq + 1);
1a3ea611fc1057 Paul E. McKenney 2022-12-16  521  		WARN_ON_ONCE(!(nsp->idt_seq & 0x1));
1a3ea611fc1057 Paul E. McKenney 2022-12-16  522  		WRITE_ONCE(nsp->recv_jiffies, jiffies);
1a3ea611fc1057 Paul E. McKenney 2022-12-16  523  	}
9d05041679904b Andy Lutomirski  2015-07-15  524  
315562c9af3d58 Joerg Roedel     2020-09-07  525  	/*
315562c9af3d58 Joerg Roedel     2020-09-07  526  	 * Needs to happen before DR7 is accessed, because the hypervisor can
315562c9af3d58 Joerg Roedel     2020-09-07  527  	 * intercept DR7 reads/writes, turning those into #VC exceptions.
315562c9af3d58 Joerg Roedel     2020-09-07  528  	 */
315562c9af3d58 Joerg Roedel     2020-09-07  529  	sev_es_ist_enter(regs);
315562c9af3d58 Joerg Roedel     2020-09-07  530  
fd338e3564b0b8 Peter Zijlstra   2020-05-29  531  	this_cpu_write(nmi_dr7, local_db_save());
ccd49c2391773f Steven Rostedt   2011-12-13  532  
b6be002bcd1dd1 Thomas Gleixner  2020-11-02  533  	irq_state = irqentry_nmi_enter(regs);
1d48922c14b636 Don Zickus       2011-09-30  534  
1d48922c14b636 Don Zickus       2011-09-30  535  	inc_irq_stat(__nmi_count);
1d48922c14b636 Don Zickus       2011-09-30  536  
1a3ea611fc1057 Paul E. McKenney 2022-12-16  537  	if (IS_ENABLED(CONFIG_NMI_CHECK_CPU) && ignore_nmis) {
1a3ea611fc1057 Paul E. McKenney 2022-12-16  538  		WRITE_ONCE(nsp->idt_ignored, nsp->idt_ignored + 1);
1a3ea611fc1057 Paul E. McKenney 2022-12-16  539  	} else if (!ignore_nmis) {
1a3ea611fc1057 Paul E. McKenney 2022-12-16  540  		if (IS_ENABLED(CONFIG_NMI_CHECK_CPU)) {
1a3ea611fc1057 Paul E. McKenney 2022-12-16  541  			WRITE_ONCE(nsp->idt_nmi_seq, nsp->idt_nmi_seq + 1);
1a3ea611fc1057 Paul E. McKenney 2022-12-16  542  			WARN_ON_ONCE(!(nsp->idt_nmi_seq & 0x1));
1a3ea611fc1057 Paul E. McKenney 2022-12-16  543  		}
1d48922c14b636 Don Zickus       2011-09-30  544  		default_do_nmi(regs);
1a3ea611fc1057 Paul E. McKenney 2022-12-16  545  		if (IS_ENABLED(CONFIG_NMI_CHECK_CPU)) {
1a3ea611fc1057 Paul E. McKenney 2022-12-16  546  			WRITE_ONCE(nsp->idt_nmi_seq, nsp->idt_nmi_seq + 1);
1a3ea611fc1057 Paul E. McKenney 2022-12-16  547  			WARN_ON_ONCE(nsp->idt_nmi_seq & 0x1);
1a3ea611fc1057 Paul E. McKenney 2022-12-16  548  		}
1a3ea611fc1057 Paul E. McKenney 2022-12-16  549  	}
1d48922c14b636 Don Zickus       2011-09-30  550  
b6be002bcd1dd1 Thomas Gleixner  2020-11-02  551  	irqentry_nmi_exit(regs, irq_state);
228bdaa95fb830 Steven Rostedt   2011-12-09  552  
fd338e3564b0b8 Peter Zijlstra   2020-05-29  553  	local_db_restore(this_cpu_read(nmi_dr7));
9d05041679904b Andy Lutomirski  2015-07-15  554  
315562c9af3d58 Joerg Roedel     2020-09-07  555  	sev_es_ist_exit();
315562c9af3d58 Joerg Roedel     2020-09-07  556  
9d05041679904b Andy Lutomirski  2015-07-15  557  	if (unlikely(this_cpu_read(nmi_cr2) != read_cr2()))
9d05041679904b Andy Lutomirski  2015-07-15  558  		write_cr2(this_cpu_read(nmi_cr2));
1a3ea611fc1057 Paul E. McKenney 2022-12-16  559  	if (IS_ENABLED(CONFIG_NMI_CHECK_CPU)) {
1a3ea611fc1057 Paul E. McKenney 2022-12-16  560  		WRITE_ONCE(nsp->idt_seq, nsp->idt_seq + 1);
1a3ea611fc1057 Paul E. McKenney 2022-12-16  561  		WARN_ON_ONCE(nsp->idt_seq & 0x1);
1a3ea611fc1057 Paul E. McKenney 2022-12-16  562  		WRITE_ONCE(nsp->recv_jiffies, jiffies);
1a3ea611fc1057 Paul E. McKenney 2022-12-16  563  	}
f44075ecafb726 Paul E. McKenney 2023-10-11 @564  	if (this_cpu_dec_return(nmi_state))
f44075ecafb726 Paul E. McKenney 2023-10-11  565  		goto nmi_restart;
f44075ecafb726 Paul E. McKenney 2023-10-11  566  
f44075ecafb726 Paul E. McKenney 2023-10-11  567  	if (user_mode(regs))
f44075ecafb726 Paul E. McKenney 2023-10-11  568  		mds_user_clear_cpu_buffers();
1d48922c14b636 Don Zickus       2011-09-30  569  }
1d48922c14b636 Don Zickus       2011-09-30  570  

:::::: The code at line 564 was first introduced by commit
:::::: f44075ecafb726830e63d33fbca29413149eeeb8 x86/nmi: Fix out-of-order NMI nesting checks & false positive warning

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
