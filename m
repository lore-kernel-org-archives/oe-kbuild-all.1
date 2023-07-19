Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14C017F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 03:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689738027; x=1721274027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D5lz/xbw9KwIBMx66Yd8Oy6fc0NRMpWOEEo1EXBOlxk=;
  b=C/nrkL8dv1AHLLOYRbmbh6GEQGHbssMyINiNZ8XmL7SRUQI+iy03jmZx
   F5XUIBY+ojtJq2tP+6lO3q7o7oTmaiKXOoJVfvkp0lJ8nkhqCsF7vMi0B
   Nf8U44mI8ktJr9zXfQo4dL7E00I+AKQIhiM4BJyhZZem1OdEQ736u6GHD
   lmgw3F/O4A9T4EZd0yMwPSqH7h5veHINSSwYsw9P9+bRvbaZumU6rdqjZ
   XYuwYUFMBloX2env7sExrrfAv1a9uC+Wv1pmQY9RDEbbygb4ycr6q0ye8
   owbH1V2jrUgBtU+UPDyTymPaGKf449CUc8fZ2nCSO+IIu2CxEpYrhfUFu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="356311227"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="356311227"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 20:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="723857151"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="723857151"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 18 Jul 2023 20:40:26 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLy2w-000477-1C;
	Wed, 19 Jul 2023 03:40:17 +0000
Date: Wed, 19 Jul 2023 11:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 127/12467]
 sound/soc/fsl/fsl_xcvr_sysfs.c:106:52: error: a function declaration without
 a prototype is deprecated in all versions of C
Message-ID: <202307191157.xZdEhEfq-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   791ee62ff569635e685d84c09b2179f002c4e0bf
commit: d6bb8a57699c60069606540858677858f7df394d [127/12467] MLK-24965: ASoC: fsl_xcvr: bit and timestamp counters
config: powerpc-randconfig-r022-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191157.xZdEhEfq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191157.xZdEhEfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191157.xZdEhEfq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_xcvr_sysfs.c:106:52: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     106 | const struct attribute_group *fsl_xcvr_get_attr_grp()
         |                                                    ^
         |                                                     void
   1 error generated.


vim +106 sound/soc/fsl/fsl_xcvr_sysfs.c

   105	
 > 106	const struct attribute_group *fsl_xcvr_get_attr_grp()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
