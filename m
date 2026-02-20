Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128B19D093
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771625997; cv=none; b=fcWaTzygV0iAMOgXhOXX7nsWDunmAf2HZdNB3axO1BYlb16y29i3WgafuHVNmzHbswpc8Ikw3QFWU9meLKMirf+drKDr7ShpDvsaKzO9ElAus+XyEIL1aGxZpGTCoVv+mqFK7PxWgawRvJq5UmPJzwZ4EwluNezwa3HvTYXmiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771625997; c=relaxed/simple;
	bh=07XmAdqni7l3acznTklPjiQx/MExTVKq3OGfcZ5o8w8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O9Ue265Ll5AWf9onYbL/7XstZ+UEPo91M+lIkCIY5yiOYaGJUVgJ6UWUDoNM9yDGEaf6WaLKs2ppWie9+LiPgGay/60LW4UjykfgB0zk+wmXSH2Zd41EFZUn3DUXQCgh3R5GK3J1/S6G8GuA5UcjT5vdaChTpzVmE+LojHUsvN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5yNOLi7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5yNOLi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771625996; x=1803161996;
  h=date:from:to:cc:subject:message-id;
  bh=07XmAdqni7l3acznTklPjiQx/MExTVKq3OGfcZ5o8w8=;
  b=B5yNOLi7yqkLR2jENb98bIZ+E2Av6l+6wneMQk/IhqgC3twaMmJQjKQG
   tzLSb90O9tQ7gQxXdTvDy2XOVpY6yA6noZhuK2y6ZC847wuxpW9R9NFFr
   nfo7asO95uEoH+zgv8WcV6GsE1AjiviegQszMWsHtyxMktp39jqGdGte9
   kA8ugh+rA7pTrp8lJUPOwuFMjKWtK+49cx6+I10q4+pQvyxXY7J2epFmw
   bgP1TF1nPao0obQm6ZtRK3RYw84Ly49Mavw/HwRHuN43HxS3pGvC+0v15
   PhdQNU6RCmn9PrByo2KMakVCSdI4NJoe6RUk/sE+Z2jANXEM98RQAiDmp
   A==;
X-CSE-ConnectionGUID: PVloMrqVRTC/uRUkuF+BzA==
X-CSE-MsgGUID: +vG5F7srSne/cqq0rlXbuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84082577"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84082577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 14:19:55 -0800
X-CSE-ConnectionGUID: bi18DKnMQUiHl6AL2+1J1A==
X-CSE-MsgGUID: DWCuRD+ARzyeslSn0gSY2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213492224"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2026 14:19:53 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtYql-000000004HF-3gpr;
	Fri, 20 Feb 2026 22:19:51 +0000
Date: Fri, 20 Feb 2026 23:19:47 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 6/30] warning: statement has unnecessary
 safety comment
Message-ID: <202602202317.wvJVVuJa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   6f9c850319b2c8b3d892af80fb22e8e233fdca14
commit: b480bb24363fb2c9afd498f07e49035f047ec9d9 [6/30] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260220/202602202317.wvJVVuJa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602202317.wvJVVuJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602202317.wvJVVuJa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: statement has unnecessary safety comment
   --> rust/kernel/gpu/buddy.rs:433:9
   |
   433 | /         let clist = clist_create!(unsafe {
   434 | |             self.list.as_raw(),
   435 | |             Block,
   436 | |             bindings::gpu_buddy_block,
   437 | |             __bindgen_anon_1.link
   438 | |         });
   | |___________^
   |
   help: consider removing the safety comment
   --> rust/kernel/gpu/buddy.rs:432:9
   |
   432 |         // SAFETY: list contains gpu_buddy_block items linked via __bindgen_anon_1.link.
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_comment
   = note: requested on the command line with `-W clippy::unnecessary-safety-comment`
--
>> warning: this macro expands metavariables in an unsafe block
   --> rust/kernel/ffi/clist.rs:336:9
   |
   336 |         unsafe { $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($head) }
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this allows the user of the macro to write unsafe code outside of an unsafe block
   = help: consider expanding any metavariables outside of this block, e.g. by storing them in a variable
   = help: ... or also expand referenced metavariables in a safe context to require an unsafe block at callsite
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#macro_metavars_in_unsafe
   = note: `-W clippy::macro-metavars-in-unsafe` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::macro_metavars_in_unsafe)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
