Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FD31ABED9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275057; cv=none; b=PhiNiEaks4nccCUDNMTPNpujCHKMfSfSnBLQKifdKQjBNiqS38WcPe3oe0Q0T3TfM0oeVnJFW3GQ6CHkupoZh/NGWoEmWptduBvsZ5bgcw+DgXd7tBjE7GQCxndEP89GNFYsbO2/VLp40LFo/DR6NHf/XZ62aUL4kx/J4MOmJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275057; c=relaxed/simple;
	bh=WAWAQKYuyBa6o67rIp015Wh7TWQ+crU5mDCn8JpAQjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L6/JVVpKeahGGp+DwQmCflU08JZb8fDimTR2gTNroQ48isUykEK9z8L6ZflHEHr53eZna+/Cmi9f6lY0+5FogdgJke3Tyx7G1jNJKphXdkik2HLOtT9lpPaOONr2TXULls+ap2ITxs6zUzCeRzQtAbt6IxV9adbTZUEHzC5QWHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhPaKtum; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhPaKtum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275056; x=1782811056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WAWAQKYuyBa6o67rIp015Wh7TWQ+crU5mDCn8JpAQjQ=;
  b=FhPaKtumLXpPxGTtQG5xZooW8bNVVsqDxzztikrb5GtUI19vbPqA+4rJ
   QS6NjT/tWyW70xq6iOztIMvRlKf6EA9E/eqMq3rDzKikn7dzeMIRoxQ67
   Tb7VCFyNmcxI9RvswYl/2R8wFi/77PfK1GHL2TnxZc5ztums/hdm0BUK6
   8eGXAxaISPxVgbBiCix4DUgxLpSYw4XVt6bWx7t72i2hfbd7HsyV1BqXu
   TfteJuKAUVuNLUXrKKYjt4q4CrCs7N46NEzPx5NP8OOLp96smK5LuJ6Sj
   iauLnt75yUsVuz/m8lKabiKRFaAOr7bGIxyPooLOjE+GcUKk1LtLdY1iy
   Q==;
X-CSE-ConnectionGUID: MSXrphVCRxOKw/5tcrd5Yg==
X-CSE-MsgGUID: HDrHWEwMSNGHPj3HnjD9Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53456590"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53456590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:17:35 -0700
X-CSE-ConnectionGUID: Rbi147cYTh2ZYLHkSDbZrQ==
X-CSE-MsgGUID: W21qZr8pTFOdikD7l/Nl3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152888907"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 30 Jun 2025 02:17:33 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWAdn-0001AR-1C;
	Mon, 30 Jun 2025 09:17:31 +0000
Date: Mon, 30 Jun 2025 11:17:12 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 131/131]
 arch/x86/kernel/traps.c:176:46: warning: format specifies type 'unsigned
 long' but the argument has type 'void *'
Message-ID: <202506301155.9qrWrYLA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   a24db0101fdd172c3b06b30ba59b614e686ff1e7
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [131/131] ANDROID: Add kiwi_fault_logging kernel parameter
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250630/202506301155.9qrWrYLA-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301155.9qrWrYLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301155.9qrWrYLA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/traps.c:176:46: warning: format specifies type 'unsigned long' but the argument has type 'void *' [-Wformat]
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                                                                ~~~
     176 |                         current->comm, task_pid_nr(current), str, addr, trapnr, signr,
         |                                                                   ^~~~
>> arch/x86/kernel/traps.c:176:60: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                                                                                     ~~~
         |                                                                                     %x
     176 |                         current->comm, task_pid_nr(current), str, addr, trapnr, signr,
         |                                                                                 ^~~~~
   arch/x86/kernel/traps.c:177:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                                                                                                ~~~
         |                                                                                                %x
     176 |                         current->comm, task_pid_nr(current), str, addr, trapnr, signr,
     177 |                         sicode, (void *)regs->ip, (void *)regs->sp, error_code);
         |                         ^~~~~~
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +176 arch/x86/kernel/traps.c

   170	
   171	static void do_error_trap(struct pt_regs *regs, long error_code, char *str,
   172		unsigned long trapnr, int signr, int sicode, void __user *addr)
   173	{
   174		if (unlikely(kiwi_fault_logging)) {
   175		    printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
 > 176				current->comm, task_pid_nr(current), str, addr, trapnr, signr,
   177				sicode, (void *)regs->ip, (void *)regs->sp, error_code);
   178		}
   179		RCU_LOCKDEP_WARN(!rcu_is_watching(), "entry code didn't wake RCU");
   180	
   181		if (notify_die(DIE_TRAP, str, regs, error_code, trapnr, signr) !=
   182				NOTIFY_STOP) {
   183			cond_local_irq_enable(regs);
   184			do_trap(trapnr, signr, str, regs, error_code, sicode, addr);
   185			cond_local_irq_disable(regs);
   186		}
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
