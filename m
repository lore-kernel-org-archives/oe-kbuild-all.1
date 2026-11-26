Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734270;
	b=ZCVQRkTmrdO/6yIA9N4yYJpuKAf+7d3J13tRgXzT/EwEjbYRgOMfNsrPmvt85aj4yGaq
	 azZ4Y9s4tLTsHu7gRXTgydlkBgi4Yzpgl4MZ4iIDcHlavKFU2GbYAXXtps5P/eJreHYsa
	 k0Iaz8bKOvPweoPJ7nz22RSv7bLgiqDgMLvBbbVJpnPHMBZDgCklev9LGVDcIig7AYwRX
	 OFSxdEUk5/gz5NpbC9tTztkgZj+mpOG9lp2sXwJ9yegJwBZq5Qfr4eSStDZuFaOKkC8UK
	 uVe0MEjbqTY0gddLCvNa4wQDPKiJunGBrHi/QH7EwMelQio4XEcYFR5DZFkqC6SC2ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734270;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jtGN2zpjey8a5pAwsaElU+4v0F4WnqXa9JYC6RQhZXs=;
	b=VTeVgRVPf/NEGJRBqM15jUhO7n9+XgbkqV6qotvrXLWhwD0iPoBj7SsISkLvggR47c3+
	 w7XbH+s7IvL+Vl7R4ywN+ZtbWAS8fePyuz9uRKm7GbQH+B5SUiamdC3hTp7U3gcL4554j
	 Xx6h0sWH1AVfU/RraIqe2+moZXu2VsV0RPRcLQyyc/KivMsMp637uSFo9fl+fL1YyCZzT
	 2v64ZL9CTdQ3+8MZW3GlqOPa0absNqKz5WPc7NNZBIoEU3TyjXvKIDVO7N5Oq8iwCo4G7
	 sKP642wLblFMxPkKfld+mQ/Zk/jWGQQe4fK+jSeAx/4h0HGLrtpGZq3oBZR8JszESxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iQfNBodh;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692BD606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 23:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iQfNBodh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795734270; x=1827270270;
  h=date:from:to:cc:subject:message-id;
  bh=pU8+X4hOw+8L9049Ykzu2R6g5CPK/NTLnVbIP/hvzdk=;
  b=iQfNBodhCoaOzqy5ApbieY6laZv+h4DyvHp+qLUd40xN16QYO1u3ocyo
   whFxcFHITpAP23cqHsKHX52UMpJWJ2u595LuhQdDkjiySkXjKqUESBHgA
   teGJxdatTwKj8HJdTf8y34HEYMwTE8+yeyLhL3n8DOo5F94Q76h0wmjhJ
   Ptd9u08pV2mJAXBmGKcEKi170YId+Ceh4JFIUKW+JCOif2oQsItx5x2e5
   ulzWF+H1zz1SlxAjSxBTwZWxzPeB7v/Jcl+7inEuDGp63lrgu6vQKawAA
   M3QI12StYIJ5aEGdwxWV57+EZJyTTXE4qi76ioSC6oqXyeWMkxj0RKvIh
   g==;
X-CSE-ConnectionGUID: gh/HJWGDRV+gKvu5NwNYeQ==
X-CSE-MsgGUID: jinPXT+8SFecksqTYdAhmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4653653"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4653653"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 15:04:29 -0800
X-CSE-ConnectionGUID: JN/SLaV+Rw2h3dXmJ5UTSA==
X-CSE-MsgGUID: N9trTUqXSICts/Y2drtMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12770248"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 15:04:24 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWiVq-000000000Du-0a2q;
	Thu, 26 Nov 2026 23:04:22 +0000
Date: Fri, 27 Nov 2026 00:03:40 +0100
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 21/50] warning: empty line after
 doc comment
Message-ID: <20261126235410.RN1d16i0-lkp@intel.com>
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
commit: ecb2e1ae46a0322942a626e9a773ec26aaa11b93 [21/50] rust: Add Ownable/Owned types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261126/20261126235410.RN1d16i0-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126235410.RN1d16i0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126235410.RN1d16i0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: empty line after doc comment
   --> rust/kernel/types.rs:461:1
   |
   461 | / /// into a &mut T.
   462 | |
   | |_^
   ...
   467 |   pub unsafe trait OwnableMut: Ownable {}
   |   --------------------------- the comment documents this trait
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#empty_line_after_doc_comments
   = note: `-W clippy::empty-line-after-doc-comments` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::empty_line_after_doc_comments)]`
   = help: if the empty line is unintentional, remove it
   help: if the documentation should include the empty line include it in the comment
   |
   462 | ///
   |
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:456:53
   |
   456 | /// A subtrait of Ownable that asserts that an Owned<T> Rust reference is not only unique
   |                                                     ^^^
   |
   = note: `#[warn(rustdoc::invalid_html_tags)]` on by default
   help: try marking as source code
   |
   456 | /// A subtrait of Ownable that asserts that an `Owned<T>` Rust reference is not only unique
   |                                                +        +
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:460:71
   |
   460 | /// When this type is implemented for an Ownable type, it allows Owned<T> to be dereferenced
   |                                                                       ^^^
   |
   help: try marking as source code
   |
   460 | /// When this type is implemented for an Ownable type, it allows `Owned<T>` to be dereferenced
   |                                                                  +        +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
