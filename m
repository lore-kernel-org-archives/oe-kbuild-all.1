Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A6C3AA8C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 11:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687432959; x=1718968959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=okpOCD33I9ytsyVcHtdokcKL7HAJlWsOJYSu/p6Q/U0=;
  b=JKWb2zlqNbvlPZGNzYyZSecyfITbXOIguNwO1toRqZqkAUQrCfmyzl+Y
   ivTMyqgbnDGdJ7Ds+f4IoWu0S5ByQE4ShnXv7UyEJGCu/y8nxYkx1wLAw
   V3HepvRzf35xtfdc/sJpKPIJm+HfCEWfzeMsztSU76GpgoXdbvPws0Wbt
   j5uhegfVBWHOLInzlkiImkf5YzRy4szkgljvNuiYjX4SIjFD2r0EcNXod
   9CQT1p2TC0ZcYb2NVfXH5OHdAra0XFKehdXau89i1NfLNqvds7ilpchVX
   4mOodPwAYm1GFxDKhGFhFyjP5k+OVSEN8bHq+ceNnU1HqjdL5u47KB6T7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357954243"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="357954243"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:22:38 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="749236332"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="749236332"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Jun 2023 04:22:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCIOa-0007WF-1Y;
	Thu, 22 Jun 2023 11:22:36 +0000
Date: Thu, 22 Jun 2023 19:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 127/9881]
 sound/soc/fsl/fsl_xcvr_sysfs.c:106:31: warning: old-style function
 definition
Message-ID: <202306221932.b8p4q5ff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   3260d1af47b1bedfe12b79a26efa184b9a60a8a3
commit: d6bb8a57699c60069606540858677858f7df394d [127/9881] MLK-24965: ASoC: fsl_xcvr: bit and timestamp counters
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230622/202306221932.b8p4q5ff-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221932.b8p4q5ff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221932.b8p4q5ff-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/fsl/fsl_xcvr_sysfs.c: In function 'fsl_xcvr_get_attr_grp':
>> sound/soc/fsl/fsl_xcvr_sysfs.c:106:31: warning: old-style function definition [-Wold-style-definition]
     106 | const struct attribute_group *fsl_xcvr_get_attr_grp()
         |                               ^~~~~~~~~~~~~~~~~~~~~


vim +106 sound/soc/fsl/fsl_xcvr_sysfs.c

   105	
 > 106	const struct attribute_group *fsl_xcvr_get_attr_grp()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
