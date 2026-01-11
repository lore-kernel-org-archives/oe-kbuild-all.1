Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6A1A5B84
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126716; cv=none; b=RJw4ehYlcol8YXr2XA83rkBFlpHjXUae9AjmPyMhehqKkqr8SlnQxrE8VmCkcCmXm2Ie1lBJNrPE90LQ1/DXFQ0kfGPlXr8kH5tod6v1p/6oGKIfXcker+jDWbUKr/3QdF7yFkmvWIz03lz8gnJKQeOc4UaxKDXJ5dlQ5CfRyDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126716; c=relaxed/simple;
	bh=PtPULmUV74LY14cCFXEkLcQkLE1zRWh0GzeiNtLjByI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VWGRoGzY8UTsLOOq2/YYeVR57/8Nd0H9XpnsUwuvpdOerCT0ZvBMz87u3F1A97DB4liW1UkGFehz56Lj7IeIWpMBPUkOw1KUgbRc3KkPBxLqguGFp0hF+rpG3HQ30wpA2XmGdis85zwW9CCFP6x+4hjof52bXadcFxcWdnodFAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8dh+AJC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8dh+AJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768126713; x=1799662713;
  h=date:from:to:cc:subject:message-id;
  bh=PtPULmUV74LY14cCFXEkLcQkLE1zRWh0GzeiNtLjByI=;
  b=M8dh+AJCRVtEjZdar8ca5iskCbAaTnR0uZfNZUdTStOBR7DE2vHlk81G
   zqF1rC+tNDPUHd+JazCBvf7wFOXqXMvQCXuZxFxJK7SxcYaNIY+0NVKw7
   mkX66rNOF4fvU3P9WXrM3RG2Ag5vt+eGHDgLakWqiUoAz4Ri9Mn3+ZaAa
   sI13RqsYwWD6stxyRsywrGghLJooOVIZ8ln44bZ7xjbZFyC00QdISDz+g
   jBurJMnTVodtAfkfk/yRjdM0zIHei4n1qEwlrGErQratsSHbVp+aOJbNK
   qBq+nqsElTOHnJV+NX4T7YQh+fqvu53cpxKBkhm+qavim/FWJN7+kflXy
   w==;
X-CSE-ConnectionGUID: 5zXVn+WBTMyDhMzbN/e22A==
X-CSE-MsgGUID: i1ry41yhSzGrfDPLYI30qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="56985427"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="56985427"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 02:18:33 -0800
X-CSE-ConnectionGUID: DMttD2UhSHiJtbpsoF2uYw==
X-CSE-MsgGUID: ZX6SwElpSQqKJ9zVwmZevw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="203469463"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jan 2026 02:18:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vesWj-000000009uK-1XCK;
	Sun, 11 Jan 2026 10:18:29 +0000
Date: Sun, 11 Jan 2026 18:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:drm-next-6.20 453/461]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu15/smu_v15_0_0_ppt.c:649
 smu_v15_0_common_get_dpm_freq_by_index() warn: inconsistent indenting
Message-ID: <202601111807.6vHCkToR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.20
head:   38a0f4cf8c6147fd10baa206ab349f8ff724e391
commit: c7fc0f372374cf463be2ba4b5b21c20c3c051bb6 [453/461] drm/amd: Enable SMU 15_0_0 support
config: s390-randconfig-r072-20260109 (https://download.01.org/0day-ci/archive/20260111/202601111807.6vHCkToR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601111807.6vHCkToR-lkp@intel.com/

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
