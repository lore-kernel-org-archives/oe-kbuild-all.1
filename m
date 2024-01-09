Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839582575B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jan 2024 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrXv1KMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704790916; x=1736326916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=91UjqnfqHp/CZIvs0f/JSiixj+SpvBUNjlDr8OY9YsA=;
  b=nrXv1KMcIkZA2LSDaWE5BZjpGuvSpJG1GoAmn65yDqII9+iZblHHRJ5L
   oLeJXlxwkynvbVJHecV//Czn3hUbG/3kAEsNtbdHUYOlK8UwmeAGg8B1M
   CIE32zcbm2eQM4x3L9B1q9yWGkjVMIapBQDX3Ufsi/hIPfp3qq+ePMHqa
   Kn16yNtK+KGB3uk0KX1ISbWcU/hSLt1BdefTAfjy5CTNj2DYRIVGIjuG8
   1UCQgIcX8y/7tPDnqCRSXO39XfgIUmXQcxzKXScuPyrPOaw+n5+x0qIgA
   aTtCxVu342zO/yfQ3076dm4NiVWXVkuyJtr9TdULVuLxRmGIDMMvcKEsu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5491106"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="5491106"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 01:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="925182515"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="925182515"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2024 01:01:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN7zY-0005dm-00;
	Tue, 09 Jan 2024 09:01:48 +0000
Date: Tue, 9 Jan 2024 17:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [arm:aarch64/hotplug-vcpu/v6.7 22/42] drivers/acpi/scan.c:2387:29:
 error: 'ACPI_PROCESSOR_DEVICE_HID' undeclared; did you mean
 'ACPI_PROCESSOR_OBJECT_HID'?
Message-ID: <202401091729.qGPJAyvL-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240109/202401091729.qGPJAyvL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401091729.qGPJAyvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401091729.qGPJAyvL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/scan.c: In function 'acpi_dev_is_processor':
>> drivers/acpi/scan.c:2387:29: error: 'ACPI_PROCESSOR_DEVICE_HID' undeclared (first use in this function); did you mean 'ACPI_PROCESSOR_OBJECT_HID'?
    2387 |                     !strcmp(ACPI_PROCESSOR_DEVICE_HID, hwid->id))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                             ACPI_PROCESSOR_OBJECT_HID
   drivers/acpi/scan.c:2387:29: note: each undeclared identifier is reported only once for each function it appears in


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
