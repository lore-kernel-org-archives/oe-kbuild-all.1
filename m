Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629173191CF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 20:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766347637; cv=none; b=iUQTamh51TRZ98IN1xLPYj1cCNn6KUiId+KKG728NS3ejgPPWmHIwcpWSA82XvwriEOCWxluy5W8txAMUgQnEXBJy7RlqYUMWk/7AzPvqk5rUYIy4lpSq1xJyADupgXIxQSKmCaPkeJLdmo2+8peByCVN3Hu8y1U5u5PlFOSAuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766347637; c=relaxed/simple;
	bh=c9ph3MYRAwX4fNG6pFn1m30oluXcKWKOYPfgqHCKbpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oEGaDYxTLnANfzkzzFdvntUTF1Mdhryi2wcCslYEwQVZOg30GkDGPRCVR+lHAO6CfC4cTsQAdbG5Gkutz1YmhlUvN5BqfIlVI8AGhArz1GSo74LUQxNZ8q8Ks6MV6Nx/y5YAC3PopJwcbo2iXC/IgvJex+3JnKthQvFl+uPakSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOKgDB9z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOKgDB9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766347632; x=1797883632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9ph3MYRAwX4fNG6pFn1m30oluXcKWKOYPfgqHCKbpo=;
  b=LOKgDB9z+XPivxldGiUhF2KKwEK+MM9WZSo6wqbsQlOv7RdSn1ISs/HE
   vtfQZkORZNrF1UjEteZQXlNkzxEq8ISVSW0P9voDKe7QzkFz9wmPm+vm6
   kEKuXQagCKSxAxCJPW7lcSXjlQEE7FdAvFhG0FQBAPOMFr5CYFKiECDAv
   4RUS+IOojCg5GFkJfk4a7S0D8kHTvMdzhLs5Bs7cN72/yVxQpUMlVLv2y
   6rZ6/rINQ5NmJ2NBW6HSWDUrMsimD4a0JvP+pettFMqy7JZgWhO4SGRgk
   O6JFk5f2dREp8/SkmSZENSLY+p/Lh5fuR10/AbW7PNmFIuAzji75BJSZZ
   Q==;
X-CSE-ConnectionGUID: vca+AWX7Qmq9kRW2tJIFcw==
X-CSE-MsgGUID: 7IPDpGxWSFKq4Kvz7JoL0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85633517"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="85633517"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 12:07:08 -0800
X-CSE-ConnectionGUID: JlhuIAq9TVWfywkPC8emdA==
X-CSE-MsgGUID: k52UXpXoR++JEISfM60N3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="198511560"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 12:07:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXPhp-000000005Dq-0maI;
	Sun, 21 Dec 2025 20:07:05 +0000
Date: Sun, 21 Dec 2025 21:06:20 +0100
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 38/62] warning: empty line after doc comment
Message-ID: <202512212150.fY93oEg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e08116e258e28774a3770a80debc819b89928f45
commit: 89b7fc1864e25fcd2b9579039273c4f01c930018 [38/62] rust: Add Ownable/Owned types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512212150.fY93oEg0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212150.fY93oEg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212150.fY93oEg0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: empty line after doc comment
   --> rust/kernel/types.rs:453:1
   |
   453 | / /// into a &mut T.
   454 | |
   | |_^
   ...
   459 |   pub unsafe trait OwnableMut: Ownable {}
   |   --------------------------- the comment documents this trait
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_line_after_doc_comments
   = note: `-W clippy::empty-line-after-doc-comments` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::empty_line_after_doc_comments)]`
   = help: if the empty line is unintentional, remove it
   help: if the documentation should include the empty line include it in the comment
   |
   454 | ///
   |
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:448:53
   |
   448 | /// A subtrait of Ownable that asserts that an Owned<T> Rust reference is not only unique
   |                                                     ^^^
   |
   = note: `#[warn(rustdoc::invalid_html_tags)]` on by default
   help: try marking as source code
   |
   448 | /// A subtrait of Ownable that asserts that an `Owned<T>` Rust reference is not only unique
   |                                                +        +
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:452:71
   |
   452 | /// When this type is implemented for an Ownable type, it allows Owned<T> to be dereferenced
   |                                                                       ^^^
   |
   help: try marking as source code
   |
   452 | /// When this type is implemented for an Ownable type, it allows `Owned<T>` to be dereferenced
   |                                                                  +        +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
