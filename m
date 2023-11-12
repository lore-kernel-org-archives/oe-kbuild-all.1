Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3F0369
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQ9Gojgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699792568; x=1731328568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X8qILkOHqVGEqzkERq+6jBuI0deHCCDYOHpck3SaxfQ=;
  b=BQ9GojgczpMG6PrB4yGq9RcvEifrLiJv2vQJZhm9Mh5s3g4iUuCTYzph
   RpXn6wSXh8KygGykHTQ34aQhKboE3Zhe8p0JcmCNHxkBNq/rTW3lBQQP9
   TTQhN+MxGnctSPJpaOPnSh1kdslr7z+cY0TYe0MGSpfr830Hbb2/57mud
   u5xVAAZzM5Y9SroC5KKlX2shI66kcZ/cUx4+Foxd2b2BOJFJQNMVzPE/m
   zhk6wE99XTTa55dKkXpLclkm4hgASdxfTint/jZbh9M/KnV3V23hQllvw
   S+6KrlilQmwds3EkplkAvPWwLm0e1K57xYd+LsjEpkb2k8FcWyY38QEFM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="369654976"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="369654976"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 04:36:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="11858724"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Nov 2023 04:36:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r29h5-000B92-1a;
	Sun, 12 Nov 2023 12:36:03 +0000
Date: Sun, 12 Nov 2023 20:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:iommufd-v5.19-rc5 68/104]
 drivers/gpu/drm/i915/gvt/vgpu.c:327: warning: Function parameter or member
 'mdev' not described in 'intel_gvt_create_vgpu'
Message-ID: <202311122039.31l3hlVk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git iommufd-v5.19-rc5
head:   f200d9a1de755f3bb98e21535e22b9adf6ba83f7
commit: 64d7ee610b9894156431404061a136147988b80e [68/104] drm/i915/gvt: Use vfio_alloc_device()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231112/202311122039.31l3hlVk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311122039.31l3hlVk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311122039.31l3hlVk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gvt/vgpu.c:168: warning: expecting prototype for intel_gvt_active_vgpu(). Prototype was for intel_gvt_activate_vgpu() instead
   drivers/gpu/drm/i915/gvt/vgpu.c:183: warning: expecting prototype for intel_gvt_deactive_vgpu(). Prototype was for intel_gvt_deactivate_vgpu() instead
   drivers/gpu/drm/i915/gvt/vgpu.c:307: warning: expecting prototype for intel_gvt_destroy_vgpu(). Prototype was for intel_gvt_destroy_idle_vgpu() instead
>> drivers/gpu/drm/i915/gvt/vgpu.c:327: warning: Function parameter or member 'mdev' not described in 'intel_gvt_create_vgpu'


vim +327 drivers/gpu/drm/i915/gvt/vgpu.c

afe04fbe6c522e Ping Gao           2017-03-30  314  
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  315  /**
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  316   * intel_gvt_create_vgpu - create a virtual GPU
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  317   * @gvt: GVT device
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  318   * @conf: type of the vGPU to create
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  319   *
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  320   * This function is called when user wants to create a virtual GPU.
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  321   *
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  322   * Returns:
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  323   * pointer to intel_vgpu, error pointer if failed.
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  324   */
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  325  struct intel_vgpu *intel_gvt_create_vgpu(struct intel_gvt *gvt,
64d7ee610b9894 Yi Liu             2022-07-11  326  		const struct intel_vgpu_config *conf, struct mdev_device *mdev)
82d375d1b56820 Zhi Wang           2016-07-05 @327  {
28284943ac9401 Zhenyu Wang        2020-09-14  328  	struct drm_i915_private *dev_priv = gvt->gt->i915;
82d375d1b56820 Zhi Wang           2016-07-05  329  	struct intel_vgpu *vgpu;
82d375d1b56820 Zhi Wang           2016-07-05  330  	int ret;
82d375d1b56820 Zhi Wang           2016-07-05  331  
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  332  	gvt_dbg_core("low %u MB high %u MB fence %u\n",
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  333  			BYTES_TO_MB(conf->low_mm), BYTES_TO_MB(conf->high_mm),
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  334  			conf->fence);
82d375d1b56820 Zhi Wang           2016-07-05  335  
64d7ee610b9894 Yi Liu             2022-07-11  336  	vgpu = vfio_alloc_device(intel_vgpu, vfio_device,
64d7ee610b9894 Yi Liu             2022-07-11  337  				 &mdev->dev, &intel_vgpu_dev_ops);
82d375d1b56820 Zhi Wang           2016-07-05  338  	if (!vgpu)
82d375d1b56820 Zhi Wang           2016-07-05  339  		return ERR_PTR(-ENOMEM);
82d375d1b56820 Zhi Wang           2016-07-05  340  
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  341  	mutex_lock(&gvt->lock);
afe04fbe6c522e Ping Gao           2017-03-30  342  	ret = idr_alloc(&gvt->vgpu_idr, vgpu, IDLE_VGPU_IDR + 1, GVT_MAX_VGPU,
afe04fbe6c522e Ping Gao           2017-03-30  343  		GFP_KERNEL);
82d375d1b56820 Zhi Wang           2016-07-05  344  	if (ret < 0)
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  345  		goto out_unlock;;
82d375d1b56820 Zhi Wang           2016-07-05  346  
82d375d1b56820 Zhi Wang           2016-07-05  347  	vgpu->id = ret;
82d375d1b56820 Zhi Wang           2016-07-05  348  	vgpu->gvt = gvt;
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  349  	vgpu->sched_ctl.weight = conf->weight;
f25a49ab8ab9c1 Colin Xu           2018-05-19  350  	mutex_init(&vgpu->vgpu_lock);
d6c6113bfe19af Hang Yuan          2018-07-30  351  	mutex_init(&vgpu->dmabuf_lock);
e546e281d33d1f Tina Zhang         2017-11-23  352  	INIT_LIST_HEAD(&vgpu->dmabuf_obj_list_head);
e502a2af4c358d Changbin Du        2018-01-30  353  	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
64e65f443a43c3 Deepak R Varma     2020-11-04  354  	idr_init_base(&vgpu->object_idr, 1);
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  355  	intel_vgpu_init_cfg_space(vgpu, 1);
ba25d977571e15 Colin Xu           2020-07-09  356  	vgpu->d3_entered = false;
82d375d1b56820 Zhi Wang           2016-07-05  357  
cdcc43479c9b92 Changbin Du        2017-01-13  358  	ret = intel_vgpu_init_mmio(vgpu);
82d375d1b56820 Zhi Wang           2016-07-05  359  	if (ret)
4e5378918b5b96 Jike Song          2017-01-06  360  		goto out_clean_idr;
82d375d1b56820 Zhi Wang           2016-07-05  361  
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  362  	ret = intel_vgpu_alloc_resource(vgpu, conf);
82d375d1b56820 Zhi Wang           2016-07-05  363  	if (ret)
82d375d1b56820 Zhi Wang           2016-07-05  364  		goto out_clean_vgpu_mmio;
82d375d1b56820 Zhi Wang           2016-07-05  365  
82d375d1b56820 Zhi Wang           2016-07-05  366  	populate_pvinfo_page(vgpu);
82d375d1b56820 Zhi Wang           2016-07-05  367  
2707e44466881d Zhi Wang           2016-03-28  368  	ret = intel_vgpu_init_gtt(vgpu);
2707e44466881d Zhi Wang           2016-03-28  369  	if (ret)
62980cacc37f58 Christoph Hellwig  2022-04-11  370  		goto out_clean_vgpu_resource;
2707e44466881d Zhi Wang           2016-03-28  371  
4dff110b15aea2 Xiong Zhang        2017-11-20  372  	ret = intel_vgpu_init_opregion(vgpu);
04d348ae3f0aea Zhi Wang           2016-04-25  373  	if (ret)
8f89743bddec87 Jike Song          2016-11-03  374  		goto out_clean_gtt;
04d348ae3f0aea Zhi Wang           2016-04-25  375  
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  376  	ret = intel_vgpu_init_display(vgpu, conf->edid);
4dff110b15aea2 Xiong Zhang        2017-11-20  377  	if (ret)
4dff110b15aea2 Xiong Zhang        2017-11-20  378  		goto out_clean_opregion;
4dff110b15aea2 Xiong Zhang        2017-11-20  379  
874b6a910e6cc0 Zhi Wang           2017-09-10  380  	ret = intel_vgpu_setup_submission(vgpu);
e473405783c064 Zhi Wang           2016-05-01  381  	if (ret)
ad1d36369b07f6 Zhi Wang           2017-09-13  382  		goto out_clean_display;
e473405783c064 Zhi Wang           2016-05-01  383  
4b63960ebd3f4c Zhi Wang           2016-05-01  384  	ret = intel_vgpu_init_sched_policy(vgpu);
4b63960ebd3f4c Zhi Wang           2016-05-01  385  	if (ret)
ad1d36369b07f6 Zhi Wang           2017-09-13  386  		goto out_clean_submission;
4b63960ebd3f4c Zhi Wang           2016-05-01  387  
f8871ec8fc73f5 Greg Kroah-Hartman 2019-06-13  388  	intel_gvt_debugfs_add_vgpu(vgpu);
bc7b0be316aeba Changbin Du        2017-09-26  389  
f9399b0e4a9555 Christoph Hellwig  2022-04-11  390  	ret = intel_gvt_set_opregion(vgpu);
b851adeac0858c Tina Zhang         2017-11-20  391  	if (ret)
b851adeac0858c Tina Zhang         2017-11-20  392  		goto out_clean_sched_policy;
b851adeac0858c Tina Zhang         2017-11-20  393  
4ceb06e7c336f4 Colin Xu           2020-12-01  394  	if (IS_BROADWELL(dev_priv) || IS_BROXTON(dev_priv))
f9399b0e4a9555 Christoph Hellwig  2022-04-11  395  		ret = intel_gvt_set_edid(vgpu, PORT_B);
4ceb06e7c336f4 Colin Xu           2020-12-01  396  	else
f9399b0e4a9555 Christoph Hellwig  2022-04-11  397  		ret = intel_gvt_set_edid(vgpu, PORT_D);
39c68e87bc50a7 Hang Yuan          2019-01-30  398  	if (ret)
39c68e87bc50a7 Hang Yuan          2019-01-30  399  		goto out_clean_sched_policy;
39c68e87bc50a7 Hang Yuan          2019-01-30  400  
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  401  	intel_gvt_update_reg_whitelist(vgpu);
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  402  	mutex_unlock(&gvt->lock);
82d375d1b56820 Zhi Wang           2016-07-05  403  	return vgpu;
82d375d1b56820 Zhi Wang           2016-07-05  404  
bc7b0be316aeba Changbin Du        2017-09-26  405  out_clean_sched_policy:
bc7b0be316aeba Changbin Du        2017-09-26  406  	intel_vgpu_clean_sched_policy(vgpu);
ad1d36369b07f6 Zhi Wang           2017-09-13  407  out_clean_submission:
874b6a910e6cc0 Zhi Wang           2017-09-10  408  	intel_vgpu_clean_submission(vgpu);
8453d674ae7e63 Zhi Wang           2016-05-01  409  out_clean_display:
8453d674ae7e63 Zhi Wang           2016-05-01  410  	intel_vgpu_clean_display(vgpu);
4dff110b15aea2 Xiong Zhang        2017-11-20  411  out_clean_opregion:
4dff110b15aea2 Xiong Zhang        2017-11-20  412  	intel_vgpu_clean_opregion(vgpu);
4d60c5fd3f8751 Zhi Wang           2016-07-20  413  out_clean_gtt:
4d60c5fd3f8751 Zhi Wang           2016-07-20  414  	intel_vgpu_clean_gtt(vgpu);
82d375d1b56820 Zhi Wang           2016-07-05  415  out_clean_vgpu_resource:
82d375d1b56820 Zhi Wang           2016-07-05  416  	intel_vgpu_free_resource(vgpu);
82d375d1b56820 Zhi Wang           2016-07-05  417  out_clean_vgpu_mmio:
cdcc43479c9b92 Changbin Du        2017-01-13  418  	intel_vgpu_clean_mmio(vgpu);
4e5378918b5b96 Jike Song          2017-01-06  419  out_clean_idr:
4e5378918b5b96 Jike Song          2017-01-06  420  	idr_remove(&gvt->vgpu_idr, vgpu->id);
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  421  out_unlock:
28e5c5b9d7ea85 Christoph Hellwig  2022-07-04  422  	mutex_unlock(&gvt->lock);
64d7ee610b9894 Yi Liu             2022-07-11  423  	vfio_put_device(&vgpu->vfio_device);
82d375d1b56820 Zhi Wang           2016-07-05  424  	return ERR_PTR(ret);
82d375d1b56820 Zhi Wang           2016-07-05  425  }
1f31c8294880d1 Zhenyu Wang        2016-11-03  426  

:::::: The code at line 327 was first introduced by commit
:::::: 82d375d1b56820fd094da15c82562661b6a8f344 drm/i915/gvt: Introduce basic vGPU life cycle management

:::::: TO: Zhi Wang <zhi.a.wang@intel.com>
:::::: CC: Zhenyu Wang <zhenyuw@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
