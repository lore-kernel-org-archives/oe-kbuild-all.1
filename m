Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2C38E8B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876478; cv=none; b=ZHEQ/HKmBKcbOZBmlBDZGcB2DPO5oCX78iib5y5FYX1q6YTRcqElM1L2RIx1w7aoUhPm/vv5sfuG0Kg0oVlWUHFFtwEbX4Ykpi62RjWvzjXCZJiBKGmDBU3NgAZmuuqp7K+3NHu53OzluiRKQMq0mcHFQk0CORm9qd2/eDJ/nP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876478; c=relaxed/simple;
	bh=nUhcmhIEypRwtn0vDXPQCOxjDUU3WGfWDz7m0xKXxCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TMVvUo8qNIgYsJcszXonjxtun8Fx/oLTNUfo19cOApSJlrrytHUoy0/7zhrR68AiqO/u/4BMrQ/CryJ8ZcDvfwB9LSproTsUyW5oMMloql1HRnOacHsbVAZO9J40i+IbsptP3Vpt+ioSwFmgMK+Ju6VRAP7gOwN3wPb+NrqsxWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuJGKBkQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuJGKBkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778876477; x=1810412477;
  h=date:from:to:cc:subject:message-id;
  bh=nUhcmhIEypRwtn0vDXPQCOxjDUU3WGfWDz7m0xKXxCY=;
  b=iuJGKBkQB+JpWljQfx779iSyuofOT0kiSndbAxRB0jyzCBdvFJ7BJYAc
   mxRnfR5yXbZHqS0q0wScDnt0j9LZmQeSaXikg4J9TaJj9HOrxtdBXhpM6
   m32Lrb0jk/08HBWUSPIgojCPaTgSVLXwR4RHAWFMmb96QvRTBq5U/h3O5
   LB/mrkJku4JAbR5E6m1DeP8SP/cIC/6+O8gH3wAmu2S2stbr8bBQQz1oU
   VKA3vTGCcIwSNw2KRkLhZQL378IkCls1ZKaSsWPYEeWCTvL0AuaiGHi7w
   kdj4K+FnRRbdWGI/rMpdv02xkyja/cnnNUJpYayNmOejLxMLL90eqTzwi
   A==;
X-CSE-ConnectionGUID: YTZlNKkHT5mEY3wkC94Xwg==
X-CSE-MsgGUID: 6zpv9d7gT96+BCR5kFeDmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="80008305"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="80008305"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 13:21:17 -0700
X-CSE-ConnectionGUID: ly9Otzf6SS2fEDff6NS47A==
X-CSE-MsgGUID: 7kcEA1P5SuGvvlHHUr473w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="242786302"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 May 2026 13:21:16 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNz21-0000000095t-2lCY;
	Fri, 15 May 2026 20:21:13 +0000
Date: Fri, 15 May 2026 22:20:44 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: warning: doc list item overindented
Message-ID: <202605152201.ZkqCAPW9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-pin-init-internal-pin_data-use-closure-for-handle_field/20260515-173849
head:   5026f92099ca080254d4263e0a554e1b040b7c16
commit: ddbf85f3617b01bc6878e1d7a05c139a69d27f7a rust: pin-init: internal: project slots instead of references
date:   11 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260515/202605152201.ZkqCAPW9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152201.ZkqCAPW9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605152201.ZkqCAPW9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: doc list item overindented
   --> rust/pin-init/src/__internal.rs:269:9
   |
   269 |     ///    memory.
   |         ^^^ help: try using `  ` (2 spaces)
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#doc_overindented_list_items
   = note: `-W clippy::doc-overindented-list-items` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::doc_overindented_list_items)]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
