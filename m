Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8A5EC7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716492222; cv=none; b=dJLfFzbJ5KEmg8DfKDJI2RibzNtbxqCz1mtTYogilWuxae3WFnwF1zyudPLY5YNayP/VRH1Jjkcjmv5MtfQvsq9FgHbig4hl8x2EhsmlXI/UXhbABUQq5pskcDKDGXnBURRlkOyTZBrBJprjiupqywtApcUVpPjFvwmr/QAIEHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716492222; c=relaxed/simple;
	bh=ApxmmpOZPCewC+y42prY/FYfqNtgpTgeigsmsnEWqGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPgyPUEn77mFzG29ZG+rl0oPefq24FYV41acnAaBtdn20Frdh7K1afsLf4xiaGNsJgOqwux/PmM3P7X56i47c0p+GpXMBYx7D2zsOoSg7mXgVCFZrs7QI0i3aQs5Qh8EJZslqFlg9EIqKyQIDbPGQnwi7ILzC2NfMHmltGmXlMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BeC/hJIr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BeC/hJIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716492220; x=1748028220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ApxmmpOZPCewC+y42prY/FYfqNtgpTgeigsmsnEWqGI=;
  b=BeC/hJIrb9hwR3ohRjFkghO35TUYyXbppm55PGF7SI0VV6YxUGESWcn8
   15MEu2B/MvIt27bwvq/t26iVc0ValTSYXs/gj145C0va2WyOvUtEaCqdz
   De917EPgPFLO8Q51H6RF6pXrr8MZ5gWSFGmKpZW2d7soX1f7sFzP7Vk42
   2LNsVoZVT5e5Bhzbqt6HxvvdE5eHAswrWZeYo93UYaNX+LVWzNte2b0Ok
   WMWI2uEva8o+u7yqL4mOnN3GmsLnJH7zUkIvekanUksdlLqDidpfiUe4E
   l8s/0RG7Vg3AOkYPA5dHDK06wgPXnupMZ2GM5FpKmxhygJJXlo7YGpiyR
   A==;
X-CSE-ConnectionGUID: qRYsTawMSf6Apg3y5/5nUw==
X-CSE-MsgGUID: w6pip9xIQT+KgI8eKVjG1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13015168"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="13015168"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 12:23:39 -0700
X-CSE-ConnectionGUID: Vcm0yyOjSYKKQtTXW6Qv4A==
X-CSE-MsgGUID: 5bf1DmJCSm6VfNpsDe8HrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="33622503"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 May 2024 12:23:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAE2J-0003Gn-1e;
	Thu, 23 May 2024 19:23:35 +0000
Date: Fri, 24 May 2024 03:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13611/13653] powerpc-linux-ld:
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard
 float, drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o uses soft float
Message-ID: <202405240344.sCkXky75-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3689b0ef08b70e4e03b82ebd37730a03a672853a
commit: fd17235a32d941c82c861a9cc2ef8d81c756f990 [13611/13653] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
config: powerpc-randconfig-r064-20240523 (https://download.01.org/0day-ci/archive/20240524/202405240344.sCkXky75-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405240344.sCkXky75-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405240344.sCkXky75-lkp@intel.com/

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
