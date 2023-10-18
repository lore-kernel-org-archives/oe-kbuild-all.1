Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF1635885
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGFfrXU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697633029; x=1729169029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQY77ZE55Kbb07Adt9Xoh6+wnGvaR2eyT0/9pKRK6o8=;
  b=MGFfrXU9e/nkOJpYVaR2anbTAq/NMD5QTumuCy74G5xuAChP0Va/fVzG
   8bCzCTjwVlauznmmLT2mX3OSvxPKVOzGu0N5VULcSvc2g+WY5K+JnHewv
   l88Rd5Hfy9s3hR+CVay9K1Kt+r/gi/T8o4Pk/g4V3G/irHTHnnq6mklvC
   IiwRvjpElmU4HfYr0ovigZ6aMRjP3GhZ2IkURtOUXI11HLLIdNegn41pD
   bmhG6eE7Nwv4mPRkDXJsc10lR8DEE395/70F7ewcfNJAIeh28IqnIbYIR
   6IN1Hh1VkWm2MmxfsS+VEQLnGE/bebOSoCtlziyjDK1eRI2HKdxgxUClS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366262170"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="366262170"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 05:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="822425794"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="822425794"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Oct 2023 05:43:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt5tp-0000Mo-2S;
	Wed, 18 Oct 2023 12:43:45 +0000
Date: Wed, 18 Oct 2023 20:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:exportfs_encode_fid 3/5] checkpatch: WARNING: Block
 comments use * on subsequent lines
Message-ID: <202310182052.D2PH6SUM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux exportfs_encode_fid
head:   2b6115cf3826b929cad609ea8921eed15214763d
commit: 43c1d95c7ac5219506ec3f5b8b45784adb0546a9 [3/5] exportfs: make ->encode_fh() a mandatory method for NFS export
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310182052.D2PH6SUM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310182052.D2PH6SUM-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#285: FILE: fs/smb/client/export.c:47:
+/*	Following export operations are mandatory for NFS export support:
+	.fh_to_dentry = */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#285: FILE: fs/smb/client/export.c:47:
+	.fh_to_dentry = */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
