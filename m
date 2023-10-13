Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D437DDB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 08:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyPG0nRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697184426; x=1728720426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nprTZFKleSaDHi4/o4NrMGWIngTZqPxAJIaAs9nIzn0=;
  b=fyPG0nRn9eX56X0O8MjmAA5natHDqqZz3XeD2BlaFMgbXEKJXdigfBbI
   wyqZyn0I7xtYVxb2XinBDOMVQjALr+MsiKgISE9FNZnRJjXYF01mmuJeg
   SXaCSz8dA8s4A1pFmU6a9SdP3qd397JPAUh1KX4dT1jWlyj9nx34sZhoA
   AiV6clp4ZLnxCW4nqM3raDZIzFiVVglXGAQx3lR2iQrUwH7KVOgeV3oJF
   oHQJwc5eSFkf2BqoBIkIjLguQ+hX+QTi7pLQTmUbmluFbTx+1fpTnx4b2
   Oj6QNsjiBHb0aMhj+AscaYkm60cT0YDhJ2GDUhDDsTX7ErAtZPzDjha4c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375476831"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="375476831"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 01:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754621910"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="754621910"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 01:06:49 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrDC3-0004Ur-0x;
	Fri, 13 Oct 2023 08:06:47 +0000
Date: Fri, 13 Oct 2023 16:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Kuo <louis.kuo@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>
Subject: [pinchartl:mtk/v6.6/pumpkin/camera 12/35]
 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1425:12:
 warning: 'seninf_pm_resume' defined but not used
Message-ID: <202310131614.HQTZCjim-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/pumpkin/camera
head:   bbd4f3babd279c09914cf0d0eaa9bd7f75a42c51
commit: 55f1093de9a4185059954ac07c475bd338574170 [12/35] media: platform: mediatek: isp_30: add mediatek ISP3.0 sensor interface
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131614.HQTZCjim-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131614.HQTZCjim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131614.HQTZCjim-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: In function 'mtk_seninf_csi2_setup_phy':
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:328:29: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     328 |                             FIELD_PREP(reg##_##field, val))
         |                             ^~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:401:17: note: in expansion of macro 'mtk_seninf_update'
     401 |                 mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
         |                 ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: At top level:
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1068:34: error: field 'asd' has incomplete type
    1068 |         struct v4l2_async_subdev asd;
         |                                  ^~~
   In file included from drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:17:
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: In function 'mtk_seninf_fwnode_parse':
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1102:48: error: invalid application of 'sizeof' to incomplete type 'struct v4l2_async_subdev'
    1102 |                                        fwnode, struct v4l2_async_subdev);
         |                                                ^~~~~~
   include/media/v4l2-async.h:196:70: note: in definition of macro 'v4l2_async_nf_add_fwnode'
     196 |         ((type *)__v4l2_async_nf_add_fwnode(notifier, fwnode, sizeof(type)))
         |                                                                      ^~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from include/linux/clk.h:13,
                    from drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:5:
   include/linux/compiler_types.h:366:27: error: expression in static assertion is not an integer
     366 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1107:17: note: in expansion of macro 'container_of'
    1107 |         s_asd = container_of(asd, struct mtk_seninf_async_subdev, asd);
         |                 ^~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: In function 'mtk_seninf_notifier_bound':
   include/linux/compiler_types.h:366:27: error: expression in static assertion is not an integer
     366 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1155:17: note: in expansion of macro 'container_of'
    1155 |                 container_of(asd, struct mtk_seninf_async_subdev, asd);
         |                 ^~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: At top level:
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1215:18: error: initialization of 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
    1215 |         .bound = mtk_seninf_notifier_bound,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1215:18: note: (near initialization for 'mtk_seninf_async_ops.bound')
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: In function 'mtk_seninf_v4l2_async_register':
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1259:9: error: too few arguments to function 'v4l2_async_nf_init'
    1259 |         v4l2_async_nf_init(&priv->notifier);
         |         ^~~~~~~~~~~~~~~~~~
   include/media/v4l2-async.h:159:6: note: declared here
     159 | void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1271:38: error: passing argument 1 of 'v4l2_async_nf_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1271 |         ret = v4l2_async_nf_register(&priv->v4l2_dev, &priv->notifier);
         |                                      ^~~~~~~~~~~~~~~
         |                                      |
         |                                      struct v4l2_device *
   include/media/v4l2-async.h:281:56: note: expected 'struct v4l2_async_notifier *' but argument is of type 'struct v4l2_device *'
     281 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1271:15: error: too many arguments to function 'v4l2_async_nf_register'
    1271 |         ret = v4l2_async_nf_register(&priv->v4l2_dev, &priv->notifier);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-async.h:281:5: note: declared here
     281 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: At top level:
>> drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1425:12: warning: 'seninf_pm_resume' defined but not used [-Wunused-function]
    1425 | static int seninf_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1415:12: warning: 'seninf_pm_suspend' defined but not used [-Wunused-function]
    1415 | static int seninf_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/seninf_pm_resume +1425 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c

  1414	
> 1415	static int seninf_pm_suspend(struct device *dev)
  1416	{
  1417		struct mtk_seninf *priv = dev_get_drvdata(dev);
  1418	
  1419		dev_dbg(dev, "seninf runtime suspend\n");
  1420		clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
  1421	
  1422		return 0;
  1423	}
  1424	
> 1425	static int seninf_pm_resume(struct device *dev)
  1426	{
  1427		struct mtk_seninf *priv = dev_get_drvdata(dev);
  1428		int ret;
  1429	
  1430		dev_dbg(dev, "seninf runtime resume\n");
  1431		ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
  1432		if (ret) {
  1433			dev_err(dev, "failed to enable clock:%d\n", ret);
  1434			return ret;
  1435		}
  1436	
  1437		mtk_seninf_csi2_setup_phy(priv);
  1438	
  1439		return 0;
  1440	}
  1441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
