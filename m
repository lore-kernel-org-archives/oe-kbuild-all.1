Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA171285061
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 21:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758577221; cv=none; b=WiFzclUuS7mFAFXh2/KxA4AN81sEfWxO5OS/yYZ/pIsYdmRNrkrBxa50Uz4Oa5E8sPW2/pe3zoBM4lzfEPP/dgH6o0lbG2GSreYxkt9ZBgVwyD6Fe4MRcIYJfWVGeetGUgmDEggJd8vJebCCJ6/UUgOCMDJI9QvisSfDBfkh/z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758577221; c=relaxed/simple;
	bh=ds+dkBJo9lMPqag9YGAxiv3DN2dhzkLJxAnjRfGH4pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QjjbzKfyx6kSkqR724X7AZszjNL/RpKhVkQssJoXJRsLIe4V9nRJ46UspaXRF0Cuxu1HazhMlTrL2nSx0TojyDwVzDxnLdncYinUykhonJjDMX8qg1dYj1jHZSXBdxNw/RBNE5BrDbo7LCKUpbIbVfFHkXUfL24rebAc4iI0irA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBH8HjMy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBH8HjMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758577220; x=1790113220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ds+dkBJo9lMPqag9YGAxiv3DN2dhzkLJxAnjRfGH4pc=;
  b=XBH8HjMyrbnCVESG4YSSBo5YpbCM493quX1n38K4r8W/E3vAglDfIViw
   Rt+rmAYepPmwqmX4gwlAJ266XGDCEkc+7dMLpXAXpxvvXsUOcD4TYsqRU
   kmnwQ9cCqHZo1QvcMuRXHx3z1ePkvvIH0uFWhNv2IUtBt3vVxzOjHjTcT
   d9aXHjQsxK60UhS+KiK+nIRSn9KyAbky4y5P9P48M5eMl3T2T0HrKUSwo
   FVph/9fwYPUZ1JA9Sj4WEzz5AdSHgm+l6i9sVMLnPnJz3Zv67XyclUzcr
   kCcetcP1ddTwQgdTT4pf7YoNJax4aIp0lYgbRFtDepzU5P7fa/ul8iVqZ
   Q==;
X-CSE-ConnectionGUID: lyNV7jxMQ/OBFjeSrF1AZw==
X-CSE-MsgGUID: Yjrn9vvURK+Lh3PSzG0tTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60764612"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60764612"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 14:40:19 -0700
X-CSE-ConnectionGUID: 5sc/7u/zSSS+3bCXgA++iA==
X-CSE-MsgGUID: 1dpX682GRISdkYSf0Za8SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="213735238"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Sep 2025 14:40:18 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0oGd-0002VB-2l;
	Mon, 22 Sep 2025 21:40:15 +0000
Date: Tue, 23 Sep 2025 05:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [linux-next:master 9221/11516] drivers/rtc/rtc-optee.c:714:1:
 sparse: sparse: symbol 'optee_rtc_pm_ops' was not declared. Should it be
 static?
Message-ID: <202509230549.L26lw7UZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf2602a3cb2381fb1a04bf1c39a290518d2538d1
commit: 6266aea864fa5484f6e8313f913a69e794765fab [9221/11516] rtc: optee: add alarm related rtc ops to optee rtc driver
config: arm64-randconfig-r131-20250923 (https://download.01.org/0day-ci/archive/20250923/202509230549.L26lw7UZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230549.L26lw7UZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230549.L26lw7UZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-optee.c:714:1: sparse: sparse: symbol 'optee_rtc_pm_ops' was not declared. Should it be static?

vim +/optee_rtc_pm_ops +714 drivers/rtc/rtc-optee.c

   713	
 > 714	DEFINE_SIMPLE_DEV_PM_OPS(optee_rtc_pm_ops, optee_rtc_suspend, NULL);
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
