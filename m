Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD916273D9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 16:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765643496; cv=none; b=gZcDYb5p8nNe4F5Ve7cuZRGzKNAU8I53uRMgg0B8jqRIvB+diTZxp2bnG6fp6MNvunqMVZG0J7hBHW85NvwfVAHJbMovulEkhw03Jie7XbKjSd+tGRezzb4kF9L0LjkamecsxYmH8N86ekblHZBz6ilZOHZEWpgHMpb5xQTPI6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765643496; c=relaxed/simple;
	bh=qQBjQQeLsYyRGRU5Zb44SZWETtuceQJIS0vqdZbxjck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urLlcPBG1zKKapUajEWmoEVLRQDXkYS7RBXoVDTrgFiK0n70cpzCWmQdiWijKPzs7c+spb/fz4zyK7Yy1PokA2G2WZKqaEIHTt/bp/O5JwOEiHD7EZ5DqY9+HtAEgl8Op26fnsL8Fsl4INJJO+uQjPIk+LmmzjlQCNR0ubudJho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxkHQsY0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxkHQsY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765643495; x=1797179495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQBjQQeLsYyRGRU5Zb44SZWETtuceQJIS0vqdZbxjck=;
  b=YxkHQsY0aFpN5pSLNXUsbYWoSyVXiDtnmbTwciIu6FhNZZGbA6ilfTaP
   E7UZ4ADh4YYrhNr5RMiRtzx7FKYPs6YwicacHowYjydSlo6c7JYQZePCx
   1ZQRgNpV9lIUO8Ix1DSYOmQLTrt1eRqWd5Eu1AYzWB6IBW+4QwEsJnZt2
   HS4dbgNg/Rf3owFPBEHkyFhgJA3LMayeBJ3GDPJ1rHSmie+uJeBSm3vQc
   Ggg8+Rxl2qYHFNdC+0df9mo+RiUUUpjt+Ar8CMIXars7SRSAxVrQy3Jm+
   DFrAai35YiPQha+cwE0bJBv8kALXnJ5p7dFx/wKMTgQLuNqhM6Gy7+qF0
   Q==;
X-CSE-ConnectionGUID: NVfEWK7LT/uri9cnGHx6/A==
X-CSE-MsgGUID: D/F83lSORQSu2BtFoHP18g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="77930386"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="77930386"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:31:35 -0800
X-CSE-ConnectionGUID: UtObmus7RliqR1tB5fwmAQ==
X-CSE-MsgGUID: WBb/zmNqQjmoNtmPngdP8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="202426115"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 08:31:34 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSWp-00000000280-0hRY;
	Sat, 13 Dec 2025 16:31:31 +0000
Date: Sat, 13 Dec 2025 17:31:22 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/40] htmldocs:
 ./drivers/gpu/drm/amd/display/dc/dc.h:1295: warning: Function parameter or
 member 'plane_states' not described in 'dc_validation_set'
Message-ID: <202512131753.WkGwsBQM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: a5397c85f0b89ac4138809ff5d537b9326730d43 [0/40] drm/amd/display: Include surface of unaffected streams
reproduce: (https://download.01.org/0day-ci/archive/20251213/202512131753.WkGwsBQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131753.WkGwsBQM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'enable_double_buffered_dsc_pg_support' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'enable_dp_dig_pixel_rate_div_policy' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'lttpr_mode_override' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'dsc_delay_factor_wa_x1000' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'min_prefetch_in_strobe_ns' not described in 'dc_debug_options'
>> ./drivers/gpu/drm/amd/display/dc/dc.h:1295: warning: Function parameter or member 'plane_states' not described in 'dc_validation_set'
   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'overlap_only' not described in 'mpcc_blnd_cfg'
   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_gain_mode' not described in 'mpcc_blnd_cfg'
   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'background_color_bpc' not described in 'mpcc_blnd_cfg'
   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'top_gain' not described in 'mpcc_blnd_cfg'
   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_inside_gain' not described in 'mpcc_blnd_cfg'


vim +1295 ./drivers/gpu/drm/amd/display/dc/dc.h

19f89e2392e692 Andrey Grodzovsky 2017-08-11  1276  
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1277  /**
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1278   * struct dc_validation_set - Struct to store surface/stream associations for validation
4562236b3bc0a2 Harry Wentland    2017-09-12  1279   */
4562236b3bc0a2 Harry Wentland    2017-09-12  1280  struct dc_validation_set {
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1281  	/**
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1282  	 * @stream: Stream state properties
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1283  	 */
0971c40e180696 Harry Wentland    2017-07-27  1284  	struct dc_stream_state *stream;
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1285  
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1286  	/**
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1287  	 * @plane_state: Surface state
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1288  	 */
3be5262e353b8a Harry Wentland    2017-07-27  1289  	struct dc_plane_state *plane_states[MAX_SURFACES];
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1290  
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1291  	/**
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1292  	 * @plane_count: Total of active planes
a5397c85f0b89a Rodrigo Siqueira  2022-10-18  1293  	 */
3be5262e353b8a Harry Wentland    2017-07-27  1294  	uint8_t plane_count;
4562236b3bc0a2 Harry Wentland    2017-09-12 @1295  };
4562236b3bc0a2 Harry Wentland    2017-09-12  1296  

:::::: The code at line 1295 was first introduced by commit
:::::: 4562236b3bc0a28aeb6ee93b2d8a849a4c4e1c7c drm/amd/dc: Add dc display driver (v2)

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
