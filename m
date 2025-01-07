Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB2B1F4289
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 21:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736284535; cv=none; b=f1Gi+SctGIG2KgVFS83Gn+DVGTYQ9d/DJV0wJYR92OHr5PPPypp/oLQt+NupriPtBrkBq7rW9odn9/CZ0Un+z2JTnhRAByUBolO20IfjJAXXUWyoMVRvMBXHw6VCN3ma3MAe9DoSW82fw8pBbgurs7uxZo2KSd95hHMXjPDrJXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736284535; c=relaxed/simple;
	bh=cr1vmsfIKiogrB8nlfWHRnkT9e0s/hDlv3PcQauCWfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bdLv/HbLsFAxzibiGfPPgZ+2Rl/WN3dJ96zlimjKsjegGXqNVHE04Hzfy5mp0c7iV3Ll2nEy2ZSEuCHK6x+R1Yg+liqYyiD/LElZJB/15+++P8NoDgJEDh187BtJTYojbph0BjhLz9TADW+eQBi69bmVsvhrTw2t8Xyn85h+tQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+qPjpSu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+qPjpSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736284533; x=1767820533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cr1vmsfIKiogrB8nlfWHRnkT9e0s/hDlv3PcQauCWfo=;
  b=Y+qPjpSu1d3lrAE46XeFUE4vNWboRH+hGxsMYrHb0W1bO8O7mxWl92gl
   OfBCSVZn/BKrovQ2H7vsN6q7rLACpSfYViZVpG8FEDA/Yd4/YwqydnBNt
   U8YKujIObgJCJJ0YLCl+U+3t4mGtp5g5IC92/+sZ95igklkpYa+KGGYK4
   pojyrb04gx4eGtI9xUYY3rb3K5dfGaTM523F67IcbSzo5Bw378yqC00jQ
   psGHa2ifP0su1llWmAVK+j0vR+Dl/LAOta7CFVBGdeWFgfLLgY+nCWhG8
   uqVfjOHwVHT4b5zKZo34qTGT+TYW6DLVF8Zvx6Ly05ta7PYZuS2A800R5
   w==;
X-CSE-ConnectionGUID: WstT0eudROqQ1nXY/bra2Q==
X-CSE-MsgGUID: KlEjAqDkRuiGy6qnnDt4HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36651875"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36651875"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 13:15:31 -0800
X-CSE-ConnectionGUID: L67Bm+/QQdG/5onqs5wqWQ==
X-CSE-MsgGUID: K8+okcYjT6i3BKQJ68YigA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="103400491"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jan 2025 13:15:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVGvA-000FEd-1E;
	Tue, 07 Jan 2025 21:15:28 +0000
Date: Wed, 8 Jan 2025 05:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 8/20] error[E0425]: cannot find function
 `em_dev_unregister_perf_domain` in crate `bindings`
Message-ID: <202501080527.kSFmEKUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   497d0dab0af034c34b987f1b37db1df4c45a1b7e
commit: ad3b4b81d2fee32501e59d50c1efdd574b289211 [8/20] rust: Extend OPP bindings for the OPP table
config: arm64-randconfig-001-20250107 (https://download.01.org/0day-ci/archive/20250108/202501080527.kSFmEKUu-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080527.kSFmEKUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080527.kSFmEKUu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `em_dev_unregister_perf_domain` in crate `bindings`
   --> rust/kernel/opp.rs:425:28
   |
   425 |         unsafe { bindings::em_dev_unregister_perf_domain(self.dev.as_raw()) };
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
