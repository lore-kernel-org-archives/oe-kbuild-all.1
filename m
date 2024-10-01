Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A201CC89D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 20:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727814344; cv=none; b=rFgs52vXrOtdY7ptMbbzTxRwZQO7NUzPEt7pY8/DsG+dAnmX10Ao4DFDVMiVU/jZsAcYf9EDxlh+h0SbVjAk2Cyv8EzS+GJOZXNSTxnAu7Qfh8zG21ENgPLQvjdWUpmMdWAIGo3f7bmON1/lx4XObCeMLfGYmmvqHR2FSldWVbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727814344; c=relaxed/simple;
	bh=8/6G1K7JUw4TPbqLaXARQjqocik+ccUS/CAqH3P0zRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MWfm6Z2VgaqW+AXxBmdbpPR+EuBdadYXOtUlHNlNElg1IsLUeeRKjSaB3TPxpl1+WIMpibh87VU+kAip2NAlnaXMvuqwS9+CxVzlhuMBhqxwU+RRAAtnVJcLCpm2Y7fcgLyurv5u61J4LTy3V0t6HAhLIk5Tn1E6/Y6HgpaftzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFtZRcoa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFtZRcoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727814342; x=1759350342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8/6G1K7JUw4TPbqLaXARQjqocik+ccUS/CAqH3P0zRU=;
  b=MFtZRcoa8xThJKuIwEd3vhoMSEy8en7dk2zqQDRPKk3vjgzRiXodT4I5
   ro+25frtGR6T25mxiIHxHkqJUJXxwo8jgs702SyqoKNZZznMRScqo6N1T
   gL6NeUk45T55FIgF19gP2U6UOq8T6lngfYqOsprtbhvmtiTzuS0SDCOIw
   3LAfQNweWlDGh8GSb0xkfwyrbdDbmmtIk+MloY2e7KDzqkeQFSeo5dcl0
   89T8tbRBuOk4Ol9lmIB5kAvl1d5AQnlrOpE9WF7rO4QTpEJ41Cs1fXIJ4
   xF5e5e81fvQu+SxwANCfchVnHAsn9ud+LL24qodJrK25ze1lJn0scNkFl
   Q==;
X-CSE-ConnectionGUID: KdGUVPPgTaOV/xhlue8byg==
X-CSE-MsgGUID: WbFgTcblTTuzB5cZcrqN8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30763043"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="30763043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 13:25:42 -0700
X-CSE-ConnectionGUID: R86fF9cPSJqz27+znKIwcw==
X-CSE-MsgGUID: YSf2pR2KSjS8QcEBLlelUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="74215264"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Oct 2024 13:25:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svjRC-000R95-0O;
	Tue, 01 Oct 2024 20:25:38 +0000
Date: Wed, 2 Oct 2024 04:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17806/23811]
 drivers/powercap/.tmp_intel_rapl_msr.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202410020406.FALjNWrC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 0ea5d304521b68fb459c57e55f3f1bd853127bc7 [17806/23811] intel_rapl: abstract RAPL common code
config: x86_64-buildonly-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20241002/202410020406.FALjNWrC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020406.FALjNWrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020406.FALjNWrC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/powercap/.tmp_intel_rapl_msr.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
