Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AF186353
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 10:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743504852; cv=none; b=Y/GrKXGCxmlvsIJdvCFiPaeOp74PFc2/FBS9uWuY1IylhW3ZJaO3jBAb5viyd0ByiC3oKELeslbAiPiCtU109pCUuGknjt+UglS/TfGEoEaXpjC7ZcKFnNtDpd4HRZGc9/+rlARjnvM8TtTM81kQ+4DoojvwbpF12qTlis+RUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743504852; c=relaxed/simple;
	bh=8C6ZZ7TCkCOnBEhzqfkyd+ASw+wjs6qts7KQkx9q7x8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=juP/RUsmnWlzME3fmcyf1R5803avme1NYs3smzTO/AulUNCOKW8SGrVjje+MlJkf9xdb0DAHUif05bktz8caYDSlCH+wl4GQwcpD+ndZCewDu0uppRkWX2L4QY3h0bi0Coj9lfCgbaMSiMFvvic+QnwIkzUG4izaNN9zDI+wCLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFVYGU+6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFVYGU+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743504851; x=1775040851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8C6ZZ7TCkCOnBEhzqfkyd+ASw+wjs6qts7KQkx9q7x8=;
  b=PFVYGU+6qMuDa+lw7ESsGa9+Zp3j0pUo5u8XrvjVxWd3M++vcZRI6EHz
   b5dZ5WPd7SD5IwvRi4haYSoVgdBH49B3E9Sz1n3D+zUx+6JrNj6pCsr7b
   HqAIi0P1Mgfxzv2apq5dDDabmtsZxcqKSjPD9Q4ys/0oJUH2JmH5t/N6J
   8Ztd48zp/2/YONl/F3lp5bUdB9Cy3lB5iSNQT0lRWIEPLofhHi5fM81IS
   9Au/JQTxqdWZVzBiqSHifSIyqmeaBFt4znVUoqDKvT41HJN01Ul+G+QmL
   nCQpM6xyoH1lSRhk+BuTQQCUiLd8OkIec49cHA0uJbOMg8yvWtECRib1M
   g==;
X-CSE-ConnectionGUID: +ZamaSoWScyogQ8M4q46ag==
X-CSE-MsgGUID: ZNJ3gWMnRZe6chkcjTol9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48691233"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="48691233"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 03:54:10 -0700
X-CSE-ConnectionGUID: /cMQNBjnRLqKEf1aNwVxCA==
X-CSE-MsgGUID: Edjb1UWFR1edxvXcCRd8LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126181359"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Apr 2025 03:54:09 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzZFr-0009ne-32;
	Tue, 01 Apr 2025 10:54:04 +0000
Date: Tue, 1 Apr 2025 18:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:dev-shazptr 4/5] ERROR: modpost: "shazptr_slots"
 [kernel/rcu/refscale.ko] undefined!
Message-ID: <202504011816.XCuf0nFn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git dev-shazptr
head:   b51b6b553f5168540a31d5ffbcce0cfc51b4d6ce
commit: ca564fbd58d668142e0a478bc6bde780930c49c9 [4/5] shazptr: Add refscale test
config: sh-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011816.XCuf0nFn-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011816.XCuf0nFn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011816.XCuf0nFn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "shazptr_slots" [kernel/rcu/refscale.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
