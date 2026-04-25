Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858792D63E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Apr 2026 17:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777137664; cv=none; b=LPZWFL7IWCRCLfayLLFpi3FgC3fFxEC+p8foXTOA2qdfJVNdNeX2LFW5KJQxVaghChNRcgaM+B28XD6cOFYxTyXVEt32mseE2QZeH0RFzR/MMUngBnf9AfzkYUiG4c/iwUBT7CO7RiZHb2xATbf86ieduUGzZoIY/dXD4FYk6wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777137664; c=relaxed/simple;
	bh=wyJjEbqIIwEsPlHJFgfh+P2+gIYUqsaH7yDnJLs8J8E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUWB8YVMBdrkML0MZp6v1jOGOoM2MQWeIw7h+uOWuMAOtBiKG1hIvAQEdpNlyIbay1b6amZKEte2fK9h4XZOEi0ZyDS9kZBCpXUC/dFQ86A27NB5neza3oWC44QRHs9DFrdvIKgJcFzKFeMm0zSKyI8UlWgiyLJFAj3fN2AQVRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDSd3IyA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDSd3IyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777137662; x=1808673662;
  h=date:from:to:cc:subject:message-id;
  bh=wyJjEbqIIwEsPlHJFgfh+P2+gIYUqsaH7yDnJLs8J8E=;
  b=YDSd3IyAiKAt81xW0ioE173DWpjCNZ+AnktU72IMK0waqajCBD/+5nCO
   rVa9rMtR8uaJomkpVXWe+N0Wr8nJUgRZgXUzOCKZPmW0AWUKYxbg21mbY
   BGCo9qI0s6Vl4n7GaHeV0udQO5qfRi4ZjsIBGuV7jHQ4wcunONjCCkwKm
   iB28lPSpkVMhQObuvbAPiAsK2jSRwsrmVuihZPGWmpqdrJ2X8JzunJ3Fq
   H8kNzMFhh7t1b7NFZlzn4+tMyBj4qg8S+NcdFT2UZQL2UsRW0EY2h3uem
   qMJ2WVDS8Ka+J280RfQDVtbd6WFQWqReJScRqkGeROvsW0H3UrgToXhr8
   g==;
X-CSE-ConnectionGUID: esRrwbOfRlix4jqydZZMvQ==
X-CSE-MsgGUID: 30nz7wBST526osbIKtv0RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="77964698"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="77964698"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 10:21:02 -0700
X-CSE-ConnectionGUID: pld92s54QISojSi1EppUpA==
X-CSE-MsgGUID: SGhDo1gcRgqGkYxwR0Q6yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="237208196"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Apr 2026 10:21:01 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGggc-000000006v7-0W1A;
	Sat, 25 Apr 2026 17:20:58 +0000
Date: Sun, 26 Apr 2026 01:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: xe_survivability_mode.c:undefined reference to
 `xe_configfs_get_survivability_mode'
Message-ID: <202604260130.CFnpoq5j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Riana,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27d128c1cff64c3b8012cc56dd5a1391bb4f1821
commit: bc417e54e24bc9c96d3c6eba2c8c60f7919e5afe drm/xe: Enable configfs support for survivability mode
date:   1 year, 1 month ago
config: arm64-randconfig-r071-20260425 (https://download.01.org/0day-ci/archive/20260426/202604260130.CFnpoq5j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9007-gcf3ea02b
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604260130.CFnpoq5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bc417e54e24b ("drm/xe: Enable configfs support for survivability mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604260130.CFnpoq5j-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x10): undefined reference to `xe_configfs_init'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x18): undefined reference to `xe_configfs_exit'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
   xe_survivability_mode.c:(.text+0x24): undefined reference to `xe_configfs_clear_survivability_mode'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `enable_survivability_mode':
   xe_survivability_mode.c:(.text+0x1c8): undefined reference to `xe_configfs_clear_survivability_mode'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
>> xe_survivability_mode.c:(.text+0x494): undefined reference to `xe_configfs_get_survivability_mode'
   aarch64-linux-ld: xe_survivability_mode.c:(.text+0x4c0): undefined reference to `xe_configfs_clear_survivability_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
