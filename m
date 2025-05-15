Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E4D4B1E71
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 05:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747288565; cv=none; b=RWHjSeYtm3RBvt1vK3pMdCTfKqoWoDUdaBswTNVBmDQtv6s7fOXZc57HlWCnrXY7hm5gTq2hMvGNcEhCmm91PEfBJwKIb+bWBZgyluc0mrVBIChdYMMf5JrkKyBAOX8Rdj055krA01bUiGJKVebTo3kQCiK0pH0E/Pw+l34ERic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747288565; c=relaxed/simple;
	bh=DmH85Vj4tqtS7ItLtYRHq9e7SXLb3oOAGTPz9ARivoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g5xXI8e5R/MbwGN7Eqt7SfGZjweN0VGnk8nfqt4mIp5dcQuy8jqdbKqzPdcxPgn2i1cvZhF4VLr45xaulKbND8Yf0g4aZT7fXDSHWHwCkDmOP4aUhZwUGG+/GBYPjc4MIsruhgmvyAMbXCAFoBCCWeK5VWTMpUVEpyGz6j1hsro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzpuhOFD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzpuhOFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747288563; x=1778824563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DmH85Vj4tqtS7ItLtYRHq9e7SXLb3oOAGTPz9ARivoM=;
  b=XzpuhOFDsDyhYxZt6opPEEoZkzYRpma5PljAgVpT2uPj3GCNRrRQgdje
   m0SStPLnmjFTpMMYnKNYqevTICs3qdKpcfvf0gVHpKjmTPPDn5CyozdLH
   uzETKz0J+MoDH0TWaA3qFzs/2wMrJI2vSsHgqrFy+1dwB2U6Rg2oUH15w
   uxomSMurXedoo2VkCWbGYdDYlQ0Waph2dMx9QGpa9Yc9RkKHKb/2+SBo0
   QnHiGsP6b72A0QmMmJtRujESawv4f70EwVs+L1/x2OKf/Xf/5+HqeV1mk
   T2+JptueJBhRVrnj0NHBdmhJc/OSKi30UEm5p6+v4cGW5X2ef7tBEwq3x
   w==;
X-CSE-ConnectionGUID: mJZUO2nCRG+/amVEF0R86Q==
X-CSE-MsgGUID: 8fuzMQnARvCzQoWNO49xtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48459699"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="48459699"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:56:03 -0700
X-CSE-ConnectionGUID: +3EbBQNcSDaClhvMeH8CVA==
X-CSE-MsgGUID: TQtlnzoCQ9Kv9OPS6aVJMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="142275027"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2025 22:56:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFRZX-000Hyl-2d;
	Thu, 15 May 2025 05:55:59 +0000
Date: Thu, 15 May 2025 13:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2221/2221] include/linux/suspend.h:36:60: error:
 expected ')' before numeric constant
Message-ID: <202505151330.oarlCuye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jianmin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b3779f76a7335b38d2bd7adfc80ff7bc31357299
commit: 1f46f3a128f21c190281c72cad99267bcc177e34 [2221/2221] PCI: PM: fix pcie mrrs restoring
config: loongarch-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151330.oarlCuye-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151330.oarlCuye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151330.oarlCuye-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci.c:35:
>> include/linux/suspend.h:36:60: error: expected ')' before numeric constant
      36 | #define PM_SUSPEND_ON           ((__force suspend_state_t) 0)
         |                                                            ^
   include/linux/suspend.h:341:34: note: in expansion of macro 'PM_SUSPEND_ON'
     341 | #define pm_suspend_target_state (PM_SUSPEND_ON)
         |                                  ^~~~~~~~~~~~~
   drivers/pci/pci.c:177:17: note: in expansion of macro 'pm_suspend_target_state'
     177 | suspend_state_t pm_suspend_target_state;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +36 include/linux/suspend.h

95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  35  
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18 @36  #define PM_SUSPEND_ON		((__force suspend_state_t) 0)
690cbb90a709c1 Rafael J. Wysocki 2017-08-10  37  #define PM_SUSPEND_TO_IDLE	((__force suspend_state_t) 1)
7e73c5ae6e7991 Zhang Rui         2013-02-06  38  #define PM_SUSPEND_STANDBY	((__force suspend_state_t) 2)
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  39  #define PM_SUSPEND_MEM		((__force suspend_state_t) 3)
690cbb90a709c1 Rafael J. Wysocki 2017-08-10  40  #define PM_SUSPEND_MIN		PM_SUSPEND_TO_IDLE
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  41  #define PM_SUSPEND_MAX		((__force suspend_state_t) 4)
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  42  

:::::: The code at line 36 was first introduced by commit
:::::: 95d9ffbe01fb21d524c86bf77871255066bc6e55 PM: Move definition of struct pm_ops to suspend.h

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
