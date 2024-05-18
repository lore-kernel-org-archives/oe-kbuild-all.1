Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F22748CC7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716047804; cv=none; b=aOhnmKEMWOC+Ahd/vlPj+rXKaOJ/ARYHqivZqGEWHxJMhDUeY+AZ+Zo44ujXeKjlAaYzReWB0gNzmJc/Cdx+D1Tus3Kd8F5DhSu+UcEK90AXV1++A6anM+zykChFD8JEriyuti561SEFM5gTE74LfAQCNZJWXs/snvaPJqIBMik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716047804; c=relaxed/simple;
	bh=IZFOGJbQhn8jSnjVbaxO8YdTU7NYck/zGzxaO+N1e5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2NdQHineivt5cZm+MwRZQitiz2iTdy82c0M8fYZ7KtGcVK699Zc1nO0JyLblW58n7Ej0Fde6l32rmtx3AJqlYXqQWbW0zLZuzLgRjfVcw3jueeOkPZuVHH7lte6uwtb2xNXMMF/3cji8wMNZN9S/iFeLuhfRlUaJF72vw5Yhm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHlGQmrY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHlGQmrY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716047803; x=1747583803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZFOGJbQhn8jSnjVbaxO8YdTU7NYck/zGzxaO+N1e5o=;
  b=QHlGQmrYul6hHZBU/42fc5pU2YFdinVQNhaBD6g16HbgC99v0yQd2yYx
   lQcYRUzYv2Jsol0vBARUA2rFwWBYHmmsSoXrxt4U0ilEGrmqY702GRzUD
   BStiXtofWq/pdMdShc8OgxM17jiZT0KN6P+nlaEcicCmyVjnJqc7/EAha
   5RiePHlN4WpldLHSnG6m1FgBk0HJLULAtBHQmgHu/EisW+5l0XNgPhIaQ
   aTA4uYg/5I2xGCGuvE4+hwj+eb0/BXsNEfWObrH42eGc7ovaWUsEMr52b
   9HJJ9QOARc5mxpHVaDA593lAZQFFzsrt+sfyG98m2QwkHxBafP9K1zxXj
   A==;
X-CSE-ConnectionGUID: 2D/4j1SwSi+zzlu4IgpIpg==
X-CSE-MsgGUID: cc/mtk8BSZSyX7KgRuXTcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="29733826"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="29733826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 08:56:43 -0700
X-CSE-ConnectionGUID: U4ptE/jLQyKa50XedV0t9Q==
X-CSE-MsgGUID: aympyu9qQDqoGi7IEB1UHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="36653965"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 May 2024 08:56:41 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8MQH-0002LW-2d;
	Sat, 18 May 2024 15:56:38 +0000
Date: Sat, 18 May 2024 23:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [agd5f:amd-staging-drm-next 1463/1476]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3017: warning: Function parameter or
 struct member 'bo' not described in 'amdgpu_vm_is_bo_always_valid'
Message-ID: <202405182334.T6je5EID-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tvrtko,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   4a9fae65869eac0788a20f77d8ecd8aaf0cbb86a
commit: 062140f0b8f011462dc8944f7fb70e5bf8b6035f [1463/1476] drm/amdgpu: Add amdgpu_bo_is_vm_bo helper
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240518/202405182334.T6je5EID-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182334.T6je5EID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182334.T6je5EID-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3017: warning: Function parameter or struct member 'bo' not described in 'amdgpu_vm_is_bo_always_valid'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3017: warning: Excess function parameter 'abo' description in 'amdgpu_vm_is_bo_always_valid'


vim +3017 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

  3006	
  3007	/**
  3008	 * amdgpu_vm_is_bo_always_valid - check if the BO is VM always valid
  3009	 *
  3010	 * @vm: VM to test against.
  3011	 * @abo: BO to be tested.
  3012	 *
  3013	 * Returns true if the BO shares the dma_resv object with the root PD and is
  3014	 * always guaranteed to be valid inside the VM.
  3015	 */
  3016	bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo)
> 3017	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
