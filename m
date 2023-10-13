Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163181BDC3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhNn/Lp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697211826; x=1728747826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WOJ4DmqL5YO3Hq2TtLYTao+5BxLd4qT2jowJ9OHi+ns=;
  b=jhNn/Lp+PAJ4TorQTQrnzsDFR/1DLLPVtnebJUsWQcyPnqDebc/CIqhw
   kpZM3rBdyAdf0L1ZC5cTk1ysLIR8K/1QzEzJr6EEAT2M08Rvm1YIWVtHe
   KYTNcv36objcAK3R4Mw5+EkAl3eUCNYjfiL2xTVRDqwz2mxjIc7++QzM8
   42tCJRHNwJwjyraHTODO41XN+HEYtfhgdfFBT0lRn/IISmz8i21HpqhqW
   lStGYW3cQxMvuywhsByWbK1oIoDcOPkylohFhxYIwfRLwHDbJT3rl0Qn8
   LDoa8fqlAJdOnSWtf6dB+4ZlTHKHmonXsSLZAwUKYWoC/Dm4xPBZXyvCL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370274663"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="370274663"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 08:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="928461802"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="928461802"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 08:43:44 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrKKE-00052R-1A;
	Fri, 13 Oct 2023 15:43:42 +0000
Date: Fri, 13 Oct 2023 23:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 14/29] checkpatch: ERROR: Macros with
 complex values should be enclosed in parentheses
Message-ID: <202310132339.03N8bWz4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   af314f8dfffbe0852967cf253beb94878c5d4846
commit: 8755e7e9df46c594c7ba5b5eae9e3f43a5c4eaae [14/29] ovl: Support escaped overlay.* xattrs
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310132339.03N8bWz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132339.03N8bWz4-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#46: FILE: fs/overlayfs/overlayfs.h:37:
+#define OVL_XATTR_ESCAPE_TRUSTED_PREFIX OVL_XATTR_TRUSTED_PREFIX OVL_XATTR_ESCAPE_PREFIX

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#48: FILE: fs/overlayfs/overlayfs.h:39:
+#define OVL_XATTR_ESCAPE_USER_PREFIX OVL_XATTR_USER_PREFIX OVL_XATTR_ESCAPE_PREFIX

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
