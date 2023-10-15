Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7E31878
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 06:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlgp1Glk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697350960; x=1728886960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0Qx5QexDDBhXgiF4XhBlEJG14ILjgfxDL8qh8rORUc=;
  b=jlgp1GlkuxyJWoarqqZ/vQLBJnCBVdUQwDqXbpmHS6NFSAY5pcckAnkq
   UoSGIs6vjwGmrCOMg892xxhwsRyzwOkUOKBJnRMVGwiMJcG+u8UxVKqFf
   COGtjqpHykqWfQC7zl+InBndOq0CwdbdBvIK0v8rsr80hswNaInqeoH/H
   x+uAytEzDXyT668kh+mkF9AJp5BBYdKnSlYe4cIaL9+s9EIbhjar7J7zu
   gaZpw49g9szwji2RhLjIaCUQXYbgeqASxIGHytFw0vyJHEZnW3c32bae8
   35jFiffs2WkLYs9M00SAzBLzRLAWc/HoNT1XipRPZkMuAijSCV3aNZ5qT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388226655"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="388226655"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 23:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790388631"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790388631"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Oct 2023 23:22:38 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qruWK-00077c-1c;
	Sun, 15 Oct 2023 06:22:36 +0000
Date: Sun, 15 Oct 2023 14:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r3mini 4/18] checkpatch: WARNING: Missing
 or malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310151405.FEhaUInB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r3mini
head:   17d137ab830925bb82623f79f804856078677bdc
commit: c88d1ac2b5ba4ddf4d342c2328aa437e8fe6c162 [4/18] add resets for mt7988
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151405.FEhaUInB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151405.FEhaUInB-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#17: FILE: include/dt-bindings/reset/mediatek,mt7988-resets.h:1:
+/* TOPRGU resets */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
