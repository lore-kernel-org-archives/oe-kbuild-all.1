Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502E0C8FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 06:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579643; cv=none; b=S+u/Z210T9B/Ap3eta5qZBwmIGhQcCfjjtBO83XqPAEhgJUa3yCnvKlWmAs2Br6z8lXA5BBASZYz4+1bioQqFUILwsiR57vw0pwfC8pJGQHQ9zkBFpIEweLfQ4BSN5M7f0hs8lm83OzAjS5gEiDLp7BXqr+gK/wXQf5IPHmTHLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579643; c=relaxed/simple;
	bh=OK4fxMM5p3n1r6HdZM4zUzLCAylXWE4HnP1VZBVc4e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uEkC4Xeo/rJxdOMNbUJov6zNw/WcEewS0XofFi3ZmlP/478z7SdTs01UlnJwpat/J+A+4m2hDoIr2Qqq3r9du59gId0OJ9GQbfqWdedVhAJW/ZceY+BqzHaV03jeh709eR/QEd0fZYXZ9yzEarC/3jEaWwdLLEicCq5cpdVAxto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mg/qx7NT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mg/qx7NT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729579641; x=1761115641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OK4fxMM5p3n1r6HdZM4zUzLCAylXWE4HnP1VZBVc4e4=;
  b=mg/qx7NT5DP047kScoCTyPIEp0BboIN+mwaK5J1wYPNCy3KktpkFuQZh
   1FEq7xLipCn52F+UZoIHQpETXn25FT3hXzruIHIYhlkfmcB1cxaTXT3zy
   kOrjXCzW58pV03Xhae5XJ8zNfcQXAWhBzGgmyJ22CXRK+8EKuVR0T9+yC
   +TFlM78TFDdHEhnChOt1X+u2yif5XY5YiXkLYM6F+bVE5bXEjxwmVC1EE
   WDYTx4m0YWno26eQm4G2a2gcituxhAUeky26eoIgl9SBTmETKy8kjrOTf
   vMamru60hPeE+qjCEkMqxpSVK6x/AC/OeShKHdOon5qGp+sEzZBjiIcNP
   g==;
X-CSE-ConnectionGUID: ZwBnRJCCRiqrhELblVYgjQ==
X-CSE-MsgGUID: bs/5sCXQQjSFOb7koljiyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46561661"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46561661"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 23:47:20 -0700
X-CSE-ConnectionGUID: 1U59FcVwTGyDsqKerE5/ZA==
X-CSE-MsgGUID: Yfc73CsUT0SZTgziwQRE2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="110579226"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Oct 2024 23:47:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t38fl-000TCW-14;
	Tue, 22 Oct 2024 06:47:17 +0000
Date: Tue, 22 Oct 2024 14:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 185/17818]
 sound/soc/codecs/rpmsg_wm8960.c:595: warning: Function parameter or member
 'wm8960' not described in 'wm8960_configure_sysclk'
Message-ID: <202410221448.Tj2a1GL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shengjiu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   096cd0432b03805f49c86684dafb9ced4511a714
commit: 82d769d141173f3d89471170e876234d5a8d2e94 [185/17818] MLK-17156-4: ASoC: rpmsg_wm8960: add rpmsg_wm8960 codec
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241022/202410221448.Tj2a1GL2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221448.Tj2a1GL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221448.Tj2a1GL2-lkp@intel.com/

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
