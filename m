Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196505;
	b=XmZD4YekOznp0yx8T0JVcM4iOx4/bTRoQujv3f2P8VT35LlJUpLLqAlYO5XmzH2Svxfn
	 vecvh1Gx0ZXd/Q7fnq+TxyVTPqhOpLfmTcEkwCtcANrEYSKK9olI1+YCGwgRLI7uop2bU
	 280/0pFVSN1Ll3ddCqcVJJhxXN3jhZmY3uWBWLxx1QMMhF8Ixtr3dcXttGU4c9MfQIXji
	 nMUs4jpETAr3z8Q5MPNB8m8J0hgWBUBkVtP+FfFp0ufqGmtcRgRPsW7roePZ2mLXgJX85
	 d9B5VcI8DFibjo7mmT6r2QRHwOHP9xYoMyrcyJQIDFu3bRJbqP3xHi4B+Qd6Uuv1WVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196505;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BjbCmbJ+e7rxiGFGXkFwt9llGqiIMTVJEVv+k92bGzA=;
	b=dKvuRaXPd/EfrG56AS7Zoq1ke/DvMSABHtRehWIfjDvoJqPjQPEc/mjcXFqiOSlvpKT9
	 1hXEhhXEV3hjceXovvuJDi1vCH9CIJfWisL6q+5DIBonhfeHrOU8Ex0A0ujf1R8jwOmnW
	 J6+LKeZB2ffPj8+CjFuDQBz2YBVUzVU8++inQMcKSLwUkGHhlEONZbzgoPunBc1NBphNE
	 kSAF9E9rlQffI5cAP/gJQjZO/Xg5me1jm6wC92SkWjWIJ7nBytp/yNuLIAyvHbZ368z8G
	 DxY1D6aSIPJL1oiMHFSQahZjoTTajeFmzYNAa/+6MA6NGNOS4t1nSjCFKT0E0VhoNDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxL6tpwh;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A0606A31F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 14:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 761A0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxL6tpwh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793196504; x=1824732504;
  h=date:from:to:cc:subject:message-id;
  bh=YtymLCZRBwhzXeZIh1wH6S7zfHq4pg3/S+H7IOFGUJQ=;
  b=OxL6tpwhdoQOAEoJdElJ9C8gE9W5m2erUFjpa1ZoVin/V1fJN5nbvlt/
   J2c0NfLx0+xndGklF/7k+EkNIQk5p1p17EMLuzhmJNuPbv2FEf3r1hssu
   VE2osXh+NDEnFk1ElNKclztN4oGo3zMfAlA8Aqc4tNik1xTZ+Cab0AeqP
   zp3ytNTWUIHWtJxyfse/ONXldEiUQJCBMtyaLS0cFwquy+UMHwhbLprXs
   OO8WeXCB9GneDydGAr0852/33yJqm5Kr35vGghkzwWAqRRR2+JVt9G0Ph
   Z2iCrFXK97MMYcg9JYwPR7a4XReBPdTVPTFgjwsUmN/ISq4kKTASbM93W
   w==;
X-CSE-ConnectionGUID: FSqCDuHlQJCx8UPCtu6ewQ==
X-CSE-MsgGUID: s7ktlLDgSAC69EIJcceW+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1802292"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1802292"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 07:08:23 -0700
X-CSE-ConnectionGUID: yjsu4DMRRU+Wxxk1I1Hc2Q==
X-CSE-MsgGUID: 7jmEvSgqTIK8kBC9qedOvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4898491"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2026 07:08:23 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM4KB-00000000YpK-2PMZ;
	Wed, 28 Oct 2026 14:08:19 +0000
Date: Wed, 28 Oct 2026 22:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 20068/20451]
 drivers/firmware/arm_scmi/driver.c:3110:45: error: pointer/integer type
 mismatch in conditional expression
Message-ID: <202610282148.lpOpr7Kl-lkp@intel.com>
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
config: sparc-randconfig-1000-20261028 (https://download.01.org/0day-ci/archive/20261028/202610282148.lpOpr7Kl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282148.lpOpr7Kl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282148.lpOpr7Kl-lkp@intel.com/

Note: the linux-next/master HEAD 151a134a4e6ec66f69db8750c66006f5207f7a9d builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/firmware/arm_scmi/driver.c: In function 'scmi_acpi_device_hid':
   drivers/firmware/arm_scmi/driver.c:3110:23: error: implicit declaration of function 'acpi_device_hid'; did you mean 'acpi_device_handle'? [-Wimplicit-function-declaration]
    3110 |         return adev ? acpi_device_hid(adev) : "unknown";
         |                       ^~~~~~~~~~~~~~~
         |                       acpi_device_handle
>> drivers/firmware/arm_scmi/driver.c:3110:45: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
    3110 |         return adev ? acpi_device_hid(adev) : "unknown";
         |                                             ^


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
