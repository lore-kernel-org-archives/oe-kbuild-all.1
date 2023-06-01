Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5E10FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 23:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685660511; x=1717196511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/g8v823Xkp1z7ut/BQspeo9uYKLZyfg3vbIwZ7NRak=;
  b=b5XJLQ54kISDJ99mgn1E8PcIRr/ff8T7Zpx7Ldrh5IOv0X3vVVxly5fb
   1rzxY7wOJs4XBxCDs3dXnJ59MaptFRYsbKM2ytgge1f8lUfF5dIj3cdBH
   QsWpL+sOfsFPeFdrfhrM7mJGradHrUqIJE4RmgeNAiPahf2hLZmFdwOHK
   vzOVocTZiTo30NvB62lxKRunhiue26CHP3qsphCMT/2GYhUSWtDJLPViB
   kMRLEDpPvNMBit5q6tNko982D1HJBumM3/wmLSOoSjRF/SUU0Mn0kaMFy
   0DbEFu7/6u7bHe8LziD3qBrIVzrmSwaGnUQg8f1EhYEfFC0vZhLAlNVOG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442081571"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="442081571"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 16:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740544522"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="740544522"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Jun 2023 16:01:45 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4rIf-0002kG-0N;
	Thu, 01 Jun 2023 23:01:45 +0000
Date: Fri, 2 Jun 2023 07:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:acpi_arm_init 1/1] drivers/acpi/arm64/init.c:4:13:
 warning: no previous prototype for 'acpi_arm_init'
Message-ID: <202306020633.SIKGvMNq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git acpi_arm_init
head:   2679ad6fa1960fce2a6789694ce4050bdb8ce7c1
commit: 2679ad6fa1960fce2a6789694ce4050bdb8ce7c1 [1/1] ACPI: bus: Consolidate all arm specific initialisation into acpi_arm_init()
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306020633.SIKGvMNq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=2679ad6fa1960fce2a6789694ce4050bdb8ce7c1
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla acpi_arm_init
        git checkout 2679ad6fa1960fce2a6789694ce4050bdb8ce7c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/acpi/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020633.SIKGvMNq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/arm64/init.c:4:13: warning: no previous prototype for 'acpi_arm_init' [-Wmissing-prototypes]
       4 | void __init acpi_arm_init(void)
         |             ^~~~~~~~~~~~~


vim +/acpi_arm_init +4 drivers/acpi/arm64/init.c

     3	
   > 4	void __init acpi_arm_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
