Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC71C5D59
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 09:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766912775; cv=none; b=Hd0IeWHdgvO8vtZOKUhpun2ptVjIqQdVu8XU55tKfdUbqg54f3vlc/CRWYx6r/6/EltfjcLAh+oq2QvYqHbjq5wcJboLVW0jArtlerFzU4gtyrcJtzXoVoa+j1noho8vxaN67Utv52VyAymU9jV9lD7ZIkpi1diZO06yxqxX3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766912775; c=relaxed/simple;
	bh=e9B7mX/mT2Ag7tZek58Ad2bv77Ze7lUvBw8L0IvK/3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rJb8zYDC3wnmoThfmQPtFgcnSpjxpXg4+aSXrHEQ6aVC8vS7zVBmNuN6rapKI+fWMsr1T9ApB5Fvm/YLYALy0C/RJ+eZwQuxZ74X18NMiTyjSaIrr8Kknl5LtHyIYeHYLpE4PlwITgyOqrM2/dyEEJkyVGe3SLdGBKH07wM+xjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eF0Bwu6g; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eF0Bwu6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766912773; x=1798448773;
  h=date:from:to:cc:subject:message-id;
  bh=e9B7mX/mT2Ag7tZek58Ad2bv77Ze7lUvBw8L0IvK/3w=;
  b=eF0Bwu6ggYf8OZLN2HJa1yowS+nFVqTqb/iRKbg6mCbml40qpo6MTcGL
   AQLl8ghExINASZH10qgFsEfqF7RwAiCDDWpaes0HQY23gxe8McZPaherc
   Q3XbmNV7Sr93g/BnDAF0dWy7wTxhFr3U98tLdvhXcSSUqYdIV3k8bAP3f
   Q2iUgsL9Gme05ptnmHDpz63g3f2bpUsm81pFA50REaVFsSMrzMtRQWjyn
   SRmSrRxG9LyjkeNwbDxNfkmOZN8oITMp46DGBJc4xn7j/8YvunEic8/B0
   x1vmV4LomS6hCa5Ip3MsiKZHuELnwyQUv4Q0xHZ1Y2KqeWd/BTwEgKiK2
   g==;
X-CSE-ConnectionGUID: 7ct64gt/SiGpEAuyWqhavA==
X-CSE-MsgGUID: M7WNU1H2RN2lSSWOmvQAZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79293091"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="79293091"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 01:06:12 -0800
X-CSE-ConnectionGUID: UYbOnFC8R5aKjyUFYoJaig==
X-CSE-MsgGUID: ZmCX4MxORCC3FaKGoATlYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="205599431"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Dec 2025 01:06:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZmix-000000006OL-1HFo;
	Sun, 28 Dec 2025 09:06:03 +0000
Date: Sun, 28 Dec 2025 17:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/ub/ubus/services/gucd.c:198:5: warning: no previous prototype for
 'ub_services_init'
Message-ID: <202512281721.3GHguL2r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   03c9c649e6f28e26260d276ce755f785b2435da3
commit: 4885c5bba9c1b11faff1754a6e323b40872e82ad [13/13] ub:ubus: Add generic ub component driver
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251228/202512281721.3GHguL2r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281721.3GHguL2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281721.3GHguL2r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/services/gucd.c:198:5: warning: no previous prototype for 'ub_services_init' [-Wmissing-prototypes]
     198 | int ub_services_init(void)
         |     ^~~~~~~~~~~~~~~~
>> drivers/ub/ubus/services/gucd.c:205:6: warning: no previous prototype for 'ub_services_exit' [-Wmissing-prototypes]
     205 | void ub_services_exit(void)
         |      ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/ub_services_init +198 drivers/ub/ubus/services/gucd.c

   197	
 > 198	int ub_services_init(void)
   199	{
   200		ub_init_services();
   201	
   202		return ub_register_driver(&ub_component_device_driver);
   203	}
   204	
 > 205	void ub_services_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
