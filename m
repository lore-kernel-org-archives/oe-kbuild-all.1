Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973415B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 01:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675559469; x=1707095469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xx5aKwtzXofDsHnpOzeMCrdlNGUOA7+SLk/C2W37gX4=;
  b=LXK8OrXTECYAD8Jdj/KgYX5/5AUFXhNcT/InDJhBVa/l0QjDXJbdHqXc
   54PpKVDDq1tIWQlFNbSvwUU6Iw6q+u723LYBadEbHFRhiSFx0PrCWFGXn
   A8TtJV9WEHVyH29CKfhvEob5hI5prd0dobdVnPRy53POFFn9LQnq/y9aZ
   Dot2cLw2dR+L4jdU984hA5t4dAswHtwNa8ty/ac4kc2t1AYgMG46mnI9/
   he9hibyIQz6TwQvi0X7kHJv7o5EjJu3EPW7BncI1RrtV0ykymyPjJok/S
   hUWHPTvImF9+uwou5xNa4uvVMNwBGOoxWSrot6PMB/wU/KK6Y8nYCOn2m
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="326700648"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="326700648"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 17:11:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="754881868"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="754881868"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 17:11:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOTYc-0001cq-0u;
	Sun, 05 Feb 2023 01:11:02 +0000
Date: Sun, 5 Feb 2023 09:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/usb/gadget/function/f_accessory.c:1303:25: warning: variable
 'dev' set but not used
Message-ID: <202302050916.ddkQqvao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Benoit,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: fc65a210c3bffecf9ea9ef0b77b8252e2f393102 ANDROID: usb: gadget: f_accessory: Add Android Accessory function
date:   2 years, 2 months ago
config: nds32-buildonly-randconfig-r001-20230205 (https://download.01.org/0day-ci/archive/20230205/202302050916.ddkQqvao-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=fc65a210c3bffecf9ea9ef0b77b8252e2f393102
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout fc65a210c3bffecf9ea9ef0b77b8252e2f393102
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 SHELL=/bin/bash drivers/md/ drivers/usb/gadget/function/ fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_accessory.c:822:5: warning: no previous prototype for 'acc_ctrlrequest' [-Wmissing-prototypes]
     822 | int acc_ctrlrequest(struct usb_composite_dev *cdev,
         |     ^~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1232:6: warning: no previous prototype for 'acc_disconnect' [-Wmissing-prototypes]
    1232 | void acc_disconnect(void)
         |      ^~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c: In function 'acc_alloc_inst':
>> drivers/usb/gadget/function/f_accessory.c:1303:25: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
    1303 |         struct acc_dev *dev;
         |                         ^~~
   drivers/usb/gadget/function/f_accessory.c: At top level:
   drivers/usb/gadget/function/f_accessory.c:1330:5: warning: no previous prototype for 'acc_ctrlrequest_configfs' [-Wmissing-prototypes]
    1330 | int acc_ctrlrequest_configfs(struct usb_function *f,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/dev +1303 drivers/usb/gadget/function/f_accessory.c

  1299	
  1300	static struct usb_function_instance *acc_alloc_inst(void)
  1301	{
  1302		struct acc_instance *fi_acc;
> 1303		struct acc_dev *dev;
  1304		int err;
  1305	
  1306		fi_acc = kzalloc(sizeof(*fi_acc), GFP_KERNEL);
  1307		if (!fi_acc)
  1308			return ERR_PTR(-ENOMEM);
  1309		fi_acc->func_inst.set_inst_name = acc_set_inst_name;
  1310		fi_acc->func_inst.free_func_inst = acc_free_inst;
  1311	
  1312		err = acc_setup();
  1313		if (err) {
  1314			kfree(fi_acc);
  1315			pr_err("Error setting ACCESSORY\n");
  1316			return ERR_PTR(err);
  1317		}
  1318	
  1319		config_group_init_type_name(&fi_acc->func_inst.group,
  1320						"", &acc_func_type);
  1321		dev = _acc_dev;
  1322		return  &fi_acc->func_inst;
  1323	}
  1324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
