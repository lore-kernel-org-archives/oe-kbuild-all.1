Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ADA3C47B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065096; cv=none; b=q4/xdeo0bfdb+eMAPPJ2Nyo+5LDy1w9hb8j1qhyqoEMRFNHdx2RKG6M30Hwuravvjb6YU1TKfDzdigU11fNKWt6gkb0KEeQ2fEDL8K3Rsb8NHxAE8/VilzGvXBnCscn0PeH2WPvYs+lvkTFQbaagKi7YDj3Q17BFV1Rx7r0ybUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065096; c=relaxed/simple;
	bh=qELaqKttmGNTaNnjFettFGsgwQEVZZwFOqRaFRGwOg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IyDDjBm5Zt4BjiOO4iALYr4zwtImSG13kJhiOfqVP+rqMoS+SelE8KT8VzJh+oWV8/felo1UhH/XFRXzSjDFlw9q5TXbFwuMit9enmmbkgjZ71GBmpcPaXLfkYrrGSfIgBlT9LNjoeyKfsJ64IQpug/WV8rfAwai/Q/8UDZ74Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYa4KPA0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYa4KPA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065095; x=1763601095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qELaqKttmGNTaNnjFettFGsgwQEVZZwFOqRaFRGwOg8=;
  b=dYa4KPA0GaIdPpWkBmsNFSSCLiw06wED420Ffqgfppd1yEXbeWWN7GpN
   ByRDx0VYyyGbpeEJ88kcMQ9c0vWRIHMf1ustZzyq6ZfMMyHlGWMNx663l
   Vq3b4Qyo355o4I8y64JshifhKf7KIR/+qc3OSgXpebsLlDqzRyB/ceDiR
   0Muc1VVU0dHWO4TwSVK3CgGJvO1rElBygzArksbz8vw6EoivXBOAqjqd6
   uwRkcKLNrz/zlagotFeIST1Rdzcrg3N/jK1CAbEH9rCiaR1tap+fL2Ldx
   UhI9ebs8ohu/GoYnLNxAunYdZgtvjWekKPA813hNvA4lKrEF25TVT46F/
   Q==;
X-CSE-ConnectionGUID: OEQpIuRpQRKizNeKjKtnNw==
X-CSE-MsgGUID: NEOtNTmZRz+8lAZ6sXABeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31851279"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="31851279"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:11:29 -0800
X-CSE-ConnectionGUID: ZSLydJ5NRjS+v3uKjSjVxQ==
X-CSE-MsgGUID: atIEm0TSQWWFAr4iP5OPnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90572465"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 17:11:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZFd-0000OE-1r;
	Wed, 20 Nov 2024 01:11:25 +0000
Date: Wed, 20 Nov 2024 09:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?unknown-8bit?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpu/drm/sti/sti_mixer.c:145:47: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202411191809.6V3c826r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ville,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   158f238aa69d91ad74e535c73f552bd4b025109c
commit: 74bde7581df3e18061119e1b27b63d0a9ea57b7a drm/sti: Allow build with COMPILE_TEST=y
date:   6 months ago
config: sh-randconfig-r132-20241119 (https://download.01.org/0day-ci/archive/20241119/202411191809.6V3c826r-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241119/202411191809.6V3c826r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191809.6V3c826r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sti/sti_mixer.c:145:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got void * @@
   drivers/gpu/drm/sti/sti_mixer.c:145:47: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/gpu/drm/sti/sti_mixer.c:145:47: sparse:     got void *
   drivers/gpu/drm/sti/sti_mixer.c:168:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/sti/sti_mixer.c:168:38: sparse:     expected void *addr
   drivers/gpu/drm/sti/sti_mixer.c:168:38: sparse:     got void [noderef] __iomem *

vim +145 drivers/gpu/drm/sti/sti_mixer.c

a5f81078a56c6a Vincent Abriou 2016-02-04  139  
a5f81078a56c6a Vincent Abriou 2016-02-04  140  static void mixer_dbg_mxn(struct seq_file *s, void *addr)
a5f81078a56c6a Vincent Abriou 2016-02-04  141  {
a5f81078a56c6a Vincent Abriou 2016-02-04  142  	int i;
a5f81078a56c6a Vincent Abriou 2016-02-04  143  
a5f81078a56c6a Vincent Abriou 2016-02-04  144  	for (i = 1; i < 8; i++)
a5f81078a56c6a Vincent Abriou 2016-02-04 @145  		seq_printf(s, "-0x%08X", (int)readl(addr + i * 4));
a5f81078a56c6a Vincent Abriou 2016-02-04  146  }
a5f81078a56c6a Vincent Abriou 2016-02-04  147  

:::::: The code at line 145 was first introduced by commit
:::::: a5f81078a56c6ab57b7db2402ac64c34338004c5 drm/sti: add debugfs entries for MIXER crtc

:::::: TO: Vincent Abriou <vincent.abriou@st.com>
:::::: CC: Vincent Abriou <vincent.abriou@st.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
