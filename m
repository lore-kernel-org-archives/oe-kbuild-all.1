Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD12DE6EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 19:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761594749; cv=none; b=ZgIuGonvA+Olob2Vq74HQIZwyX1nX3uz8oE2m2qnuC8QvclDR6qpSsp6ifU5owkYI4By1FK147d2RCI0guVam8UbVSLXQllw6ARfMaaBG7WxR6f3woulACWCd3K0NVGVIQtQu+XO4aV0YRvzQDam5OudZoZAOCwl167Ebq6Q34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761594749; c=relaxed/simple;
	bh=Fs4EGxVHvLWjFnZ5wv6psyxeI2TYN6+cHE3HTa23z5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRRxwAgKZxIojieJGB5LUJMHUw+qBwq6PFkW5uIBwKQN8wwEOycnlc8rmV1dEtg5ufV35HkYka+sQde809YJ/YTLr/VRCHzxhI2+H0MmfWR8rX/x75lEJNi7kEScGHXRvSPi04DPGw4RhVlrbWe3LNZgkFsBCdFeF79lF65T2eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fe2YVDvG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fe2YVDvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761594748; x=1793130748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Fs4EGxVHvLWjFnZ5wv6psyxeI2TYN6+cHE3HTa23z5s=;
  b=fe2YVDvGAHBjgovCNenYiSlXAU9CMBtysNwvtIgBgARS5j+QmyuF9ty0
   Jk20pG9iJZ7L1OC6PYONBzUyo6EhzSwZZsQTecJDKUBVut3QEXO4tJjA7
   R7+x5l0P5mAAoXAwgPzgGmxH4Yd5K2B0t/6XStjb6KVNdNuyJrCx5qLTq
   bxY3hJM0Ngca6P4mFvAIZ3iMDCvJr08LgoetUnUJXbOVVZ4N03s/5TPuJ
   nkoKghgPEFjn6aoU7T74LH7SFaOQFEzpF0FwOIWKTWNJYxAXzyWX9sH3W
   LbwL8dTJu1RmZu+mkSKHw6HaiQw/Kon29iwKAdZYhkuEFNK2MRPbmYDNp
   Q==;
X-CSE-ConnectionGUID: 4/ZaVS5xRdKCVTmrFCNQ2w==
X-CSE-MsgGUID: awaFZpViSaKgKleT4jAEVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63386888"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63386888"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 12:52:27 -0700
X-CSE-ConnectionGUID: mb9YMrZ+Qaa/VPaJawRyow==
X-CSE-MsgGUID: jIpiWLthSFyvluomxc772g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="189170404"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2025 12:52:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDTGQ-000IOr-1i;
	Mon, 27 Oct 2025 19:52:22 +0000
Date: Tue, 28 Oct 2025 03:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
	uma.shankar@intel.com, ville.syrjala@linux.intel.com
Subject: Re: [PATCH v8 22/22] drm/i915/vrr: Add function to check if DC
 Balance Possible
Message-ID: <202510280310.FHuwVpY6-lkp@intel.com>
References: <20251027162927.2655581-23-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027162927.2655581-23-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251027]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.18-rc3 v6.18-rc2 v6.18-rc1 linus/master v6.18-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-display-Add-source-param-for-dc-balance/20251028-011354
base:   next-20251027
patch link:    https://lore.kernel.org/r/20251027162927.2655581-23-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH v8 22/22] drm/i915/vrr: Add function to check if DC Balance Possible
config: i386-buildonly-randconfig-003-20251028 (https://download.01.org/0day-ci/archive/20251028/202510280310.FHuwVpY6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280310.FHuwVpY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280310.FHuwVpY6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_vrr.c: In function 'intel_vrr_compute_vrr_timings':
>> drivers/gpu/drm/i915/display/intel_vrr.c:259:31: warning: unused variable 'display' [-Wunused-variable]
     259 |         struct intel_display *display = to_intel_display(crtc_state);
         |                               ^~~~~~~


vim +/display +259 drivers/gpu/drm/i915/display/intel_vrr.c

e098418ea9f1ca Mitul Golani   2025-10-27  254  
58f9466c8292f8 Ankit Nautiyal 2025-03-11  255  static
8a553374db132e Ville Syrjälä  2025-10-20  256  void intel_vrr_compute_vrr_timings(struct intel_crtc_state *crtc_state,
8a553374db132e Ville Syrjälä  2025-10-20  257  				   int vmin, int vmax)
58f9466c8292f8 Ankit Nautiyal 2025-03-11  258  {
5de4c2be73f248 Mitul Golani   2025-10-27 @259  	struct intel_display *display = to_intel_display(crtc_state);
5de4c2be73f248 Mitul Golani   2025-10-27  260  
8a553374db132e Ville Syrjälä  2025-10-20  261  	crtc_state->vrr.vmax = vmax;
8a553374db132e Ville Syrjälä  2025-10-20  262  	crtc_state->vrr.vmin = vmin;
8a553374db132e Ville Syrjälä  2025-10-20  263  	crtc_state->vrr.flipline = crtc_state->vrr.vmin;
8a553374db132e Ville Syrjälä  2025-10-20  264  
58f9466c8292f8 Ankit Nautiyal 2025-03-11  265  	crtc_state->vrr.enable = true;
58f9466c8292f8 Ankit Nautiyal 2025-03-11  266  	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
5de4c2be73f248 Mitul Golani   2025-10-27  267  
e098418ea9f1ca Mitul Golani   2025-10-27  268  	if (intel_vrr_dc_balance_possible(crtc_state))
5de4c2be73f248 Mitul Golani   2025-10-27  269  		crtc_state->vrr.dc_balance.enable = true;
58f9466c8292f8 Ankit Nautiyal 2025-03-11  270  }
58f9466c8292f8 Ankit Nautiyal 2025-03-11  271  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
