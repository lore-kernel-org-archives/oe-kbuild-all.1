Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88901448D5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765699201; cv=none; b=uBfOaB5XN+bldi2WeKZjIxmh3B0j6Gc1QVtArVi3Rr+aYPVtstzS2shLCVgeko3DDIEJBue+NpcJMYGhnFDbNioz3PjC4/5orZinNgelzrLQa40MSJ45HUDN7LTYD+c8NfRW4qns/Q/k/ZpUgte5yEk6OmzeJp/W7boNEx40uMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765699201; c=relaxed/simple;
	bh=0c3KdbvwdaknsY7LWdzITz0WD7dgV563aiGP5C05UXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6L31w0O1MHdthaS4wBjvqMRNxbHzmIxD7fDCmFoBr75kit2Db1wY7R5yOdg/de1uUMgTriShJYAJlP2y8wBO26am+MGDn8s+LV5aweTKd04uNsSZ4tEjq1TEUUDzykPA/aHkLoyRyNpzXamZoaYBZ4G49E4MK+3ibSBHCUz53w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7Cfav4s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7Cfav4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765699200; x=1797235200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0c3KdbvwdaknsY7LWdzITz0WD7dgV563aiGP5C05UXo=;
  b=i7Cfav4sctY8zPmFmkhpafe6BoYUNfQXLFgqnOMk7SwDSvr6+YvmHeAG
   KhOY9PZWw52Jok6VBDBz9Y2aFcNkuAw8pSd9ykJgTjLY3GugukzlVi5YG
   r58c+LQ+MCqfGZnifEhYJgZtJAKNsA3fOB4lQAoBVF1EUOyYqGGoZvjdq
   RoYQv1MrVCRH30YhvmyBPAgXcGlyDaTnJikV7x46XWM+1/WcrcXY4Vra/
   FpI3OZwS9KvREotzxR4WhRhTbAcGEdsn8jHpf4MlKDJoOeIq7qFu3SSJn
   kQh0ycTHugNwUpSlw6UJKsstyM+dQQ2iDTpyA0kwJiAuIyvbeouoRcXR9
   g==;
X-CSE-ConnectionGUID: GhutaLq0QnuseT5W5vc7lA==
X-CSE-MsgGUID: Hqko7jKoRFecqnFo4Y/ezA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66808666"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="66808666"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:59:59 -0800
X-CSE-ConnectionGUID: r/dmrIg4QmeiTUI4z5TLWg==
X-CSE-MsgGUID: NrLdAdCHSmuG+FhMBMf+Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202556340"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 23:59:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUh1H-000000008qH-2RuF;
	Sun, 14 Dec 2025 07:59:55 +0000
Date: Sun, 14 Dec 2025 15:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 5/5]
 drivers/dma-buf/sync_file.c:119:12: sparse: sparse: symbol
 'sync_fence_signaled_obj_name' was not declared. Should it be static?
Message-ID: <202512141512.SsB8gW1l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: b402a1d75befcddca1b54a72297785474d05a99d [5/5] ANDROID: sync_file: Weakly paper over potential xe driver (and similar) races
config: arm-randconfig-r122-20251212 (https://download.01.org/0day-ci/archive/20251214/202512141512.SsB8gW1l-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141512.SsB8gW1l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141512.SsB8gW1l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/sync_file.c:119:12: sparse: sparse: symbol 'sync_fence_signaled_obj_name' was not declared. Should it be static?
   drivers/dma-buf/sync_file.c:120:12: sparse: sparse: symbol 'sync_fence_signaled_driver_name' was not declared. Should it be static?

vim +/sync_fence_signaled_obj_name +119 drivers/dma-buf/sync_file.c

   118	
 > 119	const char *sync_fence_signaled_obj_name = "signaled-timeline";
   120	const char *sync_fence_signaled_driver_name = "signaled-driver";
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
