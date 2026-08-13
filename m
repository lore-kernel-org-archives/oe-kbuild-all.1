Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B79375F69
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610475; cv=none; b=mJWont5M0dXfMlaFAkLAVH5ornb+KF4gunOK6mpaRDPQAtQelKSmzAErOqwWj2QZO8AGaKS2pujhraPBhEsrXq/rfoRaLnnVZ/ffNebwfj/zq5vHpdvFeCnv1r7gka/P6FlHW/6dazkOmXLNvihVugC1UUERDP7IYm6Jky49No8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610475; c=relaxed/simple;
	bh=axPaLXDX+lgYoDVGEo+r3f7KgNflQKYBRe8EAZ82/jQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uUOVlBUchq9zsZR9QKPrOsIpIlkNvaRbQ2dboDBxUiwSxsPyDSaYjw00ukOS5SRmK7ab9qaw8vKjq44LIMuzEWxw0fXNypV9HDdITVPsN8j86TXUahIS5L4e7roJ443eTxTLo0WNRf0lNnu2CadcSzUb88rl3S2Rb6NXGWE9Uk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFDivFme; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFDivFme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786610474; x=1818146474;
  h=date:from:to:cc:subject:message-id;
  bh=axPaLXDX+lgYoDVGEo+r3f7KgNflQKYBRe8EAZ82/jQ=;
  b=JFDivFmeVJUrhR2WVE9NBBkPGT6y+SgrJpS2J+zjCZcNvDonxoEfPaFf
   MZcGu2+zssbBas0gDu8mAHj3HiNOHmjHG3v11IZFVWmg0huuhk8s6AlvG
   1rD/JKHPSeQFw+Pig6ZChnWblhOHyWht+fKFSapiRnuW66TrYvv2u58M0
   rS2Lroab3t/f7/VBaJFs0f0tpJa92KjXvozFfq8NYXdJiOyifmD2XPYH/
   sJw+JzZ66MNcuIsGGDerFfpB9AOPZBitDHaShYDFqM5EZ0NXcTDaPrDAp
   sPDN5y3n0VDXtRk8f9Rf3ZVACwvnH24o73TBGkRiVsK7noE2dstFXkOgW
   A==;
X-CSE-ConnectionGUID: QdFhlCnbTzyFZggs1D89qw==
X-CSE-MsgGUID: bR+x1f7CQWOdX/lYzqBPbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87304104"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87304104"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 01:41:11 -0700
X-CSE-ConnectionGUID: rwboz0C+ROuKTuakJH3SLA==
X-CSE-MsgGUID: ko8/rINRTMm148GAM8N2hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="263420678"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Aug 2026 01:41:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuQzr-00000000TPi-3lix;
	Thu, 13 Aug 2026 08:41:07 +0000
Date: Thu, 13 Aug 2026 16:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 272/272]
 arch/x86/kernel/traps.c:176:46: warning: format specifies type 'unsigned
 long' but the argument has type 'void *'
Message-ID: <202608131631.h2zoozHS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Idan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   9c40f45d2c22f05e45bc48b1d7be869adf7e473a
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [272/272] ANDROID: Add kiwi_fault_logging kernel parameter
config: x86_64-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131631.h2zoozHS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea395e4fe4db26920d57779ddae98eac6ba945d)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131631.h2zoozHS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131631.h2zoozHS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:357:9: note: previous definition is here
     357 | #define __SANITIZE_ADDRESS__ 1
         |         ^
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
   4 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
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
