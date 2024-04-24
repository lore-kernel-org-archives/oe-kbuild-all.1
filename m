Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843A516F289
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713982830; cv=none; b=il6DleT6XTtb+qO0QYE5VEy5avGJO3fzpRWgfnMGclMTF50Q03k1AgJRsrp1zCd8/7gfVZ4gftd/9JeCuPtecPr2HThyyNDwhgDFgglXpY0+IGKQaFT1hZtQhBYmbmSz/kkVGnFuQ51Ax5uejcIyCC9VgaL/lH9iYnczEdzOu8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713982830; c=relaxed/simple;
	bh=kD+rUYoaJXQytWXleLSuNP2lKx78+iZ7ZH1dufBWzww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rCPCbFw2zt5MRni4sOI1RjrsAlOMGAm0bLBwrMuU/ia4MVFnK94L5DE1Aj1ZcruKLO46H09exFCZFMhvdmTCgLFMmeme4tvh41PFVupTFddSWOj+kQxvMVzA80LdexKvPLDDm/mpXbVjsSVVqDVFFIISGiRAy5Ois/78tE1EeUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrBXdI54; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrBXdI54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713982829; x=1745518829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kD+rUYoaJXQytWXleLSuNP2lKx78+iZ7ZH1dufBWzww=;
  b=CrBXdI548RBsI7227bTJyAzAfuQ1dtZUz+uYT4IylU2wC3egkrI4JedS
   6ZQEQlOcpjaEkXhIwn3Zcx3T3xjVJgfrpr7jZA5z1LyiUtJKwfWcCXfH2
   DT6cRYIDqkoXkPMYCDmF1KUML1/92W8EMuuMwP9646M2ydvFar53QqFZn
   7o9DNMZAzah/YVmhGUISq4LUSQ7lxj23g0xSsNUt2vqM83bDEVNd2w+vW
   2ZUzd3z6QjAhi66vgZxvxh4RKaVlE9NQGXo7njmE6JzmiimLcPiQpg9Wq
   +lOeHu46DtRgg1yZ/Mnqb77LP/MqIkJDZgZwtqR4dJCRqzrOiVGyhu9H/
   w==;
X-CSE-ConnectionGUID: fTsvvfHjRgyE5w/7RzVJUA==
X-CSE-MsgGUID: c3piQVPZSXmZLVJ6w9naoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21044468"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="21044468"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 11:20:28 -0700
X-CSE-ConnectionGUID: fj8wz1nlTkKQwhiEfFIJ4g==
X-CSE-MsgGUID: GU/l+A0YRxCYE2GQ/wZR+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="24841419"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2024 11:20:26 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzhEG-0001Xc-0n;
	Wed, 24 Apr 2024 18:20:24 +0000
Date: Thu, 25 Apr 2024 02:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8070/8170] powerpc-linux-ld:
 drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.o uses hard float,
 arch/powerpc/kernel/udbg.o uses soft float
Message-ID: <202404250209.hmhCgEgB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e4f84f18c4ee9b0ccdc19e39b7de41df21699dd
commit: c70ed007e413ac7941cacfdaa4422c7244c4e469 [8070/8170] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
config: powerpc-randconfig-r032-20230106 (https://download.01.org/0day-ci/archive/20240425/202404250209.hmhCgEgB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404250209.hmhCgEgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404250209.hmhCgEgB-lkp@intel.com/

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
