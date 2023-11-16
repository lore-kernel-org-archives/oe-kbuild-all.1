Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C4E389
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 00:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJbbQQ0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700094226; x=1731630226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LyAewazbA4GTUSbI6VbeyR0a0sQSdPamE6BpBjSIxAo=;
  b=eJbbQQ0pit/mhZtA+RjN+PkwKO/dHKc7ejrhWD4SEVAyLG62rCPPKc5i
   y1KopbHGvIJu0Fe68gmLLfZdHaHDRJPWfdZNZKp1S8a+I1Z2PKX4J6lDt
   P4kh7PVDo7SWIJ94byDIX1c4fJX3v7panwFCZabaKRQPswQc4ToFHW1Vl
   fSpwbfO+SiwpgUwrZEfoIN/xokTqQbNxmp1t2JgBwWzkObYswQrUpbtM8
   2b42fjkjUANKaGIMo1c0GyoVCWnaA0K6TEFFNWFjWXfI/7+IRdhksRd3+
   TTPJ31XkRNd/5A2+oFiVu9jgL8DoEsoVMkoKwesRceQnsNJcaGZKrPSIX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="422075791"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="422075791"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 16:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="831094767"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="831094767"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Nov 2023 16:23:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3QAX-00011t-22;
	Thu, 16 Nov 2023 00:23:41 +0000
Date: Thu, 16 Nov 2023 08:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Adriana Reus <adriana.reus@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: drivers/iio/light/pa12203001.c:454:36: warning:
 'pa12203001_acpi_match' defined but not used
Message-ID: <202311160851.FDA4CDVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 8ab6abfca09c1800dccb753775f6ce8ee82f50dd iio: light: Add support for TXC PA12 als and proximity sensor
date:   8 years ago
config: x86_64-buildonly-randconfig-004-20230906 (https://download.01.org/0day-ci/archive/20231116/202311160851.FDA4CDVE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160851.FDA4CDVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160851.FDA4CDVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:735:9: note: in expansion of macro 'PVOP_VCALL1'
     735 |         PVOP_VCALL1(pv_lock_ops.kick, cpu);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'arch_local_save_flags':
   include/asm-generic/bug.h:145:47: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     145 | #define BUG_ON(condition) do { if (condition) ; } while (0)
         |                                               ^
   arch/x86/include/asm/paravirt_types.h:545:33: note: in expansion of macro 'BUG_ON'
     545 | #define PVOP_TEST_NULL(op)      BUG_ON(op == NULL)
         |                                 ^~~~~~
   arch/x86/include/asm/paravirt_types.h:555:17: note: in expansion of macro 'PVOP_TEST_NULL'
     555 |                 PVOP_TEST_NULL(op);                                     \
         |                 ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:587:9: note: in expansion of macro '____PVOP_CALL'
     587 |         ____PVOP_CALL(rettype, op.func, CLBR_RET_REG,                   \
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:624:9: note: in expansion of macro '__PVOP_CALLEESAVE'
     624 |         __PVOP_CALLEESAVE(rettype, op, "", "")
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:831:16: note: in expansion of macro 'PVOP_CALLEE0'
     831 |         return PVOP_CALLEE0(unsigned long, pv_irq_ops.save_fl);
         |                ^~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'arch_local_irq_restore':
   include/asm-generic/bug.h:145:47: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     145 | #define BUG_ON(condition) do { if (condition) ; } while (0)
         |                                               ^
   arch/x86/include/asm/paravirt_types.h:545:33: note: in expansion of macro 'BUG_ON'
     545 | #define PVOP_TEST_NULL(op)      BUG_ON(op == NULL)
         |                                 ^~~~~~
   arch/x86/include/asm/paravirt_types.h:595:17: note: in expansion of macro 'PVOP_TEST_NULL'
     595 |                 PVOP_TEST_NULL(op);                                     \
         |                 ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:612:9: note: in expansion of macro '____PVOP_VCALL'
     612 |         ____PVOP_VCALL(op.func, CLBR_RET_REG,                           \
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:637:9: note: in expansion of macro '__PVOP_VCALLEESAVE'
     637 |         __PVOP_VCALLEESAVE(op, "", "", PVOP_CALL_ARG1(arg1))
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:836:9: note: in expansion of macro 'PVOP_VCALLEE1'
     836 |         PVOP_VCALLEE1(pv_irq_ops.restore_fl, f);
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'arch_local_irq_disable':
   include/asm-generic/bug.h:145:47: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     145 | #define BUG_ON(condition) do { if (condition) ; } while (0)
         |                                               ^
   arch/x86/include/asm/paravirt_types.h:545:33: note: in expansion of macro 'BUG_ON'
     545 | #define PVOP_TEST_NULL(op)      BUG_ON(op == NULL)
         |                                 ^~~~~~
   arch/x86/include/asm/paravirt_types.h:595:17: note: in expansion of macro 'PVOP_TEST_NULL'
     595 |                 PVOP_TEST_NULL(op);                                     \
         |                 ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:612:9: note: in expansion of macro '____PVOP_VCALL'
     612 |         ____PVOP_VCALL(op.func, CLBR_RET_REG,                           \
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:626:9: note: in expansion of macro '__PVOP_VCALLEESAVE'
     626 |         __PVOP_VCALLEESAVE(op, "", "")
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:841:9: note: in expansion of macro 'PVOP_VCALLEE0'
     841 |         PVOP_VCALLEE0(pv_irq_ops.irq_disable);
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'arch_local_irq_enable':
   include/asm-generic/bug.h:145:47: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     145 | #define BUG_ON(condition) do { if (condition) ; } while (0)
         |                                               ^
   arch/x86/include/asm/paravirt_types.h:545:33: note: in expansion of macro 'BUG_ON'
     545 | #define PVOP_TEST_NULL(op)      BUG_ON(op == NULL)
         |                                 ^~~~~~
   arch/x86/include/asm/paravirt_types.h:595:17: note: in expansion of macro 'PVOP_TEST_NULL'
     595 |                 PVOP_TEST_NULL(op);                                     \
         |                 ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:612:9: note: in expansion of macro '____PVOP_VCALL'
     612 |         ____PVOP_VCALL(op.func, CLBR_RET_REG,                           \
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:626:9: note: in expansion of macro '__PVOP_VCALLEESAVE'
     626 |         __PVOP_VCALLEESAVE(op, "", "")
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:846:9: note: in expansion of macro 'PVOP_VCALLEE0'
     846 |         PVOP_VCALLEE0(pv_irq_ops.irq_enable);
         |         ^~~~~~~~~~~~~
   include/asm-generic/fixmap.h: In function 'virt_to_fix':
   include/asm-generic/bug.h:145:47: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     145 | #define BUG_ON(condition) do { if (condition) ; } while (0)
         |                                               ^
   include/asm-generic/fixmap.h:37:9: note: in expansion of macro 'BUG_ON'
      37 |         BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
         |         ^~~~~~
   In file included from include/linux/kobject.h:21,
                    from include/linux/module.h:16:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:496:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     496 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:424:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     424 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/iio/light/pa12203001.c: At top level:
>> drivers/iio/light/pa12203001.c:454:36: warning: 'pa12203001_acpi_match' defined but not used [-Wunused-const-variable=]
     454 | static const struct acpi_device_id pa12203001_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~


vim +/pa12203001_acpi_match +454 drivers/iio/light/pa12203001.c

   453	
 > 454	static const struct acpi_device_id pa12203001_acpi_match[] = {
   455		{ "TXCPA122", 0},
   456		{}
   457	};
   458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
