Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225123DC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 22:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675549620; x=1707085620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wSUiLN+zAckjh1PcdfxLKQeRm+ldsl69iVofptW3O5U=;
  b=MZ9ntxcIVn6PcV5Mf1itMGj6psv5EoqxuqPgQh8x/J7UUOitfQVENXvN
   8hkzSdK8srJOrOGUn4PotuMCse9oF359iJBKjIwQtdbSVwqg18FZajzdJ
   nPvujXzyFhuehXDxAL7fomyGnRx4bfdE7R/l8GUKipvuk/vSx4fFJYajJ
   jSiwJ5rBTXKe19kB3pJ4oG+kSG7nk0pvkpqzPEeCje7ywLq9ZeGSImYix
   N7giGfaweLVuZGyYEB4T0oJ5Lsn4wl7n+8UFzrEauRvrKVNOuXLniKE7Q
   J58lMPCyZ0WRysbbS1ugbWfZXpXPmb8iuGTr1s+ENPVROJqrI9ib3SToi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393593141"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="393593141"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 14:26:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="911530871"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="911530871"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Feb 2023 14:26:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOQzp-0001Ye-32;
	Sat, 04 Feb 2023 22:26:57 +0000
Date: Sun, 5 Feb 2023 06:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:virtual_cpu_hotplug/rfc/v1 8/32]
 arch/x86/kernel/topology.c:147:55: error: 'struct cpu' has no member named
 'cpu'
Message-ID: <202302050624.JbhrzRBk-lkp@intel.com>
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
commit: bbbbfae28e723520ab31d000146207547cc62124 [8/32] x86/topology: Switch over to GENERIC_CPU_DEVICES
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230205/202302050624.JbhrzRBk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=bbbbfae28e723520ab31d000146207547cc62124
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse virtual_cpu_hotplug/rfc/v1
        git checkout bbbbfae28e723520ab31d000146207547cc62124
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/topology.c:145:19: error: static declaration of 'arch_register_cpu' follows non-static declaration
     145 | static int __init arch_register_cpu(int num)
         |                   ^~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/cpu.h:6,
                    from arch/x86/kernel/topology.c:36:
   include/linux/cpu.h:78:12: note: previous declaration of 'arch_register_cpu' with type 'int(int)'
      78 | extern int arch_register_cpu(int cpu);
         |            ^~~~~~~~~~~~~~~~~
   arch/x86/kernel/topology.c: In function 'arch_register_cpu':
>> arch/x86/kernel/topology.c:147:55: error: 'struct cpu' has no member named 'cpu'
     147 |         return register_cpu(&per_cpu(cpu_devices, num).cpu, num);
         |                                                       ^
   At top level:
   arch/x86/kernel/topology.c:145:19: warning: 'arch_register_cpu' defined but not used [-Wunused-function]
     145 | static int __init arch_register_cpu(int num)
         |                   ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_CPU
   Depends on [n]: ACPI [=y] && ACPI_PROCESSOR [=y] && HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y]


vim +147 arch/x86/kernel/topology.c

271eb5c588e5d0 Jaswinder Singh Rajput 2009-03-21  144  
d987402695f16a Alexander van Heukelum 2008-02-01 @145  static int __init arch_register_cpu(int num)
3eaf5efae72b33 Sam Ravnborg           2008-01-30  146  {
3eaf5efae72b33 Sam Ravnborg           2008-01-30 @147  	return register_cpu(&per_cpu(cpu_devices, num).cpu, num);

:::::: The code at line 147 was first introduced by commit
:::::: 3eaf5efae72b33bc6132e9590e5d4bf11532f8c4 x86: fix section mismatch warning in topology.c

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
