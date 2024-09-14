Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC8D76046
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726309138; cv=none; b=HQritW/SJIKxBxphETGPbIJlrN0RjzUHAPj0hU8Xw9lcncnIBwgqK7BGO/OArfSHwWrvm1odJvhvE6I3QjlqX1don/Luv/Mb5VdcvCPYOS2EPc5LPxyucPDvFlwjOz19VDlU4N3CyHcI1OhQVUmdqmExClz/pPh4CBrYhLutC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726309138; c=relaxed/simple;
	bh=hMP+CztSwJDtBEifZT8Fzu/6kRf4wSNr+3Hv8tLnP+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IaFaWsLMgRWo5NcUW99D1TZztC7nrayUjXuOytdE+m888Wt+AhQoMgZApXMVtRp9xIczLgSPUUHSI12qUAc9N0EO9ChzsOmHS/zu0hAkde4f0t0t+8PpX6cLZp1k1MHpEEqXHbG4GVWf6YyXf2cNYD6eekYUgDZT3UCwM3BmsIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUPex1Mx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUPex1Mx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726309136; x=1757845136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hMP+CztSwJDtBEifZT8Fzu/6kRf4wSNr+3Hv8tLnP+g=;
  b=WUPex1MxkqoRt5oWKUNmyH8YpElfCypUrGKrofp06B2fhcmaBd/QJYVP
   9aAsL5C3suSVec7LCOfQPEkiwF1z5TxsXmTf2PtWBrqkJAvC04RPvK0/c
   DXFokwenG5JJ/LZzRQoSurBYI8YsX8g97sgM7vbsEn7sIhB8jMxhU/nUj
   DcQHxf0HqeXGNF638gkPiHKSIRKU8D49JEolWHgtlaht4PF8WQIYd6/8L
   PGUhH9oaSBiDG101Hto9ZavRvADrFzbQxJj4X1rbRL2w3XtxZiUk6WUky
   42A+D47/Vzg6GRuJ6oo/JYmuH5yet7lQPh2dDAkvycixWCJUhmckSVS8/
   g==;
X-CSE-ConnectionGUID: Zj+huT1hRZuhmR5WU9yaQQ==
X-CSE-MsgGUID: /DPkw9kTRyaRuO0aMzxhYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="42686513"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="42686513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 03:18:56 -0700
X-CSE-ConnectionGUID: i1r1mulKSliAvTiGZ2UX5w==
X-CSE-MsgGUID: xlb1JNOdQP+Lcard8pR15Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="99038810"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Sep 2024 03:18:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spPrg-0007d0-0r;
	Sat, 14 Sep 2024 10:18:52 +0000
Date: Sat, 14 Sep 2024 18:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17239/23714]
 drivers/nvme/host/core.c:1163:27: error: 'compat_uptr_t' undeclared; did you
 mean 'compat_time_t'?
Message-ID: <202409141821.nKd5ypu2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: b8ba22a604e4d0a3ad8e23af22f432e12b6f1a65 [17239/23714] nvme: fix compat address handling in several ioctls
config: arm64-randconfig-003-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141821.nKd5ypu2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141821.nKd5ypu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141821.nKd5ypu2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_to_user_ptr':
>> drivers/nvme/host/core.c:1163:27: error: 'compat_uptr_t' undeclared (first use in this function); did you mean 'compat_time_t'?
    1163 |                 ptrval = (compat_uptr_t)ptrval;
         |                           ^~~~~~~~~~~~~
         |                           compat_time_t
   drivers/nvme/host/core.c:1163:27: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nvme/host/core.c:1163:41: error: expected ';' before 'ptrval'
    1163 |                 ptrval = (compat_uptr_t)ptrval;
         |                                         ^~~~~~
         |                                         ;


vim +1163 drivers/nvme/host/core.c

  1154	
  1155	/*
  1156	 * Convert integer values from ioctl structures to user pointers, silently
  1157	 * ignoring the upper bits in the compat case to match behaviour of 32-bit
  1158	 * kernels.
  1159	 */
  1160	static void __user *nvme_to_user_ptr(uintptr_t ptrval)
  1161	{
  1162		if (in_compat_syscall())
> 1163			ptrval = (compat_uptr_t)ptrval;
  1164		return (void __user *)ptrval;
  1165	}
  1166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
