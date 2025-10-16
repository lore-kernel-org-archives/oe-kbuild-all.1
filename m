Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27183218ADD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760651854; cv=none; b=tFG3qINtJ/Ss9try4VZwM/5l0KAHhudujHVV+kH2HKQKr87yfVtQSJbiXxgW1Ru+vFcrjHF0oZJqY6P0UM/37SfBv9wJJt3TyHtImZSinKltfWWr4ZhXacijRKkq/6GezgdVfNwjwjwuawZzB3ZGtLpxGs4XsUiSYIYFu1BHkMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760651854; c=relaxed/simple;
	bh=Ab3nbiYuwXak4+y6FtLehOiXDhzwSGXM7KYTjaRQ8tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QB/ikAcvx1ve4G1hmC69v8fEi4lXJFV/44YZU7XPLV0ByUuiMSTlX3hiexwxyh7S6fkzq+p/Im2aF/bZJwnlxdN14u+RPpUD/403UJdgbOfvkWt4uqi3sMxdhaXIOVvyJ8nSCm4Dt3a+nUzf0u2q6tg0mOm8+5JBrNugGg7HAXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwcA7/u7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwcA7/u7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760651852; x=1792187852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ab3nbiYuwXak4+y6FtLehOiXDhzwSGXM7KYTjaRQ8tw=;
  b=hwcA7/u7CSQs5o87jATExzpir5MNJwIukUFfhP6a3aczoAoC/NeJRG9K
   f8nIVcHu6VsMLo/s/Essv2+jCU2e4G28WZpD3WOZ87M9LvdUgbVzGgt+I
   at8boKsMXd+W0fUJ8G+9TOcXE9aqHvAOC6FYhC62dGh0FKPs+cElShgBC
   lzwAJ7Jc1rGSh3Yd4Op0Vofe+kqWY1FbexB1b3Lpuo8hUtFLPVFr54OoG
   sF2oBtCyVkCLZAO/FZnDrSowGj9n7HQ3EkCKY+rjA1L1OWF5RS0/OfHDI
   v4k4x6Lx4YeLu37DwcgfnVZcFjeQ1hMjRB6KCyy/EflLzRraQ3GYZKYI4
   g==;
X-CSE-ConnectionGUID: 7OTqWODzR9+4/015b70cvQ==
X-CSE-MsgGUID: m+xtzToGSTKoM0yv/nswCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="80492960"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="80492960"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 14:57:31 -0700
X-CSE-ConnectionGUID: 7R7YRLzoS1arMslNbMQVnQ==
X-CSE-MsgGUID: SUkaT07oS7Op7bjCR00Slw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="206271919"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 16 Oct 2025 14:57:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9VyS-0005I3-1Z;
	Thu, 16 Oct 2025 21:57:28 +0000
Date: Fri, 17 Oct 2025 05:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: shanaya-Gupta <shanaya-Gupta@users.noreply.github.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1197 1/1] Kconfig:34: syntax error
Message-ID: <202510170533.w09LJnt8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1197
head:   7773d8bc0eb57a9c6227f90a2792a72c65d08e36
commit: 7773d8bc0eb57a9c6227f90a2792a72c65d08e36 [1/1] fix: Resolve #1196 - Apply PCI rewording suggestions
config: csky-randconfig-001-20251017 (attached as .config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170533.w09LJnt8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170533.w09LJnt8-lkp@intel.com/

All errors (new ones prefixed by >>):

   Kconfig:34:warning: no new line at end of file
>> Kconfig:34: syntax error
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1 shuffle=2682883039
   make[2]: *** [Makefile:742: oldconfig] Error 2 shuffle=2682883039
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2682883039
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2682883039
   make: Target 'oldconfig' not remade because of errors.
--
   Kconfig:34:warning: no new line at end of file
>> Kconfig:34: syntax error
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1 shuffle=2682883039
   make[2]: *** [Makefile:742: olddefconfig] Error 2 shuffle=2682883039
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2682883039
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2682883039
   make: Target 'olddefconfig' not remade because of errors.


vim +34 Kconfig

6f377873cb2390 David Wei          2025-02-14  33  
0d2cdc35e805eb Geert Uytterhoeven 2025-02-19 @34  source "io_uring/Kconfig"

:::::: The code at line 34 was first introduced by commit
:::::: 0d2cdc35e805eb50f4a33b7287995ef590f1b916 io_uring: Rename KConfig to Kconfig

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
