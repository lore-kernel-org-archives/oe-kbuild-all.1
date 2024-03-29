Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA69239AE3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 03:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711683817; cv=none; b=QrebvW/snbwrYorqjhdX6OGsdOJIIEVSyGoFRvmGs+vt4XTOpcxifzlaExHjqLQHQ60O1K2/EIlmJzZKQWRXuxYmkjraljtz9kjH997KUl1OjgJB6rCLcpAeouo5rhZfnuqH1J79dqGhQChSLzX9mgglpcDBgsrRgHfysHvA5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711683817; c=relaxed/simple;
	bh=cXbcrHmm2DC7FVn97Co0i3TGNnxbGmZg5RmYC/U/YtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SBpimR+Yx0D8n/8ZjUDdbJ5EWTM1LHulp0dvBkm3wlUHyJnwetwYS854zQkvLlwg464/MgrvO/3w6DqpHvSTEJigsWBUc0t+lZJ+L84910TbB5QvEZWOGRlFpZ8cFdiwPQZQYsdKi8InPuHRbrGYAaHCEuSHVb7NV2zZKgqwUpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDoW4t/n; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDoW4t/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711683815; x=1743219815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cXbcrHmm2DC7FVn97Co0i3TGNnxbGmZg5RmYC/U/YtE=;
  b=lDoW4t/nOsQkYX/ApqzeuDi3yGg0kWcEjqfH29YnxhKKJO3itwa2gdhj
   LmdYasLdjqpeI/uYPpAVUpr1EtzR/UL2cmFNwd4n+mUK2Fw6G8q/BzzjT
   oY62b4+jocPoMDbOkMA+ankhQfmnQDGO3h7hFozGBC39gBIVszlSHSUYR
   5ps/WtCXpIbF457EPkmIK16vI5RDYXQbg5ICzj+n0wjgYH/X2+3iY1qQJ
   Q3+98245WdOiBoJxN1AtBuwnx/5yPgu38qoZxNqYiHs2GFR4eryE26BNa
   LTgiiBR8888Vel8lSJ4IiFVyNsRL5aiKnbJAYdd82Lfii9PzhhEziK4ks
   A==;
X-CSE-ConnectionGUID: noXqQxMuQAe/rRVXWxIFYA==
X-CSE-MsgGUID: O0FyhRaXQSG0R198wgL+og==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18311171"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="18311171"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 20:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16891498"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2024 20:43:33 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq39P-0002pO-1M;
	Fri, 29 Mar 2024 03:43:31 +0000
Date: Fri, 29 Mar 2024 11:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [akpm-mm:mm-nonmm-unstable 53/62] lib/raid6/recov_neon_inner.c:7:10:
 fatal error: arm_neon.h: No such file or directory
Message-ID: <202403291120.56WL8OwQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   b065e14a3960a495216a032e6d383c104147c9ef
commit: aa73a95380b4ef76ccf00344b777d0d415026b7b [53/62] lib/raid6: use CC_FLAGS_FPU for NEON CFLAGS
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240329/202403291120.56WL8OwQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291120.56WL8OwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291120.56WL8OwQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/raid6/recov_neon_inner.c:7:10: fatal error: arm_neon.h: No such file or directory
       7 | #include <arm_neon.h>
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +7 lib/raid6/recov_neon_inner.c

6ec4e2514decd6 Ard Biesheuvel 2017-07-13 @7  #include <arm_neon.h>
3de13550a20fd5 Arnd Bergmann  2023-05-17  8  #include "neon.h"
6ec4e2514decd6 Ard Biesheuvel 2017-07-13  9  

:::::: The code at line 7 was first introduced by commit
:::::: 6ec4e2514decd6fb4782a9364fa71d6244d05af4 md/raid6: implement recovery using ARM NEON intrinsics

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
