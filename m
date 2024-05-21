Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765CD35894
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 22:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716329215; cv=none; b=tgVfFInhZ38pyPtMW9/U9EbcJYH94WkSzuje/KQSGM4QTKZ/VRvu1JfwibI02FCC2yve9sVJs6HfbpVWscWU3vaQgdArbz0LeeG0Od+8kq5ZeKcOBZZFPk5R6xsFgfQ0xgNRRG/pgsuHyaMlt7oGhCrEpBkJPKgxvcYxMx1u2eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716329215; c=relaxed/simple;
	bh=CBV/XpEt9K4zG26mdSfZNkds/1g3EL0AEUVx8y7zZqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InDaClLz536I2OmwSh6fJbbzoEujVwROtEuq5Tq3YWuT2tW1qd7P2ZDPtOm20BryNzcJfMnOVVA69Mzc/7UsmKeUfFp+M7wKBly8HvAXeXrOBnM/CmeU1xHpPEz8kb2o2HpVPVCmSXg9JtqyC26uVLBeQyQx1h4GO9wlZhd6eaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5bcLNe2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5bcLNe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716329214; x=1747865214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBV/XpEt9K4zG26mdSfZNkds/1g3EL0AEUVx8y7zZqM=;
  b=Q5bcLNe2kjtx5WqrtyvV7ECLZ72Lh/oJ52ORLwrZXdNzulFhTm5/C1cH
   JoVmZeBHPNeEx8l5YHx5ze0swV4Z0OjA+tWV/F+vgS13tGxl8k+PFCvor
   5n51vRUbdV5Uiz9aeyOLJmIOXxgJ9lr61FkLEBRYrqsHe9Nt/TbeQA1YG
   31KWn/h1bhfxMMf6a5AhuBwhk4pbXKLdWU9ZqjNJcZCw/58YN7ONUdg9E
   VL4cn/htrhgGx+0cKwA3CXEkDqc3UV7mmbw7e/FyQ9BXsNCmz7/tavKN7
   +QtCD4d3F1qCfiXHd9ru+irZ1ZcMxLq2yijilGBSt0NUork0VKJbK1HFB
   A==;
X-CSE-ConnectionGUID: gc6s5yO3QjeLMtkoIDjlCQ==
X-CSE-MsgGUID: HyyOFb/iRBWo4AK4KV47nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12726515"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="12726515"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 15:06:53 -0700
X-CSE-ConnectionGUID: z2fuDIFHScm74KZg8l6ayw==
X-CSE-MsgGUID: aA29SDvLQzmn8uNLMly1Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33185577"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2024 15:06:51 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9Xcz-0000mj-1k;
	Tue, 21 May 2024 22:06:41 +0000
Date: Wed, 22 May 2024 06:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/14] ERROR: modpost: "__divdi3"
 [drivers/iio/proximity/hx9031as.ko] undefined!
Message-ID: <202405220611.5KLDPgex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   421af4626226928fe072c5cb10730ef09674e1ed
commit: 3c22f4cfab67e9e5d8cf9c56f5ed6906ee5533eb [8/14] BACKPORT: FROMLIST: iio:proximity:hx9031as: Add TYHX HX9031AS/HX9023S sensor driver
config: i386-randconfig-r053-20240522 (https://download.01.org/0day-ci/archive/20240522/202405220611.5KLDPgex-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405220611.5KLDPgex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220611.5KLDPgex-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [drivers/iio/proximity/hx9031as.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/iio/proximity/hx9031as.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/proximity/hx9031as.c:817:3-9: preceding lock on line 808
   drivers/iio/proximity/hx9031as.c:829:3-9: preceding lock on line 808

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
