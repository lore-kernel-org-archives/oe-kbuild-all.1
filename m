Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94D81DD9AC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 01:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791078693; cv=none; b=DNa+yy8luCbKeTLCi2FNwnubWgOiKZL4HhovzLRnX18v/OSYJCqHmC00GPj/bTg4gi82tO4/RLDdwC/z0sI9tveOlNlEpPusTETvKazsdMrIVjVx5KAUijFnOOQ4ouRHiDCsAW5ITIiKryYbaNEvnhNVgFsEBPZTAvGdHnTgqPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791078693; c=relaxed/simple;
	bh=dBqf+Pmy9vZW0qw3C8FgpUC3+DwyXPtl72J4qdqdN4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=enodU17yCJQBL/GThFbZSx8ARtK/TmornoeDxgE96Y6MyWPht7iZWziHBeOv2LAApLpB2xy6CVVHALZwHH0MfC+B5ZiCaCUf71PCTpd7alwE9CI/TFDek2njfWiUAsTGQyXgZ3UltrMAKp65T9gqmF8QLf0FZBz97CK0XyruTj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsPxmPO1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsPxmPO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791078691; x=1822614691;
  h=date:from:to:cc:subject:message-id;
  bh=dBqf+Pmy9vZW0qw3C8FgpUC3+DwyXPtl72J4qdqdN4U=;
  b=TsPxmPO1hhTAWBx0+aAz3SwZSXLzyvwnnctHGagJxf4mz+FYmn7DhWqH
   F69uUpZ12vAGQIGN8+TGiLy8ha/IWfdKOpG9QSk6iO+8BJd0h/w2lw+jQ
   36BQcSjA+q0n1N3l3xRsA40tYOIx07qwlur+bMhz6KxyPe9eq3RbXFh6o
   jxDwsPLJycQ2y9RNLEIQp87UEpjRKHwBu+mD5Gs2Kc19xiR7Zn7vohhn9
   gEA6aEx1w1Ou+DeARmRhH/7fghKZHCwlcLCuxEG4cH0SAH6V2YFhYkIZ6
   KTrhGteraJ7TkClkrxOtlc9aA5J/0dgDwGiYDT93oy0rsWnIONzKiu1/w
   g==;
X-CSE-ConnectionGUID: 0Iqiz4exQQWKS4xiRX5yVw==
X-CSE-MsgGUID: pczRputkSxiaPPo4u3fWbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90744605"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90744605"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 18:51:30 -0700
X-CSE-ConnectionGUID: pRB8eVHyTUSAxgecGU8v0Q==
X-CSE-MsgGUID: WW+OHUjrRRerxIyBkp+2tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="302767839"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 03 Oct 2026 18:51:28 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDBNu-000000000A3-2SPr;
	Sun, 04 Oct 2026 01:51:26 +0000
Date: Sun, 04 Oct 2026 03:51:26 +0200
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [kees:dev/v7.3-rc2/seq_buf/v3 3/11] ERROR: modpost:
 lib/tests/seq_buf_kunit.ko: symbol 'seq_buf_putmem' undefined!
Message-ID: <202610040302.cCrjxQt1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.3-rc2/seq_buf/v3
head:   8d1fbf6cc110c3086db3d4e02f50ca3027355228
commit: d1b53950eb7972d31c31c5fbae8495dd91a175cb [3/11] seq_buf: Copy what fits when seq_buf_puts() and seq_buf_putmem() overflow
config: i386-randconfig-2200-20261003 (https://download.01.org/0day-ci/archive/20261004/202610040302.cCrjxQt1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610040302.cCrjxQt1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610040302.cCrjxQt1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/tests/seq_buf_kunit.ko: symbol 'seq_buf_putmem' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
