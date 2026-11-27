Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821778;
	b=emLOIm3fAc2zLOufrNMPF5PplJdKii6WjJJUipBxHL/+UsrEPNsxJWqsYSDNCtVpWIfR
	 lcF5MfKUqz6065dunq6dtY9y81I4tZmzTlKT0g8kwqDm4hhe1ApU2HbzqwOdPazCPvE2N
	 TpxicBhrBc3+ZkJIjGpg9o53mqqTLji4+0eCiECflhfrcOpDpxNTCHtD5VNMFkpTbwWWp
	 jS4y+V9HvybuJWimv9kpF9JWQ/mptpEIf31CdnGUj7e7gDt/O3sZQowhqXseTpc6u+gFj
	 k5/xb9Rv5PQc/E2bn/+X0OUtdkx5DqPf0WoisiGFl7pnqh4iz5IXyK2UCLLx3XR//sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821778;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Di9D/t0H1815dvGlq+t3APdyo0a8/yKmduoB7wWRGsQ=;
	b=RYuW460xWcwqABd69LeKmJmV7pLSDZ8FczThG22Q8dNqes0Wl0qPwTt9mNq0nYi+VKC1
	 IAC9WfTpBhAdvmc0OwCa/UywF4pc+XIKEpiYpDrj5tXjPIiKPE/Ea7Z7N1lxi+rRUdFh6
	 0mzIWPtV7CQ2sYSsetRG0tEAusFHpisKVwg+WpkyM5Ejwhb2qzjeaS8kJIrMJdOP0DRUv
	 48COPOL4zSfhZVsxVgrmOJ/im7tPt9pQ6fA+etsbCINjvRpH4g8KYi6GGBtQ98tVRCtEC
	 n0kowFudPy/oBp96TGMDNnOO3xHd5IbTOXvNeiChtZ4N/Ak3EtvYFuwEnb/Uw/bogbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MyQY2Zo8;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A418E606A323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 23:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A418E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MyQY2Zo8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795821778; x=1827357778;
  h=date:from:to:cc:subject:message-id;
  bh=n+cK+Gg9p/BYSQsZvHfq/hf4cCzTcAlWPWYFCFmh/wg=;
  b=MyQY2Zo8OjlqdZ9W8qCCz3cFcj2MEKjF4h11fgsrpaCdWLRA+njz7yxl
   Ghf1Eab/1XnORoRiyC+Fq3mJYftG4DcWWR9garpNLwDWVrdu1lOg5112p
   NA3yhK8KCu6H2uZUQ1i1yYB08Zd6cpaonp7O9ec4PqQ32rJCTSHfmnNAD
   s9LlB3A2iAAddjXaIlEYXwqprQZTuUyA8jod4BwPUR46+8QPPvvdMJVvL
   Khwr8PkcD3KrfsmCT7zIPMymFtHZ99qKjz7ZRPfbgakVL55gemo0HvESx
   fkLoc9d9Thv3obNo0i0vE6LhSbeFsjDgwx4NrXWGJrSsBUXeEoSYdMBmD
   w==;
X-CSE-ConnectionGUID: bMS4REeyQdSXt3zo+UXcsA==
X-CSE-MsgGUID: Mdp6z73ZS92/HnaTt36oZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4696968"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4696968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 15:22:56 -0800
X-CSE-ConnectionGUID: 2dvt84HPQ7aypn2qK8OvUQ==
X-CSE-MsgGUID: whcqjmnURqWvURfoQ99ogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12802359"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2026 15:22:54 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX5HI-000000000Oo-1gHL;
	Fri, 27 Nov 2026 23:22:52 +0000
Date: Sat, 28 Nov 2026 00:22:10 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 33/50] warning: unresolved link to
 `remove`
Message-ID: <20261128001315.Ntu6sjd8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fc24f7e1a3f10a336872c79b3772930633b0205c
commit: e0389d8143ac428f39e28a26585e7df189f2ecd4 [33/50] rust: alloc: kvec: WIP(?): Add swap_remove() for AOP series
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261128/20261128001315.Ntu6sjd8-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128001315.Ntu6sjd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128001315.Ntu6sjd8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `remove`
   --> rust/kernel/alloc/kvec.rs:861:58
   |
   861 |     /// If you need to preserve the element order, use [`remove`] instead.
   |                                                          ^^^^^^ no item named `remove` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
