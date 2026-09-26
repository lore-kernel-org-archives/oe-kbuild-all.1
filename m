Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF3F260580
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 03:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790392178; cv=none; b=hF3pNPBs5pxrXYvd3RA9Y9MoZuGXV45hH35Ure89MrX0iAyd/tj4mQP09zaCYYAj9y0yomt4YOMe0amASvZqX7l/RebWIUdGySdQzi9y2IuQwIqYEavAxN4FIEl7calOusaniAcuoddnbeaBor4pNTM+nfHeSyJI+pqHCuB4OBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790392178; c=relaxed/simple;
	bh=5pJcQaTGixCuTAkc/aaQ8pBqE9LAWzHBz1JJP52V+xo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MifJidnIrZ+DNu7rBKaR6FRKdTgUUp7l/olrI9HlH+CUuFGDsOFRoYSyZOn4kRxx/e9rHBfcAAiKf77CzhC9AH8vANRcZIdAoho1HJ2tOk0hBNKd5nSyghSwCmqUxNwUGOvMbvHqJeaFKI4Cy6oj2J+aT7QmardkTifOyqjJxVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFIpZBzn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFIpZBzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790392177; x=1821928177;
  h=date:from:to:cc:subject:message-id;
  bh=5pJcQaTGixCuTAkc/aaQ8pBqE9LAWzHBz1JJP52V+xo=;
  b=EFIpZBzn09A0dgbSM+90bEw9o3wRh+XZF1O55TdZE/l6Ix0QNNSj3R6x
   Wfpo7f0xee3KwrBaVfq1+QcMnaJ04ouGtoRmu6U1v3tGZSvCnCND2BcXt
   3mMUBTa3uljdY6HWMsxohm+yKCK6gIP190+y70M0H5320lUF4Qn0iadql
   EL/0i/e4nhR5b5HMvGM4v+ozc0FhcgBBSCvBBrF9n3xEKa4I03EOJ4GFt
   7sOttcOlORDheFGuKb56lWYWf55RCbY2SzEF7LIko5+eyObLlUY1t7L9O
   iQY/RGHatGAhyK+z2mmpQY0xo7Zjn03/gdQx6kzEgGekVnQd09IJNLHxD
   g==;
X-CSE-ConnectionGUID: LyLUJhxlSfKyLr1ymtaBuA==
X-CSE-MsgGUID: qGLE5nqmTEqzmOVMgg/a5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="107557283"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="107557283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 20:09:36 -0700
X-CSE-ConnectionGUID: uz8lmRrPQbSLbmruxn8RHw==
X-CSE-MsgGUID: ycqOLoeWTXSs3CeAY8FUPg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2026 20:09:34 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAIn6-00000000LSx-2SBr;
	Sat, 26 Sep 2026 03:09:32 +0000
Date: Sat, 26 Sep 2026 11:09:21 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:dmabuf-size-ceiling-v7.3-rc3 28/29] ERROR: modpost:
 drivers/gpu/drm/amd/amdgpu/amdgpu.ko: symbol 'init_net' undefined!
Message-ID: <202609261103.yZNBeLqf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git dmabuf-size-ceiling-v7.3-rc3
head:   837ed875be1a747823a663f160a8122b60c0c88a
commit: c5e054ccaedf0778bd70baf19cc9200fe5a7acc1 [28/29] drm/amdkfd: port AMD Infinity Storage file I/O from the amdgpu driver
config: x86_64-buildonly-randconfig-1000-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261103.yZNBeLqf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261103.yZNBeLqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261103.yZNBeLqf-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_ais.c: In function 'kfd_ais_get_storage_type':
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_ais.c:875:21: warning: variable 'fstype' set but not used [-Wunused-but-set-variable]
875 |         const char *fstype;
|                     ^~~~~~
--
>> ERROR: modpost: drivers/gpu/drm/amd/amdgpu/amdgpu.ko: symbol 'init_net' undefined!
>> ERROR: modpost: drivers/gpu/drm/amd/amdgpu/amdgpu.ko: symbol 'in4_pton' undefined!
>> ERROR: modpost: drivers/gpu/drm/amd/amdgpu/amdgpu.ko: symbol 'ip_route_output_flow' undefined!
>> ERROR: modpost: drivers/gpu/drm/amd/amdgpu/amdgpu.ko: symbol 'dst_release' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
