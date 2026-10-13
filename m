Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B7C2853F3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877161; cv=none; b=YfjVxOSRV+DUCtcoVS6tizOetWfdJfKyuLDVx8e4JRLXp9nVb7mY1k6a3xOhnfXnIIE+eYDINxpMDQ15XjHiCH9Nzc9SimZlqRQSWjyC4a/Rzxq2b8qMsEB10MUQxAaXMy2fOlZ24aTTr/z1Ro3kY2mi8e0fRtLMoSgUj5sBBLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877161; c=relaxed/simple;
	bh=KCEHCUJpTBIv5+8QHyFwZO1Y1jWVRw8WmkUNQWuAXx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BUWq+00uNwMDE7nyr61QCCbmt03gU1/3mEt4rz0OB0JQjAZinsyyzJDHuLV996f3KsfdFcwDJA7UbkVBFmAEpkXS+Wmg+MXMVL8IK4N+Hcd/itoWzwsxHtue6wdqOgWeM7wgklzoLlLLDR08rc6xjhZLQTLVr0m+rgDMeGdZyh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMLc0gl5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMLc0gl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791877160; x=1823413160;
  h=date:from:to:cc:subject:message-id;
  bh=KCEHCUJpTBIv5+8QHyFwZO1Y1jWVRw8WmkUNQWuAXx8=;
  b=RMLc0gl5G9Sy/9VRfJq5PQrjpPspXlos7Xv3JhhyXqpnr+BJcOyS68pN
   Umt7lp40d6eyi76ppmcGE48CHh9klX2zcnHffOh1+XgjAnHGrf1JrRXXd
   p2OtW5PtxOrhQhLlI6h026PYakn6TB5ZymIoAOVRTHCIhiPlxVRd/JQnD
   ujlbKc8W5YiGI8r5p+ygsdDtaGLDyl6RdPhKN7dca1bnwN8v3nvZw7fu1
   pSWpE6BTSK3JbXxIpEQ4CbZF8AWsqWWVgOUz7sKRPzxXJpnuTqpr3fw2X
   uTV5V+PpApm/VLKlVSDd/YCvXxMEcH6NSGXLAT1+pRFtNOpnkoPhdyrk/
   w==;
X-CSE-ConnectionGUID: QXY0DLRWRuiQne0q+MEQBA==
X-CSE-MsgGUID: l5aMti/sRpqlx/9Rf3ohdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="587836"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="587836"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:39:15 -0700
X-CSE-ConnectionGUID: WIy40jqDTUq75nWN99DmXg==
X-CSE-MsgGUID: mtZFhZmYQ/iNbcKv3pv3YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1074848"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Oct 2026 00:39:14 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGX6O-00000000CfE-0L1Q;
	Tue, 13 Oct 2026 07:39:12 +0000
Date: Tue, 13 Oct 2026 15:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:spinpark-arm64 16/20] Warning:
 kernel/liveupdate/cpu_preserve.c:1370 expecting prototype for
 cpu_unpreserve(). Prototype was for cpu_unpreserve_adopt() instead
Message-ID: <202610131556.EkpObSny-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux spinpark-arm64
head:   c36bf9732ee79ac6311b2168966b2e4cd92688fc
commit: 1de6380dbfdc8ce823da28a9e901153315b6be34 [16/20] liveupdate: cpu_preserve: negotiate reclaim by adoption
config: arm64-randconfig-1001-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131556.EkpObSny-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131556.EkpObSny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131556.EkpObSny-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/liveupdate/cpu_preserve.c:1370 expecting prototype for cpu_unpreserve(). Prototype was for cpu_unpreserve_adopt() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
