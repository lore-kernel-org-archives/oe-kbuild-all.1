Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC1D2F83A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 18:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758132963; cv=none; b=Y51WoDm8zMXrQw+X2owt2RYGBTxrD0uAshLgeIbDlLrE/YB8vjH1t+w/A5NUjqugFPEyA40kwoTA0+4MQSuwBphjKqOgsqgOHSLJW0d7sj6IV3QSLknR8a1Ko9Ky12mj1DErNeNVeTBc9IV4O8L3t5dSofsp4yWOSbm4mr0z2qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758132963; c=relaxed/simple;
	bh=EzRFYPEZ5et/I/kFu610AEBJAXS90tjM54zMMMI7Etg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQ/o4LwlstObXmQscO3uE6LRE6WN4oq7exN2aVC8OrAbIHhskNV/y/rtmWspIzjfGj0Z17V8lHRW0JDj/SKoPurC2i+1YJotKeQDeS/dKBtuBhV41o8JDf/O0gM4oiC46WVwrMX1UhC0QIWh/SloKc2DcKWssQELI4G9lP71IYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEQmx/pa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEQmx/pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758132962; x=1789668962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EzRFYPEZ5et/I/kFu610AEBJAXS90tjM54zMMMI7Etg=;
  b=NEQmx/paw5VuIlcROu0iKHEEUdiddRGfF1bnLRUFnnUZha8hVrAa6TeL
   2TlJ/3CRzsUTtPAAbUpXWe5zJc6HMHF6LrEmos3FTeiG6Pik56QzXs5d7
   n4s5iqWt5iNkX8P7t3XtjvDkhnt8WgSYXdtBgxvrm5sWYXDUMZ8anfil0
   xRcBuQGGV6hG9dJnb7l9BoIuL3LelOka7E5ehvSdOSMdHszPM4N4ehFPK
   nwW3N8WdjxZw46NkcqLACvgOy6vt61i9TE9QVbAfjJysm0szHbxi9bffY
   BSnGD4lftxSwxvB+gbDE0ss5ll/F+u3pj38I/609MSThgDOjfqgYw1ayr
   g==;
X-CSE-ConnectionGUID: wniP0l+KR0uydgMRENo7nQ==
X-CSE-MsgGUID: NlNAscXuSgegIVZCGqj8Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64254198"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64254198"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 11:16:02 -0700
X-CSE-ConnectionGUID: cDHQqetwQrCEYMb40JK10w==
X-CSE-MsgGUID: mPNxOm59TJmUYFUUBSmQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="174442022"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Sep 2025 11:16:00 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uywhB-0002Lf-3B;
	Wed, 17 Sep 2025 18:15:57 +0000
Date: Thu, 18 Sep 2025 02:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>
Subject: [linux-next:master 9574/10189] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:495 function parameter 'vm' not
 described in 'amdgpu_vm_lock_done_list'
Message-ID: <202509180211.UAqME0zj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
commit: 39203f5e6dcf2b0529ae526004e7a9c8ef453ae2 [9574/10189] drm/amdgpu: fix userq VM validation v4
config: i386-buildonly-randconfig-003-20250917 (https://download.01.org/0day-ci/archive/20250918/202509180211.UAqME0zj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509180211.UAqME0zj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509180211.UAqME0zj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:495 function parameter 'vm' not described in 'amdgpu_vm_lock_done_list'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
