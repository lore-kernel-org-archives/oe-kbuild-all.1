Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659F437A839
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003999; cv=none; b=WTKKWblLJw6K9j5NX/2OuZMdSaQ67U1gH++vutzUUXRWyMdEBHwO4GmUbAAgza2jbufeOpah/qkcPSnPOevE0ufO6iyMDu1mVrKxaQEQ86t6p7TgVC9fiD7JVkoDL10KIfjAg2iOpIIaQEtZJIgbM1KEMRrZNLEELLscq/oMriE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003999; c=relaxed/simple;
	bh=VbcLmpqdxy58NnFu/X1kEFKYoXlaClCUAOrgvKUCtiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rry5UK3HwaPI2ZEiyF7sGpUcd0EG5w0bC876zxsDLaesLcFwLWM/FT9tWaB11FqmSIE2aWitN7NB+AML/MtTF4bIbvBnSZHaG/6iQIafNGTqQcEsHrCNt6k4MxsIl0zFrYtfXjyuPEHf5n8SHx/opfs9jBZI8W9lv3PfRm06SKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNHkGIJk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNHkGIJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783003999; x=1814539999;
  h=date:from:to:cc:subject:message-id;
  bh=VbcLmpqdxy58NnFu/X1kEFKYoXlaClCUAOrgvKUCtiM=;
  b=QNHkGIJk8fnCWswOgEJKULxd473DiiLYH7x3NttnX4ZHFQm/5RuwrLQT
   eCEMNw1T8+ZvyUWYrLWImzl+w53yotJsXZDDdWH7fpfhEKa2nXQfeZdtE
   THvXZU3GVos5CvGOoeIQFVTRYQeNdxTEkY1xQmR7lJxaEr+cz5PineEdl
   LshGTg+T4aDpLWwZAc+ucs2EJ45+4nA0sFgIaTurDFm1XpPiwJl7FP6Em
   PzgwuJD2LXgnNdYLZ8CT5BgTwPVw3kpo0nPhdGEML0WZ2p8egu+rx5PX5
   cquzjmh90v3/K1Ph+iZoOPvbHFKNM7xUCne4kgbLy0v3OsaiJStYaafjP
   w==;
X-CSE-ConnectionGUID: 3NoNfPojRPe3THXwtR3M3w==
X-CSE-MsgGUID: pSE4hHCETYCUXKfyva2jCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83851558"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="83851558"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:53:18 -0700
X-CSE-ConnectionGUID: jvVKNQ29TiSWXAoyo5o5+A==
X-CSE-MsgGUID: WqXCLjx/RxixURXTam46Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="248429798"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 07:53:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfImw-00000000AsN-0yZE;
	Thu, 02 Jul 2026 14:53:14 +0000
Date: Thu, 02 Jul 2026 22:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/acpi_scmi_pcc 22/23]
 drivers/firmware/arm_scmi/common.h:476:29: warning: 'scmi_dsd_info_list'
 defined but not used
Message-ID: <202607022234.oi7Uq0oa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_scmi_pcc
head:   c1daed90f65670f1d0231c3ab8a569b682181b2b
commit: 3527482b5aac070ec7c5ef2b085567c531a5991e [22/23] firmware: arm_scmi: transport: Add ACPI PCC transport
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607022234.oi7Uq0oa-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022234.oi7Uq0oa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022234.oi7Uq0oa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/arm_scmi/bus.c:18:
>> drivers/firmware/arm_scmi/common.h:476:29: warning: 'scmi_dsd_info_list' defined but not used [-Wunused-variable]
     476 | static struct scmi_dsd_info scmi_dsd_info_list[] = {
         |                             ^~~~~~~~~~~~~~~~~~
--
   drivers/firmware/arm_scmi/driver.c: In function 'scmi_debugfs_common_setup':
   drivers/firmware/arm_scmi/driver.c:3072:32: error: implicit declaration of function 'acpi_device_hid'; did you mean 'acpi_device_handle'? [-Wimplicit-function-declaration]
    3072 |                 c_ptr = adev ? acpi_device_hid(adev) : "unknown";
         |                                ^~~~~~~~~~~~~~~
         |                                acpi_device_handle
   drivers/firmware/arm_scmi/driver.c:3072:54: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
    3072 |                 c_ptr = adev ? acpi_device_hid(adev) : "unknown";
         |                                                      ^
   In file included from drivers/firmware/arm_scmi/driver.c:41:
   drivers/firmware/arm_scmi/common.h: At top level:
>> drivers/firmware/arm_scmi/common.h:476:29: warning: 'scmi_dsd_info_list' defined but not used [-Wunused-variable]
     476 | static struct scmi_dsd_info scmi_dsd_info_list[] = {
         |                             ^~~~~~~~~~~~~~~~~~
--
   drivers/firmware/arm_scmi/transports/mailbox.c: In function 'mailbox_chan_setup':
   drivers/firmware/arm_scmi/transports/mailbox.c:258:1: warning: label 'err_free_chan_receiver' defined but not used [-Wunused-label]
     258 | err_free_chan_receiver:
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/arm_scmi/transports/mailbox.c:17:
   drivers/firmware/arm_scmi/transports/../common.h: At top level:
>> drivers/firmware/arm_scmi/transports/../common.h:476:29: warning: 'scmi_dsd_info_list' defined but not used [-Wunused-variable]
     476 | static struct scmi_dsd_info scmi_dsd_info_list[] = {
         |                             ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/firmware/arm_scmi/transports/virtio.c:31:
>> drivers/firmware/arm_scmi/transports/../common.h:476:29: warning: 'scmi_dsd_info_list' defined but not used [-Wunused-variable]
     476 | static struct scmi_dsd_info scmi_dsd_info_list[] = {
         |                             ^~~~~~~~~~~~~~~~~~


vim +/scmi_dsd_info_list +476 drivers/firmware/arm_scmi/common.h

   475	
 > 476	static struct scmi_dsd_info scmi_dsd_info_list[] = {
   477		{ SCMI_PROTOCOL_BASE, "arm-arml0001-transport-pcc"},
   478		{ SCMI_PROTOCOL_POWERCAP, "arm-arml0001-protocol-pcap"},
   479		{ SCMI_PROTOCOL_TELEMETRY, "arm-arml0001-protocol-telemetry"},
   480	};
   481	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
