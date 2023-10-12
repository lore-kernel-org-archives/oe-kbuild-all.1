Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DD67F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 03:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmeEV1Ck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697080485; x=1728616485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bEXpkNCeTsTojd4v3vxPrAt6obb5NvwneZnsME4HnFY=;
  b=mmeEV1CkZwtJo2bBC/CK6itwKYvjB0WR4iyC4PIkk1u2uovJ6abxHAMQ
   pqjVZE9pxepgnFGCgLdUaMzfo+FjyLMjDA/NfLj8VcAmjOiibrakZ3Uzc
   yJ763uHllLBtp723PMA5zAmKL5xgqimqXOzkijcT2tDQOgnpvWihgpA1V
   1iL47oMgulnSaDOk2pN7wIs5TG0mwrDfFcMxITAZEiuCAw6IgotxhrHvP
   o3M7uDk7jpJaQ+O/jo7QjoE83Ff9j/ttwdCNG8S6pA/1q3zztPgIHhMkd
   C/ZHrzKOahpnMBQ1rKuWYtWOioxTQcEj4WKU/wrOBh1ik4efaFsBdKAnB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388682273"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="388682273"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 20:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927809859"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="927809859"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 11 Oct 2023 20:14:46 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqm9r-00035F-1v;
	Thu, 12 Oct 2023 03:14:43 +0000
Date: Thu, 12 Oct 2023 11:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 79/269] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310121133.oIVjFYul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git inode-refactor
head:   5d7848682f41b20567e9d24b7c29a6d3964f0de6
commit: 1d653b15c5c24f675006eec7c6de006178499674 [79/269] xfs: support in-memory btrees
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121133.oIVjFYul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121133.oIVjFYul-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#548: FILE: fs/xfs/scrub/xfbtree.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:NEW_TYPEDEFS: do not add new typedefs
#955: FILE: fs/xfs/scrub/xfile.h:88:
+typedef unsigned long long	xfileoff_t;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
