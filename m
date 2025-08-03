Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590F92E36E7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 23:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754262984; cv=none; b=ZitI/GjF1zg+doX0KXnHR16ZRkZWpjzcebvPheXn0CcIRDxohfazrCT+qMqy07KfYV5CrGuRg9UxMOKV8KMXJcikZxFG7lC/bs4k8gHw+qx5a2miM78YmeC+QF/hjrj1PlAa2LNFy346OKLH5W8F+bAOmVHBVVuwvYg0VCm/BeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754262984; c=relaxed/simple;
	bh=dHszQEJ+2IYI0TrStx1U2OK8OxQbkWIRbTxph65qyJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDURANgAsmww4VQH738yHkO254/4tObW+Of4BDXdylpDeymZivcyevCUNB/EopU7stpyAJY/qm3ayOeAfF4webIvncJXtHz/F6Vb0Xx90rG/LtJtD63ccgZoh1IPvY+gSywQLRltJDI7Ewivhr+Ru2rnaNiMkRy3v9y+l2InhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhI+nMyI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhI+nMyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754262982; x=1785798982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dHszQEJ+2IYI0TrStx1U2OK8OxQbkWIRbTxph65qyJY=;
  b=ZhI+nMyIgjYz/2d8P4/3tk5bUwBrCRcu7o8lPsA3PNySQ3jEJlofNG77
   qod8EcH/RLRkmvmVRDGtsKqFJywnk77gAbzZVU+1PBnYuaVpftRyah4k8
   rmWOv80ut2j/00TS8rF+RRjLpB7TVGJYNxuc48XepSVfR8agjejvgVQ6P
   x1VEWp1du/VH3MH7rQ7EN70CDZQvsaPFKuK7Rv0vJhFfluOxfLoBQM7G6
   lX9u8aJR9KRLt8nAOvJMb3R4FYO7PfOqLfM6VEe9QdNRkCw1F2NnBLdmU
   CuqPp11fe80l7YyykHr5ZogEXpBn/J46bUrvKfR+yaOvqBXxUQFVCi1TX
   w==;
X-CSE-ConnectionGUID: HzyGv94USTaB9mBtXjPSgA==
X-CSE-MsgGUID: k59LXzExS2WzfHn0YKywtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56222477"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56222477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 16:16:22 -0700
X-CSE-ConnectionGUID: FWp8X0jxSbCWFC+5Zc2bDA==
X-CSE-MsgGUID: xo0MUlunQbm3Ws3kABA4HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163930023"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 03 Aug 2025 16:16:21 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uihwA-0001h1-1J;
	Sun, 03 Aug 2025 23:16:18 +0000
Date: Mon, 4 Aug 2025 01:15:49 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 57/85] warning: unsafe function's docs are
 missing a `# Safety` section
Message-ID: <202508040129.nVdieUWQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   800be80e4ce2e4872e0d8f2716b2b7c79a0511ef
commit: 48cb1f39146f45634ffc2169015c2b358ab93851 [57/85] rust: of: Add OF node abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250804/202508040129.nVdieUWQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040129.nVdieUWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040129.nVdieUWQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/of.rs:71:5
   |
   71 |     pub(crate) unsafe fn from_raw(raw_node: *mut bindings::device_node) -> Option<Node> {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
   = note: `-W clippy::missing-safety-doc` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::missing_safety_doc)]`
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/of.rs:84:5
   |
   84 |     pub(crate) unsafe fn get_from_raw(raw_node: *mut bindings::device_node) -> Option<Node> {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
