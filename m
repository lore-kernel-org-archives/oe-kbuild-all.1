Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6C6331209
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 02:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785465761; cv=none; b=inTkTboW8D4O4AAuehejGmJTXNHBqLu1ZzCoxDOozz9w1ngrNJ4TwmPxTnPgfhmd9Q4TspUwRcEZYtzFZUc+tzx+StViv5QtZJWW66u1amEVkhL1lyj9HB+6gcZ7wgrhV5LuTKzC9a5/4tib1m1f5oa6IiGkms2pyoNPxz7jfa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785465761; c=relaxed/simple;
	bh=XgyEG96HO9/QeC+vuwdBXi5aiMUEpkYctY1MMBt4fVY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vwn06aa9eIfQHOR8/tCPTpOjd8CzIKcUWi40J2KoVQJP3sOD+uuLYm0ojva1qL4AZzlF0ZPSEpjMrzgKcdvA1iw9S5rhQ+Wj2pYRIQcT7wOXiSEkAm4EkmBj7Bu7huiOGeajLVZ2xzPpEK5J6YDmOT4IpxCjmxAasf7piBxFDGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPAAJ9rZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPAAJ9rZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785465754; x=1817001754;
  h=date:from:to:cc:subject:message-id;
  bh=XgyEG96HO9/QeC+vuwdBXi5aiMUEpkYctY1MMBt4fVY=;
  b=aPAAJ9rZ5iujQLJ0eSO82PMxq4wt7GlXS3mgNETOFOmMG7d6Q43VKh8g
   5xU5kbPumUwSWBjXpTAIMoPF2d+M2uqJ/hFYGnh894jd+tdGhNQZBr4LL
   UfptKlJwtLofRvlqOhvyJuxXZOk2EpdC9OenTEMy2eX9HB9WApbmNf29v
   rRdonKjA7sKDAlg4k2q+gGYDOZaUThJtWYGlTmMpdaZ51DpxU0KDeZa1j
   nhfIz23f1Z37m1Wnx7o+PLOhoVk9LwDANpSuD44JUZszBESl+FHeanalG
   FHgJpEYoQYnhjObG99uwMwIg20tgJlR0E5mjSCTrYVQOKYf2A/NgnpeIL
   w==;
X-CSE-ConnectionGUID: xoq8p3A2QhikTmkND8b5fg==
X-CSE-MsgGUID: Ua8k7/VDRGuWa7ZoK9ZHgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86127663"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86127663"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 19:42:33 -0700
X-CSE-ConnectionGUID: ECJ8nPfTQlmE5sZgIm/7cA==
X-CSE-MsgGUID: 0JAj8j20QjW+tqLQ/qU5hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="259881436"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Jul 2026 19:42:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpdC4-00000000hps-1FqB;
	Fri, 31 Jul 2026 02:41:57 +0000
Date: Fri, 31 Jul 2026 10:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [agd5f:drm-fixes-7.2 8/28]
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:42:54: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202607311048.Pwj1wa1m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-fixes-7.2
head:   114b42507b6a23d9d24e24e4ef165233332c64d4
commit: 43c9f7cba9f9fcd09a5e23686ab4f0f67b62d888 [8/28] drm/amdgpu: Pack nested ucode_info struct
config: mips-randconfig-r112-20260731 (https://download.01.org/0day-ci/archive/20260731/202607311048.Pwj1wa1m-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311048.Pwj1wa1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311048.Pwj1wa1m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:42:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:42:54: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:42:54: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:65:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:65:51: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:65:51: sparse:     got unsigned int [usertype] *
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c:276:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c:276:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c:276:29: sparse:     got void *ptr
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:372:38: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:374:30: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:378:30: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:380:30: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:385:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:399:43: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:401:38: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:406:67: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:407:53: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:410:66: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:421:80: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:427:57: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:434:69: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:435:53: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:438:66: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:446:66: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:455:69: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:456:69: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:505:30: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:508:45: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:509:45: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:516:54: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:563:35: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:565:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:609:21: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:613:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:615:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:618:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:622:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:630:21: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:632:21: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:649:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:653:21: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:655:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:662:21: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:664:21: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:676:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:680:21: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:682:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:689:21: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:691:21: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:694:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:696:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:708:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:720:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:722:47: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:728:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:827:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:828:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:831:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:832:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:835:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:836:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:843:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:844:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:847:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:848:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:851:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:852:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:859:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:860:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:863:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:864:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:867:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:868:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:875:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:876:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:879:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:880:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:883:46: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:884:40: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:947:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:949:49: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:951:52: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:965:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:967:49: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:969:52: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:987:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:989:49: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:991:52: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1050:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] ulClockParams @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1050:47: sparse:     expected unsigned int [addressable] [usertype] ulClockParams
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1050:47: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1061:50: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1062:49: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1070:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] ulClockParams @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1070:47: sparse:     expected unsigned int [addressable] [usertype] ulClockParams
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1070:47: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1083:50: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1084:49: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1092:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] ulClock:24 @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1092:33: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulClock:24
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1092:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1099:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1105:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] ulClockFreq:24 @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1105:48: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulClockFreq:24
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1105:48: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1111:42: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1112:41: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1116:40: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1663:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1663:36: sparse:     expected unsigned int
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1663:36: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1668:38: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1689:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1689:17: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1706:39: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1864:30: sparse: sparse: symbol 'amdgpu_vbios_version_attr_group' was not declared. Should it be static?
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse:     got unsigned int [usertype] *
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:657:42: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse:     got unsigned int [usertype] *
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:159:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:159:52: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:159:52: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:165:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:165:55: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:165:55: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:174:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:174:34: sparse:     expected void const [noderef] __user *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:174:34: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:230:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:230:27: sparse:     expected void [noderef] __user *to
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:230:27: sparse:     got char *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:257:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:257:52: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:257:52: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:263:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:263:50: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:263:50: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:306:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:306:52: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:306:52: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:311:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:311:50: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:311:50: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:316:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:316:51: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:316:51: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:321:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:321:59: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:321:59: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:326:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:326:38: sparse:     expected void const [noderef] __user *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:326:38: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:361:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:361:27: sparse:     expected void [noderef] __user *to
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:361:27: sparse:     got char *
>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:87:19: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:87:19: sparse:     expected long ( *write )( ... )
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:87:19: sparse:     got long ( * )( ... )
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:93:19: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:93:19: sparse:     expected long ( *write )( ... )
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:93:19: sparse:     got long ( * )( ... )
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:99:19: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:99:19: sparse:     expected long ( *write )( ... )
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:99:19: sparse:     got long ( * )( ... )
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:50:12: sparse: sparse: symbol 'amdgpu_virt_dynamic_crit_table_name' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1452:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *vfi_cmd @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1452:18: sparse:     expected void *vfi_cmd
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1452:18: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1453:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *vfi_stat @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1453:18: sparse:     expected void *vfi_stat
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1453:18: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1454:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *vfi_addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1454:18: sparse:     expected void *vfi_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1454:18: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1455:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *vfi_data @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1455:18: sparse:     expected void *vfi_data
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1455:18: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1456:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *vfi_grbm_cntl @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1456:23: sparse:     expected void *vfi_grbm_cntl
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1456:23: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1457:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *vfi_grbm_idx @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1457:23: sparse:     expected void *vfi_grbm_idx
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1457:23: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1491:22: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *vfi_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1491:22: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1491:22: sparse:     got void *vfi_addr
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1492:22: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *vfi_data @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1492:22: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1492:22: sparse:     got void *vfi_data
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1493:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *vfi_grbm_cntl @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1493:32: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1493:32: sparse:     got void *vfi_grbm_cntl
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1494:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *vfi_grbm_idx @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1494:32: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1494:32: sparse:     got void *vfi_grbm_idx
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1496:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *vfi_stat @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1496:44: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1496:44: sparse:     got void *vfi_stat
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1497:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *vfi_cmd @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1497:21: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1497:21: sparse:     got void *vfi_cmd
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1500:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void *vfi_stat @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1500:30: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1500:30: sparse:     got void *vfi_stat
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1510:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void *vfi_data @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1510:38: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1510:38: sparse:     got void *vfi_data
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1574:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *scratch_reg0 @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1574:22: sparse:     expected void *scratch_reg0
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1574:22: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1575:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *scratch_reg1 @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1575:22: sparse:     expected void *scratch_reg1
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1575:22: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1576:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *scratch_reg2 @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1576:22: sparse:     expected void *scratch_reg2
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1576:22: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1577:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *scratch_reg3 @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1577:22: sparse:     expected void *scratch_reg3
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1577:22: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1582:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *spare_int @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1582:27: sparse:     expected void *spare_int
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1582:27: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1586:27: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *scratch_reg2 @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1586:27: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1586:27: sparse:     got void *scratch_reg2
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1591:27: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *scratch_reg3 @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1591:27: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1591:27: sparse:     got void *scratch_reg3
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1601:27: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *scratch_reg0 @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1601:27: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1601:27: sparse:     got void *scratch_reg0
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1602:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *scratch_reg1 @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1602:41: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1602:41: sparse:     got void *scratch_reg1
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1604:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *spare_int @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1604:35: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1604:35: sparse:     got void *spare_int
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1607:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void *scratch_reg1 @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1607:37: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1607:37: sparse:     got void *scratch_reg1
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1613:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void *scratch_reg1 @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1613:29: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1613:29: sparse:     got void *scratch_reg1
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1636:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void *scratch_reg0 @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1636:21: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1636:21: sparse:     got void *scratch_reg0
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:327:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_regs2_iocdata_v2 * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:327:46: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:327:46: sparse:     got struct amdgpu_debugfs_regs2_iocdata_v2 *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:333:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_regs2_iocdata * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:333:47: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:333:47: sparse:     got struct amdgpu_debugfs_regs2_iocdata *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:485:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_gprwave_iocdata * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:485:37: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:485:37: sparse:     got struct amdgpu_debugfs_gprwave_iocdata *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *__p @@     got unsigned long long [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse:     expected unsigned long long [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse:     got unsigned long long [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__p @@     got unsigned long long [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse:     expected unsigned long long const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse:     got unsigned long long [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected signed int [noderef] __user *__p @@     got signed int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse:     expected signed int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse:     got signed int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *__p @@     got unsigned long long [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse:     expected unsigned long long [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse:     got unsigned long long [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1578:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1578:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1578:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1578:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1578:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1922:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1922:25: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1922:25: sparse:    struct dma_fence *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1923:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1923:17: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1923:17: sparse:    struct dma_fence *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1974:23: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1982:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1982:17: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1982:17: sparse:    struct dma_fence *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:2018:32: sparse: sparse: cast to restricted __le32
--
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:462:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:462:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:462:25: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void *ptr @@
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:59: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:59: sparse:     got void *ptr
>> drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *ptr @@
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:37: sparse:     got void *ptr
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:814:27: sparse: sparse: symbol 'vce_v4_0_ip_funcs' was not declared. Should it be static?
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:188:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:337:18: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:340:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:340:36: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:340:36: sparse:     got void *cpu_addr
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:341:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:341:38: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:341:38: sparse:     got void *cpu_addr
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1400:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1402:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1404:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1410:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1412:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1414:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1421:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1427:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1429:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1431:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1437:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1439:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1441:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1448:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1454:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1456:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1458:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1464:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1466:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1468:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1469:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1475:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1481:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1483:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1485:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1486:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1492:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1498:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1500:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1502:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1511:27: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2156:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *cleaner_shader_cpu_ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2156:38: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2156:38: sparse:     got void *cleaner_shader_cpu_ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2510:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2510:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2510:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2511:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2511:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2511:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2513:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2513:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2513:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2514:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2514:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2514:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2515:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2515:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2515:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2539:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2539:49: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2539:49: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2540:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2540:49: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2540:49: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2543:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2543:57: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2543:57: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2559:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2559:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2559:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2560:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2560:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2560:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2562:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2562:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2562:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2563:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2563:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2563:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2742:25: sparse: sparse: cast to restricted __le32
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:276:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:282:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:309:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:315:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:321:28: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:463:75: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:463:75: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:463:75: sparse:     got void *[assigned] ptr
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:45: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:45: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:509:42: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:511:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:511:70: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:511:70: sparse:     got void *cpu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:512:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:515:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:516:40: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:518:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:518:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:518:35: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:805:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1244:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1244:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1244:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1246:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1246:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1246:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1247:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1247:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1247:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1248:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1248:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1248:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1249:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1249:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1249:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1250:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1250:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1250:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1252:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1252:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1252:24: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1276:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1276:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1276:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1277:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1277:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1277:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1278:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1278:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1278:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1279:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1279:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1279:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1281:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1281:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1281:24: sparse:     got restricted __le32 [usertype]
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4004:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4008:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4009:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4010:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4014:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4015:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4016:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4020:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4021:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4022:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4026:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4027:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4028:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4032:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4033:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4034:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4038:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4039:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4040:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4044:56: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4045:56: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4046:56: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4050:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4051:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4052:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4071:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4075:44: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4076:49: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4078:44: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4081:44: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4083:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4088:44: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4089:49: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4091:44: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4093:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4095:44: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4097:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4133:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4144:52: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4146:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4147:52: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4149:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4153:52: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4155:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4159:52: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4161:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4162:52: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4164:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4165:52: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4167:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4168:51: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4170:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4176:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4190:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4192:49: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4233:38: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4262:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4263:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4267:63: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4268:63: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4269:63: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4274:71: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4275:71: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4279:71: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4280:71: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4284:71: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4285:71: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4289:70: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4290:70: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4294:70: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4295:70: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4300:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4302:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4321:13: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4325:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4327:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4330:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4333:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4335:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4338:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4341:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4343:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4346:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4349:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4351:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4354:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4357:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4359:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4362:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4364:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4378:13: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4381:13: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4386:39: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4413:17: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4460:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4460:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4460:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4462:36: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4463:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4464:36: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4586:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *[addressable] fw_pri_cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4586:21: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4586:21: sparse:     got void *[addressable] fw_pri_cpu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4730:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *[addressable] fw_pri_cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4730:21: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4730:21: sparse:     got void *[addressable] fw_pri_cpu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4619:15: sparse: sparse: memset with byte count of 1048576
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:174:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:175:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:183:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:187:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:188:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:190:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:191:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:198:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:199:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:200:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:207:28: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:336:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:336:59: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:336:59: sparse:     got void *[assigned] ptr
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:387:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:387:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:387:37: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:398:34: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:400:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:400:62: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:400:62: sparse:     got void *cpu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:402:45: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:405:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:406:32: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:408:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:408:27: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:408:27: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:685:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:685:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:685:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:686:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:686:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:686:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:687:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:687:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:687:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:688:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:688:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:688:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:689:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:689:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:689:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:690:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:690:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:690:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:691:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:691:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:691:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:692:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:692:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:692:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:693:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:693:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:693:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:694:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:694:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:694:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:695:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:695:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:695:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:696:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:696:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:696:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:697:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:697:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:697:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:698:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:698:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:698:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:700:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:700:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:700:24: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:720:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:720:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:720:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:721:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:721:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:721:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:722:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:722:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:722:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:723:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:723:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:723:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:724:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:724:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:724:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:725:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:725:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:725:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:727:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:727:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:727:24: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:829:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:829:34: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:829:34: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:834:39: sparse: sparse: invalid assignment: |=
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:834:39: sparse:    left side has type unsigned int
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:834:39: sparse:    right side has type restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:835:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] msg_buffer_address_hi @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:835:46: sparse:     expected unsigned int [usertype] msg_buffer_address_hi
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:835:46: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:836:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] msg_buffer_address_lo @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:836:46: sparse:     expected unsigned int [usertype] msg_buffer_address_lo
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:836:46: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1154:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1154:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1154:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1253:15: sparse: sparse: invalid assignment: |=
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1253:15: sparse:    left side has type unsigned int
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1253:15: sparse:    right side has type restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1255:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr_lo @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1255:25: sparse:     expected unsigned int [usertype] addr_lo
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1255:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1256:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr_hi @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1256:25: sparse:     expected unsigned int [usertype] addr_hi
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1256:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1257:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1257:22: sparse:     expected unsigned int [usertype] size
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1257:22: sparse:     got restricted __le32 [usertype]
--
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c: note: in included file:
   drivers/gpu/drm/amd/amdgpu/clearstate_gfx12.h:113:7: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/clearstate_gfx12.h:118:7: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:515:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:515:28: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:515:28: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:543:13: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:577:36: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:578:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:579:36: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:581:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:635:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:636:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:716:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:716:57: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:716:57: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1170:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1171:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1176:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1177:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1187:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1188:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1193:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1194:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1204:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1205:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1210:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1211:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1225:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1226:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1230:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1231:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1237:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1238:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1243:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1244:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1252:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1253:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1258:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1259:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1276:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1277:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1304:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1305:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1310:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1311:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1993:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:1994:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2016:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2017:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2031:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2032:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2062:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2063:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2376:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2377:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2380:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2381:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2520:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2521:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2524:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2525:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2835:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2836:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2839:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:2840:24: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3088:73: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got struct v12_gfx_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3088:73: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3088:73: sparse:     got struct v12_gfx_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3092:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got struct v12_gfx_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3092:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3092:37: sparse:     got struct v12_gfx_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3459:74: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got struct v12_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3459:74: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3459:74: sparse:     got struct v12_compute_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3463:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got struct v12_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3463:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3463:37: sparse:     got struct v12_compute_mqd *mqd
--
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:375:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *kaddr @@
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:375:44: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:375:44: sparse:     got void *kaddr
--
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c: note: in included file:
   drivers/gpu/drm/amd/amdgpu/clearstate_gfx10.h:970:11: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/clearstate_gfx10.h:974:11: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4088:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4088:28: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4088:28: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4116:13: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4253:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4254:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4339:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4339:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4339:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4340:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4340:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4340:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4341:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4341:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4341:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4454:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4455:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5553:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5554:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5774:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5775:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5784:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5785:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5794:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5795:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5804:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5805:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5814:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5815:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5835:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5836:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6126:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6127:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6204:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6205:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6281:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6282:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6673:18: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6878:73: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got struct v10_gfx_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6878:73: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6878:73: sparse:     got struct v10_gfx_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6889:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got struct v10_gfx_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6889:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6889:37: sparse:     got struct v10_gfx_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7156:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got struct v10_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7156:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7156:37: sparse:     got struct v10_compute_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7179:68: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got struct v10_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7179:68: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7179:68: sparse:     got struct v10_compute_mqd *mqd
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7200:74: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got struct v10_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7200:74: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7200:74: sparse:     got struct v10_compute_mqd *mqd
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7204:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got struct v10_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7204:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7204:37: sparse:     got struct v10_compute_mqd *mqd
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8896:21: sparse: sparse: cast to restricted __le32
--
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c: note: in included file:
   drivers/gpu/drm/amd/amdgpu/clearstate_gfx12.h:113:7: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/clearstate_gfx12.h:118:7: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1985:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1986:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1989:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1990:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:328:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:328:28: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:328:28: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:356:13: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:388:36: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:389:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:390:36: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:392:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:424:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:425:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:505:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:505:57: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:505:57: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:989:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:990:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:995:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:996:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1010:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1011:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1015:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1016:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1022:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1023:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1028:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1029:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1037:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1038:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1043:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1044:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1062:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1063:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1091:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1092:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1097:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1098:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1677:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1678:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1704:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1705:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1721:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1722:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1756:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:1757:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2050:24: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2458:74: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got struct v12_1_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2458:74: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2458:74: sparse:     got struct v12_1_compute_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2462:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got struct v12_1_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2462:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2462:37: sparse:     got struct v12_1_compute_mqd *mqd
--
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c: note: in included file:
   drivers/gpu/drm/amd/amdgpu/clearstate_gfx11.h:990:7: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/clearstate_gfx11.h:994:7: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:643:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:643:28: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:643:28: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:671:13: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:705:36: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:706:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:707:36: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:709:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:796:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:797:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:889:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:889:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:889:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:890:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:890:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:890:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:891:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:891:25: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:891:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1355:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1356:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1361:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1362:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1372:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1373:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1378:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1379:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1389:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1390:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1395:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1396:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1410:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1411:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1419:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1420:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1428:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1429:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1439:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1440:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1444:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1445:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1451:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1452:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1457:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1458:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1475:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1476:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1482:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1483:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1510:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1511:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1517:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1518:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2364:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2365:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2387:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2388:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2402:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2403:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2431:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2432:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2450:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2451:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2481:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:2482:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3200:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3201:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3248:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3249:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3252:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3253:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3418:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3419:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3466:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3467:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3470:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3471:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3929:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3930:19: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3980:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3981:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3984:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:3985:24: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4250:73: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got struct v11_gfx_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4250:73: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4250:73: sparse:     got struct v11_gfx_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4254:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got struct v11_gfx_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4254:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4254:37: sparse:     got struct v11_gfx_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4577:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got struct v11_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4577:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4577:37: sparse:     got struct v11_compute_mqd *mqd
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4600:68: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got struct v11_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4600:68: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4600:68: sparse:     got struct v11_compute_mqd *mqd
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4621:74: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got struct v11_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4621:74: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4621:74: sparse:     got struct v11_compute_mqd *mqd
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4625:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got struct v11_compute_mqd *mqd @@
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4625:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:4625:37: sparse:     got struct v11_compute_mqd *mqd

vim +42 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c

43c064db65e2bb5 Shashank Sharma 2023-07-14  26  
43c064db65e2bb5 Shashank Sharma 2023-07-14  27  /**
43c064db65e2bb5 Shashank Sharma 2023-07-14  28   * amdgpu_mm_rdoorbell - read a doorbell dword
43c064db65e2bb5 Shashank Sharma 2023-07-14  29   *
43c064db65e2bb5 Shashank Sharma 2023-07-14  30   * @adev: amdgpu_device pointer
43c064db65e2bb5 Shashank Sharma 2023-07-14  31   * @index: doorbell index
43c064db65e2bb5 Shashank Sharma 2023-07-14  32   *
43c064db65e2bb5 Shashank Sharma 2023-07-14  33   * Returns the value in the doorbell aperture at the
43c064db65e2bb5 Shashank Sharma 2023-07-14  34   * requested doorbell index (CIK).
43c064db65e2bb5 Shashank Sharma 2023-07-14  35   */
43c064db65e2bb5 Shashank Sharma 2023-07-14  36  u32 amdgpu_mm_rdoorbell(struct amdgpu_device *adev, u32 index)
43c064db65e2bb5 Shashank Sharma 2023-07-14  37  {
43c064db65e2bb5 Shashank Sharma 2023-07-14  38  	if (amdgpu_device_skip_hw_access(adev))
43c064db65e2bb5 Shashank Sharma 2023-07-14  39  		return 0;
43c064db65e2bb5 Shashank Sharma 2023-07-14  40  
43c064db65e2bb5 Shashank Sharma 2023-07-14  41  	if (index < adev->doorbell.num_kernel_doorbells)
54c30d2a8defeef Shashank Sharma 2023-07-14 @42  		return readl(adev->doorbell.cpu_addr + index);
43c064db65e2bb5 Shashank Sharma 2023-07-14  43  
a3e510fd69c315a Lijo Lazar      2025-06-24  44  	dev_err(adev->dev, "reading beyond doorbell aperture: 0x%08x!\n",
a3e510fd69c315a Lijo Lazar      2025-06-24  45  		index);
43c064db65e2bb5 Shashank Sharma 2023-07-14  46  	return 0;
43c064db65e2bb5 Shashank Sharma 2023-07-14  47  }
43c064db65e2bb5 Shashank Sharma 2023-07-14  48  
43c064db65e2bb5 Shashank Sharma 2023-07-14  49  /**
43c064db65e2bb5 Shashank Sharma 2023-07-14  50   * amdgpu_mm_wdoorbell - write a doorbell dword
43c064db65e2bb5 Shashank Sharma 2023-07-14  51   *
43c064db65e2bb5 Shashank Sharma 2023-07-14  52   * @adev: amdgpu_device pointer
43c064db65e2bb5 Shashank Sharma 2023-07-14  53   * @index: doorbell index
43c064db65e2bb5 Shashank Sharma 2023-07-14  54   * @v: value to write
43c064db65e2bb5 Shashank Sharma 2023-07-14  55   *
43c064db65e2bb5 Shashank Sharma 2023-07-14  56   * Writes @v to the doorbell aperture at the
43c064db65e2bb5 Shashank Sharma 2023-07-14  57   * requested doorbell index (CIK).
43c064db65e2bb5 Shashank Sharma 2023-07-14  58   */
43c064db65e2bb5 Shashank Sharma 2023-07-14  59  void amdgpu_mm_wdoorbell(struct amdgpu_device *adev, u32 index, u32 v)
43c064db65e2bb5 Shashank Sharma 2023-07-14  60  {
43c064db65e2bb5 Shashank Sharma 2023-07-14  61  	if (amdgpu_device_skip_hw_access(adev))
43c064db65e2bb5 Shashank Sharma 2023-07-14  62  		return;
43c064db65e2bb5 Shashank Sharma 2023-07-14  63  
43c064db65e2bb5 Shashank Sharma 2023-07-14  64  	if (index < adev->doorbell.num_kernel_doorbells)
54c30d2a8defeef Shashank Sharma 2023-07-14 @65  		writel(v, adev->doorbell.cpu_addr + index);
43c064db65e2bb5 Shashank Sharma 2023-07-14  66  	else
a3e510fd69c315a Lijo Lazar      2025-06-24  67  		dev_err(adev->dev,
a3e510fd69c315a Lijo Lazar      2025-06-24  68  			"writing beyond doorbell aperture: 0x%08x!\n", index);
43c064db65e2bb5 Shashank Sharma 2023-07-14  69  }
43c064db65e2bb5 Shashank Sharma 2023-07-14  70  

:::::: The code at line 42 was first introduced by commit
:::::: 54c30d2a8defeef631d0111477218fe4ceecb3da drm/amdgpu: create kernel doorbell pages

:::::: TO: Shashank Sharma <shashank.sharma@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
