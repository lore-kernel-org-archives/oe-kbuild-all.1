Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC2264FB0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 21:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739308089; cv=none; b=Il4T+qS2UWOidV+weRX1t5CI89o04qk9CET4XJyD+IbYBLL2sqjjQ/Dbq82lXXzC9oTJ93PcQz6nhlMwau8WemqQfS/wFZrEa694MRVZmUQEYgj4yo7K8a4fyeMrikBKuwStB4CqPqRx98DDyQwyB09S/4W76kheJpqD9aV24a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739308089; c=relaxed/simple;
	bh=SkfReqRu6iMkIDSHlyRhDdyz/pDkizXAK+lW8irB7CY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nm/AL+NDxfdt0ZjxT1JG6xWR+sTBxAqmuu4dyy9gICP/SfnsiZ5Ok3dT9Lcj5gGwXITSXTAjRKntkmxlE9CvTAvt6Sx4rKubsf6pCkYLiq6nU0thz9Fe3rlpiOLtERlSty9lrA4KgbDWU4YoUL5uVrxWobyaKmAWw6KcUnpSBXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2PN85th; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2PN85th"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739308087; x=1770844087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SkfReqRu6iMkIDSHlyRhDdyz/pDkizXAK+lW8irB7CY=;
  b=j2PN85thu+Er+Nqi4FoEFXeCLk9RepVqB8A1DiwScVSRQKXeKua3gdnY
   HsojeIFiySEw0sHaWlCWSF/JT7DLY309Uu1hVesCtI/ESrP5tP6cK81RO
   qounYVRG4fotJhjUV9vpHC0fW+RpxrFXrj/BtGys6JvUYcZqateWjExG7
   T95GOP2JkjYcLc9M6nApYaOZhND1lR5dQ0J3N8rTKUsbkL2mMfkPlVqyO
   rw0Xgi/M6J598lNQt0olHdFjQ0v1L/MhnTPzygx64EJAd25E9y5l05lEU
   hRL3xqWiPEpHmpX7sAYhcltOHPuy3fVrd/tZA7b2wSDmF6gPihV1ZFywO
   Q==;
X-CSE-ConnectionGUID: r+k1N9BgSKWHcgWhqn9Oig==
X-CSE-MsgGUID: djpYqwkARDKSptgseBO4Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40212543"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="40212543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 13:08:07 -0800
X-CSE-ConnectionGUID: IU7LFGWcRXKKRBvDFQJP4w==
X-CSE-MsgGUID: CsSeowmWQPCG37AXt34UeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112382087"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2025 13:08:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thxUA-0014i6-20;
	Tue, 11 Feb 2025 21:08:02 +0000
Date: Wed, 12 Feb 2025 05:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Subject: [drm-i915:for-linux-next 6/14]
 drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error:
 incompatible pointer types passing 'struct intel_display *' to parameter of
 type 'struct drm_i915_private *'
Message-ID: <202502120426.6sDp3XKn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/i915/kernel for-linux-next
head:   f2d236766f01ac56799070cc076518f5a7bdbbaf
commit: 5dcfda5cfa42616ca84c41aa090e17e7417a0f68 [6/14] drm/i915: Convert intel_display_power_{get,put}*() to intel_display
config: i386-randconfig-141-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120426.6sDp3XKn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120426.6sDp3XKn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120426.6sDp3XKn-lkp@intel.com/

Note: the drm-i915/for-linux-next HEAD f2d236766f01ac56799070cc076518f5a7bdbbaf builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_driver.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_bw.h:12:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
   1 error generated.
--
   In file included from drivers/gpu/drm/i915/display/i9xx_plane.c:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
   drivers/gpu/drm/i915/display/i9xx_plane.c:697:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
     697 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_cmtg.c:12:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
   drivers/gpu/drm/i915/display/intel_cmtg.c:95:17: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
      95 |         power_domain = POWER_DOMAIN_TRANSCODER(trans);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_cursor.c:14:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
   drivers/gpu/drm/i915/display/intel_cursor.c:335:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
     335 |         power_domain = POWER_DOMAIN_PIPE(PIPE_A);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cursor.c:749:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
     749 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_display.c:52:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
   drivers/gpu/drm/i915/display/intel_display.c:434:17: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
     434 |         power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2051:16: warning: arithmetic between different enumeration types ('enum phy' and 'enum port') [-Wenum-enum-conversion]
    2051 |                 return PHY_D + port - PORT_D_XELPD;
         |                        ~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2053:16: warning: arithmetic between different enumeration types ('enum phy' and 'enum port') [-Wenum-enum-conversion]
    2053 |                 return PHY_F + port - PORT_TC1;
         |                        ~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2055:16: warning: arithmetic between different enumeration types ('enum phy' and 'enum port') [-Wenum-enum-conversion]
    2055 |                 return PHY_B + port - PORT_TC1;
         |                        ~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2057:16: warning: arithmetic between different enumeration types ('enum phy' and 'enum port') [-Wenum-enum-conversion]
    2057 |                 return PHY_C + port - PORT_TC1;
         |                        ~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2062:15: warning: arithmetic between different enumeration types ('enum phy' and 'enum port') [-Wenum-enum-conversion]
    2062 |         return PHY_A + port - PORT_A;
         |                ~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2072:20: warning: arithmetic between different enumeration types ('enum tc_port' and 'enum port') [-Wenum-enum-conversion]
    2072 |                 return TC_PORT_1 + port - PORT_TC1;
         |                        ~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2074:20: warning: arithmetic between different enumeration types ('enum tc_port' and 'enum port') [-Wenum-enum-conversion]
    2074 |                 return TC_PORT_1 + port - PORT_C;
         |                        ~~~~~~~~~ ^ ~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2137:10: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    2137 |         set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2138:10: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    2138 |         set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:2141:11: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    2141 |                 set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask->bits);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:123:11: note: expanded from macro 'POWER_DOMAIN_PIPE_PANEL_FITTER'
     123 |                 ((pipe) + POWER_DOMAIN_PIPE_PANEL_FITTER_A)
         |                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3233:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    3233 |         power_domain = POWER_DOMAIN_PIPE(crtc->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3617:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    3617 |         power_domain = POWER_DOMAIN_PIPE(crtc->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3710:17: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    3710 |         power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3737:18: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    3737 |                 power_domain = POWER_DOMAIN_PIPE(pipe);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:4004:18: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    4004 |                 power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:4110:14: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    4110 |                                                        POWER_DOMAIN_TRANSCODER(pipe_config->cpu_transcoder)))
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:4144:15: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    4144 |                                                                POWER_DOMAIN_TRANSCODER(cpu_transcoder)))
         |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:4197:14: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    4197 |                                                        POWER_DOMAIN_PIPE(crtc->pipe)))
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:4249:13: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    4249 |                                                       POWER_DOMAIN_PIPE_PANEL_FITTER(crtc->pipe))) {
--
   In file included from drivers/gpu/drm/i915/display/intel_display_irq.c:9:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
   drivers/gpu/drm/i915/display/intel_display_irq.c:1621:10: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    1621 |                                                    POWER_DOMAIN_PIPE(pipe)))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_irq.c:1646:13: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    1646 |                         domain = POWER_DOMAIN_TRANSCODER(trans);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_irq.c:1664:10: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    1664 |                                                    POWER_DOMAIN_PIPE(pipe)))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_irq.c:1889:13: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    1889 |                         domain = POWER_DOMAIN_TRANSCODER(trans);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_irq.c:1904:10: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    1904 |                                                    POWER_DOMAIN_PIPE(pipe)))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   5 warnings and 1 error generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_display_power.c:8:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
>> drivers/gpu/drm/i915/display/intel_display_power.c:846:6: error: conflicting types for 'intel_display_power_put_unchecked'
     846 | void intel_display_power_put_unchecked(struct intel_display *display,
         |      ^
   drivers/gpu/drm/i915/display/intel_display_power.h:220:6: note: previous declaration is here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |      ^
   2 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_dpll_mgr.c:28:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
   drivers/gpu/drm/i915/display/intel_dpll_mgr.c:194:19: warning: arithmetic between different enumeration types ('enum tc_port' and 'enum intel_dpll_id') [-Wenum-enum-conversion]
     194 |         return TC_PORT_1 + id - DPLL_ID_ICL_MGPLL1;
         |                ~~~~~~~~~ ^ ~~
   1 warning and 1 error generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_hotplug.c:29:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
   drivers/gpu/drm/i915/display/intel_hotplug.c:95:20: warning: arithmetic between different enumeration types ('enum hpd_pin' and 'enum port') [-Wenum-enum-conversion]
      95 |         return HPD_PORT_A + port - PORT_A;
         |                ~~~~~~~~~~ ^ ~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_sprite.c:41:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
   drivers/gpu/drm/i915/display/intel_sprite.c:461:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
     461 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_sprite.c:890:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
     890 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_sprite.c:1227:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    1227 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:121:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     121 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   3 warnings and 1 error generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_tc.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:23:
>> drivers/gpu/drm/i915/display/intel_display_power.h:228:36: error: incompatible pointer types passing 'struct intel_display *' to parameter of type 'struct drm_i915_private *' [-Werror,-Wincompatible-pointer-types]
     228 |         intel_display_power_put_unchecked(display, domain);
         |                                           ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: passing argument to parameter 'dev_priv' here
     220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
         |                                                                 ^
   drivers/gpu/drm/i915/display/intel_tc.c:255:41: warning: arithmetic between different enumeration types ('enum intel_display_power_domain' and 'enum tc_port') [-Wenum-enum-conversion]
     255 |         return POWER_DOMAIN_PORT_DDI_LANES_TC1 + tc_port - TC_PORT_1;
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~
   1 warning and 1 error generated.
..


vim +228 drivers/gpu/drm/i915/display/intel_display_power.h

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
