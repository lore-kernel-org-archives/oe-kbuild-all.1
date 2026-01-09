Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD692D8377
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 04:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933264; cv=none; b=Ps2Jcf5fy1/5jkq3ZGyDevdsfZCq9mGQ3mv7BE+tYCAnhptsK14xG0rvvDoGotItPIX0i8HVmjvMwmH4i54ZivndwQYuTGIZv0RigH3g3fjuAsL5ua+SKiuIst9EsKlLEs/kEdnwisYFMPmNBZiHbA6DNVKtPx7zwP3FoUreQFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933264; c=relaxed/simple;
	bh=+zW1zbZZxQI3Z2tDepIcZKsanKsHgJKnKT3HoxHwtyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nbJ5aJrJ4Mxihwhy2Q9ltcYy5Rx3/8q1gYmvZ2hAtmZCgOHZ+g5eZi73Ayo9rnm+OBImbtvly3QQm8eVnJ0npaGpHow5QRATQLoMm8CU5ga93kXqBgZnm5FaSzgJwgGa6RBBR53aBkTW6N/dzwS+Mco/mvrjTEUUzHvE0Tdhptk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmfItDEN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmfItDEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767933261; x=1799469261;
  h=date:from:to:cc:subject:message-id;
  bh=+zW1zbZZxQI3Z2tDepIcZKsanKsHgJKnKT3HoxHwtyY=;
  b=XmfItDENbhMmi5c7OWFLn8/Qroqt0Y2rH0ed5h+JISy0efkvMih3fjQY
   Of2iLvTtpMQ+s1oKafT1OCSbCnEAVLINPvWCMS0UQZVSW+paZK+k7ybx2
   ZGVD+TWEM4xJ2DUr8FRlDYtf5CswqL/xiG2TGIbABeFWY/glEancLUk2g
   VtLjTdXa/z29FSEYXGhhnTXINtwalS7vpbTL+0bQhV7/j/TQt64Hr9gFL
   IWHVqS308FsULBO+l8Sbt+EY5NnNq2+PRs1GR5I1WdI6JwrpWnU/BOchj
   Jc8bwKnTbR6UFCgggWpgH5nvdUX6UtiZMiLDN0FNkeetLsic4t9V/sc+4
   g==;
X-CSE-ConnectionGUID: DV7J+fZxQfel94dNiGZlZw==
X-CSE-MsgGUID: Ma334sioRfSZlktG2GrGdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69298860"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69298860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 20:34:20 -0800
X-CSE-ConnectionGUID: 9mBE5Y4SQwaZdt//ms0W8Q==
X-CSE-MsgGUID: lnVVsKGIS8+JxM2R/qEl/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203408379"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2026 20:34:19 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve4CW-000000001ya-0wLN;
	Fri, 09 Jan 2026 04:34:16 +0000
Date: Fri, 09 Jan 2026 05:34:09 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] htmldocs:
 ./include/uapi/drm/drm_mode.h:1192: warning: Function parameter or struct
 member 'flags' not described in 'drm_color_lut_range'
Message-ID: <202601090541.o6ADDAqt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Uma,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   343ae88aa8b1ab4bc0df083d2d5c8c58d3b560d2
commit: 8ff2c61362e0ecb51582330b5250bfde4820fb5a [1/1] FROMLIST: drm: Add Color lut range attributes
reproduce: (https://download.01.org/0day-ci/archive/20260109/202601090541.o6ADDAqt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090541.o6ADDAqt-lkp@intel.com/

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
