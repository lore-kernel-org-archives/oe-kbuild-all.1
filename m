Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A69181ACA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728113825; cv=none; b=Z4Wbgwkl3hsC7z2uFXyKHpllRx2rb/K6upOJGVpjYy2LlhFtI6UiJuRh46yPQGnrEFqoYBEdP6FZmpmFo+oE/StGRWqNwwNbjbGeidZGkAIe3frUwuGEd3xnVr2iMj43eBPmMF78nFVMAw8Rb4wCc7vNe4kMJBdjSDBr1E+0btI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728113825; c=relaxed/simple;
	bh=7QsfAUesIwsyo251sdvhJLi5vbdFFwiEhqwdpjClz0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcpOqb1YFPU72yjwg6Xk6ouLOKI+Ucz5AaBwlU36c/sEYZJmjQJqAWD9AIjCeYaCcXmwp8eOEQ74Ct0iuD2Aon2LRqsLKpF4vK0oH0cHfVawfDd39AIXPY0zVTx5rBTIuiLTr75O/triiBC6X+FQuZKfc70B7aB4bz6TsyACFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ER69iVOT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ER69iVOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728113824; x=1759649824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QsfAUesIwsyo251sdvhJLi5vbdFFwiEhqwdpjClz0k=;
  b=ER69iVOTy4HSQG+q5EEy3t/yUgrZ7P3BMLKR/UDzhnAxxYitYy14Qp1n
   t0YsF4Puq4gpua1TUWxH1av+f5aQf12BF3nP1HwoRc93CTQbMQgVT4Hci
   dBzhHUh8GtnRnT3v6ipipwzUI0fBZUHvjkp425OEHh/ER9nx2jxLFDMSW
   1y49hA/PB8nVRkAEdphgifFvNGtt9BseXBdt1QawW/LlI2vNFa1dH0otM
   0LfLqLfqBzDcPXDbgLBnkQPLy920Gz1fjYJ2sqhu+zlflLI5nJWEDQDbe
   sgPLezXKKd5cgddCiEVniOux9PsjODNw+eCtmvBte/yg8x7WZfOnkFMf5
   Q==;
X-CSE-ConnectionGUID: y9MWBx26QoG5cYp1TfVa5A==
X-CSE-MsgGUID: wk1YUlfSRBqC0zNIKi+4og==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="44860261"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="44860261"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 00:37:03 -0700
X-CSE-ConnectionGUID: mBJ0b46fS8iROa26GYn+Vg==
X-CSE-MsgGUID: 7iohqpDxQByH1F87n0RKhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74511508"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Oct 2024 00:37:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swzLX-0002k6-2D;
	Sat, 05 Oct 2024 07:36:59 +0000
Date: Sat, 5 Oct 2024 15:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpu/drm/sti/sti_mixer.c:145:47: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202410051504.tmcbQl23-lkp@intel.com>
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
head:   27cc6fdf720183dce1dbd293483ec5a9cb6b595e
commit: 74bde7581df3e18061119e1b27b63d0a9ea57b7a drm/sti: Allow build with COMPILE_TEST=y
date:   4 months ago
config: sh-randconfig-r111-20241004 (https://download.01.org/0day-ci/archive/20241005/202410051504.tmcbQl23-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051504.tmcbQl23-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051504.tmcbQl23-lkp@intel.com/

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
