Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7BE2F34
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 04:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726200397; cv=none; b=uTft9OdHfbeoCmm3etD9Y5/eaw6YioAcWcHrZ8dcE3yBWGcIKiakUeWa+ybu4sbN2Cbti/a+YsSuJ1rU/6yHEiL72AxAxYfyb3/GQHWwTF1B5wUEsfr+jc+Nq4HtuTr9olWawBuoYacsMMFI4F4u3utmOAIDP2Hti6AU+KW2jcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726200397; c=relaxed/simple;
	bh=b/YjKn/ZppvAk8mAJHnSHoA2ecSizwpUfM20iMUM2Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=odejCLlVWTA2YAhaTVGoOaCsPlclZC4qgLtZGVnwnHCCHT2alMULKihKgrAeJUjQPhJ1hdEITYvoVZPJO7iygCtGw/vSH3QdtQcUOMp+BXDAbdY/vlHjYd06kb0EinJikX79S2PdbGkPfpkgWwQ/HwukSg3uiQLhIaUCfJAYJ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGxhXg1w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGxhXg1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726200395; x=1757736395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/YjKn/ZppvAk8mAJHnSHoA2ecSizwpUfM20iMUM2Ms=;
  b=cGxhXg1w+5VLKO1W4hbPEuzr2FxPLgiYuLY7461HE6hj5skk5LuwW5Fq
   L7dli3zG9FdWdYwQ37z9GjYZ8Ogh5K1gwls/x29ol2aAf/aYV7R/FEZoi
   RJ5EMSYWCd8vj60H0T/TQCALC33tV5dT6YNhL8lOw94IZ0EJPZiQEjGHO
   ohmroIpG3+BNCKIkAsGEVAwCVig4Tc5Gj9qjc4w/M59fRDCUDyq69KgU/
   MFN0PSfBnT21FiABeW79HIGQsbgXyiQ7UDzHY9KudUMVDNgFmYRZqS7aT
   QmQl7f1pJ4r+1ypXztFsFtxPDsTL6Y/ObKJHUJKHyJpt5Q+F5RXV0QqDk
   w==;
X-CSE-ConnectionGUID: 2tBT36p1TemIYJZH2wxhjA==
X-CSE-MsgGUID: mlWFFEN/SGSxGo7mJt6Eag==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28983559"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="28983559"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 21:06:34 -0700
X-CSE-ConnectionGUID: o03+JXgbQoOCCvegFSwFGw==
X-CSE-MsgGUID: b7sPALvsRh+XwdBVpooUlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="72526091"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Sep 2024 21:06:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soxZm-0005zO-2i;
	Fri, 13 Sep 2024 04:06:30 +0000
Date: Fri, 13 Sep 2024 12:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi-wip 2911/2963] warning: unsafe impl missing a
 safety comment
Message-ID: <202409131228.jh1ulc6M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   3e835461bf36824d84f098a1c534320be0c45d35
commit: 4a1480ff331fced95b4e6e792aa2e8b45bff4bd5 [2911/2963] rust: Enable clippy::undocumented_unsafe_blocks lint
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240913/202409131228.jh1ulc6M-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131228.jh1ulc6M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131228.jh1ulc6M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:435:1
   |
   435 | unsafe impl FromBytes for u16 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
   note: the lint level is defined here
   --> rust/kernel/lib.rs:25:9
   |
   25  | #![warn(clippy::undocumented_unsafe_blocks)]
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:447:1
   |
   447 | unsafe impl<T: FromBytes, const N: usize> FromBytes for [T; N] {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:468:1
   |
   468 | unsafe impl AsBytes for u16 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:469:1
   |
   469 | unsafe impl AsBytes for u32 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:470:1
   |
   470 | unsafe impl AsBytes for u64 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:471:1
   |
   471 | unsafe impl AsBytes for usize {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:472:1
   |
   472 | unsafe impl AsBytes for i8 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:473:1
   |
   473 | unsafe impl AsBytes for i16 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:474:1
   |
   474 | unsafe impl AsBytes for i32 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:475:1
   |
   475 | unsafe impl AsBytes for i64 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:476:1
   |
   476 | unsafe impl AsBytes for isize {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
