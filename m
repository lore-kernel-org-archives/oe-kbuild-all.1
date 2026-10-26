Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024326;
	b=oTR223LSGV7xEUckTiKVBC6Hfx6cBw0Q4EFnWh8q39cvLXnC8uXJ9mc2xvlSEZpTFkvq
	 yYQXlFbkGqF+xLzpwVi8PMMvZR8OuvsW91+qr0NxnW1jDelFUsPMvSza8fC/kWh10HcAS
	 Rqe0ozjd+yK6kOLq6k+VqShj0He5NtOCU4k6mIftV8YExMW7v4FuQi76h13NiIiIJB+9P
	 v72Ky7LA9JiOINBhabT8ufC5ktvoQ0cYRvnN/TeGDoIYCYswxMFEeMcPO3dcpln7E3Uka
	 rKSl2rTGkjHAesEryF5W23dnrb99Upvaruiqt0t7txepLIp4Jo9tMrtQWYHFme9L83A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024326;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=23uCSlDq/jdb5nKs8rdKZ1mXjLGt7zU5MJIxs8JP7sM=;
	b=HIlzJfsZpljZ3Y/UhY9OuMav3s2DbiA2mYI+XLBTQe/XL0myOuj/0Esb+KVCzK09pzd5
	 e7cLKSHT3K4N/wmNR8IkHj8i6limrpVPguGa0MmZFV4jnDht80gBB2KHJZZRrY4xe1+kq
	 YgXOPOFE/oZUN3yD5GhFYfW+Ezt3rVDO0Q340ifitpDD9kIjCUsb6y/2A+HxQoqspNdNj
	 nIrl5ZCMgtJ44/eUmebiTmUAn7G7NPDz8PDGNCp4iOZUJld6cEPoQF8xJYaXYV5k3Bwmv
	 qGszNyBodYcrYZCXaggTFRaoMZz5j3e0lFSQJzkSmM4wUlWce5NeuBMLBhMz6T2SLAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="MwBC/WCa";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF3606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 14:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEFF3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwBC/WCa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793024325; x=1824560325;
  h=date:from:to:cc:subject:message-id;
  bh=sfpDEIzHI3TqrcQQTQfpcMHoODCBropru4dTtnQ1blE=;
  b=MwBC/WCa9L0WdJ6WMV/ud9pWDP58mzTHfHXqXuFD5UChUdBAB+Go3jP4
   RiCQ4upVmRBLL/LAWzj6esiqYyBz6PV0guthVR7q7wr54ff3aNNTARYDO
   ffLxEge60SSNdeHwu30Ud3O6ZA3ZLSasHbjeb3NwMMNxiHrjQlflLaYwD
   Q3bSG0icAnqSUJGBNbxwLkppQdH2Jj7+Yc2b//KEBUSVMVx2bY/qdVZEc
   XdEBhLuqh9pAnajOqJwuTPHrYrR+PGhYqHVyG7vwUDOpfC0pxly+Zq7s0
   63fbPVpGVdB9UUBqChfwt22irWh3acZS9QpLXbhzlw5tIZuCEqyWo2yQt
   Q==;
X-CSE-ConnectionGUID: gWM/Q0abS06NpawLGhlx/Q==
X-CSE-MsgGUID: eZLRtHvYTAKFZBonH9DVuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1682727"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1682727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 07:18:40 -0700
X-CSE-ConnectionGUID: Z4zDidbRROeYw/wmXkTO5A==
X-CSE-MsgGUID: 43TI8jSWTM++afYTCF/C9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4310549"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2026 07:18:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLLX1-00000000W22-0ppU;
	Mon, 26 Oct 2026 14:18:35 +0000
Date: Mon, 26 Oct 2026 22:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:104: warning: Function parameter or
 struct member 'ip_block' not described in 'vcn_v1_0_early_init'
Message-ID: <202610262203.3dsA3VPN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Sunil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   32521e28daaacb02caff14090988d91503e61978
commit: 8a21201b146405b13fdfef7eaccb7b08dc265b52 [0/1] drm/amdgpu: update the handle ptr in early_init
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20261026/202610262203.3dsA3VPN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610262203.3dsA3VPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610262203.3dsA3VPN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:104: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v1_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:104: warning: Excess function parameter 'handle' description in 'vcn_v1_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c:110: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v2_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c:110: warning: Excess function parameter 'handle' description in 'vcn_v2_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:120: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v2_5_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:120: warning: Excess function parameter 'handle' description in 'vcn_v2_5_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:126: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v3_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:126: warning: Excess function parameter 'handle' description in 'vcn_v3_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:116: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:116: warning: Excess function parameter 'handle' description in 'vcn_v4_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:107: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_3_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:107: warning: Excess function parameter 'handle' description in 'vcn_v4_0_3_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:114: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_5_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:114: warning: Excess function parameter 'handle' description in 'vcn_v4_0_5_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:466: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v1_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:466: warning: Excess function parameter 'handle' description in 'jpeg_v1_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:96: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:96: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:49: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:49: warning: Excess function parameter 'handle' description in 'jpeg_v2_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:58: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_5_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:58: warning: Excess function parameter 'handle' description in 'jpeg_v2_5_early_init'
..


vim +104 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c

d58ed70778dbae Leo Liu           2019-12-12   94  
88b5af70e29edd Leo Liu           2016-12-28   95  /**
69939009bde70c Mario Limonciello 2022-12-28   96   * vcn_v1_0_early_init - set function pointers and load microcode
88b5af70e29edd Leo Liu           2016-12-28   97   *
88b5af70e29edd Leo Liu           2016-12-28   98   * @handle: amdgpu_device pointer
88b5af70e29edd Leo Liu           2016-12-28   99   *
88b5af70e29edd Leo Liu           2016-12-28  100   * Set ring and irq function pointers
69939009bde70c Mario Limonciello 2022-12-28  101   * Load microcode from filesystem
88b5af70e29edd Leo Liu           2016-12-28  102   */
8a21201b146405 Sunil Khatri      2024-09-25  103  static int vcn_v1_0_early_init(struct amdgpu_ip_block *ip_block)
88b5af70e29edd Leo Liu           2016-12-28 @104  {
8a21201b146405 Sunil Khatri      2024-09-25  105  	struct amdgpu_device *adev = ip_block->adev;
cca69fe8ff98b6 Leo Liu           2017-05-05  106  
101c6fee53f6a7 Leo Liu           2017-02-21  107  	adev->vcn.num_enc_rings = 2;
101c6fee53f6a7 Leo Liu           2017-02-21  108  
cca69fe8ff98b6 Leo Liu           2017-05-05  109  	vcn_v1_0_set_dec_ring_funcs(adev);
8ace845ff0e8fc Leo Liu           2017-02-21  110  	vcn_v1_0_set_enc_ring_funcs(adev);
a319f444bb86eb Leo Liu           2016-12-28  111  	vcn_v1_0_set_irq_funcs(adev);
cca69fe8ff98b6 Leo Liu           2017-05-05  112  
8a21201b146405 Sunil Khatri      2024-09-25  113  	jpeg_v1_0_early_init(ip_block);
bb0db70f3f75e0 Leo Liu           2019-11-08  114  
69939009bde70c Mario Limonciello 2022-12-28  115  	return amdgpu_vcn_early_init(adev);
88b5af70e29edd Leo Liu           2016-12-28  116  }
88b5af70e29edd Leo Liu           2016-12-28  117  

:::::: The code at line 104 was first introduced by commit
:::::: 88b5af70e29edda095f3d26edcd376cb1688cf70 drm/amdgpu: add vcn ip block functions (v2)

:::::: TO: Leo Liu <leo.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
