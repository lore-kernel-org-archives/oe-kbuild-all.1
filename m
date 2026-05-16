Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4A33F58D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778930737; cv=none; b=OyomiwKD2jPIZ7rCDro5JJQALiVbBRO792glBtAO0y3BWxhKZiDnLIG7RbiAYpqUI9W+Avx0qiOrbl/XHVQT8iAUJjkvLMVRZgnT6BtoN2Db9IGjCApE7rNvXsvd4Ddmdw8vPRlyyKuiljUp9af4KcBpH47jkwZ8Nj0OHlfBmVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778930737; c=relaxed/simple;
	bh=vviPTRrVHHFpI6amk6cRTLkvpVCi3Mz8Yl3/xnqm8dg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FXfuB6/x5FGzXsJl0BW0VT7g+7I1t+XMkaYsWkeshBfoJCgVnG3m2puPwuP/05QLmSSpVsFNvT4w9tgEZkZFsTcUyFDp7RnoH3VIDMuNpE4jTjl/FBRBVyTLIozm5zT59UXH490XGbJ8ZLeod5u/yZHgTXE0PriCO8rgXI+7rGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckEifcO4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckEifcO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778930736; x=1810466736;
  h=date:from:to:cc:subject:message-id;
  bh=vviPTRrVHHFpI6amk6cRTLkvpVCi3Mz8Yl3/xnqm8dg=;
  b=ckEifcO4WINazK2ujjlMBaQrqk9JaiiqXzR4PQETyFMEqfCkOmwblmGU
   8QO8z5Q5pAUIk2Vh3R+ZFPjtKQKOSgAj/yPQmciko4eykdP2Atnuh6OLq
   stmCcqonj5agyhC8I62/ouRJQe0fYoVBf+Ju+fXr+35Pxqr21gwuu+qny
   hUgr8O2T6r+oxuNvlSkeM5Zgu2dGDeaZRvrTu8HaMeKO0ujy44Sa5CgTl
   KtwLBwwLk5wkDhUNMPgxcZiiRRrGUuNB8jaOeI9JJq9zl53Fvk7pKkfQC
   GnS/G6AvR/cvju3UWDdFS9vtyVZSGcjfe0GlaOFoDGWnBXAMHVKG9Voce
   g==;
X-CSE-ConnectionGUID: IpzBbV6uTCC5BNlFe3C2fQ==
X-CSE-MsgGUID: rQzl5LHaSOeLviGM60qpWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79762089"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="79762089"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 04:25:36 -0700
X-CSE-ConnectionGUID: CYMC4mc1TzuKBrDEn0kDzg==
X-CSE-MsgGUID: TwSXQnd9TL2YyJBqlXuDcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="277054030"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 May 2026 04:25:35 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOD99-000000000lC-2f6f;
	Sat, 16 May 2026 11:25:31 +0000
Date: Sat, 16 May 2026 19:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 105/180] Warning:
 drivers/gpu/drm/apple/dcp.c:100 function parameter 'crtc' not described in
 'dcp_crtc_send_page_flip_event'
Message-ID: <202605161959.6BuedvFt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   6ef0960d4e4ddc8a883852c07fb4cafc2c68c042
commit: a4410dd6e5591be03fbe4c8e485565a4900a8235 [105/180] drm: apple: Override drm_vblank's page flip event handling [HACK]
config: arm64-randconfig-r071-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161959.6BuedvFt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161959.6BuedvFt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161959.6BuedvFt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'crtc' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'e' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'now' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'start' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'crtc' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'e' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'now' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'start' not described in 'dcp_crtc_send_page_flip_event'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
