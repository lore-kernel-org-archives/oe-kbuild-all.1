Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996152BEFFF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 05:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776404331; cv=none; b=C6Mur+9HHs2A9HG6zQr9zDvHhrknyXnjBlnXR2wmDw0RkGQuwj79EnnWWxdjtdlccoSXJJg/8BmgGJPVDgaNLUJqaBsUYrVOxkIl+zQwZVkKieEY5HITXXPRM1+lrzOliFDhc4SVCeZ4jedWZkXfJFFLps0bcHuto9jKob4ePxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776404331; c=relaxed/simple;
	bh=GzaHElv7x69WRnaySGyXn0zXHRwy2Y4+iPYj8UrZhlc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YRFKBVKU+0QWYl85gjCZlsC+nelGUY+xkCZ9O9SFD9ZXORD8D9+e275QhN1Y2MOQ7DRQpszPbmr665NX8TvS6PWEOwarm7B43t8LxPRRYk6d1CRBM/IeEKDchtzxp5l5aQEs28Q+qTsYrvwCZgcQsndDvhQAsUMdZ/ndGtz8CoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRtwcmPg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRtwcmPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776404329; x=1807940329;
  h=date:from:to:cc:subject:message-id;
  bh=GzaHElv7x69WRnaySGyXn0zXHRwy2Y4+iPYj8UrZhlc=;
  b=YRtwcmPgUAX4VIYTxamOrh2TsoZU/zodjqZk2A8o+X6Bu2wB/emiAEDy
   ZOaBhnlE67QI+sdQojjbyehiSxYWKWeTPZHe1QD+G6WxZYYhRSsHZ9tCZ
   usFTjY6llTK78TvryNX8WwfyBA7Qb6mcQG7iBJnn69YB90exZ7zOXPZ1X
   JxFSS1nTBOanKZxbsA3KkCGBgPiijZcM8uHLCF+uMHwVHr74l6U169+XL
   DGNsrHj6PzwLOcTX6YFmoQSmZcLh0Mtl4g6EaPcbXZRGxOeh54tCKAbt8
   gCtiYHFWqHUPYrHfvBszdWrLnO9dzbZwVEon475uulGJAaqCtY0XR6B+W
   w==;
X-CSE-ConnectionGUID: v5p+olUhT3OuvFgw9CvR3w==
X-CSE-MsgGUID: 5me1FAFcT9uPNZVR0wesgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77393832"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77393832"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 22:38:49 -0700
X-CSE-ConnectionGUID: g/cdFaHxSpuMQ2oJyG/LsA==
X-CSE-MsgGUID: WA+n+rsmStWZAvTs0fHcrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="235922115"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2026 22:38:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDbuf-000000001El-3TQN;
	Fri, 17 Apr 2026 05:38:45 +0000
Date: Fri, 17 Apr 2026 07:37:52 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 30/69] warning: used a field
 initializer for a tuple struct
Message-ID: <202604170737.mleaN1PS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Janne,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   234b16b06a9869c5885af57b2853412e854c1216
commit: 0c779dbcbbeaccf8c0ef734565b512942d3ddeb8 [30/69] rust: io: resource: Add owned Resource initialiser
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260417/202604170737.mleaN1PS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170737.mleaN1PS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170737.mleaN1PS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: used a field initializer for a tuple struct
   --> rust/kernel/io/resource.rs:84:9
   |
   84 | /         Resource {
   85 | |             0: Opaque::<bindings::resource>::zeroed(),
   86 | |         }
   | |_________^ help: use tuple initialization: `Resource(Opaque::<bindings::resource>::zeroed())`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#init_numbered_fields
   = note: `-W clippy::init-numbered-fields` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::init_numbered_fields)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
