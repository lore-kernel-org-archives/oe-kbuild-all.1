Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ED6522C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="feSaKgYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698254062; x=1729790062;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ny6xNSEH9yC0hhM4SF8A3D/84YwRjvCD7xyVPPDAIAc=;
  b=feSaKgYbgdqBZbBZw6SGebZPzIx9xPxleaaRss9pMwqA2YsmeJJVKc2l
   mTn6bsgutIDC6Ip0CdGXSdF5CwolGbDcMF9qRgjIOuPHud6GjIfj+x+O0
   1JqA+KDK9XI4lYjHyjp3weJrqAu0PxWECm1f2qgoFmcJfe2tVccbSXYrA
   PFcRhZkw1ZO6E89ohEg8NiNMft+/AIU5vGSuDhaB9ZJfC/FGh8dW3mg3R
   jlAVTPD23Uc/LyCiTKRKAhIlokoL/6r3OcRogpP4kyQH/KqB0CWdzudra
   ZUa4b31UIJScVYXnPNaRX8EMXG4e0LPF6fZIkEOiir6270Cvrf4vKsEYi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="366703079"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="366703079"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 10:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6917371"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2023 10:14:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvhSU-00093j-0n;
	Wed, 25 Oct 2023 17:14:18 +0000
Date: Thu, 26 Oct 2023 01:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [kabel:turris-omnia-mcu-for-6.7 3/7] htmldocs:
 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:2: WARNING:
 Unexpected indentation.
Message-ID: <202310260149.22peIRke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git turris-omnia-mcu-for-6.7
head:   502852dc60f48980862e74d34eade79f4f1c8c54
commit: c1285aed4f394228eaea68bdd478be3a01857afc [3/7] platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
reproduce: (https://download.01.org/0day-ci/archive/20231026/202310260149.22peIRke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260149.22peIRke-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:2: WARNING: Unexpected indentation.
>> Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:2: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +2 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu

   > 2	Date:		November 2023
     3	KernelVersion:	6.7
     4	Contact:	Marek Behún <kabel@kernel.org>
     5	Description:	(RW) The front button on the Turris Omnia router can be
     6			configured either to change the intensity of all the LEDs on the
     7			front panel, or to send the press event to the CPU as an
     8			interrupt.
     9	
    10			This file switches between these two modes:
    11			- "mcu" makes the button press event be handled by the MCU to
    12			  change the LEDs panel intensity.
    13			- "cpu" makes the button press event be handled by the CPU.
    14	
    15			Format: %s.
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
