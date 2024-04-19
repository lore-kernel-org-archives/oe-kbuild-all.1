Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF29037C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 02:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713495079; cv=none; b=lt0U6qzF3du0ndrURXnxZL4d0gaIVyM6Gf4FoYxs+vn0pDRgCQEaTlIJfdHYxIeAnTGBxufKw1eazN0lrFtvuXrmzJRHP1yILylef+htFe6FWp7KgORWHJ7ObsPZ6PabXYhXq5IloJtLIaxNSokg/1fLQXauvax08SArHLNoXqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713495079; c=relaxed/simple;
	bh=A/7j2fAXzs++nFm0k533dJ4pQ4buCYDtvNCeAvP7a/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lj+o9fNxJvyt38v+eStFEmaSoUiHMhBzJgug56kgINgpve9OD9jELFgWHm6JynZve70EgfgLHAcaukfvmzab4CHruDWzjy3ZENi/Au3TTa0ff0RHMLzJLIS3ozR2P9n9kZxR6GQa/39ZCNN5a2d2fQpz8+iH1m1V3eGSvHXQ354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaMg9yFx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaMg9yFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713495077; x=1745031077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/7j2fAXzs++nFm0k533dJ4pQ4buCYDtvNCeAvP7a/U=;
  b=AaMg9yFxGerott4VdtgIw2TmMPnmgH6AWXqNX6vrhAgDz+bnUz6nWzFX
   38HN115Fpm8qwbRd4VkNtCJzmUpqoY39bj+laacQTj+YYrzc2AD8y0mgr
   R93J0sscyEWHaDFB9k3jvoOeUnx3p/+Dj0lC6Yq6O5pnSwwgMhPwRSmAM
   uyAlTklniTDwW8VRquE1kLeuuk1DDI5EEAFxY9WlPyd0p+DZ7e9gVXtQl
   vTSIfcPArEDcDTwX5CDbJHIZagxnthwGfYn5G1c+h3I8P5RTAhmuQv7nr
   b3HHYfEy3pMebHjgFBvUySPAA0H3U3ig4fPAH6OlaJ3Evn8FydHRTTPnu
   Q==;
X-CSE-ConnectionGUID: F4uGNxztRx+JeUoYmN0nEA==
X-CSE-MsgGUID: DoSnye2ERfCvewVO4Sle1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26592802"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="26592802"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 19:51:16 -0700
X-CSE-ConnectionGUID: 5MzKBN1mT3Oco/PVW93Rug==
X-CSE-MsgGUID: Oi5/wEAVSkSW2BApJMZXDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="46480781"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Apr 2024 19:51:15 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxeK1-0009XE-1g;
	Fri, 19 Apr 2024 02:50:51 +0000
Date: Fri, 19 Apr 2024 10:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/parse-functions 9/12]
 sound/soc/sdca/sdca_functions.c:44:18: error: implicit declaration of
 function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'?
Message-ID: <202404191025.TXhtJ7i9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/parse-functions
head:   999b877354e492b6b1c8206962dcf1fd21c09f15
commit: d4bcf59ba748770a8e243d7598c83e5919cf3ac4 [9/12] ASoC: sdca: parse function type and controls
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404191025.TXhtJ7i9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404191025.TXhtJ7i9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404191025.TXhtJ7i9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/sdca/sdca_functions.c:12:
   include/sound/sdca.h:33:1: error: expected identifier or '(' before '{' token
      33 | {
         | ^
   sound/soc/sdca/sdca_functions.c:14:5: error: redefinition of 'sdca_alloc'
      14 | int sdca_alloc(void **context,
         |     ^~~~~~~~~~
   include/sound/sdca.h:25:19: note: previous definition of 'sdca_alloc' with type 'int(void **, struct device *, struct sdw_slave *)'
      25 | static inline int sdca_alloc(void **context,
         |                   ^~~~~~~~~~
   sound/soc/sdca/sdca_functions.c: In function 'find_sdca_function':
>> sound/soc/sdca/sdca_functions.c:44:18: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
      44 |         status = acpi_evaluate_integer(adev->handle,
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  acpi_evaluate_object
>> sound/soc/sdca/sdca_functions.c:44:44: error: invalid use of undefined type 'struct acpi_device'
      44 |         status = acpi_evaluate_integer(adev->handle,
         |                                            ^~
   sound/soc/sdca/sdca_functions.c: In function 'sdca_find_functions':
>> sound/soc/sdca/sdca_functions.c:110:16: error: implicit declaration of function 'acpi_dev_for_each_child'; did you mean 'device_for_each_child'? [-Werror=implicit-function-declaration]
     110 |         return acpi_dev_for_each_child(adev, find_sdca_function, sdca);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                device_for_each_child
   cc1: some warnings being treated as errors


vim +44 sound/soc/sdca/sdca_functions.c

    32	
    33	static int find_sdca_function(struct acpi_device *adev, void *data)
    34	{
    35		struct fwnode_handle *function = acpi_fwnode_handle(adev);
    36		struct sdca_data *sdca = data;
    37		struct device *parent = sdca->parent;
    38		struct fwnode_handle *control5; /* used to identify topology type */
    39		bool valid_function_found = false;
    40		u32 function_topology = 0;
    41		acpi_status status;
    42		u64 addr;
    43	
  > 44		status = acpi_evaluate_integer(adev->handle,
    45					       METHOD_NAME__ADR, NULL, &addr);
    46	
    47		if (ACPI_FAILURE(status)) {
    48			dev_err(parent, "_ADR resolution failed: %x\n", status);
    49			return -ENODEV;
    50		}
    51	
    52		if (!addr) {
    53			dev_err(parent, "%s: no addr\n", __func__);
    54			return -ENODEV;
    55		}
    56	
    57		/*
    58		 * Extracting the topology type for an SDCA function is a
    59		 * convoluted process.
    60		 * The topology type is only visible as a result of a read
    61		 * from a control. In theory this would mean reading from the hardware,
    62		 * but the SDCA/DisCo specs defined the notion of "DC value" - a constant
    63		 * represented with a DSD subproperty.
    64		 * Drivers have to query the properties for the control
    65		 * SDCA_CONTROL_ENTITY_0_FUNCTION_TOPOLOGY (0x05)
    66		 */
    67		control5 = fwnode_get_named_child_node(function,
    68						       "mipi-sdca-control-0x5-subproperties");
    69		if (!control5)
    70			return -ENODEV;
    71	
    72		fwnode_property_read_u32(control5, "mipi-sdca-control-dc-value",
    73					 &function_topology);
    74	
    75		switch (function_topology) {
    76		case SDCA_FUNCTION_TYPE_SMART_AMP:
    77		case SDCA_FUNCTION_TYPE_SMART_MIC:
    78		case SDCA_FUNCTION_TYPE_UAJ:
    79		case SDCA_FUNCTION_TYPE_HID:
    80			dev_info(parent, "found SDCA function %pfwP type %d ADR %lld\n",
    81				 function, function_topology, addr);
    82			sdca->functions[sdca->function_count].topology_type = function_topology;
    83			sdca->functions[sdca->function_count].adr = addr;
    84			valid_function_found = true;
    85			break;
    86		case SDCA_FUNCTION_TYPE_SPEAKER_MIC:
    87		case SDCA_FUNCTION_TYPE_RJ:
    88		case SDCA_FUNCTION_TYPE_IMP_DEF:
    89			dev_warn(parent, "found unsupported SDCA function %pfwP type %d ADR %lld, skipped\n",
    90				 function, function_topology, addr);
    91			break;
    92		default:
    93			dev_err(parent, "found invalid SDCA function %pfwP type %d ADR %lld, skipped\n",
    94				function, function_topology, addr);
    95			break;
    96		}
    97	
    98		fwnode_handle_put(control5);
    99	
   100		if (valid_function_found)
   101			sdca->function_count++;
   102	
   103		return 0;
   104	}
   105	
   106	int sdca_find_functions(struct sdca_data *sdca)
   107	{
   108		struct acpi_device *adev = to_acpi_device_node(sdca->parent->fwnode);
   109	
 > 110		return acpi_dev_for_each_child(adev, find_sdca_function, sdca);
   111	}
   112	EXPORT_SYMBOL_NS(sdca_find_functions, SND_SOC_SDCA);
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
