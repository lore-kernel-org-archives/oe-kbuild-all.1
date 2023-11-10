Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265F1C29B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f63qFhH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699628266; x=1731164266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MYwyfv5bcJiuxfyuJP9n3PodrdU476/GqmoVLlQCyWc=;
  b=f63qFhH2yfH7q1lxT7QVTI/DgrG/K8MqhorWI7kmXkYOHi60PmqHUe2t
   20+dR0zPd7MHARqozE803cSkVHCPOLMWfjhXSRy/DBnkJj2ibSEfKu4PL
   Svrv0D/Kk4OxJpSuZE19unhxuRO2YQs/iTkEAnX1lz2k8xeOBrjnkOTjj
   NsULHL1xuO0veq8wKhQxdN6IBryMVMTmmcHGSqZPvI8rGVrjSI7F4ce3o
   sVnxBjH7UZI0p24LY0dvZPg4+plqT15vBraU2vn7ZoKz95vXQEXI/DZMC
   HMooZeWtdTs9Iku+sBS3pNQrsKVlv4sRc+D44h0ZAfO/2b9joX+jdkF5C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387354946"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="387354946"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 06:57:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="880984540"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="880984540"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2023 06:57:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Sx3-0009fR-26;
	Fri, 10 Nov 2023 14:57:41 +0000
Date: Fri, 10 Nov 2023 22:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Jiang <fei.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Min He <min.he@intel.com>, Zhao Yakui <yakui.zhao@intel.com>
Subject: [intel-lts:4.19/android_t 3682/30000]
 drivers/gpu/drm/i915/intel_sprite.c:246:34: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202311102248.QmHfLZG3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 57004ce5f0c42ec3c1dc052e03cf8a805201472f [3682/30000] drm/i915/gvt: pvmmio optimization for plane update
config: x86_64-randconfig-121-20230910 (https://download.01.org/0day-ci/archive/20231110/202311102248.QmHfLZG3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311102248.QmHfLZG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311102248.QmHfLZG3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/intel_sprite.c:246:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] <asn:2> *pv_plane @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/i915/intel_sprite.c:246:34: sparse:     expected unsigned int [noderef] [usertype] <asn:2> *pv_plane
   drivers/gpu/drm/i915/intel_sprite.c:246:34: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: skl_disable_plane()+0x12c: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: vlv_disable_plane()+0x12b: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: g4x_disable_plane()+0xfb: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: skl_update_plane()+0x3dd: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: g4x_update_plane()+0x66a: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: ivb_disable_plane()+0xe2: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: ivb_update_plane()+0x5e0: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: chv_update_csc()+0x12b: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: vlv_update_plane()+0x3bc: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: skl_plane_format_mod_supported()+0x6e: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: intel_check_sprite_plane()+0x275: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: intel_pipe_update_start()+0x519: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: intel_pipe_update_end()+0x239: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_sprite.o: warning: objtool: intel_sprite_plane_create()+0x810: sibling call from callable instruction with modified stack frame

vim +246 drivers/gpu/drm/i915/intel_sprite.c

   234	
   235	static void pv_update_plane_reg(struct intel_plane *plane,
   236			u32 stride, uint32_t src_w, uint32_t src_h,
   237			uint32_t crtc_w, uint32_t crtc_h, u32 aux_stride,
   238			const struct intel_crtc_state *crtc_state,
   239			const struct intel_plane_state *plane_state)
   240	{
   241		int i;
   242		struct pv_plane_update tmp_plane;
   243		uint32_t x = plane_state->main.x;
   244		uint32_t y = plane_state->main.y;
   245		struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
 > 246		u32 __iomem *pv_plane = (u32 *)&(dev_priv->shared_page->pv_plane);
   247	
   248		memset(&tmp_plane, 0, sizeof(struct pv_plane_update));
   249		if (IS_GEMINILAKE(dev_priv) || IS_CANNONLAKE(dev_priv)) {
   250			tmp_plane.flags |= PLANE_COLOR_CTL_BIT;
   251			tmp_plane.plane_color_ctl = PLANE_COLOR_PIPE_GAMMA_ENABLE |
   252			      PLANE_COLOR_PIPE_CSC_ENABLE |
   253			      PLANE_COLOR_PLANE_GAMMA_DISABLE;
   254		}
   255	
   256		if (plane_state->ckey.flags) {
   257			tmp_plane.flags |= PLANE_KEY_BIT;
   258			tmp_plane.plane_key_val = plane_state->ckey.min_value;
   259			tmp_plane.plane_key_max = plane_state->ckey.max_value;
   260			tmp_plane.plane_key_msk = plane_state->ckey.channel_mask;
   261		}
   262	
   263		tmp_plane.plane_offset = (y << 16) | x;
   264		tmp_plane.plane_stride = stride;
   265		tmp_plane.plane_size = (src_h << 16) | src_w;
   266		tmp_plane.plane_aux_dist =
   267			(plane_state->aux.offset - plane_state->main.offset) |
   268			aux_stride;
   269		tmp_plane.plane_aux_offset =
   270			(plane_state->aux.y << 16) | plane_state->aux.x;
   271	
   272		/* program plane scaler */
   273		if (plane_state->scaler_id >= 0) {
   274			tmp_plane.flags |= PLANE_SCALER_BIT;
   275			tmp_plane.ps_ctrl = PS_SCALER_EN | PS_PLANE_SEL(plane->id) |
   276			  crtc_state->scaler_state.scalers[plane_state->scaler_id].mode;
   277			tmp_plane.ps_pwr_gate = 0;
   278			tmp_plane.ps_win_ps =
   279			  (plane_state->base.dst.x1 << 16) | plane_state->base.dst.y1;
   280			tmp_plane.ps_win_sz = ((crtc_w + 1) << 16) | (crtc_h + 1);
   281			tmp_plane.plane_pos = 0;
   282		} else {
   283			tmp_plane.plane_pos =
   284			  (plane_state->base.dst.y1 << 16) | plane_state->base.dst.x1;
   285		}
   286	
   287		tmp_plane.plane_ctl = plane_state->ctl;
   288	
   289		spin_lock(&dev_priv->shared_page_lock);
   290		for (i = 0; i < sizeof(struct pv_plane_update) / 4; i++)
   291			writel(*((u32 *)(&tmp_plane) + i), pv_plane + i);
   292		I915_WRITE_FW(PLANE_SURF(plane->pipe, plane->id),
   293		      intel_plane_ggtt_offset(plane_state) + plane_state->main.offset);
   294		spin_unlock(&dev_priv->shared_page_lock);
   295	}
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
