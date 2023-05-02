Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2567E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 12:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683032367; x=1714568367;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IMXdtzQIAx1cE7s04MNQWWO/3dcOmIseRH1VYx5Vtq4=;
  b=VOc0LYuPVQbhXiZmFcSuHV4JTKVuUACfDQs/nyztTbavlUH/R4eq/Mph
   bbyGa9CyZWT8vKtjPyBXTklx+xPbjgXmY8d3OP57B+7PEPxOV7hms6R1f
   wTRSoT+TxOxnLkvvIzhaokDpkGD4K1lr1iGuS0/ioQ3ppMDax4X7JARN8
   7I4z67Al6S9etyUxd6toFABYp5RULpiRMd64t02cN04JMD48SevJRERrC
   9y4PS8eYkH40HhDLIrOOTxWu+kycFbIFxMV2EA74i+S51u4j/LXtTgplv
   qJK/DHE1B0/KpQQ2aOBqYMESsOBUy8Ki/f9bDLn0EaTqnAfXYY0R+G7BI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="328763668"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="328763668"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 05:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="726727571"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="726727571"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 May 2023 05:59:25 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptpbI-00013U-0L;
	Tue, 02 May 2023 12:59:24 +0000
Date: Tue, 2 May 2023 20:59:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 56/66] pinctrl-tps6594.c:undefined
 reference to `pinconf_generic_dt_node_to_map'
Message-ID: <202305022004.2avMhUwP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   bbd8927da68b353efb2d1fb94c3185c0ceabaf86
commit: 7cda4826851d6659c41427fe84be1084c5aa15c1 [56/66] pinctrl: tps6594: add pinmux and gpio for TPS6594 PMIC
config: s390-buildonly-randconfig-r006-20230502 (https://download.01.org/0day-ci/archive/20230502/202305022004.2avMhUwP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 7cda4826851d6659c41427fe84be1084c5aa15c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022004.2avMhUwP-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/pinctrl/pinctrl-tps6594.o: in function `pinconf_generic_dt_node_to_map_group':
>> pinctrl-tps6594.c:(.text+0x2da): undefined reference to `pinconf_generic_dt_node_to_map'
>> s390-linux-ld: drivers/pinctrl/pinctrl-tps6594.o:(.data.rel.ro+0x28): undefined reference to `pinconf_generic_dt_free_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
