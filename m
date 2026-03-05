Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02AA3947B1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720409; cv=none; b=Byva04Yr+7vLzzODKE4H0AoXD2YVg92Wv9TYkL5IYZnP8tdaS1nyez/0oGSSHZ6o6BjkIKKLdrCW6epMGCh3R0ANz2MV0PZWlinGGexK5d9ZF2MpYP0TMQ22imPcec9GebtYKyH2OdxnB1qHxhgdVfhzqt7mfOW4OCQm5uWZk8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720409; c=relaxed/simple;
	bh=b8AYffq2MDymJ4+t2YPcaSSJcUCrWjjZwk3iDcat2RI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B8bgd5TVWpPOn/aSPbR0Bo67+tT0zSqWvRaTfMcwt9AEsee737sd4c/LL2zGmlTuvMDm/0X+vyqZ1l2O7GhzRP0ji6zs0v6fVyoEVxWmJz/T9ElXe1z0IJQMV9bZuqh4ghd54OVLPQWvUd+G1w+OvN7047kauczGF2Wd8/f1VPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqIQ4I0i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqIQ4I0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772720407; x=1804256407;
  h=date:from:to:cc:subject:message-id;
  bh=b8AYffq2MDymJ4+t2YPcaSSJcUCrWjjZwk3iDcat2RI=;
  b=eqIQ4I0i3KYXIKBnzFEmtDgMOtCMKO296b3G1JxJHp91+0Qk6KecyQ0X
   eQpk8JkiuaBj0zPr8RTBEhIU3WDTDUfjRdrkcYgbGZ4bgeQVV0NBxFexY
   nz9b/X8apE4I3TWlEFgzlMZIa1tlXTyqvNwa5UGgzyHn2k7PqwL+XdbgX
   TcNjGYTCAOkH3jTdIgRzaeQmwU9/JEH23JLHVwMln1qU/cdg80wjLww3O
   xeb9J156mirvjpZdoJBxOvleNBgyCMVluGLea7+eQgMAkv9GkLHRbxIfa
   bAfIOxrGW1tQ+QSBWXrb14jlqF4j/goCLtuLD99PPg+ii6DNweaR1llTw
   Q==;
X-CSE-ConnectionGUID: 8URycfQ9S+6ewzn2j+kfmg==
X-CSE-MsgGUID: CAWLXWaDTkuVavfr/32OJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73007267"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73007267"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:20:07 -0800
X-CSE-ConnectionGUID: L3vxWZY6ReSvlfWOi3N5wQ==
X-CSE-MsgGUID: kPigkSc6RFWAlqQV4xz0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="245154776"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Mar 2026 06:20:06 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy9YZ-000000000j4-2hmX;
	Thu, 05 Mar 2026 14:20:03 +0000
Date: Thu, 05 Mar 2026 22:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.12.y 955/955]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:366
 kfd_dbg_set_mes_debug_mode() warn: inconsistent indenting
Message-ID: <202603052239.SSi2BKcz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.12.y
head:   c1924e059c728edf4138c6343fafb2c6d234ac35
commit: 3e279ecb4233f85794cd1d751f1affbd852d1cd9 [955/955] drm/amdkfd: fixed page fault when enable MES shader debugger
config: arm64-randconfig-r071-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052239.SSi2BKcz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052239.SSi2BKcz-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:366 kfd_dbg_set_mes_debug_mode() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:445 kfd_dbg_trap_clear_dev_address_watch() error: buffer overflow 'pdd->watch_points' 4 <= u32max
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:794 kfd_dbg_trap_enable() warn: fd re-used after fget(): 'fd'

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
