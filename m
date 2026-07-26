Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508C4353A73
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 08:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785054112; cv=none; b=n+IllB/2FtLQ0LXRusRJL4TYtqVHEzF3WWT88h8o9u74B8F7fFI3z0w5ORRka/Ev2KeYyLRepb32Qcs+7XxXdzHUat/lAffd8fEImaRSb43OOQhGrdBuSjpt8B/i29LUth0/BtHnq9KmA+4p2omdLpgK1v2mjBvq+SKJjWdrYuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785054112; c=relaxed/simple;
	bh=1ggg/8J5V4+jZQAO8tT7fqQfod528FmTaCUSZ0h6bKM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R4BAvbgkDiLmUQEV/+EjQUwmzpg96atoFodWpnB6IBc+6eLqdpjikno5dJRpq2Cfwzt0UjSnxL3FTC1iTCymMfC+GCgZeeZ7xSspsXC261e5yeR/5vneVB66YfMKNkwd9XP18vQNz9VUs8tpZ/qWbQ9L8VzQmG+hzR/H/sQ+7Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kX8zrb/5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kX8zrb/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785054110; x=1816590110;
  h=date:from:to:cc:subject:message-id;
  bh=1ggg/8J5V4+jZQAO8tT7fqQfod528FmTaCUSZ0h6bKM=;
  b=kX8zrb/5IW6/yIRCk5X9MCtKnh1BXJr7/J9byi75XkMHnVEjmwdk4BRh
   c812Cw3TBGKV3WDHOdUaCjwUybcpg/pjhQ7At40rxXWQhDK89Zp3qUeHT
   tW5OGH7bS3CgqnOlg5EtigBy5WF1wbvFw6Ozh1rjofiIbCGD1SuB7+Q5k
   wV0KxMgzXKUJ8ffSXtTd2ETLFijZNK3LqXEdhudvudb6XsOsEYLDHzs+K
   LG2fD5ySjVp1OUIzSzJ4Cp24BrQvJ8cdZmTPOuuy80C/YuFIUQCKmNCV9
   XnUm9n4LXQVaiM5sIqxyie3/Y4MHRJLAY4HT5MqpjegUS2H0x4zXiNt4D
   w==;
X-CSE-ConnectionGUID: Z75dv71eSnWlcoGE1ZyWUA==
X-CSE-MsgGUID: nFucU8FZTjikuBcdfUcrVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="108447493"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="108447493"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 01:21:50 -0700
X-CSE-ConnectionGUID: YcivjYmWQwi89/iQpr7M7g==
X-CSE-MsgGUID: m4jvevXiQgGkqNGQooAUTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="255756631"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jul 2026 01:21:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnu6H-00000000cPS-177t;
	Sun, 26 Jul 2026 08:21:00 +0000
Date: Sun, 26 Jul 2026 16:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu15/smu_v15_0_0_ppt.c:649
 smu_v15_0_common_get_dpm_freq_by_index() warn: inconsistent indenting
Message-ID: <202607261556.yxit2XNv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: c7fc0f372374cf463be2ba4b5b21c20c3c051bb6 drm/amd: Enable SMU 15_0_0 support
date:   7 months ago
config: x86_64-randconfig-161-20260723 (https://download.01.org/0day-ci/archive/20260726/202607261556.yxit2XNv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c7fc0f372374 ("drm/amd: Enable SMU 15_0_0 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261556.yxit2XNv-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu15/smu_v15_0_0_ppt.c:649 smu_v15_0_common_get_dpm_freq_by_index() warn: inconsistent indenting

vim +649 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu15/smu_v15_0_0_ppt.c

   641	
   642	static int smu_v15_0_common_get_dpm_freq_by_index(struct smu_context *smu,
   643							enum smu_clk_type clk_type,
   644							uint32_t dpm_level,
   645							uint32_t *freq)
   646	{
   647			smu_v15_0_0_get_dpm_freq_by_index(smu, clk_type, dpm_level, freq);
   648	
 > 649		return 0;
   650	}
   651	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
