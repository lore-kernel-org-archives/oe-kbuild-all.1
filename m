Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F4CEA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 07:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681542409; x=1713078409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MULi/auQwQmiUGIB/oeKzo2DejpVRGtzsEyZI5X4gr4=;
  b=QM/mkE548WhAdFPo/ryzz73ML1j9bXYhHj33gBZoLQb2XX0rmdCJKoyA
   BiONt9L8b3qaVIDlxPo2UhsK+xIV9v0xadayQmCizncG6UYvXeTc10Lr9
   wMEtJRtVUZFioPdapj+yQ+JVZhwx148tVOKVLk0nvDZs/Ip1R1p90FCzV
   DJIngcmXpNC5r1EK4IdbMG7dYXkv/8t/yc6Vy4kfATKKiS2FxHgODWXNA
   5KjSiB7ZGyISP/Y6uxs9j1/VmoU9nV1rn/6VwlltmUdv8bSrlidVJhWKZ
   G9B7qSenlzjgF1zHklN7+2WpHo+DBbKJpkHJow5jmPvtk1hhLDI+PSUID
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324248142"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="324248142"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 00:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779490205"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="779490205"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Apr 2023 00:06:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnZzG-000aeN-35;
	Sat, 15 Apr 2023 07:06:18 +0000
Date: Sat, 15 Apr 2023 15:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4744/9838]
 drivers/media/platform/mxc/capture/mx6s_capture.c:1792:35: warning: variable
 'asd' set but not used
Message-ID: <202304151555.bJfkgiNC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: ce0e2f7e0ebc193aa10e4a6921c61302e470387c [4744/9838] Merge remote-tracking branch 'origin/capture/ov5640' into capture/next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304151555.bJfkgiNC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/ce0e2f7e0ebc193aa10e4a6921c61302e470387c
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout ce0e2f7e0ebc193aa10e4a6921c61302e470387c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/mailbox/ drivers/media/platform/mxc/capture/ drivers/net/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/fbdev/ sound/soc/fsl/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151555.bJfkgiNC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mx6s_capture.c:365:18: warning: no previous prototype for 'format_by_fourcc' [-Wmissing-prototypes]
     365 | struct mx6s_fmt *format_by_fourcc(int fourcc)
         |                  ^~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:378:18: warning: no previous prototype for 'format_by_mbus' [-Wmissing-prototypes]
     378 | struct mx6s_fmt *format_by_mbus(u32 code)
         |                  ^~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:396:6: warning: no previous prototype for 'csi_clk_enable' [-Wmissing-prototypes]
     396 | void csi_clk_enable(struct mx6s_csi_dev *csi_dev)
         |      ^~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c:403:6: warning: no previous prototype for 'csi_clk_disable' [-Wmissing-prototypes]
     403 | void csi_clk_disable(struct mx6s_csi_dev *csi_dev)
         |      ^~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/mx6s_capture.c: In function 'mx6sx_register_subdevs':
>> drivers/media/platform/mxc/capture/mx6s_capture.c:1792:35: warning: variable 'asd' set but not used [-Wunused-but-set-variable]
    1792 |         struct v4l2_async_subdev *asd;
         |                                   ^~~


vim +/asd +1792 drivers/media/platform/mxc/capture/mx6s_capture.c

9d0600f901f77a Robby Cai 2019-09-27  1787  
9d0600f901f77a Robby Cai 2019-09-27  1788  static int mx6sx_register_subdevs(struct mx6s_csi_dev *csi_dev)
9d0600f901f77a Robby Cai 2019-09-27  1789  {
9d0600f901f77a Robby Cai 2019-09-27  1790  	struct device_node *parent = csi_dev->dev->of_node;
9d0600f901f77a Robby Cai 2019-09-27  1791  	struct device_node *node, *port, *rem;
9d0600f901f77a Robby Cai 2019-09-27 @1792  	struct v4l2_async_subdev *asd;
9d0600f901f77a Robby Cai 2019-09-27  1793  	int ret;
9d0600f901f77a Robby Cai 2019-09-27  1794  
9d0600f901f77a Robby Cai 2019-09-27  1795  	v4l2_async_nf_init(&csi_dev->subdev_notifier);
9d0600f901f77a Robby Cai 2019-09-27  1796  
9d0600f901f77a Robby Cai 2019-09-27  1797  	/* Attach sensors linked to csi receivers */
9d0600f901f77a Robby Cai 2019-09-27  1798  	for_each_available_child_of_node(parent, node) {
9d0600f901f77a Robby Cai 2019-09-27  1799  		if (of_node_cmp(node->name, "port"))
9d0600f901f77a Robby Cai 2019-09-27  1800  			continue;
9d0600f901f77a Robby Cai 2019-09-27  1801  
9d0600f901f77a Robby Cai 2019-09-27  1802  		/* The csi node can have only port subnode. */
9d0600f901f77a Robby Cai 2019-09-27  1803  		port = of_get_next_child(node, NULL);
9d0600f901f77a Robby Cai 2019-09-27  1804  		if (!port)
9d0600f901f77a Robby Cai 2019-09-27  1805  			continue;
9d0600f901f77a Robby Cai 2019-09-27  1806  		rem = of_graph_get_remote_port_parent(port);
9d0600f901f77a Robby Cai 2019-09-27  1807  		of_node_put(port);
9d0600f901f77a Robby Cai 2019-09-27  1808  		if (rem == NULL) {
9d0600f901f77a Robby Cai 2019-09-27  1809  			v4l2_info(&csi_dev->v4l2_dev,
9d0600f901f77a Robby Cai 2019-09-27  1810  						"Remote device at %s not found\n",
9d0600f901f77a Robby Cai 2019-09-27  1811  						port->full_name);
9d0600f901f77a Robby Cai 2019-09-27  1812  			return -1;
9d0600f901f77a Robby Cai 2019-09-27  1813  		}
9d0600f901f77a Robby Cai 2019-09-27  1814  
9d0600f901f77a Robby Cai 2019-09-27  1815  		csi_dev->fwnode = of_fwnode_handle(rem);
9d0600f901f77a Robby Cai 2019-09-27  1816  		asd = v4l2_async_nf_add_fwnode(
9d0600f901f77a Robby Cai 2019-09-27  1817  					&csi_dev->subdev_notifier,
9d0600f901f77a Robby Cai 2019-09-27  1818  					csi_dev->fwnode,
9d0600f901f77a Robby Cai 2019-09-27  1819  					struct v4l2_async_subdev);
9d0600f901f77a Robby Cai 2019-09-27  1820  		of_node_put(rem);
9d0600f901f77a Robby Cai 2019-09-27  1821  		break;
9d0600f901f77a Robby Cai 2019-09-27  1822  	}
9d0600f901f77a Robby Cai 2019-09-27  1823  
9d0600f901f77a Robby Cai 2019-09-27  1824  	csi_dev->subdev_notifier.ops = &mx6s_capture_async_ops;
9d0600f901f77a Robby Cai 2019-09-27  1825  
9d0600f901f77a Robby Cai 2019-09-27  1826  	ret = v4l2_async_nf_register(&csi_dev->v4l2_dev,
9d0600f901f77a Robby Cai 2019-09-27  1827  					&csi_dev->subdev_notifier);
9d0600f901f77a Robby Cai 2019-09-27  1828  	if (ret)
9d0600f901f77a Robby Cai 2019-09-27  1829  		dev_err(csi_dev->dev,
9d0600f901f77a Robby Cai 2019-09-27  1830  					"Error register async notifier regoster\n");
9d0600f901f77a Robby Cai 2019-09-27  1831  
9d0600f901f77a Robby Cai 2019-09-27  1832  	return ret;
9d0600f901f77a Robby Cai 2019-09-27  1833  }
9d0600f901f77a Robby Cai 2019-09-27  1834  

:::::: The code at line 1792 was first introduced by commit
:::::: 9d0600f901f77a9c111432db7693651de7b4bdb8 media: v4l2 capture: add v4l2 capture driver based on csi

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
