Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C41E521
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713735993; cv=none; b=ffoXrK/V/bSVOgOGrr9zo+W1ICsKBKaqfcRA5khrN0mNRVLsu+rJqpgwGM6vrS9SJoYweI/aYNCjO4hBavXY37124FelwyzVD5xwejMwglHeRt6Ma9R23ygN0c9oJAn3w6d26klwPERedhX13QVhkf+keSJbCTIDam5U6IXy2DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713735993; c=relaxed/simple;
	bh=neNinAFV+WRVcqyTQSMT71dZ69/Rk7e6iavlf5Z4dBE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X25n1UzL3rdX37GRCDLGLor6DeVD/SafQUyti02NabeS1gpqDTotcNMXaZ0F3ys/K0t7JmjulAq9mbOw+X07vw5JOM1ZfSmneQNwcbOA9lTDb3seMwQvcCOm4x8W4fzKoNjIjxA28jf015HaVDeckK4eE3T17M/4jsrmqY9M/Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PoclH1cV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PoclH1cV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713735992; x=1745271992;
  h=date:from:cc:subject:message-id:mime-version;
  bh=neNinAFV+WRVcqyTQSMT71dZ69/Rk7e6iavlf5Z4dBE=;
  b=PoclH1cVe6dltYOlOlFPPxtum5PNbkyO5nfwnZms7HsWi++0nM2cE9eu
   hFyDNWOpRaybSj7OqaY/s3KV/4JEi5LcuqLn3Vn331xRpii7ywOWa0SvI
   Q305xcd1fu4h1sbhC49uqpa9WhAfdvWQRWkGupfJ0O6m0r1aiJsSkK8XF
   hj8keutS9zDp9rp/8YaYzdiAsv4FN0rJUtYOoB9/qquNDXM9jMVm77dEp
   tTsJfZGm+LkRsgCLyny4dG0LyFs/edq0vKEX5eQfoDIDG4H1hnMKCphgL
   UMJ74ZeQBP4Rts+SK3py9/MTIlm0U60SzlJ8BrHYayiPgqk1DPP1qdQqy
   Q==;
X-CSE-ConnectionGUID: 4NLFrSFBRhipWcLIJQPN4g==
X-CSE-MsgGUID: ETeD6tgZQqqtYqYfo8GUtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="34664099"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="34664099"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 14:46:30 -0700
X-CSE-ConnectionGUID: YuTnYU03ReGkS7OgNcVIrA==
X-CSE-MsgGUID: ig79o/ylQi+3sXYjJIAmyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="28496938"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Apr 2024 14:46:29 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryf10-000CBC-2G;
	Sun, 21 Apr 2024 21:46:26 +0000
Date: Mon, 22 Apr 2024 05:46:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 16965/19260]
 arch/x86/kernel/irq_pipeline.c:349:6: warning: no previous prototype for
 'handle_irq_move_cleanup'
Message-ID: <202404220520.s4WGkbEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   aadad7185b99f2a8ede59357fbdc2ac6b17d95d4
commit: 12848ee401d3b5bbadb48dbe0e46635f763a8b2e [16965/19260] x86: irq_pipeline: add IRQ pipeline core
config: x86_64-randconfig-104-20240422 (https://download.01.org/0day-ci/archive/20240422/202404220520.s4WGkbEk-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404220520.s4WGkbEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404220520.s4WGkbEk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/irq_pipeline.c:35:6: warning: no previous prototype for 'handle_apic_irq' [-Wmissing-prototypes]
      35 | void handle_apic_irq(struct irq_desc *desc)
         |      ^~~~~~~~~~~~~~~
   arch/x86/kernel/irq_pipeline.c:210:6: warning: no previous prototype for 'arch_handle_irq' [-Wmissing-prototypes]
     210 | void arch_handle_irq(struct pt_regs *regs, u8 vector, bool irq_movable)
         |      ^~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/traps.h:9,
                    from arch/x86/kernel/irq_pipeline.c:12:
   arch/x86/include/asm/idtentry.h:210:16: warning: no previous prototype for '__sysvec_reschedule_oob_ipi' [-Wmissing-prototypes]
     210 | __visible void __##func(struct pt_regs *regs)
         |                ^~
   arch/x86/kernel/irq_pipeline.c:341:1: note: in expansion of macro 'DEFINE_IDTENTRY_SYSVEC_PIPELINED'
     341 | DEFINE_IDTENTRY_SYSVEC_PIPELINED(RESCHEDULE_OOB_VECTOR,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/idtentry.h:210:16: warning: no previous prototype for '__sysvec_timer_oob_ipi' [-Wmissing-prototypes]
     210 | __visible void __##func(struct pt_regs *regs)
         |                ^~
   arch/x86/kernel/irq_pipeline.c:345:1: note: in expansion of macro 'DEFINE_IDTENTRY_SYSVEC_PIPELINED'
     345 | DEFINE_IDTENTRY_SYSVEC_PIPELINED(TIMER_OOB_VECTOR,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/irq_pipeline.c:349:6: warning: no previous prototype for 'handle_irq_move_cleanup' [-Wmissing-prototypes]
     349 | void handle_irq_move_cleanup(struct irq_desc *desc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/handle_irq_move_cleanup +349 arch/x86/kernel/irq_pipeline.c

   340	
 > 341	DEFINE_IDTENTRY_SYSVEC_PIPELINED(RESCHEDULE_OOB_VECTOR,
   342					 sysvec_reschedule_oob_ipi)
   343	{ /* In-band handler is unused. */ }
   344	
   345	DEFINE_IDTENTRY_SYSVEC_PIPELINED(TIMER_OOB_VECTOR,
   346					 sysvec_timer_oob_ipi)
   347	{ /* In-band handler is unused. */ }
   348	
 > 349	void handle_irq_move_cleanup(struct irq_desc *desc)
   350	{
   351		if (on_pipeline_entry()) {
   352			/* 1. on receipt from hardware. */
   353			__ack_APIC_irq();
   354			handle_oob_irq(desc);
   355		} else {
   356			/* 2. in-band delivery. */
   357			__sysvec_irq_move_cleanup(NULL);
   358		}
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
