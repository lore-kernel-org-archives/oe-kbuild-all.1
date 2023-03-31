Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F64A1864
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 04:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680238525; x=1711774525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74aDnL4CgYqElVPuXizeTHjN9xipX0/9zpPyGpYp8WI=;
  b=e9RKQ06m2+t6IjNHCqs5CzPKpiOGTDMa7bpoNABblnJyzJGr5TW9Pdrk
   gXAQBnkEdAkRwvvYx0DTcxsTUXo1NPoTyR3W//qo44x2huegvq1IHRGlx
   iVx8k/vPaWzQH32fe+BL+3gMJwOfp6b/cW4ZQaDxP4YH1kQwbsLcj1bdb
   +Z0sXkqVGxf/Jy4FbU777BdsWfezZS6exqZ4W0eQrpR22RcS6vctYmHhU
   Q2N/NDLNKid4VBJPJYHPaqVG8mCux+MjtlSOJayUh220lKcSCm3vYCqsA
   /UTCysJTUr3MYJJBOalIC/xhD1AHkNGarUNJZYOKsUE+aGdxDMtuga85u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="404065336"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="404065336"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 21:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="859158729"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="859158729"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Mar 2023 21:55:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi6nK-000LVU-2l;
	Fri, 31 Mar 2023 04:55:22 +0000
Date: Fri, 31 Mar 2023 12:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:class_cleanup 105/105]
 drivers/char/xilinx_hwicap/xilinx_hwicap.c:117:15: error: expected '='
 before string constant
Message-ID: <202303311216.GZ7eEB7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git class_cleanup
head:   b21f747c419ca7d3910446cf21f23fd4cdfad597
commit: b21f747c419ca7d3910446cf21f23fd4cdfad597 [105/105] driver core: convert class_create() to class_register()
config: microblaze-randconfig-r031-20230329 (https://download.01.org/0day-ci/archive/20230331/202303311216.GZ7eEB7w-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=b21f747c419ca7d3910446cf21f23fd4cdfad597
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core class_cleanup
        git checkout b21f747c419ca7d3910446cf21f23fd4cdfad597
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/char/xilinx_hwicap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311216.GZ7eEB7w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/xilinx_hwicap/xilinx_hwicap.c:117:15: error: expected '=' before string constant
     117 |         .name "xilinx_config",
         |               ^~~~~~~~~~~~~~~


vim +117 drivers/char/xilinx_hwicap/xilinx_hwicap.c

   115	
   116	static const struct class icap_class = {
 > 117		.name "xilinx_config",
   118	};
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
