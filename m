Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AB1125C0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 21:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692653007; x=1724189007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HySCWNIUu5fnZXFWUK7Nk7hVN/1F5iDzdfyi1UkjrzY=;
  b=AN51kja82enayfCoW4DvzXlrhCwfGtBSwId9Of0wZFcnuHhn0cxtt7vI
   KRY82FP57z1jlLHmzc7ojf4ftkzzn7vXw+mvBMQrhHLiDm9bBlD66vrNd
   Yf5atDFyWYX8tEWDy0B7D1RWwDqtxo2jqL8RgcfQqjB0OAH8jRJ4updIm
   CKop/3x8KysHpbOy2lSaI4Rj9+JZz3YSej24tIrI0T0/i7nytG5OuXrqm
   y89px5lGt5XgDkAKGP/ZKD2qAJbjSoqW5jDCveAxb9uzC29eMonFFwq08
   sAyVXf/ZBo8+R8EOQyBWztO7QHj6PoI96qpru+M6jOFSm3Nr+UJomRhYL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404707085"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="404707085"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 14:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850333688"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="850333688"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2023 14:23:24 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYCMd-0000we-0L;
	Mon, 21 Aug 2023 21:23:14 +0000
Date: Tue, 22 Aug 2023 05:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11244/11453]
 drivers/acpi/acpi_processor.c:354:46: warning: '%X' directive writing
 between 1 and 8 bytes into a region of size 5
Message-ID: <202308220527.8csCMbMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: 99b9bb7b36a7293603d8410d9228a38c32178d53 [11244/11453] Merge branch 'loongarch-next' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
config: loongarch-randconfig-r011-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220527.8csCMbMU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220527.8csCMbMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220527.8csCMbMU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/acpi_processor.c: In function 'acpi_processor_get_info':
>> drivers/acpi/acpi_processor.c:354:46: warning: '%X' directive writing between 1 and 8 bytes into a region of size 5 [-Wformat-overflow=]
     354 |         sprintf(acpi_device_bid(device), "CPU%X", pr->id);
         |                                              ^~
   drivers/acpi/acpi_processor.c:354:42: note: directive argument in the range [0, 2147483647]
     354 |         sprintf(acpi_device_bid(device), "CPU%X", pr->id);
         |                                          ^~~~~~~
   drivers/acpi/acpi_processor.c:354:9: note: 'sprintf' output between 5 and 12 bytes into a destination of size 8
     354 |         sprintf(acpi_device_bid(device), "CPU%X", pr->id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +354 drivers/acpi/acpi_processor.c

ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  245  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  246  static int acpi_processor_get_info(struct acpi_device *device)
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  247  {
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  248  	union acpi_object object = { 0 };
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  249  	struct acpi_buffer buffer = { sizeof(union acpi_object), &object };
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  250  	struct acpi_processor *pr = acpi_driver_data(device);
05eb3cd8b4f2dc Hanjun Guo        2015-05-11  251  	int device_declaration = 0;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  252  	acpi_status status = AE_OK;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  253  	static int cpu0_initialized;
6ebb5bc9e61be4 Zhang Rui         2013-09-03  254  	unsigned long long value;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  255  
082e12a05cf317 Hanjun Guo        2013-09-02  256  	acpi_processor_errata();
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  257  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  258  	/*
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  259  	 * Check to see if we have bus mastering arbitration control.  This
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  260  	 * is required for proper C3 usage (to maintain cache coherency).
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  261  	 */
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  262  	if (acpi_gbl_FADT.pm2_control_block && acpi_gbl_FADT.pm2_control_length) {
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  263  		pr->flags.bm_control = 1;
52af99c3f55ff0 Rafael J. Wysocki 2021-02-22  264  		dev_dbg(&device->dev, "Bus mastering arbitration control present\n");
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  265  	} else
52af99c3f55ff0 Rafael J. Wysocki 2021-02-22  266  		dev_dbg(&device->dev, "No bus mastering arbitration control\n");
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  267  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  268  	if (!strcmp(acpi_device_hid(device), ACPI_PROCESSOR_OBJECT_HID)) {
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  269  		/* Declared with "Processor" statement; match ProcessorID */
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  270  		status = acpi_evaluate_object(pr->handle, NULL, NULL, &buffer);
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  271  		if (ACPI_FAILURE(status)) {
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  272  			dev_err(&device->dev,
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  273  				"Failed to evaluate processor object (0x%x)\n",
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  274  				status);
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  275  			return -ENODEV;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  276  		}
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  277  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  278  		pr->acpi_id = object.processor.proc_id;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  279  	} else {
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  280  		/*
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  281  		 * Declared with "Device" statement; match _UID.
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  282  		 */
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  283  		status = acpi_evaluate_integer(pr->handle, METHOD_NAME__UID,
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  284  						NULL, &value);
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  285  		if (ACPI_FAILURE(status)) {
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  286  			dev_err(&device->dev,
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  287  				"Failed to evaluate processor _UID (0x%x)\n",
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  288  				status);
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  289  			return -ENODEV;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  290  		}
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  291  		device_declaration = 1;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  292  		pr->acpi_id = value;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  293  	}
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  294  
a77d6cd9684977 Dou Liyang        2017-03-03  295  	if (acpi_duplicate_processor_id(pr->acpi_id)) {
2c2b005f549544 Jiri Slaby        2019-08-07  296  		if (pr->acpi_id == 0xff)
2c2b005f549544 Jiri Slaby        2019-08-07  297  			dev_info_once(&device->dev,
2c2b005f549544 Jiri Slaby        2019-08-07  298  				"Entry not well-defined, consider updating BIOS\n");
2c2b005f549544 Jiri Slaby        2019-08-07  299  		else
a77d6cd9684977 Dou Liyang        2017-03-03  300  			dev_err(&device->dev,
a77d6cd9684977 Dou Liyang        2017-03-03  301  				"Failed to get unique processor _UID (0x%x)\n",
a77d6cd9684977 Dou Liyang        2017-03-03  302  				pr->acpi_id);
a77d6cd9684977 Dou Liyang        2017-03-03  303  		return -ENODEV;
a77d6cd9684977 Dou Liyang        2017-03-03  304  	}
a77d6cd9684977 Dou Liyang        2017-03-03  305  
8416c5bda17c1c Hanjun Guo        2015-05-11  306  	pr->phys_id = acpi_get_phys_id(pr->handle, device_declaration,
8416c5bda17c1c Hanjun Guo        2015-05-11  307  					pr->acpi_id);
ddcc18f5bdd1aa Hanjun Guo        2015-05-13  308  	if (invalid_phys_cpuid(pr->phys_id))
52af99c3f55ff0 Rafael J. Wysocki 2021-02-22  309  		dev_dbg(&device->dev, "Failed to get CPU physical ID.\n");
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  310  
05eb3cd8b4f2dc Hanjun Guo        2015-05-11  311  	pr->id = acpi_map_cpuid(pr->phys_id, pr->acpi_id);
691a637123470b Petr Pavlu        2023-03-16  312  	if (!cpu0_initialized) {
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  313  		cpu0_initialized = 1;
af8f3f514d193e Hanjun Guo        2015-01-04  314  		/*
af8f3f514d193e Hanjun Guo        2015-01-04  315  		 * Handle UP system running SMP kernel, with no CPU
af8f3f514d193e Hanjun Guo        2015-01-04  316  		 * entry in MADT
af8f3f514d193e Hanjun Guo        2015-01-04  317  		 */
691a637123470b Petr Pavlu        2023-03-16  318  		if (!acpi_has_cpu_in_madt() && invalid_logical_cpuid(pr->id) &&
691a637123470b Petr Pavlu        2023-03-16  319  		    (num_online_cpus() == 1))
05eb3cd8b4f2dc Hanjun Guo        2015-05-11  320  			pr->id = 0;
691a637123470b Petr Pavlu        2023-03-16  321  		/*
691a637123470b Petr Pavlu        2023-03-16  322  		 * Check availability of Processor Performance Control by
691a637123470b Petr Pavlu        2023-03-16  323  		 * looking at the presence of the _PCT object under the first
691a637123470b Petr Pavlu        2023-03-16  324  		 * processor definition.
691a637123470b Petr Pavlu        2023-03-16  325  		 */
691a637123470b Petr Pavlu        2023-03-16  326  		if (acpi_has_method(pr->handle, "_PCT"))
691a637123470b Petr Pavlu        2023-03-16  327  			cpufreq_add_device("acpi-cpufreq");
b981513f806d26 Jiang Liu         2014-01-09  328  	}
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  329  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  330  	/*
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  331  	 *  Extra Processor objects may be enumerated on MP systems with
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  332  	 *  less than the max # of CPUs. They should be ignored _iff
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  333  	 *  they are physically not present.
8ad893faf2eaed Gu Zheng          2016-08-25  334  	 *
8ad893faf2eaed Gu Zheng          2016-08-25  335  	 *  NOTE: Even if the processor has a cpuid, it may not be present
8ad893faf2eaed Gu Zheng          2016-08-25  336  	 *  because cpuid <-> apicid mapping is persistent now.
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  337  	 */
8ad893faf2eaed Gu Zheng          2016-08-25  338  	if (invalid_logical_cpuid(pr->id) || !cpu_present(pr->id)) {
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  339  		int ret = acpi_processor_hotadd_init(pr);
c8deb1c2576237 Xiaofei Tan       2021-03-27  340  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  341  		if (ret)
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  342  			return ret;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  343  	}
b981513f806d26 Jiang Liu         2014-01-09  344  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  345  	/*
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  346  	 * On some boxes several processors use the same processor bus id.
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  347  	 * But they are located in different scope. For example:
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  348  	 * \_SB.SCK0.CPU0
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  349  	 * \_SB.SCK1.CPU0
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  350  	 * Rename the processor device bus id. And the new bus id will be
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  351  	 * generated as the following format:
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  352  	 * CPU+CPU ID.
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  353  	 */
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03 @354  	sprintf(acpi_device_bid(device), "CPU%X", pr->id);
52af99c3f55ff0 Rafael J. Wysocki 2021-02-22  355  	dev_dbg(&device->dev, "Processor [%d:%d]\n", pr->id, pr->acpi_id);
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  356  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  357  	if (!object.processor.pblk_address)
52af99c3f55ff0 Rafael J. Wysocki 2021-02-22  358  		dev_dbg(&device->dev, "No PBLK (NULL address)\n");
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  359  	else if (object.processor.pblk_length != 6)
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  360  		dev_err(&device->dev, "Invalid PBLK length [%d]\n",
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  361  			    object.processor.pblk_length);
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  362  	else {
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  363  		pr->throttling.address = object.processor.pblk_address;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  364  		pr->throttling.duty_offset = acpi_gbl_FADT.duty_offset;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  365  		pr->throttling.duty_width = acpi_gbl_FADT.duty_width;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  366  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  367  		pr->pblk = object.processor.pblk_address;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  368  	}
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  369  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  370  	/*
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  371  	 * If ACPI describes a slot number for this CPU, we can use it to
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  372  	 * ensure we get the right value in the "physical id" field
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  373  	 * of /proc/cpuinfo
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  374  	 */
6ebb5bc9e61be4 Zhang Rui         2013-09-03  375  	status = acpi_evaluate_integer(pr->handle, "_SUN", NULL, &value);
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  376  	if (ACPI_SUCCESS(status))
6ebb5bc9e61be4 Zhang Rui         2013-09-03  377  		arch_fix_phys_package_id(pr->id, value);
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  378  
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  379  	return 0;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  380  }
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  381  

:::::: The code at line 354 was first introduced by commit
:::::: ac212b6980d8d5eda705864fc5a8ecddc6d6eacc ACPI / processor: Use common hotplug infrastructure

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
