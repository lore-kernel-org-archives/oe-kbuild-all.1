Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A22823D291
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750461513; cv=none; b=hk7f1Lo9ASttR6F85g7zkWKYUqoEBHZE0T7zndEO5KL0x1nN9bah4MESPAwkWh36nkvWUkyXIJ0AF74hacPdzR23ZrfJ2aqcly/mYQdIJ4zPedPbnhceRupzj2GdbSsS2Lli3AYMOjq0qSugVc8csA8RlG4zKO5w8ROqKKAOtCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750461513; c=relaxed/simple;
	bh=OTh1txtTtL+k4uuFq55OEDmNbYsKO6fH9y6GNULv/J0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktb4JCQ7ICFixDsYMVv2hwM/Qu1ROhITxU01oRkQmwRzqiawL7WVOZgyi7AOknVortw/Sz2TwRbiWPCATFkniT4wjwSdgKFvrdTujzjq1MvdYVTkL+HBch+3a0hFWJYEU0Mh8C5Kc2Vje72YWo9CwyVz899vy7ZncVm9Wq4cEyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wn7bOMSr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wn7bOMSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750461512; x=1781997512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OTh1txtTtL+k4uuFq55OEDmNbYsKO6fH9y6GNULv/J0=;
  b=Wn7bOMSrfu+Wff/4Y+O3cnMGoFV9PKf58s+U9oXy9C7BXotuxkRAFj1V
   n0psaOYXshCTbqBOzyBUVOzwcGtvCUfFjLDByhshjyRB5rtyLRENvJFea
   KQkPHM2TX1clxoGwdeNnwebJZN4ghZDgdhxwWreUTFSAdi6kuQ71ggB0Q
   gVUKOma7SUE96BxLuffNoNwYxy7itNn8wHTSkZvs7CEX+xaVHrFrEjQn+
   41Xq5GuBp+wmbrYKB3hFKfucMrQ+n808ohMbBbzFZb69jS9PqZXzTdJck
   ln+jHHJC8YEtytAAy07xSf34MV4Vnu7LQ1FaFoJ2UlM3lMEsEI++PvxhZ
   w==;
X-CSE-ConnectionGUID: 6tY18l8DQiqIxrcLDhVOWw==
X-CSE-MsgGUID: ahayt23yRH2x7ylhKWsZdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52604025"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52604025"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 16:18:31 -0700
X-CSE-ConnectionGUID: U7rli1drTcCBlghjCMGmJg==
X-CSE-MsgGUID: 9s4byS1XSnum+1Xs1e3K4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="151172426"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jun 2025 16:18:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSl08-000MDW-1d;
	Fri, 20 Jun 2025 23:18:28 +0000
Date: Sat, 21 Jun 2025 07:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 21/22]
 tools/testing/selftests/bpf/prog_tests/tracing_multi.c: bpf/btf.h is
 included more than once.
Message-ID: <202506210749.l2sGTQ6G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   28441de17b08aa419e3a354e2940268a9078d418
commit: 2f2b35a8195adbb582de63a7516c9ac968577976 [21/22] bench
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210749.l2sGTQ6G-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/bpf/prog_tests/tracing_multi.c: bpf/btf.h is included more than once.
>> tools/testing/selftests/bpf/prog_tests/tracing_multi.c: linux/btf.h is included more than once.

vim +3 tools/testing/selftests/bpf/prog_tests/tracing_multi.c

   > 3	#include <bpf/btf.h>
     4	#include <linux/btf.h>
     5	#include <search.h>
   > 6	#include <bpf/btf.h>
     7	#include <linux/btf.h>
     8	#include <search.h>
     9	#include "tracing_multi_fentry_test.skel.h"
    10	#include "trace_helpers.h"
    11	#include "bpf/libbpf_internal.h"
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
