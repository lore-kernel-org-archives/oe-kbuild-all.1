Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC2879C1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 12:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687956770; x=1719492770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eah0M12jkqnD6baVvFWH3ujTA7Rp7yWNTTnvD7qe+2U=;
  b=EZfr0PVFFSAs2Rhd9Ju1mJ4XFpY9rtGM5q0qJuKu+koXDngJKloTOCZj
   EZQS9ehEPsv6/zomtbVwimEO4eGLKWDhT/rguWSkFOMMoLNb/uJaUGxyy
   4S1iIEn65UmcaEP/y0ZxVW2TfiAXl9iXZ1e4Bh9+t+ZucQw6PiILeXPBy
   qvuSaOzzEqlh0+pySj2ZmdQnIRY4SBisCP7K7r/Yis0OsNs4BYdHYS+Vp
   9l+IQo0ULBdUNHXYXgZZNVDYaPQ7/81qxNul7BPmqSbeRJfpgrbohgxpW
   OfI/99CGcLKX5tT7wxRWCr6v20acyOd/hZKJETbDnjiK5xd9lUY7bUOf/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="346595557"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="346595557"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 05:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="782273978"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="782273978"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jun 2023 05:52:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEUf2-000DGL-2h;
	Wed, 28 Jun 2023 12:52:40 +0000
Date: Wed, 28 Jun 2023 20:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 11663/12731] ERROR: modpost:
 "clk_unregister_fixed_rate" [drivers/regulator/raa215300.ko] undefined!
Message-ID: <202306282012.sPQAuAN7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5c875096d59010cee4e00da1f9c7bdb07a025dc2
commit: 7bce16630837c705f72e8fd53a11ae8c236236f4 [11663/12731] regulator: Add Renesas PMIC RAA215300 driver
config: m68k-randconfig-r054-20230628 (https://download.01.org/0day-ci/archive/20230628/202306282012.sPQAuAN7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306282012.sPQAuAN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306282012.sPQAuAN7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "clk_unregister_fixed_rate" [drivers/regulator/raa215300.ko] undefined!
>> ERROR: modpost: "clk_register_fixed_rate" [drivers/regulator/raa215300.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
