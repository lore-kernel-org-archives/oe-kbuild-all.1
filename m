Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E51AF0D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735039069; cv=none; b=QHC2jm9dZPP0ObKw6QJS4bqYLd8EAnFsKqtqgYG/uM95/gUjqNidvmf2sbiAtnmW0z26SxRcIAGu1Kb0fLmVeqj1AgDx+FXFD4AAUWyBnjXl1T9wRK4WgH2t+XDupelJ8YJKumnW7ngB43juWEajGeVUlLhpfs53FeIuoacDReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735039069; c=relaxed/simple;
	bh=msuPqg8/cBIIf6QkTVjrmVN8/U7rspEdBGTJQ4lxrFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n9PDKkhbPnMYZj5DdZczKNxm00xGde+pLG2VSqvihEKWs0CaSz6zd6+GigbruqF9w51zdg4W821TDJD7Yc+WcdvYsEbvU1iadGRBhBTIKUhgd+YYPia1x6pWzz0+JZ1HQ0chGcqcTnrC0jVKLVwdlQ6j64wdf7Obqzfm2Pex1Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyII+C7f; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyII+C7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735039069; x=1766575069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=msuPqg8/cBIIf6QkTVjrmVN8/U7rspEdBGTJQ4lxrFw=;
  b=LyII+C7f076LIYIzM8DpT+6UWkzQkk6tAXMzcvKmXpWQa7fwhxxNqkXV
   07xJx+TcZWIuDZh/0u05p1Q3ffjG64CW0Q4cFaXmtP12bPKuavcWlkpph
   mXDX1Ev2OqjBWi2bf1ThJyX4IM0z+Tso+Byg4ra/GkO706E4+kASAmf5j
   AaVXlyg3Vc+19WZvPJEZRLwgcy9f4R0oV0VUWlSlJa/pr4k+sHVKpiDgz
   wmJzJQcxMFIRplb+aReE3IOD+SUv54mQnt0N7wJrLi0gO85OB5pJG7W75
   LM/qeLIif+UFnlYdIMLTnCz6dTqFLe2w+PyD30CkKRnnk0mE7drj8KEkx
   A==;
X-CSE-ConnectionGUID: rCjVVQbfTdWPfS2eCsn79A==
X-CSE-MsgGUID: JEDvi3AaQlePw7HnwhTZdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="57971989"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="57971989"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 03:17:48 -0800
X-CSE-ConnectionGUID: lx0yfF0CQ2imJeE/asU5xw==
X-CSE-MsgGUID: rEAoVJWPT+qpRITqvShPVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="99989016"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Dec 2024 03:17:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ2v2-00013A-0A;
	Tue, 24 Dec 2024 11:17:44 +0000
Date: Tue, 24 Dec 2024 19:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>
Subject: [driver-core:driver-core-testing 29/29]
 include/kunit/platform_device.h:15:57: warning: 'struct completion' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202412241958.dbAImJsA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-testing
head:   86a5f32ed8813d5534d3d6c77aad29184a9f99b6
commit: 86a5f32ed8813d5534d3d6c77aad29184a9f99b6 [29/29] drivers: base: test: Add ...find_device_by...(... NULL) tests
config: arc-randconfig-002-20241224 (https://download.01.org/0day-ci/archive/20241224/202412241958.dbAImJsA-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412241958.dbAImJsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412241958.dbAImJsA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/base/test/platform-device-test.c:3:
>> include/kunit/platform_device.h:15:57: warning: 'struct completion' declared inside parameter list will not be visible outside of this definition or declaration
      15 |                                                  struct completion *x);
         |                                                         ^~~~~~~~~~


vim +15 include/kunit/platform_device.h

5ac79730324c6f Stephen Boyd 2024-07-18  12  
5ac79730324c6f Stephen Boyd 2024-07-18  13  int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
5ac79730324c6f Stephen Boyd 2024-07-18  14  						 struct platform_device *pdev,
5ac79730324c6f Stephen Boyd 2024-07-18 @15  						 struct completion *x);
5ac79730324c6f Stephen Boyd 2024-07-18  16  

:::::: The code at line 15 was first introduced by commit
:::::: 5ac79730324c6f37106ce397586020ffe6e8e234 platform: Add test managed platform_device/driver APIs

:::::: TO: Stephen Boyd <sboyd@kernel.org>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
