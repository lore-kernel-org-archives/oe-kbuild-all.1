Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAFE134CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689363826; x=1720899826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H7eyJndGnUt348f7s7o8iqHlYa+xyplfFs8/CMNRnLw=;
  b=hRzXtxYgk0E6MKcC/8z8MtOAAEMyp1vDgotWM0wbZpqKGTQRpmZlESJn
   whIlKwF0FazVvWbStxpogU9igUSCR6HDEoBH4iUEjrjqJRJlw61JwW9KP
   hQ3weCgLTuScn2M7rhlarOUFzof5RkqVnbnWtDNTD4BJ50uhYqn3WTYgF
   GQv84dKZn9ysJ/6RGaGMEiJFTAs/Iq9AVimpRAbSPyCG46JRDULZ7Ho3W
   6oi89hT3NZG5bipUiW6eVv5rvFS/3V3r1vSSvM8fQxOKiL9SjXwcFOfWK
   xzQ3mAA6Z8Ynb1JF6slBO3EIPh5YYx6JLzcrfgE8cv0kAXVyMAe2roNBc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="429322680"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="429322680"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 12:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="812566665"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="812566665"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2023 12:43:42 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKOha-0007en-0O;
	Fri, 14 Jul 2023 19:43:42 +0000
Date: Sat, 15 Jul 2023 03:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <michal.wilczynski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [rafael-pm:bleeding-edge 33/47] osi.c:(.text+0x158): multiple
 definition of `acpi_early_processor_control_setup';
 drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
Message-ID: <202307150306.FvaBEkzg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   92048b818603a7bcc2e52484d14d5a736de27e3a
commit: ca805e0f04a5f9a773875ad6de914e54e41d43c7 [33/47] ACPI: processor: Use _OSC to convey OSPM processor support information
config: loongarch-randconfig-r014-20230714 (https://download.01.org/0day-ci/archive/20230715/202307150306.FvaBEkzg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150306.FvaBEkzg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150306.FvaBEkzg-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/acpi/osi.o: in function `acpi_early_processor_control_setup':
>> osi.c:(.text+0x158): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/osl.o: in function `acpi_early_processor_control_setup':
   osl.c:(.text+0x298): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/utils.o: in function `acpi_early_processor_control_setup':
   utils.c:(.text+0x0): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/nvs.o: in function `acpi_early_processor_control_setup':
   nvs.c:(.text+0x0): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/wakeup.o: in function `acpi_early_processor_control_setup':
   wakeup.c:(.text+0x0): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/sleep.o: in function `acpi_early_processor_control_setup':
   sleep.c:(.text+0x6a0): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/device_sysfs.o: in function `acpi_early_processor_control_setup':
   drivers/acpi/internal.h:161: multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/device_pm.o: in function `acpi_early_processor_control_setup':
   drivers/acpi/internal.h:161: multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/proc.o: in function `acpi_early_processor_control_setup':
   proc.c:(.text+0x0): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/bus.o: in function `acpi_early_processor_control_setup':
   bus.c:(.text+0x6c8): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/glue.o: in function `acpi_early_processor_control_setup':
   drivers/acpi/internal.h:161: multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/scan.o: in function `acpi_early_processor_control_setup':
   scan.c:(.text+0xef4): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/acpi_processor.o: in function `acpi_early_processor_control_setup':
   acpi_processor.c:(.text+0xb0): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/ec.o: in function `acpi_early_processor_control_setup':
   ec.c:(.text+0x1fec): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/pci_root.o: in function `acpi_early_processor_control_setup':
   pci_root.c:(.text+0x4a8): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/pci_link.o: in function `acpi_early_processor_control_setup':
   pci_link.c:(.text+0xa00): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/acpi_lpss.o: in function `acpi_early_processor_control_setup':
   acpi_lpss.c:(.text+0x0): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/acpi_apd.o: in function `acpi_early_processor_control_setup':
   acpi_apd.c:(.text+0xdc): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/acpi_platform.o: in function `acpi_early_processor_control_setup':
   acpi_platform.c:(.text+0x90): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/acpi_pnp.o: in function `acpi_early_processor_control_setup':
   acpi_pnp.c:(.text+0x168): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/power.o: in function `acpi_early_processor_control_setup':
   drivers/acpi/internal.h:161: multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/event.o: in function `acpi_early_processor_control_setup':
   event.c:(.text+0x0): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/sysfs.o: in function `acpi_early_processor_control_setup':
   sysfs.c:(.text+0x87c): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/property.o: in function `acpi_early_processor_control_setup':
   drivers/acpi/internal.h:161: multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/debugfs.o: in function `acpi_early_processor_control_setup':
   debugfs.c:(.text+0x0): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/container.o: in function `acpi_early_processor_control_setup':
   container.c:(.text+0x170): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/acpi_memhotplug.o: in function `acpi_early_processor_control_setup':
   acpi_memhotplug.c:(.text+0x0): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here
   loongarch64-linux-ld: drivers/acpi/dptf/int340x_thermal.o: in function `acpi_early_processor_control_setup':
   int340x_thermal.c:(.text+0x8): multiple definition of `acpi_early_processor_control_setup'; drivers/acpi/tables.o:tables.c:(.text+0x284): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
