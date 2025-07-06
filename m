Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913571B0F33
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751798441; cv=none; b=GM+P4XT0zRVNzo6EaF6khw8W2VnWVMYbR70N9lZ6Bo/bqRX2k4wOAStghoh3+OlAsGE9y2f3QIuGhG/bqdIwz9WXEXLViX6Bz2vgTc1Go/cmjD3np+q46Zet0KfC7MYgH4eRL6wnaO3Ie4K1L+ecnzXnbH2fPRq+HbT1tQNuwnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751798441; c=relaxed/simple;
	bh=HqAyMwPyW56QrHO3BBoqdNNU6l8iljt0LyR4+8CP0g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CL+LvYQL8hqHYOwbm5ZsiiTNUYlddnITgaKLhbhQOzWtOf9YsMdW1QUt24SDPjie0Q7MOjUHCkOsov+9SPRMkycjXZ1j0fRAr9WEIn6yk4HBkrYZ9tnB4S7vVwO9KV+rh4w3VuwJ8kZdl5RlCwClTxu22jviNCiBHOP31YjXagI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mp69Urjs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mp69Urjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751798439; x=1783334439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HqAyMwPyW56QrHO3BBoqdNNU6l8iljt0LyR4+8CP0g4=;
  b=Mp69UrjsxFLg3somM8pg+fIeRTJJquikglFLGgk6WXbq5dn0nzpoq1hZ
   uxtkSoDUMYBDESCL2FDwk0cQego4gQ2SQrk3geje4qtisyHAhOEmqEF1U
   vq++4XLb7+cqaorGl416zbcTZ4zlf0rBkP1DLd2bIOv5nRUr9M63w47QL
   IoEcaU+Q/kiFbI6RN9/OVHESCELG2ACnRx6fpAcBBY16KWnwx/Tog2/hd
   Ktt3Gx6drfmrpDUbQF6IRGhhPdYgvXvkEhBNrp0Cj26aIpycG/TLELR9o
   Nx/wZCM7XKcbIUgsEb1FpkXYKG366tYZLnYCkwnWyzhrkPvhULLvCk0Ba
   Q==;
X-CSE-ConnectionGUID: psNLYTmKSc2AANDw/QeIGw==
X-CSE-MsgGUID: ooKlnDGlQ5qj6Bzsgwl6ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54161970"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54161970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 03:40:39 -0700
X-CSE-ConnectionGUID: Yl1zdkQ6RxSLt2vs5E0sdQ==
X-CSE-MsgGUID: qLixIAK/T4qr2XiUOYm8qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="154612592"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jul 2025 03:40:37 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYMnT-00051X-2e;
	Sun, 06 Jul 2025 10:40:35 +0000
Date: Sun, 6 Jul 2025 18:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:test 19/20] arch/arm64/kernel/process.c:254:38:
 error: 'struct pt_regs' has no member named 'tpidr_el0'
Message-ID: <202507061818.c1EBHJrV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git test
head:   8b1e1464468a7008b34dfc6a7e6c78717fc6f780
commit: d5db10c9b184fff42b765bf07ae22ff84fd538f7 [19/20] HACK: write to fields instead of regs
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250706/202507061818.c1EBHJrV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061818.c1EBHJrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061818.c1EBHJrV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/process.c: In function 'tls_thread_flush':
>> arch/arm64/kernel/process.c:254:38: error: 'struct pt_regs' has no member named 'tpidr_el0'
     254 |                 task_pt_regs(current)->tpidr_el0 = 0;
         |                                      ^~
>> arch/arm64/kernel/process.c:270:46: error: 'struct pt_regs' has no member named 'tpidrro_el0'
     270 |                         task_pt_regs(current)->tpidrro_el0 = 0;
         |                                              ^~
   arch/arm64/kernel/process.c: In function 'tls_preserve_current_state':
   arch/arm64/kernel/process.c:528:64: error: 'struct pt_regs' has no member named 'tpidr_el0'
     528 |                 *task_user_tls(current) = task_pt_regs(current)->tpidr_el0;
         |                                                                ^~
   arch/arm64/kernel/process.c: In function 'tls_thread_switch':
   arch/arm64/kernel/process.c:541:46: error: 'struct pt_regs' has no member named 'tpidrro_el0'
     541 |                         task_pt_regs(current)->tpidrro_el0 = next->thread.uw.tp_value;
         |                                              ^~
   arch/arm64/kernel/process.c:546:46: error: 'struct pt_regs' has no member named 'tpidrro_el0'
     546 |                         task_pt_regs(current)->tpidrro_el0 = 0;
         |                                              ^~
   arch/arm64/kernel/process.c:552:38: error: 'struct pt_regs' has no member named 'tpidr_el0'
     552 |                 task_pt_regs(current)->tpidr_el0 = *task_user_tls(next);
         |                                      ^~


vim +254 arch/arm64/kernel/process.c

   250	
   251	static void tls_thread_flush(void)
   252	{
   253		if (IS_ENABLED(CONFIG_DYNAMIC_STACK))
 > 254			task_pt_regs(current)->tpidr_el0 = 0;
   255		else
   256			write_sysreg(0, tpidr_el0);
   257		if (system_supports_tpidr2())
   258			write_sysreg_s(0, SYS_TPIDR2_EL0);
   259	
   260		if (is_compat_task()) {
   261			current->thread.uw.tp_value = 0;
   262	
   263			/*
   264			 * We need to ensure ordering between the shadow state and the
   265			 * hardware state, so that we don't corrupt the hardware state
   266			 * with a stale shadow state during context switch.
   267			 */
   268			barrier();
   269			if (IS_ENABLED(CONFIG_DYNAMIC_STACK))
 > 270				task_pt_regs(current)->tpidrro_el0 = 0;
   271			else
   272				write_sysreg(0, tpidrro_el0);
   273		}
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
