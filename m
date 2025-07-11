Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0E2EAE5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 04:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752208482; cv=none; b=tBofS/4ufnze4IWvfrjQMzPGILcyLRCXPl2u/FfEQ8xZ6KAgDE0RzdOChk2lhxXRpJn4EG+3UOviWsDAyaIO5J1B/XPaZDHXIGSObs97cwn/SM3BuXrHS5ubKX4KLBGNxMf6BBO2rx9dAOlLyfhGAK5SR4gnR8L69+Shw24n8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752208482; c=relaxed/simple;
	bh=MK22sg89XlnSYp8eyclLApKr7lH/W6tcGeqMnKq43Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U5v7QvNwTEAlZWSMXjHfZZeeZTMguxmpDEEwZWTTRy2zy6ROih9/9GDkP9kGrk6eTET5JPhDrXYSojYSzsOzXQrI7isqUNkaXTDoTOqfq0wugO0d/EhMRNus5XSTh3+UueL/tl8gDctmqdyHZEibeqcUKeKWZv0MJbnDHKA+AmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8DYcnNh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8DYcnNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752208481; x=1783744481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MK22sg89XlnSYp8eyclLApKr7lH/W6tcGeqMnKq43Iw=;
  b=i8DYcnNhOJgaACk2JqGVGJWKM+hrIfgYvUkRU6rgbKy6B3Evzi53jekS
   315vC22m64imakIrb/n46PYja/MOP2k7KUqWmB/v+TkHtJUNBue0TJT35
   TrVqpn6U0Hv5ya0s02n59+abUXUbkCplPVhhfkUW3cJKQ4U/k+pnnHa+8
   HBuh5rORsxjcFpIo3vJHCras5TTE2/K+blkHcYsFWcDa/tWQ8OD4pOSf8
   Rb/klmhexZ+8RJ6VgksAQ26ePUPXQcbPOWgDDpoQgIZVSJbRCL0jmyOjk
   oXkKesdL9G/BrxMNgOpKXf06RxcDnQRz/bzkL6cbvYSVGPbBoSX9a50iP
   A==;
X-CSE-ConnectionGUID: H63SXs9ZS0ufK8Ec8Ty2OA==
X-CSE-MsgGUID: ZMtVfKC/Sl+/VdWlXIgdWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65851761"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="65851761"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 21:34:40 -0700
X-CSE-ConnectionGUID: Q28xVhfcQyW0K4WevK5T0Q==
X-CSE-MsgGUID: sfSURLv7Rk+W/wbXnuKBRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="160825441"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jul 2025 21:34:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua5T1-0005sX-39;
	Fri, 11 Jul 2025 04:34:35 +0000
Date: Fri, 11 Jul 2025 12:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 26/150] kernel/kexec_core.c:1138:2: warning:
 label 'Resume_console' defined but not used
Message-ID: <202507111233.6hEIDvp9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   bd79eb3668131377915b42d2feaeb8e829abe7e7
commit: fbb5aa47e7b06b935124ad4d171d468e48368398 [26/150] kexec_core: fix error code path in the KEXEC_JUMP flow
config: i386-buildonly-randconfig-001-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111233.6hEIDvp9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111233.6hEIDvp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111233.6hEIDvp9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kexec_core.c: In function 'kernel_kexec':
>> kernel/kexec_core.c:1138:2: warning: label 'Resume_console' defined but not used [-Wunused-label]
    1138 |  Resume_console:
         |  ^~~~~~~~~~~~~~


vim +/Resume_console +1138 kernel/kexec_core.c

7e99f8b69c11c1 Ricardo Ribalda       2023-01-04  1050  
2965faa5e03d1e Dave Young            2015-09-09  1051  /*
2965faa5e03d1e Dave Young            2015-09-09  1052   * Move into place and start executing a preloaded standalone
2965faa5e03d1e Dave Young            2015-09-09  1053   * executable.  If nothing was preloaded return an error.
2965faa5e03d1e Dave Young            2015-09-09  1054   */
2965faa5e03d1e Dave Young            2015-09-09  1055  int kernel_kexec(void)
2965faa5e03d1e Dave Young            2015-09-09  1056  {
2965faa5e03d1e Dave Young            2015-09-09  1057  	int error = 0;
2965faa5e03d1e Dave Young            2015-09-09  1058  
05c6257433b721 Valentin Schneider    2022-06-30  1059  	if (!kexec_trylock())
2965faa5e03d1e Dave Young            2015-09-09  1060  		return -EBUSY;
2965faa5e03d1e Dave Young            2015-09-09  1061  	if (!kexec_image) {
2965faa5e03d1e Dave Young            2015-09-09  1062  		error = -EINVAL;
2965faa5e03d1e Dave Young            2015-09-09  1063  		goto Unlock;
2965faa5e03d1e Dave Young            2015-09-09  1064  	}
2965faa5e03d1e Dave Young            2015-09-09  1065  
2965faa5e03d1e Dave Young            2015-09-09  1066  #ifdef CONFIG_KEXEC_JUMP
2965faa5e03d1e Dave Young            2015-09-09  1067  	if (kexec_image->preserve_context) {
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1068  		/*
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1069  		 * This flow is analogous to hibernation flows that occur
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1070  		 * before creating an image and before jumping from the
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1071  		 * restore kernel to the image one, so it uses the same
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1072  		 * device callbacks as those two flows.
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1073  		 */
2965faa5e03d1e Dave Young            2015-09-09  1074  		pm_prepare_console();
2965faa5e03d1e Dave Young            2015-09-09  1075  		error = freeze_processes();
2965faa5e03d1e Dave Young            2015-09-09  1076  		if (error) {
2965faa5e03d1e Dave Young            2015-09-09  1077  			error = -EBUSY;
2965faa5e03d1e Dave Young            2015-09-09  1078  			goto Restore_console;
2965faa5e03d1e Dave Young            2015-09-09  1079  		}
e9cec4487cb789 Marcos Paulo de Souza 2025-02-26  1080  		console_suspend_all();
2965faa5e03d1e Dave Young            2015-09-09  1081  		error = dpm_suspend_start(PMSG_FREEZE);
2965faa5e03d1e Dave Young            2015-09-09  1082  		if (error)
fbb5aa47e7b06b Rafael J. Wysocki     2025-07-10  1083  			goto Resume_devices;
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1084  		/*
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1085  		 * dpm_suspend_end() must be called after dpm_suspend_start()
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1086  		 * to complete the transition, like in the hibernation flows
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1087  		 * mentioned above.
2965faa5e03d1e Dave Young            2015-09-09  1088  		 */
2965faa5e03d1e Dave Young            2015-09-09  1089  		error = dpm_suspend_end(PMSG_FREEZE);
2965faa5e03d1e Dave Young            2015-09-09  1090  		if (error)
2965faa5e03d1e Dave Young            2015-09-09  1091  			goto Resume_devices;
2f1a6fbbef7781 Nicholas Piggin       2019-04-11  1092  		error = suspend_disable_secondary_cpus();
2965faa5e03d1e Dave Young            2015-09-09  1093  		if (error)
2965faa5e03d1e Dave Young            2015-09-09  1094  			goto Enable_cpus;
2965faa5e03d1e Dave Young            2015-09-09  1095  		local_irq_disable();
2965faa5e03d1e Dave Young            2015-09-09  1096  		error = syscore_suspend();
2965faa5e03d1e Dave Young            2015-09-09  1097  		if (error)
2965faa5e03d1e Dave Young            2015-09-09  1098  			goto Enable_irqs;
2965faa5e03d1e Dave Young            2015-09-09  1099  	} else
2965faa5e03d1e Dave Young            2015-09-09  1100  #endif
2965faa5e03d1e Dave Young            2015-09-09  1101  	{
2965faa5e03d1e Dave Young            2015-09-09  1102  		kexec_in_progress = true;
a119b4e5186c28 Joe LeVeque           2021-05-06  1103  		kernel_restart_prepare("kexec reboot");
2965faa5e03d1e Dave Young            2015-09-09  1104  		migrate_to_reboot_cpu();
7bb943806ff61e James Gowans          2023-12-13  1105  		syscore_shutdown();
2965faa5e03d1e Dave Young            2015-09-09  1106  
2965faa5e03d1e Dave Young            2015-09-09  1107  		/*
2965faa5e03d1e Dave Young            2015-09-09  1108  		 * migrate_to_reboot_cpu() disables CPU hotplug assuming that
2965faa5e03d1e Dave Young            2015-09-09  1109  		 * no further code needs to use CPU hotplug (which is true in
2965faa5e03d1e Dave Young            2015-09-09  1110  		 * the reboot case). However, the kexec path depends on using
2965faa5e03d1e Dave Young            2015-09-09  1111  		 * CPU hotplug again; so re-enable it here.
2965faa5e03d1e Dave Young            2015-09-09  1112  		 */
2965faa5e03d1e Dave Young            2015-09-09  1113  		cpu_hotplug_enable();
d42cc530b18db2 Pavel Tatashin        2019-12-04  1114  		pr_notice("Starting new kernel\n");
2965faa5e03d1e Dave Young            2015-09-09  1115  		machine_shutdown();
2965faa5e03d1e Dave Young            2015-09-09  1116  	}
2965faa5e03d1e Dave Young            2015-09-09  1117  
b2075dbb15d7ae Pavel Tatashin        2021-05-06  1118  	kmsg_dump(KMSG_DUMP_SHUTDOWN);
2965faa5e03d1e Dave Young            2015-09-09  1119  	machine_kexec(kexec_image);
2965faa5e03d1e Dave Young            2015-09-09  1120  
2965faa5e03d1e Dave Young            2015-09-09  1121  #ifdef CONFIG_KEXEC_JUMP
2965faa5e03d1e Dave Young            2015-09-09  1122  	if (kexec_image->preserve_context) {
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1123  		/*
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1124  		 * This flow is analogous to hibernation flows that occur after
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1125  		 * creating an image and after the image kernel has got control
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1126  		 * back, and in case the devices have been reset or otherwise
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1127  		 * manipulated in the meantime, it uses the device callbacks
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1128  		 * used by the latter.
dc6ffa6cd52d2c Rafael J. Wysocki     2025-01-09  1129  		 */
2965faa5e03d1e Dave Young            2015-09-09  1130  		syscore_resume();
2965faa5e03d1e Dave Young            2015-09-09  1131   Enable_irqs:
2965faa5e03d1e Dave Young            2015-09-09  1132  		local_irq_enable();
2965faa5e03d1e Dave Young            2015-09-09  1133   Enable_cpus:
2f1a6fbbef7781 Nicholas Piggin       2019-04-11  1134  		suspend_enable_secondary_cpus();
2965faa5e03d1e Dave Young            2015-09-09  1135  		dpm_resume_start(PMSG_RESTORE);
2965faa5e03d1e Dave Young            2015-09-09  1136   Resume_devices:
2965faa5e03d1e Dave Young            2015-09-09  1137  		dpm_resume_end(PMSG_RESTORE);
2965faa5e03d1e Dave Young            2015-09-09 @1138   Resume_console:

:::::: The code at line 1138 was first introduced by commit
:::::: 2965faa5e03d1e71e9ff9aa143fff39e0a77543a kexec: split kexec_load syscall from kexec core code

:::::: TO: Dave Young <dyoung@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
