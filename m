Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C663D1D52B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150266; cv=none; b=ZEKyVYOL3VVTKRF3LCkSKv1JWoHDwKNYmqTiLqHkQATjYRvkfgpMvE3SoLBbhXgDDrQasjKC4zsN1u+gtvAaixxRV+BHN0s4hyVUGNYCaK0N+xGD7a/BXyxFB76FJnDcM/AMx4I7qdh3YFmYsYkE0hY8U6c8HZd2RXNfa0xQSsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150266; c=relaxed/simple;
	bh=PA1vGRnJZiPULniR+7T0MnQYQKjcnD7fxfSzv/LXkmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jsuk3cW2dqOyNzoJMPdndTEVL2R3ets0ub6aS0qQMFciQMtBsDHuYnEC20uu6A/39j2YCIt2tc3zQ12ZsIfiPt0ngQGEtsAz/TT0HfoAr40MQJiI+LneE1B5vZ9sUXM9QTDmhnwSgHwSOdlwv5OT8TcMup+n0BOYzB/TeXsy870=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjszU0Yp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjszU0Yp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726150264; x=1757686264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PA1vGRnJZiPULniR+7T0MnQYQKjcnD7fxfSzv/LXkmo=;
  b=TjszU0YpYI0GKUeZimeubq6WAEKS6CUUQxUyaYqHD3yQmDQ9vafrv/td
   /NDuu4pmcAOtijI8b+OeHSVD/Ct58QkFu69L5anOHczEVorzBpxtHFHNy
   vpTc3bQ51IyAZJ6m/49SN2ZNYtaB/AM+cai4cUoU0LjHjkV20+mtWOHTK
   ZJXVC/WBYT4uBywgbRabUYRSw7dhxTmQpnLlQrnhHlhZZirhqKDWMQ+/x
   szf5khrpVW2G6rPbQw/peYV2Q1S1J2Jh4m2MA2m5WsqbijQQbCrztOfCQ
   SATHYbNsSe1+dVD/0amflmxPxejsgbT1yo7QWS9nDBpaZnSi2cHpAhSAN
   A==;
X-CSE-ConnectionGUID: 7hZhOGlfQfOK68hia3ZI/g==
X-CSE-MsgGUID: SmXalaZrRWaxK66SyCHWmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36142128"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="36142128"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 07:11:03 -0700
X-CSE-ConnectionGUID: 5VYYTjX3QJigIBX8NO30dg==
X-CSE-MsgGUID: BrjdSsEJTfKBAxTU529AZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="68013987"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Sep 2024 07:11:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sokXD-0005GI-2y;
	Thu, 12 Sep 2024 14:10:59 +0000
Date: Thu, 12 Sep 2024 22:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19377/30000]
 drivers/ub/urma/ubcore/ubcore_main.c:61:5: warning: no previous prototype
 for 'ubcore_open'
Message-ID: <202409122243.XfSUhJlV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8f53b22e47e98837db7830541a369ed0cd5df749
commit: 95c713224477ac3433652331dd715e9bbcbc793a [19377/30000] ub: init ubcore module
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240912/202409122243.XfSUhJlV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409122243.XfSUhJlV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409122243.XfSUhJlV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_main.c:61:5: warning: no previous prototype for 'ubcore_open' [-Wmissing-prototypes]
      61 | int ubcore_open(struct inode *i_node, struct file *filp)
         |     ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/ubcore_open +61 drivers/ub/urma/ubcore/ubcore_main.c

    60	
  > 61	int ubcore_open(struct inode *i_node, struct file *filp)
    62	{
    63		return 0;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
