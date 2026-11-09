Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224320;
	b=e3A+V9oRcv5CCArexV2a/ANp8aUFnUNpP60/lObSSjl1KIvGvPidkBmr7dt5qCKAavyV
	 00B83i+fiHhC2h7SHjZX7rkM9p5m0HuAQbnbFn3fW4LLWoG+AJnN3pvPEWqAHtbNt6vEd
	 UrEYgO8+LU8dcQaMo6JaNl1SCLa46d0ZIqY1ihJjuJuCFyaZDvs8yql4nuepg9j4018Ba
	 QylmLYBNcC8egSe2FuThaMU+G4PHGFL+rAh86MnXQOM9dyqUPI5QBuKGTTtch5UWB2P2/
	 gzIZsvkEiZEwYClFjHWhqTLEH4/pJG1xDwgByfMoW6GOMRVVihvn0Yo8DjzukzOUucA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224320;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=4Sf1KsOAbqWl7+whoIWRbBVT5DvCrakU5COVC9TYdjI=;
	b=DMhkTYdICWQ9TTYRfiSbqHiHkDWq38Z7U+pi5gAWiTgvY94Q33REvVwyqRSoNh9tOyTb
	 6YRoM/7UnhULqdIkIZlTSSx+F7l8w3UHbxRIjetbOUrtOlG8mYMTLWRutybTqJrGhQcmh
	 EUiq95efPHvOb4CNL9BboUspF+MCBpXatPYMjfViNOfSi0VJ/gv9uE+9dpVuh8aantRnS
	 h8pUJ6wvBnZi+qcW8AeQvmmLfhzudRyjjpA/mYrFv7TTkNhBUZgBGqY7sbiPuHLy8MtiQ
	 8qK3S6u31DdCr6CtoyHqjeK12SsCtNpvNaVsKq+dG8kUvTWCvH0ciLyOK78FfVMA1Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ngm+uWPw;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E718606A32A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 11:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E718606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ngm+uWPw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794224319; x=1825760319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TfUOq7RXxiGXqKeMs2JXz976nj1bIEHgSWaYKZmIrV0=;
  b=ngm+uWPwLXKUa2rxgxOQIw+O/3onlGe92WWUi+vS0lkitGrESpuUU/5n
   w25/cec3jF8KvjDLFdDnhHQjQ9ehDbMrIiqIlHox9lCiK93aZVtGGH2ON
   0DYFz33MHZx00mRxjlBd27KTiuXGmgPKbp5KNm9hbPNQvyJtbztdTMc5I
   Xi+B64Mdzu1g+YulV4rU4LY8Fu277dgGLxvmld78egcDgDQZOteQSDHva
   Xs2bFxfGrxf2JLxapeoxR9Ci0UDTU1LkYJ/6xrifu4aqMOu1cw25OHDmO
   Lwbky73Hg9RADnyh8g0zZLfVGyJHxm3ImvZoIXJF5l1QV5xdXjT8JzGzV
   w==;
X-CSE-ConnectionGUID: O4PS987VQA23acZ7//n/bQ==
X-CSE-MsgGUID: jDlvVHXQSn2md1fiWxWFuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3032694"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3032694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:38:38 -0800
X-CSE-ConnectionGUID: jOyStOxlQZ2f2nRAFkqFMg==
X-CSE-MsgGUID: kyRlOB6KSGqYgPVtaWfJMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7852519"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2026 03:38:38 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQNhr-000000000J9-1XgG;
	Mon, 09 Nov 2026 11:38:35 +0000
Date: Mon, 09 Nov 2026 12:38:02 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kbuild-tools-relpath 1/3] ld.lld:
 error: vmlinux.a(kernel/configs.o):(function ikconfig_cleanup:
 .exit.text+0x8): relocation R_RISCV_HI20 out of range: 529853 is not in
 [-524288, 524287]; references '.L.str'
Message-ID: <202611091229.vu0vUdh9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-tools-relpath
head:   16884df7ee9a95f41ed4935523fde6e566b4f519
commit: 1d8c788f87ff39698841e402810ab39b282f17e6 [1/3] EDITME: cover title for kbuild/tools-relpath
config: riscv-randconfig-r2100-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091229.vu0vUdh9-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0d1bc7245734217f06f9bb7e09f9dfd09d31361b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091229.vu0vUdh9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091229.vu0vUdh9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/configs.o):(function ikconfig_cleanup: .exit.text+0x8): relocation R_RISCV_HI20 out of range: 529853 is not in [-524288, 524287]; references '.L.str'
   >>> referenced by configs.c:72 (kernel/configs.c:72)
   >>> defined in vmlinux.a(kernel/configs.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
