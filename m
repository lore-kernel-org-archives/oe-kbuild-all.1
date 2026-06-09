Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DF4C041A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025606; cv=none; b=QphzF78DvOHLORiXg/iLz+Cj3VTGwPlM6wtNtg1Ya2jFxYBoGDi8tV1hSU1djJxPY8sfu3eL+iKcQQreteYy1YWZaAt9xhYiLoKFQX8mY+KI8MHojE6OWHqfVR3HrAAl3l/rTeLX8vM/ktnzUuqay8mVc2JEcxjcTCvqapwy47c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025606; c=relaxed/simple;
	bh=aubPIJdNWfz5gb/CbdjvYyyXJwymfbwR01BZgt/fuZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PECJtSGHeELDI5OIBOeKYtpGVJ8o+uAupmFOGjcQVMi9ihUpsns9lvdN8VSvyr4VT4x0RO/L7gjaGqo8m8qc30QrhDkBhTIxrDxMF4xD25IiJOzcQdd34MzwiMO/zCEQwmafgRIPsv8RfIMQ75+z0gOpGChu20Oxp6aB9xITiMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ob504M48; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ob504M48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781025605; x=1812561605;
  h=date:from:to:cc:subject:message-id;
  bh=aubPIJdNWfz5gb/CbdjvYyyXJwymfbwR01BZgt/fuZU=;
  b=Ob504M487fTJziYw5m5h/04yPzlzdO9jIe8O7ZMunAzN6N9ZNGnBrv9S
   S+tDIQOcEN5CcuoB1grg1eXlzdZgXUDyZZcHPGZDr9dHzY0JAjVKRCUwg
   s55PtOozFGKFI4VfzwHXtGjPf1USkHcvPPYs4hnBrSl6tH+6430Hpfebs
   GlN5ivTykSZEyadF0CC1dHYmtd1no/+iPVGCeWq3HFLw6753AXCsilKyO
   45kSAWFS22Jg3yZHvQC2yVxtkBwUcB/PwCP1n/g04TPivV+QHTsM//QC5
   YWOFh/NVaOfWAzIj5dmwZXjRvH/fO9w9KvHgUh9I89N9+zZ2iHcbJEe9J
   Q==;
X-CSE-ConnectionGUID: 3Yh66eUgRviHyXTe25G75A==
X-CSE-MsgGUID: ygTcjN/yQ5WFHYd+b1typA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85644730"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="85644730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 10:20:05 -0700
X-CSE-ConnectionGUID: wlMT9KqzTXqYWHMc3P6yKQ==
X-CSE-MsgGUID: cn7suAwETJycOIAU7/LEWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="242957020"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2026 10:20:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX07M-00000000KLq-2Yij;
	Tue, 09 Jun 2026 17:20:00 +0000
Date: Wed, 10 Jun 2026 01:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 31/31]
 drivers/hid/spi-hid/spi-hid-core.c:361:8: warning: 'const' type qualifier on
 return type has no effect
Message-ID: <202606100102.godb97gP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a4d01e77dd885e0545ecd445e2facf156ddf42f5
commit: b61fdddf40df4657f4c32f5241508cd3a4ce4ec4 [31/31] CHROMIUM: HID: spi_hid: add ACPI support for SPI over HID
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260610/202606100102.godb97gP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100102.godb97gP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100102.godb97gP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/spi-hid/spi-hid-core.c:361:8: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     361 | static const u32 spi_hid_get_timeout(struct spi_hid *shid)
         |        ^~~~~
   drivers/hid/spi-hid/spi-hid-core.c:247:13: warning: unused function 'spi_hid_suspend' [-Wunused-function]
     247 | static void spi_hid_suspend(struct spi_hid *shid)
         |             ^~~~~~~~~~~~~~~
   drivers/hid/spi-hid/spi-hid-core.c:252:13: warning: unused function 'spi_hid_resume' [-Wunused-function]
     252 | static void spi_hid_resume(struct spi_hid *shid)
         |             ^~~~~~~~~~~~~~
   3 warnings generated.


vim +/const +361 drivers/hid/spi-hid/spi-hid-core.c

b92291c9316fb3a Angela Czubak  2023-03-24  360  
890ead8d6ab51b2 Jingyuan Liang 2026-01-15 @361  static const u32 spi_hid_get_timeout(struct spi_hid *shid)
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  362  {
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  363  	struct device *dev = &shid->spi->dev;
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  364  	u32 timeout;
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  365  
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  366  	timeout = READ_ONCE(shid->ops->response_timeout_ms);
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  367  
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  368  	if (timeout < SPI_HID_RESPONSE_TIMEOUT_MS || timeout > 10000) {
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  369  		dev_warn(dev, "Response timeout is out of range, using default %d",
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  370  			SPI_HID_RESPONSE_TIMEOUT_MS);
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  371  		timeout = SPI_HID_RESPONSE_TIMEOUT_MS;
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  372  	}
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  373  
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  374  	return timeout;
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  375  }
890ead8d6ab51b2 Jingyuan Liang 2026-01-15  376  

:::::: The code at line 361 was first introduced by commit
:::::: 890ead8d6ab51b21af1605ec22461e81ba6064dc CHROMIUM: HID:spi-hid: add quirk to support mode switch

:::::: TO: Jingyuan Liang <jingyliang@chromium.org>
:::::: CC: chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
