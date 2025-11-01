Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D081922F5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 01:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761959183; cv=none; b=YZg02HugiVjmsIB7dRT9RBPODLCTlK/awnASWzdCPK4cznrRapdge093pLnrb8J0bhetrh8mff4SE8634SqHK0CtCMg9Q1fzuHcPZo2EGlI7Jvtc4sMcxtS+nrJhebNqapIEN1qWVdmsEQqKqeJ70LMIPfM8fHAxcvzRe+4xW0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761959183; c=relaxed/simple;
	bh=qbDcVQmBw7W4/baBODucnA0isMkDnlPY0e6magXcTiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WT4nva/7+Ao6z/FQadphftX4i4SpcSq4KuilqFmT1/9PSnUNt+g0PXolzyDJCX1C1uta1cQfBO8+5ZlleD7ZxdjxgznXbYl+jpWcTwnJL//7P0DWsqbPDjd/PPjqDIXQZljV/nYJDhuWMEtFOOVuqUV3HljVIeRZZZ4TqLGU4Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdC3m3Rk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdC3m3Rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761959182; x=1793495182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qbDcVQmBw7W4/baBODucnA0isMkDnlPY0e6magXcTiU=;
  b=WdC3m3RkkeBmBQD55KygfEylAImuZvuyn2w0Rzj8VSZ4JNGUBvQ+TzeA
   F9piOb3k13jB0tB0OzstJA7FulI9NmjEWvQpN7VAWAJg44+ROkihrFRBD
   clH7V7xAA3LKH3rjPJLWsn7rwADJdfjlQDVctAHxd3z92u7+D9jtkW36n
   Llm3xdSsdtsDGaUZWABwyZCmbMQkVlOdByrLiMGv4/cvBOdqPyIv0GJjn
   Z2OvxX+w1ENjFhXBr4a/7iihC46NnBGhOPz62ldBZ0MBcyUGTy4JxmzyY
   GpLpnUjZTZKEcE86sHQdTkhfzzloGTJioy7jGyR77AQ/3PHbyHf3P8W65
   w==;
X-CSE-ConnectionGUID: yq9jvhrmT6G/vTD9N9aqfw==
X-CSE-MsgGUID: Uftyi56IRzqM8ZE5wOcaIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575928"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="75575928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 18:06:21 -0700
X-CSE-ConnectionGUID: Ppo9VfFdQYusMhwJ6EdM4w==
X-CSE-MsgGUID: gyd+mZGZSHGIFO0vShtCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="190713103"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2025 18:06:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF03p-000NmG-0a;
	Sat, 01 Nov 2025 01:05:54 +0000
Date: Sat, 1 Nov 2025 09:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
	zack.rusin@broadcom.com, maaz.mombasawala@broadcom.com,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH v2] drm/vmwgfx: Restore Guest-Backed only cursor plane
 support
Message-ID: <202511010812.B8o5v9vq-lkp@intel.com>
References: <20251030143910.134767-1-ian.forbes@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030143910.134767-1-ian.forbes@broadcom.com>

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Forbes/drm-vmwgfx-Restore-Guest-Backed-only-cursor-plane-support/20251030-224831
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20251030143910.134767-1-ian.forbes%40broadcom.com
patch subject: [PATCH v2] drm/vmwgfx: Restore Guest-Backed only cursor plane support
config: arm64-randconfig-001-20251101 (https://download.01.org/0day-ci/archive/20251101/202511010812.B8o5v9vq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010812.B8o5v9vq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010812.B8o5v9vq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c: In function 'vmw_cursor_plane_atomic_update':
>> drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c:770:3: error: a label can only be part of a statement and a declaration is not a statement
      struct vmw_bo *bo = vmw_user_object_buffer(&vps->uo);
      ^~~~~~


vim +770 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c

   739	
   740	void
   741	vmw_cursor_plane_atomic_update(struct drm_plane *plane,
   742				       struct drm_atomic_state *state)
   743	{
   744		struct drm_plane_state *new_state =
   745			drm_atomic_get_new_plane_state(state, plane);
   746		struct drm_plane_state *old_state =
   747			drm_atomic_get_old_plane_state(state, plane);
   748		struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
   749		struct vmw_private *dev_priv = vmw_priv(plane->dev);
   750		struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
   751		struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
   752		s32 hotspot_x, hotspot_y, cursor_x, cursor_y;
   753	
   754		/*
   755		 * Hide the cursor if the new bo is null
   756		 */
   757		if (vmw_user_object_is_null(&vps->uo)) {
   758			vmw_cursor_update_position(dev_priv, false, 0, 0);
   759			return;
   760		}
   761	
   762		switch (vps->cursor.update_type) {
   763		case VMW_CURSOR_UPDATE_LEGACY:
   764			vmw_cursor_plane_update_legacy(dev_priv, vps);
   765			break;
   766		case VMW_CURSOR_UPDATE_MOB:
   767			vmw_cursor_update_mob(dev_priv, vps);
   768			break;
   769		case VMW_CURSOR_UPDATE_GB_ONLY:
 > 770			struct vmw_bo *bo = vmw_user_object_buffer(&vps->uo);
   771	
   772			if (bo)
   773				vmw_send_define_cursor_cmd(dev_priv, bo->map.virtual,
   774							   vps->base.crtc_w,
   775							   vps->base.crtc_h,
   776							   vps->base.hotspot_x,
   777							   vps->base.hotspot_y);
   778			break;
   779		case VMW_CURSOR_UPDATE_NONE:
   780			/* do nothing */
   781			break;
   782		}
   783	
   784		/*
   785		 * For all update types update the cursor position
   786		 */
   787		cursor_x = new_state->crtc_x + du->set_gui_x;
   788		cursor_y = new_state->crtc_y + du->set_gui_y;
   789	
   790		hotspot_x = vps->cursor.legacy.hotspot_x + new_state->hotspot_x;
   791		hotspot_y = vps->cursor.legacy.hotspot_y + new_state->hotspot_y;
   792	
   793		vmw_cursor_update_position(dev_priv, true, cursor_x + hotspot_x,
   794					   cursor_y + hotspot_y);
   795	}
   796	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
