Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A621D3E4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772391122; cv=none; b=E3XMU4wW1pCAtRp0UCBp9e0lQMmxTu8YGNGdIO9FfR87P26smtlT9XVgZZydGQ3+zF+BSAuqyGwIqbXPjWO3ZqSQ7HIO1seqvpW6alfPPyDnIU5GHkaTWRqeiCvmq6OIq+lktYFerL98i6aGxOAweDkZNYmggCt4cfgXH5t7FvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772391122; c=relaxed/simple;
	bh=gGHEId7EgAZkxVyPnm0b3q+1pxaVqUAuvVt9cbALO4I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uP6LvoOE0HQ0SzhClLUyKoFxxPzs17lmt+8dJoxaeUOU7gCFP1mOG5tOeIF+dKsnvfXv5T2BRlthv06fj+fcFmNkBhBbgYGnbYyMPmikVOoaMWjXt+S0tVV4/azJsEGDICKZ/ijhVwjnjbeSB5zuz7sQwZodIz3nVY0hAAsap2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlqtoCyi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlqtoCyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772391118; x=1803927118;
  h=date:from:to:cc:subject:message-id;
  bh=gGHEId7EgAZkxVyPnm0b3q+1pxaVqUAuvVt9cbALO4I=;
  b=nlqtoCyiQb9BFjtcZga1r4+KqyoYBR6Da0TGtLbmzIaL5ZU4vnYOD4AI
   oost0nFHLq3NNDsNYiTO8aS5xlIzrm5Ux/nBVadjdYdU2Dn/59KVOUvcV
   4XM1k6iK4N9SpciyyJETEXaGU4WeVaXJ9Up/qi9Dhe5C9UX2g+nZdIsmd
   2fJAhyl+t8btnhrNREcvksDlU4H2E9cQRIxrDlbWCEAfV+1Q7XVaYoKs+
   Zamk7GEXCqpkH+6bEhiITe1jQYlIJm+SV9JKOizj16Bro1XrWWvjGVeCk
   nHjxb91G4E6BKXk7304ce1XsL4AoU0+8gmWcrcIkDJbLx4FUECqGe4rYY
   A==;
X-CSE-ConnectionGUID: LamekNFrTj62ibdWhqF0aw==
X-CSE-MsgGUID: 0JYG6LlVSzawDD+ztxkTHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="72608946"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="72608946"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 10:51:57 -0800
X-CSE-ConnectionGUID: iC8mzuJ2Q8icSqPbP+v4MQ==
X-CSE-MsgGUID: YwVSP9iTTY6T/WUxJ692zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="255269351"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 01 Mar 2026 10:51:56 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwltS-0000000012j-0wbT;
	Sun, 01 Mar 2026 18:51:54 +0000
Date: Sun, 01 Mar 2026 19:51:28 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 30/57] warning: associated items
 `zeroed` and `as_raw` are never used
Message-ID: <202603011934.CLTsnpb2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   01c00561a643db1264ba75e8b464a87ec2db6126
commit: 0c779dbcbbeaccf8c0ef734565b512942d3ddeb8 [30/57] rust: io: resource: Add owned Resource initialiser
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260301/202603011934.CLTsnpb2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603011934.CLTsnpb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603011934.CLTsnpb2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `zeroed` and `as_raw` are never used
   --> rust/kernel/io/resource.rs:83:19
   |
   81 | impl Resource {
   | ------------- associated items in this implementation
   82 |     /// Create a new zeroed [`Resource`]
   83 |     pub(crate) fn zeroed() -> Self {
   |                   ^^^^^^
   ...
   90 |     pub(crate) fn as_raw(&self) -> *mut bindings::resource {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: used a field initializer for a tuple struct
   --> rust/kernel/io/resource.rs:84:9
   |
   84 | /         Resource {
   85 | |             0: Opaque::<bindings::resource>::zeroed(),
   86 | |         }
   | |_________^ help: use tuple initialization: `Resource(Opaque::<bindings::resource>::zeroed())`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#init_numbered_fields
   = note: `-W clippy::init-numbered-fields` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::init_numbered_fields)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
