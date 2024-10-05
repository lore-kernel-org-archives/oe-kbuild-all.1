Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5864981ACA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728139275; cv=none; b=e1h0jp5q6f76g6kqRZdR0ufjYqvYbPLAGiP9bK8OtZbD5MxX6ZqFUkwXV1OeUfVi5z588RHqoMCGkb2afbWsYMGPDTi0M1ZxkPmI8oMo1kexd1ILMCaAhgRUcC2rOALRCRJxCYbTUOOyNkvcud6kGId4il6/hc7bD/L4DgVioT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728139275; c=relaxed/simple;
	bh=OTlBCwqeBgAo4eOhU4CdRZmlYsVkPz4ppAjmj+QQ+0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aA57PDSt+2SQFrDLvkea8I0E2mLwLrPgsX4OCECY4oPXaTXa3D6f4Klp1RVGw1z/gFPmXk/aiwWEC3yNP8fRBa/BXHqSxqb357heu4LxEcXuz/P6O8EkjrGJg92K5rBEIPeSn99y7NDcfPtKsdWnKV/9jTDiYr86Noslwv2vlfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FljgVGFU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FljgVGFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728139273; x=1759675273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTlBCwqeBgAo4eOhU4CdRZmlYsVkPz4ppAjmj+QQ+0I=;
  b=FljgVGFUQsNsqGnPgJzeSfapMX/HGCjIxLxgMklk1f5IV1vBrLRXFTU1
   NWEBKTgviPmTqlDR4+PK/gpB8/XSMQfb7sISb6wc4rcq6SSsnhb3OyHqZ
   mMSY83tMrOtwr2gtWLY29nhV/BWMlKiVp5EMghD+iALtNpM+fLgg1FwiF
   6nxeTqzS1OLg3TZOpSRBPc/Nc17X6cp0+XFOmaYfN4am7lhehaZlP/auO
   eysaFZI+G4Xxc76XSo6HqSvBQYL+CCoAwjQQNcema0M/cX03HcYHHy0Fs
   ZvTKaiYWtdeN8qeN+mcgYzJ7G6QWPnC5+/9R7B83Yp1VaRjDnY2+qq49X
   w==;
X-CSE-ConnectionGUID: Blf3T+3RS362F0JyXgBqCA==
X-CSE-MsgGUID: a+SXtOBGSfiqTYT8XeRDFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27222283"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="27222283"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 07:41:13 -0700
X-CSE-ConnectionGUID: R5HkHg6qQjOJyehT2fbd4g==
X-CSE-MsgGUID: 46LJodXFRgWHb9WJjqiEFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="75420653"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Oct 2024 07:41:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx5y1-00031s-2c;
	Sat, 05 Oct 2024 14:41:09 +0000
Date: Sat, 5 Oct 2024 22:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/7] kexec: Hack and abuse crashkernel for the
 kstate's migration stream
Message-ID: <202410052215.KmsvZJWe-lkp@intel.com>
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

[auto build test ERROR on tip/x86/core]
[also build test ERROR on akpm-mm/mm-everything akpm-mm/mm-nonmm-unstable linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Ryabinin/kstate-Add-kstate-a-mechanism-to-migrate-some-kernel-state-across-kexec/20241003-001223
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20241002160722.20025-3-arbn%40yandex-team.com
patch subject: [RFC PATCH 2/7] kexec: Hack and abuse crashkernel for the kstate's migration stream
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410052215.KmsvZJWe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410052215.KmsvZJWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410052215.KmsvZJWe-lkp@intel.com/

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
