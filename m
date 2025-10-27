Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197262C11DE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589163; cv=none; b=T/jINDrUdshoL7GhMVyCmybF38IzxernBkZrfUBS7hQeN94GEWNPTAPQi/e2KnVzfPG6dq3AQIcQc2mnoIj2khk27Hln+zlKjrD+fr3TYsJaCJ7xHADfI0pN4CSPHKJC1UFeOj68Fl8ag22wtMKxrY85PhZ570O8NCDQafc/208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589163; c=relaxed/simple;
	bh=WHUBBuQ92AB0Pvm/bWJC4HM7jOvJMDQLeQJKDyM79nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c56lYyTMmgGjFio1XeMlBxPtMX6gDLaiMEDYFEJ64wZjNXz2eXkBN6sDY9xXj6NvJHeC2W2Ryp3RfYkUOpjesOV7D1xVYLKD8KcaJ0wIn4dDRzQyaSLZ6HT6PcF1UFwxmbHxnYXgFVTs/MA8C9D4X/xPYoXgd4grgCyBhzAAyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSgRno/X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSgRno/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761589160; x=1793125160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WHUBBuQ92AB0Pvm/bWJC4HM7jOvJMDQLeQJKDyM79nc=;
  b=GSgRno/X1SxQ06y5cdJOG2kNIUhpbizbwX9CUThVlsws6qHHKslcISrC
   ybwyLzHllwFowCNUYFDnJ7KeZWaQGOYi5mpkG/kgsQvP7NWfbSDW+mAwX
   6rbGgGd4ha9K+BeVS4UTB+DvwT1+Bp8GRgw87h2dObxTozkUNJ2qGVgZF
   aYXcj1P1h/R7mZUGPXQzIxOdhqxvrRTmVYdQlQgRCPjG1PUyyl2R+IouL
   isjpzj1a2ukcxoIatTHab/ulhuo1eoW4SZYp+7q/a5ZBV2a8HB96rfPTr
   FBoTZxWslPIsi0H/h/IYf8CFtPw5DBRM/6KmAzFseBX5e/iGg/HH2raTm
   Q==;
X-CSE-ConnectionGUID: TP3e7c4QTgKxtLjzz9Bmsw==
X-CSE-MsgGUID: JhzipTxDQQyiokQ1oI6rbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89149291"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="89149291"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 11:19:20 -0700
X-CSE-ConnectionGUID: DE8nyPA1S6SJyuGJpeOcrw==
X-CSE-MsgGUID: plXIBNdHQwGYJTFt3uKExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185465951"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Oct 2025 11:19:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDRoK-000H53-0R;
	Mon, 27 Oct 2025 18:19:16 +0000
Date: Tue, 28 Oct 2025 02:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: ERROR: modpost: "vmf_insert_pfn"
 [drivers/gpu/drm/drm_shmem_helper.ko] undefined!
Message-ID: <202510280213.0rlYA4T3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi LiangCheng,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
commit: 0c4932f6ddf815618fa34f7403df682aed7862b5 drm/tiny: pixpaper: Fix missing dependency on DRM_GEM_SHMEM_HELPER
date:   5 weeks ago
config: riscv-randconfig-r072-20251027 (https://download.01.org/0day-ci/archive/20251028/202510280213.0rlYA4T3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280213.0rlYA4T3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280213.0rlYA4T3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "vmf_insert_pfn" [drivers/gpu/drm/drm_shmem_helper.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [m]:
   - DRM_PIXPAPER [=m] && HAS_IOMEM [=y] && DRM [=y] && SPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
