Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27D2149DFF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 22:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743288154; cv=none; b=Yz4cgXp0aCFcLC/1xF/9uw5Ey6vBRoCmJClO6ZMkzwppyk7SCQ+bG9KaH+eL8ecOHsEbFqYYoLi1YydrCwqzNy2rYZqyEk6hWNW6kL5GEqktLM/VcZJ7dZf62IM5Q3Ce0f59a10Fm44BM1TfgGhLlSTYiyCs9T7ETfIJkzxPYTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743288154; c=relaxed/simple;
	bh=5F7PLCycf8m26vkR9hMMvu+BSgLkQRrHLwUuxrnyZQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ls8NcWZWX5nmJ/PK17TRSGyMBiraHCHGmtpVNNxDUz+vkVpN6osjtusLkrOtDuysD0lmXAcmJvXaSWnIchUvy7H4PiWofHAyKFqdfLFZViDz35MqbJovohqD2MIlCqp6SowoZfchjxm5HJLcd5GO3Cw7FDKVkJqNYEDaxlm6OaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPr8zFkP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPr8zFkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743288152; x=1774824152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5F7PLCycf8m26vkR9hMMvu+BSgLkQRrHLwUuxrnyZQ0=;
  b=IPr8zFkPoi69lj5/GW7OJlF2brOzkWd8P1fEh4bLvXfVTPxPnaJ2v7sW
   HXcCkQ5Z+Hs1GYzPD3TU8MHIhlP3xJyf0XiojTXgaKv2IbYyWiv1tK4E8
   xM59ooiSRjju831VUpBxe1i3hhDnsmKGyIPKvZi7DHcEm33Lb3WSnB9yh
   jDl+4DCiRkBcd2jluxkI3fRgT06hk+Vp+IQEVw9qDlzciN0SHBWHgAoqn
   tXoDOEf6Znqe1p4w4VtEnX47Mv9KADOBTyuYb/5bEXcXMKfUOFLzJH0Sf
   sVDFmdjaxFt/+bozJVA23TVaOZ0vgDb5b/FdH/MeT13QbqyV0xBL4k7EY
   w==;
X-CSE-ConnectionGUID: aT3gb8bfR6uYWX8ox3GbNg==
X-CSE-MsgGUID: j5scXybNTYCXt1u1aAoNUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="48281292"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="48281292"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 15:42:31 -0700
X-CSE-ConnectionGUID: f1PAU4HzSCKTKZos8QPROQ==
X-CSE-MsgGUID: gwuN8ddzQqOH0QhN5QQaeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="130595593"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Mar 2025 15:42:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyesl-0008P8-2k;
	Sat, 29 Mar 2025 22:42:27 +0000
Date: Sun, 30 Mar 2025 06:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1531/1531]
 drivers/xen/events/events_base.o: warning: objtool:
 xen_test_irq_shared()+0xe1: unreachable instruction
Message-ID: <202503300608.WYcT007F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5b56c883c34a890a3f9ca7baa8aea426538c88a8
commit: fc0f59c16e93291923fcebd942b78c9bddfecc56 [1531/1531] xen/events: avoid removing an event channel while handling it
config: x86_64-buildonly-randconfig-005-20250329 (https://download.01.org/0day-ci/archive/20250330/202503300608.WYcT007F-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503300608.WYcT007F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503300608.WYcT007F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/xen/events/events_base.c:1697:6: warning: no previous prototype for function 'xen_callback_vector' [-Wmissing-prototypes]
    1697 | void xen_callback_vector(void) {}
         |      ^
   drivers/xen/events/events_base.c:1697:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1697 | void xen_callback_vector(void) {}
         | ^
         | static 
   1 warning generated.
>> drivers/xen/events/events_base.o: warning: objtool: xen_test_irq_shared()+0xe1: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
