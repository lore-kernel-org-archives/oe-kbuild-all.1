Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0073815C8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 04:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675571169; x=1707107169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hn9AZYbueDZmGaEUKwYJFplPcBdbf1zWgNkRWwIojI4=;
  b=FJ/hdy1i1ToPxfOEa9Rrxnr5n2vGeFdUZBjozjrTsDheLoV2XTXvXOqJ
   IB3S//WIXixNZY94GueKQ1uxY3u/rrx0NZU0zUclj3BDmB0kuyScaAfET
   0p17K9fmt7mA/Q3Ya72XRVjZ1UsBmFMAGEsZ4XG6RL7JYz44CoGw18Pjm
   bctg+1FYDnzYSzqoSZW1ujUYJ5jrCIXc0zGUkvvbIEtTAQxsDZW2UtfaG
   posXBk9n6LKlMzNRQsrB47z7nVQdrCRH1Oy7kO9/66H9n9feFkE+mTaRc
   UX/0uMYqo8YarF8PRFsbHdeqg7j08ZTa/Jnh57n+uvknQADTm+2L3I1z4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="330309304"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="330309304"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 20:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="668077271"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="668077271"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Feb 2023 20:26:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOWbP-0001k0-2k;
	Sun, 05 Feb 2023 04:26:07 +0000
Date: Sun, 5 Feb 2023 12:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:virtual_cpu_hotplug/rfc/v1 2/32]
 arch/x86/kernel/acpi/boot.c:821:15: error: implicit declaration of function
 'acpi_register_lapic'; did you mean 'acpi_register_ioapic'?
Message-ID: <202302051237.XWuXpEWo-lkp@intel.com>
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
commit: 2be7d920d7bc2cca18c93b27d9bca407309b2c34 [2/32] ACPI: Move ACPI_HOTPLUG_CPU to be enabled per architecture
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230205/202302051237.XWuXpEWo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=2be7d920d7bc2cca18c93b27d9bca407309b2c34
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse virtual_cpu_hotplug/rfc/v1
        git checkout 2be7d920d7bc2cca18c93b27d9bca407309b2c34
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/acpi/boot.c: In function 'acpi_map_cpu':
>> arch/x86/kernel/acpi/boot.c:821:15: error: implicit declaration of function 'acpi_register_lapic'; did you mean 'acpi_register_ioapic'? [-Werror=implicit-function-declaration]
     821 |         cpu = acpi_register_lapic(physid, acpi_id, ACPI_MADT_ENABLED);
         |               ^~~~~~~~~~~~~~~~~~~
         |               acpi_register_ioapic
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_CPU
   Depends on [n]: ACPI [=y] && ACPI_PROCESSOR [=y] && HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y]


vim +821 arch/x86/kernel/acpi/boot.c

009cbadb6e9364 arch/x86/kernel/acpi/boot.c  Sam Ravnborg     2008-02-01  815  
febf2407418a2d arch/x86/kernel/acpi/boot.c  Vitaly Kuznetsov 2017-02-06  816  int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 acpi_id,
febf2407418a2d arch/x86/kernel/acpi/boot.c  Vitaly Kuznetsov 2017-02-06  817  		 int *pcpu)
^1da177e4c3f41 arch/i386/kernel/acpi/boot.c Linus Torvalds   2005-04-16  818  {
73fea175303926 arch/i386/kernel/acpi/boot.c Ashok Raj        2006-09-26  819  	int cpu;
ee943a82b69745 arch/x86/kernel/acpi/boot.c  Rusty Russell    2008-12-31  820  
febf2407418a2d arch/x86/kernel/acpi/boot.c  Vitaly Kuznetsov 2017-02-06 @821  	cpu = acpi_register_lapic(physid, acpi_id, ACPI_MADT_ENABLED);
7e1f85f96def94 arch/x86/kernel/acpi/boot.c  Jiang Liu        2013-09-02  822  	if (cpu < 0) {
14fad24d0520c6 arch/x86/kernel/acpi/boot.c  Heiner Kallweit  2021-05-13  823  		pr_info("Unable to map lapic to logical cpu number\n");
7e1f85f96def94 arch/x86/kernel/acpi/boot.c  Jiang Liu        2013-09-02  824  		return cpu;
73fea175303926 arch/i386/kernel/acpi/boot.c Ashok Raj        2006-09-26  825  	}
73fea175303926 arch/i386/kernel/acpi/boot.c Ashok Raj        2006-09-26  826  
d8191fa4a33fdc arch/x86/kernel/acpi/boot.c  Alex Chiang      2010-02-22  827  	acpi_processor_set_pdc(handle);
0271f91003d370 arch/x86/kernel/acpi/boot.c  Haicheng Li      2010-02-04  828  	acpi_map_cpu2node(handle, cpu, physid);
73fea175303926 arch/i386/kernel/acpi/boot.c Ashok Raj        2006-09-26  829  
73fea175303926 arch/i386/kernel/acpi/boot.c Ashok Raj        2006-09-26  830  	*pcpu = cpu;
7e1f85f96def94 arch/x86/kernel/acpi/boot.c  Jiang Liu        2013-09-02  831  	return 0;
^1da177e4c3f41 arch/i386/kernel/acpi/boot.c Linus Torvalds   2005-04-16  832  }
d02dc27db0dc74 arch/x86/kernel/acpi/boot.c  Hanjun Guo       2015-01-04  833  EXPORT_SYMBOL(acpi_map_cpu);
^1da177e4c3f41 arch/i386/kernel/acpi/boot.c Linus Torvalds   2005-04-16  834  

:::::: The code at line 821 was first introduced by commit
:::::: febf2407418a2d6c042fcd77b206040449cb9a70 x86/ACPI: keep x86_cpu_to_acpiid mapping valid on CPU hotplug

:::::: TO: Vitaly Kuznetsov <vkuznets@redhat.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
