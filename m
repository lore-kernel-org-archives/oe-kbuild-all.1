Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34C02F39
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682627968; x=1714163968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1W/TxxJL8nKiaBPDaImnmOkWD/BShMZbu11iN1YbuHw=;
  b=Ytfu0LLeQzENf/csy0B0RmKvbjBPjbYBs6p4CeMx5e4EHGaZ332q+5v/
   kA95F7iz8gtRSI/IxegIrX0533rzhDYOYkHz8pd+ygx2O/i48K0YaR8cH
   DU03BlASAf+IsjONoe53zPCXiS/Vy3hKLtyTzzooZRF6QWsYS6pv5hRvg
   6AiOjZH8iGWjonst0D0ftMd+z2Ocar6WTUtybqNHs/4I4dc6q2GnKrzhP
   m1wyz9OmC0h+5+Gl3aU3Xs1PK4bW+g9ZEtNuRkyX2STdnrKD0TJYQsPgM
   e/gtRcGUgOcCiOqJXJF1SQfwao6FoN7foxwYqC2zL4lhmHomKSWbyQrXO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="412924068"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="412924068"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 13:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868875372"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="868875372"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 13:39:26 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps8Oj-00006Y-1O;
	Thu, 27 Apr 2023 20:39:25 +0000
Date: Fri, 28 Apr 2023 04:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c:1354:25: warning:
 'strncpy' specified bound 32 equals destination size
Message-ID: <202304280422.bZLXgCyx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   d0673ae878bb78807f65a6021cd9642d6d45bb93
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230428/202304280422.bZLXgCyx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 3b23f836c2ec0541aea62823eeed7f2bbe88dc43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/platform/img/vxe-vxd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280422.bZLXgCyx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/of_device.h:6,
                    from drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c:17:
   drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c: In function 'vxe_enc_driver_init':
   include/linux/device/driver.h:265:27: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     265 |         return __register(&(__driver) , ##__VA_ARGS__); \
         |                           ^~~~~~~~~~~
   include/linux/platform_device.h:234:36: note: in definition of macro 'platform_driver_register'
     234 |         __platform_driver_register(drv, THIS_MODULE)
         |                                    ^~~
   include/linux/platform_device.h:264:9: note: in expansion of macro 'module_driver'
     264 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c:1946:1: note: in expansion of macro 'module_platform_driver'
    1946 | module_platform_driver(vxe_enc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:235:39: note: expected 'struct platform_driver *' but argument is of type 'const struct platform_driver *'
     235 | extern int __platform_driver_register(struct platform_driver *,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/of_device.h:5:
   drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c: In function 'vxe_enc_driver_exit':
   include/linux/device/driver.h:270:22: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     270 |         __unregister(&(__driver) , ##__VA_ARGS__); \
         |                      ^~~~~~~~~~~
   include/linux/platform_device.h:264:9: note: in expansion of macro 'module_driver'
     264 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c:1946:1: note: in expansion of macro 'module_platform_driver'
    1946 | module_platform_driver(vxe_enc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:237:40: note: expected 'struct platform_driver *' but argument is of type 'const struct platform_driver *'
     237 | extern void platform_driver_unregister(struct platform_driver *);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c: In function 'vxe_query_ext_ctrl':
>> drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c:1354:25: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
    1354 |                         strncpy(query->name, controls[i].name, sizeof(query->name));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c:1331:33: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
    1331 |                                 strncpy(query->name, controls[i].name, sizeof(query->name));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c: In function 'vxe_queryctrl':
   drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c:1296:25: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
    1296 |                         strncpy(query->name, controls[i].name, sizeof(query->name));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c:1279:33: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
    1279 |                                 strncpy(query->name, controls[i].name, sizeof(query->name));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +1354 drivers/media/platform/img/vxe-vxd/encoder/vxe_v4l2.c

8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1308  
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1309  static int vxe_query_ext_ctrl(struct file *file, void *priv,
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1310  			      struct v4l2_query_ext_ctrl *query)
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1311  {
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1312  	unsigned int queryid;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1313  	int i, j;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1314  
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1315  	query->reserved[0] = 0;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1316  	query->reserved[1] = 0;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1317  
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1318  	/* Enumerate controls */
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1319  	if ((query->id & V4L2_CTRL_FLAG_NEXT_CTRL) ||
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1320  	    (query->id & V4L2_CTRL_FLAG_NEXT_COMPOUND)) {
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1321  		queryid = query->id;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1322  		queryid &= ~V4L2_CTRL_FLAG_NEXT_CTRL;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1323  		queryid &= ~V4L2_CTRL_FLAG_NEXT_COMPOUND;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1324  		for (i = 0; i < ARRAY_SIZE(controls); i++) {
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1325  			if (((!controls[i].compound && (query->id & V4L2_CTRL_FLAG_NEXT_CTRL)) ||
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1326  			     (controls[i].compound &&
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1327  				(query->id & V4L2_CTRL_FLAG_NEXT_COMPOUND))) &&
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1328  				controls[i].cid > queryid) {
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1329  				query->id = controls[i].cid;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1330  				query->type = controls[i].type;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1331  				strncpy(query->name, controls[i].name, sizeof(query->name));
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1332  				query->minimum = controls[i].minimum;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1333  				query->maximum = controls[i].maximum;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1334  				query->step = controls[i].step;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1335  				query->default_value = controls[i].default_value;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1336  				/* Our supported controls use int values */
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1337  				query->elem_size = 4;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1338  				query->elems  = 1;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1339  				query->nr_of_dims = 0;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1340  				for (j = 0; j < V4L2_CTRL_MAX_DIMS; j++)
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1341  					query->dims[j] = 0;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1342  				query->flags = 0;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1343  				return 0;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1344  			}
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1345  		}
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1346  		return -EINVAL;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1347  	}
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1348  
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1349  	/* Return info on requested control */
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1350  	for (i = 0; i < ARRAY_SIZE(controls); i++) {
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1351  		if (controls[i].cid == query->id) {
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1352  			query->id = controls[i].cid;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1353  			query->type = controls[i].type;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25 @1354  			strncpy(query->name, controls[i].name, sizeof(query->name));
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1355  			query->minimum = controls[i].minimum;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1356  			query->maximum = controls[i].maximum;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1357  			query->step = controls[i].step;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1358  			query->default_value = controls[i].default_value;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1359  			/* Our supported controls use int values */
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1360  			query->elem_size = 4;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1361  			query->elems  = 1;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1362  			query->nr_of_dims = 0;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1363  			for (j = 0; j < V4L2_CTRL_MAX_DIMS; j++)
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1364  				query->dims[j] = 0;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1365  			query->flags = 0;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1366  			return 0;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1367  		}
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1368  	}
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1369  
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1370  	return -EINVAL;
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1371  }
8fa9ec95aa96a3 drivers/media/platform/vxe-vxd/encoder/vxe_v4l2.c Sidraya 2023-04-25  1372  

:::::: The code at line 1354 was first introduced by commit
:::::: 8fa9ec95aa96a3b0772adc84c207f698ab41f63b v4l: vxe-enc: Add IMG Encoder v4l2 Driver Interface function implementations

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
