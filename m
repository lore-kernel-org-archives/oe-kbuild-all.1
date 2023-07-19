Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5551FDF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 05:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689743708; x=1721279708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jdtbbqkxaOi4h3TzyIB04dkK8Sp+XM8YrU41HZhnOsE=;
  b=LsccQaaaT67r8VM91LWPbggDhJtyk5DijJvpfZ1zgdTMkQDG0ZqBtIQm
   pVtKdFO/ZyAWo7NUZ9+pGEs2Hu5b9DzS/FdGT/mZ7XtBBgvr5wwqRjurj
   GegCezqQ0oUuGre0rylsg3nxY2SXJ6RsBht4b6uYcNeMEhpmEyAbOSiS/
   h0ex8sCaeUx1JVmfI2K6OUdOj+c1cYx/QYMKrbbQ2McpC7hJDOQr8FQq3
   c1szh4K0ZSLIVfWkAwaqoU+bzJv4Tlrj2jStRkddNrOSm5e8uIBVbpP3r
   DbPKyqr+HuJfwnO5u+sMwrZ7ivv44ovNtYOLIXM4ejBM6IG+4um2dD0iM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369933333"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="369933333"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 22:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970486169"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="970486169"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 22:15:06 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLzWk-0004Ax-0K;
	Wed, 19 Jul 2023 05:15:06 +0000
Date: Wed, 19 Jul 2023 13:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 2940/12467]
 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:174:27: warning:
 'synaptics_rmi4_suspend' used but never defined
Message-ID: <202307191340.rDvAgTwz-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   791ee62ff569635e685d84c09b2179f002c4e0bf
commit: 33e6f8767e518ec7b352efc051ec00703f828cb9 [2940/12467] MLK-17829 touchscreen: Add synaptics_dsx S3508 i2c touch driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230719/202307191340.rDvAgTwz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191340.rDvAgTwz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191340.rDvAgTwz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:791:5: warning: no previous prototype for 'tpd_i2c_read_data' [-Wmissing-prototypes]
     791 | int tpd_i2c_read_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
         |     ^~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:910:5: warning: no previous prototype for 'tpd_i2c_write_data' [-Wmissing-prototypes]
     910 | int tpd_i2c_write_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:174:27: warning: 'synaptics_rmi4_suspend' used but never defined
     174 | static int __maybe_unused synaptics_rmi4_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:176:27: warning: 'synaptics_rmi4_resume' used but never defined
     176 | static int __maybe_unused synaptics_rmi4_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~~~~~


vim +/synaptics_rmi4_suspend +174 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c

   172	
   173	
 > 174	static int __maybe_unused synaptics_rmi4_suspend(struct device *dev);
   175	
 > 176	static int __maybe_unused synaptics_rmi4_resume(struct device *dev);
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
