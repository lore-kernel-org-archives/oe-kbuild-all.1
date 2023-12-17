Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDA2A29
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 00:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrLAEXN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702773969; x=1734309969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uuNHB2/9wsaotJd9L9pUtRuufAO1//e3fJQ+fqnuCAg=;
  b=MrLAEXN/NT8lqdqVyBKuhPprmrX/ZlVptBuGhHAgYfxePZXHdHhr0m0J
   bC3QNlFi8dIWE8SsyW10Bcq4SMmF4Yaijuzt8BzqdQg61nboRkxAsHLJK
   oNShcUg0UBquMbRne4pGUWZSiO5xbC/eHS/2i+4YCQrgB60OCI90EaqtB
   W0lRjihtrbPGAordA+SWX1qBTulyM15oX96Lt9n6xIFMCsevH6UPfawqG
   mY1nOt7JsdEWEzC5aNyrvNMBmQOMS+fuNa8uQPzmbXKXHy3kEJLeMFJo3
   CDHlSnYaAhCthJzSI6qoJeC4buzKTwQre24o1co6ZrmHVmImZPM8nQ8NE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2581794"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2581794"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 16:46:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="841077405"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="841077405"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Dec 2023 16:46:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEfID-0002Ps-0K;
	Sun, 17 Dec 2023 00:46:05 +0000
Date: Sun, 17 Dec 2023 08:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 1300/16025]
 usr/include/linux/videodev2.h:2437:41: error: field 'timestamp' has
 incomplete type
Message-ID: <202312170848.UUta6gJh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: d368bdd73e55410f089fc065109f13953f409d88 [1300/16025] video: fbdev: mxc: Forward IPUv3 framebuffer driver from imx_4.19.y kernel
config: i386-randconfig-015-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170848.UUta6gJh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170848.UUta6gJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170848.UUta6gJh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/ipu.h:29,
                    from <command-line>:
>> usr/include/linux/videodev2.h:2437:41: error: field 'timestamp' has incomplete type
    2437 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
