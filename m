Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625A8171BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 12:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694523483; x=1726059483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Ay623mMakHl/eqjjZxE52Xbt3gn7IvGQ+XRhsIM9Yo=;
  b=U7ZqUBKtdeD9icO4SFhNDZ18QW44sLSikdeuPKGDGxad9Kr5L087mpwU
   2RFWP7Pa12NZzN7OHMsD9louh50pf6hOg+A6frrYkgsNu6jTf9ntv2XnQ
   qN01CuXZPZYqcVPJ9iu4sJBCXzWvZjkQ+jGFOEF8DVupHqXWoE2y9ZnRJ
   bxOgEx0/BrHcEtndKTm2/JDuf1f3gMU4IlD75mkyouYqXtO/HZ9r9QsiR
   XWiUZVnRPlR/n+HkPGijjmbx7HqqddmIBK8wDREAEZzOO4zIJnZgPYgPf
   Ddg48vqstd5LWIrkMP8TTMgPjkkp3FazAM13v5IrlPyotEL/m3oOeNlxp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378277010"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="378277010"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 05:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="858799074"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="858799074"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2023 05:57:57 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg2xn-0000Oj-0L;
	Tue, 12 Sep 2023 12:57:55 +0000
Date: Tue, 12 Sep 2023 20:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk-arm:aarch64/hotplug-vcpu/v6.6-rc1 31/33]
 drivers/acpi/acpi_processor.c:565: undefined reference to
 `arch_unregister_cpu'
Message-ID: <202309122045.bQXDxj5u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm aarch64/hotplug-vcpu/v6.6-rc1
head:   8c3da820fb216ca0aa4f79018870f248733758c0
commit: 9d3c5dd53f7a68aa2ec351691174250fc680b280 [31/33] ACPI: add support to register CPUs based on the _STA enabled bit
config: i386-randconfig-015-20230912 (https://download.01.org/0day-ci/archive/20230912/202309122045.bQXDxj5u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122045.bQXDxj5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122045.bQXDxj5u-lkp@intel.com/

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
