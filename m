Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793076520;
	b=fEKxTNpNpmIO9ZWacxgcK9kj/Pjc+gB+wT+tN0EUk0zd7V+T32AtwS1eZtSX+arDsvwN
	 F31soBG0b3eHj5waTqVAVFEMhyYBxCU9xTt6xRxuQRRXy6U5jNdVuxHbhAyUMkd03qdDW
	 sFB/jdEdbMvD0r1aTtsp1rCmY0ssSMvk13ylFHA5JLM+RnwxjlfNmnDVC8JC2M8Y2kQhy
	 WxnW7IzopNywSueCQp6lJDgI0p/BbWlMhncJiI8N+ByAGGFjpueFG74prGMyjWIUYexr9
	 el03vzUleBPO3JxQKFWG3RpxHQ9ncXA/EaVHhQXbcpPhuRiEQyhKCzaDQMYuoTpd7ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076520;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Y+JTv5rYNBbHs9BbzcKbF1n78nuXP9mgmC5sBnYk5ZE=;
	b=kKXJTVNyGqLjJYgItsBOLe1k1FAV+dqWuGGYabDo4VYovfUvtWRdqq3U726nLABWNLlV
	 iW70jsuIDkBXgTuop8B+xoSDQeqpoO24kgFTqFq0d/RU+HXBZVhzNeGkOF6MtAhmF0g2j
	 bOMXsU+kep3n/3aNgM9fQXJY/miPvbMmBeXbP+fDh5EsteRxlgeiazcnP6+DyeJREdmqw
	 aarfKmag4Lq6255mC8oedpL8rJvrAPT7+g5iZT30t/2VbqOZaYSuySEs0fq6LgWldc152
	 IcTPcRN0X0CY0Gb8Zd2G9JfuuEabR91PW7vve8n4nlj6h2lMGOpT/3Ef/8EzTAUv6jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TGPpghBI;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88255606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 04:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88255606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TGPpghBI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793076518; x=1824612518;
  h=date:from:to:cc:subject:message-id;
  bh=3QQTbMbJIqsE1k9AO/UxyTyb3drJs8XJ0BYTNFL0lno=;
  b=TGPpghBIG/zXPGmN56wcR4o0+hZ2iGPwYez3d66Yo64NuzW9NWgK4Slb
   1FfsPQas26v7ifUXxkn4tnz6c11TE/7FVR311urlndW7uhHvR0BC7Ym93
   7BPIUNqTycBZmBZskz1u9l5L1SHGKWOSAWZIaBrgXK5PNWKIe9DhyzALM
   ryrU8jl2l37iVi44GUDISWp/NHCaiapQVwOI+gaCVslqvaPPdvHBORXSZ
   kEhWvVjMXMolvieqSNEWUoEPS/yxZ++Tnfj9yDpuXQiCbynzzQMjVj7wV
   sohjn2+losT+/AXpkj5H2xntj4qVtpgM4FqX2FBrMM//rqEkihq8FDHBn
   Q==;
X-CSE-ConnectionGUID: jx//7PQSQLyrD+K2RS/XEQ==
X-CSE-MsgGUID: pxe4ZQFUQ0OyxJkEmTI+0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1777009"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1777009"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 21:48:16 -0700
X-CSE-ConnectionGUID: m0LzlfvTR1+SbBP1sv17fA==
X-CSE-MsgGUID: SpZy1VGTTBOjYJF2CjAPHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6323987"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 26 Oct 2026 21:48:14 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLZ6Z-000000004OJ-2KWH;
	Tue, 27 Oct 2026 04:48:11 +0000
Date: Tue, 27 Oct 2026 05:47:58 +0100
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:for-next/scmi/fixes 24/24]
 drivers/firmware/arm_scmi/driver.c:3110:16: error: call to undeclared
 function 'acpi_device_hid'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202610270525.oVjCqg5U-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/scmi/fixes
head:   7f73b4cb4b3afff60577e5ddc532fd026b55d4e5
commit: 7f73b4cb4b3afff60577e5ddc532fd026b55d4e5 [24/24] firmware: arm_scmi: Drop redundant ACPI configuration guard
config: arm-randconfig-r2101-20261027 (https://download.01.org/0day-ci/archive/20261027/202610270525.oVjCqg5U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270525.oVjCqg5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270525.oVjCqg5U-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/driver.c:3110:16: error: call to undeclared function 'acpi_device_hid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3110 |         return adev ? acpi_device_hid(adev) : "unknown";
         |                       ^
   drivers/firmware/arm_scmi/driver.c:3110:16: note: did you mean 'acpi_device_handle'?
   include/linux/acpi.h:919:27: note: 'acpi_device_handle' declared here
     919 | static inline acpi_handle acpi_device_handle(struct acpi_device *adev)
         |                           ^
>> drivers/firmware/arm_scmi/driver.c:3110:14: warning: pointer/integer type mismatch in conditional expression ('int' and 'char *') [-Wconditional-type-mismatch]
    3110 |         return adev ? acpi_device_hid(adev) : "unknown";
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~
   1 warning and 1 error generated.


vim +/acpi_device_hid +3110 drivers/firmware/arm_scmi/driver.c

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
