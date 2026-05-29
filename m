Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4CA2E7366
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038636; cv=none; b=tVH5Fq9kedznPyc0/ieL9TNeigjp+Zvhz9jGVc6zyREuK1ddtXqUpfyF6qLyGTHPpb+ixH9cdSmtZ70qw2+JBCGJ1TzhY/oTjwsWgP+jThIJ3FQMeHdAuio2qtLoZ3GQ1VWtV+kVV8n46rFf2Ynkb+ORkagrVyw21JcmxR6vtMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038636; c=relaxed/simple;
	bh=3E1vdoG86mCgVlE+/oqbsrT10nEDVVpasLykGwbxyco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CVxJojYYkmMbcreDmvcX3wYxtIg/hMWzYD8qbUZlRVQr0/mZZMsLl1hQ2hd5Zv7NQ5cyHcdlnzRYPwD5B5FgSympAeDO8+SdbJ0/VrgxN9w5xwXzpJCF8XQnrveRZ1VkTlrnrjdqAiLfUnfxYIs5x0iJGFn8TeAKYx54W/lzwyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QI/5BC3l; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QI/5BC3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780038635; x=1811574635;
  h=date:from:to:cc:subject:message-id;
  bh=3E1vdoG86mCgVlE+/oqbsrT10nEDVVpasLykGwbxyco=;
  b=QI/5BC3lCcN4hqX0cZg6X8GHLa8ZBX8FP9k6O/s8vFvZ1ve2I5D/2H9X
   8jdZd0ftUoEmS3S7tYcgWBff786j+OOxEXohNWvu+1PhAldXwmB5QgEC6
   eUEEfSNzamY071nDxOYOndv3HEmo5ni+A3wM9CUMC1dudWbm3Dhgysy5j
   6YOSAxZ0YWDF5535cY7CTZK35ws9Z5SHLu0R44ZnlpKOjZV1tXkX/VmrW
   IX639LPkLBs3ycP5OoKJLcd8XYRdco7AWFVffJvBxO6pTUHmJFblfUBQ5
   wkuGgL2bSdVp9/6W3jnfHeXkdyCaTW2P+FzgvgSRuTGjHCe9lcRFNErxe
   A==;
X-CSE-ConnectionGUID: 7+40nUvVTLGK8Bf5BOHkeg==
X-CSE-MsgGUID: uwmi+0IyQW+KIKkAlugmtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80786357"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="80786357"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 00:10:35 -0700
X-CSE-ConnectionGUID: J7aVTuB/QuGRjiJtsAAiig==
X-CSE-MsgGUID: 6JGSb0wDRYK7+lO7h7yA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247867028"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 May 2026 00:10:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSrMU-000000000pZ-3N3p;
	Fri, 29 May 2026 07:10:30 +0000
Date: Fri, 29 May 2026 09:09:49 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:io_projection 17/19] warning: unresolved link to
 `IS_MAPPED`
Message-ID: <202605290935.iDYd88Iq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux io_projection
head:   c53915574e787e2ef9e3998645328cdff6822fb0
commit: 218ef5eebe15ed08bd57f21ba69b46409fc81f61 [17/19] rust: io: add copying methods
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260529/202605290935.iDYd88Iq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290935.iDYd88Iq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290935.iDYd88Iq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `IS_MAPPED`
   --> rust/kernel/io.rs:242:10
   |
   242 | /// If [`IS_MAPPED`] is overridden to true, it must be correct per documentation.
   |          ^^^^^^^^^ no item named `IS_MAPPED` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
