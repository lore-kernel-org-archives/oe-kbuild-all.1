Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE0615C152
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 22:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723416049; cv=none; b=FAs4MCG5YCbm4L27OyHGOrzlIQOJ5IlR62AnmwfsW8R0ypiEFE0CHdDvJitrYxbaQXOeYTr5ZwrZvPQqdCbpZO+9nwCqGAryTcizfoO6KYMbMf4MFOF3pCQb2lMxdKLDF+1zriuHWF5kNryfWCLcPybRNCJwap8c9Z7OXhItuy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723416049; c=relaxed/simple;
	bh=mrNqEHoVeDIj2rjj/6b5sk1pwiBtPPqmfuOI/5Oq2Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R7oOH+DXBnP//EaJq3kemuN20tbBv96wkosc4OLxLu0NGmBBOq78UmpILxGdJUYlAYzIiDXf9ptL8JXs5bCeqNtT43NZfDIFCyhrc4G5faZQjmDa4a80ZcZYIVdFjanGPmDXkso8Wo775f1Dwxr87hoSr9Mcp6oefxsA8sD0aO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6+8vD81; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6+8vD81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723416046; x=1754952046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mrNqEHoVeDIj2rjj/6b5sk1pwiBtPPqmfuOI/5Oq2Lw=;
  b=T6+8vD81XyPBkKGxHfwSql+KHW3uQUsgGwFlmyGqhLg3/cnGbJeUvkZB
   CK10K/U0fg8WLM3HrKSrJ4ob+F6g3NoLHH8D7p0RjZObYfZLuFHZPA3fz
   Hx+Wi+sydFrWXATd0Zr6qb4efOBIVxIHn2MXe3EW9oqt+NZ1hiJIi+k9M
   eKxxfeHt/f6AeSUWWlJ77TdwQYEfi/MufDp2nfREkqXMio6B7xzRA0GKu
   zUgW/diU3VZUO0F2lovY0bqYykO0Poch99fKHQWq4Gva5HRYU7cFrzDKm
   at7/xbPqeKpI0Nsslto/COGQ2gAAaqzeEHQXoHp6Ex6BxQk1jwnCZQjoh
   w==;
X-CSE-ConnectionGUID: Ka8hOf3NQGyBb44x/gRfmQ==
X-CSE-MsgGUID: uyz1RuqxR8ed/fZK2FMXcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="38964996"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="38964996"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 15:40:46 -0700
X-CSE-ConnectionGUID: x9Qn76uFTm2Y3DDG4Ru+vw==
X-CSE-MsgGUID: 7/nl0c+rRHS4ismtyGRnRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="62483765"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Aug 2024 15:40:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdHEx-000BCd-06;
	Sun, 11 Aug 2024 22:40:43 +0000
Date: Mon, 12 Aug 2024 06:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 35/40]
 drivers/media/platform/vsp1/vsp1_rwpf.c:22:16: warning: returning 'int' from
 a function with return type 'struct v4l2_rect *' makes pointer from integer
 without a cast
Message-ID: <202408120621.bs2gtLKi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   53be161810164d318caa3cfe563e7054f161f1f4
commit: 92672773016c4c2910dabcba5ccba00c7dfdf789 [35/40] drm: renesas: Add RZ/G2L DU Support
config: sparc-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240812/202408120621.bs2gtLKi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120621.bs2gtLKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120621.bs2gtLKi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/vsp1/vsp1_rwpf.c: In function 'vsp1_rwpf_get_crop':
   drivers/media/platform/vsp1/vsp1_rwpf.c:22:16: error: implicit declaration of function 'v4l2_subdev_get_try_crop' [-Werror=implicit-function-declaration]
      22 |         return v4l2_subdev_get_try_crop(&rwpf->entity.subdev, config,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/vsp1/vsp1_rwpf.c:22:16: warning: returning 'int' from a function with return type 'struct v4l2_rect *' makes pointer from integer without a cast [-Wint-conversion]
      22 |         return v4l2_subdev_get_try_crop(&rwpf->entity.subdev, config,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                                         RWPF_PAD_SINK);
         |                                         ~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/platform/vsp1/vsp1_entity.c: In function 'vsp1_entity_get_pad_format':
   drivers/media/platform/vsp1/vsp1_entity.c:145:16: error: implicit declaration of function 'v4l2_subdev_get_try_format'; did you mean 'vsp1_subdev_get_pad_format'? [-Werror=implicit-function-declaration]
     145 |         return v4l2_subdev_get_try_format(&entity->subdev, cfg, pad);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                vsp1_subdev_get_pad_format
>> drivers/media/platform/vsp1/vsp1_entity.c:145:16: warning: returning 'int' from a function with return type 'struct v4l2_mbus_framefmt *' makes pointer from integer without a cast [-Wint-conversion]
     145 |         return v4l2_subdev_get_try_format(&entity->subdev, cfg, pad);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/vsp1/vsp1_entity.c: In function 'vsp1_entity_get_pad_selection':
   drivers/media/platform/vsp1/vsp1_entity.c:166:24: error: implicit declaration of function 'v4l2_subdev_get_try_compose' [-Werror=implicit-function-declaration]
     166 |                 return v4l2_subdev_get_try_compose(&entity->subdev, cfg, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/vsp1/vsp1_entity.c:166:24: warning: returning 'int' from a function with return type 'struct v4l2_rect *' makes pointer from integer without a cast [-Wint-conversion]
     166 |                 return v4l2_subdev_get_try_compose(&entity->subdev, cfg, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/vsp1/vsp1_entity.c:168:24: error: implicit declaration of function 'v4l2_subdev_get_try_crop' [-Werror=implicit-function-declaration]
     168 |                 return v4l2_subdev_get_try_crop(&entity->subdev, cfg, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/vsp1/vsp1_entity.c:168:24: warning: returning 'int' from a function with return type 'struct v4l2_rect *' makes pointer from integer without a cast [-Wint-conversion]
     168 |                 return v4l2_subdev_get_try_crop(&entity->subdev, cfg, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/platform/vsp1/vsp1_brx.c: In function 'brx_get_compose':
   drivers/media/platform/vsp1/vsp1_brx.c:103:16: error: implicit declaration of function 'v4l2_subdev_get_try_compose' [-Werror=implicit-function-declaration]
     103 |         return v4l2_subdev_get_try_compose(&brx->entity.subdev, cfg, pad);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/vsp1/vsp1_brx.c:103:16: warning: returning 'int' from a function with return type 'struct v4l2_rect *' makes pointer from integer without a cast [-Wint-conversion]
     103 |         return v4l2_subdev_get_try_compose(&brx->entity.subdev, cfg, pad);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_RENESAS_VSP1
   Depends on [n]: MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=n] && VIDEO_V4L2 [=n] && (ARCH_RENESAS || COMPILE_TEST [=y]) && (!ARM64 && !VIDEO_RENESAS_FCP [=n] || VIDEO_RENESAS_FCP [=n])
   Selected by [y]:
   - DRM_RZG2L_DU [=y] && HAS_IOMEM [=y] && (ARCH_RZG2L [=n] || COMPILE_TEST [=y]) && DRM [=y] && OF [=y]


vim +22 drivers/media/platform/vsp1/vsp1_rwpf.c

26e0ca22c3b85b Laurent Pinchart 2013-06-04  18  
c6c8efb656ff21 Laurent Pinchart 2015-11-22  19  struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
c6c8efb656ff21 Laurent Pinchart 2015-11-22  20  				     struct v4l2_subdev_pad_config *config)
c6c8efb656ff21 Laurent Pinchart 2015-11-22  21  {
c6c8efb656ff21 Laurent Pinchart 2015-11-22 @22  	return v4l2_subdev_get_try_crop(&rwpf->entity.subdev, config,
c6c8efb656ff21 Laurent Pinchart 2015-11-22  23  					RWPF_PAD_SINK);
c6c8efb656ff21 Laurent Pinchart 2015-11-22  24  }
c6c8efb656ff21 Laurent Pinchart 2015-11-22  25  

:::::: The code at line 22 was first introduced by commit
:::::: c6c8efb656ff213a4d32776c12454b9c9f0c14e4 [media] v4l: vsp1: Merge RPF and WPF pad ops structures

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
