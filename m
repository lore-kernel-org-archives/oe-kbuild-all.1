Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144071FC10C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742050892; cv=none; b=vFn4NIE6OpvuM30T8txr0Ckn+j+4fEfRZCHF35Fn8WuhZQds+S2M+AgUCfp2r7Fmy4wrS3+6cYrk8C0VPdq6dhJZnyprMvZ6MZo8Z+RrtY/navIbz9fwbEWPPy8NETGw6sClkvh0IWAFtefJ/KOu5xiT6fGrjpKgQP+ysSqrZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742050892; c=relaxed/simple;
	bh=RwmerFlexVghsO/44Y10xArvHlXhIp727Q/G2ho9r0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJu0MjT4PEusFVNlbWf4MZa0cJ3LH9mtE419o9S2QfijO90b6blY7A7u+HIIgUrJE45YMoiSMGQQolgtrdM4x3V8ea9rHvR+K2KdUogY9o6PbfnnIkGdFPQpr7s30EoY9Rh8GZyQVq1suES4HrG5j1+tPW6R9r6cUWpg4NSK4lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZ02sNtS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZ02sNtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742050891; x=1773586891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RwmerFlexVghsO/44Y10xArvHlXhIp727Q/G2ho9r0o=;
  b=NZ02sNtSkhZL9Vmr6oVLlLUj1+cyRwEgQscfeQg4cNr6BcsugecnLLZL
   BbqXMMdzhmeUu2hOihVgPQBhf65rYnsntnSiUumy4Pdvo85t/Qxw8x5J6
   JpZx3Qs/dMlWXNWZZQOMWS/6A+wVlMu/xiUeUpr2sgHgSnboetZcS9+ET
   kKVerx3faz+qkhEQ3/aLOLfkWQwy28rFnSYfWtYKLa1nrG58I8uf4e0EE
   PPiiwBIPuvqmAeEhHz8+rhe+LKP/aRb1TFXdjzZHnXxhGfJ40EuQxgNqi
   YqjdDF5pe39BgLPGHg8w1kYHVO9yXjJri72s985+OVLAk8pcEmaEtTd24
   A==;
X-CSE-ConnectionGUID: E2hRaDyqTnOjXdIQmEZf/A==
X-CSE-MsgGUID: 7lIifzjMRpOO0Rqxe3NDXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="46977747"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="46977747"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 08:01:30 -0700
X-CSE-ConnectionGUID: 3TDH6jsUT5mFiMbAZzJ0rA==
X-CSE-MsgGUID: FmsECTe5R7ql38Jv7cEGog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="122050025"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Mar 2025 08:01:28 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttT0w-000BOp-0t;
	Sat, 15 Mar 2025 15:01:26 +0000
Date: Sat, 15 Mar 2025 23:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [jfern:sched/scx-dlserver-boost 13/14]
 tools/testing/selftests/sched_ext/rt_stall.c: sys/wait.h is included more
 than once.
Message-ID: <202503152220.gAuzob4W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/scx-dlserver-boost
head:   d4faa4aa813acff703cea3c301bb556f69b5210c
commit: 29ee49b13d010913f530621907ab9f19a1e55310 [13/14] selftests/sched_ext: Add test for sched_ext dl_server
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503152220.gAuzob4W-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/sched_ext/rt_stall.c: sys/wait.h is included more than once.

vim +12 tools/testing/selftests/sched_ext/rt_stall.c

  > 12	#include <sys/wait.h>
    13	#include <time.h>
    14	#include <linux/sched.h>
    15	#include <signal.h>
    16	#include <bpf/bpf.h>
    17	#include <scx/common.h>
  > 18	#include <sys/wait.h>
    19	#include <unistd.h>
    20	#include "rt_stall.bpf.skel.h"
    21	#include "scx_test.h"
    22	#include "../kselftest.h"
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
