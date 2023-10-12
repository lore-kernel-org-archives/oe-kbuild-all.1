Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884DE20EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 04:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+1/ESC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697083936; x=1728619936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ky47WgX4ZaPTm+AbJDAS7a6OWGCV74bTxI5Glj+ynyc=;
  b=j+1/ESC2k8dDqCHvbKFrzmi98+bpe+vis6tvzZM/cHAR/LQcq3j1hexd
   w7Sw/jzIpa2qP3tnTrccTUzJouqIDbFIj8wrbhL5EjTX0MS0LzOfoRyNt
   ypnSUnXi1xi1Z2U2hxhfNJHWemcqoBv82/uW84IO/sAJJluB15Omkcavd
   7e8YDNLUwF7z3EK3p2iaLTOhHF7jbvLt8CoLxTgVhbz1n/+TE9+rbE0ux
   +K6dZ/kYwfFkkvg5Lzyiyj3x2YC2HKgEcnrUJmap4QoTMImVOZbYDtSJd
   /DQnaQ3b0XQfvybJqGqwGig0DdQb3vn1kAFJ+rO9XjuRsCuUhocQCbo3D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="365101830"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="365101830"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 21:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927834524"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="927834524"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 11 Oct 2023 21:12:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqn3T-000399-2F;
	Thu, 12 Oct 2023 04:12:11 +0000
Date: Thu, 12 Oct 2023 12:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 96/269] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310121215.j1vxeH4b-lkp@intel.com>
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
commit: 7a1d1b29560852e488357d0d3704304f1cb4b22d [96/269] xfs: create refcount bag structure for btree repairs
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121215.j1vxeH4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121215.j1vxeH4b-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#375: FILE: fs/xfs/scrub/rcbag.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
