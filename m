Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B6220F36
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752919822; cv=none; b=Gfgy6Wvph7ihDcF/AfBj2ZJoSepJeMCCGYIBZdfdByYvA1Lp64gtmNaKSGicZKmGpROef3CtoD/QefsvpVbu7g1mC58ifn7JsuqbAQbmQdW/SyAAYt1pa341gKklpyO3hDtwPMeJc8O6yKgpRbG2XWCafXU8NkDW/UvG7X5fP1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752919822; c=relaxed/simple;
	bh=eo5tyQNZ55kEPzK5v8pNniLGhgnD4W5Y7oTf/9XzMXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fd4bUcCuHkr26RU599eyhfkqBENTZE0hJMWsA638jQL1b5l0O0/KCeUnBY77LitDCnsiIkrRe5hkYddb6fLrlNLzUNy3w65xasCS8jetp9+sYQNjfcVytJJUJS+d+wHfwBNYrWCdL9oKOgqcJWhStRJARDIOJbgStu8jFLXeQ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fndCOnNc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fndCOnNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752919821; x=1784455821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eo5tyQNZ55kEPzK5v8pNniLGhgnD4W5Y7oTf/9XzMXY=;
  b=fndCOnNcqUAkLHgTuGWmXWO53kxtgkbLZKbI0l5tn/QANxfncpa3Z/qq
   nRgf4Wh1bcuOleXKHO+nb3jHvNHhLCTW1Z/Pzvc0e05OZS30REOoQK5cg
   z/hr/Lgs8343NVJJ8rCja0v9eZ+5MkaNXz+/Y/wCen8O6WOxHIs1tJjHy
   ZFO4Koe83BBD6883Cni/B3s3p9l9K5gOqS/v0JxQyFmWI5Cr4zCE5DElC
   L5uUg6W62tMrVWmB2fk3a8O6gu90Ke3sQbY6S3SW5JxaJBlDqSQY7cvPJ
   z2EUS3fPcYZB3/AmySHCjm9ZDYZj2FvSh0wiYFYBGZmM+pw/lrMf9x+Ji
   Q==;
X-CSE-ConnectionGUID: WHVrozTsQf6M5jiZPlZWvA==
X-CSE-MsgGUID: faZWp7huTMOx6toPpVtnAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="72655659"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="72655659"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 03:09:26 -0700
X-CSE-ConnectionGUID: jX/wQ3MTTyiYtht9DM1ttg==
X-CSE-MsgGUID: GM804nurT/aVX6m8EM/eIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="189403676"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 19 Jul 2025 03:09:25 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud4VO-00013l-12;
	Sat, 19 Jul 2025 10:09:22 +0000
Date: Sat, 19 Jul 2025 12:09:16 +0200
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [jfern:nova/sequencer 38/85] warning: unresolved link to `fsleep`
Message-ID: <202507191244.NU7vW6Eh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/sequencer
head:   efd8e94c58549652d19874d6aa484f3072fc2339
commit: 0c2c9f57cdad9e1b2bcba12c5e2ceb74f5c058ff [38/85] rust: add delay abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250719/202507191244.NU7vW6Eh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191244.NU7vW6Eh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191244.NU7vW6Eh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `fsleep`
   --> rust/kernel/delay.rs:11:34
   |
   11 | /// Equivalent to the kernel's [`fsleep`] function, internally calls `udelay`,
   |                                  ^^^^^^ no item named `fsleep` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
