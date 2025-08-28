Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD673FC7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 23:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756423885; cv=none; b=dHtvk9FRya+/aPSvI8T9wDVqHUQYFUV1oCX8h0Er7Um9AnfL05mm/1V2Omcwwn3bLW5DtXN0iH+TY7yjdAazaFmILm6vAHz5Gb3sbsBl7SHe+DbjBXkv5RnyVtX6rNChpjk7JhRT9KnpfDAr3IBP/+Ejeia24DzDHU74Hr8zhFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756423885; c=relaxed/simple;
	bh=wpQYhp19gYu1sHbc2fsYdSq9yxvmOJDDf8ziUELgjao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0qJEOor7g28JIHCpas/g++puU1wuTJlXkRg8GDAQ4OjCK/J+YENLgktb91l4lt3A1Y1tHu2gQ/1ivt46dAu1mCcNQx7JWgspvT+xVK3UuxZBcsGTK2+L+Sl0OTRcDIN7nj5xWTf1E5DnuwincfZD2DjFdZIMwVjgCzL6SCmRvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnrI9lNR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnrI9lNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756423884; x=1787959884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wpQYhp19gYu1sHbc2fsYdSq9yxvmOJDDf8ziUELgjao=;
  b=hnrI9lNR1oc7w8JqKBXlMMN+vOkaNQcgAbnOHZNK2tnA/NkYH/JISB2Z
   LjiTRbLUrGIczZ7cpIV3s0/6zIpv/rYdCOhey1bx80Encepr7We7pBWL8
   NVkJqf0mLp71SsHPC6xF0v8VxBIB3N6t3BYpR2M5kGvmay5SLKgTtEPrY
   d9xhW556xjHJjkGzCvU7WKwsGOQQyVMfVzQth1Jzn55eHENg/Ol6cdDRi
   1B9qLed4T6moV25yic+TucaF/XhHMtZ5eZp3QW0+C5ZDsAZPrldQAf3sX
   H+csK+xpAb62EDkHPBszRBdCoB/Gj/ziRWEIBZQ4Sg4dZUUPyV96q3dwB
   w==;
X-CSE-ConnectionGUID: p6zZwV47R4+BiGGufqboog==
X-CSE-MsgGUID: +M4nDdrERVaq37FeCNWMGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58416946"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58416946"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 16:31:23 -0700
X-CSE-ConnectionGUID: 9EXuiNonSneATulo3FGtJQ==
X-CSE-MsgGUID: v2uv2R72Q+W1SbHzZX3BIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169817804"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Aug 2025 16:31:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urm5P-000UAV-1J;
	Thu, 28 Aug 2025 23:31:19 +0000
Date: Fri, 29 Aug 2025 07:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: Shaoyun Liu <shaoyun.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 4708/5019]
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c:915 mes_v12_0_inv_tlbs_pasid() warn:
 unsigned 'mes_inv_tlbs.invalidate_tlbs.hub_id' is never less than zero.
Message-ID: <202508290749.ti6u3cLL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8cd53fb40a304576fa86ba985f3045d5c55b0ae3
commit: 87e65052616c53676a4f9ae3def290fc489215e2 [4708/5019] drm/amd/amdgpu : Use the MES INV_TLBS API for tlb invalidation on gfx12
config: x86_64-randconfig-161-20250828 (https://download.01.org/0day-ci/archive/20250829/202508290749.ti6u3cLL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508290749.ti6u3cLL-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/mes_v12_0.c:915 mes_v12_0_inv_tlbs_pasid() warn: unsigned 'mes_inv_tlbs.invalidate_tlbs.hub_id' is never less than zero.
drivers/gpu/drm/amd/amdgpu/mes_v12_0.c:915 mes_v12_0_inv_tlbs_pasid() warn: error code type promoted to positive: 'mes_inv_tlbs.invalidate_tlbs.hub_id'

vim +915 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c

   897	
   898	static int mes_v12_0_inv_tlbs_pasid(struct amdgpu_mes *mes,
   899					    struct mes_inv_tlbs_pasid_input *input)
   900	{
   901		union MESAPI__INV_TLBS mes_inv_tlbs;
   902	
   903		memset(&mes_inv_tlbs, 0, sizeof(mes_inv_tlbs));
   904	
   905		mes_inv_tlbs.header.type = MES_API_TYPE_SCHEDULER;
   906		mes_inv_tlbs.header.opcode = MES_SCH_API_INV_TLBS;
   907		mes_inv_tlbs.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
   908	
   909		mes_inv_tlbs.invalidate_tlbs.inv_sel = 0;
   910		mes_inv_tlbs.invalidate_tlbs.flush_type = input->flush_type;
   911		mes_inv_tlbs.invalidate_tlbs.inv_sel_id = input->pasid;
   912	
   913		/*convert amdgpu_mes_hub_id to mes expected hub_id */
   914		mes_inv_tlbs.invalidate_tlbs.hub_id = mes_v12_inv_tlb_convert_hub_id(input->hub_id);
 > 915		if (mes_inv_tlbs.invalidate_tlbs.hub_id < 0)
   916			return -EINVAL;
   917		return mes_v12_0_submit_pkt_and_poll_completion(mes, AMDGPU_MES_KIQ_PIPE,
   918				&mes_inv_tlbs, sizeof(mes_inv_tlbs),
   919				offsetof(union MESAPI__INV_TLBS, api_status));
   920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
