Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685647F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 04:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692677945; x=1724213945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ZYtaz2cVhFh67VEyThZEnVAAa8juwizS6gX+CGqdVs=;
  b=e4iM9Mnr8g+Be5YKhG39KSfp9a9a6nHhJpAnYukjLGUz0QNEK+773TEK
   ZxlO0eEHzw4Qfbow8YFeqdUIhiwn5jr3VxGSuNc+0WEFUDmYIr0zIsQZg
   GxRkPo62e3vhPf9jfL5Qyib+h0T9PI3gjUCCEoulvT3rLEpAH70vDWS/a
   GKnku8IvXd+Q00TjIsahh4cMApLhJUJro0BrtfCPrg5Z+3hRuqAfgcv58
   qS5O7Ti4UYPiJMtPa7TSQFKRAcR8Hpe3a1i87zcQ+qqJclfFzfhBrdMrs
   RY63HXZBfNj3N1l9wgp/TBbeXM0ygZh+TYTzvBhml6Mn86eYtHRFGNlzn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373744530"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="373744530"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 21:19:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="879783310"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2023 21:19:07 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYIq7-0001LM-04;
	Tue, 22 Aug 2023 04:18:28 +0000
Date: Tue, 22 Aug 2023 12:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 8/14] drivers/pci/cma-x509.c:22:10: fatal error:
 'linux/x509.h' file not found
Message-ID: <202308221223.J8ufO6J9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   006eb115706d213104edcfc0e465b759a8ce5034
commit: ea529fbef3268ef568217c543d0796d4dbbde45d [8/14] PCI/CMA: Validate Subject Alternative Name in certificates
config: powerpc64-randconfig-r015-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221223.J8ufO6J9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221223.J8ufO6J9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221223.J8ufO6J9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pci/probe.c:23:
>> drivers/pci/pci.h:322:34: warning: declaration of 'struct x509_certificate' will not be visible outside of this function [-Wvisibility]
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^
   1 warning generated.
--
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:29:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:176:10: note: expanded from macro '_SIG_SET_OP'
     176 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/pci/cma-x509.c:21:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:29:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:197:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     197 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/pci/cma-x509.c:21:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:29:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:210:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     210 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/pci/cma-x509.c:21:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:29:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:241:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     241 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/pci/cma-x509.c:21:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:29:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:254:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     254 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
>> drivers/pci/cma-x509.c:22:10: fatal error: 'linux/x509.h' file not found
      22 | #include <linux/x509.h>
         |          ^~~~~~~~~~~~~~
   49 warnings and 2 errors generated.
--
   In file included from drivers/pci/pci-sysfs.c:32:
>> drivers/pci/pci.h:322:34: warning: declaration of 'struct x509_certificate' will not be visible outside of this function [-Wvisibility]
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^
   drivers/pci/pci-sysfs.c:936:13: warning: no previous prototype for function 'pci_adjust_legacy_attr' [-Wmissing-prototypes]
     936 | void __weak pci_adjust_legacy_attr(struct pci_bus *b,
         |             ^
   drivers/pci/pci-sysfs.c:936:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     936 | void __weak pci_adjust_legacy_attr(struct pci_bus *b,
         | ^
         | static 
   2 warnings generated.
--
   In file included from drivers/pci/hotplug/pci_hotplug_core.c:32:
>> drivers/pci/hotplug/../pci.h:322:34: warning: declaration of 'struct x509_certificate' will not be visible outside of this function [-Wvisibility]
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^
   1 warning generated.
--
   In file included from drivers/pci/pcie/ptm.c:10:
>> drivers/pci/pcie/../pci.h:322:34: warning: declaration of 'struct x509_certificate' will not be visible outside of this function [-Wvisibility]
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^
   1 warning generated.
--
   In file included from drivers/pci/controller/pci-v3-semi.c:35:
>> drivers/pci/controller/../pci.h:322:34: warning: declaration of 'struct x509_certificate' will not be visible outside of this function [-Wvisibility]
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^
   1 warning generated.
--
   In file included from drivers/pci/msi/msi.c:13:
>> drivers/pci/msi/../pci.h:322:34: warning: declaration of 'struct x509_certificate' will not be visible outside of this function [-Wvisibility]
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^
   1 warning generated.
--
   In file included from drivers/pci/controller/dwc/pci-keystone.c:31:
>> drivers/pci/controller/dwc/../../pci.h:322:34: warning: declaration of 'struct x509_certificate' will not be visible outside of this function [-Wvisibility]
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^
   1 warning generated.


vim +22 drivers/pci/cma-x509.c

    18	
    19	#include <linux/asn1_decoder.h>
    20	#include <linux/oid_registry.h>
    21	#include <linux/pci.h>
  > 22	#include <linux/x509.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
