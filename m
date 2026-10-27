Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077758;
	b=NzD/97+sKBFjipaC9sNBnyQcMjLCPHTC6LRemT8sJfl9GJCIP+07JtjPJ4L0Gl52VQF9
	 Ur23eho5YB7LJZ78VKsWIBOJQI/IlUAQkdj5ExykF1WEbQPOLF74jroIoBFzaCH0ZQ3oJ
	 yhG5jrG1SfLGVnQQ152GIlTpeymT2jC6Oemq2MWiSrPoytcgm3Y9SwCxxajxvTfQaQUfI
	 9fVgmAc+SS14IgjI/9nqiVl+tY7RRuCMSQKBF7YDhubdiR/+8xPEuYlldQ4PQMx8YHzMR
	 oI7RHSeNKeYa8lrQ9S/uv7sj2DJMl/qlZtVa8nWGVmM2x7cEppgRUfyRTKol0Ww4HQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077758;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NHPnJZBrJpQ5+AWk4gYRaNB/oG3q/Yk+gd+3bHVukhY=;
	b=VzxdAjOyIuXjndIrYVEWwVFyX7xiOitdiaUZI3g+85rgQeOEaRqmUMhDHb/S1dHRhuqp
	 cSSen4tAi0kkRqmcexFSKp8hXx13+WcR4BiIfnhfxUE4p8MOcHWKMrFfQluxEAcwqDzRJ
	 +rD4CR1nbhRUhOSs5qNo/Y5V8G8Rxw2/fll1RP5iWjz/g9+zw3L9nvxLyAir5AlySTFrr
	 8abYGUaWJ+lnjN15qlZnT8i2OPSq9eEkBCgu7Qtvn3bAYfj22/lGMCShkTmpPKlDIAQPv
	 n+igUvsriRpUchXPWayZIyD8v6ZeEiv4bjoJXQy5mjp32QltaMytRcQDQjUCnmPyfSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d7JqJQT+;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A264606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 05:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A264606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d7JqJQT+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793077757; x=1824613757;
  h=date:from:to:cc:subject:message-id;
  bh=XXjXwtPAUxwQQvEDAolHOuVsR2HfQocBzlVGgyAh+Zk=;
  b=d7JqJQT+FYA6qHvCuW5ChGF+6Mqq8pin8tA4U7i3iUR3eLcjZiVIyh8T
   RXbFS9iW+JeBmZ6XRELGNxs7NArCY3VkXrm8+bn+jT6+n63xLcbAa+ERQ
   i/b6FdM+/ZhtcldPsk0c8JbX8OLRoTLM5WGRIAHl9Dm133FUnEi6rDpT/
   FiRAmFelZb7czosF3kzsR4GcmbpxmhLXEurGb3GWzfjiuCEz8RzYdu1VX
   3Xcz1odQO7lXDDi5lhtMwzRc6xgSzarZcNfQxJ3o9HRRwPttreU+sCuFo
   fur1GsDsStiWLKJQfrUlP47xfXKYowQ1lpzectl2LUR6Xpa3w0RIXJ5Ub
   A==;
X-CSE-ConnectionGUID: B99yZBHjR9qUmp+lAumkoQ==
X-CSE-MsgGUID: EQUSeqkmS/Kmtj8gkA7JoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1778460"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1778460"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 22:09:16 -0700
X-CSE-ConnectionGUID: Kko93yLnSsqA7qcXL02eUA==
X-CSE-MsgGUID: /wDmSVXvSwCzL6vDhgoEFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6328287"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 26 Oct 2026 22:09:14 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLZQu-000000004Od-0AC7;
	Tue, 27 Oct 2026 05:09:12 +0000
Date: Tue, 27 Oct 2026 06:08:33 +0100
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:for-next/scmi/fixes 24/24]
 drivers/firmware/arm_scmi/driver.c:3110:38: warning: pointer/integer type
 mismatch in conditional expression
Message-ID: <202610270659.qEQG8Wmk-lkp@intel.com>
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
config: parisc-randconfig-2001-20261027 (https://download.01.org/0day-ci/archive/20261027/202610270659.qEQG8Wmk-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270659.qEQG8Wmk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270659.qEQG8Wmk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/driver.c: In function 'scmi_acpi_device_hid':
   drivers/firmware/arm_scmi/driver.c:3110:16: error: implicit declaration of function 'acpi_device_hid'; did you mean 'acpi_device_handle'? [-Werror=implicit-function-declaration]
    3110 |  return adev ? acpi_device_hid(adev) : "unknown";
         |                ^~~~~~~~~~~~~~~
         |                acpi_device_handle
>> drivers/firmware/arm_scmi/driver.c:3110:38: warning: pointer/integer type mismatch in conditional expression
    3110 |  return adev ? acpi_device_hid(adev) : "unknown";
         |                                      ^
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
