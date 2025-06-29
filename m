Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD75423B61A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 21:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751231287; cv=none; b=ulnIQfJwn4YDVQ5QOklEjJfYtlDm31Y1r58PorNv8vFT2yjvCKBv4HuR27Tx9SE7jBChaTL1in97Pg7rMEVYPddWiTkW69aElER1WLDVH1jSyYDZ6GvOpqFXYPKIS8B7FaWk1JBSfzkQ4mogAUF7+psyUIxvdmYbSbo7S7o+mGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751231287; c=relaxed/simple;
	bh=GA25YuzzMVH/O5rVPqpL3+VneG+gMI0cVLHzUk8/FCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K08do1igxuj3BCI9hYm+s+NBdUQHGnImXO5F6JLrswXSwDddOYs7JbpSEuKGxLoZDF0vvJyuBfAmNK6nUQ/E0+A2A1bOG2GetojsmnnSyjPUB6VfCN/H+iRV1kBfct8IWcUnio0NnpD6CHrrRW77KzM8Xs0gQPRFGChSoEw9eQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYqMartq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYqMartq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751231285; x=1782767285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GA25YuzzMVH/O5rVPqpL3+VneG+gMI0cVLHzUk8/FCM=;
  b=MYqMartqTe0YgGaUt0eWoujBV2uWtsYk6De+paEn4TJzT/Lp13sXv4Hk
   ueJhQlj2LlA5q94RbadGrViRAd/XbDmd9D86laG/4XYgbckqF8j2vuHJ9
   Yn8zHdeL346wDGEQ5QvQ0dnYqmAjMQDQO9TYNLXsL3I/TSXDHNLtEpJMF
   i3vJG7+vIGXWZK2FiS2YUiMnxDqq8S9fGD8V4K9ezO3cCWToIi2gxTl9G
   TphcjjWgYZSxaQyWm0YE8xVeI6MMKh+t8pc4MBCldsexRRhG0bugwHEoO
   nG40H7Yagvg/21kJ7BO1bv0fm4aP3g3FoI9Ako3hejXiXjGgjhQfUMNGM
   A==;
X-CSE-ConnectionGUID: y1QJrCrXSe2WHgjzEnr0NA==
X-CSE-MsgGUID: jKjEChh3S3WToLY/KI0aZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57137527"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="57137527"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 14:08:05 -0700
X-CSE-ConnectionGUID: MdWRuUWiS1yFaVGF64FLyA==
X-CSE-MsgGUID: A7JUm79gR7a7by//PAMANg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="157553590"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jun 2025 14:08:04 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVzFp-0000yR-2C;
	Sun, 29 Jun 2025 21:08:01 +0000
Date: Sun, 29 Jun 2025 23:07:12 +0200
From: kernel test robot <lkp@intel.com>
To: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: [linux-next:master 1547/5590] Warning:
 drivers/iio/industrialio-backend.c:724 function parameter 'chan' not
 described in 'iio_backend_oversampling_ratio_set'
Message-ID: <202506292344.HLJbrrgR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: 69f00e4ab1f70b333d0e36c9e9d04abf7cea3fa6 [1547/5590] iio: backend: update iio_backend_oversampling_ratio_set
config: alpha-randconfig-2002-20250625 (https://download.01.org/0day-ci/archive/20250629/202506292344.HLJbrrgR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506292344.HLJbrrgR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506292344.HLJbrrgR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/iio/industrialio-backend.c:724 function parameter 'chan' not described in 'iio_backend_oversampling_ratio_set'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
