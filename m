Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FFD2B76E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSOl/SD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697083935; x=1728619935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DVUIYhucxoXYYQyx25gKSf1OQYa1DXD/+JD4NE6j2L0=;
  b=PSOl/SD377Y7svVoUr8AZ1k8agC7L+81f4SLX7pL7y9iAD0ctePKYWw9
   iRQbFbmnTzb3QbDgLXCiJmLo6FuresYMcXia3qdN1Ff/2/EWQPXbkfIzK
   b5F+0yfRiIskUioTezIQdD+BhKjan04DlMIc0oLjN0VXS9opLL2IEjeCN
   zzzn1LmVRF99R+AMjpgvtrLwWo1ZgT8kmrOWKin1wyx3ePBEDTX9AS8UQ
   ZXnzZ5KRw7tgc09Q6LfCHUpH98zyeySQg3A7DeyCKPPsr8huBIVMN2Hce
   lb/6zzAXNjig2sBYNZcbk2mSMKaAS97TJw39pBznTALGEBzd+gxP0NBwF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451319369"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="451319369"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 21:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824431194"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="824431194"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2023 21:12:13 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqn3T-00038z-1s;
	Thu, 12 Oct 2023 04:12:11 +0000
Date: Thu, 12 Oct 2023 12:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 95/269] checkpatch: WARNING: please, no
 spaces at the start of a line
Message-ID: <202310121253.zxMWBnUk-lkp@intel.com>
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
commit: 2df58d0a109b5764d612581c712e41c0a51431f5 [95/269] xfs: define an in-memory btree for storing refcount bag info during repairs
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121253.zxMWBnUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121253.zxMWBnUk-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#345: FILE: fs/xfs/scrub/rcbag_btree.c:269:
+ \$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#347: FILE: fs/xfs/scrub/rcbag_btree.c:271:
+ \$

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#397: FILE: fs/xfs/scrub/rcbag_btree.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
