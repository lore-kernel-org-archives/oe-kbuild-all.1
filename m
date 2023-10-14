Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C291CEADF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuA65Dr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697284406; x=1728820406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nUaC0/8/vhW2vyX6wzxJhmMGRzXX/DNzaK6/QgK4zPU=;
  b=RuA65Dr/YdxRny5llWAdgO605TeLHzOp5UmkNNbn73l5xJQzBClck8Rr
   bx2I6OdS1d6VGadaKrCKPn6z4d+0EZY7tKBe5f3SKXSspB/CK9w14Dgrd
   WWeKiC70rhml56z2evgqCDEGiwEr/5Bx6nWTE18+NvoiPxDWJXm5JG+tt
   Bc5/fri9dHao/uAfcZ+0jrb6uwQ3olCJ1NWbw7e/PIsTpHP33DgPJJmtx
   G914eYddgfMETzJfb3mD2o4eCsaubWF5e7K6l7Jxene0z/2MHC11IIsa4
   73hz4dCsBPNjG0hflec816KPSbkh7J8DyH3ahKVBCSk2suC+PK/6xUajJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="6883260"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="6883260"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 04:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825360159"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="825360159"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2023 04:53:25 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrdCs-00068T-26;
	Sat, 14 Oct 2023 11:53:22 +0000
Date: Sat, 14 Oct 2023 19:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3290/24603]
 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:175:27: warning:
 'synaptics_rmi4_suspend' used but never defined
Message-ID: <202310141940.uBGkvVtK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haibo,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: f3e023ffe1da7261a8aba45f085b43150d1f87c2 [3290/24603] MLK-17829 touchscreen: Add synaptics_dsx S3508 i2c touch driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310141940.uBGkvVtK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141940.uBGkvVtK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141940.uBGkvVtK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:792:5: warning: no previous prototype for 'tpd_i2c_read_data' [-Wmissing-prototypes]
     792 | int tpd_i2c_read_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
         |     ^~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:911:5: warning: no previous prototype for 'tpd_i2c_write_data' [-Wmissing-prototypes]
     911 | int tpd_i2c_write_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c: In function 'synaptics_rmi4_probe':
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:3194:21: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    3194 |         int retval, ret;
         |                     ^~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c: At top level:
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:175:27: warning: 'synaptics_rmi4_suspend' used but never defined
     175 | static int __maybe_unused synaptics_rmi4_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:177:27: warning: 'synaptics_rmi4_resume' used but never defined
     177 | static int __maybe_unused synaptics_rmi4_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~~~~~


vim +/synaptics_rmi4_suspend +175 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c

   173	
   174	
 > 175	static int __maybe_unused synaptics_rmi4_suspend(struct device *dev);
   176	
 > 177	static int __maybe_unused synaptics_rmi4_resume(struct device *dev);
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
