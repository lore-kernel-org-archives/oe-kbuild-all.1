Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99E21A3A80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755266831; cv=none; b=hhnMwdiqyyQHYcyFU5XZaRuobHJ9OB0hb4x4XfciKvzgJjRhJW1zppg9PKxZRe7pSdmU4rn/W6dDxjKd2byWf+Uecm7HgAeaj4EA9ytXrw/WyXcbesSZJ6zot24wgxVv+YT6wFcYw/Su356EiKku2Z1JbKz0aANq+B971hzzPj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755266831; c=relaxed/simple;
	bh=3OSFzFlG8vm9G9Fy+u7rhZO55oyoT8k1+NBz3fRhShM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3lxDPq9d1zQpupuzpzwnwQ9Pa3fYdKUbn3ISlX5Slyl89Yxm8AL4KW9kDr5HkfmRahuo+3bDMlMP6QrdQXdpd4Ea+PhOPfmQoX43WRj2W/b/6YwzX+cWiFNNpKQ4QRtzBpQN0VS1c73PaJo0kixPGRLwD/COIldc8/z+e5X9KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jim1X7+Z; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jim1X7+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755266830; x=1786802830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OSFzFlG8vm9G9Fy+u7rhZO55oyoT8k1+NBz3fRhShM=;
  b=jim1X7+ZVQ/HeUK3LQYEnFOm3aD8TYhd41kIU3UqKauEa5Tpfz/H1bbK
   v/9JYa6eIpMOr5gvo+vI6BBHynPq2pCtgxuOAJ0rg7S03NtaqUcVhrdAT
   6PqGGKIBHSR9ZE2H+9gmzlI7yV25r6eAXPjFjgKUqqWKfSKcMnu/WLPGG
   zp0qEg0NlAPho8WEPP7ZFVWh6SGwrfodiIPNXBkpGozfjEvDkQwLret0g
   hgZ/b+3qZ0ztuTPPYYdjbFWw9cl3Tuthzhg0GK7zPsg0mwj0xtwC3FC4i
   DUp5v/JYpYtYgBs1kE7Tv3hB5V65GSeYZeDPVjIwZmIGbMa3L99/XWfTD
   g==;
X-CSE-ConnectionGUID: XkbEDD7dRdeE3D3W2U7w8A==
X-CSE-MsgGUID: BT0PzwZhRfqzSd3G7S+dNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="56611271"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="56611271"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 07:07:09 -0700
X-CSE-ConnectionGUID: +5a1f7XrSFaXzft2B03/2w==
X-CSE-MsgGUID: cwI6pKRgS5ehldKl5hpnxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171147690"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 15 Aug 2025 07:07:08 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umv5G-0000X9-10;
	Fri, 15 Aug 2025 14:07:06 +0000
Date: Fri, 15 Aug 2025 16:06:21 +0200
From: kernel test robot <lkp@intel.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 2242/2770] Warning:
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:41 function parameter
 'mode_clk_rate' not described in 'dpu_core_perf_adjusted_mode_clk'
Message-ID: <202508151602.Ypw4asyH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1357b2649c026b51353c84ddd32bc963e8999603
commit: 79e90ee1da43397ad1d534009c67b2c4f6263e3d [2242/2770] drm/msm/dpu: Filter modes based on adjusted mode clock
config: x86_64-buildonly-randconfig-2002-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151602.Ypw4asyH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151602.Ypw4asyH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151602.Ypw4asyH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:41 function parameter 'mode_clk_rate' not described in 'dpu_core_perf_adjusted_mode_clk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
