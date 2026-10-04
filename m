Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F643939CE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122207; cv=none; b=FMZfWKXVqV5CNa0w4C2GzgsjyGtFD9K7CtbongSnD5vK/ZW/N7IZnG5xRnzT0IWfBhgW0JfXaZzYD+CeB6aCIrGqe7EfhiMulWmrBU9jnkAcybqJUR07yUzFK6VwP2oSzbWTJQutcMo6CE+iOvo6cSCeuXeQiMqmJqab6ttuByg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122207; c=relaxed/simple;
	bh=GFqctpDoLYBNfrh5UvVfFlFKzHYOBM+kKMSgiQ7MyvY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I50X6KoypLvCOEXFUbux5fuJl4dcjeI2yv3j7MI5Y/O9cPXH9/+wDP8Li5HIljoX/e6qJP+/Y6SC9F4+cbB0KTj7pIYGvp5IbCkGGjCYaCUEu+kKNebjDfpP417zrQTN8umMVt2JsN1KJ6J53E3OYXdoMeC1GHBpzXG1FvUcpWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAi5G6w3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAi5G6w3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791122205; x=1822658205;
  h=date:from:to:cc:subject:message-id;
  bh=GFqctpDoLYBNfrh5UvVfFlFKzHYOBM+kKMSgiQ7MyvY=;
  b=FAi5G6w3AnYmF7n4H3YgtQwZ8qCo8j/+CN2EjRrKgmllHrikKaK+RpCa
   CIQvhgjhBF/HY5f85NPjyWBqmqWfiIw7nNWhn5QL4GbB1vy2yBaonCnEo
   aTjaulEMpR/blKp4M65LmtwqRhLr4oKYfUCRlYHOdW5S2+9EqIb5t6Wmy
   S6zlREfLUyo9oNNMZVys9rjS0TuaTPS6wL0rqFKUZJfffcbcgDuVLasCI
   t4bLdDSysxqEmBSw1NQmxvcugQCLrX2tLCJctALIouKolXy9NUQiYjy0C
   UbbtXNeK23H4abpXihpj0ocwPbaA6SvtKCQ3mSQm6NBeESywn0bKWV6//
   g==;
X-CSE-ConnectionGUID: pnjRI9i/SjWbHxDc3rnIvw==
X-CSE-MsgGUID: t6iceXFzSNCdsAlaQ2NMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91917672"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91917672"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 06:56:45 -0700
X-CSE-ConnectionGUID: zTGQCvwETp+7LiMtQ1T4Fw==
X-CSE-MsgGUID: kjhPqri9SuaS3541FOj53A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="275725247"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 04 Oct 2026 06:56:44 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDMhl-000000000JD-1WJD;
	Sun, 04 Oct 2026 13:56:41 +0000
Date: Sun, 04 Oct 2026 15:55:41 +0200
From: kernel test robot <lkp@intel.com>
To: Anthony Krowiak <akrowiak@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: drivers/s390/crypto/vfio_ap_ops.c:312 function
 parameter 'q' not described in 'vfio_ap_wait_for_irqclear'
Message-ID: <202610041542.AGKuIjKy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anthony-Krowiak/s390-vfio-ap-Fix-leaks-of-pinned-NIB-and-registered-GISC/20260929-081832
head:   620a5e651a016fb89fe1738e2f63a1e8521ece1e
commit: 620a5e651a016fb89fe1738e2f63a1e8521ece1e s390/vfio-ap: replace guest-reachable WARNs with ratelimited warnings
date:   5 days ago
config: s390-randconfig-r2202-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041542.AGKuIjKy-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041542.AGKuIjKy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041542.AGKuIjKy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/s390/crypto/vfio_ap_ops.c:312 function parameter 'q' not described in 'vfio_ap_wait_for_irqclear'
>> Warning: drivers/s390/crypto/vfio_ap_ops.c:312 Excess function parameter 'apqn' description in 'vfio_ap_wait_for_irqclear'
>> Warning: drivers/s390/crypto/vfio_ap_ops.c:312 function parameter 'q' not described in 'vfio_ap_wait_for_irqclear'
>> Warning: drivers/s390/crypto/vfio_ap_ops.c:312 Excess function parameter 'apqn' description in 'vfio_ap_wait_for_irqclear'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
