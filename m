Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C9F374170
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534559; cv=none; b=LHbzu7YZz9OqNgOJdXeg7OvttEjb8a0toV1Ik+0h3hRAq8pj5O8q/5MtzDAKYG5GjTAndxADiM0l7+OxWllxHMkGBCo9yfMFgMWmiJZA80vYFoBkhhMyAJ/2W9LyL4oJgVo0R0Te3at3UQxFTubAz6ehyBbbcY4D1T/7DYdM9iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534559; c=relaxed/simple;
	bh=Il8pRcRZ13Y+yeYjl4EU+g6pxgoRUHJbz4XnjKTZ0cM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IuexJ+w0gLNHUQCtYOXlGs+s8LcVl5oOe+A4AyR2n/X3MTXmrPEp5Qd1U9kO1bAcQs/5R0NJ9EPiAscQq9vWTuoIHLA/uq0ksSNIbfYZXkeGCWSstoT40XyjUS7DcM13sNTD3Ko+GufNhe5oAkBB/a/S54JBJrEU77JbIyqdGvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKvAvnWU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKvAvnWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534558; x=1807070558;
  h=date:from:to:cc:subject:message-id;
  bh=Il8pRcRZ13Y+yeYjl4EU+g6pxgoRUHJbz4XnjKTZ0cM=;
  b=bKvAvnWUZzdgdhUnUy/bg5ZF05L0EGatMuEOH40wbphyY1+RgCcchyeo
   jJsE1ZkoIFDlz7RsrC2y/K+SSTVg7PKm/L0S/U17ign1GQ8IE2mIdJXwK
   XTmaz+MTYv2+59JIPA8mLEq/J1WYrCx9//6c8nwXPm8hpWUk30vEDzE58
   of4Afao7VjnQLivtm80xXMHz37AmwMlHUH/yPWop9BGa3PEMM3Rw9RRkL
   9GzL+CGOYgR7D6UFbhPqII/McwTfDR+qLP7nAklH4LeuqM5vZ8Eud6EWa
   XoOABllfTGhQcspbyQ3GHhexPr5aEQiwdDgtehB8jybzXeJLr0LKaho7F
   w==;
X-CSE-ConnectionGUID: nqh6hrRwRNqwTdgaLrmfUw==
X-CSE-MsgGUID: UH1NupCpS1+lt3hTx2Fh8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76386014"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76386014"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:02:38 -0700
X-CSE-ConnectionGUID: vZpqbgqARhqPseCoZEpn4w==
X-CSE-MsgGUID: egGPiPBhRM+/mJQLNhI5wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227957156"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 21:02:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xe5-0000000008B-3kRU;
	Tue, 07 Apr 2026 04:02:33 +0000
Date: Tue, 07 Apr 2026 12:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 69/69] discard.c:undefined
 reference to `__udivdi3'
Message-ID: <202604060457.bdIEZYpv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   a33008fc8f2cf78de0ed73dc9b1dc6a46d278287
commit: 11995b82f6c965c0723f5d6bca54cb170b2e7211 [69/69] bcachefs: opts.journal_rewind_discard_buffer_percent
config: riscv-randconfig-r073-20260403 (https://download.01.org/0day-ci/archive/20260406/202604060457.bdIEZYpv-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260406/202604060457.bdIEZYpv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604060457.bdIEZYpv-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: fs/bcachefs/alloc/backpointers.o: in function `check_one_backpointer':
   backpointers.c:(.text+0x6a48): undefined reference to `__udivdi3'
   riscv32-linux-ld: fs/bcachefs/alloc/discard.o: in function `discard_sectors_to_release':
>> discard.c:(.text+0x133c): undefined reference to `__udivdi3'
>> riscv32-linux-ld: discard.c:(.text+0x145c): undefined reference to `__udivdi3'
   riscv32-linux-ld: fs/bcachefs/data/io_misc.o: in function `.L0 ':
   io_misc.c:(.text+0x102c): undefined reference to `__udivdi3'
   riscv32-linux-ld: drivers/clocksource/timer-tegra186.o: in function `.L0 ':
   timer-tegra186.c:(.text+0x55c): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
