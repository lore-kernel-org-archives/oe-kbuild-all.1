Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1037B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 03:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mynCHcsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697079884; x=1728615884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MF5XsEcQffuHuj7rGW6rJQzEjTyozLyw0XnTRshBLPc=;
  b=mynCHcsMLhzEpg96XzHUvcmBNbw+HgqQWSyjIg7m0CvFy+8cphGReBaA
   afglvNvTRahgy43Us+yoLQAbqGb0V45ADdijuHVqzoYcIe7utChEraQQZ
   khIizX36tPfmkSh4ruV/1SwrAEumsFMUEkUgQnCQMhuvXQQ0WfEBiRn8M
   AryNu+x2cftOEXOXbHjjGButviX32QgkgexhmqeB6hxrdKqqlq35vlPIh
   60fQrpzbtksQpM+8Q9EXStELZNs4zSYAEsRMStKtUXAJTvmYLgH5F74DF
   rMDsSoCu5KOa6zAtCMpdilNDkz5zM4WSwrj54J/gC8nzofO8GNIVoTERq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="375172022"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="375172022"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 20:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844823465"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="844823465"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2023 20:04:42 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqm08-00034P-0c;
	Thu, 12 Oct 2023 03:04:40 +0000
Date: Thu, 12 Oct 2023 11:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 76/269] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310121135.vnVIqHUR-lkp@intel.com>
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
commit: 4938bf7f9cc82febd92bb0bfa5a2b8a5884f36e5 [76/269] xfs: support in-memory buffer cache targets
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121135.vnVIqHUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121135.vnVIqHUR-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#376: FILE: fs/xfs/xfs_buf_xfile.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
