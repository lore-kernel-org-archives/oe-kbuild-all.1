Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA92125A5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 12:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNOOEAW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697286330; x=1728822330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sz6RjwfPllYlx9Ugmt1/PJa38LRiMnq2/cmV7Ie5h3Y=;
  b=NNOOEAW6QwlG4vUnedXjRdlJl1LnjvMzQ39w2l8x9DbKo9APojSrccE9
   gbpr7su2CoXn5kWOahDRvAnNwFWwRltJsD+cGvKnKFADrz2GzcjprS5Hg
   oQDYmlA1OAUWgDStrRDNlk84fhQIrTHScN838dLMgOytrYLr0tI4LqAVm
   vyw7O3u38qqUjyI2OdjzalTliNKxpU3Z1jejsOFxPN/IPVnH2FV9sWCts
   xYbbAT5uGiZwfT6ywrQ7v4HmZH17TqHzeWJhnkRXbxm4oaW2ePwcnQzYX
   xAHsOtuzwA+Ua7XXzOsLcR1bOLBhs2sb2RY0WWZJYu7zJsALhbtM7abCx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364684032"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="364684032"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 05:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086466460"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1086466460"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2023 05:25:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrdhr-00069p-2u;
	Sat, 14 Oct 2023 12:25:23 +0000
Date: Sat, 14 Oct 2023 20:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4744/15768]
 drivers/media/platform/mxc/capture/mx6s_capture.c:1792:35: warning: variable
 'asd' set but not used
Message-ID: <202310142015.a7rbF3JB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: ce0e2f7e0ebc193aa10e4a6921c61302e470387c [4744/15768] Merge remote-tracking branch 'origin/capture/ov5640' into capture/next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310142015.a7rbF3JB-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142015.a7rbF3JB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142015.a7rbF3JB-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
