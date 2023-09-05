Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A4863C7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693927290; x=1725463290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PYOaSXvXYZ7Eu5jKnWsHd+uEOdnZ190zWkYVDEPcos=;
  b=Z1fm5u6r5CUtLOwoRE0JEEHfPfa1fu0cWmNtMxoEQdDrcNbjho+XG0Ac
   crO9bZnWkR6Ko1E7XjbJ7EmfnInt4RvxBV4sVkRYpi1NEM4wUpBtDi27f
   0jMd4QbCGdfp1TM/QD9OdYHUZbJJJb6f8ILDAXi8o30GGpR9KRnPHm2/4
   dQby+4LHFzy95kFjwLYX86KBzn3YqIDBQ5CBClRga6g/JGcMsYbA6T0ut
   aK3+y0Mm3ioozRPCyaL+UMo5YRgMIx5vkIJj7ShJxxvChXkAFqedq1Rol
   kSso+sVXtzdB+gERkk11+/xeeQFYwqia3L/T6UPvZCJeZlgPtnOUoqd4T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="367043116"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="367043116"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 08:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="884340172"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="884340172"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2023 08:21:14 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdXrj-0001n9-34;
	Tue, 05 Sep 2023 15:21:19 +0000
Date: Tue, 5 Sep 2023 23:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:pr/146 11970/14527]
 drivers/i2c/busses/i2c-xiic.c:1134:39: warning: 'xiic_2_00' defined but not
 used
Message-ID: <202309052307.BMXFnvoL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Raviteja,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx pr/146
head:   38b0c0cf11566882cda99f8e4f2243924a684be5
commit: 744f0aee09df06bac9b5c440da65697b2278b9ee [11970/14527] i2c: xiic: Switch to Xiic standard mode for i2c-read
config: alpha-randconfig-r011-20230905 (https://download.01.org/0day-ci/archive/20230905/202309052307.BMXFnvoL-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309052307.BMXFnvoL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309052307.BMXFnvoL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-xiic.c:1134:39: warning: 'xiic_2_00' defined but not used [-Wunused-const-variable=]
    1134 | static const struct xiic_version_data xiic_2_00 = {
         |                                       ^~~~~~~~~


vim +/xiic_2_00 +1134 drivers/i2c/busses/i2c-xiic.c

  1133	
> 1134	static const struct xiic_version_data xiic_2_00 = {
  1135		.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
  1136	};
  1137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
