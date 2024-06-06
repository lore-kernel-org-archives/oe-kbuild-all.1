Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D513DB92
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 22:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717713697; cv=none; b=kCD9c3htrhPRGLZ6QD/5WskZXTLDzns80h6M1+0tGcculyH6mL8tYb2s5/FH/8Wp7EOgWdFDdrVwKao81DquIc6zSljRtvYS1Z/MwbrMcx4/+j9jHDVqs31rK6ogpBqQuRohbtz7dgsRXPZocG3Zoe16KwrMPrTtoLRuUAxTpHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717713697; c=relaxed/simple;
	bh=XB9M0wgRyKTm2TjdDZvKaK/ZZ0rode3WezydrQ39Dfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JN5ppjIWybLH0vzwNWPHXmQdzloPMaSJL2QRcy6O2i4tcfSKI4zde/7iRN9TZwO0cF3GrQnDfz2/TaBN1jXbZauFdj+TeeBsOr/nPmk3r+bn0UbQB3ntzi++eDctO27Ji1K4ePWE0JBupaH4Rt9+rUmtCRaaNSEx9Y51JLKtilE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDNRHpB6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDNRHpB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717713696; x=1749249696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XB9M0wgRyKTm2TjdDZvKaK/ZZ0rode3WezydrQ39Dfk=;
  b=BDNRHpB606CQYQ/pJ5r0wD7icvBAo/6psAP0KCcfaS60V+iKZOO6iYu9
   Ym5tpl1T9GY1ogssF18ykUhDxaaTcyu+WJwnsGveUQ2TASPWNq86RFsLy
   Af7/AifBm1Kxebh2n2Mtp47igSSkFIuD/6aTlc78pJ/w8+yIQVPrfpEko
   llAcgB+JqJHiQ/Kj4+bcfpojlQtyNIedst1SJN1tYdray0ycaMSO+NXpA
   Mz7MMtiIa3Tbt6O6+a2zvcbRBzkLR+C8JivdumQ0tuoVnCufCQF3VQObM
   5/+i071W5bbpy6dmFMYwEhop+hP8TUlBKw6EG5+/qUh5xhIksMFfHm8SR
   g==;
X-CSE-ConnectionGUID: Yuu3jL3STJGB2dn0eKlNiA==
X-CSE-MsgGUID: lxDfMAtjTUGifju3JcL3Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14597923"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14597923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 15:41:35 -0700
X-CSE-ConnectionGUID: VVzLXt+/R4WYyr0dqCVgGA==
X-CSE-MsgGUID: VH65b2x3SnqKdaqJk4at+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="68913325"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Jun 2024 15:41:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFLnW-0003oO-2t;
	Thu, 06 Jun 2024 22:41:30 +0000
Date: Fri, 7 Jun 2024 06:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, animesh.manna@intel.com,
	arun.r.murthy@intel.com, jouni.hogander@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/psr: Implment WA to help reach PC10
Message-ID: <202406070642.9SbQep4F-lkp@intel.com>
References: <20240606082926.1816416-4-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606082926.1816416-4-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.10-rc2 next-20240606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-i915-psr-Add-return-bool-value-for-hsw_activate_psr1/20240606-163351
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240606082926.1816416-4-suraj.kandpal%40intel.com
patch subject: [PATCH 2/2] drm/i915/psr: Implment WA to help reach PC10
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240607/202406070642.9SbQep4F-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070642.9SbQep4F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070642.9SbQep4F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_psr.c:35:
   drivers/gpu/drm/i915/display/intel_psr.c: In function 'intel_psr_check_delayed_vblank_limit':
   drivers/gpu/drm/i915/i915_reg.h:4158:62: error: 'dev_priv' undeclared (first use in this function); did you mean 'dev_crit'?
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^~~~~~~~
   drivers/gpu/drm/i915/display/intel_de.h:31:69: note: in definition of macro 'intel_de_read'
      31 | #define intel_de_read(p,...) __intel_de_read(__to_intel_display(p), __VA_ARGS__)
         |                                                                     ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_reg_defs.h:42:49: note: in expansion of macro '_MMIO'
      42 | #define _MMIO_TRANS2(display, tran, reg)        _MMIO(DISPLAY_INFO(display)->trans_offsets[(tran)] - \
         |                                                 ^~~~~
   drivers/gpu/drm/i915/display/intel_display_device.h:185:42: note: in expansion of macro '__to_intel_display'
     185 | #define DISPLAY_INFO(i915)              (__to_intel_display(i915)->info.__device_info)
         |                                          ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_reg_defs.h:42:55: note: in expansion of macro 'DISPLAY_INFO'
      42 | #define _MMIO_TRANS2(display, tran, reg)        _MMIO(DISPLAY_INFO(display)->trans_offsets[(tran)] - \
         |                                                       ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_reg.h:4158:49: note: in expansion of macro '_MMIO_TRANS2'
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                 ^~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_psr.c:817:36: note: in expansion of macro 'TRANS_SET_CONTEXT_LATENCY'
     817 |         return intel_de_read(i915, TRANS_SET_CONTEXT_LATENCY(cpu_transcoder)) >= 6;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_reg.h:4158:62: note: each undeclared identifier is reported only once for each function it appears in
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^~~~~~~~
   drivers/gpu/drm/i915/display/intel_de.h:31:69: note: in definition of macro 'intel_de_read'
      31 | #define intel_de_read(p,...) __intel_de_read(__to_intel_display(p), __VA_ARGS__)
         |                                                                     ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_reg_defs.h:42:49: note: in expansion of macro '_MMIO'
      42 | #define _MMIO_TRANS2(display, tran, reg)        _MMIO(DISPLAY_INFO(display)->trans_offsets[(tran)] - \
         |                                                 ^~~~~
   drivers/gpu/drm/i915/display/intel_display_device.h:185:42: note: in expansion of macro '__to_intel_display'
     185 | #define DISPLAY_INFO(i915)              (__to_intel_display(i915)->info.__device_info)
         |                                          ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_reg_defs.h:42:55: note: in expansion of macro 'DISPLAY_INFO'
      42 | #define _MMIO_TRANS2(display, tran, reg)        _MMIO(DISPLAY_INFO(display)->trans_offsets[(tran)] - \
         |                                                       ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_reg.h:4158:49: note: in expansion of macro '_MMIO_TRANS2'
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                 ^~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_psr.c:817:36: note: in expansion of macro 'TRANS_SET_CONTEXT_LATENCY'
     817 |         return intel_de_read(i915, TRANS_SET_CONTEXT_LATENCY(cpu_transcoder)) >= 6;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_psr.c:815:66: warning: parameter 'cpu_transcoder' set but not used [-Wunused-but-set-parameter]
     815 |                                                  enum transcoder cpu_transcoder)
         |                                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_psr.c: In function 'intel_psr_is_dpkgc_configured':
   drivers/gpu/drm/i915/display/intel_psr.c:822:36: error: 'LNL_PKG_C_LATENCY' undeclared (first use in this function)
     822 |         return intel_de_read(i915, LNL_PKG_C_LATENCY) == U32_MAX;
         |                                    ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_de.h:31:69: note: in definition of macro 'intel_de_read'
      31 | #define intel_de_read(p,...) __intel_de_read(__to_intel_display(p), __VA_ARGS__)
         |                                                                     ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_psr.c: In function 'intel_psr_is_dc5_entry_possible':
   drivers/gpu/drm/i915/display/intel_psr.c:835:26: error: 'struct drm_crtc' has no member named 'active'
     835 |                 if (!crtc->active)
         |                          ^~
   drivers/gpu/drm/i915/display/intel_psr.c:842:69: error: '_encoder' undeclared (first use in this function); did you mean 'encoder'?
     842 |                         struct intel_dp *intel_dp = enc_to_intel_dp(_encoder);
         |                                                                     ^~~~~~~~
         |                                                                     encoder
   drivers/gpu/drm/i915/display/intel_psr.c: In function 'wa_16023497226_check':
   drivers/gpu/drm/i915/display/intel_psr.c:861:13: error: implicit declaration of function 'is_dpkg_c_configured' [-Werror=implicit-function-declaration]
     861 |         if (is_dpkg_c_configured(i915)) {
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_psr.c:866:35: error: implicit declaration of function 'is_dc5_entry_possible'; did you mean 'intel_psr_is_dc5_entry_possible'? [-Werror=implicit-function-declaration]
     866 |                 else if (!psr1 && is_dc5_entry_possible(i915))
         |                                   ^~~~~~~~~~~~~~~~~~~~~
         |                                   intel_psr_is_dc5_entry_possible
   drivers/gpu/drm/i915/display/intel_psr.c: In function 'intel_psr_check_delayed_vblank_limit':
   drivers/gpu/drm/i915/display/intel_psr.c:818:1: warning: control reaches end of non-void function [-Wreturn-type]
     818 | }
         | ^
   drivers/gpu/drm/i915/display/intel_psr.c: At top level:
>> drivers/gpu/drm/i915/display/intel_psr.c:820:13: warning: 'intel_psr_is_dpkgc_configured' defined but not used [-Wunused-function]
     820 | static bool intel_psr_is_dpkgc_configured(struct drm_i915_private *i915)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/intel_psr_is_dpkgc_configured +820 drivers/gpu/drm/i915/display/intel_psr.c

   819	
 > 820	static bool intel_psr_is_dpkgc_configured(struct drm_i915_private *i915)
   821	{
   822		return intel_de_read(i915, LNL_PKG_C_LATENCY) == U32_MAX;
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
