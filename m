Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312081CB333
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727870424; cv=none; b=SEjEae3WCV+lJUm4QW28fRCMrHPwS637UF07z0ihTD7jvnUdohm2odIVW4yIVB/R0UPqatI+zq3nQgcj+p+q6iwElh3fiFff05Fsl7ekGIz8kWqW984t6vGUioFhSo3XPUeY7qXALUhB/Luh3wGcOTJY4zrPjI0hhe4DBVxdbuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727870424; c=relaxed/simple;
	bh=qft3Yxlq3ek3tsZaWDkY0Ou2mJVKQUONZZdkagGhkso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fc0L1uU4d5B7Pe7E3HLTVvvsJLtHi5TbMkdhyegwGjzRx9pH0XoX7Xb40PaWA1mOUlDZSESdLQEeavu8+KnZbMq2tJnxlaK7Obx66yVYEHQzZ2qQzGLqdsZusQ1C2f1LU3K7N9XjM9xjO9CJaOb/EXvKHJY+7N0oLyuPvPT7QRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoVWnLXP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoVWnLXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727870422; x=1759406422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qft3Yxlq3ek3tsZaWDkY0Ou2mJVKQUONZZdkagGhkso=;
  b=hoVWnLXPqR5jGO+Gg1pE2JuEhgfv4A6W75ue1Ars9zh2ey4a73P9EdLG
   /pKLCo49qTJ+g7lqHvFmH2oIL4YoeZ30R/DVjtgiIphcRXtYypqBc0lAu
   c1ncelAdjYVwFBS4TqPSX3hYYbH7Z19TWS9utv1jttQyEHS9PUOxvB9F6
   uZFOvwVJu2RTBYB75q4TPNnGkzwz3KhvTHt1d6+TNUW1Pgaax4kREa5ma
   8PNd0bDVpvAUVl3aY/PL20SQ11gjzpLlx3ock5VvvjLlj08NYb1EqZO5T
   RlFxn2zT0OR5XCqONOTjMUNPX1ijOEhsnJ6jQ8ePXPGk5xj11ZIYnrC9d
   g==;
X-CSE-ConnectionGUID: AKtKyc/NQyOEkuZ2ZtK3kw==
X-CSE-MsgGUID: DC3ObCODRnaFaKOUwpJbzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26534918"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="26534918"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 05:00:17 -0700
X-CSE-ConnectionGUID: ++EijRtgQ6WCcjywtHjAuQ==
X-CSE-MsgGUID: 1SVhdUIpTPOofxkdA7PwNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="97327016"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Oct 2024 05:00:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svy1d-000Rzy-2g;
	Wed, 02 Oct 2024 12:00:13 +0000
Date: Wed, 2 Oct 2024 19:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [linux-next:master 1760/2025]
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:517: warning: Function parameter or
 struct member 'ip_block' not described in 'jpeg_v1_0_sw_fini'
Message-ID: <202410021904.YyGjlpk9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sunil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
commit: 36aa9ab9c0c4a41fe334ab39951773f21709f89d [1760/2025] drm/amdgpu: update the handle ptr in sw_fini
config: riscv-buildonly-randconfig-r004-20230123 (https://download.01.org/0day-ci/archive/20241002/202410021904.YyGjlpk9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021904.YyGjlpk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021904.YyGjlpk9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:466: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v1_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:466: warning: Excess function parameter 'handle' description in 'jpeg_v1_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:485: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v1_0_sw_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:485: warning: Excess function parameter 'handle' description in 'jpeg_v1_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:517: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v1_0_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:517: warning: Excess function parameter 'handle' description in 'jpeg_v1_0_sw_fini'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:56: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:56: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:78: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_sw_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:78: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:138: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:138: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_sw_fini'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:49: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:49: warning: Excess function parameter 'handle' description in 'jpeg_v2_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:69: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_0_sw_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:69: warning: Excess function parameter 'handle' description in 'jpeg_v2_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:112: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_0_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:112: warning: Excess function parameter 'handle' description in 'jpeg_v2_0_sw_fini'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:50: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v5_0_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:50: warning: Excess function parameter 'handle' description in 'jpeg_v5_0_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:70: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v5_0_0_sw_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:70: warning: Excess function parameter 'handle' description in 'jpeg_v5_0_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:114: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v5_0_0_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:114: warning: Excess function parameter 'handle' description in 'jpeg_v5_0_0_sw_fini'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:76: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_3_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:76: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_3_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:96: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_3_sw_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:96: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_3_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:173: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_3_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:173: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_3_sw_fini'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:50: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v3_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:50: warning: Excess function parameter 'handle' description in 'jpeg_v3_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:83: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v3_0_sw_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:83: warning: Excess function parameter 'handle' description in 'jpeg_v3_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:126: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v3_0_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:126: warning: Excess function parameter 'handle' description in 'jpeg_v3_0_sw_fini'
--
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:104: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v1_0_early_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:104: warning: Excess function parameter 'handle' description in 'vcn_v1_0_early_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:126: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v1_0_sw_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:126: warning: Excess function parameter 'handle' description in 'vcn_v1_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:221: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v1_0_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:221: warning: Excess function parameter 'handle' description in 'vcn_v1_0_sw_fini'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:69: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_5_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:69: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_5_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:102: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_5_sw_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:102: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_5_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:167: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_5_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:167: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_5_sw_fini'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:58: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_5_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:58: warning: Excess function parameter 'handle' description in 'jpeg_v2_5_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:89: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_5_sw_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:89: warning: Excess function parameter 'handle' description in 'jpeg_v2_5_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:161: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_5_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:161: warning: Excess function parameter 'handle' description in 'jpeg_v2_5_sw_fini'
--
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:96: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_early_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:96: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_early_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:116: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_sw_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:116: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:195: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:195: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_sw_fini'
--
   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c:109: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v2_0_early_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c:109: warning: Excess function parameter 'handle' description in 'vcn_v2_0_early_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c:132: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v2_0_sw_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c:132: warning: Excess function parameter 'handle' description in 'vcn_v2_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c:245: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v2_0_sw_fini'
>> drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c:245: warning: Excess function parameter 'handle' description in 'vcn_v2_0_sw_fini'
..


vim +517 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c

bb0db70f3f75e0 Leo Liu      2019-11-08  508  
bb0db70f3f75e0 Leo Liu      2019-11-08  509  /**
bb0db70f3f75e0 Leo Liu      2019-11-08  510   * jpeg_v1_0_sw_fini - sw fini for JPEG block
bb0db70f3f75e0 Leo Liu      2019-11-08  511   *
bb0db70f3f75e0 Leo Liu      2019-11-08  512   * @handle: amdgpu_device pointer
bb0db70f3f75e0 Leo Liu      2019-11-08  513   *
bb0db70f3f75e0 Leo Liu      2019-11-08  514   * JPEG free up sw allocation
bb0db70f3f75e0 Leo Liu      2019-11-08  515   */
36aa9ab9c0c4a4 Sunil Khatri 2024-09-26  516  void jpeg_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
bb0db70f3f75e0 Leo Liu      2019-11-08 @517  {
36aa9ab9c0c4a4 Sunil Khatri 2024-09-26  518  	struct amdgpu_device *adev = ip_block->adev;
bb0db70f3f75e0 Leo Liu      2019-11-08  519  
bc224553843e52 James Zhu    2022-05-24  520  	amdgpu_ring_fini(adev->jpeg.inst->ring_dec);
bb0db70f3f75e0 Leo Liu      2019-11-08  521  }
bb0db70f3f75e0 Leo Liu      2019-11-08  522  

:::::: The code at line 517 was first introduced by commit
:::::: bb0db70f3f75e0d994a627f22c3ff2d8ec6191c4 drm/amdgpu: separate JPEG1.0 code out from VCN1.0

:::::: TO: Leo Liu <leo.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
