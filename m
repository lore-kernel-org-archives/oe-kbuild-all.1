Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CED1391
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGdnXHuZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698491062; x=1730027062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s80kgCafWWFSybjBwqbDht5Jn4TE8hfQEYmheUFHalE=;
  b=BGdnXHuZ9TawTm6zw7HIJ0eEKCaAeGmMT0QEwqhj04f2BGvaXutDVm/J
   xOLm+5aTaLgw//Iv1KRuQjrcJ6OKVV2OB2MXMaYJOjOHB7qy0WtxOwWW7
   GNLTm2gdU4D3nLvQCJjn9wQWs7WJWU6BuaNNTdN25Almu1ZCx6Q/Eh/Mx
   dbubXHr1YJuLKWWHnzhTC5nF3IkL189wYmgYlGN4y2igQPRu8nBTiLUKe
   /sfXmHImCDEWBCsY/cb+UbDMuMOmUQ8zxeobti5zYx3HdYeWnU3zhnbrG
   yzG5TgeQBTMXp4j0xkXDelfGq1ca8W4gMpfibydD+/Gbu+tUruCfXB3xH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="732017"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="732017"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 04:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="759839210"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="759839210"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Oct 2023 04:04:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwh73-000Bfz-1T;
	Sat, 28 Oct 2023 11:04:17 +0000
Date: Sat, 28 Oct 2023 19:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:mtk/v6.6/dev/intervals 32/38]
 drivers/media/platform/renesas/vsp1/vsp1_entity.c:666:9: error: implicit
 declaration of function 'vsp1_entity_init_cfg'; did you mean
 'vsp1_entity_init'?
Message-ID: <202310281956.G0k8OIQg-lkp@intel.com>
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
commit: ada501ebee2ed0e11a07088b0f9f78d490123575 [32/38] media: v4l2-subdev: Rename .init_cfg() operation to .init_state()
config: s390-randconfig-001-20231028 (https://download.01.org/0day-ci/archive/20231028/202310281956.G0k8OIQg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281956.G0k8OIQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281956.G0k8OIQg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/renesas/vsp1/vsp1_entity.c: In function 'vsp1_entity_init':
>> drivers/media/platform/renesas/vsp1/vsp1_entity.c:666:9: error: implicit declaration of function 'vsp1_entity_init_cfg'; did you mean 'vsp1_entity_init'? [-Werror=implicit-function-declaration]
     666 |         vsp1_entity_init_cfg(subdev, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         vsp1_entity_init
   cc1: some warnings being treated as errors


vim +666 drivers/media/platform/renesas/vsp1/vsp1_entity.c

d9b45ed3d8b75e drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-07-10  603  
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  604  int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  605  		     const char *name, unsigned int num_pads,
6a8e07b215a91b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-02-15  606  		     const struct v4l2_subdev_ops *ops, u32 function)
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  607  {
ed647ea668fb27 drivers/media/platform/renesas/vsp1/vsp1_entity.c Tomi Valkeinen        2022-04-12  608  	static struct lock_class_key key;
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  609  	struct v4l2_subdev *subdev;
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  610  	unsigned int i;
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  611  	int ret;
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  612  
d9b45ed3d8b75e drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-07-10  613  	for (i = 0; i < ARRAY_SIZE(vsp1_routes); ++i) {
d9b45ed3d8b75e drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-07-10  614  		if (vsp1_routes[i].type == entity->type &&
d9b45ed3d8b75e drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-07-10  615  		    vsp1_routes[i].index == entity->index) {
d9b45ed3d8b75e drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-07-10  616  			entity->route = &vsp1_routes[i];
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  617  			break;
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  618  		}
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  619  	}
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  620  
d9b45ed3d8b75e drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-07-10  621  	if (i == ARRAY_SIZE(vsp1_routes))
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  622  		return -EINVAL;
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  623  
34e77ed84b274d drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-06-26  624  	mutex_init(&entity->lock);
34e77ed84b274d drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-06-26  625  
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  626  	entity->vsp1 = vsp1;
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  627  	entity->source_pad = num_pads - 1;
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  628  
e790c3cb8d904c drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  629  	/* Allocate and initialize pads. */
a86854d0c599b3 drivers/media/platform/vsp1/vsp1_entity.c         Kees Cook             2018-06-12  630  	entity->pads = devm_kcalloc(vsp1->dev,
a86854d0c599b3 drivers/media/platform/vsp1/vsp1_entity.c         Kees Cook             2018-06-12  631  				    num_pads, sizeof(*entity->pads),
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  632  				    GFP_KERNEL);
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  633  	if (entity->pads == NULL)
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  634  		return -ENOMEM;
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  635  
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  636  	for (i = 0; i < num_pads - 1; ++i)
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  637  		entity->pads[i].flags = MEDIA_PAD_FL_SINK;
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  638  
c8663c8e15c95a drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-09-07  639  	entity->sources = devm_kcalloc(vsp1->dev, max(num_pads - 1, 1U),
c8663c8e15c95a drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-09-07  640  				       sizeof(*entity->sources), GFP_KERNEL);
c8663c8e15c95a drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-09-07  641  	if (entity->sources == NULL)
c8663c8e15c95a drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-09-07  642  		return -ENOMEM;
c8663c8e15c95a drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-09-07  643  
c8663c8e15c95a drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-09-07  644  	/* Single-pad entities only have a sink. */
c8663c8e15c95a drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-09-07  645  	entity->pads[num_pads - 1].flags = num_pads > 1 ? MEDIA_PAD_FL_SOURCE
c8663c8e15c95a drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-09-07  646  					 : MEDIA_PAD_FL_SINK;
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  647  
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  648  	/* Initialize the media entity. */
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  649  	ret = media_entity_pads_init(&entity->subdev.entity, num_pads,
1809510715c418 drivers/media/platform/vsp1/vsp1_entity.c         Mauro Carvalho Chehab 2015-08-06  650  				     entity->pads);
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  651  	if (ret < 0)
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  652  		return ret;
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  653  
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  654  	/* Initialize the V4L2 subdev. */
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  655  	subdev = &entity->subdev;
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  656  	v4l2_subdev_init(subdev, ops);
ada501ebee2ed0 drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart      2023-10-25  657  	subdev->internal_ops = &vsp1_entity_internal_ops;
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  658  
6a8e07b215a91b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2016-02-15  659  	subdev->entity.function = function;
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  660  	subdev->entity.ops = &vsp1->media_ops;
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  661  	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  662  
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  663  	snprintf(subdev->name, sizeof(subdev->name), "%s %s",
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  664  		 dev_name(vsp1->dev), name);
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  665  
0efdf0f5eaaff6 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15 @666  	vsp1_entity_init_cfg(subdev, NULL);
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  667  
9dbed95ba640c1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2017-02-26  668  	/*
de65f37d63de6c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart      2023-10-25  669  	 * Allocate the subdev state to store formats and selection
e790c3cb8d904c drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  670  	 * rectangles.
e790c3cb8d904c drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  671  	 */
40aaab9d773b07 drivers/media/platform/renesas/vsp1/vsp1_entity.c Tomi Valkeinen        2022-04-12  672  	/*
40aaab9d773b07 drivers/media/platform/renesas/vsp1/vsp1_entity.c Tomi Valkeinen        2022-04-12  673  	 * FIXME: Drop this call, drivers are not supposed to use
40aaab9d773b07 drivers/media/platform/renesas/vsp1/vsp1_entity.c Tomi Valkeinen        2022-04-12  674  	 * __v4l2_subdev_state_alloc().
40aaab9d773b07 drivers/media/platform/renesas/vsp1/vsp1_entity.c Tomi Valkeinen        2022-04-12  675  	 */
de65f37d63de6c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart      2023-10-25  676  	entity->state = __v4l2_subdev_state_alloc(&entity->subdev,
de65f37d63de6c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart      2023-10-25  677  						  "vsp1:state->lock", &key);
de65f37d63de6c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart      2023-10-25  678  	if (IS_ERR(entity->state)) {
e790c3cb8d904c drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  679  		media_entity_cleanup(&entity->subdev.entity);
de65f37d63de6c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart      2023-10-25  680  		return PTR_ERR(entity->state);
e790c3cb8d904c drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  681  	}
e790c3cb8d904c drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  682  
823329dfee7224 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2015-11-15  683  	return 0;
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  684  }
26e0ca22c3b85b drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart      2013-06-04  685  

:::::: The code at line 666 was first introduced by commit
:::::: 0efdf0f5eaaff6c18d1e645a8e1fdebf73400fe1 [media] v4l: vsp1: Implement and use the subdev pad::init_cfg configuration

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
