Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B014E55A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 06:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770876791; cv=none; b=knaYa9euNiWvuCF6H+gbXvtZVR05ApCaivNSJVK11bENaOv6NUXWafGBpelc+RaMKcBn5w3tQlz57EDcg6dM5dYrBqbwGIwbJxk8PSg9jOkHyEdFh+oV2+5Eot56RU/QYXGzM9vQsMkPMaWbYsnMV2U4lyTyDcQviKLUkXcajJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770876791; c=relaxed/simple;
	bh=N4SyQDyka68WKX2lrQp93g7xTVmtwjpZDT+AeGIz+8A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=odpE7f/VusHHkTUsWvjZd5XusktLPn4dB2LzGqP5EI8JzMS2H/H532C2Ew5dXvbs/3jsOPodN+7XDLHMQ2dtPVYgEz3PGVn9tzVDRZb9U9Mq8wVOmWtS4lt1h3nobGsPN8+9SQaPr9ecanC6anBcP0dbOGhrnFBeeycuzXa1mDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bo+YLEbf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bo+YLEbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770876790; x=1802412790;
  h=date:from:to:cc:subject:message-id;
  bh=N4SyQDyka68WKX2lrQp93g7xTVmtwjpZDT+AeGIz+8A=;
  b=Bo+YLEbfAcPzdR4y1Y9KQF57nIoOo/rmSvZvJZXdtSEcet9e2ik1Gfmi
   QtvLCwNpq0B/yTMub/mvKwVS+54Ye5LwI89J5xrlSZdelo8NJfHjZoU4c
   wvKOOZQPJmxzTU/KThAIWmBkfkCCz7gWZPfrvdqPHeq1hXmxMsbvSKXuC
   RcQvIS9g6AYuJ2GhDm6TNMFzI2+qBFh1P8sgMMRr6SI6PzXAD90bMH8iF
   ZSRuLLbQlp7yEWI3njgdc2WQ6bGeiiMt/5KptEYNhpNyU/6O794f+s3pI
   Dx50DzEErYAA0XHhi1CPtmIAbpD1MetBwsAjOnmTFQrZNJuWfulxLSelb
   A==;
X-CSE-ConnectionGUID: RSIb1CWpTDO8ynkKoxquxQ==
X-CSE-MsgGUID: +seBBmAjSaOkcpR4Zrf7cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83142546"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="83142546"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 22:13:10 -0800
X-CSE-ConnectionGUID: p1ll29vATbO5F6rTIoRtxg==
X-CSE-MsgGUID: Q1PeEm8LT1eN0raQz2xoIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="235464846"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 22:13:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqPwo-00000000qlI-1kpq;
	Thu, 12 Feb 2026 06:13:06 +0000
Date: Thu, 12 Feb 2026 14:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Austen <hpausten@protonmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ld.lld: error: undefined symbol:
 xe_configfs_get_survivability_mode
Message-ID: <202602121424.LVB0IKuX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Harry,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   37a93dd5c49b5fda807fd204edf2547c3493319c
commit: aa18d5769fcafe645a3ba01a9a69dde4f8dc8cc3 drm/xe: Allow dropping kunit dependency as built-in
date:   8 months ago
config: x86_64-randconfig-r052-20260212 (https://download.01.org/0day-ci/archive/20260212/202602121424.LVB0IKuX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121424.LVB0IKuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121424.LVB0IKuX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xe_configfs_get_survivability_mode
   >>> referenced by xe_survivability_mode.c:224 (drivers/gpu/drm/xe/xe_survivability_mode.c:224)
   >>>               vmlinux.o:(xe_survivability_mode_is_requested)
   >>> referenced by xe_survivability_mode.c:224 (drivers/gpu/drm/xe/xe_survivability_mode.c:224)
   >>>               vmlinux.o:(xe_survivability_mode_enable)
--
>> ld.lld: error: undefined symbol: xe_configfs_init
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(init_funcs)
--
>> ld.lld: error: undefined symbol: xe_configfs_exit
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(init_funcs)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
