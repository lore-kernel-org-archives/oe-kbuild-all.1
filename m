Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DDFAD51
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 07:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742024332; cv=none; b=EUEjt9oUbSMfZmkDKDcN/aJWmrpLkWriD7xaYXuyB3qhW40qvrxviK9SDgjkWskSD94aQEKCTaoTuX+H7/k/W1dHQqx1nlvvXowtzEhplTuszBCcvzsSUvtb8dnQ9Lkg29UaLK5J6pFlMGal3/wNBXy7vRL+BBqESk2fuhfjJEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742024332; c=relaxed/simple;
	bh=tG+NomvjzTrIpLUJCJXD3a0quZXY6LHArWeqlMEnoWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ecRQF7ieK76qqVh0Cg6Dli/qZWNCxq4p2BDfOyjy+6XI8pkQ64Zg+zB7Z2n3tVx8z48UNmxx4jgivifUJeDRYWTRarYri7Ct30bhF20Tf9aJueXnuMFnDrwjM+Sp1/B+tQ8F2Qpb77h/68C1qiv24FTO0Qv278V4JbPpoXIF6O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OraMh/s6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OraMh/s6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742024330; x=1773560330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tG+NomvjzTrIpLUJCJXD3a0quZXY6LHArWeqlMEnoWY=;
  b=OraMh/s6kTwOEs7k7j6gb23zM4LbkFujyX65wEQZW8iuoH7InsrAk8NU
   h6ZwVTFy0YowHTHbSdfV5EHlQHoWRjeCIRw4wGN6pyc7D6z4/toJO/h2M
   fWU876YF044cRo0hEEL9ipxkFBQneMlfJW/G5MFnbYlOkQ1VCe+INoYY9
   DtotbBMeSqrFujUjwFKHNJ95ts//6V49lVhLqVUE9FGSUVaWH3amR16Uw
   W+Fp6XDro1AJaUlNbSziupLJskiD1H9gkIirCCzwIBWcpfouAWWsyzbUJ
   xwl2Wbv/1CzqYbDGMvEv9cWjaOjxRfmBydyOMZnK500lQP/bfTj99gGdD
   A==;
X-CSE-ConnectionGUID: ADJWr27MS6qY1FwbpefPEA==
X-CSE-MsgGUID: 2Ij8RSonQx+J2EaCXs/eHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43284686"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43284686"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 00:38:50 -0700
X-CSE-ConnectionGUID: 7ZPQKo89R7a/qyX7h5zOPg==
X-CSE-MsgGUID: BzBAPPy2TomLP2YHcIXVIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="121433355"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Mar 2025 00:38:46 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttM6P-000B8s-0x;
	Sat, 15 Mar 2025 07:38:39 +0000
Date: Sat, 15 Mar 2025 15:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:memcg-stock-trylock 1/2] lib/slub_kunit.c:10:10: fatal
 error: asm/tsc.h: No such file or directory
Message-ID: <202503151558.odW6lJMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git memcg-stock-trylock
head:   478ebf7bfd1fda634d890d435c44fd77c97b163d
commit: 4e670c5b007b5bc341e53bb4902f72db41a30c2e [1/2] slub, kunit: hack a kmalloc/kfree microbench
config: arc-randconfig-002-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151558.odW6lJMp-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151558.odW6lJMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151558.odW6lJMp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/slub_kunit.c:10:10: fatal error: asm/tsc.h: No such file or directory
      10 | #include <asm/tsc.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +10 lib/slub_kunit.c

  > 10	#include <asm/tsc.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
