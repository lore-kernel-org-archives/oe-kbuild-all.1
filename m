Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6988F3A1A7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jan 2024 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjNdpcPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704799275; x=1736335275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kL9RYEJ3I+pV8O78tEnwUL/so3ZveldwXG7i0sUvL1U=;
  b=gjNdpcPRpNK5QuZ7SXoK1d4uMl9jGxtr8kxE+ceUJkug4AVS42a5zW89
   t3J7eCJugBgv9wazVipjugAjbk7BkgApQ+nvO94vqUe+mGkV40UhwfAbh
   aG4vX2j3UcMl95dqcRrHysda1kHzFu2bhm+M6x1uF18ngcNZkP1HeDSLz
   W5igI8Fuv07wGMrLNjEwZ44EqfHav9kwga7piebCmbsZXxCY0LrpiiAMb
   0h5r/Ha0fF+riOJaMiLRhl0m2VYkc/UNY9KFuafqUs2NuAoNkTxSafQgG
   2FLjPplsYxiI/twKityNnF1rRiLWSlI2FzjFBjFj7HkFJi/rKb0hebqE6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="429352066"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="429352066"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 03:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="757952423"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="757952423"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Jan 2024 03:21:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNAAQ-0005mM-0I;
	Tue, 09 Jan 2024 11:21:10 +0000
Date: Tue, 9 Jan 2024 19:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [arm:aarch64/hotplug-vcpu/v6.7 22/42] drivers/acpi/scan.c:2387:15:
 error: use of undeclared identifier 'ACPI_PROCESSOR_DEVICE_HID'; did you
 mean 'ACPI_RECONFIG_DEVICE_ADD'?
Message-ID: <202401091952.kpNcMQyp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git aarch64/hotplug-vcpu/v6.7
head:   8fc7aed65dda1d73bd1423f9b82029b354ce027d
commit: 65e760d9bf772f49ab4398c1a529816d030d4c11 [22/42] ACPI: Only enumerate enabled (or functional) processor devices
config: x86_64-randconfig-161-20240109 (https://download.01.org/0day-ci/archive/20240109/202401091952.kpNcMQyp-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401091952.kpNcMQyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401091952.kpNcMQyp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/scan.c:2387:15: error: use of undeclared identifier 'ACPI_PROCESSOR_DEVICE_HID'; did you mean 'ACPI_RECONFIG_DEVICE_ADD'?
    2387 |                     !strcmp(ACPI_PROCESSOR_DEVICE_HID, hwid->id))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                             ACPI_RECONFIG_DEVICE_ADD
   include/linux/acpi.h:720:2: note: 'ACPI_RECONFIG_DEVICE_ADD' declared here
     720 |         ACPI_RECONFIG_DEVICE_ADD = 0,
         |         ^
   1 error generated.


vim +2387 drivers/acpi/scan.c

  2374	
  2375	static bool acpi_dev_is_processor(const struct acpi_device *device)
  2376	{
  2377		struct acpi_hardware_id *hwid;
  2378	
  2379		if (device->device_type == ACPI_BUS_TYPE_PROCESSOR)
  2380			return true;
  2381	
  2382		if (device->device_type != ACPI_BUS_TYPE_DEVICE)
  2383			return false;
  2384	
  2385		list_for_each_entry(hwid, &device->pnp.ids, list)
  2386			if (!strcmp(ACPI_PROCESSOR_OBJECT_HID, hwid->id) ||
> 2387			    !strcmp(ACPI_PROCESSOR_DEVICE_HID, hwid->id))
  2388				return true;
  2389	
  2390		return false;
  2391	}
  2392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
