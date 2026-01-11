Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B956D3382C8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768138967; cv=none; b=qcdGSeUQdtwU453U0khda4QjRNejLiQWd7ePzXw3wYdYFduNnleIeMabyN6AYJrsNSX4cI/PXG292jhtqEM2Fig5hf/GEVOkz4snULVlRZ2hwR7X9bRR1Qb2Hx7g9fC9xUEHy1IHszc7RbVIXuOR1QoaIXuOZUGfOeVV9jlEn+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768138967; c=relaxed/simple;
	bh=7seYgv8aH3EwDHYAYX3LN1uzHb4/LOFE8/ot+sRKfQM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lJ/OYEhpOIkcwe5BkWIHLvWENa41TG1lfdBDAbePbX6Gy1vWOciPEF/ZlpFxOYqDEOqSKT9pGrtAWtI4uGm/0h6r2AqHrZmZ8EHVdtudX4uHw69tiyGFc4uzfRN+3GKDGTfELNvAHvGalobOwTU2MI527/p+Wp3X9y527uPhghA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mP9L7IWx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mP9L7IWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768138966; x=1799674966;
  h=date:from:to:cc:subject:message-id;
  bh=7seYgv8aH3EwDHYAYX3LN1uzHb4/LOFE8/ot+sRKfQM=;
  b=mP9L7IWxpdNf5Rk0b4/TgF7PLDJmGPPSh9qKSdLhh1UhjQhW4ZwqxEhp
   METqiocXx88NOeSCdPKN7UkAThsTIrhShWc/AgvvcaAzoEWDDUspsrMog
   KGIBbjytgVO+rBiaO23aT9f0uulPAoruBgc972oAItkx0L4uM17+LbSKi
   Zo3V1OhAsErK/J79og02gLi+J9xkt31pR5KcGZ5cMy2LSepPrduD2oY/7
   HHB1HeQXvcm7cK/jOWY3+RdhEn9oFdhBGmwi7SpsX5I2HmSAXH4ba7gqj
   XJpVs+zvT6q+yzX/NCqLhVV5qral7sSx7dR/wLMv/JOU8mkYGu+TWBDj9
   w==;
X-CSE-ConnectionGUID: 41OtDMFxRzGMp+8YvUb3tQ==
X-CSE-MsgGUID: P6y+WO4lS7yrCrBeMvpepA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="87023225"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="87023225"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 05:42:45 -0800
X-CSE-ConnectionGUID: O04x6UXhTrKn0aRfUPFHag==
X-CSE-MsgGUID: p2q+HO5gR32pMc7VgNNUdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="208406568"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2026 05:42:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veviH-00000000A74-0Vqt;
	Sun, 11 Jan 2026 13:42:37 +0000
Date: Sun, 11 Jan 2026 21:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>
Subject: arch/powerpc/boot/decompress.c:132: undefined reference to
 `__decompress'
Message-ID: <202601112156.tjNlDnmO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   755bc1335e3b116b702205b72eb57b7b8aef2bb2
commit: 8d46603eeeb4c6abff1d2e49f2a6ae289dac765e media: cxd2841er: fix 64-bit division on gcc-9
date:   1 year, 1 month ago
config: powerpc-randconfig-r063-20260111 (https://download.01.org/0day-ci/archive/20260111/202601112156.tjNlDnmO-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601112156.tjNlDnmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112156.tjNlDnmO-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +132 arch/powerpc/boot/decompress.c

1b7898ee276b39 Oliver O'Halloran 2016-09-22   97  
1b7898ee276b39 Oliver O'Halloran 2016-09-22   98  /**
1b7898ee276b39 Oliver O'Halloran 2016-09-22   99   * partial_decompress - decompresses part or all of a compressed buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  100   * @inbuf:       input buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  101   * @input_size:  length of the input buffer
930a77c3ad79c3 Zhang Jianhua     2021-05-10  102   * @outbuf:      output buffer
930a77c3ad79c3 Zhang Jianhua     2021-05-10  103   * @output_size: length of the output buffer
6efc2f1a64ef62 Yang Li           2024-04-08  104   * @_skip:       number of output bytes to ignore
1b7898ee276b39 Oliver O'Halloran 2016-09-22  105   *
1b7898ee276b39 Oliver O'Halloran 2016-09-22  106   * This function takes compressed data from inbuf, decompresses and write it to
1b7898ee276b39 Oliver O'Halloran 2016-09-22  107   * outbuf. Once output_size bytes are written to the output buffer, or the
1b7898ee276b39 Oliver O'Halloran 2016-09-22  108   * stream is exhausted the function will return the number of bytes that were
1b7898ee276b39 Oliver O'Halloran 2016-09-22  109   * decompressed. Otherwise it will return whatever error code the decompressor
1b7898ee276b39 Oliver O'Halloran 2016-09-22  110   * reported (NB: This is specific to each decompressor type).
1b7898ee276b39 Oliver O'Halloran 2016-09-22  111   *
1b7898ee276b39 Oliver O'Halloran 2016-09-22  112   * The skip functionality is mainly there so the program and discover
1b7898ee276b39 Oliver O'Halloran 2016-09-22  113   * the size of the compressed image so that it can ask firmware (if present)
1b7898ee276b39 Oliver O'Halloran 2016-09-22  114   * for an appropriately sized buffer.
1b7898ee276b39 Oliver O'Halloran 2016-09-22  115   */
1b7898ee276b39 Oliver O'Halloran 2016-09-22  116  long partial_decompress(void *inbuf, unsigned long input_size,
1b7898ee276b39 Oliver O'Halloran 2016-09-22  117  	void *outbuf, unsigned long output_size, unsigned long _skip)
1b7898ee276b39 Oliver O'Halloran 2016-09-22  118  {
1b7898ee276b39 Oliver O'Halloran 2016-09-22  119  	int ret;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  120  
1b7898ee276b39 Oliver O'Halloran 2016-09-22  121  	/*
1b7898ee276b39 Oliver O'Halloran 2016-09-22  122  	 * The skipped bytes needs to be included in the size of data we want
1b7898ee276b39 Oliver O'Halloran 2016-09-22  123  	 * to decompress.
1b7898ee276b39 Oliver O'Halloran 2016-09-22  124  	 */
1b7898ee276b39 Oliver O'Halloran 2016-09-22  125  	output_size += _skip;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  126  
1b7898ee276b39 Oliver O'Halloran 2016-09-22  127  	decompressed_bytes = 0;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  128  	output_buffer = outbuf;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  129  	limit = output_size;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  130  	skip = _skip;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  131  
1b7898ee276b39 Oliver O'Halloran 2016-09-22 @132  	ret = __decompress(inbuf, input_size, NULL, flush, outbuf,

:::::: The code at line 132 was first introduced by commit
:::::: 1b7898ee276b39e54d870dc4ef3374f663d0b426 powerpc/boot: Use the pre-boot decompression API

:::::: TO: Oliver O'Halloran <oohall@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
