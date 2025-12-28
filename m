Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C5D195FE8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766933289; cv=none; b=nl5gNL3hsZaF95zeX7wOIyL3Tdn2ppvGuj6FnxJX65fNGc+8W+G9W4wPIMBIYKo8p/mKPwpRIlne3T6G7IoH4xjtmgjjOvkodVdBGqRunAKJfDiwY4+xqYpD+I/LEtmM2ONXRujmwI+nu4pw3nGkeBJZKPqRdUafL+707O+Pyq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766933289; c=relaxed/simple;
	bh=4a/xh7U45/pxY74M19iff9F+/o0wvF4Zc3fxjD4KUfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNm5ZVkS34/O31Lql+pkR7wb9xrXhcjR7QKh5q76U5/Dr911gNoDMcpd+8ZjDNqBaEInyTcJsxSaHPBhvDxWBZ8Q5F6FDuJVwHe9bNyfeJb9fJecs5OXGknJGj4m0iT0kl0YUwAfvxkMZvRWYF8VBXDtiuoTqYkLw7lbcjqYjG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnU05Xgb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnU05Xgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766933288; x=1798469288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4a/xh7U45/pxY74M19iff9F+/o0wvF4Zc3fxjD4KUfc=;
  b=GnU05Xgbws7j1bf/AUpIalnsITrEcI5NE5mOsVvbHsYv+KSy+m2NgVhG
   OqPKZn3B6ojPKqP0aVYznbM1x5qqLG4XrpOt85qtDRHtfbVitQTrNh6Ct
   rV14WY4ULiNnPyfNmXT9JTE6ikop7f2DlwDwT2Yva/t9j/qM0EJ+nnZEV
   gKsU5l3BeQNdgAlcJLJe/cywEpM3ZSOwCXBv3VvlGKdb+zorjC9VUTRai
   NOYpot25Yuhfkj5NV/T/IS6lS4yu9PUPJTtjN9Pc/mn+CrL4uHCTgfwEY
   PvV68Comy9MRjke2QMahY7e7D7I+6cC/vQAXJz1UvPxbhK44YcRMaca2n
   A==;
X-CSE-ConnectionGUID: lrj2RxPAR7yod5dJ00kEug==
X-CSE-MsgGUID: 3Gykb/ZRRG2/fQIr3YEczA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72200158"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="72200158"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 06:48:07 -0800
X-CSE-ConnectionGUID: /3ycFk5xSJamRLUVEzoY6g==
X-CSE-MsgGUID: Xllba8d2R/CRQdrhfkSb5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="199864637"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Dec 2025 06:48:04 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZs3m-000000006WL-1KbM;
	Sun, 28 Dec 2025 14:47:59 +0000
Date: Sun, 28 Dec 2025 22:46:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] drm/atomic: verify that gamma/degamma LUTs are
 not too big
Message-ID: <202512282230.ryhYGLxv-lkp@intel.com>
References: <20251228-drm-fix-lut-checks-v2-3-50f5d1a260a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-drm-fix-lut-checks-v2-3-50f5d1a260a7@oss.qualcomm.com>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 130343ee6bca9895c47d314467db7dd3dcc8bc35]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-mode_object-add-drm_object_immutable_property_get_value/20251228-112526
base:   130343ee6bca9895c47d314467db7dd3dcc8bc35
patch link:    https://lore.kernel.org/r/20251228-drm-fix-lut-checks-v2-3-50f5d1a260a7%40oss.qualcomm.com
patch subject: [PATCH v2 3/3] drm/atomic: verify that gamma/degamma LUTs are not too big
config: x86_64-randconfig-071-20251228 (https://download.01.org/0day-ci/archive/20251228/202512282230.ryhYGLxv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512282230.ryhYGLxv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512282230.ryhYGLxv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic_uapi.c: In function 'drm_atomic_crtc_set_property':
>> drivers/gpu/drm/drm_atomic_uapi.c:416:23: error: type defaults to 'int' in declaration of 'elem_size' [-Wimplicit-int]
     416 |                 const elem_size = sizeof(struct drm_color_lut);
         |                       ^~~~~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:441:23: error: type defaults to 'int' in declaration of 'elem_size' [-Wimplicit-int]
     441 |                 const elem_size = sizeof(struct drm_color_lut);
         |                       ^~~~~~~~~


vim +416 drivers/gpu/drm/drm_atomic_uapi.c

   395	
   396	static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
   397			struct drm_crtc_state *state, struct drm_property *property,
   398			uint64_t val)
   399	{
   400		struct drm_device *dev = crtc->dev;
   401		struct drm_mode_config *config = &dev->mode_config;
   402		bool replaced = false;
   403		int ret;
   404	
   405		if (property == config->prop_active)
   406			state->active = val;
   407		else if (property == config->prop_mode_id) {
   408			struct drm_property_blob *mode =
   409				drm_property_lookup_blob(dev, val);
   410			ret = drm_atomic_set_mode_prop_for_crtc(state, mode);
   411			drm_property_blob_put(mode);
   412			return ret;
   413		} else if (property == config->prop_vrr_enabled) {
   414			state->vrr_enabled = val;
   415		} else if (property == config->degamma_lut_property) {
 > 416			const elem_size = sizeof(struct drm_color_lut);
   417			u64 lut_size;
   418	
   419			ret = drm_object_immutable_property_get_value(&crtc->base,
   420								      config->degamma_lut_size_property,
   421								      &lut_size);
   422			if (ret)
   423				return ret;
   424	
   425			ret = drm_property_replace_blob_from_id(dev,
   426						&state->degamma_lut,
   427						val,
   428						elem_size * lut_size, -1, elem_size,
   429						&replaced);
   430			state->color_mgmt_changed |= replaced;
   431			return ret;
   432		} else if (property == config->ctm_property) {
   433			ret = drm_property_replace_blob_from_id(dev,
   434						&state->ctm,
   435						val,
   436						-1, sizeof(struct drm_color_ctm), -1,
   437						&replaced);
   438			state->color_mgmt_changed |= replaced;
   439			return ret;
   440		} else if (property == config->gamma_lut_property) {
   441			const elem_size = sizeof(struct drm_color_lut);
   442			u64 lut_size;
   443	
   444			ret = drm_object_immutable_property_get_value(&crtc->base,
   445								      config->gamma_lut_size_property,
   446								      &lut_size);
   447			if (ret)
   448				return ret;
   449	
   450			ret = drm_property_replace_blob_from_id(dev,
   451						&state->gamma_lut,
   452						val,
   453						elem_size * lut_size, -1, elem_size,
   454						&replaced);
   455			state->color_mgmt_changed |= replaced;
   456			return ret;
   457		} else if (property == config->prop_out_fence_ptr) {
   458			s32 __user *fence_ptr = u64_to_user_ptr(val);
   459	
   460			if (!fence_ptr)
   461				return 0;
   462	
   463			if (put_user(-1, fence_ptr))
   464				return -EFAULT;
   465	
   466			set_out_fence_for_crtc(state->state, crtc, fence_ptr);
   467		} else if (property == crtc->scaling_filter_property) {
   468			state->scaling_filter = val;
   469		} else if (property == crtc->sharpness_strength_property) {
   470			state->sharpness_strength = val;
   471		} else if (crtc->funcs->atomic_set_property) {
   472			return crtc->funcs->atomic_set_property(crtc, state, property, val);
   473		} else {
   474			drm_dbg_atomic(crtc->dev,
   475				       "[CRTC:%d:%s] unknown property [PROP:%d:%s]\n",
   476				       crtc->base.id, crtc->name,
   477				       property->base.id, property->name);
   478			return -EINVAL;
   479		}
   480	
   481		return 0;
   482	}
   483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
