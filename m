Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0492A1CCAF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 06:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691820366; x=1723356366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2c+Dvs7L02fAugdjqKNUzz6vs5QPKsDtwNuRLaivTm0=;
  b=MG49J0Wt0PxE4HjCwkjWcDSlp5ZXFCYcrVF7lQQ9wRPCYOi8r+FDSEul
   7dboPzFEhsaW9bhb+eooS8PCUqU5es7bh3bfMgpVYYEAQgEVkub/ByTyw
   0xKI8i5A1tg1MhhCRsakCOgWVH0oTk/uhKshtTCORSBMKNvj5BZPdwhlf
   7ORzsXF3F77SwCXlpBzv0YCbRLK9GxyzftYXBECPBADRGYAio9fFfUL8Y
   cGYIw+3c8OMkBIJ1XSXabDzbAO3kytOsbs0iMnTkniwm2coSo74StdkUJ
   Lz4nN+ZoRVZSYwiF0h+qWbENM7vY7N2mlpUEDsWyX/XSGuMehYM3q/7VQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402787720"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="402787720"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 23:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="906650448"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="906650448"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Aug 2023 23:06:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUhlD-0008Jk-2J;
	Sat, 12 Aug 2023 06:06:03 +0000
Date: Sat, 12 Aug 2023 14:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Steen Hegelund <steen.hegelund@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c:1435:5-8:
 Unneeded variable: "err". Return "  - ENOENT" on line 1450
Message-ID: <202308121355.3dcD5fvI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8de32cc060ba3f63171aaa0e8764d22d8c37978
commit: e1d597ecbe5c5d7128630d4c9ec27c42018613ed net: microchip: sparx5: Add TC template support
date:   5 months ago
config: csky-randconfig-r051-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121355.3dcD5fvI-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121355.3dcD5fvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121355.3dcD5fvI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c:1435:5-8: Unneeded variable: "err". Return "  - ENOENT" on line 1450

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
