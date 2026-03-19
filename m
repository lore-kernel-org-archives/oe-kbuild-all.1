Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79226B95B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 01:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773882283; cv=none; b=Mvp0ASlgS8mcDIN0KF7OOZjKuNGyraSrxjlLUfr0iMoYchjfMUCugxgWi04F3M/LhPAcQlXL7hkBNRGEPM855VGWSo6CyxVVN2IsOqDRHkRtoV5iKjfGrBXZvNZEKjmgqG62eSJ9JcKBUeDJau6iGeFt9N5GKVpcd+/nrXdQQII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773882283; c=relaxed/simple;
	bh=3tB63GbKoIfqeNnQX/CtEKb5m/Um6W51P90RWOyYfCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MRenOVIx7MVWR4/r1eHSyOrm2ysa7rt4EBhOMF9q/qd0RjQhahKT4t6yHTPlEPhIUPh9Bj8dE0sLlGtCzg0/uyGHkLkVKsY4RfP1SY1pk2OUVV4to0BmTNLS8Cb5kGd0SR3wEeDIy+WbvcBKaEypztrvDS09gen4BV0Sh01EfYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcsW3QJT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcsW3QJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773882281; x=1805418281;
  h=date:from:to:cc:subject:message-id;
  bh=3tB63GbKoIfqeNnQX/CtEKb5m/Um6W51P90RWOyYfCs=;
  b=ZcsW3QJTQQSJfJ6bprvuIRfLfTkMuuwRtEP/fMoKTcyS+oHWp7Pbr+au
   9tGxwixY+SXi7UfB2X/g/6bTqX1xpM0vdGBFq+iE+ywU2Cz71PMbKixPU
   45MO88WMEvuqbZfYvTGpLpuIGwMn/+KOr++f8IR3Zc3pzlsIF14159/7a
   8rjAcNhr62U9x5RmKlgu0tPKP91iNSHk1yGeD3zWOS2h2E4W3Nks8iTHD
   9+uozRtIoTrT22LwYKjZdVFtyhi9Wp5nZZrJi9RIUGp15+t8SSl+Cqhh3
   ItCzSFAd/JQSvkFlMSgPF6r2jMeUHSgsxbWete+jqjoi38cE4DTsp2a/R
   Q==;
X-CSE-ConnectionGUID: jgd3Wx38TayRPrZnVajr1w==
X-CSE-MsgGUID: uYoZCXfCQO2MZsAdgaKzcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74838049"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="74838049"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 18:04:41 -0700
X-CSE-ConnectionGUID: MPEh2Tb6QBadnDNnnHt8zg==
X-CSE-MsgGUID: kK9mLJBXRyegMW9YU0H78w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="218317235"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Mar 2026 18:04:39 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w31oS-0000000009v-1iGp;
	Thu, 19 Mar 2026 01:04:36 +0000
Date: Thu, 19 Mar 2026 09:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sonny Jiang <sonjiang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Subject: [linux-next:master 6581/7246]
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:274 jpeg_v5_0_2_hw_fini() warn:
 inconsistent indenting
Message-ID: <202603190931.mQLtG2LC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 855e3e19f69c0133a98dfae3ec9d26089cd50e77 [6581/7246] drm/amdgpu: Add JPEG_v5_0_2 IP block
config: i386-randconfig-141-20260319 (https://download.01.org/0day-ci/archive/20260319/202603190931.mQLtG2LC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190931.mQLtG2LC-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:274 jpeg_v5_0_2_hw_fini() warn: inconsistent indenting

vim +274 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c

   259	
   260	/**
   261	 * jpeg_v5_0_2_hw_fini - stop the hardware block
   262	 *
   263	 * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
   264	 *
   265	 * Stop the JPEG block, mark ring as not ready any more
   266	 */
   267	static int jpeg_v5_0_2_hw_fini(struct amdgpu_ip_block *ip_block)
   268	{
   269		struct amdgpu_device *adev = ip_block->adev;
   270		int ret = 0;
   271	
   272		cancel_delayed_work_sync(&adev->jpeg.idle_work);
   273	
 > 274			if (adev->jpeg.cur_state != AMD_PG_STATE_GATE)
   275				ret = jpeg_v5_0_2_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
   276	
   277		return ret;
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
