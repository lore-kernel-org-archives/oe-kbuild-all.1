Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED4762A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 03:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTXRY4gN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697081217; x=1728617217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/B/eW8I3/wQTfEHFFPuGdEjCOJY+XLr0RgksbPV1Mqg=;
  b=ZTXRY4gN2eXurlUMR/FR900westi2Prj9FyHEBofATS8QYDlBsDOjjiO
   d0jCFp5jFW7n4ms51J2koAx8gw3C79/YerOM8zZExllBpsZuxnpj6yGMd
   eCejTeucBf66e4NYhGqNfp2/tUIaJLMz1svxgFOoy+dPwsrOI/CvIfm1c
   FeaoB8VrqwgxpKQFZtR0TBSqlVcqNbduWJN/GivrFr0kvPEEQ4l2rYqBD
   5f1Ndw/mgZdmzSqvgTFSLFxV35oBopCcbfanc9DeyM5ypdEDSYmMsUVxl
   U5xxhgHLh/KfZjAuwIfl7wb+zrXd9D1tcMkm1UHUqcdXnhlpOKbVOU+w3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415872476"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="415872476"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 20:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="819973734"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="819973734"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2023 20:26:55 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqmLN-000363-0b;
	Thu, 12 Oct 2023 03:26:46 +0000
Date: Thu, 12 Oct 2023 11:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 83/269] checkpatch: WARNING: please, no
 spaces at the start of a line
Message-ID: <202310121109.yBEAGbr4-lkp@intel.com>
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
commit: 2b827256b6c1c99c1833167ca6c2abbc857c7d04 [83/269] xfs: create a shadow rmap btree during rmap repair
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121109.yBEAGbr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121109.yBEAGbr4-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#41: FILE: fs/xfs/libxfs/xfs_rmap.c:292:
+ "In-Memory Reverse Mapping BTree record corruption detected at %pS!", fa);$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#44: FILE: fs/xfs/libxfs/xfs_rmap.c:295:
+ "Reverse Mapping BTree record corruption in AG %d detected at %pS!",$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
