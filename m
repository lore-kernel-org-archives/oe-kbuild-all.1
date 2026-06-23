Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F18214E2F2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 01:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782176922; cv=none; b=QcASA2ydQOvvyE/ifX5d2c+G8lROM0s2O0QK7ZozN0x8Gu8nbrp8gUuz+DUepAElBLQYr0LDrRLPHlsIhzyTRtL/rTiwSkeOW11Jv3kDahraqdRPGuz0mxvL6UXnuUZbUJGNUoqBfBKTkmzkc4DTtNiB99e4npWL4Lqz5/6+PJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782176922; c=relaxed/simple;
	bh=2EKGnQ9P9ZIwGnX+GMMY2LVON4+8qXD8DJydwS8E4C8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RLkuUv0oqdT3JDDGgK6ZGUCX5XqSlJYM/YsVEvHKRTOGTmI+b+Wna+mjU9DO4qLksQDs+X5wst3pdt4DTzq0M4cBF1IXp9PaB8Zm0jGPV8hi/TSFFk/K+QUW/0FEu7Fl1++Yh0dcr3GukzzOcQaduymmw+q+B3PMMTO5Q55IFJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNqhdcSW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNqhdcSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782176921; x=1813712921;
  h=date:from:to:cc:subject:message-id;
  bh=2EKGnQ9P9ZIwGnX+GMMY2LVON4+8qXD8DJydwS8E4C8=;
  b=YNqhdcSWbbaKmI0QbTTO1V8e8iOVmGMEe54VjhsidyFPDK6EA/1RtsK9
   sL94t1WKoGPDxUXPQOEIIDKPfBaP61BFshA5lSYsIOxoLiJJzndfvjB+N
   tISSbdNDytwB2i9naGozvl6fVao/DkRBbMewKgdfVrq4TcOBwmwwmnF2o
   SbpacjUZZQ0znY9nabwISzbLoaQO2tV3aj6R03Mz0fOzOeus4f5pwslrH
   ocvOibzTw66i/ERHQHuvv1IEGNUwQ6un1MVMAlGn/iC3ZwpdXMOa7e/8T
   dvtGMbnVQfD4sxLmSb9+VrP+Nntlg6VkOO3pP1xQlTXfR2BVIwauvePWT
   g==;
X-CSE-ConnectionGUID: n3oBN6i7TR+lTOjgH/5SgA==
X-CSE-MsgGUID: /cHO8F9MR+CeAV8Z9XwyAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="86757079"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="86757079"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 18:08:40 -0700
X-CSE-ConnectionGUID: YCIojvdJS/CDet7Ghm8qmA==
X-CSE-MsgGUID: Iv7HGNaBRw2hwzxxPfNkjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="254460939"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jun 2026 18:08:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbpcy-0000000027V-2gbj;
	Tue, 23 Jun 2026 01:08:36 +0000
Date: Tue, 23 Jun 2026 09:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1] Warning:
 drivers/gpu/drm/msm/dsi/dsi_host.c:590 function parameter 'is_bonded_dsi' not
 described in 'dsi_adjust_pclk_for_compression'
Message-ID: <202606230824.8YfzODqb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   af6c9c0964fb860c57beb367d866b6815cf3db63
commit: 6b4a1ff808851acf59eff53163b7809bb026eca4 [0/1] drm/msm/dsi: fix pclk rate calculation for bonded dsi
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230824.8YfzODqb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230824.8YfzODqb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230824.8YfzODqb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/msm/dsi/dsi_host.c:590 function parameter 'is_bonded_dsi' not described in 'dsi_adjust_pclk_for_compression'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
