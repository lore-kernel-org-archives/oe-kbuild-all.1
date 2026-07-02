Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2649A2E229F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 02:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782959604; cv=none; b=BOoB5FzoWHmr2Aasv9C0mHvpJXPQNddN65xskOchFm04m8jtMRyIZhEAGKlyqGxdRS/jJSHWtqRb9IKO8RgqvTcFh3RyAR5+vaga5hqi4RFIIQKy4LVDSLH1C1Ns6PcDlnphVyme2IVElfWixOKUO+5dBaztw1KYG3pPHsdfN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782959604; c=relaxed/simple;
	bh=HdtGxyiI6pCC+R6MEXcTW/fQA9bWwnhzhJfgfs6ZxLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y6+kEeNwJ5qI1dOxtU9loaxJ92dxecRfrOishdYF/dRPv44fDMI1f3nqm6AnzdRrBIE7UZI8xc33i2qq8h4Y/ibUOP+hW29PIs010/27/i18Q7qLGzv6dmSoGYIhyX2bRsQ+AqAWfWk8vjFz7JRE+d6GPyR8Xu9WNOL3JbCYiwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftErsiN7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftErsiN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782959602; x=1814495602;
  h=date:from:to:cc:subject:message-id;
  bh=HdtGxyiI6pCC+R6MEXcTW/fQA9bWwnhzhJfgfs6ZxLM=;
  b=ftErsiN7E+jTt380LMIVYuXTUYf9usNPmGKx8SfgrFapLAmdukEYJ4Fa
   dUrB1/70o5K95epPYrEIxlLwI8NXfF9V4xRDtCLtLcyS5A/ChK/bZR5Vj
   LDduyzV9HDAseaCRhGnABmw9Sj9PEk5QTSZf7NO/4ozyaMPSz6pfbqJSb
   u5EG4BoMMPBJ6mB5R6PrOzyp6eCDseeZm5jv0R3xRQG9CvBBwHgkfOdfE
   L0OheCps/HYo5y1asblE5D1/IyzPm+ZN0MfSUG04tHBJFxSOT4NJjch7+
   grnOw18+HMYbdDf8e/12vEFSjs7Mu+Ctlux0YJ2JyYZncJqtGLMLStKJ3
   A==;
X-CSE-ConnectionGUID: f1Rkpp3gQkWpwMxMATsHXQ==
X-CSE-MsgGUID: ooI6ISblRvS+tsZb/vem+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83570912"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83570912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 19:33:21 -0700
X-CSE-ConnectionGUID: ZRQvYzcqTZmra/3Ew6A5FQ==
X-CSE-MsgGUID: DOgA7unnTR2+i98UnhLd1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="275936137"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2026 19:33:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf7Er-000000009sN-1Mfu;
	Thu, 02 Jul 2026 02:33:17 +0000
Date: Thu, 02 Jul 2026 10:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 0/1] Warning:
 mm/cma.c:288 function parameter 'gcma' not described in
 'cma_init_reserved_mem'
Message-ID: <202607021056.IL1BencB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   1820d6db23bfd13e77fd48752705da1ea203d091
commit: abb7c88dc2ee1567f73d54212320789301304f3d [0/1] ANDROID: integrate GCMA with CMA using dt-bindings
config: x86_64-randconfig-012-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021056.IL1BencB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021056.IL1BencB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021056.IL1BencB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/cma.c:288 function parameter 'gcma' not described in 'cma_init_reserved_mem'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
