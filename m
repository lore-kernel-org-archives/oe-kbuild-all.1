Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF4330666
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 21:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780089223; cv=none; b=tfxBOVmoCmwJhbg1ZWI5NwYOghjes2bIIZEeRrMLO+kCybn+moLDgKiW/kjN/adbo7D3nfYxAhYOBZR+ZqVT1L4HewDKwVGSpbwPV6fMeDJNutNTCFMu0S9gCPy3cRbdWtsVqeLf/zja7xpWVPOsAR5U9/N3E5U1UUSpZhp0kGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780089223; c=relaxed/simple;
	bh=CuJ1rgfaltO/03yAQFox8nr6NdC3ldVKhGYeNc9gh4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uM7djmacvTOeFlSpr3WIvbLkzu8nBc3DSrL5LFhGyAFEPAHFRykGHPMTPGf18/kqZ0FfVZ/Yhw8wHu3OUCARwapMwVxIdawkO68YHvL6Sw5vsEbu6gfyzRH/3GQSiIRamHJSa5OnnJVFrvThVH8jy7Q1Mnlc42D+LbWSwNFcNmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fukFFpZy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fukFFpZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780089222; x=1811625222;
  h=date:from:to:cc:subject:message-id;
  bh=CuJ1rgfaltO/03yAQFox8nr6NdC3ldVKhGYeNc9gh4A=;
  b=fukFFpZyBmy0QaAfzQGU6Yph4UmEnRKtCd5QYRQJsp6NFTLERcn/4MF8
   j1plAjAdAb3jP2Ruwuu3sZx7+JBSHWIwa8MOUEq5Pq4cRc2XGXn6qCCHh
   zvKxX1+1C6/UvQPVnQIobuIk4h+fup56g8SgBW+L787FEHB3W7sV4Gq/H
   bupj4nBU1gFitKXBMm0FcCjwsECAtB6LyJtC0eM+yNi4rJHAH3lYinVcZ
   oEgj6s/AlSzWCzn7JeVnRCv5utFedn8+wUDEcSxOb8ey9/uTOv3AN9YKK
   ex+R7L75cZsmmaVxA3pjUR+5lx33AJ5UgUJ/lvvU3QDS369VKwFoae7Ho
   g==;
X-CSE-ConnectionGUID: t+j4Dxy3Sl+H36fe9BFSsA==
X-CSE-MsgGUID: 84dx11zvQNKzCIummO2Czw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="79980987"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="79980987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 14:13:41 -0700
X-CSE-ConnectionGUID: 3wV9Ehc2S4enf8S7VvcLGg==
X-CSE-MsgGUID: F3A4RmymRO6x+868m15hKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247887367"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2026 14:13:39 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT4WP-000000000wP-0795;
	Fri, 29 May 2026 21:13:37 +0000
Date: Fri, 29 May 2026 23:13:20 +0200
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tamird:b4/fileops-unsound-redesign 3/3] warning: consider
 removing unnecessary double parentheses
Message-ID: <202605292317.Eg5yFGGi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tamird/linux b4/fileops-unsound-redesign
head:   915dcce74f0c8e8b9943bb1f6429c273d922d998
commit: 915dcce74f0c8e8b9943bb1f6429c273d922d998 [3/3] rust: debugfs: retain callback references
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260529/202605292317.Eg5yFGGi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605292317.Eg5yFGGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605292317.Eg5yFGGi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: consider removing unnecessary double parentheses
   --> rust/kernel/debugfs/file_ops.rs:235:26
   |
   235 |     seq_print!(seq_file, "{}", (CallbackWriter::<D, C> { data, callback }));
   |                          ^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#double_parens
   = note: `-W clippy::double-parens` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::double_parens)]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
