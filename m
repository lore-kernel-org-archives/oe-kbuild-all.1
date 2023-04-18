Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE7215B6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 02:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681785860; x=1713321860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3kYZJAmhFGChXMZRwBR2AP1Hk/jd3oBvcZ5WOl+fJnY=;
  b=MRtE98DQZ0ibaZx2BDSjlZ5Xt0eqKknTaKGB7ehbfBEVZMtBBaq9nuKV
   K8Nj9ZYdgxCyP+FNMzxSqnXXqRX+l6krn/EX6blIKqe48behnwBlrFFeE
   81Y59kakZt1pJWPh77WX0+57+cVUWUaIvE9McwGKzkZ89UMSiICc4vLr6
   hx/iYAanZ1YcxT9PYVCaJdCQ8UqCbtrtf20IGnrBGIuJJvJ3Qu4KnMLpv
   4/KPC7hrV5wd+D1zb2wHm9cwV9R05QmCVJJSSqLwb5CgioEzZxLjr2/UO
   90MYJ4pBbRW/ib/fKGx+/4xMbCV9UsEGsfFINdlAGhW1Qodwi0oS4Elf3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347807199"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="347807199"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 19:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="760187431"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="760187431"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Apr 2023 19:44:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pobKI-000csD-2p;
	Tue, 18 Apr 2023 02:44:14 +0000
Date: Tue, 18 Apr 2023 10:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Tianyu Lan <tiala@microsoft.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [hyperv:hyperv-next 17/22] arch/x86/kernel/x86_init.c:36:12: error:
 static declaration of 'set_rtc_noop' follows non-static declaration
Message-ID: <202304181055.4hbdxbw6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   4dbdcfe1c5db80edca564d1b28b458792d2e0747
commit: 25dcc7316ef7def25cdab3658ac665bf0ce0ddc5 [17/22] x86/init: Make get/set_rtc_noop() public
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304181055.4hbdxbw6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/commit/?id=25dcc7316ef7def25cdab3658ac665bf0ce0ddc5
        git remote add hyperv https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
        git fetch --no-tags hyperv hyperv-next
        git checkout 25dcc7316ef7def25cdab3658ac665bf0ce0ddc5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181055.4hbdxbw6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/x86_init.c:36:12: error: static declaration of 'set_rtc_noop' follows non-static declaration
      36 | static int set_rtc_noop(const struct timespec64 *now) { return -EINVAL; }
         |            ^~~~~~~~~~~~
   In file included from arch/x86/include/asm/mpspec.h:7,
                    from arch/x86/include/asm/topology.h:38,
                    from include/linux/topology.h:36,
                    from include/linux/gfp.h:8,
                    from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from arch/x86/kernel/x86_init.c:9:
   arch/x86/include/asm/x86_init.h:333:12: note: previous declaration of 'set_rtc_noop' with type 'int(const struct timespec64 *)'
     333 | extern int set_rtc_noop(const struct timespec64 *now);
         |            ^~~~~~~~~~~~
>> arch/x86/kernel/x86_init.c:37:13: error: static declaration of 'get_rtc_noop' follows non-static declaration
      37 | static void get_rtc_noop(struct timespec64 *now) { }
         |             ^~~~~~~~~~~~
   In file included from arch/x86/include/asm/mpspec.h:7,
                    from arch/x86/include/asm/topology.h:38,
                    from include/linux/topology.h:36,
                    from include/linux/gfp.h:8,
                    from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from arch/x86/kernel/x86_init.c:9:
   arch/x86/include/asm/x86_init.h:334:13: note: previous declaration of 'get_rtc_noop' with type 'void(struct timespec64 *)'
     334 | extern void get_rtc_noop(struct timespec64 *now);
         |             ^~~~~~~~~~~~


vim +/set_rtc_noop +36 arch/x86/kernel/x86_init.c

294ee6f89cfd62 Stefano Stabellini      2010-10-06  @9  #include <linux/pci.h>
57844a8f8e2980 Thomas Gleixner         2009-08-19  10  
81b53e5ff21e09 Andy Shevchenko         2018-02-20  11  #include <asm/acpi.h>
816c25e7d4fb6f Thomas Gleixner         2009-08-19  12  #include <asm/bios_ebda.h>
6f30c1ac3fcf11 Thomas Gleixner         2009-08-20  13  #include <asm/paravirt.h>
b72d0db9dd41da Thomas Gleixner         2009-08-29  14  #include <asm/pci_x86.h>
fd6c6661492226 Thomas Gleixner         2009-08-20  15  #include <asm/mpspec.h>
8fee697d990c54 Thomas Gleixner         2009-08-19  16  #include <asm/setup.h>
736decac643e89 Thomas Gleixner         2009-08-19  17  #include <asm/apic.h>
66441bd3cfdcc0 Ingo Molnar             2017-01-27  18  #include <asm/e820/api.h>
845b3944bbdf9e Thomas Gleixner         2009-08-19  19  #include <asm/time.h>
d9112f43021554 Thomas Gleixner         2009-08-20  20  #include <asm/irq.h>
4a8e2a3115e7aa Konrad Rzeszutek Wilk   2012-03-28  21  #include <asm/io_apic.h>
71054d8841b442 Joerg Roedel            2012-09-26  22  #include <asm/hpet.h>
eb243d1d28663c Ingo Molnar             2019-11-20  23  #include <asm/memtype.h>
2d826404f0bdca Thomas Gleixner         2009-08-20  24  #include <asm/tsc.h>
338bac527ed0e3 FUJITA Tomonori         2009-10-27  25  #include <asm/iommu.h>
064a59b6dd1f34 Jacob Pan               2011-11-10  26  #include <asm/mach_traps.h>
6b15ffa07dc325 Thomas Gleixner         2020-08-26  27  #include <asm/irqdomain.h>
f1e525009493cb Juergen Gross           2022-11-23  28  #include <asm/realmode.h>
57844a8f8e2980 Thomas Gleixner         2009-08-19  29  
148f9bb87745ed Paul Gortmaker          2013-06-18  30  void x86_init_noop(void) { }
f4848472cd9948 Thomas Gleixner         2009-08-20  31  void __init x86_init_uint_noop(unsigned int unused) { }
c46dacb75cd59a Juergen Gross           2018-02-21  32  static int __init iommu_init_noop(void) { return 0; }
c46dacb75cd59a Juergen Gross           2018-02-21  33  static void iommu_shutdown_noop(void) { }
bef6e0ae7420bf Zhenzhong Duan          2019-07-16  34  bool __init bool_x86_init_noop(void) { return false; }
bef6e0ae7420bf Zhenzhong Duan          2019-07-16  35  void x86_op_int_noop(int cpu) { }
775d3c514c5b27 Matija Glavinic Pecotic 2023-04-06 @36  static int set_rtc_noop(const struct timespec64 *now) { return -EINVAL; }
775d3c514c5b27 Matija Glavinic Pecotic 2023-04-06 @37  static void get_rtc_noop(struct timespec64 *now) { }
c311ed6183f4fd Rahul Tanwar            2019-10-10  38  

:::::: The code at line 36 was first introduced by commit
:::::: 775d3c514c5b2763a50ab7839026d7561795924d x86/rtc: Remove __init for runtime functions

:::::: TO: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
