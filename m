Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0596316D326
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972743; cv=none; b=uFvPfvEFsa1GDowRyElBaFazmCJ9vVIFV4HtrFaIpG2PYrLO6NQ4qJJIcYWUtEB4qp/msJChyigBwZpIBKoLbmrJ5F4hrioOxlvhhUsQsli6G5VSpYL3h7aN6WxSfbiwmFA3aQOVx6VEyJBoEs6BpydXZK6FjGpR5kg+pmZWTYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972743; c=relaxed/simple;
	bh=FgltNa9jxIcL2d6tMApss8MmguU86vWLPvl9Evi8QX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RdHNE4uCY2WqWOfhlWobsypRgKJ3OY7bkNQdSmPoQOE3r/BiOC0l9JBs8+iERc5tePGeCDm4fi2l/fPOhy29tVJdHCCVrxobAzh+GPJ86wa8NIL+cTK0LkbTqpE4AVzY3/irv7uAolxxD8HoYoaIcHl5335BF2+194i0Q4XHeOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xbsbmr1Z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xbsbmr1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713972741; x=1745508741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FgltNa9jxIcL2d6tMApss8MmguU86vWLPvl9Evi8QX8=;
  b=Xbsbmr1Z+pL94CjEVodqkhNU7T0Zihi74jnCnO7K1VsYsOZiM+u+tolh
   MHpk7JdUFk91GFdnKDV05bk7NArxViZzfVhROZxxFdPLCb5NitBJpr8bv
   ZLVSoZs5E28hx6WcTq2qa32zHFUmorL+RIctsaliCqFtF0Nj2Xe5tuofu
   Z5szGQp9Gu3H8NQnW+fiAoxnciZUqOZtGfguCSvaKZX1CXnZMqHonJjal
   p54cRPDmRyIXwqndn4Iu2WEckrjRJbbZRB8ZKqGL3UTGdbVq1A9G8iKk1
   +pmEn3E1xuLcWKMHhvn8lxMOHHL115zcRkoykT0wVs2b1z9ujgsWuL7x0
   w==;
X-CSE-ConnectionGUID: FHOTmH8qQlGuDTO4aBcsww==
X-CSE-MsgGUID: 9omUd6rsSY2faZ10HvwFRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9777022"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9777022"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 08:32:20 -0700
X-CSE-ConnectionGUID: T5tkjJ31S2ayE339y6VvPw==
X-CSE-MsgGUID: ijNnuVRASbCFDj0SOi35oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29551372"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Apr 2024 08:32:19 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzebY-0001NI-1c;
	Wed, 24 Apr 2024 15:32:16 +0000
Date: Wed, 24 Apr 2024 23:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Le Ma <le.ma@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>
Subject: [linux-next:master 7871/8170]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:379:52: warning: '%s' directive
 output may be truncated writing up to 29 bytes into a region of size 23
Message-ID: <202404242330.Fb2cmamD-lkp@intel.com>
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
commit: e88a7abec8376eaf588df9f79f76c170acf0396a [7871/8170] drm/amdgpu: init microcode chip name from ip versions
config: x86_64-buildonly-randconfig-003-20240424 (https://download.01.org/0day-ci/archive/20240424/202404242330.Fb2cmamD-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404242330.Fb2cmamD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404242330.Fb2cmamD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c: In function 'gfx_v9_4_3_early_init':
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:379:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
     379 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
         |                                                    ^~
   ......
     439 |         r = gfx_v9_4_3_init_rlc_microcode(adev, ucode_prefix);
         |                                                 ~~~~~~~~~~~~
   In function 'gfx_v9_4_3_init_rlc_microcode',
       inlined from 'gfx_v9_4_3_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:439:6,
       inlined from 'gfx_v9_4_3_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:2257:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:379:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 30
     379 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c: In function 'gfx_v9_4_3_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:413:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
     413 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
         |                                                    ^~
   ......
     443 |         r = gfx_v9_4_3_init_cp_compute_microcode(adev, ucode_prefix);
         |                                                        ~~~~~~~~~~~~
   In function 'gfx_v9_4_3_init_cp_compute_microcode',
       inlined from 'gfx_v9_4_3_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:443:6,
       inlined from 'gfx_v9_4_3_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:2257:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:413:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 30
     413 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +379 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c

86301129698be5 Le Ma 2022-05-24  369  
86301129698be5 Le Ma 2022-05-24  370  static int gfx_v9_4_3_init_rlc_microcode(struct amdgpu_device *adev,
86301129698be5 Le Ma 2022-05-24  371  					  const char *chip_name)
86301129698be5 Le Ma 2022-05-24  372  {
86301129698be5 Le Ma 2022-05-24  373  	char fw_name[30];
86301129698be5 Le Ma 2022-05-24  374  	int err;
86301129698be5 Le Ma 2022-05-24  375  	const struct rlc_firmware_header_v2_0 *rlc_hdr;
86301129698be5 Le Ma 2022-05-24  376  	uint16_t version_major;
86301129698be5 Le Ma 2022-05-24  377  	uint16_t version_minor;
86301129698be5 Le Ma 2022-05-24  378  
86301129698be5 Le Ma 2022-05-24 @379  	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
86301129698be5 Le Ma 2022-05-24  380  
86301129698be5 Le Ma 2022-05-24  381  	err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
86301129698be5 Le Ma 2022-05-24  382  	if (err)
86301129698be5 Le Ma 2022-05-24  383  		goto out;
86301129698be5 Le Ma 2022-05-24  384  	rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
86301129698be5 Le Ma 2022-05-24  385  
86301129698be5 Le Ma 2022-05-24  386  	version_major = le16_to_cpu(rlc_hdr->header.header_version_major);
86301129698be5 Le Ma 2022-05-24  387  	version_minor = le16_to_cpu(rlc_hdr->header.header_version_minor);
86301129698be5 Le Ma 2022-05-24  388  	err = amdgpu_gfx_rlc_init_microcode(adev, version_major, version_minor);
86301129698be5 Le Ma 2022-05-24  389  out:
86301129698be5 Le Ma 2022-05-24  390  	if (err)
86301129698be5 Le Ma 2022-05-24  391  		amdgpu_ucode_release(&adev->gfx.rlc_fw);
86301129698be5 Le Ma 2022-05-24  392  
86301129698be5 Le Ma 2022-05-24  393  	return err;
86301129698be5 Le Ma 2022-05-24  394  }
86301129698be5 Le Ma 2022-05-24  395  

:::::: The code at line 379 was first introduced by commit
:::::: 86301129698be52f8398f92ea8564168f6bfcae1 drm/amdgpu: split gc v9_4_3 functionality from gc v9_0

:::::: TO: Le Ma <le.ma@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
