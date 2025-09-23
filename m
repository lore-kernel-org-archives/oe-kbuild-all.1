Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BE63218DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758626951; cv=none; b=BWfQ54TmAKTnF9VcLhS3BkMb0b778d1tg4YH0KRaXku8XWYEjF5IXuyWuTnEbR3gFeVNn0pmt5CvNLkxOWcDBo2w2CgJCNpV8xhrQ1FqeptspswAvWdSov1nk++KHj1Cs24HwKuRhzEZ5y+U3JrZXeff4xTQ3WQRAqimbMawTHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758626951; c=relaxed/simple;
	bh=wH39xMFI1r9Xd6xLv/yPq9PmpHUFyQ/pmBoF+80xBfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eha7Q87mLmDNyJ8xpkeZDS/TuT/ghN75m0e0YwdzoI0ice84OpPY+F5fRVbz/2mEn5APiEKvPzLstQ9ybFjcmWsSYXnpALdL52eyzJL77CwuQJu7lhLBwPlV4v/L2DibO9X4pXV+4uY0Bl9DAIH3mcypk3ZsD2V0wrJoEs7+99A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JoLdZuy/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JoLdZuy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758626949; x=1790162949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wH39xMFI1r9Xd6xLv/yPq9PmpHUFyQ/pmBoF+80xBfA=;
  b=JoLdZuy/61qfUUSVAjRYTmCh3cRuX2zVOBJtaTp4wWrp1KC1vkII82JF
   bDJgAiGiNQdN3ux3F18IIbJLc+jCzkCZ1qfdM/8nBfEZjt38QJmOKeolQ
   ndZj2lzr49CrSvNU/dav7Sy28Iv7mq6xJIRowZxP9cy1+qQbeggIotcZs
   Rmh8jSwK1c6Aezrha7yxIaGtz2OVOM6RlzNQYJttLZT2h94RAsgxJ7W9O
   +GGTOtZnw1PuncrFqN6a3wLSz1ccouWbZtjH+JsObqphlFYL5a8Htpauj
   56oaewiWdnsUXb8Dyau88ytgPlYu4yqBxdXuxsvKYxgxX/cFh3rebKxDA
   w==;
X-CSE-ConnectionGUID: o2C07lsiQ7CkAZuKRpcGVw==
X-CSE-MsgGUID: O3yYkakkTwaTaRDmCT1Qlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60828424"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="60828424"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:29:09 -0700
X-CSE-ConnectionGUID: KkCT7djgTYemXWyWsYWssg==
X-CSE-MsgGUID: 6t2ILPVFRC+HxuDG9FPnjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="177120766"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 23 Sep 2025 04:29:08 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v11Cj-00000000497-2qXz;
	Tue, 23 Sep 2025 11:29:05 +0000
Date: Tue, 23 Sep 2025 13:29:01 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 24/24] htmldocs:
 ./include/uapi/drm/drm_mode.h:1192: warning: Function parameter or struct
 member 'flags' not described in 'drm_color_lut_range'
Message-ID: <202509231344.f5Kk3oG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   a390416d0d0f981d5b15a7358987dd2bcace14f7
commit: 8ff2c61362e0ecb51582330b5250bfde4820fb5a [24/24] FROMLIST: drm: Add Color lut range attributes
reproduce: (https://download.01.org/0day-ci/archive/20250923/202509231344.f5Kk3oG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231344.f5Kk3oG9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./drivers/gpu/drm/drm_writeback.c:249: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead
   ./drivers/gpu/drm/drm_writeback.c:249: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead
   ./include/drm/drm_bridge.h:861: warning: Excess struct member 'support_hdcp' description in 'drm_bridge'
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h
>> ./include/uapi/drm/drm_mode.h:1192: warning: Function parameter or struct member 'flags' not described in 'drm_color_lut_range'
>> ./include/uapi/drm/drm_mode.h:1192: warning: Function parameter or struct member 'count' not described in 'drm_color_lut_range'
>> ./include/uapi/drm/drm_mode.h:1192: warning: Function parameter or struct member 'start' not described in 'drm_color_lut_range'
>> ./include/uapi/drm/drm_mode.h:1192: warning: Function parameter or struct member 'end' not described in 'drm_color_lut_range'
>> ./include/uapi/drm/drm_mode.h:1192: warning: Function parameter or struct member 'norm_factor' not described in 'drm_color_lut_range'
>> ./include/uapi/drm/drm_mode.h:1192: warning: Function parameter or struct member 'precision' not described in 'drm_color_lut_range'
   ./drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_disable_interrupts' not found
   ./drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_enable_interrupts' not found
   Error: Cannot open file ./include/linux/host1x.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h


vim +1192 ./include/uapi/drm/drm_mode.h

  1165	
  1166	/**
  1167	 * struct drm_color_lut_range
  1168	 *
  1169	 * structure to advertise capability of a color hardware
  1170	 * block that accepts LUT values.  It can represent LUTs with
  1171	 * varied number of entries and distributions
  1172	 * (Multi segmented, Logarithmic etc).
  1173	 */
  1174	
  1175	struct drm_color_lut_range {
  1176		/* DRM_COLOROP_1D_LUT_MULTSEG_* */
  1177		__u32 flags;
  1178		/* number of points on the curve in the segment */
  1179		__u16 count;
  1180		/* input start/end values of the segment */
  1181		__s32 start, end;
  1182		/* normalization factor. Represents 1.0 in terms of smallest step size */
  1183		__u32 norm_factor;
  1184	
  1185		/* precision of HW LUT*/
  1186		struct {
  1187			/* Integer precision */
  1188			__u16 intp;
  1189			/* Fractional precision */
  1190			__u16 fracp;
  1191		} precision;
> 1192	};
  1193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
