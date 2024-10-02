Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7358519752C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727856668; cv=none; b=YdZyFI4JMb+grLjzwznWPeq3rGBEE+prYB3G9k3Rdw7i3imUUnh8gT1joyYJ5UAl5vQt14brev/CvfKXf9UHRO+lID7YchVynFSZVm5t6isWQcVqN7yqOljTG5gH+aK/naZ3Cp4ycDU5JpB2ufAMFTrsEwmoXoQ1qzZsO4zAiXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727856668; c=relaxed/simple;
	bh=OLkt43BQ192xjPH65OnrhCJSm3pBaNq9zc6HDari+70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g2yTkoh5v1XlkgDHdoFp5lH0ejV72llbfIDBPTUtzs23qcaGFsJOHvdddrT1AYQWKO/LKPfYruRO7vx2NFA+zljN+T+BMn9zLY6QsP+jVU/ml+GgOtWV6rvGYhhM8aaY7KtMhhnrQXXjIxthi5X4s7H7m4kaeUnE4gqKWT3vojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K25f7nmE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K25f7nmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727856666; x=1759392666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OLkt43BQ192xjPH65OnrhCJSm3pBaNq9zc6HDari+70=;
  b=K25f7nmEQ1N6Efs489Zt/OaLM/+1FVX5+0E5bRMlNm6GL9+2IYcihUxS
   4PqcBejuimEYUpAoR9Tc5INpn57zGbQQX5UtUtUiTAY0FpjVWRK63RvkL
   fPnvHe2CoULcDC8Ayc2QJYR/hgnCaTlTJ/gstsiGiTVXS6f/Ga43uWpf/
   PhoLUzC0eZdEM/W2ORrwvxg/UqS11KDo4orvVOpNR69pZP6JnkQtkkurL
   yF7/4SjFZA8nCusYLJkiq4GVhgE1wT1K4Hvax/jabQOeWGIGzHhGtqTzt
   tnU35gqKVflxfeEjXUC+NZoQmUHasch4QT3b/4mgKNEnbpLrQiBm0rfwO
   g==;
X-CSE-ConnectionGUID: Xg+YRegWRbaCjI0osjOu+g==
X-CSE-MsgGUID: ZdfkGKL2SvOT4vpgZglL5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="44538216"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="44538216"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 01:11:06 -0700
X-CSE-ConnectionGUID: 69k9imINQ1u9K2FlUKug7A==
X-CSE-MsgGUID: H/4lPJYjR82hRTua4jW5sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="104731272"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2024 01:11:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svuRq-000Rn9-1N;
	Wed, 02 Oct 2024 08:11:02 +0000
Date: Wed, 2 Oct 2024 16:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [linux-next:master 1757/2025]
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:49: warning: Function parameter or
 struct member 'ip_block' not described in 'jpeg_v2_0_early_init'
Message-ID: <202410021623.jPupzVoB-lkp@intel.com>
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
commit: 146b085eadd2ce405e67492a80d6e767748d5642 [1757/2025] drm/amdgpu: update the handle ptr in early_init
config: riscv-buildonly-randconfig-r004-20230123 (https://download.01.org/0day-ci/archive/20241002/202410021623.jPupzVoB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021623.jPupzVoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021623.jPupzVoB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:49: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:49: warning: Excess function parameter 'handle' description in 'jpeg_v2_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:466: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v1_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:466: warning: Excess function parameter 'handle' description in 'jpeg_v1_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:50: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v3_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:50: warning: Excess function parameter 'handle' description in 'jpeg_v3_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:56: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:56: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:58: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_5_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:58: warning: Excess function parameter 'handle' description in 'jpeg_v2_5_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:50: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v5_0_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:50: warning: Excess function parameter 'handle' description in 'jpeg_v5_0_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:76: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_3_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:76: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_3_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:69: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_5_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:69: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_5_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:104: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v1_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:104: warning: Excess function parameter 'handle' description in 'vcn_v1_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:96: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v5_0_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:96: warning: Excess function parameter 'handle' description in 'vcn_v5_0_0_early_init'
--
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:113: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_5_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:113: warning: Excess function parameter 'handle' description in 'vcn_v4_0_5_early_init'
..


vim +49 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c

6ac27241106bc9 Leo Liu      2019-11-08  35  
6ac27241106bc9 Leo Liu      2019-11-08  36  static void jpeg_v2_0_set_dec_ring_funcs(struct amdgpu_device *adev);
6ac27241106bc9 Leo Liu      2019-11-08  37  static void jpeg_v2_0_set_irq_funcs(struct amdgpu_device *adev);
6ac27241106bc9 Leo Liu      2019-11-08  38  static int jpeg_v2_0_set_powergating_state(void *handle,
6ac27241106bc9 Leo Liu      2019-11-08  39  				enum amd_powergating_state state);
6ac27241106bc9 Leo Liu      2019-11-08  40  
6ac27241106bc9 Leo Liu      2019-11-08  41  /**
6ac27241106bc9 Leo Liu      2019-11-08  42   * jpeg_v2_0_early_init - set function pointers
6ac27241106bc9 Leo Liu      2019-11-08  43   *
6ac27241106bc9 Leo Liu      2019-11-08  44   * @handle: amdgpu_device pointer
6ac27241106bc9 Leo Liu      2019-11-08  45   *
6ac27241106bc9 Leo Liu      2019-11-08  46   * Set ring and irq function pointers
6ac27241106bc9 Leo Liu      2019-11-08  47   */
146b085eadd2ce Sunil Khatri 2024-09-25  48  static int jpeg_v2_0_early_init(struct amdgpu_ip_block *ip_block)
6ac27241106bc9 Leo Liu      2019-11-08 @49  {
146b085eadd2ce Sunil Khatri 2024-09-25  50  	struct amdgpu_device *adev = ip_block->adev;
6ac27241106bc9 Leo Liu      2019-11-08  51  
6ac27241106bc9 Leo Liu      2019-11-08  52  	adev->jpeg.num_jpeg_inst = 1;
28bb7f13e70dcd James Zhu    2023-05-24  53  	adev->jpeg.num_jpeg_rings = 1;
6ac27241106bc9 Leo Liu      2019-11-08  54  
6ac27241106bc9 Leo Liu      2019-11-08  55  	jpeg_v2_0_set_dec_ring_funcs(adev);
6ac27241106bc9 Leo Liu      2019-11-08  56  	jpeg_v2_0_set_irq_funcs(adev);
6ac27241106bc9 Leo Liu      2019-11-08  57  
6ac27241106bc9 Leo Liu      2019-11-08  58  	return 0;
6ac27241106bc9 Leo Liu      2019-11-08  59  }
6ac27241106bc9 Leo Liu      2019-11-08  60  

:::::: The code at line 49 was first introduced by commit
:::::: 6ac27241106bc946bd50032f4cd96899c6a6fe69 drm/amdgpu: add JPEG v2.0 function supports

:::::: TO: Leo Liu <leo.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
