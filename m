Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FBB39DBCC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 05:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784281; cv=none; b=Kt2zsS/4cpLI5OzdhlHzURY/P+97ukAukw4cCVGdgMP+hG2nFbEnWECnKvXeVA7JsB1oasrumDIa7d4Zfz5Z0G0mINnEzY1lDr6O9RhRhZLLz4pRluFIvwesmWNjHlrv48x8aOSftmBdt75KHc5GbhEUhR3e2PX9JEHJJoVfQMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784281; c=relaxed/simple;
	bh=kFBOuXhESdH1TqtPV3HceO3qiSyzv0sKCqqNmYHhekg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TT3d+eT6ghzjRk1gksdOQkz89ft15L+mtwPcbzUpkWMYS4o+QLiytmBzA2bokQ63zH9CdG/mdzDjECgvnlodxvLwnTLLWWNAiUr2ObIgy3wQm/mZNfk56Re3uAuHLi6mb4eafnPy7z7hrKf2kiPhiv5WfCVZcVpvhGf84frLkyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnKOHqK9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnKOHqK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791784280; x=1823320280;
  h=date:from:to:cc:subject:message-id;
  bh=kFBOuXhESdH1TqtPV3HceO3qiSyzv0sKCqqNmYHhekg=;
  b=FnKOHqK92TtLxvnwMWnRucOo982mf6GH30QZex5wvOHdMHoF07zKgjYX
   /tu4VDkY1npqvSaXS20MdHcI/L9KmEH0I17ksep/15JHBlNphC6y7LG1M
   HQ7gZP2HuLs30SMv7BJ1byNTt+/gvo2SnP2zZBxWVEFrozWk537NrNiOx
   V3TlHYGnv4rnjuS5tRvcMjLFFeH0+JtoSJdC2nxoD3hAN0X7/R2hxKtpl
   9/OxrYFv7Wl/0vwRQR+3hDpJt9KsAoQx1yO1rOx4vJSMW5Iytsrlv3Yw/
   xpLysSxcyo5hp46j5V6AWu2yAD3z8jWvO9Y64UuPIgyZd1Feso78HsJTW
   Q==;
X-CSE-ConnectionGUID: E/AAHvhQRMCy5/TKYteOwg==
X-CSE-MsgGUID: O8ujXOt+SXmqq4O5waQzEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="489838"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="489838"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 22:51:17 -0700
X-CSE-ConnectionGUID: YcoZzLnSRkuQFkjVzPBPZA==
X-CSE-MsgGUID: HspBciUmSvqkqqK0zoDRdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1139316"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Oct 2026 22:51:16 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG8wL-000000009wp-3RVu;
	Mon, 12 Oct 2026 05:51:13 +0000
Date: Mon, 12 Oct 2026 07:50:45 +0200
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:kernel-7.3/main 10/167]
 redhat/tools-tracing-rtla-fix-el8-compiler-errors.patch: warning: ignored by
 one of the .gitignore files
Message-ID: <202610120725.LrDTur0j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/main
head:   95aeb353309ec61b97c2e486304d7a1cdbb80d39
commit: 7a15cd0f9bf210dcaebc04e34e325671e166339a [10/167] redhat: add tools-tracing-rtla-fix-el8-compiler-errors.patch
config: m68k-randconfig-r2201-20261012 (https://download.01.org/0day-ci/archive/20261012/202610120725.LrDTur0j-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610120725.LrDTur0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610120725.LrDTur0j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> redhat/tools-tracing-rtla-fix-el8-compiler-errors.patch: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
