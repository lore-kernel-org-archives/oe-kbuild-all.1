Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30EB3112B0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770506702; cv=none; b=tjfKXVsIVblITbGIP6cw/Zbrt8+rRCsagmW2XaACyte7B4836PSak5FMD6HajI4RHAm8AdLrPsxCAFWeo/gQ8POXc6Zj0ASDxF0DETbSmh6nQCxNdQ0eaMHSQsnxtYFOYKjpW0KOKj4lZKmqvlv9AyVU4HV2YaZ7yF7JeOlx0Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770506702; c=relaxed/simple;
	bh=fGiYA8sYigW1vJzpmKbbSw9ZVq+fC/++YecAFwjWamo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=THyeOT4+4cpfwxfbhgL9r4Pcz6y1g/E+CtZJ7elyGhIZWWu3GyjrpIaGWWdxoHbV5KUh8BizqMpDQRpvI6qYYcNf7o78P4Jf9OBFyYfg28sLRrjx4YPjk3zjbFlEXFNpgVD5z+xm+dT/DbqiGKoClFGLbKOzT0PZ6itB8+aWtt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlYlB98W; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlYlB98W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770506701; x=1802042701;
  h=date:from:to:cc:subject:message-id;
  bh=fGiYA8sYigW1vJzpmKbbSw9ZVq+fC/++YecAFwjWamo=;
  b=TlYlB98W2O+qJDtgzKUF17QTplXLOGXondG+kU2qHL90U8D8Y6r4thyw
   vtgCPljSE6KZlrsFo7spxH72lfBRXqz4JzRV7tOerqtNmNK6UTgiYv/46
   3yvnpZAmUJwsOPv5IfTlfnP0fpcKXa5VvQ0DODcRdEMm26yEahpEibmM/
   0of8YjaG0dOykYibJLrka6ZbzDRVCJ28pj5p97Kw+TD/HI9k5kAwR4w5d
   i852GlNOfC1hQdNanGpzQIPNHVG24CA8H7B85JXv3oU735aSjy5evrHHZ
   X0MlN51YCGLe5t+tj48mL+puIJrTVh2r9e0SaLXKMpLqKvlvgzBSgH1T4
   Q==;
X-CSE-ConnectionGUID: xGfF3U4sSNOSlE619vz2MA==
X-CSE-MsgGUID: 1P5pMD4eSzKZ7U3NUI1qhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="59239995"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="59239995"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 15:25:01 -0800
X-CSE-ConnectionGUID: eGscRDlBTBStNqGurbGI2A==
X-CSE-MsgGUID: nEL880rvRraiEa71GwY14g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="211026351"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Feb 2026 15:24:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vorfc-00000000lwO-3AHj;
	Sat, 07 Feb 2026 23:24:56 +0000
Date: Sun, 08 Feb 2026 07:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Infrastructure <z1.linuxinfra@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 2316/2322] Warning:
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c:308 function parameter
 'compute_mqd' not described in 'amdgpu_userq_set_compute_mqd'
Message-ID: <202602080728.VCnhQ23i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   5d1d9f4fee686f0d8157f0340f302118110cadc3
commit: a8941e6c6737452bdfead0a6972890c5ca3a4831 [2316/2322] drm/amdgpu: add MQD update support for user mode compute queues
config: i386-randconfig-003-20260208 (https://download.01.org/0day-ci/archive/20260208/202602080728.VCnhQ23i-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080728.VCnhQ23i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080728.VCnhQ23i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/mes_userqueue.c:308 function parameter 'compute_mqd' not described in 'amdgpu_userq_set_compute_mqd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
