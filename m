Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C418AAD35
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 06:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716617907; cv=none; b=TAM1leTjgYJIW6xLgmqz4SFVRLdsTlAzJSM530LsqDaKmPAVm0WAdMiTPcTiQaH2p6zJ/4tblGG26NRYFT1b9xRnKQuPGfz4kFvZjZBQ+XSjBJoWwecXjfrqGu6FOZRcy74g9QVmRAoKDnZh5I5WNp82XcqS+fXSTW5lWXGO1ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716617907; c=relaxed/simple;
	bh=jfqTAZXeeoDFd7lBth/85E+apBQV2XVUdkQfrb+C94s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EhldBAs4m3DyLvBISjWQ7OaPrsLMjfl5KXfO9gfphxABisdG2aaxbT3bAvJJFiLtvvatsc0RhM9I4f2VGqerSSihtThZDHe5qJBSSew8jd2XxdyvWb2pa96vOe0JtH6ZdeoQDsaKVjcHo78mOQC4BhXkmnSPso5hNcul7OdMnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7Brt4Rv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7Brt4Rv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716617906; x=1748153906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jfqTAZXeeoDFd7lBth/85E+apBQV2XVUdkQfrb+C94s=;
  b=Y7Brt4RvTXDTFiBlpmgy8zuE0wKPUTJBKvn/5xD+UCHcgDlWJ7w+dl1w
   0ET7MnBjzgHIccPsbVRlzH7RVj8/19gU67bnttlPnTvHxeXy0cY/E1tM/
   lWoUfMVmr2HzyvLlNy6O28YCKLa0RrYTQPBUftbydm8OYjTxsfduF4Ekx
   f0P8gJoZC9eMCvJEmS/qV1jzsSv9QM9rZFf7EIGFzf5PJz5gH22zz+7TP
   fHcqbp+FEZkaYPKX/NzY+IH1yHw1v/wtQ3msO4mgoMQl/+EaHSuJe+LzQ
   gHeeOj74s4kfciCXppNaFlug476SiGp8mC2sMuojkc3yPe4YmucjZ9hK2
   Q==;
X-CSE-ConnectionGUID: BiAS4pwsTH2nnafTg6IGoA==
X-CSE-MsgGUID: Gl/RoKbGTdmTJTleG47qAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="16790659"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="16790659"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 23:18:25 -0700
X-CSE-ConnectionGUID: szzPYK63TcWndJaHe89QJA==
X-CSE-MsgGUID: KlsqyFlrRb6USTSTulnU4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="34324203"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 May 2024 23:18:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAkjV-0006bP-1x;
	Sat, 25 May 2024 06:18:21 +0000
Date: Sat, 25 May 2024 14:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13533/13585] powerpc-linux-ld:
 drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.o uses hard float,
 arch/powerpc/kernel/udbg.o uses soft float
Message-ID: <202405251409.RRNoE08q-lkp@intel.com>
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
commit: cca7e9f0dc3dfbccc9f23eb8ca369b4b1c8472ef [13533/13585] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
config: powerpc-randconfig-002-20240525 (https://download.01.org/0day-ci/archive/20240525/202405251409.RRNoE08q-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405251409.RRNoE08q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405251409.RRNoE08q-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calc_math.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calc_math.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calc_auto.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calc_auto.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.o
   powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml_display_rq_dlg_calc.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml_display_rq_dlg_calc.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.o
>> powerpc-linux-ld: drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
   powerpc-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
