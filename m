Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DA5208B0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WU0Pbmyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699550021; x=1731086021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FEKRKpTPHUkF0IeMd0huz4xkZFQxYlY7u6PlLsg9G+A=;
  b=WU0PbmydLvXRZl2PW4zcCAMwEOt/1ldBsDAoW/kGqvC5QBDOOzrpGa2W
   nuVTFdtAlmoZyaYytAcoAoIZ1CRylbeAdycupDQa5DFdkXYMIo2RZ4fLr
   yOyQGfX3GR/2rxWxWIHIJEOCiyHdK9u3O/Ussi+j4KVQfxXsKCLVVC6ux
   6AA2EdgQz8rmeGLym8o6Tz01sGYoupg4uHsAo4EzKejj2lcm8L/tsHIFL
   flq9K0bSdd8JxEnfac88NT9pjVVgbP1NyqRR0OKHnnSUdSoybVAq4AuhG
   p5R+vWPtCqRmqqgCVMYraBMzvsAVa2PepWbw8jBMPHVdiWaZ8Z71KpTQ1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392900744"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="392900744"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 09:13:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="767066889"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="767066889"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2023 09:13:35 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r18az-0008x0-0e;
	Thu, 09 Nov 2023 17:13:33 +0000
Date: Fri, 10 Nov 2023 01:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 126/15770]
 sound/soc/fsl/fsl_easrc_m2m.c:19:6: sparse: sparse: symbol
 'fsl_easrc_get_status' was not declared. Should it be static?
Message-ID: <202311100043.3vRGLPQk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: 46ac86d263c28d721f9f740b0e31d488ee95bc43 [126/15770] MLK-21940-4: ASoC: fsl_easrc: Support the m2m function
config: i386-randconfig-063-20231024 (https://download.01.org/0day-ci/archive/20231110/202311100043.3vRGLPQk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100043.3vRGLPQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100043.3vRGLPQk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/fsl/fsl_easrc.c: note: in included file:
>> sound/soc/fsl/fsl_easrc_m2m.c:19:6: sparse: sparse: symbol 'fsl_easrc_get_status' was not declared. Should it be static?
>> sound/soc/fsl/fsl_easrc_m2m.c:282:5: sparse: sparse: symbol 'fsl_easrc_process_buffer_pre' was not declared. Should it be static?
>> sound/soc/fsl/fsl_easrc_m2m.c:415:6: sparse: sparse: symbol 'fsl_easrc_submit_dma' was not declared. Should it be static?

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
