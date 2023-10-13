Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7162081C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 01:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X97+td4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697161124; x=1728697124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JtmjPZu1gnbZ1k2WJJyIm6DsLXJHmFQcMovFuyl1yo=;
  b=X97+td4qppbGpGssOj3qEqOfbhhdxdxo5YJPHIAiefG6Xl/qedHKUwyu
   5VViZxRVfjiJeh9VG8++zBLHK7ncFDiK8FxaHdkoqKTM7jVEsXoIcwO2b
   45uaBNVMc7yEN3JeHq4A3muI5KQqBH/9A8Tndw8uP1k2uPnyCNFVq1VXf
   ZyA65oWUhMX1nznYd/xhOT4M4yLsC1JGTNlYXn5V2hW9KSjeWOPZ4ZOjK
   66TfY0o2NXDNUV+FBTzaZ+9z2OPFHnOhXyk5WAh2OJjU1oXSp3fzO2xg9
   H2shy347KEb2YG1chyMzfayfgmPYBz+EInu1wmKMHp1t3UQS8CZJLEKB5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="383942276"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="383942276"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 18:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754511650"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="754511650"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Oct 2023 18:38:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr78O-0004Bp-1k;
	Fri, 13 Oct 2023 01:38:37 +0000
Date: Fri, 13 Oct 2023 09:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [arm:aarch64/hotplug-vcpu/v6.6-rc5 31/33]
 drivers/acpi/acpi_processor.c:565: undefined reference to
 `arch_unregister_cpu'
Message-ID: <202310130952.iAdpQ3Sz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git aarch64/hotplug-vcpu/v6.6-rc5
head:   172379926d6aed66b10f7cf1c954bc40a3684241
commit: 279ddae0aef8988861d8f41574994805885ce78e [31/33] ACPI: add support to register CPUs based on the _STA enabled bit
config: i386-randconfig-004-20231013 (https://download.01.org/0day-ci/archive/20231013/202310130952.iAdpQ3Sz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130952.iAdpQ3Sz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130952.iAdpQ3Sz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/acpi/acpi_processor.o: in function `acpi_processor_post_eject':
>> drivers/acpi/acpi_processor.c:565: undefined reference to `arch_unregister_cpu'


vim +565 drivers/acpi/acpi_processor.c

   541	
   542	static void acpi_processor_post_eject(struct acpi_device *device)
   543	{
   544		struct acpi_processor *pr;
   545		unsigned long long sta;
   546		acpi_status status;
   547	
   548		if (!device)
   549			return;
   550	
   551		pr = acpi_driver_data(device);
   552		if (!pr || pr->id >= nr_cpu_ids || invalid_phys_cpuid(pr->phys_id))
   553			return;
   554	
   555		status = acpi_evaluate_integer(pr->handle, "_STA", NULL, &sta);
   556		if (ACPI_FAILURE(status))
   557			return;
   558	
   559		if (cpu_present(pr->id) && !(sta & ACPI_STA_DEVICE_PRESENT)) {
   560			acpi_processor_make_not_present(device);
   561			return;
   562		}
   563	
   564		if (cpu_present(pr->id) && !(sta & ACPI_STA_DEVICE_ENABLED))
 > 565			arch_unregister_cpu(pr->id);
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
