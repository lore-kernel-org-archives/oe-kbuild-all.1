Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C10128809
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 11:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713265958; cv=none; b=l/wMVs7ainj5pdpyVR4sMufrfPuekB/uCpLUu8KPz126c0iQqbWJ5G6kLEjUQQmNw/PxYM/UYgcX0rTWzE2RlfDCY8ZCt9Fmo6kOElEG7tqMDYsIBnQCWrRkvMNAxDX5TC7DLwbHFIhyGEGEVleUPqvKISFomMlbwGHNJ7c1xB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713265958; c=relaxed/simple;
	bh=HoUrqDwgIuIkQGan7uEa+WSHUD8MFAQZzAtHrk/eG0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T4wRGBD+cxFgObnQqz0mLe9JI5EbufH65sWJ/rsXkTX9+dfRvIo3iZQjjQBQQAAsF7DwJq2QwYDK5XwiY9FBK/Crl3sQEdLV+8GHF8vDGYP6KTw88Hlhh8Gq0nrGS8PYGDG972Px5rWNh0F2jjwoM+4RpqUeK/7q7KQbMRviUIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kba/rMC8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kba/rMC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713265957; x=1744801957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HoUrqDwgIuIkQGan7uEa+WSHUD8MFAQZzAtHrk/eG0Q=;
  b=Kba/rMC8uAEVheyWcfPoHfiVYZFCGq3fCZd9Qux0FfGi47ZfbfNhjDdC
   b4y7S9hUAvhMMKnjcpnrGiRd5qqrqMNoYO38qyVBBP+PuTjHY1SJUaMIR
   oI9ldjiD+Xk2QWV3sv4+i29RMMpRKzk2+joNihR5FB6sUsUhCxxvhGkfF
   zrwHi5QmM1uhJk6WiuGjeSEkCAtcidzTPdOu67nvlXye7THi0IfT1V4iN
   Txkw0i3cQIcpNeh5gNsd9s1To3jptZdBp/Xtjbxu5TMtk/FVmt4tjhPmX
   zPToeQsZoFDgE0+6I5gKquvp/uiXSVGe4Yyy7mTwP7gk+CaFO/Xa+lyqa
   w==;
X-CSE-ConnectionGUID: xOICk7fPQ3iubsB9qunzlA==
X-CSE-MsgGUID: E5riSi1eRi+KKQLe+c6aQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12537814"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="12537814"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 04:12:19 -0700
X-CSE-ConnectionGUID: j2luMfHDTwGEjJV0U1vxdw==
X-CSE-MsgGUID: Y05Fnf+UQJia4h7NVbioqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="53409070"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2024 04:12:18 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwgjI-0005AS-1o;
	Tue, 16 Apr 2024 11:12:15 +0000
Date: Tue, 16 Apr 2024 19:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/parse-functions 7/7]
 drivers/soundwire/slave.c:27:11: error: call to undeclared function
 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202404161916.ybMHqYvk-lkp@intel.com>
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
config: arm-randconfig-002-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161916.ybMHqYvk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161916.ybMHqYvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161916.ybMHqYvk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soundwire/slave.c:27:11: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      27 |         status = acpi_evaluate_integer(adev->handle,
         |                  ^
   drivers/soundwire/slave.c:27:11: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
     550 |                             acpi_evaluate_object(acpi_handle object,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   drivers/soundwire/slave.c:27:37: error: incomplete definition of type 'struct acpi_device'
      27 |         status = acpi_evaluate_integer(adev->handle,
         |                                        ~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
>> drivers/soundwire/slave.c:83:9: error: call to undeclared function 'acpi_dev_for_each_child'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |         return acpi_dev_for_each_child(adev, find_sdca_function, slave);
         |                ^
   drivers/soundwire/slave.c:83:9: note: did you mean 'device_for_each_child'?
   include/linux/device.h:1060:5: note: 'device_for_each_child' declared here
    1060 | int device_for_each_child(struct device *dev, void *data,
         |     ^
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
