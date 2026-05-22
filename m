Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9356327AC31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 21:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484300; cv=none; b=NeCD5lVYJZFS18Ll/Xsi0kbsOBN/enS3B+JsfR61MLJ+Tycda2JOHBEYXXvYW5eE0oc2Ba4G0UF00AWznywTJ00uQz8gHysa9RYZmEeiikkDU+6I2fdfAXXbFCf48KX2Wc+Kzfo/dDFeBSKOY9j9ivH/9gIuoDNY2H1GHqNRVfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484300; c=relaxed/simple;
	bh=/YxZyUSyHMhQDgpd/JZtbqzasVVrWklI1IDw7eq6rRg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PJJ8V75+STWqkVflRQLZ1MfjJF5FxtQTVrQnORsSMRkcDJn6yrLRu06bVW4WHUPJ9rIENZ8Y1Zyvb8U12REsXEPGadXuhk8v0KQbRrOShsXsEulBVec2rWvGWbiybMFkjA13i5jMXmPl/x9hfhTeDHiLqH9Dl2hDD45mlFyTy/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/DpBPdU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/DpBPdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779484298; x=1811020298;
  h=date:from:to:cc:subject:message-id;
  bh=/YxZyUSyHMhQDgpd/JZtbqzasVVrWklI1IDw7eq6rRg=;
  b=T/DpBPdUGeiJNHGwauXM7KvjRCuc28hcNxAbFI+0GSHNOkpB5w71RgvV
   WB6wNW7KuEJogHJ/m4UZVvYKDIfRiFpQPh86T9icukCyS+MPWV3lqsVo4
   VNCLh34UDCbHHKuAAA1Okrl+zgk3bkRNInpXIy6dDQUxQs3odD1E5qTf+
   gNZibfZ1KJ9fHt0lDLRvYdiZ7aqM+OIWLCV+ji5jkXoHZ2Q3TGVvx5BNJ
   FtLUMOOohv9SoQVBiAm29utgmLuoN4Jouof1CUCxBeTclkqWp0UbdFcZZ
   aHATSSNLwLrzjowrFPHdVBvyWjzHYYRHRIOjr/l309ffNz17lM53yJCOs
   Q==;
X-CSE-ConnectionGUID: 6o4AEKCFQPeLmNjxGjTQ5Q==
X-CSE-MsgGUID: k5EkNWc3TtWkWpCLGnq2sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91105080"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="91105080"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 14:11:38 -0700
X-CSE-ConnectionGUID: l5B52cW3S4qgXZBfE61uXQ==
X-CSE-MsgGUID: e99NAF4iQMqUEJpGI0W+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="238432617"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 May 2026 14:11:36 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQX9a-000000002z3-0JH5;
	Fri, 22 May 2026 21:11:34 +0000
Date: Sat, 23 May 2026 05:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lohita Mudimela <lohita.mudimela@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Martin Leung <martin.leung@amd.com>, James Lin <pinglei.lin@amd.com>
Subject: [linux-next:master 4091/8157]
 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:817
 mod_power_update_backlight_on_mode_change() warn: inconsistent indenting
Message-ID: <202605230557.R9mujfZP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c1ecb239fa3456529a32255359fc78b69eb9d847
commit: 254a47ce0c8a52ff78a60f92a13b56db69f69096 [4091/8157] drm/amd/display: Separate ABM functions into dedicated power_abm.c file
config: x86_64-randconfig-161-20260522 (https://download.01.org/0day-ci/archive/20260523/202605230557.R9mujfZP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605230557.R9mujfZP-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:817 mod_power_update_backlight_on_mode_change() warn: inconsistent indenting

vim +817 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c

   807	
   808	void mod_power_update_backlight_on_mode_change(
   809	    struct core_power *core_power,
   810	    struct dc_link *link,
   811	    unsigned int panel_inst,
   812	    uint8_t aux_inst,
   813	    bool is_hdr)
   814	{
   815	    struct set_backlight_level_params backlight_level_params = { 0 };
   816	
 > 817			if (link->dpcd_sink_ext_caps.bits.hdr_aux_backlight_control == 1 ||
   818				link->dpcd_sink_ext_caps.bits.sdr_aux_backlight_control == 1)
   819				dc_link_set_backlight_level_nits(link, core_power->bl_state[panel_inst].isHDR,
   820					core_power->bl_state[panel_inst].backlight_millinit, 0);
   821	
   822			backlight_level_params.frame_ramp = 0;
   823	
   824			fill_backlight_level_params(core_power, &backlight_level_params, panel_inst, aux_inst,
   825				core_power->bl_state[panel_inst].backlight_pwm, link->backlight_control_type,
   826				core_power->bl_state[panel_inst].backlight_millinit, 0, is_hdr);
   827	
   828			dc_link_set_backlight_level(link, &backlight_level_params);
   829	}
   830	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
