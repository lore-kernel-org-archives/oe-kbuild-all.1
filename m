Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F061E369980
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784357609; cv=none; b=BKOnAq09uY2nyzc9yfseoi2Ly3Fk/BJrqSDydPnrHqIZXYElNqL8+2N0x/WLzC9VpWIFXhU4VdGFOJG55vNpE1JVpsldZXZlWY2emJnojVFQIhCmnJrlR6XiEJp3ePnjE217wmLyLw6dF3X+jMteq+onE6vVazd5VzeGfuJAaFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784357609; c=relaxed/simple;
	bh=N9ADIgk9Nz4dCbIjH7kHB/bVJ35OVWu1Jg0ffX7jH/8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cOYl6Lg5/vVBvv2fuxVcsMTQPNsEvb7YPuX2/bxns5gb+D+Vpsqp1cPpO4xRGqVPktyxBC98MHbe4nofEO7V2dpSEOVaK3eJCCRC9SCGX6rF55xTc6ynKkdDpSSh4iHhG7sjMba19VAATpAi/+OzphYlyPVofTP63cZVaxeBaUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCb3VAIz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCb3VAIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784357608; x=1815893608;
  h=date:from:to:cc:subject:message-id;
  bh=N9ADIgk9Nz4dCbIjH7kHB/bVJ35OVWu1Jg0ffX7jH/8=;
  b=HCb3VAIzVFVeIxfXJXFsltFj1GYIZeXvh35e3gXuH7+/2Hh+Q7T16gWn
   Lfh2pwd0VMBCRcYigVl1J8R6r1G34Zfhwf/OU0MGdvBs+3e1K/kWjcnHZ
   KKRrfTyi3rsxKEKQeBDcVoiA6tYXIhCJVCZNgjqRw50EjEL37IGtVkXkp
   enHUnB9AiYGea+rr6DHCyTnWPpMniO9Ra9qZwwymQgARYcvcvw5jdRUYu
   vd2PMEG/Xk6EiX4QHJiX+Xlyp8bIDwCjsNM7hknbrC1pwTjKUkqAeIt9+
   n0DYyIAPKxG/pHWCLWBquUbwklpKEdwBkCfmGYtS9bWGoXKOpM0SfJM1V
   Q==;
X-CSE-ConnectionGUID: mBr3RV76QPmv4DoBtluKtw==
X-CSE-MsgGUID: 8IgeF5CiS6GyV1qedshmlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85137050"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85137050"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 23:53:26 -0700
X-CSE-ConnectionGUID: HFwdKJvdSFO4Bpq1PxhYPw==
X-CSE-MsgGUID: EmkmAvTpRIeHsnF0RF0FDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="261241707"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 17 Jul 2026 23:53:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkyvJ-00000000TXT-1sPc;
	Sat, 18 Jul 2026 06:53:21 +0000
Date: Sat, 18 Jul 2026 14:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Prike Liang <Prike.Liang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Michael Chen <michael.chen@amd.com>
Subject: [linux-next:master 5911/6789] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1087 function parameter 'mes' not
 described in 'amdgpu_mes_alloc_gang_ctx_index'
Message-ID: <202607181432.Ajk3exBD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
commit: 7ca36e897bceeedf917bf98f024f5d2c8e87324d [5911/6789] drm/amdgpu: add mes gang contex alloc/free helper
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607181432.Ajk3exBD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181432.Ajk3exBD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181432.Ajk3exBD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not described in 'amdgpu_mes_rs64mem_fini'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1046 function parameter 'queue' not described in 'amdgpu_mes_alloc_proc_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'mes' not described in 'amdgpu_mes_free_proc_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'queue' not described in 'amdgpu_mes_free_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1087 function parameter 'mes' not described in 'amdgpu_mes_alloc_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1087 function parameter 'queue' not described in 'amdgpu_mes_alloc_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1112 function parameter 'mes' not described in 'amdgpu_mes_free_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1112 function parameter 'queue' not described in 'amdgpu_mes_free_gang_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not described in 'amdgpu_mes_rs64mem_fini'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1046 function parameter 'queue' not described in 'amdgpu_mes_alloc_proc_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'mes' not described in 'amdgpu_mes_free_proc_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'queue' not described in 'amdgpu_mes_free_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1087 function parameter 'mes' not described in 'amdgpu_mes_alloc_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1087 function parameter 'queue' not described in 'amdgpu_mes_alloc_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1112 function parameter 'mes' not described in 'amdgpu_mes_free_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1112 function parameter 'queue' not described in 'amdgpu_mes_free_gang_ctx_index'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
