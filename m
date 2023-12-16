Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC5235880
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ic23oZkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702766104; x=1734302104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9N4kvVL2Qe8twH4F4fQoR1xE/5FhVegASRpf2Nir8Wg=;
  b=ic23oZkD8jUEO41d1FdWgzZSflAE1Aoo6pqDQ5bNuCcksfGPY1Ez+s7X
   TswDK4YCTNIM3uXcVxGbqnRfS4Pmq5E5kAYufvvZxyspKeUntKYHGv3gQ
   IP77T3eR+nRtSdIGe5T83sUQJr9aCHaQNVy0Vfp8ZkvCO3XdibpZPTbG+
   KNejQcBkzQH2gKhwLUuTDi/OR/jLUCQ4xIHtUOc7OuVApkIR0eaNrU4lW
   UpEVYo0vS3k+rt/vDr3PIPARXQjFdaJrGknGDxb9D4lKBbUVY+9wTTsfq
   S7GiM8Ydy/TvdPoCpmMipUYroKTPjHBCFXeb1aCM2KJT4BdsAQcZPdegR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="395127315"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="395127315"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 14:35:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768395272"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="768395272"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2023 14:35:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEdFL-0002Hi-2y;
	Sat, 16 Dec 2023 22:34:59 +0000
Date: Sun, 17 Dec 2023 06:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 126/16025]
 sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for
 function 'fsl_easrc_get_status'
Message-ID: <202312170631.3klFhfsb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 46ac86d263c28d721f9f740b0e31d488ee95bc43 [126/16025] MLK-21940-4: ASoC: fsl_easrc: Support the m2m function
config: i386-buildonly-randconfig-006-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170631.3klFhfsb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170631.3klFhfsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170631.3klFhfsb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_easrc.c:1754:
>> sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for function 'fsl_easrc_get_status' [-Wmissing-prototypes]
   void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
        ^
   sound/soc/fsl/fsl_easrc_m2m.c:19:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
   ^
   static 
>> sound/soc/fsl/fsl_easrc_m2m.c:282:5: warning: no previous prototype for function 'fsl_easrc_process_buffer_pre' [-Wmissing-prototypes]
   int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
       ^
   sound/soc/fsl/fsl_easrc_m2m.c:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
   ^
   static 
>> sound/soc/fsl/fsl_easrc_m2m.c:415:6: warning: no previous prototype for function 'fsl_easrc_submit_dma' [-Wmissing-prototypes]
   void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
        ^
   sound/soc/fsl/fsl_easrc_m2m.c:415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
   ^
   static 
   3 warnings generated.


vim +/fsl_easrc_get_status +19 sound/soc/fsl/fsl_easrc_m2m.c

    18	
  > 19	void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
    20				  struct asrc_status_flags *flags)
    21	{
    22		flags->overload_error = 0;
    23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
