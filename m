Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139E81105
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 04:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683348581; x=1714884581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jY/FJzE6HWkK4rPyfm4UYkiCxEMT7f/x07SbHgGCHEk=;
  b=Ao4ifB1UoXhH1CTujBpP6aUtrf4edtCBqocMR5M1D6PqoB6hrq1hiiUt
   6VWhCiceV40RrahTHD93dFo05lakd63GJuGFdAG10/KQ+J+p+WSSYHyur
   izR95bTOtbcAHHHH0AqnVJdm3AqUJOZZpSPSHg3k4B/BjSrxKoDkVgBwr
   xBNOi+39mQTkJCCSgdZvfS1GX+yCHtkagRKpOC9CB3PYkDLWKtiDViIgw
   pCbYQinC0X9AYcHNGO1STA6aHsa2GolTFnKHB513uFZDdzMVtVm8ina/K
   Z+E6PRVBjlIAKkyvh7IPyT11/lX4FJiHXFwYInAXSRDwnJhV5GoPFcLr4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349381445"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="349381445"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 21:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="730623002"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="730623002"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 May 2023 21:49:38 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv9rV-0001A1-3B;
	Sat, 06 May 2023 04:49:37 +0000
Date: Sat, 6 May 2023 12:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 21/29] drivers/cxl/acpi.c:550: undefined reference
 to `acpi_get_genport_coordinates'
Message-ID: <202305061230.R62TFkoG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   2bbfbdea968bdd6f52121799c47cb01be6b4abfb
commit: c659c0445d1d129865f9120264828823cbeebb84 [21/29] cxl: Store the access coordinates for the generic ports
config: arm64-randconfig-r003-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061230.R62TFkoG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=c659c0445d1d129865f9120264828823cbeebb84
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout c659c0445d1d129865f9120264828823cbeebb84
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061230.R62TFkoG-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/cxl/acpi.o: in function `get_genport_coordinates':
>> drivers/cxl/acpi.c:550: undefined reference to `acpi_get_genport_coordinates'


vim +550 drivers/cxl/acpi.c

   539	
   540	static int get_genport_coordinates(struct device *dev, struct cxl_dport *dport)
   541	{
   542		struct acpi_device *hb = to_cxl_host_bridge(NULL, dev);
   543		u8 handle[ACPI_SRAT_DEVICE_HANDLE_SIZE] = { 0 };
   544		int rc;
   545	
   546		/* ACPI spec 6.5 tABLE 5.65 */
   547		memcpy(handle, acpi_device_hid(hb), 8);
   548		memcpy(&handle[8], acpi_device_uid(hb), 4);
   549	
 > 550		rc = acpi_get_genport_coordinates(handle, dport->genport_coord);
   551		if (rc)
   552			return rc;
   553	
   554		return 0;
   555	}
   556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
