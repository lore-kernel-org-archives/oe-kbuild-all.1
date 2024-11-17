Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFBB482ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731838703; cv=none; b=mNqz7c1VLj1AlCMuH4jBLZZAPowR6iuGRztSajcEYiGW5gLUHdfr0Uo4rETN0mmZ6ZhSshjSER1uV1l3UkxSOW7imNuM/vDJmm7fJ2SxaZEGKDyTNCEJdJT0Oa+fXimIXOARigHneFughGdzNENF9MvJ0FjsxjSAa53433ycxDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731838703; c=relaxed/simple;
	bh=a+oryNx1xV7Ne3PRjpxeb2uPdpRl8x1hHuBO3vDR/wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W9dKs/tfFyiizz/aa5+9tPzRsVJ3QmlMO/BIGfFbeiGqLvyhxSxnGN//kXVHTOqAoVpSZLJesq8WGJx10hnU2Jy4Xn3UDWiDH/fCPihgCAzjaNKWNvTru1T71FMGE1MvEgXDqt4I1dVaONYASYDcqWD0pkmXf/j8vKnvLB5Tuw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kU+4SrQL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kU+4SrQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731838700; x=1763374700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a+oryNx1xV7Ne3PRjpxeb2uPdpRl8x1hHuBO3vDR/wg=;
  b=kU+4SrQLtt0LKjiutXYyDfYjn3mrv39kbtYf4nJet1wzOpniKHyFDwIT
   yvAy9NN4KeelxoEPz5+miSMmqWRSQBfXEPeecSO/GOhflYFgDBXpDOBG/
   XT4W80DzxXIN7bZ0O/tn4ZfgecutgqtueZPqExpf6cFkyeVoMCJMTjg7M
   ry0nuJAHXzVahBc7QvE7bNvUJABs/i0H3Mt54TSChN5i1P4BWHAnwCKYy
   KJ7j9MXIH9K0c4pirMheTZL/3tFprK8As4jHZuHlSvQdKOpjPuWtjR8w3
   xn9hpAn5CgPL/YbLPX6BW/hPahivZuCyqSc1X3cniFdoMEX+Y4DUe7Z7A
   g==;
X-CSE-ConnectionGUID: 2Pl5vJR5Soqh6CaBh+bOhw==
X-CSE-MsgGUID: N0hNTY5zRmiUXwk/jXXFcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31951824"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="31951824"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 02:18:20 -0800
X-CSE-ConnectionGUID: THr7rR+/T6KAgQIE3ikPgQ==
X-CSE-MsgGUID: LBlVJNsiQxqCNgcbphlRNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="93423716"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2024 02:18:19 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCcMD-0001gR-0A;
	Sun, 17 Nov 2024 10:18:17 +0000
Date: Sun, 17 Nov 2024 18:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2439/2439]
 include/linux/compiler_attributes.h:221:41: warning: attribute 'fallthrough'
 not preceding a case label or default label
Message-ID: <202411171805.sOdLtjgt-lkp@intel.com>
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
head:   4cbb736395eb31ff181c4488182276601992fa0b
commit: 0695e18bbaebbfbe22b049104bbb9a4300a9f30c [2439/2439] mm: Add PMU based memory sampling abstract layer
config: arm64-randconfig-004-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171805.sOdLtjgt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171805.sOdLtjgt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171805.sOdLtjgt-lkp@intel.com/

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
