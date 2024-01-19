Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07D52F7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705671127; cv=none; b=GdIc3L22e6djTXlge8Jyg0rXWrm1FLDx4tXMUYK+sgBYhVLKNboANVHK/HtUvyhjV/XDfJotoVx4iJvtb0FGvHslB85Ygie96BpIt05ANq2IyI0lDszKO/V3zfpWfYROpJAUoMl3Iudj5W3HXx+umrjG2SZJROVqFeeuHxYxvi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705671127; c=relaxed/simple;
	bh=Id7rOui8NkZiJ7fjTDEowsrqpB7WezpIPhNpsOoI5Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHXFUxLZ5cb1z2o84aFAM1FpmWTlNCT2SDK+ElaO8ao1w8XlnsGBMCkCf3gv22KtUF2XoRK3UXQDivjC4EVCfMUIyFLjNe2OxdIxCIORChkWjaxF3+n8Byyg6xoZx/pW8K3vv14skyZLxY/3lHGiQEE28ckcAc2neHXv5GyYO7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQSAf2Yg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQSAf2Yg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705671126; x=1737207126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Id7rOui8NkZiJ7fjTDEowsrqpB7WezpIPhNpsOoI5Ok=;
  b=QQSAf2YgY1S3dXoXG59Sj6f84gy6D7Unp6mNs+ekiNsCF3nX2tx3luk4
   JUag5XHI0BwCliL7pL7lVUuCXPxSaJn0hM7uZiNXI3hYfhCYNHoRK5vIn
   pfhBRQCFMygWKRbAZ1zaxM8CCy3qbMyvWRcVvirL1cuo+S0TjmviFMi7e
   GsIa7rDdj+pXaSQuUOP1SUVdWvtPrF6k1if3Jkah+mhlgmzV2VrUDEQSm
   LBbxiUhop0ryRVSsufKKWCsVR/RIW7rjUEnVzO5iOQcuZQO18cGwurwLh
   vkaeMcGK907asXnLyyHRb2A9AIqcdT93pOP8w8Zq99u1wDdGlr1fEx03o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14101338"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="14101338"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 05:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="33395985"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jan 2024 05:32:03 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQoyV-00045w-32;
	Fri, 19 Jan 2024 13:31:59 +0000
Date: Fri, 19 Jan 2024 21:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [linux-next:master 13664/13959] checksum_kunit.c:undefined reference
 to `csum_ipv6_magic'
Message-ID: <202401192143.jLdjbIy3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad5c60d66016e544c51ed98635a74073f761f45d
commit: 6f4c45cbcb00d649475a3099235e5b4fce569b4b [13664/13959] kunit: Add tests for csum_ipv6_magic and ip_fast_csum
config: nios2-randconfig-r121-20231102 (https://download.01.org/0day-ci/archive/20240119/202401192143.jLdjbIy3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401192143.jLdjbIy3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192143.jLdjbIy3-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: lib/checksum_kunit.o: in function `test_csum_ipv6_magic':
>> checksum_kunit.c:(.text+0x64): undefined reference to `csum_ipv6_magic'
>> checksum_kunit.c:(.text+0x64): relocation truncated to fit: R_NIOS2_CALL26 against `csum_ipv6_magic'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
