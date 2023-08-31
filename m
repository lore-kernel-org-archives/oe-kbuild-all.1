Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB90F1FDC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 06:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693464874; x=1725000874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1cEGDaF0pSC7ri6Xd7L8mJVhreKQmuBkb3QUNiKcwT4=;
  b=VxkPDnvLEhaPoaOctVLr+lealBxJh0jn8zCvsZ/q3qU9oay6I3VM7Ivh
   ayW2B7H0p07aL8aWf3I7+Z6/7Pdn9cxYdV8x/NA35v7g8U2FqIcajE8R1
   IT7e5nCvD4y/Kl4hS07CsaUHb8dw4eGfvrBgRfkN2hw6qc5yGlElUW/kt
   VD6Xs6ruTvPGs4crXvk9Qg2CTghortH0VbbBalgiCMgHpFEzG4QgMPvu2
   ygra0knA0Zcl4jd81+J/ckxepV4u2XIOcD+Zz03hgS2ti/AbMDu4h0pSV
   CfzvOZDLqSo+2I1PKc4mYxlfyaVaMBh/Zl5oyzOZ9DqTHKgz1lpUtmOf7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379585791"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="379585791"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 23:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="913098760"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="913098760"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Aug 2023 23:54:33 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbbZW-000B3Y-2C;
	Thu, 31 Aug 2023 06:54:30 +0000
Date: Thu, 31 Aug 2023 14:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 135/24604]
 sound/soc/fsl/fsl_xcvr_sysfs.c:106:52: error: a function declaration without
 a prototype is deprecated in all versions of C
Message-ID: <202308311421.SgsHVbiW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viorel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 63a55b587dc56c1621aeea7bed86c56c75f98fa5 [135/24604] MLK-24965: ASoC: fsl_xcvr: bit and timestamp counters
config: hexagon-randconfig-r013-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311421.SgsHVbiW-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311421.SgsHVbiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311421.SgsHVbiW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_xcvr_sysfs.c:106:52: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   const struct attribute_group *fsl_xcvr_get_attr_grp()
                                                      ^
                                                       void
   1 error generated.


vim +106 sound/soc/fsl/fsl_xcvr_sysfs.c

   105	
 > 106	const struct attribute_group *fsl_xcvr_get_attr_grp()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
