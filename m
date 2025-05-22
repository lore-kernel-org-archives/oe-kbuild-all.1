Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5299933F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 01:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747875825; cv=none; b=cPL1+OKaitQIYmVMdpe4ZaTrukc25cyzfrCQ2cJdUgv/FfvqAx7Wn85jVBFFf+asB7qNaEjcbfL97RAflzDOFp/07ERpBfgkF3fAWBn1gaNyf/aIBowJ4MeQGlEcktIGY14UlP9FJjc2UkOaGICNlToWuoShf2798cYzKDpwMDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747875825; c=relaxed/simple;
	bh=n9SnLqh4tCodyM3aVdT4nCRBm5KJTwGTVz+hCwELNNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LkFT1vyygNRq99GMMpUi0a5Z0UI/gfsK7nXsvUXepR+vD9mieRXpuzBJyNthGDvf0KpEjQiehexpt5SgMAL73gmC03d1IclbKRiuBxJ4nEu5ehh5dwwsQB+C7PTsiasX8QPK38uQDs1JylzJ63XYERFJ7UBVpFPbT1Tg+D00w+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIoi4vPc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIoi4vPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747875822; x=1779411822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n9SnLqh4tCodyM3aVdT4nCRBm5KJTwGTVz+hCwELNNM=;
  b=eIoi4vPc6BJqCLcUc4E8LGhRk/alsRUAKBT9+jSIDWkusbYrJ3VF8RZR
   74EFCYmMCZIU0y3+ntML7ShWobQZznZu6jsngFyNxTABEhbktKoApY6LI
   VjVBriGGVo+hSG7MWvfGTake9jqLhKCAQwpZgDxWRMZLMfs9l6UqYn4zL
   03WYtzEj/r3DUWy4crZecVybkIAvRfdNlpvd6v4y+kT8NvBKLPUV2KfPR
   0Wlx2Au2OkEbO9DmLnlRfP0uYato1VzK0P229aWhw87j4dGWt194s8Zwd
   8pLFF08KN33xWrmwWwOqWBJAfiaLd1p0O+DN7elK60CTTRmVHTZa0AWXB
   g==;
X-CSE-ConnectionGUID: za5OItkCTF6AC8LkbbySWw==
X-CSE-MsgGUID: hlk+huH2R7GskBhXQidyGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49002151"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49002151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:03:37 -0700
X-CSE-ConnectionGUID: rnywVNk7S06N7qOvbijyHA==
X-CSE-MsgGUID: qCeEnrMCSXaPvoYHL/r41Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145306778"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2025 18:03:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHuLN-000On8-28;
	Thu, 22 May 2025 01:03:33 +0000
Date: Thu, 22 May 2025 09:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/4] lib/tests/stacktrace_kunit.c:196:31:
 sparse: sparse: symbol 'basic_scenario' was not declared. Should it be
 static?
Message-ID: <202505220839.JYQCaz20-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   c734aedb3ed9454b32144052f3bd3af91a8a3942
commit: fe72213446c2f40e11ceef009780df565eef74c3 [2/4] WIP: lib: add basic stacktrace tests
config: arm-randconfig-r112-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220839.JYQCaz20-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250522/202505220839.JYQCaz20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220839.JYQCaz20-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/stacktrace_kunit.c:196:31: sparse: sparse: symbol 'basic_scenario' was not declared. Should it be static?

vim +/basic_scenario +196 lib/tests/stacktrace_kunit.c

   195	
 > 196	struct stacktrace_test_params basic_scenario = {
   197		.trace = (void *[]) { caller_1, caller_2, caller_3, NULL },
   198	};
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
