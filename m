Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8909B7482
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 01:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728092096; cv=none; b=qPz+LfMtY4QHtFrBg93d3wjFsMJnUdXaPU33SrXQNNvXMnFhZrdEMSNKna0+VInYJwCqbOLbC4pGT6lA6gFZeU41X2Jv4Cvv1M6tC1T5phR6vb3vgZVF3bBJb149zWCElE/S5yozz5Qx2JE/hKL/rX3p9BzSW/KyNmgnwrRmoww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728092096; c=relaxed/simple;
	bh=w6pcQTbhlGfWE5x6wUvif9Ojx1S6o87achHEvIFDUFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tcs1XYfgJT56Z3TQgdojXcZAiPToG3gyDssKmzB8sakOtSWDkkKXOTiYvVcq6zeO+Y1+NQiTkFGzh/Qzx35axxraM+GF5wcO1OF0ptEXHyyBajfg1sz6+uyYmfIlbO7+TUZHWrl0f3iNoKFgJJIeDJEmTVXSDHDdHfUzhivDlN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5v/6mP+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5v/6mP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728092094; x=1759628094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w6pcQTbhlGfWE5x6wUvif9Ojx1S6o87achHEvIFDUFY=;
  b=P5v/6mP+p+sGuwoFvSLYbL8kEMEqGUU1RmGCGwaYjyWTAWVKs06Pw/aG
   FfRPiWLtEgtWh3INDxKlynkIKDZ7rgCo89vU0FTUVaQahJ2dBSfW7jChY
   ROvBL0GEl2m/SfLwdP/nk138ycPCUi7khLGXRxDIZv2RYLKrQq0Kjgaoa
   EiJufquVovrTrqsCnDAV6H5Bbvo6/em03jZ7XJPDrD7b9Opz/lDkP4kUo
   0GnnBPxrevoiHyNINz02Ta9E5ikbSzhghY1eAGuE0F5Tda6Lu+ql7XuIh
   5/1sAvQhgnc/FP1nIidTtxsh23r21lc1XG5qv57mh2jMIx4RkE50WFrk2
   Q==;
X-CSE-ConnectionGUID: eHQUQp1rTgyZCPV1jb1LEg==
X-CSE-MsgGUID: fyVSqtm2T3ukdJvK42WemA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27202465"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27202465"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 18:34:52 -0700
X-CSE-ConnectionGUID: 74QCdmyNS5WnKD0Tr1O8Dg==
X-CSE-MsgGUID: 7/2YLGGiTsucy7yMMdTBeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79704271"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Oct 2024 18:34:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swth0-0002QG-2C;
	Sat, 05 Oct 2024 01:34:46 +0000
Date: Sat, 5 Oct 2024 09:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
	airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>
Subject: Re: [PATCH v2 10/11] drm/client: Make client support optional
Message-ID: <202410050927.Hgk0Kazl-lkp@intel.com>
References: <20241002131306.288618-11-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002131306.288618-11-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20241002]
[cannot apply to drm-xe/drm-xe-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc1 v6.11 v6.11-rc7 v6.12-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-i915-Select-DRM_CLIENT_SELECTION/20241002-211520
base:   next-20241002
patch link:    https://lore.kernel.org/r/20241002131306.288618-11-tzimmermann%40suse.de
patch subject: [PATCH v2 10/11] drm/client: Make client support optional
config: nios2-randconfig-r051-20241005 (https://download.01.org/0day-ci/archive/20241005/202410050927.Hgk0Kazl-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050927.Hgk0Kazl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050927.Hgk0Kazl-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/gpu/drm/drm_debugfs.o: in function `drm_debugfs_dev_register':
>> drivers/gpu/drm/drm_debugfs.c:313:(.text+0x1240): undefined reference to `drm_client_debugfs_init'
>> drivers/gpu/drm/drm_debugfs.c:313:(.text+0x1240): relocation truncated to fit: R_NIOS2_CALL26 against `drm_client_debugfs_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +313 drivers/gpu/drm/drm_debugfs.c

0b30d57acafcaa Christian König  2023-08-29  306  
0b30d57acafcaa Christian König  2023-08-29  307  void drm_debugfs_dev_register(struct drm_device *dev)
0b30d57acafcaa Christian König  2023-08-29  308  {
0b30d57acafcaa Christian König  2023-08-29  309  	drm_debugfs_add_files(dev, drm_debugfs_list, DRM_DEBUGFS_ENTRIES);
0b30d57acafcaa Christian König  2023-08-29  310  
0b30d57acafcaa Christian König  2023-08-29  311  	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
0b30d57acafcaa Christian König  2023-08-29  312  		drm_framebuffer_debugfs_init(dev);
0b30d57acafcaa Christian König  2023-08-29 @313  		drm_client_debugfs_init(dev);
0b30d57acafcaa Christian König  2023-08-29  314  	}
d0b3c318e04cc6 Dmitry Baryshkov 2023-12-03  315  	if (drm_drv_uses_atomic_modeset(dev))
0b30d57acafcaa Christian König  2023-08-29  316  		drm_atomic_debugfs_init(dev);
0b30d57acafcaa Christian König  2023-08-29  317  }
0b30d57acafcaa Christian König  2023-08-29  318  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
