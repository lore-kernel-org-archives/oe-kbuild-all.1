Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BFB2500C8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733303595; cv=none; b=DDW/Ih6TqznzhTrs3wQ40rllGhB6MktE+pYOr63/hL23y3c1ev5flw5kvHjdcv+68rnuozk5dXKb+2fMwqec9Gk4dxqz2lqhpdDQeYgpJ238CQJOiAskrY4qXwDMdsRUOIt49wtC63lsr4sKxwU9m10v2WL5ixJ5IJPIJEGS7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733303595; c=relaxed/simple;
	bh=IwpwduN41GrCA7zOENeNfZ2C3vdTnyjt6Gy8N5GKwvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjUiMvVcxlMmUfDY6jnE7L1EyQXmhoUxFQkH47aX5iWFI6kSCxqU2iWLKlL75ZuxYlxL9dVToCSeHwArw3anASU4UWsxUGEoXMjSWoXt/3Kx6Lvt4FqfIFDuNMo1yamJrZOdihRWu4vXr1OiDKbFynJPX2m9iNvWXR8Ei3jyHYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsPjA3la; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsPjA3la"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733303593; x=1764839593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IwpwduN41GrCA7zOENeNfZ2C3vdTnyjt6Gy8N5GKwvI=;
  b=QsPjA3la0l7VJh7pSRcgvGbqL/j2vbhaoJqKEbR+NE0qfd9YUABdSM2Z
   esGPyHj0Gznwyc2uQmAb2Ecldp3m1BGuYuF+nrcXq2kFZ5sDOREABsssh
   MN7NCoMPJkNXMjV6ShvYuPeixg/xb/yYu/VlcJBFwephBSg58exw3k+m3
   o48FTkwPPLP04myHMDe/kAzF2C6C/6xUG6qZBHl4eOiwaGcqBZLUnpR8a
   QNFPUG12q0nDGvh8zI9dDE4xUbYzzCY/IICiEJtB9GC9ef5f15wrr2mj8
   PB3bnwWpyZPgxuoDHjf9XhYAtHHHM5gkGLs1KXIm4VemezcQR1ymHuVAU
   g==;
X-CSE-ConnectionGUID: g+AqAyrnSnC6SwssH/BhyQ==
X-CSE-MsgGUID: oiXZqnOhT8+aYtwC0KGMjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44950947"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44950947"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 01:13:13 -0800
X-CSE-ConnectionGUID: kfWn8QcuTLeMReG3F1Rc7g==
X-CSE-MsgGUID: FF0ReWYhRryzfrg6pXKU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93360272"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Dec 2024 01:13:11 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIlRR-0002oX-0Z;
	Wed, 04 Dec 2024 09:13:06 +0000
Date: Wed, 4 Dec 2024 17:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2439/2439]
 include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough'
 not preceding a case label or default label
Message-ID: <202412041721.uYCyd8sz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b61a367ade32ff42d5f3066b9750e855dc98dd29
commit: 0695e18bbaebbfbe22b049104bbb9a4300a9f30c [2439/2439] mm: Add PMU based memory sampling abstract layer
config: arm64-randconfig-004-20241117 (https://download.01.org/0day-ci/archive/20241204/202412041721.uYCyd8sz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041721.uYCyd8sz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041721.uYCyd8sz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:65,
                    from <command-line>:
   drivers/arm/spe/spe.c: In function '__arm_spe_dev_probe':
>> include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough' not preceding a case label or default label
     221 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   drivers/arm/spe/spe.c:492:17: note: in expansion of macro 'fallthrough'
     492 |                 fallthrough;
         |                 ^~~~~~~~~~~
>> include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough' not preceding a case label or default label
     221 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   drivers/arm/spe/spe.c:514:17: note: in expansion of macro 'fallthrough'
     514 |                 fallthrough;
         |                 ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM_SPE_MEM_SAMPLING
   Depends on [n]: ARM64 [=y] && !ARM_SPE_PMU [=y]
   Selected by [y]:
   - MEM_SAMPLING [=y] && ARM64 [=y]


vim +/fallthrough +221 include/linux/compiler_attributes.h

294f69e662d157 Joe Perches  2019-10-05  209  
294f69e662d157 Joe Perches  2019-10-05  210  /*
294f69e662d157 Joe Perches  2019-10-05  211   * Add the pseudo keyword 'fallthrough' so case statement blocks
294f69e662d157 Joe Perches  2019-10-05  212   * must end with any of these keywords:
294f69e662d157 Joe Perches  2019-10-05  213   *   break;
294f69e662d157 Joe Perches  2019-10-05  214   *   fallthrough;
294f69e662d157 Joe Perches  2019-10-05  215   *   goto <label>;
294f69e662d157 Joe Perches  2019-10-05  216   *   return [expression];
294f69e662d157 Joe Perches  2019-10-05  217   *
294f69e662d157 Joe Perches  2019-10-05  218   *  gcc: https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html#Statement-Attributes
294f69e662d157 Joe Perches  2019-10-05  219   */
294f69e662d157 Joe Perches  2019-10-05  220  #if __has_attribute(__fallthrough__)
294f69e662d157 Joe Perches  2019-10-05 @221  # define fallthrough                    __attribute__((__fallthrough__))
294f69e662d157 Joe Perches  2019-10-05  222  #else
294f69e662d157 Joe Perches  2019-10-05  223  # define fallthrough                    do {} while (0)  /* fallthrough */
a3f8a30f3f0079 Miguel Ojeda 2018-08-30  224  #endif
a3f8a30f3f0079 Miguel Ojeda 2018-08-30  225  

:::::: The code at line 221 was first introduced by commit
:::::: 294f69e662d1570703e9b56e95be37a9fd3afba5 compiler_attributes.h: Add 'fallthrough' pseudo keyword for switch/case use

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
