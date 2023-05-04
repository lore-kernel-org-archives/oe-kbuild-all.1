Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA4A156C1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 22:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683239516; x=1714775516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=laho4Ug/FbpczLp0mY4+jRDMQtPqA1qDPgD1/qJ6mjc=;
  b=IZG/uWTHiuxvpeS5JUrs/T1cxa4J+Rs4HYZ4VLr20eC/dJRA6q62A59Q
   MUucJtxavrHXqYlIDLCuUY18GAJCC/GjfUsGS8S84zaKD0PFrUdjpdjWO
   tq3vXVOmSRAycFBvYMpEfH0/4ic9UmmUBz6Mr+b3336tEho5FyIsfjqJC
   ZSR7S46AxRirgBOfMIaktyf+qHih75l0b/26ZN0yhpUm32UIpI4p0tS8p
   UajCtwJC7b3u1It6py9mfgFDq7y8cxetqJxt7wOILN0zhjiuo/mAuyxZo
   dFs/3feX1kro3PAZCDO5mJ9b7kiSX6HB2Kq1mzgz7h7Mh1eX/kRiUcFsm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="346544535"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="346544535"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 15:31:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="730012647"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="730012647"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 May 2023 15:31:54 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puhUP-0000Ae-2V;
	Thu, 04 May 2023 22:31:53 +0000
Date: Fri, 5 May 2023 06:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 19/28] drivers/acpi/numa/hmat.c:132: warning:
 expecting prototype for acpi_get_gen_coordinates(). Prototype was for
 acpi_get_genport_coordinates() instead
Message-ID: <202305050645.311S2A2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   c09d294a320a41a687ff2881bc080bf7d9ee5ce2
commit: 8311ace8a090b259fe9bdb833d38f683674da18d [19/28] ACPI: NUMA: Add helper function to retrieve the performance attributes
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230505/202305050645.311S2A2t-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=8311ace8a090b259fe9bdb833d38f683674da18d
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 8311ace8a090b259fe9bdb833d38f683674da18d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/acpi/numa/ drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050645.311S2A2t-lkp@intel.com/

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
   143	EXPORT_SYMBOL_GPL(acpi_get_genport_coordinates);
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
