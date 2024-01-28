Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8AA446C4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 23:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706483393; cv=none; b=K2Tb4zxtFwvSmOSAYH0gDljDb4ZjOUNKPnInBRthydM+zC0g/897bcuFqi+tvNxvKMbQuboguqWNHixHZU6CY1hzvEV1kEwT8RsocS9Qs1avXckfGNSJ/1b7kxTuX3QCJlWm56bJer7MpoQwJxsnSoxbRgg3KLmMiVDqTXvZzFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706483393; c=relaxed/simple;
	bh=vVue83BBbLwzN5DZLCSFxgvdGP6HzD4HMl8YubNfi4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwUzrKQDvGTbC1KnYcom+Uc4Qhudw5ThN1ZECjh8wcjacyLaQCmB9bw+axGH0s+KM9W8siK+v18MnFaV2Bjdqm1C815SaEMS3g4a1pp7d1DWjFd53KHP+cZ47eWsA16SoCyrJXOHRPkRXIsJ/MVigpaXednclLG2UXSq7YS0QpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpnerfdk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpnerfdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706483391; x=1738019391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vVue83BBbLwzN5DZLCSFxgvdGP6HzD4HMl8YubNfi4A=;
  b=gpnerfdkA3CodIgXXGX9eIRNB8Nehxrp6a7Ri/023KZZlxZKjMZe8pDI
   C9RsBkpaQcNc4PeooieHFAgbr9PjHjBc7d8ibxbvEHRp0u2eK9HKNgbf7
   zecIvrjR7NdGoZlMX2vFRYstTwzucvwo+JFr9MRO1kuF/0V9MVWo884JG
   0ah0R0elWE8dSezGU8ZZoU2ywxZN7R+EPhpMFzPoe+s8QHvasinI1t1nD
   vtoHNPnaYpR3YMtAFDpdaTIxhP22MaFQqtGgkceQVQmpzCNQ+2sje4HIS
   GpMjmYDC1DwTS7ZkMNH8IMAK/uKugztOeXFCRWcWgRhdlJqmcyWAULnqL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2675437"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="2675437"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 15:09:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="857919466"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="857919466"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2024 15:09:48 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUEHa-0003ps-2y;
	Sun, 28 Jan 2024 23:09:46 +0000
Date: Mon, 29 Jan 2024 07:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/50 7/9] drivers/watchdog/mtk_wdt.c:48:10:
 fatal error: asm/system_misc.h: No such file or directory
Message-ID: <202401290705.6ONfR9oK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/50
head:   b3bf5911a5d9f6eb8112d294ffaf5f474dccc686
commit: 83ffbaceffed1cd47a6f67fb20e39737dfb2d01a [7/9] [wifi] adding wifi-related changes outside driver-directory
config: i386-buildonly-randconfig-004-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290705.6ONfR9oK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290705.6ONfR9oK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290705.6ONfR9oK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/watchdog/mtk_wdt.c:48:10: fatal error: asm/system_misc.h: No such file or directory
      48 | #include <asm/system_misc.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +48 drivers/watchdog/mtk_wdt.c

  > 48	#include <asm/system_misc.h>
    49	#include <linux/seq_file.h>
    50	#ifdef CONFIG_MT6397_MISC
    51	#include <linux/mfd/mt6397/rtc_misc.h>
    52	#endif
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
