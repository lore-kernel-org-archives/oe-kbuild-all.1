Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF683B5848
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911898; cv=none; b=qfNUGCgSFnt+QPB6lOCiQwSpHrY4dUQpTDhS8ZBW/yUXBB4b32goBXXJFLuJQCBzj4llBq2nIEkCTL1tkCmGs03ngIsQPP0kykblQB1jO4A+Ib23mnQED+Rz3KDBNjBWkp+mn4CIAchDef0PrciyBV7W/4qmEm17x8UNYyhK+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911898; c=relaxed/simple;
	bh=lGM5GhX4mE0ZFupyBB4OVMkkLO2foYdj02MKCYY/GE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clWMp38Xuw+bQIghdKdAvZ9MmuZBktp8pXUbxUHp2RG2eBgWnhH3J6dfbaeK9wiA+GGR1y5QF7ClCLrv0xxYqOG3aqPOkDU54TvNMekklRqE6tNP71OtYKNpOL3fzxdjJ+4TOvax5Yq/SkxEQ02nSFFWemvYXgyCPURaQ17yFtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUbSsYik; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUbSsYik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773911893; x=1805447893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lGM5GhX4mE0ZFupyBB4OVMkkLO2foYdj02MKCYY/GE4=;
  b=AUbSsYiku+NapEyVSZdWSe1X2zuLHDXiXJ9prxoTwvwdkeyhoDySiZzC
   BclcZk9H3elgZEAnD19TZybV+byRhlPkVki/AfcTQLaTZj85QCOKVvo7O
   SgB3XSOrf0Ww01NxgVL0440bN7IqDDppa0JlJL9hcqIs5d88PRRIUJlga
   19uE155grDYTokZa1k+WeLhS5gnynrsiIxIX/RUtAG+NVFmzDNSkhOwn+
   EO79bGSrqakqLkz8zOQh0bdt7hFbHTcbzYlfKEIg6ZU71LwrYUzEmTpwk
   UGJtrDNqHBtfL/rD7KH2eEGcolDmSY1OA7qrLJu++5v97JULkF9kdzIzl
   w==;
X-CSE-ConnectionGUID: 6Sv/F9RqSSCz2R7mOPSaOg==
X-CSE-MsgGUID: tlHBhNIfQfWppQw2+UrKPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75054793"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="75054793"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 02:18:12 -0700
X-CSE-ConnectionGUID: f+V3en5iROySYauQOU5hVQ==
X-CSE-MsgGUID: qjfljHz7Q2+k0Dm4luExzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="219882047"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Mar 2026 02:18:09 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w39Vg-000000000eL-0kwl;
	Thu, 19 Mar 2026 09:17:52 +0000
Date: Thu, 19 Mar 2026 17:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, simona@ffwll.ch, siqueira@igalia.com,
	sunpeng.li@amd.com, tzimmermann@suse.de
Cc: oe-kbuild-all@lists.linux.dev, Alex Hung <alex.hung@amd.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Simon Ser <contact@emersion.fr>,
	Uma Shankar <uma.shankar@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>, amd-gfx@lists.freedesktop.org,
	kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/atomic: track individual colorop updates
Message-ID: <202603191755.nmfoAOS4-lkp@intel.com>
References: <20260318162348.299807-2-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318162348.299807-2-mwen@igalia.com>

Hi Melissa,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.0-rc4 next-20260318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-atomic-track-individual-colorop-updates/20260319-023607
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260318162348.299807-2-mwen%40igalia.com
patch subject: [PATCH 1/2] drm/atomic: track individual colorop updates
config: arc-randconfig-002-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191755.nmfoAOS4-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191755.nmfoAOS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191755.nmfoAOS4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/msm_atomic.c:7:
>> include/drm/drm_atomic_uapi.h:53:1: error: unknown type name 'bool'
      53 | bool drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
         | ^~~~
   include/drm/drm_atomic_uapi.h:1:1: note: 'bool' is defined in header '<stdbool.h>'; did you forget to '#include <stdbool.h>'?
     +++ |+#include <stdbool.h>
       1 | /*


vim +/bool +53 include/drm/drm_atomic_uapi.h

    41	
    42	int __must_check
    43	drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
    44				     const struct drm_display_mode *mode);
    45	int __must_check
    46	drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
    47					  struct drm_property_blob *blob);
    48	int __must_check
    49	drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
    50				      struct drm_crtc *crtc);
    51	void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
    52					 struct drm_framebuffer *fb);
  > 53	bool drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
    54					      struct drm_colorop *colorop);
    55	int __must_check
    56	drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
    57					  struct drm_crtc *crtc);
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
