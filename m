Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8107E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 00:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9C+7MVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704243273; x=1735779273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dEvuTMtHVXOwrFU7Af+Edrm2TAKF9MNEXJjm7yD3tYI=;
  b=O9C+7MVvvYftYkbploBhzhGCvJIkSAvJjPEevEFf0lJKbTh0L9qN5EWV
   l8VNGXboHmmqBD6dp6T1nKOaYUO5zNmYOYRc7R6SxAB/u6mKeb2ZW4evm
   TNg3ZHk9RiqTpX9Zptr0f10+SgrKWAF/2un+WY1tlm/3eu3DcOQGTU1b6
   wpuYXAm7OeF/jOba6l1GlHKAKLsAP8n2ktYAQe9E3kDRzdNVB5uUL4vKl
   n77etxvLAp3tV6tA87iMcAOBpyc0mOEnBxHvm9sKDfjSjKsGXP2FHpp2J
   r8ZHCH1YOTQarAOfM0OSiRbp+iOsAVimynVPGcR4rxqdJXZKgq7lhbROb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="387392747"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="387392747"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="850275209"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="850275209"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Jan 2024 16:54:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKpWe-000LaO-3D;
	Wed, 03 Jan 2024 00:54:29 +0000
Date: Wed, 3 Jan 2024 08:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.7-rc8-esp32 20/41]
 drivers/mtd/chips/map_esp32.c:294:34: warning: 'esp32_ipc_flash_match'
 defined but not used
Message-ID: <202401030805.VKUoiv3t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.7-rc8-esp32
head:   bdc1444c42eeaa364d455469aab206d0c3985336
commit: 9369ed94e00416aa1d19aa7446fd6a36f844b47e [20/41] drivers/mtd: add esp32 MTD support
config: parisc-randconfig-r081-20240103 (https://download.01.org/0day-ci/archive/20240103/202401030805.VKUoiv3t-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401030805.VKUoiv3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401030805.VKUoiv3t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/chips/map_esp32.c:294:34: warning: 'esp32_ipc_flash_match' defined but not used [-Wunused-const-variable=]
     294 | static const struct of_device_id esp32_ipc_flash_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - MTD_ESP32 [=y] && MTD [=y]


vim +/esp32_ipc_flash_match +294 drivers/mtd/chips/map_esp32.c

   293	
 > 294	static const struct of_device_id esp32_ipc_flash_match[] = {
   295		{
   296			.compatible = "esp,esp32-ipc-flash",
   297		}, {},
   298	};
   299	MODULE_DEVICE_TABLE(of, esp32_ipc_flash_match);
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
