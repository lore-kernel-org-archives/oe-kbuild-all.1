Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2738127B4E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713266629; cv=none; b=YSjXRDqDhAkuMuVWTTaSEJGCKmURXOjQlW8GpZBPOjAiBBkAHkcnO7YMsFsaQzFCj6N0YNb+zVFNu6A1Czcdd6TkTKNURWGK3tCHSXsHiBZwag5odhiP0YiCNLvFh3EDRbs281mILg4BkBqiwzuUMbYOWMgZ0GQqlFMoccTq/FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713266629; c=relaxed/simple;
	bh=f3O2D5nkWGTM7Ml3eNMDgi6OGXECBlW5Sv6F/xcRvWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bzWHtdzfsPkskrQjPhMW/Nnd9co8OamVv2DmGbSzMSOG5C8U6qhDE59atBav640dZ/TlrmK5bMh+eddRgktJI2i42KX+qZ/mYL9UiWq35IxrxFSa/PSjGPJBE8erNFqOnnyv7x+m2YYrhbe+NvA39heJeBPx0SgzQmIgDrL3HD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWGx/2+H; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWGx/2+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713266627; x=1744802627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3O2D5nkWGTM7Ml3eNMDgi6OGXECBlW5Sv6F/xcRvWE=;
  b=bWGx/2+HJSAjzGvwRjK3yrH2M2mA9y7uzaBdivfhITMoOMy471NMJG7d
   CQ95RN0i12BWlnWDyVnYUk+K1vnVb9YfXtvbA6u6+yZupv5vTRUyVZ2U/
   so6OSJkZeqfyaZGeD86qfnfDFM4OuOOEM1++b3JxL9pK6XDo6mJnuyyLw
   JPyiAC9IBDEcYS74pHubBzAVUct1W3YsOt6TvR4z9GhKmHu2FeysP53FT
   WHLr9n1yzFEz9zqgGvqKaVRw5DJnvi5YsvhwF6QpEb2+NVR0XbshBxhZs
   mdEYQR+pD0PQIr6I5HuIxYR7ubhE/fhiuchAf+xW11fMCf9P1amNqCkoQ
   A==;
X-CSE-ConnectionGUID: 3umMepz2TuSexOpuYbl24A==
X-CSE-MsgGUID: dNtip151TNmV4SMFzwH37g==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8861122"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8861122"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 04:23:47 -0700
X-CSE-ConnectionGUID: V8nP+XXOSPi1F5qaU5pJyQ==
X-CSE-MsgGUID: 5bIe3vY/Q7+SajXs78XzJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22823770"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2024 04:23:46 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwgud-0005Bm-30;
	Tue, 16 Apr 2024 11:23:43 +0000
Date: Tue, 16 Apr 2024 19:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/parse-functions 7/7]
 drivers/soundwire/slave.c:27:11: error: implicit declaration of function
 'acpi_evaluate_integer' is invalid in C99
Message-ID: <202404161928.l6oxjuez-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/parse-functions
head:   7c1b08b15344b1341755906ec0e96842d322fded
commit: 7c1b08b15344b1341755906ec0e96842d322fded [7/7] soundwire: parse function type and controls
config: arm-randconfig-001-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161928.l6oxjuez-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161928.l6oxjuez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161928.l6oxjuez-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soundwire/slave.c:27:11: error: implicit declaration of function 'acpi_evaluate_integer' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           status = acpi_evaluate_integer(adev->handle,
                    ^
   drivers/soundwire/slave.c:27:11: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
                               acpi_evaluate_object(acpi_handle object,
                               ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
           static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
                              ^
>> drivers/soundwire/slave.c:27:37: error: incomplete definition of type 'struct acpi_device'
           status = acpi_evaluate_integer(adev->handle,
                                          ~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
   struct acpi_device;
          ^
>> drivers/soundwire/slave.c:83:9: error: implicit declaration of function 'acpi_dev_for_each_child' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return acpi_dev_for_each_child(adev, find_sdca_function, slave);
                  ^
   drivers/soundwire/slave.c:83:9: note: did you mean 'device_for_each_child'?
   include/linux/device.h:1060:5: note: 'device_for_each_child' declared here
   int device_for_each_child(struct device *dev, void *data,
       ^
   3 errors generated.


vim +/acpi_evaluate_integer +27 drivers/soundwire/slave.c

    10	
    11	static int find_sdca_function(struct acpi_device *adev, void *data)
    12	{
    13		struct fwnode_handle *function = acpi_fwnode_handle(adev);
    14		struct sdw_slave *slave = data;
    15		struct fwnode_handle *control5;
    16		struct fwnode_handle *control6;
    17		struct fwnode_handle *control7;
    18		u64 control_list = 0;
    19		u32 function_topology = 0;
    20		u32 mfg = 0;
    21		u32 part = 0;
    22		acpi_status status;
    23		u64 addr;
    24	
    25		dev_info(&slave->dev, "%s: plb start\n", __func__);
    26	
  > 27		status = acpi_evaluate_integer(adev->handle,
    28					       METHOD_NAME__ADR, NULL, &addr);
    29	
    30		if (ACPI_FAILURE(status)) {
    31			dev_err(&slave->dev, "plb _ADR resolution failed: %x\n",
    32				status);
    33			return -ENODEV;
    34		}
    35	
    36		if (!addr) {
    37			dev_err(&slave->dev, "%s: plb no addr\n", __func__);
    38			return -ENODEV;
    39		}
    40	
    41		fwnode_property_read_u64(function, "mipi-sdca-control-list",
    42					&control_list);
    43		dev_info(&slave->dev, "plb control list  %llx\n", control_list);
    44	
    45		dev_info(&slave->dev, "%s: plb control5\n", __func__);
    46		control5 = fwnode_get_named_child_node(function,
    47						       "mipi-sdca-control-0x5-subproperties");
    48		if (!control5) {
    49			fwnode_property_read_u32(control5, "mipi-sdca-control-dc-value",
    50						 &function_topology);
    51			dev_info(&slave->dev, "plb topology %d\n", function_topology);
    52		}
    53	
    54		dev_info(&slave->dev, "%s: plb control6\n", __func__);
    55		control6 = fwnode_get_named_child_node(function,
    56						       "mipi-sdca-control-0x6-subproperties");
    57		if (!control6) {
    58			fwnode_property_read_u32(control6, "mipi-sdca-control-dc-value",
    59						 &mfg);
    60			dev_info(&slave->dev, "plb mfg %x\n", mfg);
    61		}
    62	
    63		dev_info(&slave->dev, "%s: plb control7\n", __func__);
    64		control7 = fwnode_get_named_child_node(function,
    65						       "mipi-sdca-control-0x7-subproperties");
    66		if (!control7) {
    67			fwnode_property_read_u32(control7, "mipi-sdca-control-dc-value",
    68						 &part);
    69			dev_info(&slave->dev, "plb part_id %x\n", part);
    70		}
    71	
    72		dev_info(&slave->dev, "plb Found child device with _ADR: %llx\n", addr);
    73	
    74		return 0;
    75	}
    76	
    77	static int sdw_acpi_find_sdca_functions(struct sdw_slave *slave)
    78	{
    79		struct acpi_device *adev = to_acpi_device_node(slave->dev.fwnode);
    80	
    81		dev_info(&slave->dev, "%s: plb start\n", __func__);
    82	
  > 83		return acpi_dev_for_each_child(adev, find_sdca_function, slave);
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
