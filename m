Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3B51867
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 05:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675489895; x=1707025895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PWRrwp9A6enaUpqOjqFD1b68kewe0n8kM/OIUskry1U=;
  b=AuI39jjHDVoI+1OyACYIcuxZWaCbQO0B4FKHW5lqgeJojl/qlY/iuVeI
   mi49qnaBdoXNotAFD6MgtVhEmFRMjR7nM61h0HncKjGeQYj21dWscvEcq
   xS8QN4YsGlJ+EYwocMeds4M0sXcTJSQ5UIEwIUJeUC9wTJUPchuLv4ECi
   Kl3oeSlJKRlwrAyFg0QRCgESZ2YXyNuFOMBiw4mvfJnIJ15ur8noNw3lX
   b1rXHLsl+Nib1+cp+HecRQ9FvZtsIIVIsEykldkOE5UneIuPGBCZXt81C
   iJeuTolOYBrJCaXXiXftvCEntO5x1L/4kJYxWI+BryEjTVRF+eYcyiDXE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328936289"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="328936289"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 21:51:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659332817"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="659332817"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Feb 2023 21:51:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOBSX-000153-0J;
	Sat, 04 Feb 2023 05:51:33 +0000
Date: Sat, 4 Feb 2023 13:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3290/20209]
 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:175:27: warning:
 'synaptics_rmi4_suspend' used but never defined
Message-ID: <202302041359.SmWmEY0Q-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: f3e023ffe1da7261a8aba45f085b43150d1f87c2 [3290/20209] MLK-17829 touchscreen: Add synaptics_dsx S3508 i2c touch driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230204/202302041359.SmWmEY0Q-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/f3e023ffe1da7261a8aba45f085b43150d1f87c2
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout f3e023ffe1da7261a8aba45f085b43150d1f87c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/input/touchscreen/synaptics_dsx/ drivers/regulator/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
