Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5931352D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772394840; cv=none; b=RxPVu0bGWkSkXuTe72c1oIT/XMGw3SJrQq9LBIbqTnlXblwHIwtu/sY+dR5nnudPyw0OouFXEioIwZsCflJ/Aw0BxRaC2z/2zINVxGSTNzlSsEX+TxrKii/OmPnPoZR8503Jw8k5xJHvPnXhjnM8hIOMHIPzGg7DpWandx/elw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772394840; c=relaxed/simple;
	bh=iqZnEZLiz9Unh5Iqzd3A+FDxfjgtILHu9j7ftFnWuzE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c9lndC9F/W0q04ulU3WkdIuW7VsiuLSaCwM4P66qoxqtVIa+LDlpV0bpOqt5hYUH0V/n4nniW+2P+uEnOT/hu/MxmsJtGg6TB+v8GGP9pxQadLLfl3UXw9/ds1vIkMVEXLG8Pa3HJaiNT5E4qQwsM3E9X0VxPEj2LGhoCs1UXtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8Zp4Zka; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8Zp4Zka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772394838; x=1803930838;
  h=date:from:to:cc:subject:message-id;
  bh=iqZnEZLiz9Unh5Iqzd3A+FDxfjgtILHu9j7ftFnWuzE=;
  b=Z8Zp4ZkaPnlLuBp3aRa7M1IxBX+mfUUbouTHGsgLJ4MDT0bIpCNZZ2cu
   cNAo2ph9uJ6xY5fpAgSXnRgJnWf4O77fuG5VNg6jAAXNEeaT4jZuRJLUz
   FZgHuvFiPfuyXpuat2ar5VTQQKdUJbOdb9QENwtujpklEFaN6uXShppv7
   4GviGuMWza9q2BTj3ZDKY5W1IKNz10KIPfbqlCfvyMLCUb9aFrMfBr8f8
   pZF35KgJEansWn8Rm7bru4KpHYy0qoWBR09fPYc+pvVBvcV1IePOlCtjD
   ffydUzoCh4SwywD/zaFDkwcHDmT7GfUi5VWfW0Siu26U4ezvSndL8P+Mp
   A==;
X-CSE-ConnectionGUID: 7N9v9GQ0RQiS7m/YSqsdug==
X-CSE-MsgGUID: WgA1zIiATla5i2F8HSPUvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="60981890"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="60981890"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 11:53:58 -0800
X-CSE-ConnectionGUID: CfY3mZ0RT3OGvFnOLLwkog==
X-CSE-MsgGUID: 6KazRviaRem46JTtxlYffg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="220554673"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 01 Mar 2026 11:53:56 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwmrS-0000000012z-1tFl;
	Sun, 01 Mar 2026 19:53:54 +0000
Date: Sun, 01 Mar 2026 20:53:13 +0100
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 33/57] warning: empty line after
 doc comment
Message-ID: <202603012043.SdnM2nvY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   01c00561a643db1264ba75e8b464a87ec2db6126
commit: 2f81b76e1f5012427112e3a13b5dd44ef6079e84 [33/57] rust: Add Ownable/Owned types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260301/202603012043.SdnM2nvY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603012043.SdnM2nvY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603012043.SdnM2nvY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: empty line after doc comment
   --> rust/kernel/types.rs:452:1
   |
   452 | / /// into a &mut T.
   453 | |
   | |_^
   ...
   458 |   pub unsafe trait OwnableMut: Ownable {}
   |   --------------------------- the comment documents this trait
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_line_after_doc_comments
   = note: `-W clippy::empty-line-after-doc-comments` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::empty_line_after_doc_comments)]`
   = help: if the empty line is unintentional, remove it
   help: if the documentation should include the empty line include it in the comment
   |
   453 | ///
   |
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:447:53
   |
   447 | /// A subtrait of Ownable that asserts that an Owned<T> Rust reference is not only unique
   |                                                     ^^^
   |
   = note: `#[warn(rustdoc::invalid_html_tags)]` on by default
   help: try marking as source code
   |
   447 | /// A subtrait of Ownable that asserts that an `Owned<T>` Rust reference is not only unique
   |                                                +        +
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:451:71
   |
   451 | /// When this type is implemented for an Ownable type, it allows Owned<T> to be dereferenced
   |                                                                       ^^^
   |
   help: try marking as source code
   |
   451 | /// When this type is implemented for an Ownable type, it allows `Owned<T>` to be dereferenced
   |                                                                  +        +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
