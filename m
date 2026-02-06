Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19B21C84B8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 01:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770342034; cv=none; b=gmJXYYy3/SYiWBf+yzUiRx/ocHc6qY5UR6/0hYSrIy0a9JOd1hgw9WoYGBUVyyDV4/vYnZGfskIn8LAvQg2KXHPpVSzVJTabtSGQsMQ+K/ikdqjWNUWHvTdaRL5SnlB0epieMH4bBAqb03cbJ2/0kveXlVbNSzXq+H+JqdbTQ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770342034; c=relaxed/simple;
	bh=d9q5XSg1K1Bspy1qTwktw91uPRmpV8k0iR8QsCZH2JA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pCa2STb+rx58+zOtiRtgJ9YJCbwpp0Pjr11oN9GhxHKjZkRmDxLnRh2mhjaqnt1y1hl+kAjI9+mU1PBq69uWfSFy+wHD00YhC83LL2mbNlvu60NsSv9lPvf3rQPdmP6A1hJ64xwXFrwxHjKu2l9UiLsbSEtINpyNe+DEDeqoJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7vwOEUB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7vwOEUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770342034; x=1801878034;
  h=date:from:to:cc:subject:message-id;
  bh=d9q5XSg1K1Bspy1qTwktw91uPRmpV8k0iR8QsCZH2JA=;
  b=Y7vwOEUBWCv0ey0Q6CQ5z7WbeMJ0s45o7jJ/1pPOpbSxhL3pjoPDpvhG
   NBbpLJjG+GHALceLU2CsCDrhv/fo1UZ1ABTvOuDodDAusagYGYE2E863Q
   pT+BNIq5GwzAIAfBJb3IUWtEG3Xr9dyU+J0m46qugGbrVGcRpuLZlVTsN
   gIDQlEJQVkfaPuK7nSS/Ha0y7CIVbk30sETGoQcrhMcUmPM7fLM3Gx2nd
   O+40OS3ye/w9/bMhTqMubtlvd/5ax+pFNlOfJ+yKM0jPShmpHmukXSJua
   y6P5CajxSYkhaOzToEsHnDhLnHBEcuVfI4VGfZt1MapYv0qLn74riqJ9B
   A==;
X-CSE-ConnectionGUID: Riau9nL1QAyb8qCSzmcpzg==
X-CSE-MsgGUID: lROxPEsVRwW9wK6EkQ7h3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75401939"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="75401939"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 17:40:33 -0800
X-CSE-ConnectionGUID: jidikFSET+WbJWfH1Kr02A==
X-CSE-MsgGUID: eKwW0RoTRiep+VXwPbqbFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="233666834"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Feb 2026 17:40:31 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voAph-000000004Ib-3jqs;
	Fri, 06 Feb 2026 01:40:29 +0000
Date: Fri, 06 Feb 2026 02:39:59 +0100
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:lazy_revocable_nova_wip 1/11] warning: all
 variants have the same postfix: `Init`
Message-ID: <202602060230.IACr6MOf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux lazy_revocable_nova_wip
head:   0c6a6e46aea1c6d967faa717f712dc5ef9dd5e4f
commit: 4aabdbcf20b11626c253f203745b1d55c37ab2ee [1/11] rust: sync: support [pin_]init for `SetOnce`
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260206/202602060230.IACr6MOf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060230.IACr6MOf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060230.IACr6MOf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: all variants have the same postfix: `Init`
   --> rust/kernel/sync/set_once.rs:68:1
   |
   68 | / pub enum InitError<E> {
   69 | |     /// The `Once` has already been initialized.
   70 | |     AlreadyInit,
   71 | |     /// The `Once` is being raced to initialize by another thread.
   ...  |
   74 | |     DuringInit(E),
   75 | | }
   | |_^
   |
   = help: remove the postfixes and use full paths to the variants instead of glob imports
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#enum_variant_names
   = note: `-W clippy::enum-variant-names` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::enum_variant_names)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
