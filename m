Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAAF2AD2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 04:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776401270; cv=none; b=iNRSRQC+E7DUWPMWMgSd1SuguyAhqCsOVIPELlTN2fTizyOGAk8XsMzaU3Ug5zLyzqIUiVxTkVFaT5NnCCzyUURZIx5F5G12GHkJwdkT+ci7Sk7VBk4pD6ObpeW5y/8PClSwm/SsxLyqatC1SrlYOZBvkSKFXVKqB+r0BkjrWco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776401270; c=relaxed/simple;
	bh=hFm/9BgwWdrNibVnssx/I44mGmqY14qgdr76dzE2X00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kZ8ho4xb2VmnKiMNfSZQQLeN1NixKlNc33Dzaj6lN3YR6e1GvP+AmX28Fo6NEv8bDO5ONr4KHMnn7MpdMBfkdLeFAzVlQD7Bh0eXccNqfrDV2DsoBKYs9vWwAHxQxAZyPpzGG29Z47yVr0R2bxE1SNYXWhJB2Imye9qNkGvrVDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWEmHnEn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWEmHnEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776401270; x=1807937270;
  h=date:from:to:cc:subject:message-id;
  bh=hFm/9BgwWdrNibVnssx/I44mGmqY14qgdr76dzE2X00=;
  b=QWEmHnEn778g9Cy6IcG33LkCAYICZsp0twy/C3DIF/afr5610SpXspEd
   E2S/RbfMj39hzEtxILtmN2fWuLH3T6pRYbU9yWgPqMepEAzbC//0uNoyk
   IrbRs3Gd6w/hzBSo4sJ//ZpkiRoGp3Zx47dMn+y8aC1IXQk+tcpoQaMVG
   vVRtiCzjGh2viwvAmnk1qhnp/csgGTn5dlbZCFylruzToK5d0zkqXF+Cr
   Sp7jJPnGhpQND+Uptd9K7DuG+GUR5Al6Vba0VqDaashOvK8NpCkLPdP3y
   xz93ImMz6eiA18kFpgIKwRc1aHMZZlaXikZUigfQqZr9jaeTywksCO+4z
   Q==;
X-CSE-ConnectionGUID: iM8Mu6W9T5eccsQhSkKg2Q==
X-CSE-MsgGUID: D4aRXOk4QTiK8l+BYhiyXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81283851"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="81283851"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 21:47:49 -0700
X-CSE-ConnectionGUID: anifTrxxSpObhDvJMrCDQw==
X-CSE-MsgGUID: mcIj87EmQ52roTUbqUcYEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="261335809"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 16 Apr 2026 21:47:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDb7J-000000001EL-1xOU;
	Fri, 17 Apr 2026 04:47:45 +0000
Date: Fri, 17 Apr 2026 06:46:53 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 17/69] warning: reference as raw
 pointer
Message-ID: <202604170632.iwdT7LRU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   234b16b06a9869c5885af57b2853412e854c1216
commit: 59f3ec049634f1b22d7d6078e833fb5f21a71c84 [17/69] rust: alloc: vec: Import .drain() / Drain from rust library
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260417/202604170632.iwdT7LRU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170632.iwdT7LRU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170632.iwdT7LRU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: reference as raw pointer
   --> rust/kernel/alloc/kvec/drain.rs:90:43
   |
   90 |             .map(|elt| unsafe { ptr::read(elt as *const _) })
   |                                           ^^^^^^^^^^^^^^^ help: try: `core::ptr::from_ref(elt)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr
   = note: requested on the command line with `-W clippy::ref-as-ptr`
--
>> warning: reference as raw pointer
   --> rust/kernel/alloc/kvec/drain.rs:104:43
   |
   104 |             .map(|elt| unsafe { ptr::read(elt as *const _) })
   |                                           ^^^^^^^^^^^^^^^ help: try: `core::ptr::from_ref(elt)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr
--
>> warning: unresolved link to `mem::forget`
   --> rust/kernel/alloc/kvec.rs:768:11
   |
   768 |     /// [`mem::forget`], for example), the vector may have lost and leaked
   |           ^^^^^^^^^^^ no item named `mem` in scope
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
