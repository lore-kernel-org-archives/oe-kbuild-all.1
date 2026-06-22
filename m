Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9026296
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 22:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168484; cv=none; b=UXOks95a/QjPkbDPHJjBXyPcPIQAKLHzpisEITPhLP3cddkVNYQBIrKSY+wzd4ZtmliD/YE6vS0MzRW2OztGJRxorBi9c7JjD2iJNP38GyYEO1S92erIX30W8cfQE/ccZkcLmGnqUt4JLMyzXe7KR/tKnKbJUr+xo3FPFCD2qwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168484; c=relaxed/simple;
	bh=kO6B6AXS88izGMNe/e5XEHjpd3AEwEqetnwapIYCPF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PSb28R54HamhxVDL5ftweclQJgD0bUai0kq0LezGbJZkMtA64HNj9tL7gEqKr0aiO9ZdijSN6FPB5vwofh3dAAbU1t7oJjNEs63eaxnEvY0e01LjpD7FcHl3V3w+LysTvNRoHFLPIhDckvbNEes0NmEhflh1MXINa2oEkfqHKPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjpW8x0n; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjpW8x0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782168483; x=1813704483;
  h=date:from:to:cc:subject:message-id;
  bh=kO6B6AXS88izGMNe/e5XEHjpd3AEwEqetnwapIYCPF4=;
  b=PjpW8x0nr78ef6odDJxanbGheWMaWXyiHGSYmLy/7U0gDjH8sbInT56X
   Wf1S5PmeCJBh5UwVmdlq3mR/tK1oWdSIZ5Fnjor6C4IWBAwz65KDRWeXF
   n/Z6gt73KRJb526k/5HWrufhUKQ/qu2nRHRigElmhSK+l+H/47rRQPqXY
   ps8xGmX48iZCK2rojZ98I3aiBzKMrLXZKAOc8JbRG0NRenAKTl8Cw6Dve
   hdJtUr2AjP0BQG/tUa69KiDT1nX6IcN639UzUL+OuTX7QZWwZpJQfhsxp
   ovZ2h9w2FTHzvp0UkGR1g3SRLvL8wgaTF7sQRk03TlucEbTxDmNgqAJCD
   A==;
X-CSE-ConnectionGUID: D4ex1NoISgmu1IQgupSVMg==
X-CSE-MsgGUID: B/5VHk/GRbe4YxwDcxjy+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82947370"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82947370"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 15:48:02 -0700
X-CSE-ConnectionGUID: 7/YbXD9pSf+AjjiBri3hKw==
X-CSE-MsgGUID: xmwb6FGWTmu2mhiKJe0hmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="253242667"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Jun 2026 15:48:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbnQs-00000000229-0mf2;
	Mon, 22 Jun 2026 22:47:58 +0000
Date: Tue, 23 Jun 2026 06:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 96/101] Warning:
 fs/bcachefs/util/fast_list.c:47 function parameter 'gfp' not described in
 'fast_list_get_idx'
Message-ID: <202606230602.y7XaO7xJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 0c148d8d4301dd4875972784a7196c3926d3f3c4 [96/101] bcachefs: New fast_list helpers
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260623/202606230602.y7XaO7xJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230602.y7XaO7xJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230602.y7XaO7xJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/util/fast_list.c:47 function parameter 'gfp' not described in 'fast_list_get_idx'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
