Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE94250BE5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285065; cv=none; b=kpq+mPuyL1qYdB0D0bj8Hp/JhU7e+SSHeIgj4SgsZkAqVwI1laWcuIih6ZRvwm8PSl4uwY/LIunozQ8BwLwghWGA2SBrbZREAMJQnoQeGr9N/P6ujCqg0iGvyNiipGZ5uKeb0cjCAJG+nYAsklH2boBw/Xvu58VCoH/JQ7JC9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285065; c=relaxed/simple;
	bh=IXrH6MNemUfS1KcxQ8k3VWqfWEmrEzCkiviTNWp5+Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTET5rVXK853yP4c0apKX6J2ziYDAL5iWCU77ld6fu4OioD7AoWPHmnyY/8oBRQewDC2nIGLyWPC+8TSy3MfX7P4ZsKXnld/T6G37Bx7xjCtnXTLFTolfF3/1CXO56nAW0gaMtTN/s3/wzz2DdeYU8Qvq4gAoal56ajLK4+fHRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S59MQLET; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S59MQLET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739285064; x=1770821064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IXrH6MNemUfS1KcxQ8k3VWqfWEmrEzCkiviTNWp5+Dc=;
  b=S59MQLETY1PI5woNF5IU086HdaV96YvHxj03js8ZcjYosnWQawdtdjER
   2Ob9XhlzGFzG7hhVjQa5efucRQL1bOmqsKYSkldO8QJwO+dBsjWm7vIx0
   d59nv4aXXDG1Kzyw9W4AaFhgMjx7ZuaRp7co8MkXnZjievGO8qLq8k3iO
   xCGAmnoDaaqKT8pZPGb5j0s0zrJmsREIbQeSs5QQewKI6BmLXKOsYVJgB
   99LHvHU192W+TVahBFwAKhC4he/JNV1L6Z2Qrb7tO17yKRWAd6HXezub7
   hnB3CvLC1IguLCNf4q5xFX/sNQjg52Umv3MRJkRLxp7kd9+S97xslX1Gp
   g==;
X-CSE-ConnectionGUID: whVCT5iATn6QLWrOMFXlxw==
X-CSE-MsgGUID: /kQWC/WLRMOz0nCJei3G8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39821906"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39821906"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:44:23 -0800
X-CSE-ConnectionGUID: cHfcQwYkRHGxn6zBpOq9XA==
X-CSE-MsgGUID: jzKVQkzGR72nxWqE4KDpnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116608104"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2025 06:44:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thrUp-0014J5-0r;
	Tue, 11 Feb 2025 14:44:19 +0000
Date: Tue, 11 Feb 2025 22:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Subject: [drm-i915:for-linux-next 6/12]
 drivers/gpu/drm/i915/display/intel_display_power.h:228:43: error: passing
 argument 1 of 'intel_display_power_put_unchecked' from incompatible pointer
 type
Message-ID: <202502112213.z4v8d8po-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/i915/kernel for-linux-next
head:   73a0d4b3672db15f5c8d4dac7c58a993b026ec7b
commit: 5dcfda5cfa42616ca84c41aa090e17e7417a0f68 [6/12] drm/i915: Convert intel_display_power_{get,put}*() to intel_display
config: i386-buildonly-randconfig-001-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112213.z4v8d8po-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112213.z4v8d8po-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112213.z4v8d8po-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23,
                    from drivers/gpu/drm/xe/xe_device_types.h:31,
                    from drivers/gpu/drm/xe/xe_device.h:11,
                    from drivers/gpu/drm/xe/xe_hwmon.c:14:
   drivers/gpu/drm/i915/display/intel_display_power.h: In function 'intel_display_power_put':
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:43: error: passing argument 1 of 'intel_display_power_put_unchecked' from incompatible pointer type [-Werror=incompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
         |                                           |
         |                                           struct intel_display *
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: expected 'struct xe_device *' but argument is of type 'struct intel_display *'
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23,
                    from drivers/gpu/drm/xe/xe_device_types.h:31,
                    from drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:10,
                    from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:16,
                    from drivers/gpu/drm/i915/display/intel_display_power.c:8:
   drivers/gpu/drm/i915/display/intel_display_power.h: In function 'intel_display_power_put':
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:43: error: passing argument 1 of 'intel_display_power_put_unchecked' from incompatible pointer type [-Werror=incompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
         |                                           |
         |                                           struct intel_display *
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: expected 'struct xe_device *' but argument is of type 'struct intel_display *'
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.c: At top level:
>> drivers/gpu/drm/i915/display/intel_display_power.c:846:6: error: conflicting types for 'intel_display_power_put_unchecked'; have 'void(struct intel_display *, enum intel_display_power_domain)'
     846 | void intel_display_power_put_unchecked(struct intel_display *display,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:6: note: previous declaration of 'intel_display_power_put_unchecked' with type 'void(struct xe_device *, enum intel_display_power_domain)'
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/intel_display_power_put_unchecked +228 drivers/gpu/drm/i915/display/intel_display_power.h

   210	
   211	static inline void
   212	intel_display_power_put_async_delay(struct intel_display *display,
   213					    enum intel_display_power_domain domain,
   214					    intel_wakeref_t wakeref,
   215					    int delay_ms)
   216	{
   217		__intel_display_power_put_async(display, domain, wakeref, delay_ms);
   218	}
   219	#else
   220	void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
   221					       enum intel_display_power_domain domain);
   222	
   223	static inline void
   224	intel_display_power_put(struct intel_display *display,
   225				enum intel_display_power_domain domain,
   226				intel_wakeref_t wakeref)
   227	{
 > 228		intel_display_power_put_unchecked(display, domain);
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
