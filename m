Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3161A316C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 05:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754111435; cv=none; b=hLvCFbvFpweZe2y8aTrQfYqHI3tLXunMiIrVHuql9w4DWG2VsjrpKV840m6HNeoo5XVVGLrJHyQbDYbKXNPMHCVAoJNk/lf2tlXHpTQKZdL/oe9EpcYAXfd9+mpirRlU6cPcNywhS/lfM2yfeHcH0JIHpm9gfhbqJWm1OlA716s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754111435; c=relaxed/simple;
	bh=c6K//S/x5k7gjmPQHnJtbr11bRC8ZhaV9FJWi/oew1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRoYEeVpNueAUzygymBDr30skhpA1CNUEmxqUnSzryROCPFDVrtuZkZTgimsbXb3UYTdAw/KD09bYUg2kIkbg9R2iLmdUO0RWQAbk860w4dCrUrD+ksO3bjgQyPdySzdpujTj6FOHNE3G334jTN75kBh+wOe9lcTrE+2MOChNIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meECAwKu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meECAwKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754111434; x=1785647434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c6K//S/x5k7gjmPQHnJtbr11bRC8ZhaV9FJWi/oew1w=;
  b=meECAwKulGKyQtXYHK/OkJatHgr7C62wNYCKW/v6g3wSuOjGRN5JADdA
   r2ObzuAfstYXcXJLagucC/2PCtgpLudYcBR7yLDofOX0qThWCclvxH8zH
   CPnBnfylioxPQ/Fs6PFbQkrItZLlmblI06SyWEMkdcF0p/gJTTZef84/1
   oIxwQYx+x3lZotDKnd0JalYcfHOSUeQN+LHQsL03lTr9BZnYASIvvPvHt
   26r4Yt9qcBSZzq03+Sf+FbbWcwgvdMrXgshfylcmZweTifXKsPYtRYV5Y
   ZayQW+nktUYpuPwCnUEqrXJPEQL7CgqZE/cHE4xsPDeRyqZYekSnt7AK0
   Q==;
X-CSE-ConnectionGUID: TOar/R9+Qp2Aty1nAWPFLg==
X-CSE-MsgGUID: YgPN/wJMTPi73vGJ8zUhWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="74044539"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="74044539"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 22:10:31 -0700
X-CSE-ConnectionGUID: Uzl+8Tj7RYmklOBmV3U6cQ==
X-CSE-MsgGUID: tX+mDYzpToqzMrV250P9eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164071742"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Aug 2025 22:10:31 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui4Vo-0005Bg-02;
	Sat, 02 Aug 2025 05:10:28 +0000
Date: Sat, 2 Aug 2025 13:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/state-readout 36/51]
 drivers/gpu/drm/tidss/tidss_plane.c:211:39: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202508021301.GG1jYsup-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/state-readout
head:   f8f58ab7e9eac7e5daa40ab3f03b67f54ee9e9a4
commit: 02000baf0a9e7210c4effb2d6c552fb93f4b2287 [36/51] tidss: Implement readout support
config: sparc-randconfig-002-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021301.GG1jYsup-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021301.GG1jYsup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021301.GG1jYsup-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tidss/tidss_plane.c: In function 'tidss_plane_readout_fb':
>> drivers/gpu/drm/tidss/tidss_plane.c:211:39: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      dispc_plane_find_fourcc_by_dss_code(FIELD_GET(DISPC_VID_ATTRIBUTES_FORMAT_MASK,
                                          ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/tidss/tidss_crtc.c: In function 'tidss_crtc_readout_mode':
>> drivers/gpu/drm/tidss/tidss_crtc.c:435:13: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     hdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK, val) + 1;
                ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +211 drivers/gpu/drm/tidss/tidss_plane.c

   191	
   192	static struct drm_framebuffer *tidss_plane_readout_fb(struct drm_plane *plane)
   193	{
   194		struct drm_device *ddev = plane->dev;
   195		struct tidss_device *tidss = to_tidss(ddev);
   196		struct dispc_device *dispc = tidss->dispc;
   197		struct tidss_plane *tplane = to_tidss_plane(plane);
   198		const struct drm_format_info *info;
   199		struct drm_framebuffer *fb;
   200		u32 fourcc, val;
   201		int ret;
   202	
   203		fb = kzalloc(sizeof(*fb), GFP_KERNEL);
   204		if (!fb)
   205			return ERR_PTR(-ENOMEM);
   206	
   207		fb->dev = plane->dev;
   208	
   209		val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_ATTRIBUTES);
   210		fourcc =
 > 211			dispc_plane_find_fourcc_by_dss_code(FIELD_GET(DISPC_VID_ATTRIBUTES_FORMAT_MASK,
   212								      val));
   213		if (!fourcc) {
   214			ret = -EINVAL;
   215			goto err_free_fb;
   216		}
   217	
   218		info = drm_format_info(fourcc);
   219		if (!info) {
   220			ret = -EINVAL;
   221			goto err_free_fb;
   222		}
   223	
   224		// TODO: Figure out YUV and multiplanar formats
   225		if (info->is_yuv) {
   226			ret = -EINVAL;
   227			goto err_free_fb;
   228		}
   229	
   230		fb->format = info;
   231	
   232		val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_PICTURE_SIZE);
   233		fb->width = FIELD_GET(DISPC_VID_PICTURE_SIZE_MEMSIZEX_MASK, val) + 1;
   234		fb->height = FIELD_GET(DISPC_VID_PICTURE_SIZE_MEMSIZEY_MASK, val) + 1;
   235	
   236		// TODO: Figure that out.
   237		val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_ROW_INC);
   238		if (val != 1) {
   239			ret = -EINVAL;
   240			goto err_free_fb;
   241		}
   242	
   243		fb->pitches[0] = fb->width * (drm_format_info_bpp(info, 0) / 8);
   244	
   245		// TODO: Figure out the offsets
   246		fb->offsets[0] = 0;
   247	
   248		ret = drm_framebuffer_init(plane->dev, fb, &tidss_plane_readout_fb_funcs);
   249		if (ret) {
   250			kfree(fb);
   251			return ERR_PTR(ret);
   252		}
   253	
   254		return fb;
   255	
   256	err_free_fb:
   257		kfree(fb);
   258		return ERR_PTR(ret);
   259	}
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
