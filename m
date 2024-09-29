Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC9113C80C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727604326; cv=none; b=IxGj+CN5aEFL/MSUI6LPYUOURyGM8te4xpiLEw9TFaHaPJoa6Ec0yjisYJI36cANkY97PqB4PqKTfgUqcb1iRZgFG9Ls/0CK7IvOeYSRDa+3g9ertrZb5heUWEvS9GByQsFA/tWP+cUMWTBRsiioMZL2h2zunjAO1iPvGfeEtjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727604326; c=relaxed/simple;
	bh=pVQtDAm4USvgBPMBfFkio6rlpMQHxHZhtHwz5Wu7cSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HsW22twSYR+7enzg6aQVQ6p6JdDLLL3EBDDYA12N5cQqyK4Jnj1wH4j9ku4Nrp6OzNnx6SOOpaLC4vyuCMFl2LSdBXjc8xc+IJGLOBOLIBmujARUxv2sjBPITLoIabGGJpXIGXx6XvrmJ9yXiZ0nTR7XsJCqbWN1wOz7Xhg4QBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkEi0eoq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkEi0eoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727604325; x=1759140325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pVQtDAm4USvgBPMBfFkio6rlpMQHxHZhtHwz5Wu7cSI=;
  b=fkEi0eoqHQFBx4Rb5bmZhbSFIeTvJTkwqmXXFSJ61OsnZFL+p2y27HQV
   Ulp2rFpe9E12nP0iS7y4OKWxV64b6FQ3/xKSD341C9AO1lvdxgneeIH/m
   yBPeCn4NkeJQBJP80bq6wSxS6n8lsk60mHO/itwo9BEKFfceh9tGG/kcw
   v6N2iFVcGzaxMS5BAP+W/obU9tJr3ur99oplqJeBteq7jYTC+eJkRSsEu
   KEz668lU+js59xL/yMrBp5kJhqjk/Xm4Ch6Npoet58RS+ik3mWkzwVXGX
   P0ZDWt1z8BmBBRYyzfjxIxR9PrLA7WKaVhlqvGy4d/nuSGWJBoY12P5vV
   w==;
X-CSE-ConnectionGUID: CyMQCXCkQY2X/Gd466+B6g==
X-CSE-MsgGUID: qSsmzpUiQhKibujFw28eMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="52117555"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="52117555"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 03:05:24 -0700
X-CSE-ConnectionGUID: kWBuDOJATcSxc3AfOdglFw==
X-CSE-MsgGUID: ltuXpQd2TOiwfkAXKdG7rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="110487345"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Sep 2024 03:05:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suqno-000OBe-2G;
	Sun, 29 Sep 2024 10:05:20 +0000
Date: Sun, 29 Sep 2024 18:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 185/16788]
 sound/soc/codecs/rpmsg_wm8960.c:595: warning: Function parameter or member
 'wm8960' not described in 'wm8960_configure_sysclk'
Message-ID: <202409291756.VmGIJcpj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 82d769d141173f3d89471170e876234d5a8d2e94 [185/16788] MLK-17156-4: ASoC: rpmsg_wm8960: add rpmsg_wm8960 codec
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409291756.VmGIJcpj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291756.VmGIJcpj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291756.VmGIJcpj-lkp@intel.com/

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
