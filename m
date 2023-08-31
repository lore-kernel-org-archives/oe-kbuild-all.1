Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3720A8F7A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693500181; x=1725036181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mwkFoviMc+8kpIx6bI9ufZfJ1sKOVmFw+n1MjcGObYg=;
  b=dOi80ChTO9aX40wgdZ6XV5/bvRBEv+Skt++gK9j+18sfIkDGz0WE6l24
   5h5Je43FrPYgLLQT/0d4No1DojbOOq4Spa7zzT+5Q0BS/I2Wsj3Techz/
   vr33yP6TjxSgn71Gt28E2swa6qLLQjG3xdTvg64KFCg0mO2dXTQIZTOiL
   MMPrwKKFcn6pXfZ9akpArfCVCCneGo4mwyiiunghUmtHxSvaFme1bdeBp
   bpXWrSLtVIMajnHCRhRVXDhQ3Q8JC9BIvYYs79QssDiCXY9thjVF72MuJ
   XZLlRYJSxyjgUYHj1pidndezeG/d4S9rFETEiR7yR/2kryvFeMEsyJ+Xc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442391651"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="442391651"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 09:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913358361"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="913358361"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Aug 2023 09:42:59 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbkky-0000Mt-30;
	Thu, 31 Aug 2023 16:42:56 +0000
Date: Fri, 1 Sep 2023 00:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 200/24603]
 sound/soc/codecs/rpmsg_wm8960.c:595: warning: Function parameter or member
 'wm8960' not described in 'wm8960_configure_sysclk'
Message-ID: <202309010044.cLdtAGCl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 2774b576cf24b5776af2be2822fc3149999eb569 [200/24603] MLK-17156-4: ASoC: rpmsg_wm8960: add rpmsg_wm8960 codec
config: arc-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010044.cLdtAGCl-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010044.cLdtAGCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010044.cLdtAGCl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rpmsg_wm8960.c:595: warning: Function parameter or member 'wm8960' not described in 'wm8960_configure_sysclk'
>> sound/soc/codecs/rpmsg_wm8960.c:595: warning: Excess function parameter 'wm8960_priv' description in 'wm8960_configure_sysclk'


vim +595 sound/soc/codecs/rpmsg_wm8960.c

   573	
   574	/**
   575	 * wm8960_configure_sysclk - checks if there is a sysclk frequency available
   576	 *	The sysclk must be chosen such that:
   577	 *		- sysclk     = MCLK / sysclk_divs
   578	 *		- lrclk      = sysclk / dac_divs
   579	 *		- 10 * bclk  = sysclk / bclk_divs
   580	 *
   581	 * @wm8960_priv: wm8960 codec private data
   582	 * @mclk: MCLK used to derive sysclk
   583	 * @sysclk_idx: sysclk_divs index for found sysclk
   584	 * @dac_idx: dac_divs index for found lrclk
   585	 * @bclk_idx: bclk_divs index for found bclk
   586	 *
   587	 * Returns:
   588	 *  -1, in case no sysclk frequency available found
   589	 * >=0, in case we could derive bclk and lrclk from sysclk using
   590	 *      (@sysclk_idx, @dac_idx, @bclk_idx) dividers
   591	 */
   592	static
   593	int wm8960_configure_sysclk(struct rpmsg_wm8960_priv *wm8960, int mclk,
   594				    int *sysclk_idx, int *dac_idx, int *bclk_idx)
 > 595	{
   596		int sysclk, bclk, lrclk;
   597		int i, j, k;
   598		int diff;
   599	
   600		/* marker for no match */
   601		*bclk_idx = -1;
   602	
   603		bclk = wm8960->bclk;
   604		lrclk = wm8960->lrclk;
   605	
   606		/* check if the sysclk frequency is available. */
   607		for (i = 0; i < ARRAY_SIZE(sysclk_divs); ++i) {
   608			if (sysclk_divs[i] == -1)
   609				continue;
   610			sysclk = mclk / sysclk_divs[i];
   611			for (j = 0; j < ARRAY_SIZE(dac_divs); ++j) {
   612				if (sysclk != dac_divs[j] * lrclk)
   613					continue;
   614				for (k = 0; k < ARRAY_SIZE(bclk_divs); ++k) {
   615					diff = sysclk - bclk * bclk_divs[k] / 10;
   616					if (diff == 0) {
   617						*sysclk_idx = i;
   618						*dac_idx = j;
   619						*bclk_idx = k;
   620						break;
   621					}
   622				}
   623				if (k != ARRAY_SIZE(bclk_divs))
   624					break;
   625			}
   626			if (j != ARRAY_SIZE(dac_divs))
   627				break;
   628		}
   629		return *bclk_idx;
   630	}
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
