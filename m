Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322751429C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 18:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bg98JHkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641497; x=1731177497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YtjMRMAKS0LIeCc6ySjwSMu1rAuphAd1Jii7OFSLQVA=;
  b=Bg98JHkvYu9O7BxmrHrdklNMYGUkR19FT78csXjLXWZA4OMqbO3ISoaM
   cfQrBJECdUWzf09NjpTInusCJVkANqTj9kKFMAecFsWsSbcR4ApN7NMw7
   0370X0hLjDZycucTY42gFN98Flilt0YvKm7Gjcy1on+2cypTt1iD+qAA3
   X5Ur7B+/FMGsBqUPXCh5P0eQQrSmF6utzoEr8kQ633h/BYXTiP3kBnEko
   GMLGEqXBbseE0259HDoQNCUKHhdWDvGlisTyalS/9bP78D+sOOgkSGZ5B
   JqahgkD5B9w6H/rLc3du3mo7UKiIibjUdUuTdKO+J1HInt7seJ/cpt2FC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="454522333"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="454522333"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="881030614"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="881030614"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2023 10:38:15 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1WOS-0009p4-2k;
	Fri, 10 Nov 2023 18:38:12 +0000
Date: Sat, 11 Nov 2023 02:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
	Steven Price <steven.price@arm.com>
Subject: [mmind-rockchip:dev/panthor 36/41]
 drivers/gpu/drm/panthor/panthor_device.c:120:13: warning:
 'panthor_device_is_initialized' defined but not used
Message-ID: <202311110227.OabsvFN5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Boris,

First bad commit (maybe != root cause):

tree:   https://github.com/mmind/linux-rockchip dev/panthor
head:   ef8d76d568fba69012333ce6e9d7cce4aebbb2da
commit: 86d43fb902f5db2a81e432041864dd7523314c70 [36/41] drm/panthor: Allow driver compilation
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311110227.OabsvFN5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110227.OabsvFN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110227.OabsvFN5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_device.c: In function 'panthor_mmio_vm_fault':
   drivers/gpu/drm/panthor/panthor_device.c:307:31: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_phys'? [-Werror=implicit-function-declaration]
     307 |                         pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
         |                               ^~~~~~~~~~~
         |                               virt_to_phys
   drivers/gpu/drm/panthor/panthor_device.c: At top level:
>> drivers/gpu/drm/panthor/panthor_device.c:120:13: warning: 'panthor_device_is_initialized' defined but not used [-Wunused-function]
     120 | static bool panthor_device_is_initialized(struct panthor_device *ptdev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/panthor_device_is_initialized +120 drivers/gpu/drm/panthor/panthor_device.c

0397be1efb94b5 Boris Brezillon 2023-08-09  119  
0397be1efb94b5 Boris Brezillon 2023-08-09 @120  static bool panthor_device_is_initialized(struct panthor_device *ptdev)
0397be1efb94b5 Boris Brezillon 2023-08-09  121  {
0397be1efb94b5 Boris Brezillon 2023-08-09  122  	return !!ptdev->scheduler;
0397be1efb94b5 Boris Brezillon 2023-08-09  123  }
0397be1efb94b5 Boris Brezillon 2023-08-09  124  

:::::: The code at line 120 was first introduced by commit
:::::: 0397be1efb94b59f907d905466bcef6aad6508d9 drm/panthor: Add the device logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
