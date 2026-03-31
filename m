Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543744CACB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 21:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991757; cv=none; b=jVDKDBJJnTF0FFD6WAYpvVMsfVzi5SuojGseQ8wa+AduYmamBsHVWIWz/75b1bCFULU0Jakttlzd8poxvedQx4pkfBecPI7aSTzPfW6FdIOtOvoi39kkELqYliWjd0lZL2CXGjbOf0wTA+hIB7yHoCLNIpq/8begPcT4m/KKUY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991757; c=relaxed/simple;
	bh=vW+3uPl1nIkF+8f3jOX2R1JtClX6ZyfjFUqWEkMtzBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hCbO2ySmVCU3b7zyRcPoQmIHe7f3bXMISS27LVz6uaXeXLrQVlQZi+Z4lAXZs4Kt5K+8h/WghyEvBA9/bJxB0wLsnWxG/rtsakEYNBCeLFK8A86ZawR5IAP3Xb47X4qI55gyCJOuTiEjX44USAvaUM4Vny8/wRbXbILOdAhDEEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRQievzO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRQievzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774991755; x=1806527755;
  h=date:from:to:cc:subject:message-id;
  bh=vW+3uPl1nIkF+8f3jOX2R1JtClX6ZyfjFUqWEkMtzBY=;
  b=NRQievzO1xCWp8GKsjkttkPO1d6z+vAPPbZu9lkmV2vfExUlbTZnavDm
   l7KUcbxuhWmc009SCU/4Z+vNsQVHbDF3knD2Qh3e8SQ+6B9/TpyFzfqFG
   MnTeRY2x4bKzu9BMSL8Ltt3gIA/HRBYcm+CML4nbTd0m0wlEN+DMrXMsx
   QopWAifTx5GelueFZxL2Q0NydVk9hxyD5wv1n3Lh7yNdrbUVJWgiYJnYA
   OK3iFq5hflVv0yUEqeeq4852BnqdGCRcpQjL5Qykyp+od7vKl2kjqElby
   lGI9VGLaXVIjzj7z7NWeep784E9Kmdo78mT5E32M++aSdre4UZl6YjDsg
   w==;
X-CSE-ConnectionGUID: t6LEzXpKTk2bb3R7XnkOjQ==
X-CSE-MsgGUID: vjhUYBILSe+b/xTImdHsbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76135730"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76135730"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:15:53 -0700
X-CSE-ConnectionGUID: KCrLkARZTOCoAsJzevuYyg==
X-CSE-MsgGUID: 0j/ERAyeRgmDnOPXf/OJxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="225659357"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 31 Mar 2026 14:15:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7gRB-000000008X1-0Ixm;
	Tue, 31 Mar 2026 21:15:49 +0000
Date: Tue, 31 Mar 2026 23:15:28 +0200
From: kernel test robot <lkp@intel.com>
To: Rafal Ostrowski <rafal.ostrowski@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [linux-next:master 10078/10705] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:71 expecting
 prototype for dc_assert_fp_enabled(). Prototype was for dc_is_fp_enabled()
 instead
Message-ID: <202603312329.iN5KYYKQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   36ece9697e89016181e5ae87510e40fb31d86f2b
commit: 3539437f354bd24c98928a80d4db3a23fa2a7b19 [10078/10705] drm/amd/display: Move FPU Guards From DML To DC - Part 1
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260331/202603312329.iN5KYYKQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312329.iN5KYYKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312329.iN5KYYKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:71 expecting prototype for dc_assert_fp_enabled(). Prototype was for dc_is_fp_enabled() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
