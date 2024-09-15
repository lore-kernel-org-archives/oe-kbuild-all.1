Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B121C9874
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 17:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726422958; cv=none; b=M+woluthQ27EkDSYblyVKtjzfQglrPcr28w8kBkfB4Egmna4EPrF/nL4RrJRBtCgpD9low4gA4n3+96k52C9JEp8NENBWgYR3U5Vxc4XajwMB9uIDEtFwkVDhxCA6YH4pyko+uqReItPG2oMbLF1HohgN5wz52zP7zO8eWzk4Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726422958; c=relaxed/simple;
	bh=sff3CeSR4Wel3WAjPaXHt5WVJJnfMVnPLskPXoU2UB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ux+p5ch49ct+PHsgX2pqDinXBp7YrN4XBK6fuwfrlHtVpBd9mF2EGz4aGFB5H3SaWGosOHeXFFWDYnvIN1LXdDNVNPqCL/DUC3/Ao1uv2cdAyENuBeyKPzE/KJZGbnJGxqevx72HiZ1YTsa4w66j7DWmYTi2xJqEvB7+RT1vUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJAELZu6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJAELZu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726422955; x=1757958955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sff3CeSR4Wel3WAjPaXHt5WVJJnfMVnPLskPXoU2UB4=;
  b=EJAELZu6nj1t2/QvWigKWn9uYyQ/SMNXXUE7Eey5j6fpLeQGBn6TaYyZ
   Haz0r6VDUh9TBjt1QjSG0S7bKDHsJs4zyhpdEFLOEw5ZCxjm4TI92Emz5
   tp7/DG3frcfcGVDVJfl053Rtd9gPepgqaf4QXD8P+HKSqc0joDf4Gao7O
   mMU370cc19GppcuBT5fFcU7GFWjnbyEftRAaZHqXKl2GWM5TPEX1S6mRT
   2JwganpdW74Rv3nSJPxzj1C9Oh1+UhS9P/CTvd7TNVM59UEZvJVLhkMCH
   gzWRnoXgntbVccxN6Um4rvBqtX4TbEIqPoK6x8bOWD4qZUy/R/Ba5fSCw
   g==;
X-CSE-ConnectionGUID: aBZJr32KTUCEzZioC6mmyQ==
X-CSE-MsgGUID: RrusOHAkQPCwWk0QeEQBeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="47776354"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="47776354"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 10:55:55 -0700
X-CSE-ConnectionGUID: rygpGCZISMuwQJyopzEluQ==
X-CSE-MsgGUID: J9puxUtwSYiouerCGRb/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="69435703"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Sep 2024 10:55:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sptTT-0008tB-1C;
	Sun, 15 Sep 2024 17:55:51 +0000
Date: Mon, 16 Sep 2024 01:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpu/drm/sti/sti_mixer.c:145:58: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202409160130.rrmzw6jd-lkp@intel.com>
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
head:   98f7e32f20d28ec452afb208f9cffc08448a2652
commit: 74bde7581df3e18061119e1b27b63d0a9ea57b7a drm/sti: Allow build with COMPILE_TEST=y
date:   4 months ago
config: mips-randconfig-r132-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160130.rrmzw6jd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20240916/202409160130.rrmzw6jd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160130.rrmzw6jd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sti/sti_mixer.c:145:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/sti/sti_mixer.c:145:58: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/sti/sti_mixer.c:145:58: sparse:     got void *
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
