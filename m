Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD421FECD4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352399; cv=none; b=CePyzAZ6W3qNmh4CEpTy0s+p18aBoZsrcVcn6Mvz3vSF1UPmJnJfCNmJ01Ta68ggbFRwbRhSlMXZ1U0a9xtySJyETesQ/ld7Zr5acJVEhp8f0lOVqKb2T7/P4X4pHng92QBH+zyyFPBIKEKAlEPW/Vplya0BcXkcAHUf/WJ+8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352399; c=relaxed/simple;
	bh=sNwMl3CEdtX2fA1nEcAum8Bvf/UwuvYY2y0ob74IBKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UIiNCLO34XMyMZG0C9O8xX21FqsyEHNUKkTGPpHNW6hB102eb8cRb/iEiKPZ7xO39fRTJEnppOl7QqEQCuRDldQykDGIMqpT5y28sRbOehPCptKL/fslqgmpqfiVTC7cxGNPSJ5j357mp+4yR5y7ZUm+1rmoZx1wCfw1SC0qb6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FugFYeMC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FugFYeMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736352397; x=1767888397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sNwMl3CEdtX2fA1nEcAum8Bvf/UwuvYY2y0ob74IBKw=;
  b=FugFYeMCE/X8Bh7ZDb0ngdSaFbfffhnaqssK/E4TZGh1SfGAk0B/MO11
   Ej2jPetXF9QruY6FzfKnKsFTqBaoI1BY3jk39bl3bouKe5eeFFtr6BYnV
   QnTF5j4Wos5BfpyTCml9PcgEmQNlaW16lFpiSUBigcp29gShsINkHS446
   4FF5k3PgwebwiExopk2prsW8C1QHMIkQ6WdmAkUpCQE1u0I6NRMTVr00I
   QfRX3iyG2F8Hjwt83RPVBCN/Z+/LKvmbcioRS1HSY8wmTeV6opNYNjCtb
   u5MrHDukzRvEWpv1X+z1pRo2/S730QnOT1dZpfx4ti8cCa+IQtQGPL8AD
   A==;
X-CSE-ConnectionGUID: FgHeaoU4Qoi24eXw3+7TrA==
X-CSE-MsgGUID: IJ+gXpTaSNCD7CFxO5N4Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36747673"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36747673"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 08:05:41 -0800
X-CSE-ConnectionGUID: m+wOknO0RaSo0h+yWuDL/g==
X-CSE-MsgGUID: p8QE69xCQmWZ1kUPIKj+4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103001629"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2025 08:05:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVYYq-000GKB-1o;
	Wed, 08 Jan 2025 16:05:36 +0000
Date: Thu, 9 Jan 2025 00:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Jesse.zhang" <Jesse.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Jesse Zhang <jesse.zhang@amd.com>
Subject: [linux-next:master 5915/7110]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:366
 kfd_dbg_set_mes_debug_mode() warn: inconsistent indenting
Message-ID: <202501082311.sZWdojto-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b90165c7d1173e0f65538d25aa718ec7ecdd5d6
commit: 5b231f5bc9ff02ec5737f2ec95cdf15ac95088e9 [5915/7110] drm/amdkfd: fixed page fault when enable MES shader debugger
config: x86_64-randconfig-161-20250107 (https://download.01.org/0day-ci/archive/20250108/202501082311.sZWdojto-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082311.sZWdojto-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:366 kfd_dbg_set_mes_debug_mode() warn: inconsistent indenting

vim +366 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c

   348	
   349	int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd, bool sq_trap_en)
   350	{
   351		uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
   352		uint32_t flags = pdd->process->dbg_flags;
   353		struct amdgpu_device *adev = pdd->dev->adev;
   354		int r;
   355	
   356		if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
   357			return 0;
   358	
   359		if (!pdd->proc_ctx_cpu_ptr) {
   360				r = amdgpu_amdkfd_alloc_gtt_mem(adev,
   361					AMDGPU_MES_PROC_CTX_SIZE,
   362					&pdd->proc_ctx_bo,
   363					&pdd->proc_ctx_gpu_addr,
   364					&pdd->proc_ctx_cpu_ptr,
   365					false);
 > 366			if (r) {
   367				dev_err(adev->dev,
   368				"failed to allocate process context bo\n");
   369				return r;
   370			}
   371			memset(pdd->proc_ctx_cpu_ptr, 0, AMDGPU_MES_PROC_CTX_SIZE);
   372		}
   373	
   374		return amdgpu_mes_set_shader_debugger(pdd->dev->adev, pdd->proc_ctx_gpu_addr, spi_dbg_cntl,
   375							pdd->watch_points, flags, sq_trap_en);
   376	}
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
