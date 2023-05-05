Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A3E156EF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 06:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683269706; x=1714805706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRLejS9R3/Ekug2XZ0QKhhL9TkyxL2UQbjQUEdcLya0=;
  b=nj7I3GUGq+imhdWTbzTZHgtqxNQy6CEvCKDWqUALZdNB645+TAqHnqyP
   cMRyTJyqdyu8AzFPkUUt5wC6EjJcdQBbEDVqBGs+XP4nioyTfrC83M2+T
   QTqeP3UCCqwiOX0A1jX9oMfnO2ZV5hb5ekZZIH7CjSF0SHMifOWXt+MY2
   1NSPb6KmGdw0/s1omAmbTm3me2QKq0KYUxgc+qtD1IAqxcRL+kAGVJbzz
   BthnKTg8bQ/PpeMPxxBlX9T8ei3oIae3S77CJBXUUByaC8yYwkGvl30cq
   o6TzaQ3GoUFBQNAerLawIJG3bBZZtrgLy/Awsf36ewxTHsakYAoDlVpy2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328768270"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="328768270"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 23:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="674912891"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="674912891"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 May 2023 23:55:04 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pupLM-0000JW-0I;
	Fri, 05 May 2023 06:55:04 +0000
Date: Fri, 5 May 2023 14:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 19/28] drivers/acpi/numa/hmat.c:132: warning:
 expecting prototype for acpi_get_gen_coordinates(). Prototype was for
 acpi_get_genport_coordinates() instead
Message-ID: <202305051421.QKRxSKeD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   9886f103c3199579cd90527beea9adb301ffebbd
commit: 591eb88d0f4a67db371229bb7ab223d08624357d [19/28] acpi: numa: Add helper function to retrieve the performance attributes
config: loongarch-buildonly-randconfig-r001-20230501 (https://download.01.org/0day-ci/archive/20230505/202305051421.QKRxSKeD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=591eb88d0f4a67db371229bb7ab223d08624357d
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 591eb88d0f4a67db371229bb7ab223d08624357d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/acpi/numa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051421.QKRxSKeD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/numa/hmat.c:132: warning: expecting prototype for acpi_get_gen_coordinates(). Prototype was for acpi_get_genport_coordinates() instead


vim +132 drivers/acpi/numa/hmat.c

   122	
   123	/**
   124	 * acpi_get_gen_coordinates - Retrieve the access coordinates for a generic port
   125	 * @device_handle: Device handle string (ACPI or PCI) to match up to the gen port
   126	 * @coord: The access coordinates written back out for the generic port
   127	 *
   128	 * Return: 0 on success. Errno on failure.
   129	 */
   130	int acpi_get_genport_coordinates(u8 *device_handle,
   131					 struct access_coordinate *coord)
 > 132	{
   133		struct memory_target *target;
   134	
   135		target = acpi_find_genport_target(device_handle);
   136		if (!target)
   137			return -ENOENT;
   138	
   139		*coord = target->coord[NODE_ACCESS_CLASS_GENPORT];
   140	
   141		return 0;
   142	}
   143	EXPORT_SYMBOL_NS_GPL(acpi_get_genport_coordinates, CXL);
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
