Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF523CE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735591544; cv=none; b=LG1oW+JT4AD2E8bfxOeVhNKldsFd5xx3qVD3xDuZI6N7rOUbzQtKD62s4DKiiRvtFJbORcHfrykwoKVL0hYoLRyDCvDxWwTceZBODsW/imF2LBuwfAmBZK7gJNz64fC/2ObY1V3j9CVOEyFOrekjkV0F7Zub6yVS8qqPBD/sO5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735591544; c=relaxed/simple;
	bh=g5uHGjwhAo6LeDTgKBsYUy+4xuz3A6JmSLWVHbOeFPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QFmXoOaWs2dWH8wlnAF6DGMoRr+pPJOZQUB15ousJQQJkylMBQZjl1+P91RASyXzmWi9qxSGyBck/+y6MuP6C2UoyGEELBHOQDAleFkHkgsYXhgNdraXL/upcCLKnH2icgTKS/D7C1OdFIKXE0vnr11sz+ZArQEVymKwBuNL0R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTLIyxtK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTLIyxtK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735591542; x=1767127542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g5uHGjwhAo6LeDTgKBsYUy+4xuz3A6JmSLWVHbOeFPA=;
  b=hTLIyxtKl0f9DsHhKxTlWC21HZO1GP6/7od3b2UX6YLJtJ2vZNtO7ngi
   0T2xcS9967kuAO+8udKma5QDHQZc+2jxuXZ5B39niTKU0ozrdcS8aN7di
   YbGqTI7AYlyxoidMhGsZxfa6PgayrzxgseKeqOXtnHunTJQpWKQNoaOS8
   +9uFGKAJs34KWnpTgjo2hCkx37sMfXyG8mJmsgGbB3TCXDI/+a3+PAaPe
   CQPmoBYc7QFg8XyJ8PXs0LJrTLixCRG7oq51aXeudMbQ/9P2Ekq2ByOzY
   DIcTZoCTrr+K4t9zBBhXZcpxRz8Z/oLtLCX3UsO7KgwdvOVOHdZuXovfK
   w==;
X-CSE-ConnectionGUID: nwDm21WtTFC/BsUFHVrqRQ==
X-CSE-MsgGUID: GhPd2DkgT0SkA99jiaU0AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35135041"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="35135041"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 12:45:42 -0800
X-CSE-ConnectionGUID: o6p+00I6TiS6ZldUU9unMQ==
X-CSE-MsgGUID: ZdT754SbRVSKFLtetqb+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124159767"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Dec 2024 12:45:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSMdv-0006O7-0N;
	Mon, 30 Dec 2024 20:45:39 +0000
Date: Tue, 31 Dec 2024 04:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1359/1359]
 drivers/char/hw_random/phytium-rng.c:137:34: warning: unused variable
 'phytium_rng_dt_ids'
Message-ID: <202412310450.eTlMnKbi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4dc4cec05b40921a3db85d24f97f1142272e4abf
commit: 6e2d2a4f494efda1e565c42a8eb2be504e6d45f0 [1359/1359] hwrng: Add support for Phytium SoC RNG
config: x86_64-buildonly-randconfig-001-20241231 (https://download.01.org/0day-ci/archive/20241231/202412310450.eTlMnKbi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310450.eTlMnKbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310450.eTlMnKbi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/hw_random/phytium-rng.c:137:34: warning: unused variable 'phytium_rng_dt_ids' [-Wunused-const-variable]
     137 | static const struct of_device_id phytium_rng_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/phytium_rng_dt_ids +137 drivers/char/hw_random/phytium-rng.c

   136	
 > 137	static const struct of_device_id phytium_rng_dt_ids[] = {
   138		{ .compatible = "phytium,rng" },
   139		{ }
   140	};
   141	MODULE_DEVICE_TABLE(of, phytium_rng_dt_ids);
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
