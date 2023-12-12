Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100A26412D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 20:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjVBB5Fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702413985; x=1733949985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zVD3QBifYBNd7xxTpl5ZSgoxn/2WPe5lGBf29+CRcLk=;
  b=VjVBB5FgkvZFdC9L6ZXJ+N3cLDIMjksxc83vNmSAjmYdqjnET4Y8CqXa
   VQkdaSCjQxUoMNipot34K3xoRJM1MAtoduvj5bmKBZOa9hhxGKe/b07+l
   pDYbk57sCR80PHTEUsDd2xkMzDeuJrUne1K6jBxIQTI3Xz4cuF0Bg4imF
   dVLg+NJWoQCgAyTwKglSzg1m3ID31rpmxKookkKUg1+Ud2M+vqf5cHG3X
   Hzcy8tNb/GtEC7xinPR8wNqX6q5IMxVlbo8+ZZOcjqcqsoutQLbLWuJwa
   K8R64aZ4zqW5A3zZ/Vj8YU2nvmduMkJvoR6eF57TEixJ1knRZOeA/WLE7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="392042794"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="392042794"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 12:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="897045213"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="897045213"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Dec 2023 12:46:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD9dh-000Jgl-10;
	Tue, 12 Dec 2023 20:46:01 +0000
Date: Wed, 13 Dec 2023 04:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r4-dango 20/29] kismet: WARNING: unmet
 direct dependencies detected for PHY_MTK_PEXTP when selected by
 PCS_MTK_USXGMII
Message-ID: <202312130456.bNbDUI4O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r4-dango
head:   51d4eefd9d760a0847c6aacddebb7ede142e7710
commit: 7c89ca96e12ef4bfcab4b34456af66044061d12f [20/29] net: pcs: add driver for MediaTek USXGMII PCS
config: alpha-kismet-CONFIG_PHY_MTK_PEXTP-CONFIG_PCS_MTK_USXGMII-0-0 (https://download.01.org/0day-ci/archive/20231213/202312130456.bNbDUI4O-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130456.bNbDUI4O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130456.bNbDUI4O-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_MTK_PEXTP when selected by PCS_MTK_USXGMII
   
   WARNING: unmet direct dependencies detected for PHY_MTK_PEXTP
     Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=y]) && OF [=n] && OF_ADDRESS [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - PCS_MTK_USXGMII [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
