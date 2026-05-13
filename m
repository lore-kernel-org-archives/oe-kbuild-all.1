Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38F41C2E2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675930; cv=none; b=C+nC6iMqizEHGu82d/N3fcMrYjBzqsWYWvJNwPheTYlqVuTxMkOgKVjiquLgQQ1lKBEBbRuS+3AK342hL5fe1MXKw9KXiSHjrCbX75LQSm4OOw9D4oACyVkMmWlb9lalzY67JMcoxkuXCM1B/fTwFDDCrRb2vj1rdObtER7yvUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675930; c=relaxed/simple;
	bh=PGjkrDz3mkFEhWlWuqssJW4lt7briRFGBzmY+eOKFLU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tJT88PqA4Ks5oi3nYjem1tTkFpdemqSQa1xpFqiamk8wiDSeRj+pl6pzXvLflyFIFJrWIsUKB7Rnvn3KK+MxdxLrsjDw+A6sg1hpUBcUyHKgechbA+k2DueRfOF7dFS4NP4TNR0D4XZ0XVH9lOlCcgSHx7Eh5baMsVHnHGQII9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROQJ6W0j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROQJ6W0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778675929; x=1810211929;
  h=date:from:to:cc:subject:message-id;
  bh=PGjkrDz3mkFEhWlWuqssJW4lt7briRFGBzmY+eOKFLU=;
  b=ROQJ6W0j6xy87fsCIm0yCN41ULnFxZVMT7IIru5ywAgJU55Rxdp9dr6L
   Q/wClB5O61YelrrjVJ53mnWN4XgnlImX9Ku5oP2n8iYk1k35JW2rX4lMg
   +gAMTdhwefd5Xz+tnBvObNPx7GNzHreDb/l7yWrCj05d/BcUYQo1fIXok
   2zRkHlYF5owPL3VNfqPb5ql398b3rIAhmxQGYNPADpfjmOj0SPh6gcNRk
   HageDpT/vYqxrv8Nep9zOPjnX6z+smp6uqbq+gjlCrushRL9OydEGws1O
   8fsZT+bhtSt/RiicIh+s/PxgvUxtsM0hf7hhtM34kiNJ5PTKkd0Qvgr/n
   A==;
X-CSE-ConnectionGUID: Ll/bqfLoRryosyxThwx2Jw==
X-CSE-MsgGUID: bFLZgnyVTbWESskWUPD6yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89907496"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="89907496"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:38:49 -0700
X-CSE-ConnectionGUID: OqmUH/WSQhKOlDD8XRyaPA==
X-CSE-MsgGUID: bdBE1T/ITpS6mlS3wt/Ycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="238178102"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 May 2026 05:38:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN8rI-000000008YJ-0uiW;
	Wed, 13 May 2026 12:38:40 +0000
Date: Wed, 13 May 2026 14:37:48 +0200
From: kernel test robot <lkp@intel.com>
To: Manos Pitsidianakis <manos@pitsidianak.is>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: warning: unresolved link to `virtio_device_table`
Message-ID: <202605131459.OWBsBSFi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Manos-Pitsidianakis/rust-bindings-generate-virtio-bindings/20260513-065912
head:   dcbb217532e1f25cb932bf8b1019d1085373a6df
commit: a64ae4106bf2576331e81e44d512d4739796067d rust: add virtio module
date:   14 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260513/202605131459.OWBsBSFi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131459.OWBsBSFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131459.OWBsBSFi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `virtio_device_table`
   --> rust/kernel/virtio.rs:7:66
   |
   7 | //! - Implement the [`Driver`] trait for your driver type (use [`virtio_device_table`] macro to
   |                                                                  ^^^^^^^^^^^^^^^^^^^ no item named `virtio_device_table` in scope
   |
   = note: `macro_rules` named `virtio_device_table` exists in this crate, but it is not in scope at this link's location
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `module_virtio_driver`
   --> rust/kernel/virtio.rs:9:17
   |
   9 | //! - Use the [`module_virtio_driver`] macro to declare your module
   |                 ^^^^^^^^^^^^^^^^^^^^ no item named `module_virtio_driver` in scope
   |
   = note: `macro_rules` named `module_virtio_driver` exists in this crate, but it is not in scope at this link's location

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
