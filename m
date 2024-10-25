Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76E54436A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 06:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729837607; cv=none; b=bxKDaky36NUJBP7h3vwGFYZVr7ZL8gUnGk322JEXD7+pgsvoYsfx+rSc9MH+X3UZ90S9NP67vmHTcNc14JR/FUdczip+/uatD8O4HM9pE9PZ+F2NFXYC5JLpz1OtfMmsCJNbhSPfZVwXhL1pxRwEp0+7RwRdSE65U0uofIlwNhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729837607; c=relaxed/simple;
	bh=BTMks1+qfw+bF/qyl2b5rLu3W6nf6dPAFvzbzObOxXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NZ8V8pjvMdcNe+WCgfD11PesEj7s3XbojaKmpmsXqs2z+uM6QQPCoJBjayYL9Y5rTG9H9eI7dCHv+nUVY4+iOu9EgSqh0Hs+V4R54egtmXxWYvG6ED+QqYCr3UUHHCVYK81HqWZvBnk9asYTq9sO+6lEuMQkEbVryyPQdJnDBqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJ0G2kvg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJ0G2kvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729837605; x=1761373605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BTMks1+qfw+bF/qyl2b5rLu3W6nf6dPAFvzbzObOxXo=;
  b=PJ0G2kvggHRgQuaSvo+Ib+epAj6BVgWB07sLqHN1EyPSjXDiAErwwM/W
   rjzSDMo/L1iMhvgrK+1onzLW58CO6986RfMCyuvpietZs3zajbB5DGpxB
   JztbfRsvVnNMExbmTEm0iXp8QI1/cUg/0VYJvMJbAkWx0F27WEpM/1ul8
   ZKdiDnD2HzMHRZLJNXHeN6QMFUAP0W1FyMIJMf3X7kR6DQsOUcTWdahfL
   SlNdfDEPhsPAJH4ZZmR1UKMXcuFo9A/e+T6hCvn5VpKKHqyrFCfJYquRt
   L1zttGvwKieMUh2M6hD8AFyG2InFVsvcuxuNwFWNQWRiM/F5+d8WJrfxL
   A==;
X-CSE-ConnectionGUID: VLMNtJ50Sj2+/6yMXVaqyw==
X-CSE-MsgGUID: 5I3pkjaSSYWojv3qCbsRaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29437643"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29437643"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 23:26:45 -0700
X-CSE-ConnectionGUID: bMIAmXE8Q3m/V2lx1dLNfg==
X-CSE-MsgGUID: 6Rd6welYQ0O1cDVA2iKZVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85377577"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 23:26:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4DmT-000Xge-2t;
	Fri, 25 Oct 2024 06:26:41 +0000
Date: Fri, 25 Oct 2024 14:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8162/23857] kernel/uid16.o: warning:
 objtool: __x64_sys_getuid16.cold()+0x0: unreachable instruction
Message-ID: <202410251459.SDocFsSZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fc5b1a61061cb6d640f3336024fb616182ef2614
commit: 56bc1719652e7a937bc9856f76f0c0fbf8ce1b23 [8162/23857] objtool: Support GCC 9 cold subfunction naming scheme
config: x86_64-randconfig-076-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251459.SDocFsSZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251459.SDocFsSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251459.SDocFsSZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/uid16.o: warning: objtool: __x64_sys_getuid16.cold()+0x0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
