Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801BF3D810D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881159; cv=none; b=do/bbWWiq2hIun3VYQH9yNdocz8k/BkNMJsVEODn7W3bVUoH9sBkHzGW4hkGURTGEQRNuPDhPP8IrehBUYHYCCarviXMA6Zl5ih9RsaFMARyYTe2usyZVIQ5wZ2Bpmj4QqGH/dsk45cLzqHFmWb7XeKRTG3vZHEl0CFwylAxBPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881159; c=relaxed/simple;
	bh=gAgpw2ZxKg1SmLmh5q+tnAHm0FhyK+/WZVUxjcbt478=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Evlie+gmcz58S9tNDlsi9BzksII0gDWfrU0hs98+NJ7V00vmsMdfmNIdD1oht7s+JHUulpKFLco/HfRDuaIEf0N1idqN/DWnPSeeMNkPP60WzYcPHiLUMrr+2kHz722R06ZU0py1OakauIJREjHd4GwNPsqKhaq/fz+fWk/k4QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEB0BmAI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEB0BmAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784881152; x=1816417152;
  h=date:from:to:cc:subject:message-id;
  bh=gAgpw2ZxKg1SmLmh5q+tnAHm0FhyK+/WZVUxjcbt478=;
  b=kEB0BmAIgkYxJmWGNe70jJMSrA4L7in0ZSGMBuYbvWOO6Bc15w+kuWeI
   wcdf33LwV6APNH4K3juMMhp30MEzBq12oDoxzBP9E59G4PEBZ9VssuL5y
   EBwWcisja8SX2H58GmW1/juDQWmHwCHwFxFgSpe1NSGK6EAs4F9zt6flW
   iuZrhfnJ5OZKsVFJyVegsILSe9zV+AdsacPVucBtUKXO1GzIGs1puwyoB
   7LO0lhP+hEjudtwaetUEKDkUhRv3omTXKw9MXtcKH7Pw2wpWo/pgBi61c
   GCLLl2YlZO/3/7H9nRj2+iwkp/9MueniogiifbpasRt6fQZGXemS8XUz6
   g==;
X-CSE-ConnectionGUID: AuGAgNHrQeijWm8ah+G8+A==
X-CSE-MsgGUID: 5b9KGJD+T+aB65Kd1BnK7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88083988"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="88083988"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:19:09 -0700
X-CSE-ConnectionGUID: uEITS2rHQZa/N11bx7F3wQ==
X-CSE-MsgGUID: j7Q1+Rj1T+eLdMUWl3WIug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="256878626"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Jul 2026 01:19:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnB7Y-00000000ad4-3Y0V;
	Fri, 24 Jul 2026 08:19:04 +0000
Date: Fri, 24 Jul 2026 16:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Ruijing Dong <ruijing.dong@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/soc21.c:839
 soc21_common_early_init() warn: inconsistent indenting
Message-ID: <202607241603.k02QYqvs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 637fd8dedf10f8961782c29482edffaff1ccc7e2 drm/amdgpu/discovery: add vcn and jpeg ip block
date:   7 months ago
config: x86_64-randconfig-161-20260723 (https://download.01.org/0day-ci/archive/20260724/202607241603.k02QYqvs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 637fd8dedf10 ("drm/amdgpu/discovery: add vcn and jpeg ip block")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607241603.k02QYqvs-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/soc21.c:839 soc21_common_early_init() warn: inconsistent indenting

vim +839 drivers/gpu/drm/amd/amdgpu/soc21.c

71199aa47bbcce Stanley.Yang                2022-04-01  579  
146b085eadd2ce Sunil Khatri                2024-09-25  580  static int soc21_common_early_init(struct amdgpu_ip_block *ip_block)
71199aa47bbcce Stanley.Yang                2022-04-01  581  {
146b085eadd2ce Sunil Khatri                2024-09-25  582  	struct amdgpu_device *adev = ip_block->adev;
71199aa47bbcce Stanley.Yang                2022-04-01  583  
cdca89bce4984f Alex Deucher                2024-04-14  584  	adev->nbio.funcs->set_reg_remap(adev);
71199aa47bbcce Stanley.Yang                2022-04-01  585  	adev->smc_rreg = NULL;
71199aa47bbcce Stanley.Yang                2022-04-01  586  	adev->smc_wreg = NULL;
65ba96e91b689c Hawking Zhang               2023-03-06  587  	adev->pcie_rreg = &amdgpu_device_indirect_rreg;
65ba96e91b689c Hawking Zhang               2023-03-06  588  	adev->pcie_wreg = &amdgpu_device_indirect_wreg;
65ba96e91b689c Hawking Zhang               2023-03-06  589  	adev->pcie_rreg64 = &amdgpu_device_indirect_rreg64;
65ba96e91b689c Hawking Zhang               2023-03-06  590  	adev->pcie_wreg64 = &amdgpu_device_indirect_wreg64;
bafd6cbe4add74 Xiaojian Du                 2022-01-19  591  	adev->pciep_rreg = amdgpu_device_pcie_port_rreg;
bafd6cbe4add74 Xiaojian Du                 2022-01-19  592  	adev->pciep_wreg = amdgpu_device_pcie_port_wreg;
71199aa47bbcce Stanley.Yang                2022-04-01  593  
71199aa47bbcce Stanley.Yang                2022-04-01  594  	/* TODO: will add them during VCN v2 implementation */
71199aa47bbcce Stanley.Yang                2022-04-01  595  	adev->uvd_ctx_rreg = NULL;
71199aa47bbcce Stanley.Yang                2022-04-01  596  	adev->uvd_ctx_wreg = NULL;
71199aa47bbcce Stanley.Yang                2022-04-01  597  
71199aa47bbcce Stanley.Yang                2022-04-01  598  	adev->didt_rreg = &soc21_didt_rreg;
71199aa47bbcce Stanley.Yang                2022-04-01  599  	adev->didt_wreg = &soc21_didt_wreg;
71199aa47bbcce Stanley.Yang                2022-04-01  600  
71199aa47bbcce Stanley.Yang                2022-04-01  601  	adev->asic_funcs = &soc21_asic_funcs;
71199aa47bbcce Stanley.Yang                2022-04-01  602  
dabc114e4bac90 Hawking Zhang               2023-03-06  603  	adev->rev_id = amdgpu_device_get_rev_id(adev);
71199aa47bbcce Stanley.Yang                2022-04-01  604  	adev->external_rev_id = 0xff;
4e8303cf2c4dd2 Lijo Lazar                  2023-09-11  605  	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
71199aa47bbcce Stanley.Yang                2022-04-01  606  	case IP_VERSION(11, 0, 0):
390db4b84aacbf Evan Quan                   2022-04-14  607  		adev->cg_flags = AMD_CG_SUPPORT_GFX_CGCG |
b21348a28bffd1 Evan Quan                   2022-04-14  608  			AMD_CG_SUPPORT_GFX_CGLS |
1b586595df6d04 Evan Quan                   2022-08-03  609  #if 0
915b5ce774b5d5 Evan Quan                   2022-04-11  610  			AMD_CG_SUPPORT_GFX_3D_CGCG |
915b5ce774b5d5 Evan Quan                   2022-04-11  611  			AMD_CG_SUPPORT_GFX_3D_CGLS |
1b586595df6d04 Evan Quan                   2022-08-03  612  #endif
915b5ce774b5d5 Evan Quan                   2022-04-11  613  			AMD_CG_SUPPORT_GFX_MGCG |
8b719b968fac3b Leo Liu                     2022-04-14  614  			AMD_CG_SUPPORT_REPEATER_FGCG |
915b5ce774b5d5 Evan Quan                   2022-04-11  615  			AMD_CG_SUPPORT_GFX_FGCG |
915b5ce774b5d5 Evan Quan                   2022-04-11  616  			AMD_CG_SUPPORT_GFX_PERF_CLK |
7c507d35a53214 James Zhu                   2022-04-14  617  			AMD_CG_SUPPORT_VCN_MGCG |
c649ed054ad7d2 Evan Quan                   2022-04-15  618  			AMD_CG_SUPPORT_JPEG_MGCG |
c649ed054ad7d2 Evan Quan                   2022-04-15  619  			AMD_CG_SUPPORT_ATHUB_MGCG |
7ccf6eb0033782 Evan Quan                   2022-04-15  620  			AMD_CG_SUPPORT_ATHUB_LS |
7ccf6eb0033782 Evan Quan                   2022-04-15  621  			AMD_CG_SUPPORT_MC_MGCG |
2013906955f49c Evan Quan                   2022-04-15  622  			AMD_CG_SUPPORT_MC_LS |
d386f64588aad1 Evan Quan                   2022-04-15  623  			AMD_CG_SUPPORT_IH_CG |
d386f64588aad1 Evan Quan                   2022-04-15  624  			AMD_CG_SUPPORT_HDP_SD;
8b719b968fac3b Leo Liu                     2022-04-14  625  		adev->pg_flags = AMD_PG_SUPPORT_VCN |
04270390fe85eb James Zhu                   2022-04-07  626  			AMD_PG_SUPPORT_VCN_DPG |
7c507d35a53214 James Zhu                   2022-04-14  627  			AMD_PG_SUPPORT_JPEG |
8b719b968fac3b Leo Liu                     2022-04-14  628  			AMD_PG_SUPPORT_ATHUB |
a6dec8684079e3 Evan Quan                   2022-04-07  629  			AMD_PG_SUPPORT_MMHUB;
71199aa47bbcce Stanley.Yang                2022-04-01  630  		adev->external_rev_id = adev->rev_id + 0x1; // TODO: need update
71199aa47bbcce Stanley.Yang                2022-04-01  631  		break;
92fd2153149fcb Flora Cui                   2022-04-15  632  	case IP_VERSION(11, 0, 2):
71dae221432cbf James Zhu                   2022-01-05  633  		adev->cg_flags =
9503a944e723a8 Likun Gao                   2022-02-14  634  			AMD_CG_SUPPORT_GFX_CGCG |
9503a944e723a8 Likun Gao                   2022-02-14  635  			AMD_CG_SUPPORT_GFX_CGLS |
49401d3a5c86f5 Kenneth Feng                2022-05-31  636  			AMD_CG_SUPPORT_REPEATER_FGCG |
7ece9314a4d3fd James Zhu                   2022-01-05  637  			AMD_CG_SUPPORT_VCN_MGCG |
49401d3a5c86f5 Kenneth Feng                2022-05-31  638  			AMD_CG_SUPPORT_JPEG_MGCG |
49401d3a5c86f5 Kenneth Feng                2022-05-31  639  			AMD_CG_SUPPORT_ATHUB_MGCG |
b4ddb27d1dc734 Kenneth Feng                2022-08-11  640  			AMD_CG_SUPPORT_ATHUB_LS |
b4ddb27d1dc734 Kenneth Feng                2022-08-11  641  			AMD_CG_SUPPORT_IH_CG |
b4ddb27d1dc734 Kenneth Feng                2022-08-11  642  			AMD_CG_SUPPORT_HDP_SD;
ebac66a3283689 James Zhu                   2022-04-15  643  		adev->pg_flags =
143a34a0ac5172 James Zhu                   2022-01-05  644  			AMD_PG_SUPPORT_VCN |
ec9db74e1a4534 James Zhu                   2022-01-05  645  			AMD_PG_SUPPORT_VCN_DPG |
27e3911c40f237 Kenneth Feng                2022-04-15  646  			AMD_PG_SUPPORT_JPEG |
27e3911c40f237 Kenneth Feng                2022-04-15  647  			AMD_PG_SUPPORT_ATHUB |
27e3911c40f237 Kenneth Feng                2022-04-15  648  			AMD_PG_SUPPORT_MMHUB;
92fd2153149fcb Flora Cui                   2022-04-15  649  		adev->external_rev_id = adev->rev_id + 0x10;
92fd2153149fcb Flora Cui                   2022-04-15  650  		break;
11417a927b1c8c Huang Rui                   2021-08-02  651  	case IP_VERSION(11, 0, 1):
47231d5e396a94 Sonny Jiang                 2022-07-21  652  		adev->cg_flags =
8df436d5ccdf7f Tim Huang                   2022-07-29  653  			AMD_CG_SUPPORT_GFX_CGCG |
8df436d5ccdf7f Tim Huang                   2022-07-29  654  			AMD_CG_SUPPORT_GFX_CGLS |
8df436d5ccdf7f Tim Huang                   2022-07-29  655  			AMD_CG_SUPPORT_GFX_MGCG |
8df436d5ccdf7f Tim Huang                   2022-07-29  656  			AMD_CG_SUPPORT_GFX_FGCG |
8df436d5ccdf7f Tim Huang                   2022-07-29  657  			AMD_CG_SUPPORT_REPEATER_FGCG |
8df436d5ccdf7f Tim Huang                   2022-07-29  658  			AMD_CG_SUPPORT_GFX_PERF_CLK |
adcd15dc47dadf Tim Huang                   2022-07-29  659  			AMD_CG_SUPPORT_MC_MGCG |
adcd15dc47dadf Tim Huang                   2022-07-29  660  			AMD_CG_SUPPORT_MC_LS |
7e4a77de08f655 Tim Huang                   2022-07-29  661  			AMD_CG_SUPPORT_HDP_MGCG |
7e4a77de08f655 Tim Huang                   2022-07-29  662  			AMD_CG_SUPPORT_HDP_LS |
8e78c7c4fe29f7 Tim Huang                   2022-07-29  663  			AMD_CG_SUPPORT_ATHUB_MGCG |
8e78c7c4fe29f7 Tim Huang                   2022-07-29  664  			AMD_CG_SUPPORT_ATHUB_LS |
fa0bbd3be91dd4 Tim Huang                   2022-07-29  665  			AMD_CG_SUPPORT_IH_CG |
9407feacd2e19b Tim Huang                   2022-08-15  666  			AMD_CG_SUPPORT_BIF_MGCG |
9407feacd2e19b Tim Huang                   2022-08-15  667  			AMD_CG_SUPPORT_BIF_LS |
47231d5e396a94 Sonny Jiang                 2022-07-21  668  			AMD_CG_SUPPORT_VCN_MGCG |
47231d5e396a94 Sonny Jiang                 2022-07-21  669  			AMD_CG_SUPPORT_JPEG_MGCG;
47231d5e396a94 Sonny Jiang                 2022-07-21  670  		adev->pg_flags =
dc0a096bcc1d65 Tim Huang                   2022-07-29  671  			AMD_PG_SUPPORT_GFX_PG |
e626d9b9c6e038 Sonny Jiang                 2022-09-30  672  			AMD_PG_SUPPORT_VCN |
0b37f47494099e Sonny Jiang                 2022-09-29  673  			AMD_PG_SUPPORT_VCN_DPG |
47231d5e396a94 Sonny Jiang                 2022-07-21  674  			AMD_PG_SUPPORT_JPEG;
11417a927b1c8c Huang Rui                   2021-08-02  675  		adev->external_rev_id = adev->rev_id + 0x1;
11417a927b1c8c Huang Rui                   2021-08-02  676  		break;
6b46251c506799 Hawking Zhang               2022-06-28  677  	case IP_VERSION(11, 0, 3):
0f05a2e5286210 Sonny Jiang                 2022-08-04  678  		adev->cg_flags = AMD_CG_SUPPORT_VCN_MGCG |
4ecdb30ec49d76 Kenneth Feng                2022-09-07  679  			AMD_CG_SUPPORT_JPEG_MGCG |
4ecdb30ec49d76 Kenneth Feng                2022-09-07  680  			AMD_CG_SUPPORT_GFX_CGCG |
4ecdb30ec49d76 Kenneth Feng                2022-09-07  681  			AMD_CG_SUPPORT_GFX_CGLS |
4ecdb30ec49d76 Kenneth Feng                2022-09-07  682  			AMD_CG_SUPPORT_REPEATER_FGCG |
20e6220b4154a5 Evan Quan                   2023-01-28  683  			AMD_CG_SUPPORT_GFX_MGCG |
ad1cebb6f0fbc2 Kenneth Feng                2023-02-03  684  			AMD_CG_SUPPORT_HDP_SD |
ad1cebb6f0fbc2 Kenneth Feng                2023-02-03  685  			AMD_CG_SUPPORT_ATHUB_MGCG |
ad1cebb6f0fbc2 Kenneth Feng                2023-02-03  686  			AMD_CG_SUPPORT_ATHUB_LS;
0f05a2e5286210 Sonny Jiang                 2022-08-04  687  		adev->pg_flags = AMD_PG_SUPPORT_VCN |
0f05a2e5286210 Sonny Jiang                 2022-08-04  688  			AMD_PG_SUPPORT_VCN_DPG |
0f05a2e5286210 Sonny Jiang                 2022-08-04  689  			AMD_PG_SUPPORT_JPEG;
6b46251c506799 Hawking Zhang               2022-06-28  690  		adev->external_rev_id = adev->rev_id + 0x20;
6b46251c506799 Hawking Zhang               2022-06-28  691  		break;
311d52367d0a79 Yifan Zhang                 2022-10-12  692  	case IP_VERSION(11, 0, 4):
f2b91e5a7cc036 Tim Huang                   2022-12-05  693  		adev->cg_flags =
f2b91e5a7cc036 Tim Huang                   2022-12-05  694  			AMD_CG_SUPPORT_GFX_CGCG |
f2b91e5a7cc036 Tim Huang                   2022-12-05  695  			AMD_CG_SUPPORT_GFX_CGLS |
f2b91e5a7cc036 Tim Huang                   2022-12-05  696  			AMD_CG_SUPPORT_GFX_MGCG |
f2b91e5a7cc036 Tim Huang                   2022-12-05  697  			AMD_CG_SUPPORT_GFX_FGCG |
f2b91e5a7cc036 Tim Huang                   2022-12-05  698  			AMD_CG_SUPPORT_REPEATER_FGCG |
f2b91e5a7cc036 Tim Huang                   2022-12-05  699  			AMD_CG_SUPPORT_GFX_PERF_CLK |
f2b91e5a7cc036 Tim Huang                   2022-12-05  700  			AMD_CG_SUPPORT_MC_MGCG |
f2b91e5a7cc036 Tim Huang                   2022-12-05  701  			AMD_CG_SUPPORT_MC_LS |
f2b91e5a7cc036 Tim Huang                   2022-12-05  702  			AMD_CG_SUPPORT_HDP_MGCG |
f2b91e5a7cc036 Tim Huang                   2022-12-05  703  			AMD_CG_SUPPORT_HDP_LS |
f2b91e5a7cc036 Tim Huang                   2022-12-05  704  			AMD_CG_SUPPORT_ATHUB_MGCG |
f2b91e5a7cc036 Tim Huang                   2022-12-05  705  			AMD_CG_SUPPORT_ATHUB_LS |
f2b91e5a7cc036 Tim Huang                   2022-12-05  706  			AMD_CG_SUPPORT_IH_CG |
f2b91e5a7cc036 Tim Huang                   2022-12-05  707  			AMD_CG_SUPPORT_BIF_MGCG |
f2b91e5a7cc036 Tim Huang                   2022-12-05  708  			AMD_CG_SUPPORT_BIF_LS |
f2b91e5a7cc036 Tim Huang                   2022-12-05  709  			AMD_CG_SUPPORT_VCN_MGCG |
2a0fe2ca6e9c9b Saleemkhan Jamadar          2022-11-08  710  			AMD_CG_SUPPORT_JPEG_MGCG;
2a0fe2ca6e9c9b Saleemkhan Jamadar          2022-11-08  711  		adev->pg_flags = AMD_PG_SUPPORT_VCN |
9c705b96d25c96 Saleemkhan Jamadar          2022-12-20  712  			AMD_PG_SUPPORT_VCN_DPG |
2a0fe2ca6e9c9b Saleemkhan Jamadar          2022-11-08  713  			AMD_PG_SUPPORT_GFX_PG |
2a0fe2ca6e9c9b Saleemkhan Jamadar          2022-11-08  714  			AMD_PG_SUPPORT_JPEG;
6d99f3f4ea948f Yifan Zhang                 2023-05-10  715  		adev->external_rev_id = adev->rev_id + 0x80;
311d52367d0a79 Yifan Zhang                 2022-10-12  716  		break;
0d1db799e7a8ba Prike Liang                 2022-05-24  717  	case IP_VERSION(11, 5, 0):
cc308acc9baf78 Saleemkhan Jamadar          2023-06-13  718  		adev->cg_flags = AMD_CG_SUPPORT_VCN_MGCG |
31715a86206a44 Li Ma                       2023-08-02  719  			AMD_CG_SUPPORT_JPEG_MGCG |
31715a86206a44 Li Ma                       2023-08-02  720  			AMD_CG_SUPPORT_GFX_CGCG |
31715a86206a44 Li Ma                       2023-08-02  721  			AMD_CG_SUPPORT_GFX_CGLS |
31715a86206a44 Li Ma                       2023-08-02  722  			AMD_CG_SUPPORT_GFX_MGCG |
31715a86206a44 Li Ma                       2023-08-02  723  			AMD_CG_SUPPORT_GFX_FGCG |
31715a86206a44 Li Ma                       2023-08-02  724  			AMD_CG_SUPPORT_REPEATER_FGCG |
31715a86206a44 Li Ma                       2023-08-02  725  			AMD_CG_SUPPORT_GFX_PERF_CLK	|
31715a86206a44 Li Ma                       2023-08-02  726  			AMD_CG_SUPPORT_GFX_3D_CGCG |
31715a86206a44 Li Ma                       2023-08-02  727  			AMD_CG_SUPPORT_GFX_3D_CGLS	|
31715a86206a44 Li Ma                       2023-08-02  728  			AMD_CG_SUPPORT_MC_MGCG |
31715a86206a44 Li Ma                       2023-08-02  729  			AMD_CG_SUPPORT_MC_LS |
31715a86206a44 Li Ma                       2023-08-02  730  			AMD_CG_SUPPORT_HDP_LS |
31715a86206a44 Li Ma                       2023-08-02  731  			AMD_CG_SUPPORT_HDP_DS |
31715a86206a44 Li Ma                       2023-08-02  732  			AMD_CG_SUPPORT_HDP_SD |
31715a86206a44 Li Ma                       2023-08-02  733  			AMD_CG_SUPPORT_ATHUB_MGCG |
31715a86206a44 Li Ma                       2023-08-02  734  			AMD_CG_SUPPORT_ATHUB_LS |
31715a86206a44 Li Ma                       2023-08-02  735  			AMD_CG_SUPPORT_IH_CG |
31715a86206a44 Li Ma                       2023-08-02  736  			AMD_CG_SUPPORT_BIF_MGCG |
31715a86206a44 Li Ma                       2023-08-02  737  			AMD_CG_SUPPORT_BIF_LS;
cc308acc9baf78 Saleemkhan Jamadar          2023-06-13  738  		adev->pg_flags = AMD_PG_SUPPORT_VCN_DPG |
0a119d53f74a5f Saleemkhan Jamadar          2023-12-11  739  			AMD_PG_SUPPORT_JPEG_DPG |
6be6e74b7d58d4 Saleemkhan Jamadar          2023-07-27  740  			AMD_PG_SUPPORT_VCN |
6be6e74b7d58d4 Saleemkhan Jamadar          2023-07-27  741  			AMD_PG_SUPPORT_JPEG |
cc308acc9baf78 Saleemkhan Jamadar          2023-06-13  742  			AMD_PG_SUPPORT_GFX_PG;
526b184e888371 Yifan Zhang                 2024-04-07  743  		if (adev->rev_id == 0)
526b184e888371 Yifan Zhang                 2024-04-07  744  			adev->external_rev_id = 0x1;
526b184e888371 Yifan Zhang                 2024-04-07  745  		else
526b184e888371 Yifan Zhang                 2024-04-07  746  			adev->external_rev_id = adev->rev_id + 0x10;
0d1db799e7a8ba Prike Liang                 2022-05-24  747  		break;
e97199565760bf Yifan Zhang                 2024-01-04  748  	case IP_VERSION(11, 5, 1):
455918cf2887cd Tim Huang                   2024-01-30  749  		adev->cg_flags =
455918cf2887cd Tim Huang                   2024-01-30  750  			AMD_CG_SUPPORT_GFX_CGCG |
455918cf2887cd Tim Huang                   2024-01-30  751  			AMD_CG_SUPPORT_GFX_CGLS |
455918cf2887cd Tim Huang                   2024-01-30  752  			AMD_CG_SUPPORT_GFX_MGCG |
455918cf2887cd Tim Huang                   2024-01-30  753  			AMD_CG_SUPPORT_GFX_FGCG |
455918cf2887cd Tim Huang                   2024-01-30  754  			AMD_CG_SUPPORT_REPEATER_FGCG |
455918cf2887cd Tim Huang                   2024-01-30  755  			AMD_CG_SUPPORT_GFX_PERF_CLK	|
455918cf2887cd Tim Huang                   2024-01-30  756  			AMD_CG_SUPPORT_GFX_3D_CGCG |
455918cf2887cd Tim Huang                   2024-01-30  757  			AMD_CG_SUPPORT_GFX_3D_CGLS	|
455918cf2887cd Tim Huang                   2024-01-30  758  			AMD_CG_SUPPORT_MC_MGCG |
455918cf2887cd Tim Huang                   2024-01-30  759  			AMD_CG_SUPPORT_MC_LS |
455918cf2887cd Tim Huang                   2024-01-30  760  			AMD_CG_SUPPORT_HDP_LS |
455918cf2887cd Tim Huang                   2024-01-30  761  			AMD_CG_SUPPORT_HDP_DS |
455918cf2887cd Tim Huang                   2024-01-30  762  			AMD_CG_SUPPORT_HDP_SD |
455918cf2887cd Tim Huang                   2024-01-30  763  			AMD_CG_SUPPORT_ATHUB_MGCG |
455918cf2887cd Tim Huang                   2024-01-30  764  			AMD_CG_SUPPORT_ATHUB_LS |
455918cf2887cd Tim Huang                   2024-01-30  765  			AMD_CG_SUPPORT_IH_CG |
455918cf2887cd Tim Huang                   2024-01-30  766  			AMD_CG_SUPPORT_BIF_MGCG |
84eaa2c2c655e3 Veerabadhran Gopalakrishnan 2024-01-30  767  			AMD_CG_SUPPORT_BIF_LS |
84eaa2c2c655e3 Veerabadhran Gopalakrishnan 2024-01-30  768  			AMD_CG_SUPPORT_VCN_MGCG |
84eaa2c2c655e3 Veerabadhran Gopalakrishnan 2024-01-30  769  			AMD_CG_SUPPORT_JPEG_MGCG;
455918cf2887cd Tim Huang                   2024-01-30  770  		adev->pg_flags =
84eaa2c2c655e3 Veerabadhran Gopalakrishnan 2024-01-30  771  			AMD_PG_SUPPORT_GFX_PG |
84eaa2c2c655e3 Veerabadhran Gopalakrishnan 2024-01-30  772  			AMD_PG_SUPPORT_VCN |
84eaa2c2c655e3 Veerabadhran Gopalakrishnan 2024-01-30  773  			AMD_PG_SUPPORT_VCN_DPG |
84eaa2c2c655e3 Veerabadhran Gopalakrishnan 2024-01-30  774  			AMD_PG_SUPPORT_JPEG;
e97199565760bf Yifan Zhang                 2024-01-04  775  		adev->external_rev_id = adev->rev_id + 0xc1;
e97199565760bf Yifan Zhang                 2024-01-04  776  		break;
43e4cc22994290 Tim Huang                   2024-05-14  777  	case IP_VERSION(11, 5, 2):
43e4cc22994290 Tim Huang                   2024-05-14  778  		adev->cg_flags = AMD_CG_SUPPORT_VCN_MGCG |
43e4cc22994290 Tim Huang                   2024-05-14  779  			AMD_CG_SUPPORT_JPEG_MGCG |
43e4cc22994290 Tim Huang                   2024-05-14  780  			AMD_CG_SUPPORT_GFX_CGCG |
43e4cc22994290 Tim Huang                   2024-05-14  781  			AMD_CG_SUPPORT_GFX_CGLS |
43e4cc22994290 Tim Huang                   2024-05-14  782  			AMD_CG_SUPPORT_GFX_MGCG |
43e4cc22994290 Tim Huang                   2024-05-14  783  			AMD_CG_SUPPORT_GFX_FGCG |
43e4cc22994290 Tim Huang                   2024-05-14  784  			AMD_CG_SUPPORT_REPEATER_FGCG |
43e4cc22994290 Tim Huang                   2024-05-14  785  			AMD_CG_SUPPORT_GFX_PERF_CLK	|
43e4cc22994290 Tim Huang                   2024-05-14  786  			AMD_CG_SUPPORT_GFX_3D_CGCG |
43e4cc22994290 Tim Huang                   2024-05-14  787  			AMD_CG_SUPPORT_GFX_3D_CGLS	|
43e4cc22994290 Tim Huang                   2024-05-14  788  			AMD_CG_SUPPORT_MC_MGCG |
43e4cc22994290 Tim Huang                   2024-05-14  789  			AMD_CG_SUPPORT_MC_LS |
43e4cc22994290 Tim Huang                   2024-05-14  790  			AMD_CG_SUPPORT_HDP_LS |
43e4cc22994290 Tim Huang                   2024-05-14  791  			AMD_CG_SUPPORT_HDP_DS |
43e4cc22994290 Tim Huang                   2024-05-14  792  			AMD_CG_SUPPORT_HDP_SD |
43e4cc22994290 Tim Huang                   2024-05-14  793  			AMD_CG_SUPPORT_ATHUB_MGCG |
43e4cc22994290 Tim Huang                   2024-05-14  794  			AMD_CG_SUPPORT_ATHUB_LS |
43e4cc22994290 Tim Huang                   2024-05-14  795  			AMD_CG_SUPPORT_IH_CG |
43e4cc22994290 Tim Huang                   2024-05-14  796  			AMD_CG_SUPPORT_BIF_MGCG |
43e4cc22994290 Tim Huang                   2024-05-14  797  			AMD_CG_SUPPORT_BIF_LS;
b6ad1091666732 Saleemkhan Jamadar          2024-07-04  798  		adev->pg_flags = AMD_PG_SUPPORT_VCN_DPG |
b6ad1091666732 Saleemkhan Jamadar          2024-07-04  799  			AMD_PG_SUPPORT_VCN |
b6ad1091666732 Saleemkhan Jamadar          2024-07-04  800  			AMD_PG_SUPPORT_JPEG_DPG |
43e4cc22994290 Tim Huang                   2024-05-14  801  			AMD_PG_SUPPORT_JPEG |
43e4cc22994290 Tim Huang                   2024-05-14  802  			AMD_PG_SUPPORT_GFX_PG;
43e4cc22994290 Tim Huang                   2024-05-14  803  		adev->external_rev_id = adev->rev_id + 0x40;
43e4cc22994290 Tim Huang                   2024-05-14  804  		break;
b784faeba229ad Tim Huang                   2024-12-05  805  	case IP_VERSION(11, 5, 3):
6d437d5203c54a Tim Huang                   2025-01-02  806  		adev->cg_flags = AMD_CG_SUPPORT_VCN_MGCG |
6d437d5203c54a Tim Huang                   2025-01-02  807  			AMD_CG_SUPPORT_JPEG_MGCG |
6d437d5203c54a Tim Huang                   2025-01-02  808  			AMD_CG_SUPPORT_GFX_CGCG |
b784faeba229ad Tim Huang                   2024-12-05  809  			AMD_CG_SUPPORT_GFX_CGLS |
b784faeba229ad Tim Huang                   2024-12-05  810  			AMD_CG_SUPPORT_GFX_MGCG |
b784faeba229ad Tim Huang                   2024-12-05  811  			AMD_CG_SUPPORT_GFX_FGCG |
b784faeba229ad Tim Huang                   2024-12-05  812  			AMD_CG_SUPPORT_REPEATER_FGCG |
b784faeba229ad Tim Huang                   2024-12-05  813  			AMD_CG_SUPPORT_GFX_PERF_CLK |
b784faeba229ad Tim Huang                   2024-12-05  814  			AMD_CG_SUPPORT_GFX_3D_CGCG |
b784faeba229ad Tim Huang                   2024-12-05  815  			AMD_CG_SUPPORT_GFX_3D_CGLS |
b784faeba229ad Tim Huang                   2024-12-05  816  			AMD_CG_SUPPORT_MC_MGCG |
b784faeba229ad Tim Huang                   2024-12-05  817  			AMD_CG_SUPPORT_MC_LS |
b784faeba229ad Tim Huang                   2024-12-05  818  			AMD_CG_SUPPORT_HDP_LS |
b784faeba229ad Tim Huang                   2024-12-05  819  			AMD_CG_SUPPORT_HDP_DS |
b784faeba229ad Tim Huang                   2024-12-05  820  			AMD_CG_SUPPORT_HDP_SD |
b784faeba229ad Tim Huang                   2024-12-05  821  			AMD_CG_SUPPORT_ATHUB_MGCG |
b784faeba229ad Tim Huang                   2024-12-05  822  			AMD_CG_SUPPORT_ATHUB_LS |
b784faeba229ad Tim Huang                   2024-12-05  823  			AMD_CG_SUPPORT_IH_CG |
b784faeba229ad Tim Huang                   2024-12-05  824  			AMD_CG_SUPPORT_BIF_MGCG |
b784faeba229ad Tim Huang                   2024-12-05  825  			AMD_CG_SUPPORT_BIF_LS;
6d437d5203c54a Tim Huang                   2025-01-02  826  		adev->pg_flags = AMD_PG_SUPPORT_VCN_DPG |
6d437d5203c54a Tim Huang                   2025-01-02  827  			AMD_PG_SUPPORT_VCN |
6d437d5203c54a Tim Huang                   2025-01-02  828  			AMD_PG_SUPPORT_JPEG_DPG |
6d437d5203c54a Tim Huang                   2025-01-02  829  			AMD_PG_SUPPORT_JPEG |
6d437d5203c54a Tim Huang                   2025-01-02  830  			AMD_PG_SUPPORT_GFX_PG;
b784faeba229ad Tim Huang                   2024-12-05  831  		adev->external_rev_id = adev->rev_id + 0x50;
b784faeba229ad Tim Huang                   2024-12-05  832  		break;
47ae1f938d1259 Tim Huang                   2024-12-11  833  	case IP_VERSION(11, 5, 4):
637fd8dedf10f8 Saleemkhan Jamadar          2025-10-05  834  		adev->cg_flags = AMD_CG_SUPPORT_VCN_MGCG |
637fd8dedf10f8 Saleemkhan Jamadar          2025-10-05  835  			AMD_CG_SUPPORT_JPEG_MGCG;
637fd8dedf10f8 Saleemkhan Jamadar          2025-10-05  836  		adev->pg_flags = AMD_PG_SUPPORT_VCN |
637fd8dedf10f8 Saleemkhan Jamadar          2025-10-05  837  			AMD_PG_SUPPORT_JPEG;
47ae1f938d1259 Tim Huang                   2024-12-11  838  		adev->external_rev_id = adev->rev_id + 0x1;
47ae1f938d1259 Tim Huang                   2024-12-11 @839                 break;
71199aa47bbcce Stanley.Yang                2022-04-01  840  	default:
71199aa47bbcce Stanley.Yang                2022-04-01  841  		/* FIXME: not supported yet */
71199aa47bbcce Stanley.Yang                2022-04-01  842  		return -EINVAL;
71199aa47bbcce Stanley.Yang                2022-04-01  843  	}
71199aa47bbcce Stanley.Yang                2022-04-01  844  
39dd895d05002d YuBiao Wang                 2022-11-30  845  	if (amdgpu_sriov_vf(adev)) {
0cfce2401e1553 Yiqing Yao                  2022-10-28  846  		amdgpu_virt_init_setting(adev);
39dd895d05002d YuBiao Wang                 2022-11-30  847  		xgpu_nv_mailbox_set_irq_funcs(adev);
39dd895d05002d YuBiao Wang                 2022-11-30  848  	}
0cfce2401e1553 Yiqing Yao                  2022-10-28  849  
71199aa47bbcce Stanley.Yang                2022-04-01  850  	return 0;
71199aa47bbcce Stanley.Yang                2022-04-01  851  }
71199aa47bbcce Stanley.Yang                2022-04-01  852  

:::::: The code at line 839 was first introduced by commit
:::::: 47ae1f938d1259d1e10e885dc64fe93f92f0ac7c drm/amdgpu: add support for GC IP version 11.5.4

:::::: TO: Tim Huang <tim.huang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
