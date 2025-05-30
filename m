Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6524F1AAC9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 05:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583763; cv=none; b=FUzcDwFXaww5ai5Fpnpnd3QEG8+pk9wRPz/kvthqG3zpCD5OLHleTg1l0d0ANwhym4Uzpc0s+SF4l6qlmxBW5YTLIUGtwciK2qp1dw4kma8zS/syWFEX2J2FAGQO3N1Sf/6YGZhNpyKh8JlmvufuS55buRarPfmvuq5XP4QxuFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583763; c=relaxed/simple;
	bh=hcLVkDCq3nE4l9LJFz6/I7zovgSLXkb+uLS15pNlsJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WCcBxqBzgTlqxmbm1oyuy9YJGW9vLJD99ij+wxBMEsUnV0uZN3hpPeNmJPHmRn+tatYwJjNFZTru8e8MUmAK7dMh8XwpLM1S5PYnR0j4rchW6+QGNhUbFkodfxnqqSWleUfeMvn/Tr4f0IZOSMz8xoQunBiPiiQzD4/el8OFU2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXJ9idRH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXJ9idRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748583762; x=1780119762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hcLVkDCq3nE4l9LJFz6/I7zovgSLXkb+uLS15pNlsJk=;
  b=gXJ9idRHxkeioWWr3nbT1cq/MEDZoo8c75fkhnwBDBMtnm8vhSCxn8Vs
   EaqOfTkl0rIKQwqfPcCjLGvoNg9QvhqCB99UpSDgaAopdqYVjSDFPrRif
   52FM2uhSf5vMeND4Zy11hItBJyaSEHvQLp3j/yjth83uY7duKp4eCyqig
   f+B2JyyYC2br1H5+buCo+ji+f81eRxNxMAPCx6A38+7Yzu8nG5KGXTA+J
   MoUN3lHjGrExixxYH0aqGrp8uQKbidFvgAsRIllOwyVngoZMXR+ONTYqI
   /Vd06le24TKUhaW+oxfcqhg3VhBOsngl/eXAUf6Hy0LzVGzKi0cD7CqOv
   w==;
X-CSE-ConnectionGUID: 2lblmFeATY+xJAYBMZrkAQ==
X-CSE-MsgGUID: AnHUJhBTRcOaLm1rHUBFBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50365162"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50365162"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 22:42:41 -0700
X-CSE-ConnectionGUID: FXEC6nPtSNaCpt0aYKW7tQ==
X-CSE-MsgGUID: vi2ts7mJT3eNj1TtO9Weag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="174666168"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2025 22:42:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKsVp-000XNS-3B;
	Fri, 30 May 2025 05:42:37 +0000
Date: Fri, 30 May 2025 13:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/pinctrl-const-desc 6/21]
 drivers/pinctrl/pinctrl-tb10x.c:815:34: warning: unused variable
 'tb10x_pinctrl_dt_ids'
Message-ID: <202505301317.EI1caRC0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

First bad commit (maybe != root cause):

tree:   https://github.com/krzk/linux b4/pinctrl-const-desc
head:   d2f00c6f3a4c45c0252f6b300e35749ebcc56243
commit: fcc37ff0732f38ecd89c97becc32f422d6aa9f6f [6/21] pinctrl: Allow compile testing for K210, TB10X and ZYNQ
config: hexagon-randconfig-r064-20250529 (https://download.01.org/0day-ci/archive/20250530/202505301317.EI1caRC0-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301317.EI1caRC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301317.EI1caRC0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-tb10x.c:815:34: warning: unused variable 'tb10x_pinctrl_dt_ids' [-Wunused-const-variable]
     815 | static const struct of_device_id tb10x_pinctrl_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/tb10x_pinctrl_dt_ids +815 drivers/pinctrl/pinctrl-tb10x.c

5aad0db1c1ebb0f Christian Ruppert 2013-10-15  813  
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  814  
5aad0db1c1ebb0f Christian Ruppert 2013-10-15 @815  static const struct of_device_id tb10x_pinctrl_dt_ids[] = {
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  816  	{ .compatible = "abilis,tb10x-iomux" },
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  817  	{ }
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  818  };
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  819  MODULE_DEVICE_TABLE(of, tb10x_pinctrl_dt_ids);
5aad0db1c1ebb0f Christian Ruppert 2013-10-15  820  

:::::: The code at line 815 was first introduced by commit
:::::: 5aad0db1c1ebb0f5be79f0adbecc16a2f0259b21 pinctrl: add TB10x pin control driver

:::::: TO: Christian Ruppert <christian.ruppert@abilis.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
