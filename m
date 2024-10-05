Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CB1139B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 00:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728087652; cv=none; b=jr9bVMc4GmvZgNPAeFmYUBa8r7M/W9KYKOfFIXptmgfSNhGcuFAJGzNNk67ALWQaFS5DLp06+aR8K42m3mn797q+Sr/TEZGNcUcsCQm14oUwjXIJXkvJlPE6X2hMH1jynTuxNKOTxM4rBLjQKI+M320v7urRbDWwmyVu4ZRr0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728087652; c=relaxed/simple;
	bh=S1gqrePsiGPVWs/qXReG4B7NMlMBTe3cwP3ZHwYZFHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HV1sYm0qWkzfn9NcjXdcucqdXSwGahXJBoj9lJRD26w7uyL+0usPY6hy9UFR5xyvgEi7S7KHT5EeVBoew5IU4lRWLrIB0FI6ovugreM9MT4YKy6G4P6XrTP7ZD2fMgthE+8Bvjz660vWDSZGuTMxMAK8ueorzNM8dWdY0KBpzgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkk3H7gR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkk3H7gR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728087651; x=1759623651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S1gqrePsiGPVWs/qXReG4B7NMlMBTe3cwP3ZHwYZFHk=;
  b=gkk3H7gRf7NjHBnxSAWEa0irfiCelI8oo7H5bsA4OUWhgFYB4f92e4Cb
   e/wDdKy4AUSGo22+MxZXmiEAz3xY/nYM2zSI99x0A2enBvFOTu0jtAnD1
   g5CIOAvM4gJ0E5JklZ+IcxT0U0yCAOV8IIist36VWtO9g3YVhAy9yF0Mu
   jJrpI3R+XSvWvjgPsZvkVw1azV+wxmdnQjmFo8FPHanhjz7znIFCGMw5H
   7gQko+jJHq75BGQIkF/O4R2jhXS82ds0Y3PYXuLonJfPxWM9X1WeTtowo
   7pNgq4eWS/xGSnq8Clq3u3qq5HKiILsWWJR0/3CeVwh961Pjwi4iTfKRx
   g==;
X-CSE-ConnectionGUID: SzCQOUxeRAS96fN1mzQDQw==
X-CSE-MsgGUID: rcjh56mvSr2eaCPPSNrkUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="14944337"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="14944337"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 17:20:49 -0700
X-CSE-ConnectionGUID: 1uJDoom6RzKocxLhlpQL9Q==
X-CSE-MsgGUID: HqzTRn8fTraWi5RczqsQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="74692676"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Oct 2024 17:20:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swsXM-0002Mc-1G;
	Sat, 05 Oct 2024 00:20:44 +0000
Date: Sat, 5 Oct 2024 08:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/client: Constify modes
Message-ID: <202410050841.RWs2VIP5-lkp@intel.com>
References: <20241003113304.11700-2-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003113304.11700-2-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20241004]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm/drm-next drm-exynos/exynos-drm-next linus/master v6.12-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-client-Constify-modes/20241004-061843
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241003113304.11700-2-ville.syrjala%40linux.intel.com
patch subject: [PATCH 1/8] drm/client: Constify modes
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410050841.RWs2VIP5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050841.RWs2VIP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050841.RWs2VIP5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_client_modeset.c:1266:
   drivers/gpu/drm/tests/drm_client_modeset_test.c: In function 'drm_test_pick_cmdline_res_1920_1080_60':
>> drivers/gpu/drm/tests/drm_client_modeset_test.c:108:14: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     108 |         mode = drm_connector_pick_cmdline_mode(connector);
         |              ^


vim +/const +108 drivers/gpu/drm/tests/drm_client_modeset_test.c

8fc0380f6ba7e9 Maxime Ripard 2022-11-14   84  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   85  static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   86  {
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   87  	struct drm_client_modeset_test_priv *priv = test->priv;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   88  	struct drm_device *drm = priv->drm;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   89  	struct drm_connector *connector = &priv->connector;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   90  	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   91  	struct drm_display_mode *expected_mode, *mode;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   92  	const char *cmdline = "1920x1080@60";
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   93  	int ret;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   94  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   95  	expected_mode = drm_mode_find_dmt(priv->drm, 1920, 1080, 60, false);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   96  	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   97  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   98  	KUNIT_ASSERT_TRUE(test,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   99  			  drm_mode_parse_command_line_for_connector(cmdline,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  100  								    connector,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  101  								    cmdline_mode));
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  102  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  103  	mutex_lock(&drm->mode_config.mutex);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  104  	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  105  	mutex_unlock(&drm->mode_config.mutex);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  106  	KUNIT_ASSERT_GT(test, ret, 0);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  107  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14 @108  	mode = drm_connector_pick_cmdline_mode(connector);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  109  	KUNIT_ASSERT_NOT_NULL(test, mode);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  110  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  111  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  112  }
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
