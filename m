Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8BA26F476
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 21:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764623682; cv=none; b=sAHvLa9QVdTZ3A8/ZcBddF30jn+zxMkYTiNRW4JHhMRpHgyb8VoJif4kgC2cro7Cm/t1NNvb6EMPYJEP/svGITBvf17hXTi5OEhTGEsqxzEfpyVrr1tqwq4aZfkweSGG79qZJwxKkdi1VAtjM1Qm8bLDdimd4MWu0QKekBTXSa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764623682; c=relaxed/simple;
	bh=DgI5nZBC9CrkeMfWhsazGSNtif1KSJzf0qMxixC8vi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L50JSl02b0PkJQiOKcgsyzRKiX58wONNABm2jSOYBV6W4jK3E4rAO0o11ThKyly3fuXkOjt65nRXg2fmxSQYcRvNQWDvl+c9m09dyWQr3KadOuS7JiGLjsSxDkBSK+NW1yONZTFYSMZgnMxWpnabJqPeLwS6ku5FfWUn728V9ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qohmb0Oq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qohmb0Oq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764623680; x=1796159680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DgI5nZBC9CrkeMfWhsazGSNtif1KSJzf0qMxixC8vi0=;
  b=Qohmb0Oqcrbu0+mk0lwkTZD/b2Pr07ZyNWcO1p2dQz8efiCKWhbh6y6D
   y7/+QhBQSBsw16lMpDCPyCgm6Bb0h56rUngFFoNOd9sEs2A9yQvA2XWkU
   U3Fjf6777Iw5W+jUnHhLLNyeEoinlKaez8eiU3ENmiGdoqmk7gd34TmX9
   YNnU8TBVPN16NR1q6I0xW4WLV81jtzioTMr5d9srcUW0o6hXWeSZp+HZx
   pg7XX7FhgyZFFlfwIyCx2BD9pIbdlzDDr8T9DDZfdlxfzTMBf9Or9jGVZ
   zGZPCHyMfWEd/Kp9YPADKj4zG4BM6sGozv9bCZGeRRDGty/Q+8dhDDYkE
   w==;
X-CSE-ConnectionGUID: 3rRknyBpTaKIfYB1iu7+8w==
X-CSE-MsgGUID: FT9l+1S2R9SqGjV4Ue907Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65765989"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="65765989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 13:14:40 -0800
X-CSE-ConnectionGUID: uDcuw4pjTn6cVyw5fiIqfQ==
X-CSE-MsgGUID: DD81AVLZQxa8t1n/+wXGMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199110564"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2025 13:14:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQBE9-0000000099L-2uJa;
	Mon, 01 Dec 2025 21:14:33 +0000
Date: Tue, 2 Dec 2025 05:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, chaitanya.kumar.borah@intel.com,
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
	contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
	jadahl@redhat.com, sebastian.wick@redhat.com,
	swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
	suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v7 15/15] drm/i915/color: Enable Plane Color Pipelines
Message-ID: <202512020555.0E687sGd-lkp@intel.com>
References: <20251201064655.3579280-16-uma.shankar@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201064655.3579280-16-uma.shankar@intel.com>

Hi Uma,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251201]
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.18 v6.18-rc7 v6.18-rc6 linus/master v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
base:   next-20251201
patch link:    https://lore.kernel.org/r/20251201064655.3579280-16-uma.shankar%40intel.com
patch subject: [v7 15/15] drm/i915/color: Enable Plane Color Pipelines
config: i386-buildonly-randconfig-006-20251201 (https://download.01.org/0day-ci/archive/20251202/202512020555.0E687sGd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020555.0E687sGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020555.0E687sGd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/skl_universal_plane.c:19:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/skl_universal_plane.c: In function 'glk_plane_color_ctl':
>> drivers/gpu/drm/i915/display/skl_universal_plane.c:1288:21: error: implicit declaration of function 'drm_color_lut32_size'; did you mean 'drm_color_lut_size'? [-Wimplicit-function-declaration]
    1288 |                 if (drm_color_lut32_size(plane_state->hw.gamma_lut) != 32)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     drm_color_lut_size


vim +1288 drivers/gpu/drm/i915/display/skl_universal_plane.c

  1245	
  1246	static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
  1247	{
  1248		struct intel_display *display = to_intel_display(plane_state);
  1249		const struct drm_framebuffer *fb = plane_state->hw.fb;
  1250		struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
  1251		u32 plane_color_ctl = 0;
  1252	
  1253		plane_color_ctl |= PLANE_COLOR_PLANE_GAMMA_DISABLE;
  1254		plane_color_ctl |= glk_plane_color_ctl_alpha(plane_state);
  1255	
  1256		if (fb->format->is_yuv && !icl_is_hdr_plane(display, plane->id)) {
  1257			switch (plane_state->hw.color_encoding) {
  1258			case DRM_COLOR_YCBCR_BT709:
  1259				plane_color_ctl |= PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709;
  1260				break;
  1261			case DRM_COLOR_YCBCR_BT2020:
  1262				plane_color_ctl |=
  1263					PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020;
  1264				break;
  1265			default:
  1266				plane_color_ctl |=
  1267					PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601;
  1268			}
  1269			if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
  1270				plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
  1271		} else if (fb->format->is_yuv) {
  1272			plane_color_ctl |= PLANE_COLOR_INPUT_CSC_ENABLE;
  1273			if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
  1274				plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
  1275		}
  1276	
  1277		if (plane_state->force_black)
  1278			plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
  1279	
  1280		if (plane_state->hw.degamma_lut)
  1281			plane_color_ctl |= PLANE_COLOR_PRE_CSC_GAMMA_ENABLE;
  1282	
  1283		if (plane_state->hw.ctm)
  1284			plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
  1285	
  1286		if (plane_state->hw.gamma_lut) {
  1287			plane_color_ctl &= ~PLANE_COLOR_PLANE_GAMMA_DISABLE;
> 1288			if (drm_color_lut32_size(plane_state->hw.gamma_lut) != 32)
  1289				plane_color_ctl |= PLANE_COLOR_POST_CSC_GAMMA_MULTSEG_ENABLE;
  1290		}
  1291	
  1292		return plane_color_ctl;
  1293	}
  1294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
