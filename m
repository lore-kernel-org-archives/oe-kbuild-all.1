Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51696B43E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 19:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674157692; x=1705693692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GKPnqBipZhh3OGxYe+6mBe0WU+lFyB6t8JBFX+Jon9g=;
  b=nu5aO+nnD0Ddju2gKhI86X0XYHAAMuo3YN5BgjXZsVEXKYXVGy+6g1/0
   /oa0ODVfFF5tZZ494s6hp0Q16zsACxy8TA7e416sK/HZgvDRvz1SqiDQC
   PPm4vnu3GJrOCkiUdZF4SjIdH0jFtnFYsruoG/Z1q0ZvkIMLpYgji0a9x
   0q3SiLnEmXKJSGacJyqbPQftpyu5k/qoCXNJ1a2W6MY87Rx5lWK7DbPuv
   dZwJF6zOBDBbhUKWWpAZC65c565bXxMsy3rqCeiKrkGGL4HvsV0QxXg1+
   SIVSiHpXCKaM81/cg3RXj3K6aHEB35X7oF6jLxe4gyTlnZvXxt2uJGz0V
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305769416"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="305769416"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 11:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="749045020"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="749045020"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2023 11:48:10 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIatN-0001nk-1B;
	Thu, 19 Jan 2023 19:48:09 +0000
Date: Fri, 20 Jan 2023 03:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: khaiwenn <khai.wen.ng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, nanli2x <nanx.li@intel.com>
Subject: [intel-lts:5.10/yocto 43/47]
 drivers/media/platform/intel/ipu6-acpi.c:880:12: warning: 'get_ar0234_pdata'
 defined but not used
Message-ID: <202301200350.RslYHKlc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi khaiwenn,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   fa972093e338581da9c895fdb8151b9247de3ba3
commit: 2f5e83ed4b901b8b56b0c079a8199273480440c1 [43/47] Add IPU6 ACPI driver config
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301200350.RslYHKlc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/2f5e83ed4b901b8b56b0c079a8199273480440c1
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 2f5e83ed4b901b8b56b0c079a8199273480440c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/platform/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/platform/intel/ipu6-acpi.c:459:5: warning: no previous prototype for 'ipu_acpi_get_cam_data' [-Wmissing-prototypes]
     459 | int ipu_acpi_get_cam_data(struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi.c:583:5: warning: no previous prototype for 'compare_subdev' [-Wmissing-prototypes]
     583 | int compare_subdev(struct device dev,
         |     ^~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi.c:617:6: warning: no previous prototype for 'update_pdata' [-Wmissing-prototypes]
     617 | void update_pdata(struct device dev,
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi.c:640:5: warning: no previous prototype for 'ar0234_populate' [-Wmissing-prototypes]
     640 | int ar0234_populate(struct device dev,
         |     ^~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi.c:706:5: warning: no previous prototype for 'lt6911uxc_populate' [-Wmissing-prototypes]
     706 | int lt6911uxc_populate(struct device dev,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi.c:880:12: warning: 'get_ar0234_pdata' defined but not used [-Wunused-function]
     880 | static int get_ar0234_pdata(struct i2c_client *client,
         |            ^~~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi.c:126:12: warning: 'get_string_dsdt_data' defined but not used [-Wunused-function]
     126 | static int get_string_dsdt_data(struct device *dev, const u8 *dsdt,
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi.c:108:12: warning: 'add_new_i2c' defined but not used [-Wunused-function]
     108 | static int add_new_i2c(unsigned short addr, unsigned short  bus,
         |            ^~~~~~~~~~~


vim +/get_ar0234_pdata +880 drivers/media/platform/intel/ipu6-acpi.c

af562e426dc30e zouxiaoh 2022-04-12  879  
af562e426dc30e zouxiaoh 2022-04-12 @880  static int get_ar0234_pdata(struct i2c_client *client,
af562e426dc30e zouxiaoh 2022-04-12  881  			       struct ipu_camera_module_data *data,
af562e426dc30e zouxiaoh 2022-04-12  882  			       struct ipu_i2c_helper *helper,
af562e426dc30e zouxiaoh 2022-04-12  883  			       void *priv, size_t size)
af562e426dc30e zouxiaoh 2022-04-12  884  {
af562e426dc30e zouxiaoh 2022-04-12  885  	struct sensor_bios_data cam_data;
af562e426dc30e zouxiaoh 2022-04-12  886  	struct control_logic_data ctl_data;
af562e426dc30e zouxiaoh 2022-04-12  887  	struct ipu_isys_subdev_info *ar0234_sd;
af562e426dc30e zouxiaoh 2022-04-12  888  	int rval;
af562e426dc30e zouxiaoh 2022-04-12  889  
af562e426dc30e zouxiaoh 2022-04-12  890  	cam_data.dev = &client->dev;
af562e426dc30e zouxiaoh 2022-04-12  891  
af562e426dc30e zouxiaoh 2022-04-12  892  	ar0234_sd = kzalloc(sizeof(*ar0234_sd), GFP_KERNEL);
af562e426dc30e zouxiaoh 2022-04-12  893  
af562e426dc30e zouxiaoh 2022-04-12  894  	if (!ar0234_sd)
af562e426dc30e zouxiaoh 2022-04-12  895  		return -ENOMEM;
af562e426dc30e zouxiaoh 2022-04-12  896  
af562e426dc30e zouxiaoh 2022-04-12  897  	/* get sensor info from ssdb table generated from BIOS, save in sensor */
af562e426dc30e zouxiaoh 2022-04-12  898  	rval = ipu_acpi_get_cam_data(&client->dev, &cam_data);
d0a53de9e9d2cd zouxiaoh 2022-04-12  899  	if (rval) {
d0a53de9e9d2cd zouxiaoh 2022-04-12  900  		kfree(ar0234_sd);
af562e426dc30e zouxiaoh 2022-04-12  901  		return rval;
d0a53de9e9d2cd zouxiaoh 2022-04-12  902  	}
af562e426dc30e zouxiaoh 2022-04-12  903  
af562e426dc30e zouxiaoh 2022-04-12  904  	rval = ipu_acpi_get_dep_data(&client->dev, &ctl_data);
d0a53de9e9d2cd zouxiaoh 2022-04-12  905  	if (rval) {
d0a53de9e9d2cd zouxiaoh 2022-04-12  906  		kfree(ar0234_sd);
af562e426dc30e zouxiaoh 2022-04-12  907  		return rval;
d0a53de9e9d2cd zouxiaoh 2022-04-12  908  	}
af562e426dc30e zouxiaoh 2022-04-12  909  
af562e426dc30e zouxiaoh 2022-04-12  910  	rval = ar0234_populate(client->dev, &ar0234_sd, cam_data.i2c[0],
af562e426dc30e zouxiaoh 2022-04-12  911  				client->name, cam_data, ctl_data);
d0a53de9e9d2cd zouxiaoh 2022-04-12  912  	if (rval) {
d0a53de9e9d2cd zouxiaoh 2022-04-12  913  		kfree(ar0234_sd);
af562e426dc30e zouxiaoh 2022-04-12  914  		return rval;
d0a53de9e9d2cd zouxiaoh 2022-04-12  915  	}
af562e426dc30e zouxiaoh 2022-04-12  916  
af562e426dc30e zouxiaoh 2022-04-12  917  	client->dev.platform_data = ar0234_sd;
af562e426dc30e zouxiaoh 2022-04-12  918  
af562e426dc30e zouxiaoh 2022-04-12  919  	return rval;
af562e426dc30e zouxiaoh 2022-04-12  920  }
af562e426dc30e zouxiaoh 2022-04-12  921  

:::::: The code at line 880 was first introduced by commit
:::::: af562e426dc30ed39b0892b0e6de491f171ffe63 media: acpi: add acpi driver for intel ipu

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: nanli2x <nanx.li@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
