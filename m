Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A7F2147F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486035; cv=none; b=WG2aQSOKkQJTo8fRy04IX8ox8Rtr5zh2cov7vaA8Cz5vr34PFGc84roHkMA0LxElESuJS9ivtq/EZl8fSywZz1JqFxDGECtKYz5wbRBhcymGaAcPWGbHX5QuQmPKoNdpSTQsamhiw4rCXFUwMPM27xZNxHna3j61oM9o7miliCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486035; c=relaxed/simple;
	bh=hvMKilPg5LcquCsrGMAlPjUiveGlFkbSUnRTAcY0MQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HwcLvcCbyeGu1mKvQVEnjlzFrxaAc7DxJLMNJ34CbTvC7OEB+Z/KKS8ml9eJtarXLdYeBRrG7WC5A3AW+esUFGvV1FpP7jt5kCgDq8cjPHlmirvN8UL9koc2NgZ6Ib0S12iDH8Ec4wu2o+9nrBKOpq+jP1infqQSd1+gtfgftyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CarHSMcS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CarHSMcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745486033; x=1777022033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hvMKilPg5LcquCsrGMAlPjUiveGlFkbSUnRTAcY0MQ8=;
  b=CarHSMcS71c+ih0/N2sLkL9fZVnLFA/jcRjfFHoUhX8333l5qpZ+YcVO
   R0Ylf37qOV+mXFDI6VhUTRvm+EZ6SJlfg4X5J7QUmBqXRuXgI1ka9aA4R
   92wpxLS3owM0Dk0yArBB9AdXabBAnji9/wcAzRtJ3jNDqb7lmVjIUB3I4
   RGWfYd+T2c7Gnem4tRuFHBE3/CWLu1pVtb2vnoBhXqyFxZ6iGR5VPkcnz
   8GokhK4ZU1hsKCZVaC1/SE3AipqUvuhToMapfnC3Hz6LkTqm2LnaZnbrn
   jqh7+VMFzDduCBT/GCDAvdcCRz2WDWK/uQJR9LV71tuBpDfQsb9aZNP2N
   A==;
X-CSE-ConnectionGUID: oLdbkDbFSJqV4W5viFfwMg==
X-CSE-MsgGUID: BuAcvFLDRP2Wji+7W1xw4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47234597"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="47234597"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 02:13:52 -0700
X-CSE-ConnectionGUID: g//AZ7g7SQ6sgLBfBFwL8Q==
X-CSE-MsgGUID: lbUiXvjxTQqQ9Fyz4RplwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="163600070"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Apr 2025 02:13:51 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7seS-00041p-2v;
	Thu, 24 Apr 2025 09:13:48 +0000
Date: Thu, 24 Apr 2025 17:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1592/1592] mm/mem_reliable.c:41:22:
 warning: 'zero' defined but not used
Message-ID: <202504241725.jmSsMrko-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: 6943b93b464351cbc35aa002e86bac48e08b1c3f [1592/1592] mm: add support for limiting the usage of reliable memory in pagecache
config: arm64-randconfig-003-20250424 (https://download.01.org/0day-ci/archive/20250424/202504241725.jmSsMrko-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241725.jmSsMrko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504241725.jmSsMrko-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mem_reliable.c:42:22: warning: 'reliable_pagecache_max_bytes' defined but not used [-Wunused-variable]
      42 | static unsigned long reliable_pagecache_max_bytes = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/mem_reliable.c:41:22: warning: 'zero' defined but not used [-Wunused-variable]
      41 | static unsigned long zero;
         |                      ^~~~


vim +/zero +41 mm/mem_reliable.c

    40	
  > 41	static unsigned long zero;
  > 42	static unsigned long reliable_pagecache_max_bytes = ULONG_MAX;
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
