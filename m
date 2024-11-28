Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF913FD86
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732773572; cv=none; b=L30uVMd76pU/iGRlkGRcp1SgMdle4Edmmd3vOIgYxoqkgpJwHzQZ7UQZ+qumtbmMgNbxePgeJkG4pR35Yr1pzuQyMO9ZeYs6D5w/XWHaz9UqEC0t3AwOMHZx2wQDAyDRpddDbwNuW9GZRc9rsX14tj4ZQ42S9gQAQW0U1pozHcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732773572; c=relaxed/simple;
	bh=q1GzvE343c5KZJ5sIIzoAcm0aOw3w5xXzJDACqFNf5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VTbnEXc1/J5BKcz79Vg23o65/4ZGOO6GsTQrigZf2CH0Ym8Vt9tRP/9rbWsPNVu1KWiohaKUaTh0Iq6iQuaf7mSMk+WqkgyuPi1B6FndxLv0UA0lblhdgMLKOY1tCfyW008wveBk9gEcjL5ZJH8yzzV6EQexawT8xZWQcI2ieA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSfc7uT4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSfc7uT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732773570; x=1764309570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1GzvE343c5KZJ5sIIzoAcm0aOw3w5xXzJDACqFNf5g=;
  b=FSfc7uT4Jq9NHLgL0x9i6UhLaadMcMAG9W7cUdgJkjzuDG2BlXRNFT7U
   08Qtmo3TuKZ2/NaPrEBwtCR4xwhhlBQzZ0BmqRJkjloWIYNPiL8D/H5Ut
   1mpb1051jKCSBsKstJPV/grtXS0M84EiAnLwEr3MOtgrA9gELM5w6R7mm
   hGI20h8QeL1+utbigmDbAYoQZ3+GRCfzLPIGUn6dKI6etqS3waJ/VPz+A
   5gQIqz8gvwf7VnJblA5Xozl24++j5/2HSM6TaknuxiLdkZ5ieZMLZKrXB
   9dfO6pyTr506obQ07T559j2SjO+EcbG8rwB13+yPdYSwwWobynX4dw3YO
   A==;
X-CSE-ConnectionGUID: QsO3elx3S8ydH0LcJwNW0A==
X-CSE-MsgGUID: +ym5xSR8RnKpbdmQYn8EDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43662843"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="43662843"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 21:59:28 -0800
X-CSE-ConnectionGUID: B1FnG4/aQCG9UTx4hAw8Bg==
X-CSE-MsgGUID: wzYt4IYZT8micAH2iIkxTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="91751017"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2024 21:59:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGXYi-00097p-2t;
	Thu, 28 Nov 2024 05:59:24 +0000
Date: Thu, 28 Nov 2024 13:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1315/1315]
 drivers/nvme/host/core.c:1163:41: error: expected ';' before 'ptrval'
Message-ID: <202411281354.6yDNwxF4-lkp@intel.com>
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
head:   897ce607838618bcd783a6493748dd11891683fd
commit: b8ba22a604e4d0a3ad8e23af22f432e12b6f1a65 [1315/1315] nvme: fix compat address handling in several ioctls
config: arm64-randconfig-003-20241128 (https://download.01.org/0day-ci/archive/20241128/202411281354.6yDNwxF4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281354.6yDNwxF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281354.6yDNwxF4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_to_user_ptr':
   drivers/nvme/host/core.c:1163:27: error: 'compat_uptr_t' undeclared (first use in this function); did you mean 'compat_time_t'?
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
