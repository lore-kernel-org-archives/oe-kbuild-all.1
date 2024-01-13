Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7062717BD2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoPR4Mdb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705141725; x=1736677725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILrpWLfqKzTrPduRJxQOnkI67EMXRyvpIKNRlk1gk1c=;
  b=XoPR4MdbNVaEBI7VX4OsmjZiAAVu/rPcabX8UdG8+EESRb2rcAHmn5nl
   wJfiBbpzh1b/yAn1IkMwP6nrh1pZ/hb+cHFjtU7fReVKXcNrOVHD73bEh
   MaE3kVAk5hiBrTHonj+X0BWoBVDi8D6iYCSVnbwgBeoPH+W0hAQSaPeWj
   dvwTTn+XIirrMXBJxxCyY/pnk4mHzVPM9QrSS7lQHy/fc7Y1qQmnHS1uO
   WEJPe/bgqFypIUMzQXCoFCt18cF8A9vxdHrs5RllR7KPyMx7qBwKBzcWe
   kvDBwx+zIlcRYsI8itLqcd/aZLpatSLDmYczmYkqd+utzyPCcpphSgdQy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6454791"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6454791"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 02:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="17668267"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2024 02:28:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rObFp-000ALq-1w;
	Sat, 13 Jan 2024 10:28:41 +0000
Date: Sat, 13 Jan 2024 18:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20638/21544]
 drivers/i2c/busses/i2c-zhaoxin.c:650:12: warning: 'zxi2c_resume' defined but
 not used
Message-ID: <202401131830.luikJ6dj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 735c81b4d33c46ea097f6437f63ea624ccf6dee1 [20638/21544] i2c: Add Zhaoxin I2C driver
config: x86_64-randconfig-002-20240112 (https://download.01.org/0day-ci/archive/20240113/202401131830.luikJ6dj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131830.luikJ6dj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131830.luikJ6dj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-zhaoxin.c:650:12: warning: 'zxi2c_resume' defined but not used [-Wunused-function]
     650 | static int zxi2c_resume(struct device *dev)
         |            ^~~~~~~~~~~~
>> drivers/i2c/busses/i2c-zhaoxin.c:645:12: warning: 'zxi2c_suspend' defined but not used [-Wunused-function]
     645 | static int zxi2c_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~


vim +/zxi2c_resume +650 drivers/i2c/busses/i2c-zhaoxin.c

   644	
 > 645	static int zxi2c_suspend(struct device *dev)
   646	{
   647		return 0;
   648	}
   649	
 > 650	static int zxi2c_resume(struct device *dev)
   651	{
   652		struct zxi2c *i2c = dev_get_drvdata(dev);
   653	
   654		zxi2c_module_reset(i2c);
   655		zxi2c_set_bus_speed(i2c);
   656	
   657		return 0;
   658	}
   659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
