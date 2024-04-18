Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451C63FEF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 23:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713482172; cv=none; b=io4RO7sqUvJX5e2kDaFFpipC4yhTKSB01ggLEz0ePQwKAMzcrPyF6EF6/I4HeLh+ECS6XcEczYuRXKPXAMzaAR9DFFJaYfqVJ/o3N12HBougWCy+dAUn7uoIXAX3f+D4U4HEWZG56G0+9Fapt1vVYaeO2Dk1SMnv1VlJKFNlwWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713482172; c=relaxed/simple;
	bh=EFK5iUtHo+iMGt0Bsbl6up8NJ1x73P9VZmqqQUgnOKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rvPTfR6i6qgNUBGirf0CAzz69P9fBlCsHtxk1scrwdwZ0K5MYLQeIZ7tObUGoGkPRq7dIJpnefDWF8Lb6sPpwckF/EcIL5SAyOP1tHSX0XHsZGsUTJOj/xTJK6maH+Sw/MWLz/gOOGj7bZZ8M3wubASqBf8XU/OWVYl5T6mnVno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDy1vdu/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDy1vdu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713482170; x=1745018170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EFK5iUtHo+iMGt0Bsbl6up8NJ1x73P9VZmqqQUgnOKk=;
  b=MDy1vdu/wyOD0cQimbn6LGqVnflyA0Qlx5XayR7yvMfk7YiSvTynAfMm
   vH4MDNWo01BS7Mr0SBg66Ahk1Z5MiRvPV1Q7P4B2Ve8y3rLjlYd0lQz65
   gFNzZ8Na+31Ioh/nq2dwtegseTb3ZlRmilhz0u4o2pcgAkfzNeSz5XWji
   rzYEuNz4zrkdk6Fs/syhkYkTZIi4o2J/wfPwXWKxQ6pzZKjGCUt0XhlDH
   i64YtFFt4naPLbATrE6L+jD9FpAhvjCvMwzZ/j1JZBtOkK0SQIol2yOAa
   q5v524PKb746hBU7RPnYu4TULxBwF9IgYghpIvRs3uVqac10giZVhhVP/
   g==;
X-CSE-ConnectionGUID: c42F+8QPSZ+i/rk6fBb7GQ==
X-CSE-MsgGUID: x5eVBZQaQu2BQJWNK7FcKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12845134"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="12845134"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 16:16:09 -0700
X-CSE-ConnectionGUID: r9OV24FXRY6oOkXtiDhjDg==
X-CSE-MsgGUID: +iqSikaaSZmxQ25d6/MoOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="27601094"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Apr 2024 16:16:08 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxaz8-0009Ki-1f;
	Thu, 18 Apr 2024 23:16:06 +0000
Date: Fri, 19 Apr 2024 07:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/parse-functions 9/12]
 sound/soc/sdca/sdca_functions.c:44:11: error: call to undeclared function
 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202404190735.7vG3UCfH-lkp@intel.com>
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
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404190735.7vG3UCfH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190735.7vG3UCfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190735.7vG3UCfH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/sdca/sdca_functions.c:10:
   In file included from include/linux/soundwire/sdw.h:9:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/sdca/sdca_functions.c:12:
   include/sound/sdca.h:33:1: error: expected identifier or '('
      33 | {
         | ^
   sound/soc/sdca/sdca_functions.c:14:5: error: redefinition of 'sdca_alloc'
      14 | int sdca_alloc(void **context,
         |     ^
   include/sound/sdca.h:25:19: note: previous definition is here
      25 | static inline int sdca_alloc(void **context,
         |                   ^
>> sound/soc/sdca/sdca_functions.c:44:11: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      44 |         status = acpi_evaluate_integer(adev->handle,
         |                  ^
   sound/soc/sdca/sdca_functions.c:44:11: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
     550 |                             acpi_evaluate_object(acpi_handle object,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
>> sound/soc/sdca/sdca_functions.c:44:37: error: incomplete definition of type 'struct acpi_device'
      44 |         status = acpi_evaluate_integer(adev->handle,
         |                                        ~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
>> sound/soc/sdca/sdca_functions.c:110:9: error: call to undeclared function 'acpi_dev_for_each_child'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |         return acpi_dev_for_each_child(adev, find_sdca_function, sdca);
         |                ^
   sound/soc/sdca/sdca_functions.c:110:9: note: did you mean 'device_for_each_child'?
   include/linux/device.h:1060:5: note: 'device_for_each_child' declared here
    1060 | int device_for_each_child(struct device *dev, void *data,
         |     ^
   5 warnings and 5 errors generated.


vim +/acpi_evaluate_integer +44 sound/soc/sdca/sdca_functions.c

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
