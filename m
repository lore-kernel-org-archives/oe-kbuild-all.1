Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1939C3271E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771422265; cv=none; b=tHrl8ob9WXMV9Y7B/6xMe+2IcJg78JOXO+W2lI46GMdMfyOZB3gyB73hgIpHQs/7tkBMWix2xw8dEbcXiGDbC92ybF7ymU7V6a6q1JBi9QMYmFgU8Dt8pXodz4JBPqpeyp4Co+v6xCdTjf20Me+/ZA7ST+extsfrft8wDeD+fpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771422265; c=relaxed/simple;
	bh=47DoSOymGq3tdKSXldtOPHgPeKsoNetTVtmUJRQtVJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FsnzBAyy8SoxxeqbPE4Gx7Ii1n0VrTqeaGRSaJfueKEmab0oNJiW+n4B/URvOFAdulu5CQGDTjefKvXss7h/Qz59WhSCB/aAAAv8RREILThue7kLYieGOUp/yS1AWmKHYdkUydOZa9Z81bQXAjHlgPgcKBw8d42f3yNTgxFLojc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AumaK4jc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AumaK4jc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771422264; x=1802958264;
  h=date:from:to:cc:subject:message-id;
  bh=47DoSOymGq3tdKSXldtOPHgPeKsoNetTVtmUJRQtVJM=;
  b=AumaK4jc/VAx1KS89oUHl7cixYP52dJrnOhJUnpc3g2ZOABiLLdLVKJF
   os6fCutaN4hfDx8Pw1g+pfZRGMx6Mf2Zp31qP/mSEzFiR4if8+FDp/0A9
   X92O0BYtztmYTItKk6QngY6AZ5BmLxNJzxy4Wq4TSxgskJyXhyhIe/MIa
   ISOEn0TGp4PklRbj03Bv5B0P8oHuc0Hu6TwLNqE9PnTiFCOjWK7SDtqHd
   aoD6rOLJLMpD7/BlTSuVT76lkdouiWX9b01lWWqElNFcM13xTPwrzzGp8
   1Vwa7aq+JN3ANw41qaM8Sq7inr7/Z6/U2NxAOjCQSgXjug9eFxvDUN8jW
   Q==;
X-CSE-ConnectionGUID: qmM5NtYTRBKH3q22vZPsgQ==
X-CSE-MsgGUID: WHv9VZ+KS52Qlpy73mzDjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72207829"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72207829"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 05:44:24 -0800
X-CSE-ConnectionGUID: LhwJQTO6QHS49AsQMnFyAw==
X-CSE-MsgGUID: PzG02czCTa+LUJyW7AxOvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="213436857"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 18 Feb 2026 05:44:22 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vshqm-000000003dl-0kIa;
	Wed, 18 Feb 2026 13:44:20 +0000
Date: Wed, 18 Feb 2026 14:43:54 +0100
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:io_projection 17/17] warning: lint
 `clippy::invalid_null_ptr_usage` has been renamed to `invalid_null_arguments`
Message-ID: <202602181425.lrS2OZL0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux io_projection
head:   79bb6c8ede08124171eab076bb4e55c4c16a1e09
commit: 79bb6c8ede08124171eab076bb4e55c4c16a1e09 [17/17] rust: io: use pointer types instead of address
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260218/202602181425.lrS2OZL0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181425.lrS2OZL0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181425.lrS2OZL0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: lint `clippy::invalid_null_ptr_usage` has been renamed to `invalid_null_arguments`
   --> rust/kernel/pci/io.rs:78:9
   |
   78 |         clippy::invalid_null_ptr_usage,
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use the new name: `invalid_null_arguments`
   |
   = note: `#[warn(renamed_and_removed_lints)]` on by default
--
>> warning: lint `clippy::invalid_null_ptr_usage` has been renamed to `invalid_null_arguments`
   --> rust/kernel/pci/io.rs:94:9
   |
   94 |         clippy::invalid_null_ptr_usage,
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use the new name: `invalid_null_arguments`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
