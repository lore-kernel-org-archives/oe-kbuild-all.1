Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F167136E26
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 17:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716224686; cv=none; b=mqD3bz6yl6/k6phlNhVmZBJgmnaOM517vjG2v/Q8s4vUszsZXgbcvLwyQeD0vjmd3M7uaLN9otyZc+jLHtXCUldJzR3MwirMB/Ofsmm5p1tPo65X/2m92naJpD1GO5Nz34WaajU5AOlxei0NNb7TwrXaShBIKc7vQ6/Rbp32Mjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716224686; c=relaxed/simple;
	bh=T+IpC37L63WeQ7yRVF3AUeXDFQwvSfQciUTUgg2HwuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AuBbVz6O2209ohJbwcPVHJKpgLjIDt03NVs25NHrx/IccuFTkJGw5u0M7Y7RoWo9GLlhkbf0rTSmNWIhrZNk6v6P8fX066E00oc1GR8eyL7nhLZIBsJdhr0oqpSJJCdQQaLXQWIwDT6T3PiE7VLzd4VbjKoh0ajkJtX2Z5fiTOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnbJrR2h; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnbJrR2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716224684; x=1747760684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+IpC37L63WeQ7yRVF3AUeXDFQwvSfQciUTUgg2HwuM=;
  b=lnbJrR2hKAHlewVbo33ZFNk4cDQDmhJapCSJuhfej+/clYvIN3Wi+Wp8
   9Xu99/PiGdwoThvEz/vipRPSTggHgLDuikuIH9GcfYtaZiIbfHMD2UFQG
   b1TZrV5PZFC1uQEz2ta26FogP4T2Ca+qAEItPFU3+em+ozIb65ldjVS2q
   QdoOSAzBOA+xyaWCwAe+5wmwuOG5Dt/cQbZVHOO5F0+wiVv7GTVM8x833
   XGvgNgVKcohbK6Webnp22PJSG8QpOIIzQSJhAAz2ROu6QQCB0gb+S4HoN
   qGcNczyxgjWiKPxSdmXfs0/LyK2de/I08N1rYiqnMe4hjL8YSXW3pRlIn
   A==;
X-CSE-ConnectionGUID: X6lFoBUMSQ2tLcwSWtgA7g==
X-CSE-MsgGUID: 2pLqDJ21QumisJ0oceZ2tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23036912"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="23036912"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 10:04:43 -0700
X-CSE-ConnectionGUID: gbkmXQs0R1WXVXN1Ejuggg==
X-CSE-MsgGUID: Om/Z6fm8RL2Q01AqI8hIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="33170095"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2024 10:04:43 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s96RD-0004zq-1u;
	Mon, 20 May 2024 17:04:39 +0000
Date: Tue, 21 May 2024 01:04:07 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13437/13491] powerpc-linux-ld:
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard
 float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
Message-ID: <202405210144.tRSpVjYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   632483ea8004edfadd035de36e1ab2c7c4f53158
commit: 5e99991c3c9254b6059156a96e02ab22b2e6cddd [13437/13491] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
config: powerpc-randconfig-003-20240317 (https://download.01.org/0day-ci/archive/20240521/202405210144.tRSpVjYs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405210144.tRSpVjYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210144.tRSpVjYs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn321/dcn321_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn321/dcn321_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn302/dcn302_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn302/dcn302_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn351/dcn351_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn351/dcn351_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn401/dcn401_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn401/dcn401_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_math.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_math.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_util.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_util.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_utils.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_utils.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_policy.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_policy.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml_display_rq_dlg_calc.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml_display_rq_dlg_calc.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.o
   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_utils.o uses hard float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_utils.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
