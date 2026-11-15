Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775788;
	b=RpBF1qBR9+DK0CajRvmDCggp2sxnOjEScj/lgobm9XbTC1xScMBLrwYpoX7eIMYR21na
	 56eUlrNDvntymqAUd0O7KBRL44R0dsFxp3VycDwpU/6s6AWpK9nkFThBxycn49Uei7xhk
	 HqwPZrLX15lVEH/bTvqFqM7KQr6fztMMUCE4qAmxN56m9IFsmFsMC6cG1CTl4BNa9s201
	 Yq2exhaySxKjP/y6/pNUtIhVlQ2LsMFsflSFgKrCmRNaLKUbP8fNAyogeXYda7jLJSxNx
	 lC8/1pvyV6+x30hwtC8JBvvwO2FtEk/cPp8CYdtVFu8a3qtCdDythDy7xm9Eghfxkcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775788;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eRXeXMxWulAbVhMyk1BnPLLoq2G2+RFutBbclwfmZec=;
	b=rCR7ndBFCT/Y6HL8chQvDu5OGvGRfFAEynucIovKFRqmI4JDLwgc3qbNjHm1h2Y9Y6PD
	 HcTcluCKPy0uWGsvflnVu9tBInchpUu1S+Icwj4C8qlRzQUuYwo2w/+YpYI7QhlmZGQBq
	 e4egdPOqxUT+rRwzwXH9C5+6kw/F06sjexDRnCaeP5O36wRS8Gna1GvL5Ukxvg+t4Pw5n
	 U3nLtZBnYIAvHCb1Cksa+K01slYQ6rU+Gep7JObHh+mbAdOc2fH2BHAxR37rDygI+kEel
	 mcE5fiTZNAOVd9tP/LpTVuANg4OYw4iONIswW/bZNKTbijQi2yDn54D9Pw4O4pbbNgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ipW6AE6e;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C79606A31F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 20:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C79606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ipW6AE6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794775787; x=1826311787;
  h=date:from:to:cc:subject:message-id;
  bh=0DFXDLLsP//aeu4JEMp5Lz4m4z7EJ3thWvzCqgyNCqQ=;
  b=ipW6AE6eBW3WL4tkJHKIuD4tdIa+IT3HZLUwwlMGN3q8hVxG4c+C0IPj
   mj3Si/H210WJB6QEWbWjsjqe9cn+pcPjyKg+LbamfwLXfvDKc6Omj3GNP
   nJXUCbr5GrkuhjzcroXW4eX8JZ/ZqbU9oiteF/v0gAqVFEdmeuJZtz851
   L87fxgjJ89fDizSwJtWiNA/5LuXM51IA3BYv5WAyc5S+EcGm3B2hRd7gF
   op0Tpz8fl57nyQzDRHmrDrkfk972BhditEBNvGAunbsTSkdRe51+68e1o
   +SeaYqKKLTPYOHvp60ODhbUDq0kMdHeuXF9muPXpqJjUGxrWSZSzu7X4c
   A==;
X-CSE-ConnectionGUID: qpIcJnHyQ0mWP+i4jrr2gg==
X-CSE-MsgGUID: RLVKju1IQtyre21oJI+i+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3378647"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3378647"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 12:49:47 -0800
X-CSE-ConnectionGUID: pJy22DL0T5mUW1t3E8RgFg==
X-CSE-MsgGUID: c65+sD/2Q4i3UTuRuV6fIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9187036"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 15 Nov 2026 12:49:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xShAV-000000002Nj-29WE;
	Sun, 15 Nov 2026 20:49:43 +0000
Date: Sun, 15 Nov 2026 21:48:54 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 91/458]
 drivers/infiniband/core/uverbs_std_types_dmabuf.o: warning: objtool:
 uverbs_dmabuf_fd_destroy_uobj+0xc0: stack state mismatch: reg1[24]=-1+0
 reg2[24]=-2-24
Message-ID: <202611152109.uZtuiBh3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   0e6b6b4005f8a398c95e4d8bdf0bdbb9aed73729
commit: 6c88f63b44fdbb6dbd0ec910907af637975ec3ea [91/458] RDMA/core: Check the dma_resv_lock() return value
config: loongarch-randconfig-2000-20261115 (https://download.01.org/0day-ci/archive/20261115/202611152109.uZtuiBh3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611152109.uZtuiBh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611152109.uZtuiBh3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/core/uverbs_std_types_dmabuf.o: warning: objtool: uverbs_dmabuf_fd_destroy_uobj+0xc0: stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
