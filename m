Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CB2361DBE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 03:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135461; cv=none; b=I/WBR68YyCKgI57M4EGezi0Obyan2CYA9uQBgaES3mDMGe2MWeBKW45g9dEN3ozcDBhpfh+F+FNAeOfgHKunn5PeTwX7+BdQPjidpPSEqoud9HxEH4hxNkX3ZIq4xUCPwtuXpunShVjqfYh67FHwO2vkaxy6Kb8z5WcL6SxjBcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135461; c=relaxed/simple;
	bh=DVgJQNrzAPMQG/DVwg/FUYr08ZuTK+FMcgPJmQM9pF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Py1WNS+VmSZMySYzVZdBa8u/sLeUkcJ2QeFiN00xPiLUyRa4L0wVJTcqFtkd7VSHsdHJfzX5sSONjMXpk0HMiK0wz9k/bRl8eWHu7suGGSy/TWLnkQFQP0u/qxdkViDpghAn6jppTdsoOKHtWn0hgAFwtL4OWDTd7/Xr8mkQzkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMsWFP5f; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMsWFP5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790135460; x=1821671460;
  h=date:from:to:cc:subject:message-id;
  bh=DVgJQNrzAPMQG/DVwg/FUYr08ZuTK+FMcgPJmQM9pF8=;
  b=WMsWFP5fSAW1kp+D3yTV55FteSJBt0ApZGkZwgac8bVZ0p/2sfrGZW9h
   j4zkgHvFABmTY5r53tfIwX2XKZsKWx+dZo3vhgZt3XuYonk3hXIufQaeb
   NgKBHyo5LliSZrJYnslPVzHVEz+QKEtxbQWRj+TpmiY1eFkKCjaZvXbNw
   9Hdp/pqc1480VEnKa2nEuqG8dkGVNafGzzaw9LSPhrPZ7yS6PedG4YPHr
   1+370yaIbOunQUWoMSaKC4jS6wrh65TNNaX1FJqLduPcW8JWDys//zSm1
   XyNe92Mciyereq87CHYS1mWYg9O/FKKhe6Gp7yIV3jdNmRxFTyxmpsghi
   w==;
X-CSE-ConnectionGUID: oI2P+O7dSE2B5lxY9USyQQ==
X-CSE-MsgGUID: uW3gomwdRhOfoHnuzGpSWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101457048"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="101457048"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 20:50:59 -0700
X-CSE-ConnectionGUID: iFxA6l6QRimdhIwUplN81w==
X-CSE-MsgGUID: ZB7S2qlnSeiXKUg7UsUv8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="299669038"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2026 20:50:58 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9E0V-00000000GVK-2xJQ;
	Wed, 23 Sep 2026 03:50:55 +0000
Date: Wed, 23 Sep 2026 11:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ljs:v3-build-speed-up 40/49] cc1: warning: unrecognized
 command line option '-Wno-address-of-packed-member'
Message-ID: <202609231118.0uiiNdUH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git v3-build-speed-up
head:   789909cb4fd0730510265f0059c1579b5687f51a
commit: 14350e00295bf82506df8e053f4cbec79913a363 [40/49] kbuild: avoid re-running compiler and linker probes
config: arc-randconfig-1001-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231118.0uiiNdUH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231118.0uiiNdUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231118.0uiiNdUH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/jffs2/writev.c: In function 'jffs2_flash_direct_write':
   fs/jffs2/writev.c:39:15: warning: variable 'vecs' set but not used [-Wunused-but-set-variable]
      struct kvec vecs[1];
                  ^~~~
   fs/jffs2/writev.c: At top level:
   cc1: warning: unrecognized command line option '-Wno-unterminated-string-initialization'
   cc1: warning: unrecognized command line option '-Wno-dangling-pointer'
>> cc1: warning: unrecognized command line option '-Wno-address-of-packed-member'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
