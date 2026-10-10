Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A062F851
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 05:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791609942; cv=none; b=Dp/QFeXPawrFWajJPOmWPNBypggdDgPH880Oh/2FjArOuPS9H4nZk8Xu3gmJxrEhfDmun7LqR36M6+730GWEORnFByttSREg10YTrD3owLpMWhIKTgj54eUdUm9/io/zfmrLprkJBv0MGZ+7a+g5IV9blFfVGjW7C3eNPJ/3Mfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791609942; c=relaxed/simple;
	bh=JTcHFYhTs46zPpjeggvse2ptwtyQ/cjPd27C29rLaIs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V2Ui87nVUviVhFv2cmLrKDlSS8nfh18Tkp+wXtjzzxAC9HY4Xq86P6PNxBtVSFS9rnRjxcVJVJtw9hKaxd3VOghU6H5iNMOIdwTj3vEynbisXWmiWq1CdAyoMcL56Gqh1fJRZIbi4bnt7ABNP3cUXSP+yAuugGzh5i/B7Sb0WvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOzu06V1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOzu06V1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791609941; x=1823145941;
  h=date:from:to:cc:subject:message-id;
  bh=JTcHFYhTs46zPpjeggvse2ptwtyQ/cjPd27C29rLaIs=;
  b=dOzu06V1l0xcdd05YcXGFq2yPUSkm9vvPACZOZOpyh3PC/KD092ATAJ1
   LpNBWLnUixb/zGK6n4l8DRDYZmf0I1V8uqY/YnmIV1adv8H1giEXphx+n
   Q3ZjxTIh6bkxr8KC+QWsDH9XxLjjpBYK3B+5z6QBSyjMogWAQq8jK6DYN
   lthEoUxyDof8SgI3rNFwIcnD3bifsqVkKcnRqUlZlzmMaHC9qFor/VJ5u
   /N5PTAOnM+3lB/ktFX31D799i2rbSwjbfsnhN9h+ErcCMLhYgoDiv7sqw
   yiZEW9FtNFxoxF8jZkEWe7lHwVGslsS87sm62uTFiZ6qfgvbPZyXcjMyi
   Q==;
X-CSE-ConnectionGUID: So6laswwT/GnH3He9ymdOg==
X-CSE-MsgGUID: 7hEr5/2sROupdT8u3h8jww==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="306348"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="306348"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 22:25:41 -0700
X-CSE-ConnectionGUID: LBTqLScOTYSO/9vINA6u6g==
X-CSE-MsgGUID: fOzGdY9RRNSJa4tkC9Hbtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="481550"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2026 22:25:40 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFPaT-000000007aR-18DQ;
	Sat, 10 Oct 2026 05:25:37 +0000
Date: Sat, 10 Oct 2026 07:25:10 +0200
From: kernel test robot <lkp@intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: oe-kbuild-all@lists.linux.dev,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 13278/16158] ld.lld: error: undefined
 symbol: ccs_pll_calculate
Message-ID: <202610100740.36SHSOB2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   becb95e45ef0dda9ffb35156d909d3da7a2789c3
commit: ee2e9bf41d3e78b85486986cb861305576c6fe21 [13278/16158] media: i2c: add imx576 image sensor driver
config: arm-randconfig-r2202-20261009 (https://download.01.org/0day-ci/archive/20261010/202610100740.36SHSOB2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 63d485c3ddee18e2838ba7235a4c519eb8fe08b9)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100740.36SHSOB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100740.36SHSOB2-lkp@intel.com/

Note: the linux-next/master HEAD becb95e45ef0dda9ffb35156d909d3da7a2789c3 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ccs_pll_calculate
   >>> referenced by imx576.c
   >>>               drivers/media/i2c/imx576.o:(imx576_init_controls) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
