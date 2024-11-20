Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151182F2A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 23:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732144016; cv=none; b=IDlHyjH8D0X0OmNC5IlcljAT+PCdJTR0Xd72sq5UBDY3sYBVIRdfQ6kMhvlmJjQmJfZWBh90HMzOvRXEukmADoipJpTv8Agr8n+okKwjY+0UR7sJHYNshlFjprWBJ1Qra2YxKqgka63wkSp+ghPcEt7ItMhNbcYnnWBIoZ0Pecs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732144016; c=relaxed/simple;
	bh=e3We/w7ahd6JxwUoObtUYgraHC2Adw+5pwAayJEpfzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbdEzQtx43EtWXyI451oN5bp8FZ/cdBsdxrmVFtfCPfPexZDBB/ojlirrP24Xue0bwqWdkW5cSzXcI5F46+S1nP5jCcjeqQ21qeBXqCFIA8nTLKENppDlcpoDWIPT53mkLZrpFMmc4WV361nLS52KY8FqpefzP5+CdE+bChGg7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHrXMj+0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHrXMj+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732144014; x=1763680014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3We/w7ahd6JxwUoObtUYgraHC2Adw+5pwAayJEpfzI=;
  b=FHrXMj+0rKleMyct0uwGRLwsBGuRxKYQlHkpUnK/ZHJj8QSCt1MuPN3x
   iHtRz82JGkncAi/JDUmUUtM4alInDZ6EeigIdl3GLNhCS45OsalO36ARl
   G0uhJm15RhH+8cv9M+Q+AnrxGJYHXk42Fz82kZJ2kWiwPbPc5clwZb2Te
   Bfo25u3P3DnwDaH2nGEC7WVlyTncCAOp1wlMlZGoup3WvwOgfuUEU8rTj
   syvdgMp3BUq5Owbs95zzDjbdGkgT6wa5yyfRnYfps6LaWA143Bt8FiFwP
   ltoX9B+yGZIlaz94886TQG0jxFnAB+bDhHRo/xn8DEW5mE6sMkWVwRTBS
   A==;
X-CSE-ConnectionGUID: B0ykKZETRoWtcsUiTnvHWQ==
X-CSE-MsgGUID: /SP6BXSvSmyCYglu+k0UTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="57628737"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="57628737"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 15:06:54 -0800
X-CSE-ConnectionGUID: 9KHsT9zRSi+t/NK00B+EXA==
X-CSE-MsgGUID: QAtELuGsRESUpB20umo1qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="90225169"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2024 15:06:52 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDtmc-0001Dz-1o;
	Wed, 20 Nov 2024 23:06:50 +0000
Date: Thu, 21 Nov 2024 07:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1302/1302]
 drivers/nvme/host/core.c:1163:27: error: 'compat_uptr_t' undeclared; did you
 mean 'compat_time_t'?
Message-ID: <202411210730.g3bmaj7Y-lkp@intel.com>
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
head:   f49b713adeb7d09d40da433b7700b1666a7d6e32
commit: b8ba22a604e4d0a3ad8e23af22f432e12b6f1a65 [1302/1302] nvme: fix compat address handling in several ioctls
config: arm64-randconfig-003-20241121 (https://download.01.org/0day-ci/archive/20241121/202411210730.g3bmaj7Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210730.g3bmaj7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210730.g3bmaj7Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_to_user_ptr':
>> drivers/nvme/host/core.c:1163:27: error: 'compat_uptr_t' undeclared (first use in this function); did you mean 'compat_time_t'?
    1163 |                 ptrval = (compat_uptr_t)ptrval;
         |                           ^~~~~~~~~~~~~
         |                           compat_time_t
   drivers/nvme/host/core.c:1163:27: note: each undeclared identifier is reported only once for each function it appears in
   drivers/nvme/host/core.c:1163:41: error: expected ';' before 'ptrval'
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
