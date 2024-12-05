Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2771AD9F9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 21:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733435169; cv=none; b=A5qFzJ4KY9ccnsvCULX155+N20W/528uxGQY3gLqifvYDTt8qpZuau+mnlIi8ZxgDbfePfcxQBvvQBPS7jDM5tnVE/kWgnnZCWXEdVfMaMYzy8timEmch2YE6YKPF8rKiQdyjOj+ZR+BGvRcPsjL1KD9ZVHZsNziTw36MGMaLwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733435169; c=relaxed/simple;
	bh=OXNFQnjC2shmPnNORZOcwFjR10KILf37jpo44VPsxPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frM5S1xoHXlT/U6B2d1WV/wZzqES0hZA924nWKcxPvzOakPMpqC4ihsRxdTaq21pIcb7Bu4KW7SAUqizGd8sKZSkw3tdvh8IMd2cAHkKL87mHfJlgN8Q3hM3OdvtmWvPCTTrYj3qYrbZXqlVmYunVFeeV3NSkEU9IT0AxwB0MNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXYhGF3I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXYhGF3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733435164; x=1764971164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OXNFQnjC2shmPnNORZOcwFjR10KILf37jpo44VPsxPE=;
  b=UXYhGF3IFZ77iyY83f1d6/VOLQscSBhJbiPvbW4uFxB9OPtQmBmcjZZa
   XVWDmi2hm8D1qVMGDiIPJTaqL5SuCrMy5NHQ5h+3ZFNHfhHRMXTb+/yzQ
   9EgrYj4O1absS3X8bp4N+Bz7zmyyVpqjHcjD8I8YtGRtVqDM/l116guN/
   zLcIBjTGZokeP12pLaA5RsCF83F0W1eFcDFgU6LKOl2xR1DRSIN5CtT0r
   bcumaArutEWn8m27jJMSY463aQi+oaIGCck43WVsuzlLyWWKoNBQWnYfx
   22QE6hw39uzns0JKzkk9L1MORf/8GXvsfmVtZIHKITrDkZZPzsugYZYlK
   g==;
X-CSE-ConnectionGUID: etAxR5YyQma3ZdXpcco4Jw==
X-CSE-MsgGUID: Rh6AbXPoR4yjhgJiZvyxCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44440867"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="44440867"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 13:46:04 -0800
X-CSE-ConnectionGUID: txblCva2SEWmcOfYMpBAvA==
X-CSE-MsgGUID: Vi9lnCxxSbGchen1V3aJjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="94583665"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Dec 2024 13:46:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJJfc-0000Pz-0m;
	Thu, 05 Dec 2024 21:46:00 +0000
Date: Fri, 6 Dec 2024 05:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/7] kexec: Hack and abuse crashkernel for the
 kstate's migration stream
Message-ID: <202412060553.jBsTWSit-lkp@intel.com>
References: <20241002160722.20025-3-arbn@yandex-team.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002160722.20025-3-arbn@yandex-team.com>

Hi Andrey,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master tip/x86/core v6.13-rc1 next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Ryabinin/kstate-Add-kstate-a-mechanism-to-migrate-some-kernel-state-across-kexec/20241206-032658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241002160722.20025-3-arbn%40yandex-team.com
patch subject: [RFC PATCH 2/7] kexec: Hack and abuse crashkernel for the kstate's migration stream
config: m68k-mvme16x_defconfig (https://download.01.org/0day-ci/archive/20241206/202412060553.jBsTWSit-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060553.jBsTWSit-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060553.jBsTWSit-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/kexec_core.c: In function 'kernel_kexec':
>> kernel/kexec_core.c:1051:17: error: implicit declaration of function 'arch_kexec_unprotect_crashkres' [-Wimplicit-function-declaration]
    1051 |                 arch_kexec_unprotect_crashkres();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_kexec_unprotect_crashkres +1051 kernel/kexec_core.c

   990	
   991	/*
   992	 * Move into place and start executing a preloaded standalone
   993	 * executable.  If nothing was preloaded return an error.
   994	 */
   995	int kernel_kexec(void)
   996	{
   997		int error = 0;
   998	
   999		if (!kexec_trylock())
  1000			return -EBUSY;
  1001		if (!kexec_image) {
  1002			error = -EINVAL;
  1003			goto Unlock;
  1004		}
  1005	
  1006	#ifdef CONFIG_KEXEC_JUMP
  1007		if (kexec_image->preserve_context) {
  1008			pm_prepare_console();
  1009			error = freeze_processes();
  1010			if (error) {
  1011				error = -EBUSY;
  1012				goto Restore_console;
  1013			}
  1014			suspend_console();
  1015			error = dpm_suspend_start(PMSG_FREEZE);
  1016			if (error)
  1017				goto Resume_console;
  1018			/* At this point, dpm_suspend_start() has been called,
  1019			 * but *not* dpm_suspend_end(). We *must* call
  1020			 * dpm_suspend_end() now.  Otherwise, drivers for
  1021			 * some devices (e.g. interrupt controllers) become
  1022			 * desynchronized with the actual state of the
  1023			 * hardware at resume time, and evil weirdness ensues.
  1024			 */
  1025			error = dpm_suspend_end(PMSG_FREEZE);
  1026			if (error)
  1027				goto Resume_devices;
  1028			error = suspend_disable_secondary_cpus();
  1029			if (error)
  1030				goto Enable_cpus;
  1031			local_irq_disable();
  1032			error = syscore_suspend();
  1033			if (error)
  1034				goto Enable_irqs;
  1035		} else
  1036	#endif
  1037		{
  1038			kexec_in_progress = true;
  1039			kernel_restart_prepare("kexec reboot");
  1040			migrate_to_reboot_cpu();
  1041			syscore_shutdown();
  1042	
  1043			/*
  1044			 * migrate_to_reboot_cpu() disables CPU hotplug assuming that
  1045			 * no further code needs to use CPU hotplug (which is true in
  1046			 * the reboot case). However, the kexec path depends on using
  1047			 * CPU hotplug again; so re-enable it here.
  1048			 */
  1049			cpu_hotplug_enable();
  1050			pr_notice("Starting new kernel\n");
> 1051			arch_kexec_unprotect_crashkres();
  1052			machine_shutdown();
  1053		}
  1054	
  1055		if (kexec_image->type & KEXEC_TYPE_MIGRATE)
  1056			save_migrate_state(kexec_image->mig_stream);
  1057	
  1058		kmsg_dump(KMSG_DUMP_SHUTDOWN);
  1059		machine_kexec(kexec_image);
  1060	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
