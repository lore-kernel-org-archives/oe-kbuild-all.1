Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC02C81AC1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 13:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727099071; cv=none; b=YXs0PRzb3xioow8ryS9Z1geuCeiWuaHKlNmAoPSkmR5o/Ygf60fwl3K7nPi7iaEv4R9xzuJhM2Um7BWgYhqOmMewAyDdSWMRx0VfH/kFfwWLGakMMuECSCF5mbKJtfUiP/XNWaPLG9Bj+cJ2JXrTe9QOQjeX/fCW+CDcjxPZE+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727099071; c=relaxed/simple;
	bh=C96BURUduHntbhFCAcCm2+o7agMIB1jAFupxjtszEF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IDwO00rIpC3w6RLO0S7N+Bwl7EmVz+DMfyrMHyM+cGmiuoI+qv/pNSV4BnHPRGf3w+8TBnmlCdws82FN3gG2gq/KON05lUjWdOufWdpTJLT3iAEj4chOaHouC+cPP+3KJSDuhrF65b8PWGyKnTNPbF2A9CNHmT3iaR9aoSdwApY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMLYVzJ1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMLYVzJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727099070; x=1758635070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C96BURUduHntbhFCAcCm2+o7agMIB1jAFupxjtszEF8=;
  b=TMLYVzJ10AddIfHs/TF5Zw5IpL0JOQ/4OIaWCNh0feR6U+0FVemmVQyD
   KJ/O4Z2NXIfk24WSsiVk+rPT57aXKaHbAqKZKfCKO2inJsB+V9WGNlfBR
   ZFvmueOKY0bsMnNABF5jRDonl8ZYzqAtM4tKZaCgMCp2CloFQzx+8d9pG
   5zvd7C99v1Vns7NsC8oF3uJ0X8UiweO/zDez3vuX+w+hw9AbMWACbJLcE
   c97YL1ejUANBD0UxQj6nCpxfa4j7sxeXUVeWuG2Gd39jlwYgakURTJj90
   PuxndU23ZBRkMfw8+jOvO5SJGtpFw9DgAmJ3UncV0jW5QGSpSWIMdzCpw
   Q==;
X-CSE-ConnectionGUID: Y1H6bGQ1ShmxEZqVr3sXYw==
X-CSE-MsgGUID: 762PtEFCQdaeMhBV6cxILw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26201581"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="26201581"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 06:44:29 -0700
X-CSE-ConnectionGUID: PF9PDxvPRMS2TJuOEY9Ndg==
X-CSE-MsgGUID: I8isAP30R6upXxo1vwwpuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="70655690"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2024 06:44:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssjMV-000HFG-3A;
	Mon, 23 Sep 2024 13:44:23 +0000
Date: Mon, 23 Sep 2024 21:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 855/2441]
 kernel/tkernel/ttools/ttools_module.c:18:10: fatal error: asm/sync_core.h:
 No such file or directory
Message-ID: <202409232144.jffc79o3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: a2f05eee2322746b8f40207fc13ed476c46c6171 [855/2441] x86/cpu: Relocate sync_core() to sync_core.h
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240923/202409232144.jffc79o3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409232144.jffc79o3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409232144.jffc79o3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/tkernel/ttools/ttools_module.c:18:10: fatal error: asm/sync_core.h: No such file or directory
      18 | #include <asm/sync_core.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 kernel/tkernel/ttools/ttools_module.c

  > 18	#include <asm/sync_core.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
