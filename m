Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617AD1CAA89
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739189475; cv=none; b=XpFAFdLxd3wG0ayeQDXEJj4/Zj8NCQvnZtwEtqhxFDJMocvFLUDOAUFO/FbVpvRUQgH0oWqynuKoSLSNrRmC0S5LvrXj7jTTG+T0jIokC+E3sqYHSzNmC9ZNcmdFrVlL26DR/8k+BjDshbEU6joqmmcaSywwKqJN1p4F8R0Zg/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739189475; c=relaxed/simple;
	bh=L8sM5gBHTbGGihh3dEaP80FBtO8zXsn9ckSSG6iWRIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X4LHQluO4mEjB/wHz02qoUqWVY1Iav9KJgx78WnWycQTFG/ntkmbmne8u7HBrcPgTdBL+ItTmvLukpwLrZODBfUZbkB9GxUC1SSbYUtpam78Q/oj7oOGGlTAjVggiUrnEChuJQIzHcJxYA9ZxS5e3OixWkVcK0zJ1b46D4R4V/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihaZcXW3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihaZcXW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739189474; x=1770725474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L8sM5gBHTbGGihh3dEaP80FBtO8zXsn9ckSSG6iWRIE=;
  b=ihaZcXW37zcCzrEFOBRuM6Z3vrmgEOJdgmgw5iMsUHuNWlWreGcS7VHK
   +9vvTwNdxvtYaWpDqY/dpKhgc8v3RDHXegTvcOD0Gp7SAaVOzVG7prq8U
   R5DZ/2GMtXoWX/5HKGj5c4sqXwDGTL0o74ZtHhUBpKjG6El8jZkt37O5Z
   lACPvmI9gzv8M4mu/x4nz989fT1PBGCApGPiC7C9LZJs3gCsnTQ6ZvrGq
   Pzs6fbcy0rbEWfOaswMsH80YZWUetunJJR8hqr+mNYM5aNDv8VRme9uDi
   9Ij8hluyY6XrNmaXsIjZJ1bPrNxw2azc0g3f4MXpTH5lCgcj25So/0Je+
   Q==;
X-CSE-ConnectionGUID: +PhwLNnSQyOhnYgsxPfq8w==
X-CSE-MsgGUID: cNSzvpnJR4OpyS601X/QQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39454635"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39454635"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 04:11:13 -0800
X-CSE-ConnectionGUID: m1Kvj2nvQT6EJN0dZOlQ6w==
X-CSE-MsgGUID: gb+1MhMOSfKKGlhf7ViE/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="111938967"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Feb 2025 04:11:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thSd3-0012ip-1g;
	Mon, 10 Feb 2025 12:11:09 +0000
Date: Mon, 10 Feb 2025 20:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/050-nvme 2/4] drivers/nvme/host/apple.c:208:14:
 sparse: sparse: symbol 'flush_interval' was not declared. Should it be
 static?
Message-ID: <202502101947.VSemm0S7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/050-nvme
head:   64364dddbb6079a18e8119f64748a217b51d7e65
commit: cefae9739746756817c42688662ffb8e5ac846ca [2/4] apple-nvme: defer cache flushes by a specified amount
config: arm64-randconfig-r112-20250210 (https://download.01.org/0day-ci/archive/20250210/202502101947.VSemm0S7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250210/202502101947.VSemm0S7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101947.VSemm0S7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/apple.c:208:14: sparse: sparse: symbol 'flush_interval' was not declared. Should it be static?

vim +/flush_interval +208 drivers/nvme/host/apple.c

   207	
 > 208	unsigned int flush_interval = 1000;
   209	module_param(flush_interval, uint, 0644);
   210	MODULE_PARM_DESC(flush_interval, "Grace period in msecs between flushes");
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
