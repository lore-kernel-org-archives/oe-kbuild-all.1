Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8E313635C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 06:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420437; cv=none; b=gjVOICoTecyu9BZJfYgVFTM67sOXdrbHgLCEiKSEIW775oO1B149L35isCo/Q5ciGvnkv2DTFcAQUmtMIMRBawtr2qjCfa0tvdjvh0ypveIg3WmCdsEQA6tT6ObH0f0CrhInDEEmK9gu1svR/m0v2epyj9GULeI0h/qEkbMTF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420437; c=relaxed/simple;
	bh=nC3OWLgHfDfpW6/BwgSRqD9J0FyK+QmA4jjbIvAg8OI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oNSHB73Jf2NFp0lAYG5VkrZ7cZxI26OkDJbFhbLFMTo7uSVeXiS4luvp7vptYBjZdIqgOBefmUwtjugXg/1moQVjEYGFvbgRkY/oIBIc/BxBTejkAhISz3J/fyNzGiPqyWluZuwnveYhS4bcETD/L4fbXYqYo3n+bEHZxTYQDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWLABZ6Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWLABZ6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774420437; x=1805956437;
  h=date:from:to:cc:subject:message-id;
  bh=nC3OWLgHfDfpW6/BwgSRqD9J0FyK+QmA4jjbIvAg8OI=;
  b=EWLABZ6YHSDHuOAXcJJ/FmRN3Ozb9c0a7hSfTAWfnwl//1ODkxoX5ud0
   AHN/izmtJnZigNKANJX+DmeEn+T3UWP1xRsLnvgG8uM4yQqlV+xhivjE3
   s7j8y0tJeWFNFg5lgGoDwCA1BBiV9mT6JSi0vRWjDm08iwJtvhnquQ2ch
   kUIRKu5xqoWQ2Ud2YvLI+lkckvk+ldt6R0IO30C8ZoHA9fHZcnBRhL3Mo
   FjF3WN3HspC/axW9jgLgkra8Mo3qMsWS721kH5eN41whLLGhVqEc/PFmW
   imgccqpz5t2JPETFCO0suvlzTdmyoyXCvntMeXOhY/H5e9NYhTMfT9tQc
   w==;
X-CSE-ConnectionGUID: PEQaT3tTSQa70uiotPQgiA==
X-CSE-MsgGUID: 1aLrIqOBQuy6pSV7Y9TGfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86144701"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86144701"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 23:33:55 -0700
X-CSE-ConnectionGUID: v1W2mgU5SOmas0thpApQQw==
X-CSE-MsgGUID: pNcKyhu6TMeYcedJoTw1ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229506326"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2026 23:33:53 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5HoM-000000006JP-1JXd;
	Wed, 25 Mar 2026 06:33:50 +0000
Date: Wed, 25 Mar 2026 14:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: Asad Kamal <asad.kamal@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Yang Wang <kevinyang.wang@amd.com>
Subject: drivers/gpu/drm/amd/pm/amdgpu_pm.c:2248:32-38: opportunity
 for str_enabled_disabled(npower)
Message-ID: <202603251434.zIN2QYWn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: ef612f58d944ce4a468fa533335035a6e5163eda drm/amd/pm: Add sysfs node for node power
date:   6 months ago
config: s390-randconfig-r052-20260323 (https://download.01.org/0day-ci/archive/20260325/202603251434.zIN2QYWn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251434.zIN2QYWn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2248:32-38: opportunity for str_enabled_disabled(npower)
   drivers/gpu/drm/amd/pm/amdgpu_pm.c:1600:5-51: opportunity for str_enabled_disabled(atomic_read ( & adev -> throttling_logging_enabled ))

vim +2248 drivers/gpu/drm/amd/pm/amdgpu_pm.c

  2226	
  2227	/**
  2228	 * DOC: npm_status
  2229	 *
  2230	 * The amdgpu driver provides a sysfs API for retrieving current node power management status.
  2231	 * The file npm_status is used for this. It shows the status as enabled or disabled based on
  2232	 * current node power value. If node power is zero, status is disabled else enabled.
  2233	 */
  2234	static ssize_t amdgpu_show_npm_status(struct device *dev,
  2235					      struct device_attribute *attr, char *buf)
  2236	{
  2237		struct drm_device *ddev = dev_get_drvdata(dev);
  2238		struct amdgpu_device *adev = drm_to_adev(ddev);
  2239		u32 npower;
  2240		int r;
  2241	
  2242		/* get the node power */
  2243		r = amdgpu_pm_get_sensor_generic(adev, AMDGPU_PP_SENSOR_NODEPOWER,
  2244						 (void *)&npower);
  2245		if (r)
  2246			return r;
  2247	
> 2248		return sysfs_emit(buf, "%s\n", npower ? "enabled" : "disabled");
  2249	}
  2250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
