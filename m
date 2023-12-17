Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED543A32
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 01:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eqz6I1OJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702777991; x=1734313991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZA7nxGVNRSp0MIGyIzmJ/RT6/xEmX6/vJhFRmqw46l4=;
  b=Eqz6I1OJFpyN8SSCokG6/cu2SvriViQsCdwGjkIE4576EdkrlyV4N8qA
   PYD4sFN5GH2Md69TUX36WXnm3WOLzrxnHddJ+qGnoeMaf4kWnwMRpKg2Q
   xgn7hF0zGk9F7CNsIRSWr7g/SG/ojo/30+qTiau8UNLBu7yrxtWBkA+oB
   6XA3k3lP8e96n/Bt1d1ic2/vs32VuzaXVAUP9/RP0Eipl5QfXtZai3h7x
   qtsWDD6Dw/mXwZgEpvhNURIOCmwcrUsRK4JYLfDThgEtGaXLku49OWdZL
   pJEGAcmrsYwrvacuYNUOhDwWBZcEUgZ2K9Gg6fJ7HyOjmkQFn08Il/gRQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="461853616"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="461853616"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 17:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="845536128"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="845536128"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2023 17:53:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEgL5-0002Ts-0n;
	Sun, 17 Dec 2023 01:53:07 +0000
Date: Sun, 17 Dec 2023 09:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 13675/16025]
 sound/soc/sof/ipc3-topology.c:290:40: warning: 'micfil_pdm_tokens' defined
 but not used
Message-ID: <202312170939.esfWwkfV-lkp@intel.com>
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
commit: 1665ca32b6c381ea1c780519003ede80d29311ca [13675/16025] LF-9376-5: ASoC: SOF: Add DAI configuration for PDM interface
config: i386-randconfig-013-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170939.esfWwkfV-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170939.esfWwkfV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170939.esfWwkfV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/ipc3-topology.c:290:40: warning: 'micfil_pdm_tokens' defined but not used [-Wunused-const-variable=]
     290 | static const struct sof_topology_token micfil_pdm_tokens[] = {
         |                                        ^~~~~~~~~~~~~~~~~


vim +/micfil_pdm_tokens +290 sound/soc/sof/ipc3-topology.c

   288	
   289	/* MICFIL PDM */
 > 290	static const struct sof_topology_token micfil_pdm_tokens[] = {
   291		{SOF_TKN_IMX_MICFIL_RATE,
   292			SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
   293			offsetof(struct sof_ipc_dai_micfil_params, pdm_rate)},
   294		{SOF_TKN_IMX_MICFIL_CH,
   295			SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
   296			offsetof(struct sof_ipc_dai_micfil_params, pdm_ch)},
   297	};
   298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
