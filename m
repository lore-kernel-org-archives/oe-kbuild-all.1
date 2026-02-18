Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE523EBF32
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 02:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771380797; cv=none; b=CBe1ZITxKUnYWWovYmLeBh6ovtc25wixjLDd12P8XuGGQd0q1rmcZK9eWMT8qMPqcH3a7PRWpT1wAtki48MWP8C/bQzd308jGQN+3L/iSuyF1nByQsqmlvWa/9moYQ9jfhzWeUdgtn2br+pS4eQppTs07atd1sSuP8mYyuQzzT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771380797; c=relaxed/simple;
	bh=pq6O5mNGfHl0hd++75ya3jLghUIbG0o+JZC1rFcQuE8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NaAFOwznXG2agdEtnnBFy0iwuu+xuM7xp4ktevZxHkkgiesm3e24uDZfQbGtODgYIFju/YHHFkItvIr3sBEXvWcDBtJTanlbBtkqx/4jkNvIScNcpphZYJpIVZAoVuXlL7KDHpIIh8KnkWnNUbfZAGNPUGZ5QgoDv4IeexKfgYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpnO8lqy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpnO8lqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771380794; x=1802916794;
  h=date:from:to:cc:subject:message-id;
  bh=pq6O5mNGfHl0hd++75ya3jLghUIbG0o+JZC1rFcQuE8=;
  b=VpnO8lqyFvDhGYtFU8795FM25s69FoAerH3RTsajLmcrA9By89QWNNGF
   2kOjCLbugLCRgoeB+MVXF+YRvRvXX5KWf0/2l1RMfBiee4ZxBFV6ecWPQ
   4bDO8WluPHd6E6G5iniweK/PGebAK+98MUQEG+fJNL64OFZbQ1RLPiBQQ
   whrK+j8VeePt6SK9DkKKuGhsFvillEUZ6McVmBo8bzjPgcXTVu61RRYJQ
   hvF9bIXA4/NoHVoB230e5E/JPk8hrjHjoXlWh8nGpNhg22nucc1ASE2dU
   lMR0nfd+MRPU32/apIIeJgvbrjCmVCdfR26O3B+QtTZmCVKXc4zXV7bTs
   w==;
X-CSE-ConnectionGUID: wVO2iqGiRCiqiWPnkviU9Q==
X-CSE-MsgGUID: nXpiJSkjSTOUINMIqR4amQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72349055"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72349055"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 18:13:14 -0800
X-CSE-ConnectionGUID: RFUdj9rUTemXAXR/QME15w==
X-CSE-MsgGUID: SaxP/Ij4ROyE5O8WsrZDbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="244651896"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Feb 2026 18:13:13 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsX3u-000000003R1-2HqV;
	Wed, 18 Feb 2026 02:13:10 +0000
Date: Wed, 18 Feb 2026 03:12:47 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: [jfern:nova/mm 2/28] warning: unresolved link to `ClistHead`
Message-ID: <202602180316.Zn2c73Zo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   37b89e17139395c3a1a0871785230f02e8c65622
commit: c715ff2f4836775088bd0a6f77684a3582b1d37c [2/28] rust: clist: Add support to interface with C linked lists
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260218/202602180316.Zn2c73Zo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180316.Zn2c73Zo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180316.Zn2c73Zo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `ClistHead`
   --> rust/kernel/ffi/clist.rs:219:23
   |
   219 | /// A sentinel head [`ClistHead`] represents the entire linked list and can be used
   |                       ^^^^^^^^^ no item named `ClistHead` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
