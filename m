Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D90C309F1D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777621056; cv=none; b=GBQHRz5qSjS61RxRVK5bmQcsE5j/5/hfeD1MgiItooTZbCIK5abVZcW9PA7CbrvLKtFW931x5+kCyMIyBPOPlHR68qEzRLUKp9R/61d8V6bFdXCJkVcOcr8R7DZ4h8SdJiwTVZX/kpj1m9/xyvxFsIWMyuKHHQDL6swcB7c6hek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777621056; c=relaxed/simple;
	bh=7CIOPJ1VLViuwTKmGGqGzQ/6yype1RiBCIZzumMThJQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s8TCwcDyoLQNf/Ltor8Foc3O7WV2pbBXvrWR/fvzUe36vShMa7pjp1N68VnpHTwXekvtF3blmnua6XMqcbvx0e9dKdwtJi3zNqgBr6tMFWGm9vD/ZNmByFRpxJ58d6fnXMIxmJIzxFuQkpR/9cEbZlQ6CV3T+5OxKR/98ywXtQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkwtHZVv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkwtHZVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777621055; x=1809157055;
  h=date:from:to:cc:subject:message-id;
  bh=7CIOPJ1VLViuwTKmGGqGzQ/6yype1RiBCIZzumMThJQ=;
  b=HkwtHZVvYIDHnLm6qJtH6r+t1ehUZPm4wtC9HyHaiIf5MDsbm905uw5k
   e3hCxjI0E/purdIqP99vhrbPUWTBwqUlH+9DIRe74vKY89moP/UBmE+eE
   PiFgnBH24qvPIkbHGTq1gtPV7wsaYSBOQb7rIJly7OcDcQSF82YWAtSn9
   D0hB7ZgmFFpypTBmx2t9uajthfoDrXkv3evZN8RbopVEuNfVy5SEOEItO
   IZ0SrjYkJ2nhAPYFKjoIrlvtfvV27dyt+k1iQhXjjW6xDJaszZnSlrhE9
   QmNToFY5wI6dKUPyaFFFkZjHFjvn+gBhGFmp8AVnjylFeD4HDz7qHxGnD
   A==;
X-CSE-ConnectionGUID: eI4WsdSNRDKhJ6pU4xIh1w==
X-CSE-MsgGUID: 1CNcej1oTEGYIKovDdSbSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82189599"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="82189599"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 00:37:35 -0700
X-CSE-ConnectionGUID: 0t0bMhPoRA6Q/VaZDbBT8A==
X-CSE-MsgGUID: KAQtUaXGQXmmprp3Oph+dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="233940344"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 May 2026 00:37:33 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIiRH-000000000JX-0aH7;
	Fri, 01 May 2026 07:37:31 +0000
Date: Fri, 01 May 2026 15:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/2]
 lib/tests/stacktrace_kunit.c:212:31: sparse: sparse: symbol 'basic_scenario'
 was not declared. Should it be static?
Message-ID: <202605011520.NNxLtiPw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   b712a90eff6950d9083a938fb5eabad990fa1cbf
commit: b712a90eff6950d9083a938fb5eabad990fa1cbf [2/2] WIP: lib: add kunit tests for RELIABLE_STACKTRACE
config: powerpc-randconfig-r133-20260501 (https://download.01.org/0day-ci/archive/20260501/202605011520.NNxLtiPw-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011520.NNxLtiPw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011520.NNxLtiPw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/stacktrace_kunit.c:212:31: sparse: sparse: symbol 'basic_scenario' was not declared. Should it be static?

vim +/basic_scenario +212 lib/tests/stacktrace_kunit.c

   211	
 > 212	struct stacktrace_test_params basic_scenario = {
   213		.trace = (void *[]) { caller_1, caller_2, caller_3, NULL },
   214	};
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
