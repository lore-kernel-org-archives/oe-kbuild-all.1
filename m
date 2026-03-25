Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D5233B95C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 23:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774480003; cv=none; b=In+RU4RLca7iApzhC65Rqy9UpoPF9WMNreKvVF8VRhQv6uErKpkoxI9YQVoXZzQPYk8iWOFtB9gXZBsdHEGl7aZ6XXLfX2YofnNX73B17xQo3+RkPVmW21PHMUlOdNxfhH+HxENEONynmpE2IRYe8LxlptjjQ2SUNMaC9wvoztM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774480003; c=relaxed/simple;
	bh=MWq1ieUHVw4dFAjsutD6h3rivTdg0g30UihkqK0NvR0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a2lHA2t0FVCLRhqFmdGiu7fRKsg4pnC7qvYyEcIJmjK/x4uIt0q+i4JdEYyX8zh0jrDAmxdY0FjuiUhXoxZ+eFDIqmGa0be2sb9csSYQ66TURwaTwb+RnhxbhbQY0Wftzu6+h75NirrqsJ70cn2LBfQlesZbOInOBPevr/pAzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsAzqRMj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsAzqRMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774480002; x=1806016002;
  h=date:from:to:cc:subject:message-id;
  bh=MWq1ieUHVw4dFAjsutD6h3rivTdg0g30UihkqK0NvR0=;
  b=YsAzqRMjONj3q1JRyorzGSsPVkO62/m2ipU+V2bCJ4luV03vrE/Uj5dK
   WUKFTjVuE9kv7QAjhJMsc99WvKq+uLR+knOKhTYRVBCkdjE4VIuvZLDN4
   09jeHlH4wR5p+WxqKHXFN7byhmAQAdudoi/bfDievLEMnzesyeOqUBbXD
   z9Ie1fMIpWLL8yXVXb+bvv2WUzbMaDmhgNr1RrN4N6rx+Ri+Tw5sHs5UT
   eo+RgmDGN1ir+JlIby12bmFOv3BKgrCfy/gh/T/tWyQHR+O55aud/dUlW
   Nub3nUwQGE4b26cD8ZafFeW6L2YatMfmgrFoeqUskN0oRrugTodAfq7pj
   w==;
X-CSE-ConnectionGUID: xV4i1YvnTZKY0hctC1aCUw==
X-CSE-MsgGUID: EVOyOv2STIOV+it4v57QcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78127752"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="78127752"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 16:06:41 -0700
X-CSE-ConnectionGUID: c+PykJTfQsWrdquHdd99Bw==
X-CSE-MsgGUID: CpoL2yuJTjecgxTiKrqLaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229758890"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Mar 2026 16:06:41 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5XJ7-000000007qD-2tQF;
	Wed, 25 Mar 2026 23:06:37 +0000
Date: Thu, 26 Mar 2026 07:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 drivers/irqchip/irq-gic-v3.c:1585:12: warning: 'gic_v3_suspend' defined but
 not used
Message-ID: <202603260648.ZeVowORd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   7460d0ea2f7ab15f3a2e761eb7364b19541237c4
commit: b4b436ca33c0900359df8643d5c0b27c35954f30 [2/2] ANDROID: irqchip/irq-gic-v3: Add vendor hook for gic suspend
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260326/202603260648.ZeVowORd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260648.ZeVowORd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260648.ZeVowORd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1585:12: warning: 'gic_v3_suspend' defined but not used [-Wunused-function]
    1585 | static int gic_v3_suspend(void) { return 0; }
         |            ^~~~~~~~~~~~~~


vim +/gic_v3_suspend +1585 drivers/irqchip/irq-gic-v3.c

  1582	
  1583	#else
  1584	static inline void gic_syscore_init(void) { }
> 1585	static int gic_v3_suspend(void) { return 0; }
  1586	#endif /* CONFIG_PM */
  1587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
