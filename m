Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61D13634B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722859312; cv=none; b=pgAvTi9E8eGuo9WF7Nae4B/yLwtCoOoDyoXHtbcoS7jxP1PuA7IOTxG+Dgg7dAIVvbo/YqRYqfbx+7Mpl4RyM4obaes4d+YKkw2YiPUGASXf+MVNXtTKwuQ80OB+iDjS6MudgToFlHo53RzLJ8g+bkfNOmW1mLqRn4U1vmQaCtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722859312; c=relaxed/simple;
	bh=EMGbHZ36bfiy6ANenjlwBwUetw+8HsqEvmxmZwhj0FE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ii9khHg3OHMu+CSwFZgPp7Lv077YYVZC8Ip/c6/VMoE9QtF6FmS1o6Qy4KT1MQL3IexirnnNZy24DACKQbP4xfD21QzJ3jQgP62yrjUTL2w0S5y6tWvGL8j+fVyto6TcmdAffFIwxvzTEO15a55jr6USEQVF0dHR/wBpA+cAapk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQzP2BTo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQzP2BTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722859311; x=1754395311;
  h=date:from:cc:subject:message-id:mime-version;
  bh=EMGbHZ36bfiy6ANenjlwBwUetw+8HsqEvmxmZwhj0FE=;
  b=UQzP2BTo/7EqrTZ76pOVoCaLrRuvBWFn2RAz1mbWbH5t1E0LvN6STPm5
   sor3wgWSQIvFfSUpQLg9oa64Q6GpA5v1sBV6tU1ys+2cZsNxGo2yMAsWK
   wKLCVG/CuvFAEz43+2XXBpqOvdJ074PO0w+iaXqm3vd9mVzhnbcV59c/H
   OKa3qYH0Q9BigIr4Sn2ga/PQhzsfwLUtAqU6sOZz1W3QNDbFDvhEvD08G
   juXRhvAaOOQitJ84CXKPauDUgZzmqzTB0715WJGwsDP9me8SUvuab99Ja
   d1sFyMRcysUfrgH3sdX5dYjy5J5IObYS4uS2/nhSKgtpo2XH/Pb87eusj
   Q==;
X-CSE-ConnectionGUID: deYQduRzRfaE5Idx60Ebuw==
X-CSE-MsgGUID: FMy5iyqjSMCs5ktftRl1/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20971027"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="20971027"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 05:01:50 -0700
X-CSE-ConnectionGUID: JnfSlys4RWqpC7G9B+HjRA==
X-CSE-MsgGUID: 9j03i7NLTJi3LNKVO4LeYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="56045307"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Aug 2024 05:01:49 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sawPK-00029Y-2E
	for oe-kbuild-all@lists.linux.dev;
	Mon, 05 Aug 2024 12:01:46 +0000
Date: Mon, 5 Aug 2024 19:56:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_u 1/2] (.rodata+0x0): multiple definition of
 `__crc_nr_running'; arch/s390/appldata/appldata_base.o:(.rodata+0x0): first
 defined here
Message-ID: <202408051953.Pid8tlMK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi xieliujie,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common 5.15/android_u
head:   94569c280459383a0ead42c9af293bd9cd551c03
commit: 0e5b29019b9f08dbed542252ae514682311bfb8c [1/2] ANDROID: vendor_hooks: Add hooks for waking up and exiting control
config: s390-debug_defconfig (https://download.01.org/0day-ci/archive/20240805/202408051953.Pid8tlMK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408051953.Pid8tlMK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408051953.Pid8tlMK-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/sched/core.o: in function `__crc_nr_running':
>> (.rodata+0x0): multiple definition of `__crc_nr_running'; arch/s390/appldata/appldata_base.o:(.rodata+0x0): first defined here
   s390-linux-ld: mm/swapfile.o: in function `__crc_si_swapinfo':
   (.rodata+0x0): multiple definition of `__crc_si_swapinfo'; arch/s390/appldata/appldata_base.o:(.rodata+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
