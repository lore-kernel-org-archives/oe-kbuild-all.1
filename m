Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D64B1E898
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 05:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720501508; cv=none; b=T3uzjVDDnIqGswQvntRFvmbNTdPG3n1KPnA4IXImdA2VaHGpl+UXAS6rysNYwY7BE7GJRJ8dZx+qSG+xtheuIn/V0zkHj9+0bq+7BaaGp+j59uwHlxtUEWEPfgDg7rSR/PFf3SFoGSA5lDeimpTYiSrcSeAl3oTPcDL8fd2aA7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720501508; c=relaxed/simple;
	bh=GukvlLMPEg+ZCOmESxQYk8I5ya2JWaUPzlejiSM+JEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAM40oL456pxafLPbFP8vsRJ3HX8l933WRLLiMOmmSuyUqYtQfiLjxplgqRznXC7mCEWBwhLjJ4rrriSAPtKVXgmiACZnPT1bmah2VIlXUIW4/BtWZ8y18oV1aBi6Y1fQebdowtkPi9rGIZDsXrIy2bCLYujFeRvZf5mZNiqbdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJ7gYqjz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJ7gYqjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720501507; x=1752037507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GukvlLMPEg+ZCOmESxQYk8I5ya2JWaUPzlejiSM+JEY=;
  b=fJ7gYqjzJGXUnlqMoDUCDRtciPXTeJAN9f2GFDa3iLYGfJcOsK5CWP2K
   /EQchuLqPV3tYWMEgPrhg7jGLJWRVNj9o79eQbSOiijhQvQXM9XWB1QPY
   FriRawh7LY557NASUbvrqxf+8LGGqW2uEi/sdr9KhS34c4XAEBvS/g8VC
   5iK4433ADT8TYjZpFzGjbwA1UdCsMZPcJZHkj7IwqaM1qZGTbr2tTyala
   X9CKUYg6+To92R81huzuuIBipLWlRpxM9LI0E+8jM7l/q/+nhLLqTkjrT
   QaMr9bUX/nmCShu3N2GnzErCYRiOar3ebQdtwBgqMxiDFmeyKDEhqGsCn
   g==;
X-CSE-ConnectionGUID: hvLUVqyZS62MUiWX21nsiw==
X-CSE-MsgGUID: 6P/Pj/zPRvaEcG6ARGEMZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17866933"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="17866933"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 22:05:06 -0700
X-CSE-ConnectionGUID: MHLUquuyRPmpkBH3NCTkUQ==
X-CSE-MsgGUID: XydXGQuiSduDQ0yJqO+8+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="48147937"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Jul 2024 22:05:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR32E-000WKy-0I;
	Tue, 09 Jul 2024 05:05:02 +0000
Date: Tue, 9 Jul 2024 13:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-iio-backend-add-debugfs 16/17]
 drivers/iio/frequency/ad9523.c:799:12: warning: 'ad9523_calc_dividers'
 defined but not used
Message-ID: <202407091245.E5qZUIUg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-iio-backend-add-debugfs
head:   4120536adfc0bc741c466d38ae50ffb9760576e3
commit: b41bde75ffe72cb409b84526aabb37d633c5ed1e [16/17] iio: ad9523: out of tree stuff
config: i386-randconfig-006-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091245.E5qZUIUg-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091245.E5qZUIUg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091245.E5qZUIUg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/frequency/ad9523.c:799:12: warning: 'ad9523_calc_dividers' defined but not used [-Wunused-function]
     799 | static int ad9523_calc_dividers(unsigned int vcxo_freq, unsigned int m1_freq,
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/ad9523_calc_dividers +799 drivers/iio/frequency/ad9523.c

   798	
 > 799	static int ad9523_calc_dividers(unsigned int vcxo_freq, unsigned int m1_freq,
   800		unsigned int m2_freq, struct ad9523_platform_data *pdata)
   801	{
   802		unsigned long n2[2], r2[2];
   803		unsigned int fpfd;
   804		unsigned int m_freq, vco_freq;
   805		unsigned int m, m1, m2;
   806	
   807		m1_freq /= 1000;
   808		m2_freq /= 1000;
   809		vcxo_freq /= 1000;
   810	
   811		if (m1_freq != 0)
   812			m_freq = m1_freq;
   813		else
   814			m_freq = m2_freq;
   815	
   816		for (m = 3; m <= 5; m++) {
   817			vco_freq = m_freq * m;
   818			if (AD9523_VCO_FREQ_MIN <= vco_freq &&
   819			    AD9523_VCO_FREQ_MAX >= vco_freq)
   820				break;
   821		}
   822	
   823		if (m == 6)
   824			return -EINVAL;
   825	
   826		if (m1_freq != 0) {
   827			m1 = m;
   828			if (m2_freq != 0) {
   829				m2 = vco_freq / m2_freq;
   830				if (m2 < 3 || m2 > 5 || vco_freq % m2_freq > 1)
   831					return -EINVAL;
   832			} else {
   833				m2 = 3;
   834			}
   835		} else {
   836			m1 = 3;
   837			m2 = m;
   838		}
   839	
   840		rational_best_approximation(vco_freq, vcxo_freq, 255, 31,
   841			&n2[0], &r2[0]);
   842	
   843		pdata->pll2_freq_doubler_en = false;
   844	
   845		if (vco_freq != vcxo_freq * n2[0] / r2[0]) {
   846			rational_best_approximation(vco_freq, vcxo_freq*2, 255, 31,
   847				&n2[1], &r2[1]);
   848	
   849			if (abs((int)(vco_freq / n2[0]) - (int)(vcxo_freq / r2[0])) >
   850			    abs((int)(vco_freq / n2[1] / 2) - (int)(vcxo_freq / r2[1]))) {
   851				n2[0] = n2[1];
   852				r2[0] = r2[1];
   853				pdata->pll2_freq_doubler_en = true;
   854			}
   855		}
   856	
   857		fpfd = vcxo_freq * (pdata->pll2_freq_doubler_en ? 2 : 1) / r2[0];
   858	
   859		while (fpfd > 259000 || !ad9523_pll2_valid_div(n2[0])) {
   860			fpfd /= 2;
   861			n2[0] *= 2;
   862			r2[0] *= 2;
   863		}
   864	
   865		pdata->pll2_r2_div = r2[0];
   866		pdata->pll2_vco_div_m1 = m1;
   867		pdata->pll2_vco_div_m2 = m2;
   868		pdata->pll2_ndiv_a_cnt = n2[0] % 4;
   869		pdata->pll2_ndiv_b_cnt = n2[0] / 4;
   870	
   871		return 0;
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
