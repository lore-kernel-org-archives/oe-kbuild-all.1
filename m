Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2803840B6D4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 05:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786599613; cv=none; b=NkcDjshiDLYyLNu83CIfXcy8VtwWgiMj4JpHYIrrt+a7wMDx08H8nSTcGfgfwCryapSugXj47A1UM9UrHr3CCb81N73i2PrISZxAHqrOpTfIivLBDs2cUxaBVbyJuKYAACHAsRzA3ezCrrtfgOm0vNi0sF5dLcWqkZQT7UwSI4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786599613; c=relaxed/simple;
	bh=rgEjYL2WOERxj19fJHx/yhL7N6A9WZnBB7BrxeQMj5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KHQroL0A3tdowyOVsy8vYcWjug+Uas0PErjKDoEm6eci7FCD2fxpkgJFFhcZqb7hFQZgCb3qHngVpXMyN7e2ELu7ZplOJFMbWcOW2YHxSbScKVW7sCTOXZarfvH0J1SqD5csD84drnWbYP3U+gHR9PQ5Xhef+fSqax97geHj5KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWXTdd1S; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWXTdd1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786599613; x=1818135613;
  h=date:from:to:cc:subject:message-id;
  bh=rgEjYL2WOERxj19fJHx/yhL7N6A9WZnBB7BrxeQMj5w=;
  b=EWXTdd1STLbdBGVEaPzT2gZ9eOnHUm6j4tkB3es04tq0KmbObBoTewWA
   dzreQkVwApORYQsvN5xtEMfB//VSRMyWj/aD8Tfy42rv8Y1/v7PhsPYdw
   rlE4GXjIqv2+aJZc2OYZwPAZq39AIQqgOhKhIAQq2K1sB/kfovMZKYWJL
   sHPocAmBlGfbqWPaIF/XZuKuJwEMReqfnLKeHfs4G1cP1Jg7E+4LmiYxX
   XVdxXbpLXZOI76kJeNgwUby+ZY366oVfg4aHST64aZ1Qp00rPUoZF4F/4
   FKp29xK15nQCvZSLiAKsCIIOFC/FbO86tqRynyo/GPk5sPZjsMVchgdJN
   A==;
X-CSE-ConnectionGUID: VFF/t44xQfSB5T59TlsTAA==
X-CSE-MsgGUID: T1Wc1B/kRQiQG6nFlGI9oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98680435"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="98680435"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 22:40:10 -0700
X-CSE-ConnectionGUID: VJXMWnyeTSC7FLH0A1xS/A==
X-CSE-MsgGUID: c0pxLD6aQYSsKYn0kcIQgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="264425068"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2026 22:40:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuOAf-00000000Swx-1dN2;
	Thu, 13 Aug 2026 05:40:05 +0000
Date: Thu, 13 Aug 2026 13:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: Perry Yuan <perry.yuan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:1394:32-44:
 opportunity for str_enabled_disabled(ptl -> enabled)
Message-ID: <202608131327.v2Vfrqry-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
commit: d51a0439358d4eacd8beb39df619998d8340d232 drm/amdgpu: add sysfs for Peak Tops Limiter (PTL)
date:   3 months ago
config: s390-randconfig-r062-20260812 (https://download.01.org/0day-ci/archive/20260813/202608131327.v2Vfrqry-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d51a0439358d ("drm/amdgpu: add sysfs for Peak Tops Limiter (PTL)")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131327.v2Vfrqry-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:1394:32-44: opportunity for str_enabled_disabled(ptl -> enabled)

vim +1394 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c

  1387	
  1388	static ssize_t ptl_enable_show(struct device *dev, struct device_attribute *attr, char *buf)
  1389	{
  1390		struct drm_device *ddev = dev_get_drvdata(dev);
  1391		struct amdgpu_device *adev = drm_to_adev(ddev);
  1392		struct amdgpu_ptl *ptl = &adev->psp.ptl;
  1393	
> 1394		return sysfs_emit(buf, "%s\n", ptl->enabled ? "enabled" : "disabled");
  1395	}
  1396	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
