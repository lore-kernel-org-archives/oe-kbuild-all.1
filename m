Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB923019C8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 03:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790911389; cv=none; b=F8jmo/B7hg/dc/5mQccMB6mI+vu/D04pM6ZdOhwVf4oy1xqKq9OQWXLRA/xFQB42ilcN6c2fTvf1hiATZKnJ7hjG4UGc0KPJ5o5S2T9EOZ8NRsh11cnXSRlgAD6WjJ8/qbiUjee41uDKLsUwGwrADDBRCYa32OWaTBVodHTg8HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790911389; c=relaxed/simple;
	bh=unHI28LBH6c0d752hJL4tCI1Jqii2neo3V5Qsw4DZ5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ldxNM5/jPEFcuiKr4uatoGBfbw2XtElmBlyIqC/ktRSDcjBRBpTM8nqYVEnfaiVFLfqK+kEIUQhZEzyGjV9yd2L9JTPaxziX6Cy9ea5gisRYbnDlqdIqVSviMH08ir564kdY4Chdjsf+krD13+N5OXrPJfdfFAOVt7Gw4jab5K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaRhLKlB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaRhLKlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790911388; x=1822447388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=unHI28LBH6c0d752hJL4tCI1Jqii2neo3V5Qsw4DZ5s=;
  b=LaRhLKlBXC1YZU8/YXE/46oIu9yV4nMuGzoXp+3FYrdnY6K1TM4hcVCE
   4UXVnyhaTiOaomuWOfVRE/+5+6/pjF7yy3Uz7dpw0agHrF1ms7LGUKWZx
   0BiWQMlo+XgFEBc36pFr+h6rOGo0wYfP97y5EXv/EpYyv4gqryh617yY5
   cMbgN3kqjydAu42C2D24WCAtRIsZQuQgriqb0hGl6dtNTspL9FbwLANJM
   vUOV1WdYzos8+mOwmwavfh56ax63amZCoP6NwpsPGDIIZgcOik+0GGozp
   JjHqUpA0bnMt4wBU2DpjDEcxOo/Ik3D6gNiW1xYKUEdJ0aL2M4P9kG9rR
   g==;
X-CSE-ConnectionGUID: XUtPBYSFQK2Q0pMzGa2TpQ==
X-CSE-MsgGUID: cxYi6YAdQkWSJ7A40nKzoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108059924"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="108059924"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 20:23:07 -0700
X-CSE-ConnectionGUID: cTbfwcJ9Rt6OxS8p98yW1g==
X-CSE-MsgGUID: X0+eo/4nQyqx5rqChKSVCw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 01 Oct 2026 20:23:05 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCTrT-000000000NF-2W3O;
	Fri, 02 Oct 2026 03:23:03 +0000
Date: Fri, 02 Oct 2026 05:22:32 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-dyndbg 11/15] warning: `crate`
 references the macro call's crate
Message-ID: <202610020547.RTfC2mwy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-dyndbg
head:   e0f643bcb55eadaa7c1b9d23ea0569cf7b5377a8
commit: 6f06d688d993e1dea280bf2a7cbc4486b9764cac [11/15] rust: add support for dynamic debug
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261002/202610020547.RTfC2mwy-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020547.RTfC2mwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020547.RTfC2mwy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: `crate` references the macro call's crate
   --> rust/kernel/dynamic_debug.rs:172:13
   |
   172 |             crate::__LOG_PREFIX,
   |             ^^^^^ help: to reference the macro definition's crate, use: `$crate`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#crate_in_macro_def
   = note: `-W clippy::crate-in-macro-def` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::crate_in_macro_def)]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
