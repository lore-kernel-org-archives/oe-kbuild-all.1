Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185002;
	b=poIegUBiFV6u25RsNSgC6upeABwtH7etBhxfw2f4aWYqtGE37qjypwNpZ/zXRjkKm3Vi
	 NscVEnAUfHJJrK3PtfMwRnxrjkk5Z3M0wr8/ntFytM8ASmjzd6cIiXjZvFgKeF1xaVNrS
	 8AO7dTD9y/c670MYDLKRO0LYM+bwhDomNI5h1zp66toMDmXsDiyESIu/XMdLVmLi93qhT
	 EA9wI75fISN3Dum9K17pmXzraav5KvMvwmevr4e0wL4kSKcW88vP9268Yg5XaDrxe/GAa
	 FaSiMFWuP+qWeraHbXuNcB94801lNgaFKxPD9vUDJztqqIFozVAafSbZdr4za+PYHsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185002;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XIkuWJyhovRjdnBVv+R40w96cXaqcfEw/jLQUYK23Jw=;
	b=SNjkLI0FtP69+QskQSsX/TKvxqJRSorWqKV+Fhet2LvNlTaHay3iyoSMKm9LJkUS8npq
	 APBKulOWNbq3SkGZ+HAZMdpGJs9RWzNXo5gFjh/QxP5jzy3ub6veQB3N2tbPJTkEIIcRS
	 nzLo4vUmOF1lFLWE1IjaYUqUcCHeStyAwoowhu+b+ZibFdSpn67DGfp0dx7Ry/il2bPVy
	 3rwvnDoeCIbhJMDJqH3ONl/gNDO9Fl+XK0JJuKC43W1IYvOHIWBurAh4seHj5beOxIOMJ
	 nERFjlQmEeZ38yujQAWxawCNa/2G8gGGFCAv53XVJG3WA5Nh8SA/Cpwr1CxUrcCVh8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Of0y+led;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266A7606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 10:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Of0y+led
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793185001; x=1824721001;
  h=date:from:to:cc:subject:message-id;
  bh=ZP4Y95Ialw4x5gKGD4c+lqgoj1XnWHHuYLZsqJMVmII=;
  b=Of0y+ledBUlBRMutYePGA1wb2503eXzmAIz4+KwoDYEsS+it1qEvx2U+
   2BTIeWBVlt5vub4X4vD9NzFTl8cH0aNYuQIb5RLgqBDl0+bkGNQAuLV9g
   tjJnURT3M/eq+j3A6i1+xlP5DHVNdbhbzq4kU/OaWh00N2KK3sl1L/EA2
   uVAxiz60pnckjOmYayRduB6cQLhR4Tj+eP18eaT07G9MPb5sXG1QQ3LCR
   82A+vW5OiY4XBBy1D96KGlMYgAs2Acs+3Q0CfuiWxeninhGrY3QOV3gHl
   whUTe25kXKI7OSVsIyMTtObnjCWaY0kjNgI8aaWihO0FjMKBHnfRnPqr+
   g==;
X-CSE-ConnectionGUID: 0t0DDAv9R72l2MnG5loYdA==
X-CSE-MsgGUID: Wk5M8SdYTS6+35WrH2XYfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1926007"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1926007"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 03:56:40 -0700
X-CSE-ConnectionGUID: dmVzEADdSyKqDgRATLoCUg==
X-CSE-MsgGUID: mgk4gkPWRVGOGxS7TnAWiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4822138"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2026 03:56:39 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM1Kd-00000000Yc8-11c7;
	Wed, 28 Oct 2026 10:56:35 +0000
Date: Wed, 28 Oct 2026 18:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 20068/20451]
 drivers/firmware/arm_scmi/driver.c:3110:23: error: implicit declaration of
 function 'acpi_device_hid'; did you mean 'acpi_device_handle'?
Message-ID: <202610281806.897kSNcR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   151a134a4e6ec66f69db8750c66006f5207f7a9d
commit: 7f73b4cb4b3afff60577e5ddc532fd026b55d4e5 [20068/20451] firmware: arm_scmi: Drop redundant ACPI configuration guard
config: arm-randconfig-1002-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281806.897kSNcR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281806.897kSNcR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281806.897kSNcR-lkp@intel.com/

Note: the linux-next/master HEAD 151a134a4e6ec66f69db8750c66006f5207f7a9d builds fine.
      It may have been fixed somewhere.

All error/warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/driver.c: In function 'scmi_acpi_device_hid':
>> drivers/firmware/arm_scmi/driver.c:3110:23: error: implicit declaration of function 'acpi_device_hid'; did you mean 'acpi_device_handle'? [-Werror=implicit-function-declaration]
    3110 |         return adev ? acpi_device_hid(adev) : "unknown";
         |                       ^~~~~~~~~~~~~~~
         |                       acpi_device_handle
>> drivers/firmware/arm_scmi/driver.c:3110:45: warning: pointer/integer type mismatch in conditional expression
    3110 |         return adev ? acpi_device_hid(adev) : "unknown";
         |                                             ^
   cc1: some warnings being treated as errors


vim +3110 drivers/firmware/arm_scmi/driver.c

c3d4aed763ce4a Cristian Marussi 2023-01-18  3107  
17b3cdaa7ab4e9 Sudeep Holla     2026-09-15  3108  static const char *scmi_acpi_device_hid(struct acpi_device *adev)
17b3cdaa7ab4e9 Sudeep Holla     2026-09-15  3109  {
17b3cdaa7ab4e9 Sudeep Holla     2026-09-15 @3110  	return adev ? acpi_device_hid(adev) : "unknown";
17b3cdaa7ab4e9 Sudeep Holla     2026-09-15  3111  }
17b3cdaa7ab4e9 Sudeep Holla     2026-09-15  3112  

:::::: The code at line 3110 was first introduced by commit
:::::: 17b3cdaa7ab4e9c4fc9b1b6816e80d9ade153272 firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent

:::::: TO: Sudeep Holla <sudeep.holla@kernel.org>
:::::: CC: Sudeep Holla <sudeep.holla@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
