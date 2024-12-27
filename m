Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014BE1F2C45
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 18:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735322540; cv=none; b=mvbELQOWhsxz7j8S639vCmFdZjXC4LCLxPsipTBrHYwEEr/9xq/frTYnh/UJCOD1E9TS8KnFMhbXX4G/d1AOKvzhA4/z2kcSvBvicWk4r5Li7G9phk2d4sBmBeZxhsyNSLg5InXfm/iIai8x3fyMs+eJuuimkstuES6KIqQq+bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735322540; c=relaxed/simple;
	bh=daK/FcgpVbWyuo1yx0uC3VlrbI5XIgz7gIiY+tuyE4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JG+Id7Wpxl88Hy+i9ghJVWgRA4a1BRhTfrcuZzAxTrh34ewR6tO9ikolqsvKB7QxkVxVG55uAVmrfsbfLZy2g3yA8dZQGSNXLNV13XBLKeEl88i0xl96Y1RDB62bWRh5GbbeybN/AUeYzzmdYPQaIXka3wcIhc6LWuZMrhxSDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2z3ys1o; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2z3ys1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735322539; x=1766858539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=daK/FcgpVbWyuo1yx0uC3VlrbI5XIgz7gIiY+tuyE4c=;
  b=A2z3ys1onn4tvu+xmICfwInSGfhGE6kIy36iiBPrtFYjT/VpMWpQ9x3d
   dmU6f9uRb1ha961dmqes0sXU6qNkKXh/pcvrFb2AmzabJrkYXuEE55065
   CTPXql5Fxf6r7reh3MOW0vwyAWcpMuXuxCBuoLaE6kMM3W1Mj3T6MgBUp
   cNYQ51tH7gJ+lkBFyK8ywDu/Z2Zky+wJblpUAtnrt+Cffp1WMtVvvofGU
   H6lZF6BE562san0DdYqaZHdSNPUtA5CXhJ3RH+8gF0BY+1wJ7xXPQJJhG
   fsvfRAYvHX2OFC2GAiKI/5VZxl5cIMjE9Okj6TwWFj7xD6FQb5ylMc2ab
   g==;
X-CSE-ConnectionGUID: /vHWj1p2TrazQ/tNtg6Ubg==
X-CSE-MsgGUID: XvD86lsPTt6eqlahiSoJ5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35883252"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35883252"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 10:02:15 -0800
X-CSE-ConnectionGUID: TsJSyWSRTWGSFzA/mkcoug==
X-CSE-MsgGUID: RKBgGsWvRcOyNvqBmYToSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131182052"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2024 10:02:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tREf5-0003Q6-0x;
	Fri, 27 Dec 2024 18:02:11 +0000
Date: Sat, 28 Dec 2024 02:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3]
 drivers/gpu/drm/i915/display/intel_color.c:2820:6: warning: variable 'index'
 set but not used
Message-ID: <202412280207.sfxQ8fLf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: c12115088f707bd8090f94bb1bdc607afad810df [3/3] drm/i915/xelpd: Add support for Logarithmic gamma mode
config: i386-defconfig (https://download.01.org/0day-ci/archive/20241228/202412280207.sfxQ8fLf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280207.sfxQ8fLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280207.sfxQ8fLf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_color.c:28:
   In file included from drivers/gpu/drm/i915/display/intel_de.h:9:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:16:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_color.c:2820:6: warning: variable 'index' set but not used [-Wunused-but-set-variable]
    2820 |         u32 index = 0;
         |             ^
   2 warnings generated.


vim +/index +2820 drivers/gpu/drm/i915/display/intel_color.c

  2813	
  2814	static int icl_color_check(struct intel_crtc_state *crtc_state)
  2815	{
  2816		struct drm_device *dev = crtc_state->uapi.crtc->dev;
  2817		struct drm_i915_private *dev_priv = to_i915(dev);
  2818		struct drm_property *property = crtc_state->uapi.crtc->gamma_mode_property;
  2819		struct drm_property_enum *prop_enum;
> 2820		u32 index = 0;
  2821		int ret;
  2822	
  2823		ret = check_luts(crtc_state);
  2824		if (ret)
  2825			return ret;
  2826	
  2827		if (DISPLAY_VER(dev_priv) >= 13) {
  2828			list_for_each_entry(prop_enum, &property->enum_list, head) {
  2829				if (prop_enum->value == crtc_state->uapi.gamma_mode) {
  2830					if (!strcmp(prop_enum->name,
  2831						    "logarithmic gamma")) {
  2832						crtc_state->uapi.gamma_mode_type =
  2833							GAMMA_MODE_LOGARITHMIC_12BIT;
  2834						drm_dbg_kms(dev,
  2835							    "logarithmic gamma enabled\n");
  2836					}
  2837					break;
  2838				}
  2839				index++;
  2840			}
  2841		}
  2842	
  2843		crtc_state->gamma_mode = icl_gamma_mode(crtc_state);
  2844	
  2845		crtc_state->csc_mode = icl_csc_mode(crtc_state);
  2846	
  2847		intel_assign_luts(crtc_state);
  2848	
  2849		icl_assign_csc(crtc_state);
  2850	
  2851		crtc_state->preload_luts = intel_can_preload_luts(crtc_state);
  2852	
  2853		return 0;
  2854	}
  2855	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
