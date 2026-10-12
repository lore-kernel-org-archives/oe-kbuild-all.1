Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1A34CB8C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829341; cv=none; b=KKHGvBxUOUFis4hKaj7mpU2pq3owRsFchzZntaTImlc0gaAEatNTGYrJId55wQPONuYxO7/3bvmWXYxllKMMsJfMFklAyyUlvapy+pfrLZ/Zo53KHD//Wm0FPWXxuksGJ2QTmRZF8fDG6VFewaKu4lI90pggS9v3ojyiFI1PYBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829341; c=relaxed/simple;
	bh=4SKjZMisrpN1QVQDO3FeDiBf3ymNKHgf6sA8KFbeRPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C9o1hI1hsjGnhVXhqrziSAzwXfQwFJN5cm5PTv1A1sWIJH7HzS2F7avKRLMOgSU5h7YLc7SIvipgdAk672Xwd/rOkrVtrRRdsAEcJ3VwPuuPHWWKlcCyG6z3YiIXakdv+MuQcaPCjkUp2023koAndKbK+fwctyai9vKbsRY9aiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHd6OGk+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHd6OGk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791829339; x=1823365339;
  h=date:from:to:cc:subject:message-id;
  bh=4SKjZMisrpN1QVQDO3FeDiBf3ymNKHgf6sA8KFbeRPU=;
  b=LHd6OGk+7aQWm3QF+ZPh7cqmQVR+uvELvxMjsmySJGvHkJL8FRAUiWhj
   feH6+7o+a/cLoAxFrZQOCIWTqRXltQUAWJDTN3w1nSPol69WM9rC0t8NE
   Gdo/74jJEuFhxLZe1dtI0DWjaaB4ltttsPF2G5eKuSHVvHrBRPm+xOnYp
   omFBPOV9mbpki1u9cftUkYNSXGhVVDY0jHIaoqT7MPkbUXy7gXgjLstu1
   +M83XHNv7yfLURREneADl93voTkvRKghxmTy2syNb/uYX7+EhZdrB6a59
   QWZWGJ/YvFli6NcCxjTWDQa7z3nr/UJHcyUJlcepf/OgpmZMccCdRqk07
   A==;
X-CSE-ConnectionGUID: 2iAXvpBkQ32sbijfeZWtjA==
X-CSE-MsgGUID: xtu/r+vdSWSi96VAhub4dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="548609"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="548609"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 11:22:08 -0700
X-CSE-ConnectionGUID: n0CQhuStRgOJUW73yUVtSA==
X-CSE-MsgGUID: zoufylKlSSageVXW3xslvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="880475"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 12 Oct 2026 11:22:06 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGKey-00000000A99-24Dv;
	Mon, 12 Oct 2026 18:22:04 +0000
Date: Mon, 12 Oct 2026 20:21:50 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 46/88] warning: name `DIRECTORY`
 contains a capitalized acronym
Message-ID: <202610122028.ZnzKhMwo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   fd6a83d0d7b4aba0032f93ea9c03613a0ba09a19
commit: 8f699de6c6c2320755edc96e8f2cd1675a6665bf [46/88] rust: net: Add namespace references and typed per-namespace state
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261012/202610122028.ZnzKhMwo-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122028.ZnzKhMwo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610122028.ZnzKhMwo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: name `DIRECTORY` contains a capitalized acronym
   --> rust/kernel/net/namespace/registration.rs:68:27
   |
   68 |     unsafe(uninit) static DIRECTORY: Mutex<Option<Pin<KBox<Directory>>>> = None;
   |                           ^^^^^^^^^ help: consider making the acronym lowercase, except the initial letter: `Directory`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#upper_case_acronyms
   = note: `-W clippy::upper-case-acronyms` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::upper_case_acronyms)]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
