Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7532EAE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 18:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716921525; cv=none; b=l0BFHz+/R36Gj8s+DMxbWImboFlvirjABpA1VVFUdm1X2KR+1yjpBWFyKxN9zZir/82mzO2V+OUv1yF9G/krv8ChYBXAwEdBH9UCmrYCKy8JgoxvP17jAQqdeBPmA8kUlObGJm66G8g4Tl9i7CH3DJsB14AnrwR0wlJFley8SIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716921525; c=relaxed/simple;
	bh=0xmwyYlbUgXt/T8c6mEbdNqxAWI8GU9dxarrjmnYaW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pmP/zgaKBpTE+niUXO2PzCuS85gi4zYjDIscgYqAqI7HVn3XF2QH/WeobvM1jCCe6lIRH+yf8cd6wRY62K5S2J84ZOgz0L4q0J0lBaV4BjKzAqbVtcNjKLK4PvZA0hiS+aRUBfOzKOk/UsSntOoDMnZIkjRgnolf3uMg+uWuMEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9hCgMj5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9hCgMj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716921522; x=1748457522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0xmwyYlbUgXt/T8c6mEbdNqxAWI8GU9dxarrjmnYaW0=;
  b=N9hCgMj59SvvxiDvKGveS3PaLBE3lloO/lAe6NFaCaY3xUTLMMVZL+7D
   T66Jew2/1Mwb1I5oiOY6B+kdqvBd/tVPMFOaWnVd9E41g4bSaMg+Q7kAk
   GPf6xK1aU6PZgxZucqtcSRAm50cVRK8Vvp4jiGqi6MCOYkRU+QUHSIg+/
   6um35IfVTn6a4tp9DSGJeJt1NgQtrafRMpj0NqcvnMtBnCs6pLK3sJ8Zf
   ul9HtN3l0EV8SOGO9OHNG+B3hu1Tz/DoYB//yxBxmLnOjAF1J6EdfQyaw
   HaED5mp8U6BzHHeZTJmHHrNNLADiJ0rDikkmK28o1nxbJ+nuzXf4QHZKS
   g==;
X-CSE-ConnectionGUID: DROBYyZoRb+Cfh1llETmjA==
X-CSE-MsgGUID: oNj1ZfrSQdWv80x2Ev4giA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23844949"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="23844949"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 11:38:41 -0700
X-CSE-ConnectionGUID: /uDwuwvmTCOx4OtN0zI74w==
X-CSE-MsgGUID: Fy0ThtnIQjSCLOUeqogr0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="40160649"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2024 11:38:40 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC1iY-000Cd1-05;
	Tue, 28 May 2024 18:38:38 +0000
Date: Wed, 29 May 2024 02:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13700/13737] powerpc-linux-ld:
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn401/dcn401_fpu.o uses hard
 float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o
 uses soft float
Message-ID: <202405290207.TyWqBP5P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6dc544b66971c7f9909ff038b62149105272d26a
commit: 1b389d55ef6a7d7a2418a144961a44db88743147 [13700/13737] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
config: powerpc-randconfig-r051-20240527 (https://download.01.org/0day-ci/archive/20240529/202405290207.TyWqBP5P-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290207.TyWqBP5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290207.TyWqBP5P-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn321/dcn321_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn321/dcn321_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn302/dcn302_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn302/dcn302_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn351/dcn351_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn351/dcn351_fpu.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn401/dcn401_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn401/dcn401_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_math.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_math.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_util.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_util.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_utils.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_utils.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_policy.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_policy.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml_display_rq_dlg_calc.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml_display_rq_dlg_calc.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_utils.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_utils.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
