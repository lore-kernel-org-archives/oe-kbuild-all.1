Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6D1F2388
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 23:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741820454; cv=none; b=bQXWeNqGWuCepE5sC3c5LRimEVWZ417kx+Q6aZHojqbbIY6osCTPd1lAQYAu4IqpaMUIcDBt+Qs5JJrzGddcPw8X/57yKR1tAmFs7zREx3Yt0RLWH4py6/0jA8sO2qYmyMzYxRQZfmQ2qIas7olHeV0KsGnaAszg9P/4oF2AoXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741820454; c=relaxed/simple;
	bh=ZcsvWtM7Ag0v1GAMuyaECFss1dVT1toWpcoC/pTjWvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jgdula1xSh2zxwQdFsxmStknWJRUlIx+Xz6u45xLS9F5BJ39cV99eTJeIxqXIpXBmGKXZ+Xm+sBFC3GtIGpLN9slVYemfxlbzPB7UqQMKWbuC5wUszCyY1NgTpbyXEEGNM/tvb/T11cA7AQ5qj10a89niJMJPblppcHWZUTtj1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X92XTXlo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X92XTXlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741820453; x=1773356453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZcsvWtM7Ag0v1GAMuyaECFss1dVT1toWpcoC/pTjWvs=;
  b=X92XTXlo/WsZxVUxQzCZczgxjmAEEs9vuB8UvedZwjM/5Vu9DgRIPKfd
   xfSTtlOcIn/c5JO+FCbBY1y6CFqgxiERUdg1ulg6ZcTRdA0daF4p2DTWA
   uG1Wo2HvRdy7wACxkhV3hIi5zjMi7NCyGDvGzF/KuWsHN9v3evTnr1wWI
   1SE5qLFnLtQmSOGCZ/rUZy87OzKKMthUt0Bmw/Kcj2wvu026LTb9wM/v7
   T307Ruh67khorNYhvKMWW+EyGesrAfe8g9vSY7+Nq7QgwxpZCui7ejeLO
   kqqkIMTKOnYrlheTH7or00ehjFdMPMRJSKFB8IB7RxE92bGIqVzzckS9d
   A==;
X-CSE-ConnectionGUID: AFJCRfvzQd+Ap7UqrPpYVA==
X-CSE-MsgGUID: AhrNVbCcSL662uEJ4BfOMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="65378431"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="65378431"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 16:00:53 -0700
X-CSE-ConnectionGUID: 0AlcsAHSRkKzs52BnxlYew==
X-CSE-MsgGUID: 38835sgERd+wy+UeL5PqoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125653455"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Mar 2025 16:00:52 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsV4D-0008x6-1Y;
	Wed, 12 Mar 2025 23:00:49 +0000
Date: Thu, 13 Mar 2025 07:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 120/120] ld.lld: error:
 undefined symbol: timekeeping_inject_sleeptime64
Message-ID: <202503130628.jG6ghb3u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   30a172da615ef0c0d9dfa4b39e005a45b89c35b1
commit: 029865ac9555743665dd106b4bbefb2f371849e9 [120/120] ANDROID: virtio: virtio_pvclock: initial driver impl
config: i386-randconfig-r112-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130628.jG6ghb3u-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130628.jG6ghb3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130628.jG6ghb3u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: timekeeping_inject_sleeptime64
   >>> referenced by virtio_pvclock.c:77 (drivers/virtio/virtio_pvclock.c:77)
   >>>               virtio/virtio_pvclock.o:(update_suspend_time) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
