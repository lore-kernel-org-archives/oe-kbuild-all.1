Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B545519B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 00:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiTyGU3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697069686; x=1728605686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXOoLc9AZ0qnmPyDB7LLyjMHVBsX3N9t89RcbxYIdRs=;
  b=hiTyGU3RzsYKpW1rqjVT9tuV+x0P+sTcC8gmkKyqD3Ncmi9ITehDHe7F
   ix23e00PHyPz9Vkk1QPdcrJGZkvd79O2OnkYBFqBB9nxPQPWssieEr9BC
   clHCqs3l1hoE3hHIZL0+3kpP2UjGnOqHkN6f0rf33WO4he5PSrPmPGZYU
   K8KcZKp7jjlfdfw7sbBJcrnJQq+Qv4J4Bri3LIfaLTuTObqFFak4Viju0
   l2fwAy5HJVA0KhZc6udGQxerJWSRD1gZOAzjGZWyHtpo8buo+c4pzRMnI
   JVqZZrTcqfwo3xq1PndT5Gn+176VjiloffMNRA4pVnVNfoDloOy1N6LhV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451291984"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="451291984"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 17:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001333223"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="1001333223"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2023 17:14:44 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqjLd-0002t7-1x;
	Thu, 12 Oct 2023 00:14:41 +0000
Date: Thu, 12 Oct 2023 08:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 37/269] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310120847.UmbY3t6U-lkp@intel.com>
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
commit: 0ebdb58358ed06386f9b8e09c053063b1f6cb2ed [37/269] xfs: pull xfs_qm_dqiterate back into scrub
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120847.UmbY3t6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120847.UmbY3t6U-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#122: FILE: fs/xfs/scrub/quota.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
