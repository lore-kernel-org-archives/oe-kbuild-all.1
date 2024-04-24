Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477001426F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 07:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713942605; cv=none; b=ZJMJHML3QNrcTKrgnfqTTqJ8X+mibkhWdGw4VuIfzyHi7gkaOWMPEY11qVIdB+YLvvWHbqJrp+kl9ghUmeNQbihKXW9QiclH4ebFbTD3/5xliCqTji5yAo1zZMGO3BKdlXP/rds+Hx8w0hS9qk4nm0oRe6WDNdiKKVQi4MMXQ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713942605; c=relaxed/simple;
	bh=fCGlu6rreHmugTXqH7AcnubT01QTss/88HJoVzS6v9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sjgV6aJTcvVBrU4DmtNbd/FW76iUIpaq8yCNTr6q0Jb+Vn5Ad7/idMj82ZhFmtQvcP4hExYIbTdK5sR6CnHnK1RJO/B5jIQT4qE7r3mMGJ2QGMAQGaPUTLDHsXVau4eKX6SXCg1AoW7pNu8maS5IiL2mVGH5CJYsi28soI+EZ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOh6D0Yz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOh6D0Yz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713942603; x=1745478603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fCGlu6rreHmugTXqH7AcnubT01QTss/88HJoVzS6v9A=;
  b=HOh6D0YzJA+czaV+aQNYVTNkch6tp0cHg9EuTS9IdB1cb5cK8oEnMoDi
   8GiVVG/U9bocLjtwqggUKV1dt75XJRl5S6W6Pkwnzx/S3vB67y4g24Kp+
   s01SlqlfT4XadUNuIk6c3sUwrCfGrtDEeR7Knk27N0yeUWNo84lzNhHfm
   tAQzjxzKrpHbjuZcr2K499l1nE3BSOOSLo12Zwnujtw2VWQBD2scB6oF2
   tThr5D+D0wI/DLrWWfkNwtKibXv/V3WeSNhvvknZRaeovPswExfaJ42ql
   VyIB87r1b+Bd4jUpq3mK99oCRk/U1sDO3+btmKr7CULRe8TIeHyfvrINH
   g==;
X-CSE-ConnectionGUID: YzMpKh2ETDyJNzZ7pcadfg==
X-CSE-MsgGUID: sy/IV5Y/SwiDWGDQUA43GQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20172945"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="20172945"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 00:10:02 -0700
X-CSE-ConnectionGUID: uiIpbyUaSVymGOJ+F5o6Eg==
X-CSE-MsgGUID: d0HeJCiYTQCy+sCKcB8sAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="47878371"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Apr 2024 00:10:01 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzWlS-0000yW-2J;
	Wed, 24 Apr 2024 07:09:58 +0000
Date: Wed, 24 Apr 2024 15:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [linux-next:master 6891/7876]
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c:1007:16: sparse: sparse: symbol
 'mdp5_plane_formats' was not declared. Should it be static?
Message-ID: <202404241522.oFguK9g2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a59668a9397e7245b26e9be85d23f242ff757ae8
commit: 6d602db2dd1cc80dda7b19b5c67e960ee7eb6f81 [6891/7876] drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
config: arc-randconfig-r122-20240424 (https://download.01.org/0day-ci/archive/20240424/202404241522.oFguK9g2-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404241522.oFguK9g2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241522.oFguK9g2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c:1007:16: sparse: sparse: symbol 'mdp5_plane_formats' was not declared. Should it be static?

vim +/mdp5_plane_formats +1007 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c

  1006	
> 1007	const uint32_t mdp5_plane_formats[] = {
  1008		DRM_FORMAT_ARGB8888,
  1009		DRM_FORMAT_ABGR8888,
  1010		DRM_FORMAT_RGBA8888,
  1011		DRM_FORMAT_BGRA8888,
  1012		DRM_FORMAT_XRGB8888,
  1013		DRM_FORMAT_XBGR8888,
  1014		DRM_FORMAT_RGBX8888,
  1015		DRM_FORMAT_BGRX8888,
  1016		DRM_FORMAT_RGB888,
  1017		DRM_FORMAT_BGR888,
  1018		DRM_FORMAT_RGB565,
  1019		DRM_FORMAT_BGR565,
  1020	
  1021		DRM_FORMAT_NV12,
  1022		DRM_FORMAT_NV21,
  1023		DRM_FORMAT_NV16,
  1024		DRM_FORMAT_NV61,
  1025		DRM_FORMAT_VYUY,
  1026		DRM_FORMAT_UYVY,
  1027		DRM_FORMAT_YUYV,
  1028		DRM_FORMAT_YVYU,
  1029		DRM_FORMAT_YUV420,
  1030		DRM_FORMAT_YVU420,
  1031	};
  1032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
