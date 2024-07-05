Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7037415FCE7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720192076; cv=none; b=rK8GCJsWdfuh5kKpsjgaSMt0UgJ/GLVqmzPiFamI1b4UmNlXW7LCLHqL/rzI/aQdsJ6XFvTGJk7lZmVg30VWpb08tT5XGii9E0XmVdgNRcSGouCj/o9WpFkvgR+x0+0JMbAefeEnrT3DLEPAMFCm+VAF5xm/iXJTod/fB9oFyWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720192076; c=relaxed/simple;
	bh=oDdCTdOg9+b5L7ToZqBhD3RsU90ZveZoJubiaYXc5H0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CuBNIFUrPHCC8FaHOVgaxVb1kSiTLtCLZom2C2vWB2onKIHlHMKgPyuGkOOZLQw1MwRpDUfPhgKVZCChQXYc6Ta+3Z+gmf7QbPJ7Op5NrPZcg6OgmcP7w7qYHYl3jh1v/X7YiYRyEcZ1kctqqIcxePHk+2HquihbRWYsbwWUSJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIBZ1LtJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIBZ1LtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720192072; x=1751728072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDdCTdOg9+b5L7ToZqBhD3RsU90ZveZoJubiaYXc5H0=;
  b=lIBZ1LtJW7nXDD23ZammRStOCFD4MOJxddMq1y/hhODJB5Cg3z4H4t+E
   L087E+lAIw+ybrRFsIXxtROrfTrGcUBhatr3CFTlimG+dRE22JaHrgqgU
   oFD48HqqRcRMOTdsj6X2OoOuCtUMiTYvqUI8yq7yjvqk/tBhwl04BPeWU
   eD/60/stB82WQ00tZHwkD4lPjzo/jLfqEPEGCHzWMY8pSWTm6VEAF25z9
   a9yrZUEfnyCbgY6yuf4mqN5pw2+lT0TqSEencf9Hs0ozhTS8ymhvB0mmN
   4vOSwnUh9g43zHEvHl23mcJY6H361j0ZL5jW8DnOaVUBQvVNgLgwoeg69
   w==;
X-CSE-ConnectionGUID: 4CJBJsWnTzOUqrUhl8fFfA==
X-CSE-MsgGUID: LvAphFoFR3O4chT4q+kGlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28641964"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="28641964"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 08:07:52 -0700
X-CSE-ConnectionGUID: lmJQEQnAS0iODL0gAJUnDw==
X-CSE-MsgGUID: qLf0vqfXTRir6yJ3ehfz0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="46840013"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Jul 2024 08:07:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPkXL-000SV8-1R;
	Fri, 05 Jul 2024 15:07:47 +0000
Date: Fri, 5 Jul 2024 23:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2063/10451]
 drivers/gpu/drm/sti/sti_mixer.c:145:47: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202407052221.F4GPZtM2-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 74bde7581df3e18061119e1b27b63d0a9ea57b7a [2063/10451] drm/sti: Allow build with COMPILE_TEST=y
config: sh-randconfig-r133-20240705 (https://download.01.org/0day-ci/archive/20240705/202407052221.F4GPZtM2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240705/202407052221.F4GPZtM2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407052221.F4GPZtM2-lkp@intel.com/

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
