Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5468A19E983
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727511909; cv=none; b=WzgBY5OtWy69aH04RGeC0sh6KTJqLnAtaqEyqJscc0E52ve3msz4pMHKjTp8Ia8p/pWyr++cTZFG7x4KxJF0TSSnEWSWAdrOs9EG9xoTjYnhAjeW+//iR3ISKqyHLQ81PgMHND7v5UkyE7c1dpoL0EN1J+NJy08ee9PqASeXUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727511909; c=relaxed/simple;
	bh=VkTGp38k7HHOoi3hkj3h+xPO1o2RMWfEmi+79U4+mQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hOUYTbca+fORccZ53V2pQrjxn7zHRMyYQcDFCfmUiCxOMj9s85IK+e1z109WfioITMWyS5r6j9xBNSuE+9gspt6Ua+VQHgOETnyY8Gx8SvjO4zH4IgwlCXzWZMjkv+Fc2Tdlj88JMZdS1WJZdj/+ecl8CpugJUjmIlGqB96XsO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3+CipAH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3+CipAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727511908; x=1759047908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VkTGp38k7HHOoi3hkj3h+xPO1o2RMWfEmi+79U4+mQM=;
  b=C3+CipAHM+BmduHSGg7j3EftKY6do1wTkIzynWUjssl80iW2GfimpoK+
   09oYkR/LB0N2kGewR/qkPh6x+By++RvYdRqXsPsXmuNFtRh/PhiTvilSb
   7Z5eGIxEfX8ON8tr8n6tvRnzD0QIC8dxhM7/s3vIQFn1ax1jeqq0o7GtJ
   bYXbPQIjTEe6+kao92bSulfr2aqhk5IcEk03f6qyaRVD0pmxfoZSfM0ne
   /8vDo1a9r51myxFC/h+2pNt3JzXtQw+mA8I2H8VVNluL3wAsjQPoDqDYJ
   0R97hvKZc5eQvVKtUrNoabj17BM3PHHSfu+yuIrRodig+nPLFP5BswYh0
   A==;
X-CSE-ConnectionGUID: HWQj3sRWRzOdRNjopE2VMQ==
X-CSE-MsgGUID: 2rETor2zT4mBs6rjRrJvBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30547194"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30547194"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 01:25:05 -0700
X-CSE-ConnectionGUID: eXjBy1rLQ2qoIdt0+nxGmw==
X-CSE-MsgGUID: T0PnsaiGSV+EvDT8NKG8ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103578909"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Sep 2024 01:25:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suSlC-000N21-06;
	Sat, 28 Sep 2024 08:25:02 +0000
Date: Sat, 28 Sep 2024 16:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 6/10] arch/x86/kernel/traps.c:328:21: error:
 implicit declaration of function '__do_kernel_cp_fault'; did you mean
 'get_kernel_nofault'?
Message-ID: <202409281647.V2rhpxRt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   4e155f6fbba48ed677042026d7732c6256ffa166
commit: 5bb9d6530a561f5bec514a4be368cb7c2e36a507 [6/10] x86/traps: Prepare for ENDBR poison UD1 usage
config: i386-randconfig-141-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281647.V2rhpxRt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281647.V2rhpxRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281647.V2rhpxRt-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/traps.c: In function 'handle_bug':
>> arch/x86/kernel/traps.c:328:21: error: implicit declaration of function '__do_kernel_cp_fault'; did you mean 'get_kernel_nofault'? [-Werror=implicit-function-declaration]
     328 |                 if (__do_kernel_cp_fault(regs)) {
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     get_kernel_nofault
   cc1: some warnings being treated as errors


vim +328 arch/x86/kernel/traps.c

   282	
   283	static noinstr bool handle_bug(struct pt_regs *regs)
   284	{
   285		bool handled = false;
   286		int ud_type, ud_len;
   287		s32 ud_imm;
   288	
   289		/*
   290		 * Normally @regs are unpoisoned by irqentry_enter(), but handle_bug()
   291		 * is a rare case that uses @regs without passing them to
   292		 * irqentry_enter().
   293		 */
   294		kmsan_unpoison_entry_regs(regs);
   295		ud_type = decode_bug(regs->ip, &ud_imm, &ud_len);
   296		if (ud_type == BUG_NONE)
   297			return handled;
   298	
   299		/*
   300		 * All lies, just get the WARN/BUG out.
   301		 */
   302		instrumentation_begin();
   303		/*
   304		 * Since we're emulating a CALL with exceptions, restore the interrupt
   305		 * state to what it was at the exception site.
   306		 */
   307		if (regs->flags & X86_EFLAGS_IF)
   308			raw_local_irq_enable();
   309	
   310		switch (ud_type) {
   311		case BUG_UD2:
   312			if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
   313			    handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
   314				regs->ip += ud_len;
   315				handled = true;
   316			}
   317			break;
   318	
   319		case BUG_UD1_UBSAN:
   320			if (IS_ENABLED(CONFIG_UBSAN_TRAP)) {
   321				pr_crit("%s at %pS\n",
   322					report_ubsan_failure(regs, ud_imm),
   323					(void *)regs->ip);
   324			}
   325			break;
   326	
   327		case BUG_UD1_ENDBR:
 > 328			if (__do_kernel_cp_fault(regs)) {
   329				regs->ip += ud_len;
   330				handled = true;
   331			}
   332			break;
   333	
   334		default:
   335			break;
   336		}
   337	
   338		if (regs->flags & X86_EFLAGS_IF)
   339			raw_local_irq_disable();
   340		instrumentation_end();
   341	
   342		return handled;
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
