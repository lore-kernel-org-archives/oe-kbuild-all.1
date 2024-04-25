Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3281494C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714059191; cv=none; b=WFqqVWjLCwaRS13BG4L9k7Ne4dDz4GAJlAVak6mJ9DyTXqUE/ilKNzYTlwhyIn6xxr+x47FJTbMGzF00kuerx1fD/nxPPzZHoC7G/eKOwQTs5PI8CHo3pEww6oyF12sU15H4eZkzPr/2LxlIrTwhJbf8yAVJiyAJIaX1hMN5c8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714059191; c=relaxed/simple;
	bh=ONlxMFNs21NneL4aWVDv2Tx5YGXd2otL8UbU0U3SgW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcMfCGUEr09GL75eh2A9idkvq4rktbXEBB2FCoceOAXpWoTDQPBWeSHCvshLXyoZTGHJuVYk6XWf8D1zhZVlLyTT68KTAlSpiHxOlZPwAsUvKsAmA4ZwxuZ5ulY7XxdRJ4BttS60EDx2L9aSZ4kE5to4ECDQH7bNNu90p2fEaIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeteELhx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeteELhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714059190; x=1745595190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ONlxMFNs21NneL4aWVDv2Tx5YGXd2otL8UbU0U3SgW4=;
  b=FeteELhxcFgPBvn517DtnbEei0VTXTxw1EcnH+YpYj7AgC/KZmMXuJjQ
   S4Y+pJeat3VNEggL/YsVOZzSkt0O0h6eCifS1ApMib99sb5uM6JYjfta4
   fblY+iWqjmrWI+NB67hF3Gdq58aBdBkjJqw6S4ZhdRZQchbjjjzmn1WTc
   3VLg16eh86Z086TBaA3QVX7RmWx48IDcbK+ZfxTaGdxe+EOK3odOlQI+O
   BSVqkDRBVou5fgGDHgRRfQ7kUp4n8gFiO5GRmHbYBKnxx1DonuwSWXtMv
   1eB8uzhWghbdYKOxx68wrM19fbsAVgbnVK4pfACV2fYJ6XJ+IhaBNiDE/
   A==;
X-CSE-ConnectionGUID: tFXbZgRISLGSkqu1KiNawA==
X-CSE-MsgGUID: 9122xoh0SSyvaFX9WZA4+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20444911"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="20444911"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 08:33:09 -0700
X-CSE-ConnectionGUID: nEBHDKIfSfyNZFz30UE3Kg==
X-CSE-MsgGUID: me4l0usHRPqJ77CokYzU+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="56053925"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Apr 2024 08:33:03 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s015o-0002VQ-1f;
	Thu, 25 Apr 2024 15:33:00 +0000
Date: Thu, 25 Apr 2024 23:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 7869/8170]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c:14:20:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202404252326.TzgdCgQ7-lkp@intel.com>
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
commit: d546a39c6b10053e60d99d7af8a1ace6d8e0d0c3 [7869/8170] drm/amd/display: Add misc DC changes for DCN401
config: x86_64-randconfig-r111-20240425 (https://download.01.org/0day-ci/archive/20240425/202404252326.TzgdCgQ7-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404252326.TzgdCgQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404252326.TzgdCgQ7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c:14:20: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c:24:20: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c:110:87: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c:110:90: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c:19:20: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c:31:20: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:614:53: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:615:58: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:617:53: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:727:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:728:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:729:57: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:788:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:789:55: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:790:57: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:958:67: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10728:74: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10729:70: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c:11116:74: sparse: sparse: Using plain integer as NULL pointer

vim +14 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c

3df48ddedee4b6 Aurabindo Pillai 2024-04-19   9  
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  10  bool dml2_core_create(enum dml2_project_id project_id, struct dml2_core_instance *out)
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  11  {
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  12  	bool result = false;
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  13  
3df48ddedee4b6 Aurabindo Pillai 2024-04-19 @14  	if (out == 0)

:::::: The code at line 14 was first introduced by commit
:::::: 3df48ddedee4b68787087cdbdbec8fa28ad0ce68 drm/amd/display: Add new DCN401 sources

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
