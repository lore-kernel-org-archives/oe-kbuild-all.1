Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F6423DC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 20:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675544038; x=1707080038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e7hraJRaAhZ0sKB7m5JO/FqU/0lkCoyYvpC1vkUs/tY=;
  b=ZtVc+kP78+Xp+VFVbaKVEWgd3pjNiy0eFg02jM7FWDrEhUsHV79AgKRK
   z38CauxWUk/SzoJZQ52k8lWExgP6GqU2RQ3UfUbFh9gepRLVspFpiS0c2
   sw5h7lUq6GNSOEvudfNiO9bnJwYSRptqMDDR/hbPbUCbp2dSZAdFy9WNr
   v4F/JRE9lQIcBrRqRNejx9mnIkrRzNYQOaHJInxk0EawfVS3ZcKX7BpwF
   lkgQMkip6yBGrCScWbMrCmeLk/jkVqIAVJSIsm7nhf/nFg53Xe83XnMis
   Boj79+ZLycQDyw95320dE59JpusvebwIi9NG0XGZUoxxTKVbpJmxzwn4/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309322916"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309322916"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 12:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="754843151"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="754843151"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 12:53:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOPXn-0001WW-25;
	Sat, 04 Feb 2023 20:53:55 +0000
Date: Sun, 5 Feb 2023 04:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:virtual_cpu_hotplug/rfc/v1 4/32]
 arch/x86/kernel/topology.c:147:19: error: static declaration of
 'arch_register_cpu' follows non-static declaration
Message-ID: <202302050424.nhax1DdC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git virtual_cpu_hotplug/rfc/v1
head:   81295db7555df74bd02dab0b7e87b512d3a3de34
commit: 7ced3bbe6b69329395d605c948c5fa54696ad552 [4/32] drivers: base: Allow parts of GENERIC_CPU_DEVICES to be overridden
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230205/202302050424.nhax1DdC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=7ced3bbe6b69329395d605c948c5fa54696ad552
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse virtual_cpu_hotplug/rfc/v1
        git checkout 7ced3bbe6b69329395d605c948c5fa54696ad552
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kernel/topology.c:147:19: error: static declaration of 'arch_register_cpu' follows non-static declaration
     147 | static int __init arch_register_cpu(int num)
         |                   ^~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/cpu.h:6,
                    from arch/x86/kernel/topology.c:36:
   include/linux/cpu.h:78:12: note: previous declaration of 'arch_register_cpu' with type 'int(int)'
      78 | extern int arch_register_cpu(int cpu);
         |            ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_CPU
   Depends on [n]: ACPI [=y] && ACPI_PROCESSOR [=y] && HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y]


vim +/arch_register_cpu +147 arch/x86/kernel/topology.c

271eb5c588e5d0 arch/x86/kernel/topology.c        Jaswinder Singh Rajput 2009-03-21  146  
d987402695f16a arch/x86/kernel/topology.c        Alexander van Heukelum 2008-02-01 @147  static int __init arch_register_cpu(int num)
3eaf5efae72b33 arch/x86/kernel/topology.c        Sam Ravnborg           2008-01-30  148  {
3eaf5efae72b33 arch/x86/kernel/topology.c        Sam Ravnborg           2008-01-30  149  	return register_cpu(&per_cpu(cpu_devices, num).cpu, num);
3eaf5efae72b33 arch/x86/kernel/topology.c        Sam Ravnborg           2008-01-30  150  }
^1da177e4c3f41 arch/i386/mach-default/topology.c Linus Torvalds         2005-04-16  151  #endif /* CONFIG_HOTPLUG_CPU */
^1da177e4c3f41 arch/i386/mach-default/topology.c Linus Torvalds         2005-04-16  152  

:::::: The code at line 147 was first introduced by commit
:::::: d987402695f16ae33999d7315b915099d64616d4 x86: avoid section mismatch involving arch_register_cpu

:::::: TO: Alexander van Heukelum <heukelum@mailshack.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
