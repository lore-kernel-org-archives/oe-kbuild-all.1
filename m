Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1BD2DF9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMM3XISP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700152180; x=1731688180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=590Nfx5LOhJrlXzOujMm3jU8gvF5FKBx9gK0/11xrYU=;
  b=JMM3XISPE8kHqArkg/GU/n0r3m43Iz2TPfKBvL2/b4fC8aVd0d7Rb8hf
   Tyy2uPLMGusjDTeXm66Syvs/B6ySu5Gwqee0aXGpeXvIZ+eXmZrA+DjCn
   kVtUwlmGMztKNr7XVbihuI7InnFUryAIdZf67YGpzvsJMpTyGVb30ckvi
   fMkS+SatUP+wZ4kZ8VTFDz34lK9Onkcr1hQwcuU58IuJvs1SbXkRSsYqt
   2x18Za3EIV7pd8slyU7/+PP7uMWwh9jRsXgYvMGK8JYBRLR++5aTL5rjr
   zTSdAt3VjB3KgINrmZ7W+yuDF2r6kAs7Ul3qgS0CnxPFnqdJLQAnVIBt8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="395042281"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="395042281"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 08:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="800209190"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="800209190"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Nov 2023 08:29:33 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3fFD-0001t5-1R;
	Thu, 16 Nov 2023 16:29:31 +0000
Date: Fri, 17 Nov 2023 00:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:hdmi-dbg 2/33]
 drivers/clk/clk-hifiberry-dacpro.c:90:22: sparse: sparse: symbol
 'clk_hifiberry_dacpro_rate_ops' was not declared. Should it be static?
Message-ID: <202311170053.yCffnDxd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

First bad commit (maybe != root cause):

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   509acd58c8dd0202ccdbb861ede858e4975b42c4
commit: 6213708f949443dd8f9efa3f65d7dcf0718d7475 [2/33] hifiberry_dacplusadc: add support for the Hifiberry DAC+ ADC
config: mips-randconfig-r132-20231116 (https://download.01.org/0day-ci/archive/20231117/202311170053.yCffnDxd-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311170053.yCffnDxd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311170053.yCffnDxd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/clk-hifiberry-dacpro.c:90:22: sparse: sparse: symbol 'clk_hifiberry_dacpro_rate_ops' was not declared. Should it be static?

vim +/clk_hifiberry_dacpro_rate_ops +90 drivers/clk/clk-hifiberry-dacpro.c

a1a3257de3d6b0 Hans Verkuil 2021-07-19  88  
a1a3257de3d6b0 Hans Verkuil 2021-07-19  89  
a1a3257de3d6b0 Hans Verkuil 2021-07-19 @90  const struct clk_ops clk_hifiberry_dacpro_rate_ops = {
a1a3257de3d6b0 Hans Verkuil 2021-07-19  91  	.recalc_rate = clk_hifiberry_dacpro_recalc_rate,
a1a3257de3d6b0 Hans Verkuil 2021-07-19  92  	.round_rate = clk_hifiberry_dacpro_round_rate,
a1a3257de3d6b0 Hans Verkuil 2021-07-19  93  	.set_rate = clk_hifiberry_dacpro_set_rate,
a1a3257de3d6b0 Hans Verkuil 2021-07-19  94  };
a1a3257de3d6b0 Hans Verkuil 2021-07-19  95  

:::::: The code at line 90 was first introduced by commit
:::::: a1a3257de3d6b0b8eef70eb0a2daf777a0e3bb50 clk-hifiberry-dacpro: add support for the Hifiberry DAC+ ADC

:::::: TO: Hans Verkuil <hverkuil@xs4all.nl>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
