Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E763D281
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 05:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OawEJOp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698730079; x=1730266079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v5HjtP6fAkcKjxWSRzL54IFU5w3SMR6qwvqZa6Ol430=;
  b=OawEJOp1KLtb1TnNGaXNq1VHVP9/o18m6N6jkmE7wlCxTKnhHt77LsWd
   5LqKZIu+/qJz/WRhYA60bJsmW9TR/4G07/5adbLi3uZ9gxDAE9Ht+Hfj8
   3lHtPcGhExbj+VWhp8zsMQHi9/5cRz9cgKpUUJGZ6muJMtvb4tzK8ErZH
   LurKGMmBxwRSWU7psISdw9mdb9aO47srYgpmuS51KprZ33bSbqcMjmRUC
   ZQRTvMkrxMmVpZUya5tvSGPFLhKoTNrkw1L2IZGT2EfZzP2L3AIz3CZL2
   OLTuFFaLCz1Lqjdq7ICErcPM1V+x+Z3M/NK1kWtXAHUngAQRxy86Dw61y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="454685304"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="454685304"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 22:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="933994592"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="933994592"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Oct 2023 22:27:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxhI5-000DqZ-14;
	Tue, 31 Oct 2023 05:27:49 +0000
Date: Tue, 31 Oct 2023 13:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Kuo <louis.kuo@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>
Subject: [pinchartl:mtk/v6.6/dev/intervals 391/452]
 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:328:29:
 error: implicit declaration of function 'FIELD_PREP'
Message-ID: <202310311340.hHjs17LR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/dev/intervals
head:   358c0c0ab9826452f42f79daa9ffbf1018246ad9
commit: 7bbeab6d89b5a6aa4001c60caa126150769d8978 [391/452] media: platform: mediatek: isp_30: add mediatek ISP3.0 sensor interface
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231031/202310311340.hHjs17LR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311340.hHjs17LR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311340.hHjs17LR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c: In function 'mtk_seninf_csi2_setup_phy':
>> drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:328:29: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
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
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +328 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c

   325	
   326	#define mtk_seninf_update(priv, reg, field, val)			\
   327		__mtk_seninf_update(priv, reg, reg##_##field,		\
 > 328				    FIELD_PREP(reg##_##field, val))
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
