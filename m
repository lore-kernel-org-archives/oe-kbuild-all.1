Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153F35958
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766576169; cv=none; b=jARw4q/oA0gV3TuxY7ckDuDBflClnHnmDof5cRhE3dAORT3pOIiZRNRIBpqH/1gr8++Qaf200b1RvlbFSZr6E95n17RCkfLlz3NhuFManRoQdFM2lWZ6y5Eb4V9866mzb+XKZml9FI+nb//g6KdDvafsp0ZA3wy35zklQUjsXls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766576169; c=relaxed/simple;
	bh=3cJ8CSDJ6YsJISngy4hJxzgVjxK4UrGIYJFs6NCw2co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkbU0XhME6372c2O3xxe60EhaPSj/gMgMcD6vn1/rRFIanpwn+Cwghb+tBoKupaIuDFaOapMLzavCIyOLPe3mrY5Gk+qzZhd4AMR9hFDYOUw25POdaJ8O9g+XwO2bzsiGYHzG3yswNdx1LMtn4BOvo0/5b36emDQ0fwTQuMYY6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZxh8B1p; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZxh8B1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766576168; x=1798112168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3cJ8CSDJ6YsJISngy4hJxzgVjxK4UrGIYJFs6NCw2co=;
  b=IZxh8B1pfqW1tIma/WpwWkl6dhxGDO/JZPmXrF59Fb0xTmsuUKHkmmep
   5jPl0FcnpV3YH9x7gg+dQqWfTNV69W4mqKjTNRpGGKSWECn/emeLOvfSV
   UIyje/b2cYoNzK2AR5OKKXfc0ahKXGcQbeENtwAl3ihjZEoQt1WtHxzk8
   rgEX85BXs49ypN1l/VX2qBZYNWJ1hvFiD7TABY+Yk5JuSTjzSY31Xjsq1
   OgoEYnJE4rRNRg8dBmZRzMjYOOS805hxqqJuEP4IHTHifepGyDOflgted
   NLN1DG7ORjZxvBzutPqLdn9FvSj5jHzg2EXbgegKPHKaxlolNqsv8vrnA
   w==;
X-CSE-ConnectionGUID: EaDj9/nkRryynbqOTV0Fbw==
X-CSE-MsgGUID: 8cTiF8YaSpWW9IuiJ/N0PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72276251"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="72276251"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 03:36:07 -0800
X-CSE-ConnectionGUID: itUoVfTYSw2b2lLfLxnDPg==
X-CSE-MsgGUID: DEtaOkUtQ/ODDRbVmlAtfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="200293696"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Dec 2025 03:36:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYN9v-0000000030Z-3ZoZ;
	Wed, 24 Dec 2025 11:36:03 +0000
Date: Wed, 24 Dec 2025 19:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Dionne-Riel <samuel@dionne-riel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm: panel-backlight-quirks: Add kernel parameters
 for quirks
Message-ID: <202512241948.BTEW3Ix8-lkp@intel.com>
References: <20251221200434.2735218-2-samuel@dionne-riel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221200434.2735218-2-samuel@dionne-riel.com>

Hi Samuel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Dionne-Riel/drm-panel-backlight-quirks-Add-kernel-parameters-for-quirks/20251222-040726
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251221200434.2735218-2-samuel%40dionne-riel.com
patch subject: [RFC PATCH] drm: panel-backlight-quirks: Add kernel parameters for quirks
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251224/202512241948.BTEW3Ix8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241948.BTEW3Ix8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241948.BTEW3Ix8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_panel_backlight_quirks.c: In function 'drm_get_panel_backlight_quirk':
>> drivers/gpu/drm/drm_panel_backlight_quirks.c:205:33: error: 'struct drm_panel_backlight_quirk' has no member named 'disable_custom_brightness_curve'
     205 |                 quirk_from_param.disable_custom_brightness_curve = param_disable_custom_brightness_curve;
         |                                 ^


vim +205 drivers/gpu/drm/drm_panel_backlight_quirks.c

   136	
   137	/**
   138	 * drm_get_panel_backlight_quirk - Get backlight quirks for a panel
   139	 * @edid: EDID of the panel to check
   140	 *
   141	 * This function checks for platform specific (e.g. DMI based) quirks
   142	 * providing info on the minimum backlight brightness for systems where this
   143	 * cannot be probed correctly from the hard-/firm-ware and other sources.
   144	 *
   145	 * Returns:
   146	 * a drm_panel_backlight_quirk struct if a quirk was found, otherwise an
   147	 * error pointer.
   148	 */
   149	const struct drm_panel_backlight_quirk *
   150	drm_get_panel_backlight_quirk(const struct drm_edid *edid)
   151	{
   152		const struct drm_get_panel_backlight_quirk *quirk = NULL;
   153		size_t i;
   154		bool parameters_given = false;
   155	
   156		if (param_min_brightness < U16_MAX)
   157			parameters_given = true;
   158	
   159		if (param_brightness_mask < U32_MAX)
   160			parameters_given = true;
   161	
   162		if (param_disable_custom_brightness_curve)
   163			parameters_given = true;
   164	
   165		if (IS_ENABLED(CONFIG_DMI) && edid) {
   166			for (i = 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
   167				quirk = &drm_panel_min_backlight_quirks[i];
   168	
   169				if (drm_panel_min_backlight_quirk_matches(quirk, edid))
   170					break;
   171			}
   172		}
   173	
   174		if (i == ARRAY_SIZE(drm_panel_min_backlight_quirks)) {
   175			// Found no quirk.
   176			quirk = NULL;
   177		}
   178	
   179		if (!parameters_given && !quirk) {
   180			if (!edid)
   181				return ERR_PTR(-EINVAL);
   182	
   183			return ERR_PTR(-ENODATA);
   184		}
   185	
   186		// We are returning from quirk_from_param only when parameters are given.
   187		// This assumes that the return value's data can be kept by the driver,
   188		// and that the driver supports more than one match at a time.
   189		// (Think multiple-display devices.)
   190		// When using a module parameter, only one set of values is supported.
   191		if (parameters_given) {
   192			// First copy the matched data, when found.
   193			if (quirk)
   194				memcpy(&quirk_from_param, &quirk->quirk, sizeof(quirk_from_param));
   195	
   196			// Apply module parameters to the found quirk.
   197			if (param_min_brightness < U16_MAX)
   198				quirk_from_param.min_brightness = param_min_brightness;
   199			if (param_brightness_mask < U32_MAX)
   200				quirk_from_param.brightness_mask = param_brightness_mask;
   201	
   202			// We force the disable_custom_brightness_curve value when any parameter is given.
   203			// This ensures users can override the quirk-defined value.
   204			// This comes at the cost of requiring any other value to be specified to work.
 > 205			quirk_from_param.disable_custom_brightness_curve = param_disable_custom_brightness_curve;
   206	
   207			return &quirk_from_param;
   208		}
   209	
   210		return &quirk->quirk;
   211	}
   212	EXPORT_SYMBOL(drm_get_panel_backlight_quirk);
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
