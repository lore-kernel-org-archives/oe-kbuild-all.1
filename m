Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A9E3A5E98
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958632; cv=none; b=MyRECvfpqDEzpeaCleJXW/jiQNeNudrspZvwo/Nuh6CuLd3vy9KCbepHOrOFiN3sLtARXmw07QO9BVMU2stxfqivNi/0ti7eOX5oKBd+D/VfkaVxSUC72SqsEC1AcEcohzHKFohnH/Vrwnpt03xZ2VLEtzf/tJGI7uM/U66RRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958632; c=relaxed/simple;
	bh=iTmldjzq+hJROY+fR4/MxiSDENsrP2b8KZtPosHbLUI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VahAoRGaZwfX8w3+27jLU77KYaY/lEGjIMOkVNZHM83AnWELMYO34EQh6SlqXZ974akZtJuAWJtQQABeKxIMDyuerhB0kmXKyPIrD9B1sSsQeRcu+HVEGP9nwW52dasT9qrMttjqeXyYDgz1xYDS8OIAhxMyopTZevNkwLxjkUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5yOBt9Q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5yOBt9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774958630; x=1806494630;
  h=date:from:to:cc:subject:message-id;
  bh=iTmldjzq+hJROY+fR4/MxiSDENsrP2b8KZtPosHbLUI=;
  b=V5yOBt9Q336wenaQWQ5msGQXzL3itVVv5soL+eOdV+EW3QEXJRPmc5We
   IbUzWK7oJSawj5l7AVBk67+v6puvGAmJI3TbE7CgQWEQ27IHyd0JBlyT+
   fRuGfblEXMGpcWFq0eZkU59kmdvCJEP/X2iOQuwBwHkN7XjBnF99zwzoj
   RVXHBhHeq9BkY0ub7TXxu8oCL5QXNT+uJnqYz0ze948uu/MmdSo/EldUt
   YrmwIRTMHaHHMR38HjxADdaAO6g6u6M6MAQDBaHYKGhS/sSikKVMFPASk
   4DhAjEuW3Wu/mUsGSOWNUSCPDoOLM514ZuhOUVcQFEG7NERbXmwIShw32
   Q==;
X-CSE-ConnectionGUID: CgXrVrFWTmCg8U9u9MoQlw==
X-CSE-MsgGUID: tq+mGM1AQqSxB6FmIDAL7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87360423"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="87360423"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 05:03:48 -0700
X-CSE-ConnectionGUID: kN5bhNymR/ere+Qlt83WRw==
X-CSE-MsgGUID: fyN8KNtJRMOpBg9ahDofEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="264284270"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Mar 2026 05:03:47 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Xou-000000002az-0Bmg;
	Tue, 31 Mar 2026 12:03:44 +0000
Date: Tue, 31 Mar 2026 20:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202603312028.yncxmWGs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   702185a02153105e701b2ba6f17ec5384cafb6d6
commit: 453cb76c605cfc3405a95bee4888782c7218b92a [2/2] ANDROID: mm/memfd-ashmem-shim: Align ioctl handler name with Rust version
config: arm-randconfig-r133-20260331 (https://download.01.org/0day-ci/archive/20260331/202603312028.yncxmWGs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312028.yncxmWGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312028.yncxmWGs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/android/ashmem-legacy.c: note: in included file:
>> drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS @@     got unsigned long @@
   drivers/staging/android/ashmem.h:19:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS
   drivers/staging/android/ashmem.h:19:49: sparse:     got unsigned long
>> drivers/staging/android/ashmem.h:20:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO @@     got unsigned long @@
   drivers/staging/android/ashmem.h:20:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO
   drivers/staging/android/ashmem.h:20:49: sparse:     got unsigned long

vim +19 drivers/staging/android/ashmem.h

    17	
    18	#include <linux/shrinker.h>
  > 19	static const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
  > 20	static const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
