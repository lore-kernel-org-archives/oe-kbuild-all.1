Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A7141C75
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 22:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723414221; cv=none; b=b0zG7amBo+jMPV6JXz5uligVnb1SXzafQkz8EbPzGVrJglC2TdBJ/+3wlJgXN36ozVTMk51BZ8uEAfxDZZZsCsoLlCR2XYDhemFChfzcHTac5dVpTnbMGWGfW8ZDi9KtmdtcxP22vldlAnZthc9gm7Lv459fsB9M3YzoIftpYeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723414221; c=relaxed/simple;
	bh=id/0WDXa71P5CCvxzaaGjSk7ZJI4Bj5fMysxtJxKnCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6CV0j6EhsLS8vsm41oLPuBXvLvWGy8wlVQJZIqicduUtG0D5jBUYX5loaZXuOf5GP4Q5E0M28Gcgw6Z7NjVlCJ73V+Pw4tfa0ZFbtJSeW+N07g8xN/w8pMGMhJSomBzBYyWGvk7QKh6xHC/3P1QUgS/Z/bIcD7jZZK9KMHcWj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFTGk3EE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFTGk3EE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723414219; x=1754950219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=id/0WDXa71P5CCvxzaaGjSk7ZJI4Bj5fMysxtJxKnCE=;
  b=gFTGk3EEniCtPOaenfK/ETPZthKiiVsMZDlv7jkVXdet6g7lENVmsjed
   lbBENZacAZsXOySL9RSHN626OQxFIPcox3jIEihukeJ7mLjRX0dA7MMHm
   zdHB4/0gXSMOIH1yxjwThK0YSqZKTUQbXXhpmLmlQ0waeiImGqvvG7G5e
   vb7lk+/nnuAhTQUg5QbeXh58MyG5s289ES2v2KFiCSbqmupezK1MbZBg6
   aTrsz3vWKqubUbrz/Qg3tTJ9l5xufguZG3wgb54IDWe17rpSHlxWZUXwd
   L6vrpUzJTDJZ3q1MrqzP9Giy18iqXS90oNpPEDXklsQ6TtpsFuI/FLgqK
   g==;
X-CSE-ConnectionGUID: A0F9y1JeSAyGJj/nxY0KZA==
X-CSE-MsgGUID: FrX1DdRmRiO7RJ7pKjskqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21674853"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21674853"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 15:10:18 -0700
X-CSE-ConnectionGUID: knelQTcHT5CuAFE/knECEQ==
X-CSE-MsgGUID: FckNULh0R7mXich8Pi61Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58803886"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2024 15:10:17 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdGlS-000BBD-1r;
	Sun, 11 Aug 2024 22:10:14 +0000
Date: Mon, 12 Aug 2024 06:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 35/40]
 drivers/media/platform/vsp1/vsp1_entity.c:145:9: error: implicit declaration
 of function 'v4l2_subdev_get_try_format'
Message-ID: <202408120641.Djpj932T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Biju,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   53be161810164d318caa3cfe563e7054f161f1f4
commit: 92672773016c4c2910dabcba5ccba00c7dfdf789 [35/40] drm: renesas: Add RZ/G2L DU Support
config: powerpc64-randconfig-002-20240812 (https://download.01.org/0day-ci/archive/20240812/202408120641.Djpj932T-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120641.Djpj932T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120641.Djpj932T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/vsp1/vsp1_entity.c:145:9: error: implicit declaration of function 'v4l2_subdev_get_try_format' [-Werror,-Wimplicit-function-declaration]
           return v4l2_subdev_get_try_format(&entity->subdev, cfg, pad);
                  ^
   drivers/media/platform/vsp1/vsp1_entity.c:145:9: note: did you mean 'vsp1_subdev_get_pad_format'?
   drivers/media/platform/vsp1/vsp1_entity.h:175:5: note: 'vsp1_subdev_get_pad_format' declared here
   int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
       ^
>> drivers/media/platform/vsp1/vsp1_entity.c:145:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct v4l2_mbus_framefmt *' [-Wint-conversion]
           return v4l2_subdev_get_try_format(&entity->subdev, cfg, pad);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/vsp1/vsp1_entity.c:166:10: error: implicit declaration of function 'v4l2_subdev_get_try_compose' [-Werror,-Wimplicit-function-declaration]
                   return v4l2_subdev_get_try_compose(&entity->subdev, cfg, pad);
                          ^
>> drivers/media/platform/vsp1/vsp1_entity.c:166:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct v4l2_rect *' [-Wint-conversion]
                   return v4l2_subdev_get_try_compose(&entity->subdev, cfg, pad);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/vsp1/vsp1_entity.c:168:10: error: implicit declaration of function 'v4l2_subdev_get_try_crop' [-Werror,-Wimplicit-function-declaration]
                   return v4l2_subdev_get_try_crop(&entity->subdev, cfg, pad);
                          ^
   drivers/media/platform/vsp1/vsp1_entity.c:168:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct v4l2_rect *' [-Wint-conversion]
                   return v4l2_subdev_get_try_crop(&entity->subdev, cfg, pad);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.
--
>> drivers/media/platform/vsp1/vsp1_rwpf.c:22:9: error: implicit declaration of function 'v4l2_subdev_get_try_crop' [-Werror,-Wimplicit-function-declaration]
           return v4l2_subdev_get_try_crop(&rwpf->entity.subdev, config,
                  ^
>> drivers/media/platform/vsp1/vsp1_rwpf.c:22:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct v4l2_rect *' [-Wint-conversion]
           return v4l2_subdev_get_try_crop(&rwpf->entity.subdev, config,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/media/platform/vsp1/vsp1_brx.c:103:9: error: implicit declaration of function 'v4l2_subdev_get_try_compose' [-Werror,-Wimplicit-function-declaration]
           return v4l2_subdev_get_try_compose(&brx->entity.subdev, cfg, pad);
                  ^
>> drivers/media/platform/vsp1/vsp1_brx.c:103:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct v4l2_rect *' [-Wint-conversion]
           return v4l2_subdev_get_try_compose(&brx->entity.subdev, cfg, pad);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_RENESAS_VSP1
   Depends on [n]: MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=n] && VIDEO_V4L2 [=n] && (ARCH_RENESAS || COMPILE_TEST [=y]) && (!ARM64 && !VIDEO_RENESAS_FCP [=n] || VIDEO_RENESAS_FCP [=n])
   Selected by [m]:
   - DRM_RZG2L_DU [=m] && HAS_IOMEM [=y] && (ARCH_RZG2L [=n] || COMPILE_TEST [=y]) && DRM [=m] && OF [=y]


vim +/v4l2_subdev_get_try_format +145 drivers/media/platform/vsp1/vsp1_entity.c

e790c3cb8d904c Laurent Pinchart 2015-11-15  130  
e790c3cb8d904c Laurent Pinchart 2015-11-15  131  /**
e790c3cb8d904c Laurent Pinchart 2015-11-15  132   * vsp1_entity_get_pad_format - Get a pad format from storage for an entity
e790c3cb8d904c Laurent Pinchart 2015-11-15  133   * @entity: the entity
e790c3cb8d904c Laurent Pinchart 2015-11-15  134   * @cfg: the configuration storage
e790c3cb8d904c Laurent Pinchart 2015-11-15  135   * @pad: the pad number
e790c3cb8d904c Laurent Pinchart 2015-11-15  136   *
e790c3cb8d904c Laurent Pinchart 2015-11-15  137   * Return the format stored in the given configuration for an entity's pad. The
e790c3cb8d904c Laurent Pinchart 2015-11-15  138   * configuration can be an ACTIVE or TRY configuration.
e790c3cb8d904c Laurent Pinchart 2015-11-15  139   */
e790c3cb8d904c Laurent Pinchart 2015-11-15  140  struct v4l2_mbus_framefmt *
e790c3cb8d904c Laurent Pinchart 2015-11-15  141  vsp1_entity_get_pad_format(struct vsp1_entity *entity,
e790c3cb8d904c Laurent Pinchart 2015-11-15  142  			   struct v4l2_subdev_pad_config *cfg,
e790c3cb8d904c Laurent Pinchart 2015-11-15  143  			   unsigned int pad)
e790c3cb8d904c Laurent Pinchart 2015-11-15  144  {
e790c3cb8d904c Laurent Pinchart 2015-11-15 @145  	return v4l2_subdev_get_try_format(&entity->subdev, cfg, pad);
26e0ca22c3b85b Laurent Pinchart 2013-06-04  146  }
26e0ca22c3b85b Laurent Pinchart 2013-06-04  147  
ccd3d95a93de25 Laurent Pinchart 2016-03-03  148  /**
ccd3d95a93de25 Laurent Pinchart 2016-03-03  149   * vsp1_entity_get_pad_selection - Get a pad selection from storage for entity
ccd3d95a93de25 Laurent Pinchart 2016-03-03  150   * @entity: the entity
ccd3d95a93de25 Laurent Pinchart 2016-03-03  151   * @cfg: the configuration storage
ccd3d95a93de25 Laurent Pinchart 2016-03-03  152   * @pad: the pad number
ccd3d95a93de25 Laurent Pinchart 2016-03-03  153   * @target: the selection target
ccd3d95a93de25 Laurent Pinchart 2016-03-03  154   *
ccd3d95a93de25 Laurent Pinchart 2016-03-03  155   * Return the selection rectangle stored in the given configuration for an
ccd3d95a93de25 Laurent Pinchart 2016-03-03  156   * entity's pad. The configuration can be an ACTIVE or TRY configuration. The
ccd3d95a93de25 Laurent Pinchart 2016-03-03  157   * selection target can be COMPOSE or CROP.
ccd3d95a93de25 Laurent Pinchart 2016-03-03  158   */
b7e5107eebb73d Laurent Pinchart 2015-11-15  159  struct v4l2_rect *
ccd3d95a93de25 Laurent Pinchart 2016-03-03  160  vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
b7e5107eebb73d Laurent Pinchart 2015-11-15  161  			      struct v4l2_subdev_pad_config *cfg,
ccd3d95a93de25 Laurent Pinchart 2016-03-03  162  			      unsigned int pad, unsigned int target)
b7e5107eebb73d Laurent Pinchart 2015-11-15  163  {
ccd3d95a93de25 Laurent Pinchart 2016-03-03  164  	switch (target) {
ccd3d95a93de25 Laurent Pinchart 2016-03-03  165  	case V4L2_SEL_TGT_COMPOSE:
b7e5107eebb73d Laurent Pinchart 2015-11-15 @166  		return v4l2_subdev_get_try_compose(&entity->subdev, cfg, pad);
ccd3d95a93de25 Laurent Pinchart 2016-03-03  167  	case V4L2_SEL_TGT_CROP:
ccd3d95a93de25 Laurent Pinchart 2016-03-03 @168  		return v4l2_subdev_get_try_crop(&entity->subdev, cfg, pad);
ccd3d95a93de25 Laurent Pinchart 2016-03-03  169  	default:
ccd3d95a93de25 Laurent Pinchart 2016-03-03  170  		return NULL;
ccd3d95a93de25 Laurent Pinchart 2016-03-03  171  	}
b7e5107eebb73d Laurent Pinchart 2015-11-15  172  }
b7e5107eebb73d Laurent Pinchart 2015-11-15  173  

:::::: The code at line 145 was first introduced by commit
:::::: e790c3cb8d904c4bad0d4a37885bece2eb848eeb [media] v4l: vsp1: Store active formats in a pad config structure

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
