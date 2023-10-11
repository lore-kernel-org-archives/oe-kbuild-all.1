Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A98312E5D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 22:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzIuMTzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697063872; x=1728599872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xwokXwkLe3i0AHU7TfyaqyXtNwsK5Ol5hAEQwAFi7Ig=;
  b=dzIuMTzqrldNdgw3SbEAazziZjzD5DOKEdxIq3Z62cK0ek8Xb16Vm62m
   6NIsVcfLjBDGF17JmVp9TASnaWmZIcF9icCwinNoS6NH4binZqInlUYRF
   Aigm7vInhBM+7pvaKFfr2L3ygJuVcnMwzFQ3axuQd1hGP45E9Kw52G76c
   AQRic/HyG8z/GR2MzXBH8oJonXBVTjHJX8amRFoMk7il7yKkQUr3Vtrwp
   NcXf5/Ivh3hZAoPHZ0nkql+y+9arGzlyxmgYnTVk3XbsD2U4Bd4m2jr+S
   i2yaKmt9JpGe3ryxuC3zO4yLa6UJvcXv5XiBSdFC/NqZCcIVJLdi7HzSJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451274785"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="451274785"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 15:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783430867"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="783430867"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2023 15:37:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqhps-0002nT-01;
	Wed, 11 Oct 2023 22:37:48 +0000
Date: Thu, 12 Oct 2023 06:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 8/269] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310120623.ml9BHn79-lkp@intel.com>
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
commit: d4d58b4b0e199789bfd8e740e2d667a9db32bd2e [8/269] xfs: implement block reservation accounting for btrees we're staging
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120623.ml9BHn79-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120623.ml9BHn79-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#584: FILE: fs/xfs/scrub/newbt.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
