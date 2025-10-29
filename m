Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F19637A3B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 21:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761772937; cv=none; b=NqPN1PIQiq5vT1qxaONJE3fzGJe4P+r92EHTrlb7zzuD6Aep1YuuHPAgmLN9X0k3YSCbZgGbdvjZUJSV6jisxWYsMPn7+C70GhGjzf2OTjHXV304zh+AmLPxR9qY1ga/aXeZ+L8x+sHsZu5ISJW4eZXzMoR2AHCSfr/7+A+buPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761772937; c=relaxed/simple;
	bh=yJOt35DAFGlL9XQGNIoSCnVmg8tZ+/CXspaQPxbhe2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ECOj6nREL9SJJNtCrwwQ4S0cNRdzndwe/+6wUqYu4ZCkWpvWXw63LREuyhZ/bTUq6DAFIsNicU6zyL+5aZ5wowZWOj3/cTWXHVynSK3Y9nxa6hyad+O8jSE8fZIDdkUSlOFC/rNzdjLQkeDALB3NIgPcKpgmPhr8EkIZ6W+1xR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBIA+FKC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBIA+FKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761772936; x=1793308936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yJOt35DAFGlL9XQGNIoSCnVmg8tZ+/CXspaQPxbhe2I=;
  b=cBIA+FKCuXn0ge9JUM6ZVmEX/uqmb9TawmgniZH2wYfYSuPXf6qjDmfX
   6rP1EpD0+n3pZf7lseLP9QWHEUCpykKEdeImDqfD/DWYar2fqURudrwSi
   5v74tNwNo1dUV8AU8ftJBz5KhYFVmxwlW3KreffMoOsjeGfPnx5mFyCLe
   KYwo8LW5K25OJ+3Ox6+5eFO7kItTmTduTscNkHwJZ15tIhyklWIGEYA2m
   YxTcZyuhSsxoER12vKCf3CvSMGvlN7Uo2YcoN2uw5e4yTBIdRmP5CYHpu
   hcjaCFIz4xFEZ3R7Qpy8SklRG5pTFL4c1LTixOl4wWsUnqL3UH7KxjNDc
   g==;
X-CSE-ConnectionGUID: eB5a7RwmSrC6BcmOsx1vsA==
X-CSE-MsgGUID: 7aZqi5nwQuqCapdHlg2lDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="51479943"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="51479943"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:22:16 -0700
X-CSE-ConnectionGUID: 3+popM9HTFmCCL66nDfIEQ==
X-CSE-MsgGUID: Qm7+5aNJRZyGzOfLUFe+Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185429726"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2025 14:22:14 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vEDcS-000000000x6-1r5X;
	Wed, 29 Oct 2025 21:22:12 +0000
Date: Wed, 29 Oct 2025 22:21:15 +0100
From: kernel test robot <lkp@intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Wayne Lin <wayne.lin@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [agd5f:drm-next-6.19 224/235] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function
 parameter 'aconnector' not described in 'amdgpu_dm_connector_poll'
Message-ID: <202510292257.F4frk3Q9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.19
head:   1bc9d39275e08853ff15410b4d530b46b546affb
commit: c4f3f114e73c331f02c7188af650901ee3bad2c1 [224/235] drm/amd/display: Poll analog connectors (v3)
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251029/202510292257.F4frk3Q9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292257.F4frk3Q9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292257.F4frk3Q9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function parameter 'aconnector' not described in 'amdgpu_dm_connector_poll'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function parameter 'force' not described in 'amdgpu_dm_connector_poll'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7299 function parameter 'connector' not described in 'amdgpu_dm_connector_detect'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7299 function parameter 'force' not described in 'amdgpu_dm_connector_detect'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
