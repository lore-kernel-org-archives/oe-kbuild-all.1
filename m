Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759633AD51E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779824439; cv=none; b=NYcUZPJKpR3HkVa2cZBcj+p/Nz1W/GTbItBJSDWippe51JnifUY5+g7lVM69r+9Go3IGpVEgH03UzpuYMBbURInuVTqr5LNgNhw3t/vmqCeZZfSpLcCYss5fEZ0xjRIqNaZT0zlB1MKZyQXdLd9mXjQoNpC4mQqSDiWbt2lxDg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779824439; c=relaxed/simple;
	bh=1/P9JB8enLDit1oxHlP2HGDNH/ntYr0UKeoAprZkqfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rj7Ky9iPUe0YLvHsDYTL4THy3FG8svDPp9gQZ0ae32PPbMPH11YbxZkfQvFGcchAL436ogrLxhT9mAiKEWimh4KL72p6GPXa9Yup/sYaFHvTCZokbMsPSNclI2YpTsHWgIGAxorBcP6up26wciKhZJ/eRhQYwIwXQR49KHtrI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRHIDq0r; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRHIDq0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779824438; x=1811360438;
  h=date:from:to:cc:subject:message-id;
  bh=1/P9JB8enLDit1oxHlP2HGDNH/ntYr0UKeoAprZkqfY=;
  b=aRHIDq0rpiq8MVLr+C+ZjdFxkMIhrIciEXO8ykNQrU9fzHsZk8WQGnZk
   jMGNVv6TBKoLO+NkZhUxrIjpHFvU5Q8gB8x3O0mYUsmKACRjp4J0TamE2
   Ta/1V2puvQieO6xp2wXJmnQCyuItXm8sjoboZeAKCXx7vD8hfW4atYsMK
   i+4VG4skD+uGXvEH87svpI+C3RDWFQwCWQEZz2yya13K/Eet48cfk4/ms
   Yvp+Qke52D11I0K7DGCBiKf8uTuVTo+5EnkBhrTmtMDQQZct+yr/tDAYi
   GBPXivByIa70cefXIQNrMnA+2C/Lx/eF0JAg0azxp/I68YFizdFc/jmVN
   Q==;
X-CSE-ConnectionGUID: T2fRJ7JvSdqsvlueOfbX+g==
X-CSE-MsgGUID: vhfHM6kySD2f+fdEjos2QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="83228166"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="83228166"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 12:40:37 -0700
X-CSE-ConnectionGUID: DlfRtxBjRMuO2gV5GL74WA==
X-CSE-MsgGUID: zH6uAi+iQpGnz/qW//Fp/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="237847375"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2026 12:40:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRxdh-00000000CTJ-1jpF;
	Tue, 26 May 2026 19:40:33 +0000
Date: Tue, 26 May 2026 21:40:04 +0200
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: error[E0433]: failed to resolve: use of unresolved module or
 unlinked crate `mem`
Message-ID: <202605262130.CE5Bcybq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/rust-device-remove-unused-ref-to-ref-transmute/20260526-233811
head:   41da98a9f29c45f617c87b737b1b1b9971c9e53f
commit: 41da98a9f29c45f617c87b737b1b1b9971c9e53f rust: device: remove array copy
date:   4 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260526/202605262130.CE5Bcybq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605262130.CE5Bcybq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605262130.CE5Bcybq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0433]: failed to resolve: use of unresolved module or unlinked crate `mem`
   --> rust/kernel/device/property.rs:554:29
   |
   554 |                   Ok(unsafe { mem::transmute::<_, [$int; N]>(val) })
   |                               ^^^ use of unresolved module or unlinked crate `mem`
   ...
   559 | / impl_property_for_int! {
   560 | |     u8: fwnode_property_read_u8_array,
   561 | |     u16: fwnode_property_read_u16_array,
   562 | |     u32: fwnode_property_read_u32_array,
   ...   |
   567 | |     i64: fwnode_property_read_u64_array,
   568 | | }
   | |_- in this macro invocation
   |
   = help: you might be missing a crate named `mem`
   = note: this error originates in the macro `impl_property_for_int` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: consider importing this module
   |
   7   + use core::mem;
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
