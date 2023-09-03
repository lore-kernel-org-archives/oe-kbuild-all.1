Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10401369
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 05:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693720067; x=1725256067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GwWDbHIcrQuHPY2syUV0RcZammZyL1aS/I6fXxFsrAA=;
  b=kpCWSKxC4OhbWNd40ldLvHfxM8CR4BVJocu4f9GqJkIwEWHemRdZ3yf+
   GcMFg5v3QKh4FgZb7cTx3G2Pt+HmI/XG9bCeTbToHqqXHAmeIvX4uqiOd
   1aHCcrrNIOtEq+seamZutGLY/K3rsGgN9t9IOAWbiX5EwWvmnpZalOO1S
   uJUKe+d52YmY229j+hsUFQL/AXhxvs8DkQ86ZhLEC4dVg1fBgrSW+c1Ca
   I9JIaWl5z8UFNHFxPGJ6hBMD+oPKzkLvONdAk98SjctXceEKQGgYNsF4N
   5YiyW/oGQZ9ynp9lnhVRfBmXQlnMI16SKcb8Ay6MQf17pnnVNfCfH/B/T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="366652032"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="366652032"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 22:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="987138962"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="987138962"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2023 22:47:45 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcfxW-0002wV-32;
	Sun, 03 Sep 2023 05:47:42 +0000
Date: Sun, 3 Sep 2023 13:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: db1000.c:undefined reference to `mmc_detect_change'
Message-ID: <202309031319.FjILvr3H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92901222f83d988617aee37680cb29e1a743b5e4
commit: d4a5c59a955bba96b273ec1a5885bada24c56979 mmc: au1xmmc: force non-modular build and remove symbol_get usage
date:   4 weeks ago
config: mips-randconfig-r003-20230903 (https://download.01.org/0day-ci/archive/20230903/202309031319.FjILvr3H-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031319.FjILvr3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031319.FjILvr3H-lkp@intel.com/

All errors (new ones prefixed by >>):

   mipsel-linux-ld: arch/mips/alchemy/devboards/db1000.o: in function `db1100_mmc_cd':
>> db1000.c:(.text+0x1f0): undefined reference to `mmc_detect_change'
   mipsel-linux-ld: arch/mips/alchemy/devboards/db1200.o: in function `pb1200_mmc1_cdfn':
>> db1200.c:(.text+0x3b0): undefined reference to `mmc_detect_change'
   mipsel-linux-ld: arch/mips/alchemy/devboards/db1200.o: in function `db1200_mmc_cdfn':
   db1200.c:(.text+0x428): undefined reference to `mmc_detect_change'
   mipsel-linux-ld: arch/mips/alchemy/devboards/db1300.o: in function `db1300_mmc_cdfn':
>> db1300.c:(.text+0x240): undefined reference to `mmc_detect_change'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
