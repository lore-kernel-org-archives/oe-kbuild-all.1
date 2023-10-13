Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BC723751
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 19:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5EhVUPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697226705; x=1728762705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SV9/5Fj9oCkiy7nqQS9sJGzsxatA3vRFmOVmBlFv8/g=;
  b=S5EhVUPxe9mTXethpByNNyC/kmHkJak0mBckbMIa8vUk9i4xegM/RH7k
   Pb67Co6gIIVHWdoSsveX8FOHUHtGjUj6TdEuPvjK+4GQKCU8hJi8NauZ9
   cRSyF15YBlUXqeKU1VpImU0o4jocHBzTQahU18ziTE7+y6PzNCxP1UKTC
   LiB+DOIRMnMo/hGITvbWB1nxEZdUct0iCn0POmrSTpdZqAq0CwUZRuIh6
   olLPAiGrhzHCDb+WXFJpm6D93gmdB+buRhXSgoMxIdGJWnt7ca2Wd7QTo
   cBnb1yTVNgGd7sDVVFN+nF54hbaa6CK3uujezcAfdT0OnC5P4FAn4h0OA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388103922"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="388103922"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704771269"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="704771269"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Oct 2023 12:51:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrOC1-0005KT-2B;
	Fri, 13 Oct 2023 19:51:29 +0000
Date: Sat, 14 Oct 2023 03:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next-6.7 21/644] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310140326.NmMbh37j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.7
head:   cd90511557fdfb394bb4ac4c3b539b007383914c
commit: 96182df99dadd4b59b7338b29bf45a90ad722625 [21/644] drm/amd/display: Enable runtime register offset init for DCN32 DMUB
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140326.NmMbh37j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140326.NmMbh37j-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#109: FILE: drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c:39:
+#define REG_OFFSET_EXP(reg_name) BASE(reg##reg_name##_BASE_IDX) + reg##reg_name

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
