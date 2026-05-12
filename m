Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170EA3C2790
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 20:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619489; cv=none; b=WeQ1CKTaOWL4OeJzS5WtXWdKgBPCulnoHxv83LG8Bm/4Z8vuHsYWWDkFtxJXOutarquyDffl0nP7WDeAZ3ywGg7ASWRvh4+Me2Y3RWV28SOmF3+U5UhDPqt8sIcgKqGnwKVdGiP9JdYw4DE216jf92mlITzSZk1jHVvWKlkXa38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619489; c=relaxed/simple;
	bh=CeC5JVjvC1zQiZsx3Qssoo07UjgwvktQDz6/h8N3v4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qbxkS8o1CTiOEPRoMeiR5bW+FDMPE7puJCMI6Ggf8RJulC8ezFETX6SarCFSgrsZkNDDT6JHnPYYTxjihxY8x/w8pM6mBW5SDTCQfVn4jMyOPEzfzVCLIFijZDwwyimX+SQKqlncuWdQlTO9o4tAkgqE7d+Ynkw5+8qa+GPBKgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llWETdVE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llWETdVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778619488; x=1810155488;
  h=date:from:to:cc:subject:message-id;
  bh=CeC5JVjvC1zQiZsx3Qssoo07UjgwvktQDz6/h8N3v4c=;
  b=llWETdVEb+LDv0izWHe5YhLu6mCqTDP65tPmwoJ99BOFo4to/rOIf8ar
   VrOv2oVmIomI28i16C06DIQPZHXYEl5bWAfa6mC4Mzlkx0bShy7LngpY9
   uhWL+RCiLMtyibEOXb/KUDjQP80ADg58a483FvM9YRwlrSWx61Rb07Xqq
   PQ4DZRbGM3gBsjhjz5CVgr/mGVPPZOdumaYd87FEqNq9Qo7rpf/Bl+OaX
   +3AgZZhH6HH8g27G4NiYW942kOXx461RzZWkR9i+QGWbduUy+u6aleirh
   ha1KjvVGDeOaHW3ZjkL9AVy2wkcLkoTlapOhUNTxM7zoooJCSKJVBU1QX
   w==;
X-CSE-ConnectionGUID: 3GmZeHg+TD+IYyMWiusQRQ==
X-CSE-MsgGUID: aRvP54n7Tf2zdEUN+nzSNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89841996"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="89841996"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:58:07 -0700
X-CSE-ConnectionGUID: ML8wtpTTTzyAManXfQVuuA==
X-CSE-MsgGUID: wSsvgzeiRbylRa2VQV5R/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="231494229"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 May 2026 13:58:05 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMuB0-000000002oR-3l4P;
	Tue, 12 May 2026 20:58:02 +0000
Date: Wed, 13 May 2026 04:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jon Hunter <jonathanh@nvidia.com>
Subject: [jonhunter:tegra/next-fixes 6/12] Warning:
 drivers/i2c/busses/i2c-tegra.c:487 struct member 'is_mctp' not described in
 'tegra_i2c_dev'
Message-ID: <202605130428.tG8ScJvM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   b850610c3f917e66aaf920fae5b4d71acf27c7d8
commit: 3705171c009cab5b967c63407947a2f34c312017 [6/12] i2c: tegra: Disable fair arbitration for non-MCTP buses
config: sparc-randconfig-002-20260513 (https://download.01.org/0day-ci/archive/20260513/202605130428.tG8ScJvM-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130428.tG8ScJvM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130428.tG8ScJvM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/i2c/busses/i2c-tegra.c:487 struct member 'is_mctp' not described in 'tegra_i2c_dev'
>> Warning: drivers/i2c/busses/i2c-tegra.c:487 struct member 'is_mctp' not described in 'tegra_i2c_dev'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
