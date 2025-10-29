Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F7532F75E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752296; cv=none; b=kg9j1gP/iv14cdnVdbjuUHnIUV/xyd7huAvCbaHz4cCPU4KhpIScT5BR8rFS1ywd2QE1dR7M/7j/LFri3YaivWjZUYy5+VnEj+O3SkGWeYW0xSINWH5+WUMSTCtiqMlDm0kOZlZPS83xTBb7H6na3FAOywarLvAI3Gm5YIZnLY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752296; c=relaxed/simple;
	bh=D+SFh1KWJzBttUNNZZmBsQewJ0taqcAv/hc8NvxkTgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQE+V1ZCsXXYCcuT3sOxm6JYAGvTtt+sZzDCUWbWTLWHOIHqUJxsuxtzz3F5hbME4UIUj6xE7XxnZKEb+hLXWmhVdMxP8AyCkMifW4z9TcrVv19OQ/VO2jTcsuoR+MINGfjM9LdHm5RuCPxnZP0DxArBr5woigaMuPT7t9jJpOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiEkkKZF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiEkkKZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761752295; x=1793288295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D+SFh1KWJzBttUNNZZmBsQewJ0taqcAv/hc8NvxkTgE=;
  b=NiEkkKZFjg0seD2l7cE4cDDma4YwRVv6nAVTU7KYyRdyVA/7xVSQz4dt
   Nin+5KBzguAb2LlzCTf8J4pFiWEIw/PF6qqZVtQ7Kr2GESzpX8HSHjhld
   jz1JAvAJngg3mc2IGcOS2WYkaiFjSqP33HIh7L+k4wFPRvLMpZ3zInJaB
   I8dC2ep5PiVhZpBvr7WatAM2eb+eqYBqRsBOdksgjK2q0YGSVokLuzbZV
   Y85TuIlUcAPyqmD9+YR+UqJ86QZe0ISmZpWfkR9fbvgPXDR+p3gv7h6V9
   w/7jMX2SDhyKvCoDxIMrt8vixuq7tfwctlLcHH+nJG8jc/7yozhVBNTY1
   g==;
X-CSE-ConnectionGUID: 5NNSYaYuRMC3q1c2o7u86Q==
X-CSE-MsgGUID: SCuIl2vFS3C6Nqv3DI4dqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="62902976"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="62902976"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:38:15 -0700
X-CSE-ConnectionGUID: n+3YVUL5SQ2sOpW3MeS9PQ==
X-CSE-MsgGUID: Rni/4by9R6+T75/5IKhotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="189763448"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 08:38:13 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vE8FX-000000000w8-1gnv;
	Wed, 29 Oct 2025 15:38:11 +0000
Date: Wed, 29 Oct 2025 16:37:59 +0100
From: kernel test robot <lkp@intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 4411/4731] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function
 parameter 'connector' not described in 'amdgpu_dm_connector_detect'
Message-ID: <202510291641.KccVBLJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 8223a605744bb471f31018eac9075a539415b16f [4411/4731] drm/amd/display: Refactor amdgpu_dm_connector_detect (v2)
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251029/202510291641.KccVBLJf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291641.KccVBLJf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291641.KccVBLJf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function parameter 'connector' not described in 'amdgpu_dm_connector_detect'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function parameter 'force' not described in 'amdgpu_dm_connector_detect'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
