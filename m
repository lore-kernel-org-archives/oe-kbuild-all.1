Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CD1FB3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 18:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742408443; cv=none; b=lHygsaMBcpALc6DMon2bOrj7nyFezqZ/YjIq+QGx5bOYvZ1/WBEdTL3HpF/RexdaFps1vrRiFxJX2fMhoHfMThCgI87Vkw34Dlc3G767jGzJVQ81ut5R3Z2BcdftudPY4Q/dObaNT2unfL46CLWf/M4iLNjMgkFkU1o/p3v7teY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742408443; c=relaxed/simple;
	bh=7vZDOyC3zEaURF16BJdM/cGkUT/f8aM1dps4RSnyi2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTbN58ynb3941R/36eIERzQBi9llVUcqhMQdGXyTzQCtVb7W9tBevyJIIbQ3yhYGsEs3sr8rCKAHJZFVHOoVKWAOOOrRFN/MoXjraYoACjCDyztYZ8FQqaCnz9J5phjp94nLdun1xhZo4jYUDlC/hRG1i0G6FECy/VAyPx71qd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/6HiDVt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/6HiDVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742408441; x=1773944441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7vZDOyC3zEaURF16BJdM/cGkUT/f8aM1dps4RSnyi2Q=;
  b=G/6HiDVtuh/XY9NEi8fMfRJxuWYzlgXhYzZrbK729xrXcStbDroLWwOc
   fOk+fe43sJr4bINuwuC4qTuxHzIvEwBMOU1wc5vkijdajWZL1QOlbDD1q
   kkQwyzhJer01+cWrA/CmCTu8Aw4FYiRG6RrRviBS0iZ3C35b2eRQ/roXb
   bTcaRlpFpYfX9NFzKCXNOjoINImlAzdubSI0AiZo4/Be+D2SZQm5B42jX
   Oz/tzDI6VNLnJcQq0UpwqfvA1arRFRfFF2FfP3cg+Jv+y1JH75XT07+hN
   FTVv9iH4rSk5Gbp3cv1lDOPlWqq2t9FP8G5Xt9oPGHHYRIM+NBc/PMU9s
   A==;
X-CSE-ConnectionGUID: Yy1t/ozKQ+2oloZJBJFdMw==
X-CSE-MsgGUID: 0faJ1+K3RNiocdB43zJZzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47497621"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="47497621"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 11:20:40 -0700
X-CSE-ConnectionGUID: LyP6UPj9QrqXYMrdrIE/XQ==
X-CSE-MsgGUID: qnbDHuLoRvmM0ByenddytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122750190"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Mar 2025 11:20:41 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuy1t-000Fas-1w;
	Wed, 19 Mar 2025 18:20:37 +0000
Date: Thu, 20 Mar 2025 02:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 42/42]
 drivers/gpu/drm/amd/amdgpu/../pm/inc/amdgpu_pm.h:109:50: error:
 'amdgpu_set_thermal_throttling_logging' undeclared here (not in a function);
 did you mean 'amdgpu_get_thermal_throttling_logging'?
Message-ID: <202503200253.RFBPfeFo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   5a4379a0d448c61c5baf670bcc7f9041bc243b02
commit: 5a4379a0d448c61c5baf670bcc7f9041bc243b02 [42/42] drm/amd/pm: Remove unused amdgpu_set_thermal_throttling_logging() function
config: i386-buildonly-randconfig-001-20250319 (https://download.01.org/0day-ci/archive/20250320/202503200253.RFBPfeFo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200253.RFBPfeFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200253.RFBPfeFo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ring.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ctx.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:26:
>> drivers/gpu/drm/amd/amdgpu/../pm/inc/amdgpu_pm.h:109:50: error: 'amdgpu_set_thermal_throttling_logging' undeclared here (not in a function); did you mean 'amdgpu_get_thermal_throttling_logging'?
     109 |                              amdgpu_get_##_name, amdgpu_set_##_name,    \
         |                                                  ^~~~~~~~~~~
   include/linux/sysfs.h:234:19: note: in definition of macro '__ATTR'
     234 |         .store  = _store,                                               \
         |                   ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/inc/amdgpu_pm.h:108:9: note: in expansion of macro '__AMDGPU_DEVICE_ATTR'
     108 |         __AMDGPU_DEVICE_ATTR(_name, _mode,                              \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/inc/amdgpu_pm.h:113:9: note: in expansion of macro 'AMDGPU_DEVICE_ATTR'
     113 |         AMDGPU_DEVICE_ATTR(_name, S_IRUGO | S_IWUSR,                    \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:2328:9: note: in expansion of macro 'AMDGPU_DEVICE_ATTR_RW'
    2328 |         AMDGPU_DEVICE_ATTR_RW(thermal_throttling_logging,               ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
         |         ^~~~~~~~~~~~~~~~~~~~~


vim +109 drivers/gpu/drm/amd/amdgpu/../pm/inc/amdgpu_pm.h

4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27   97  
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27   98  #define to_amdgpu_device_attr(_dev_attr) \
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27   99  	container_of(_dev_attr, struct amdgpu_device_attr, dev_attr)
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27  100  
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27  101  #define __AMDGPU_DEVICE_ATTR(_name, _mode, _show, _store, _flags, ...)	\
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27  102  	{ .dev_attr = __ATTR(_name, _mode, _show, _store),		\
2ea6f4d94d0d21 drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h Yang Wang  2024-03-26  103  	  .attr_id = device_attr_id__##_name,				\
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27  104  	  .flags = _flags,						\
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27  105  	  ##__VA_ARGS__, }
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27  106  
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27  107  #define AMDGPU_DEVICE_ATTR(_name, _mode, _flags, ...)			\
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27  108  	__AMDGPU_DEVICE_ATTR(_name, _mode,				\
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27 @109  			     amdgpu_get_##_name, amdgpu_set_##_name,	\
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27  110  			     _flags, ##__VA_ARGS__)
4e01847c38f7a5 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h Kevin Wang 2020-04-27  111  

:::::: The code at line 109 was first introduced by commit
:::::: 4e01847c38f7a5e2b0ffa8ff74d6bf0e85924240 drm/amdgpu: optimize amdgpu device attribute code

:::::: TO: Kevin Wang <kevin1.wang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
