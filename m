Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71091A953
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 21:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687642401; x=1719178401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h3XQGwEjN/aEKZVSUeMM4DsAoMJ0yZQbFv2dRMpIk1g=;
  b=GiY61QStp8AcXjUnLOmdt8/8x7pHIG0RjCi3ob0vfxxT9qErCx8V/+fZ
   Wj699S7CG4buVHZqkYqRARNZ1951FzkPA4hUrhAuXLnLctlDhjvn0bJrR
   EBgSQrVN5+KdS5OIkxIET532+faXHZfGpgnaRkZDahR4JHFe8ZkJJkM5X
   lv1HXrMnVTspoTp734WhFyRP7YHsLdJ4r13hs2k0jZNehWNeTBMzsCCIx
   /D/PWwjKTQeWKYTu1tPhblB/kzR0RSm/9g4uuw/ImSJYdwoY8YcLdWlTV
   qSheHTxrh54C3e5sWWze9IoIZlAdSf4zsnrKOvGgrgjh1WMLOYG7/LK94
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="391108887"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="391108887"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 14:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="780960735"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="780960735"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jun 2023 14:33:19 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDAsg-0009S1-26;
	Sat, 24 Jun 2023 21:33:18 +0000
Date: Sun, 25 Jun 2023 05:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-regulator:for-next 2/4]
 drivers/regulator/raa215300.c:42:12: sparse: sparse: symbol 'xin_name' was
 not declared. Should it be static?
Message-ID: <202306250552.Fan9WTiN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
head:   e68a81cec046bbf4f42ab8c0e99bcbd188a6c286
commit: 7bce16630837c705f72e8fd53a11ae8c236236f4 [2/4] regulator: Add Renesas PMIC RAA215300 driver
config: mips-randconfig-s032-20230625 (https://download.01.org/0day-ci/archive/20230625/202306250552.Fan9WTiN-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306250552.Fan9WTiN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306250552.Fan9WTiN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/raa215300.c:42:12: sparse: sparse: symbol 'xin_name' was not declared. Should it be static?

vim +/xin_name +42 drivers/regulator/raa215300.c

    40	
    41	const char *clkin_name = "clkin";
  > 42	const char *xin_name = "xin";
    43	static struct clk *clk;
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
