Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6AB171A2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 09:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2Ts74PS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701421451; x=1732957451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WCLNj8svC4av8QeeiaxxaFGMBsZIKM1ZQh1Rtc0PVbA=;
  b=d2Ts74PSo8Cf1HkeexsBh21Zz7GRCiQirMFnev4ZRH6fiTGWHqac7BpL
   EJHaVgnSUn0NmMMn7kHwQKHlPPaEE+Jx8c/gK8CvKfBhpFAwVyQDPXS/a
   ++aOOGb2On8U/14fSx3c88mny+T1lQsp7wvAQEIDT+wHbIzdJEkBf0TF/
   mi7PAg24DpWuBcDSRaXgAG+D5c6cLQqRZ1nIa14X8ay0km8DeWTSyEtAP
   u/OYV45eVtG/9ev+SnMihh70C/gEX/I32Cc6kbFzOrkv1T9xk/H3ZbRMs
   x2luiaY5DO3qhHyzprf//RZ/dc24LtIDC06vTzcHXKy6OKSkIgBHXARnL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="397357256"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="397357256"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 01:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="887571281"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="887571281"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2023 01:04:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8zRO-0003N6-2l;
	Fri, 01 Dec 2023 09:04:06 +0000
Date: Fri, 1 Dec 2023 17:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Bird <tim.bird@sonymobile.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Josh Triplett <josh@joshtriplett.org>
Subject: undefined reference to `_init'
Message-ID: <202312011721.kLbSzwWM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: 3ce51050fadd63737c03627293ca2dc4be238891 selftest: size: Add size test for Linux kernel
date:   9 years ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312011721.kLbSzwWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312011721.kLbSzwWM-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/12/../../../x86_64-linux-gnu/libc.a(libc-start.o): in function `__libc_start_main_impl':
>> (.text+0x1938): undefined reference to `_init'
   /usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/12/../../../x86_64-linux-gnu/libc.a(libc-start.o): in function `call_fini':
>> (.text+0x39): undefined reference to `_fini'
   /usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/12/../../../x86_64-linux-gnu/libc.a(dl-reloc-static-pie.o): in function `_dl_relocate_static_pie':
>> (.text+0x2d): undefined reference to `_DYNAMIC'
   /usr/bin/ld: (.text+0x89): undefined reference to `_DYNAMIC'
   /usr/bin/ld: (.text+0x94): undefined reference to `_DYNAMIC'
>> collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
