Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB32C1552FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765597619; cv=none; b=UGh5d3ZYtNfeZEBVUHX5ge01wDHNpySiYaB4Y2Dipue8wm4T3G9VA5gVJ5U6O0KEbmKKnup3uYLPJ5HAp9nodNN9ZT8Ixrd/fJ3eQuYTzHI5g4FpIc2cgTFMle4HY8eeK/4CmTWbU3N3Iowc9bGNVUNz/D/J2ndOzgxwyC7+e5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765597619; c=relaxed/simple;
	bh=SvutNC3fjUpded1qH4e1Rk8S1KtO1MbBZp+8pcS4+3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qw1EaJUd/e+oHe3d3/BIBw/94IRAjmaYgGCkiYBpIIlhx0M7VfywKqxW4Zc3TB11BMn4eN4DIVBf4bfQOb2So9LRn2enGq1+yRCHkp4LzhpE673f5/SxyY+drikNSplRYc8oN9BN0/cKYeOM5nSTcwT9+qOHBSqUHJP9hw7zoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiLAPN3H; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiLAPN3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765597617; x=1797133617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SvutNC3fjUpded1qH4e1Rk8S1KtO1MbBZp+8pcS4+3c=;
  b=LiLAPN3Hgu85xy0yL7SujhkGVJsdnU6e4VrgBO679+7QDK1KqQD156Cj
   H4OlHTRCo32hX4T5Cg4zASSUK0fWvGt/8ySeZg3J4dFJBUKv8uJBHBzcU
   dzHgj3NROCFZzNo3DvrJWWWtIvDnwj1MpNNH5HtywN53+aXkH32y+4tMH
   WTFJ6Uha3DTB9Nzjt1DoM62GM0fpsV+ACvaYC8rDmFSsqPk+6yHp1psjA
   QituRCAZ0rddrCwZXM6tGYgaMNybA0K/uQZUCexPszD8c3vvJ7Tl+Qqhw
   8wngrGLGar5TfMjiL0cHja9gk65rEGVwlKNYga6AOdzYqnVuxHgVV6BFT
   A==;
X-CSE-ConnectionGUID: mdbEDAoJTsme/25zDuLvQw==
X-CSE-MsgGUID: yShLu5joQf+phI+LIE1zeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="79055462"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="79055462"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:46:56 -0800
X-CSE-ConnectionGUID: VFuWyNHgS8mY2xbZ1RSR1g==
X-CSE-MsgGUID: 8PorQ7ZURS+OFVuQ5t2Qkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202328366"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Dec 2025 19:46:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGar-0000000070i-1Ypa;
	Sat, 13 Dec 2025 03:46:53 +0000
Date: Sat, 13 Dec 2025 11:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/crypto/montage/tsse/tsse_dev_drv.c:148:1: sparse: sparse: symbol
 'dev_attr_tsse_image_load' was not declared. Should it be static?
Message-ID: <202512131145.YwV73bz7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 7795623241fe9eb57352a09b27d06b5d4ff07071 [3541/3541] add firmware update function for Mont-TSSE
config: x86_64-randconfig-r122-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131145.YwV73bz7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131145.YwV73bz7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131145.YwV73bz7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/montage/tsse/tsse_dev_drv.c:148:1: sparse: sparse: symbol 'dev_attr_tsse_image_load' was not declared. Should it be static?

vim +/dev_attr_tsse_image_load +148 drivers/crypto/montage/tsse/tsse_dev_drv.c

   147	
 > 148	DEVICE_ATTR_WO(tsse_image_load);
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
