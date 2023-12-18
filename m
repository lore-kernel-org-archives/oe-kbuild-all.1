Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D10C566A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 04:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ij4fhYON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702872652; x=1734408652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WI9Cpb5vRo7+ttf3d6kp9pE9otMt8nWAQWTLCsy8Mb8=;
  b=ij4fhYON7rd0ov2tBrSwuPpRE2JdEnXJxFqR6rWBCMRMxgmxftOCH9Qi
   kLa4SfkTeW6qtURSmsXHwmXRgoQL+t2Ush+Z5NwSNliSJeMTZioprfLTF
   5uV5kNhWwYa7uF88LVpbHBt9I4KVMNkG22Tai+m56+eHbTsHDEqX7pvJZ
   qvSZPnR8u5WAdeI9aTgm2FkrvZeqPqdBwxdnGWUaMXeDrpNYx3Z98AGNe
   OglxCN/E1ntJ01DJW5wjbMR6poE/dGOqqdqLTNmCKykosp/VBmU7IZn7z
   G5Z2/zonaDgNf8r0uSTyZlL4vGazMjuRjnVfwolWe/O4WIg2UmTLTP0HG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="459778169"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="459778169"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 20:10:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="725168876"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="725168876"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Dec 2023 20:10:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF4xs-0003kN-11;
	Mon, 18 Dec 2023 04:10:48 +0000
Date: Mon, 18 Dec 2023 12:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [linux-next:master 3871/8213]
 drivers/gpu/drm/bridge/aux-bridge.c:63: undefined reference to
 `auxiliary_device_init'
Message-ID: <202312181205.Yx4PmXXe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: c5d296bad640b190c52ef7508114d70e971a4bba [3871/8213] usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
config: x86_64-randconfig-161-20231218 (https://download.01.org/0day-ci/archive/20231218/202312181205.Yx4PmXXe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181205.Yx4PmXXe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181205.Yx4PmXXe-lkp@intel.com/

Note: the linux-next/master HEAD 17cb8a20bde66a520a2ca7aad1063e1ce7382240 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_register':
>> drivers/gpu/drm/bridge/aux-bridge.c:63: undefined reference to `auxiliary_device_init'
>> ld: drivers/gpu/drm/bridge/aux-bridge.c:70: undefined reference to `__auxiliary_device_add'
   ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_init':
>> drivers/gpu/drm/bridge/aux-bridge.c:136: undefined reference to `__auxiliary_driver_register'
   ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_exit':
>> drivers/gpu/drm/bridge/aux-bridge.c:136: undefined reference to `auxiliary_driver_unregister'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
   Selected by [y]:
   - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]


vim +63 drivers/gpu/drm/bridge/aux-bridge.c

2a04739139b2b2 Dmitry Baryshkov 2023-12-03   31  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   32  /**
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   33   * drm_aux_bridge_register - Create a simple bridge device to link the chain
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   34   * @parent: device instance providing this bridge
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   35   *
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   36   * Creates a simple DRM bridge that doesn't implement any drm_bridge
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   37   * operations. Such bridges merely fill a place in the bridge chain linking
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   38   * surrounding DRM bridges.
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   39   *
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   40   * Return: zero on success, negative error code on failure
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   41   */
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   42  int drm_aux_bridge_register(struct device *parent)
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   43  {
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   44  	struct auxiliary_device *adev;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   45  	int ret;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   46  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   47  	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   48  	if (!adev)
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   49  		return -ENOMEM;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   50  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   51  	ret = ida_alloc(&drm_aux_bridge_ida, GFP_KERNEL);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   52  	if (ret < 0) {
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   53  		kfree(adev);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   54  		return ret;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   55  	}
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   56  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   57  	adev->id = ret;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   58  	adev->name = "aux_bridge";
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   59  	adev->dev.parent = parent;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   60  	adev->dev.of_node = parent->of_node;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   61  	adev->dev.release = drm_aux_bridge_release;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   62  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  @63  	ret = auxiliary_device_init(adev);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   64  	if (ret) {
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   65  		ida_free(&drm_aux_bridge_ida, adev->id);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   66  		kfree(adev);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   67  		return ret;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   68  	}
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   69  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  @70  	ret = auxiliary_device_add(adev);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   71  	if (ret) {
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   72  		auxiliary_device_uninit(adev);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   73  		return ret;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   74  	}
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   75  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   76  	return devm_add_action_or_reset(parent, drm_aux_bridge_unregister_adev, adev);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   77  }
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   78  EXPORT_SYMBOL_GPL(drm_aux_bridge_register);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   79  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   80  struct drm_aux_bridge_data {
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   81  	struct drm_bridge bridge;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   82  	struct drm_bridge *next_bridge;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   83  	struct device *dev;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   84  };
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   85  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   86  static int drm_aux_bridge_attach(struct drm_bridge *bridge,
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   87  				 enum drm_bridge_attach_flags flags)
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   88  {
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   89  	struct drm_aux_bridge_data *data;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   90  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   91  	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   92  		return -EINVAL;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   93  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   94  	data = container_of(bridge, struct drm_aux_bridge_data, bridge);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   95  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   96  	return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   97  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   98  }
2a04739139b2b2 Dmitry Baryshkov 2023-12-03   99  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  100  static const struct drm_bridge_funcs drm_aux_bridge_funcs = {
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  101  	.attach	= drm_aux_bridge_attach,
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  102  };
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  103  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  104  static int drm_aux_bridge_probe(struct auxiliary_device *auxdev,
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  105  				const struct auxiliary_device_id *id)
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  106  {
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  107  	struct drm_aux_bridge_data *data;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  108  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  109  	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  110  	if (!data)
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  111  		return -ENOMEM;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  112  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  113  	data->dev = &auxdev->dev;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  114  	data->next_bridge = devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  115  	if (IS_ERR(data->next_bridge))
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  116  		return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bridge),
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  117  				     "failed to acquire drm_bridge\n");
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  118  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  119  	data->bridge.funcs = &drm_aux_bridge_funcs;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  120  	data->bridge.of_node = data->dev->of_node;
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  121  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  122  	return devm_drm_bridge_add(data->dev, &data->bridge);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  123  }
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  124  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  125  static const struct auxiliary_device_id drm_aux_bridge_table[] = {
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  126  	{ .name = KBUILD_MODNAME ".aux_bridge" },
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  127  	{},
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  128  };
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  129  MODULE_DEVICE_TABLE(auxiliary, drm_aux_bridge_table);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  130  
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  131  static struct auxiliary_driver drm_aux_bridge_drv = {
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  132  	.name = "aux_bridge",
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  133  	.id_table = drm_aux_bridge_table,
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  134  	.probe = drm_aux_bridge_probe,
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  135  };
2a04739139b2b2 Dmitry Baryshkov 2023-12-03 @136  module_auxiliary_driver(drm_aux_bridge_drv);
2a04739139b2b2 Dmitry Baryshkov 2023-12-03  137  

:::::: The code at line 63 was first introduced by commit
:::::: 2a04739139b2b2761571e18937e2400e71eff664 drm/bridge: add transparent bridge helper

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
