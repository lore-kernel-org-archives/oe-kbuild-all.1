Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6F738B7CD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385923; cv=none; b=Yuvd1yKuOaNgkkGFuMjoA41JHnvCv5UT5v1jyLObxTmSXMymSItf4Sd4zd4BzJstVp6j60vJwgQ7JvrdoCmGFyeEXhOhLfVlJPKADRSBdOkn6WkvqJiZK6zzB1yBfvE+ipoD5FeFNLOPFvuu0d8a46UqVxnc2XF5AYHAID8daDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385923; c=relaxed/simple;
	bh=pOqPBFBXh5sDrcNGSHWw1nRHLm0U5AUTEmDlnQ8TZLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oLLqnkyptDFE11T0rOr/g2zp6cK9SrIEveMexObz7tQviRiOSxGkZyeeV9nffTo0pawROe3hUR8rRBSv/TXfKaFnRr5DUEc5gdHJcCwV2OUC3E4q1oFxdkNGvHhTyRU4ZbPJgTHFCPD6orMr1UTd5507gpetfCYsLlm4L/vh2RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHEQKyGL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHEQKyGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385921; x=1820921921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pOqPBFBXh5sDrcNGSHWw1nRHLm0U5AUTEmDlnQ8TZLU=;
  b=LHEQKyGLy0aPQCIP3OuOWsE4UJ96qapRM+Lh0X9ZLs5qclb7LCfgTuTc
   Hi8U+9CZl05y6IfszXPv0fw15uEKmf/Rv9vmP2s1JwxAYLjDMXhgaVUUn
   St2pmgXjvPtb4uHrlhJUOCaArkHqT8Sk1WL1yJIMJBpsWiLSIXxza028n
   iQ5xtGu8M2KHXIevpBFkhSYE/4ujD9TTDWScPAS+8258JW3emfFi7m/f+
   h4f/nvA+In9XTgH7bUaRXgO4qLMsEMMKm1gKqTyaixxnqkKyODxRC9yzz
   srxEiCbOkqhcuHNucBEOyeQlYokdO4bhp8MJQ+av2n4qQhxbtvUofOoKO
   Q==;
X-CSE-ConnectionGUID: Wi2EPfpKSZ63cPWNk6q9Ag==
X-CSE-MsgGUID: KUPkaPqFTKiwBl8uJcwaFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93560337"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="93560337"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:38:41 -0700
X-CSE-ConnectionGUID: IchfAfOBQi6V087BOG/8yQ==
X-CSE-MsgGUID: /9YAkltcSRmifd0+18saZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="272115317"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Sep 2026 04:38:39 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x651B-000000002pz-0XO4;
	Mon, 14 Sep 2026 11:38:37 +0000
Date: Mon, 14 Sep 2026 19:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:ksyms-tune 2/6] ERROR: modpost:
 lib/test_kallsyms_perf.ko: symbol '__udivdi3' undefined!
Message-ID: <202609141923.LABSmJHM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Jim,

First bad commit (maybe != root cause):

tree:   https://github.com/jimc/linux.git ksyms-tune
head:   bc5ee628d6230f6c491f1b868aa7a201bf2ee513
commit: 98f42edea39e65b171279fbce944c903cb70e597 [2/6] kallsyms: Add test_kallsyms_perf module to benchmark lookup latency
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20260914/202609141923.LABSmJHM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141923.LABSmJHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141923.LABSmJHM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/test_kallsyms_perf.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
