Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B4820013E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037820; cv=none; b=g1i6gvXAfFmtP5nc43clpxV+WlDYorIO1Mpyv3IAPJ6tZ9yMnmPPLGff5Hm00cbNdWODG7wdNMQnBO+oxFmZRrYZu0VVDwgOEDEqswIeid28UnVN3W/dZxF2nAue20hMj6hNQ4t7oUgGLKivo3Hij1xH1NIzliC6G0YAQmi0kNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037820; c=relaxed/simple;
	bh=FGJgBe4Ycg/er2YIWKnZmCVgm9IpFLCV+zj9uRvyV9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XzSdb/DtEGvIxNiKNyEazhCpC95c4AzM8S8XQ1k2gWCAtaqFbqRV6uVue2+ZYzHPffI7QY8PhZMoM7Iai/yC0pjThwE3cvtIZBIaV+OzW23jbRNKCcvxpG2gE9oG//8rRCqOye8V3Cugl5AtqKlebOkVIUXjQDtYffCIMu2iFPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoAB7TPV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoAB7TPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723037819; x=1754573819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FGJgBe4Ycg/er2YIWKnZmCVgm9IpFLCV+zj9uRvyV9c=;
  b=UoAB7TPV8j2X5/KbobhVkVh8ynnSde3iRmg0HEoGROsywHCAhw3jWM34
   LJ/k6cC4UsUEyA+OPrsfjJScBixL26v8H/nqKf/HooSAf9EvZ0nW/tG3B
   k1gc4v/4iq1jlYrgp9QaiV4KfypbWxxLQ5Gxi2juUMaFDQBo1ptT7qSI8
   ZwN4MAtD/W4q8u0Ce4cCwSbYCleRfMhlATdMt4TUiPxYm2g0P3Lv07gRA
   lOFPa+PaO8GEEsz5bkcJFEIHj4VDis/kuD9CUHzQ+tgfNMzQhfHGgET/d
   ItyH+EKTF01wB6YgaFWta+llIHZAo7h2rU1+GA9IHqZT5G2FqU22mluEL
   g==;
X-CSE-ConnectionGUID: uI1lNySXT/CzRNw1Qu/wUQ==
X-CSE-MsgGUID: CTMpXdJXRzqMAT0ufDxTmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31737317"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="31737317"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 06:36:58 -0700
X-CSE-ConnectionGUID: 669sEBsMQZeQ4h6dc03R0w==
X-CSE-MsgGUID: ApEA8L6zRNyDhQmlx58Uww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="56819218"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2024 06:36:56 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbgqT-0005Pk-2U;
	Wed, 07 Aug 2024 13:36:53 +0000
Date: Wed, 7 Aug 2024 21:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Chengchang Tang <tangchengchang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Junxian Huang <huangjunxian6@hisilicon.com>
Subject: [leon-rdma:rdma-next 4/31] ERROR: modpost: "zap_vma_ptes"
 [drivers/infiniband/core/ib_core.ko] undefined!
Message-ID: <202408072142.mVX227UI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   dfc65296d0d188b72b143d07c57af61d1595cfb8
commit: 29df39ce0a64f0d51eed84e7d378ddf5cfef6a3f [4/31] RDMA/core: Provide rdma_user_mmap_disassociate() to disassociate mmap pages
config: arm-randconfig-003-20240807 (https://download.01.org/0day-ci/archive/20240807/202408072142.mVX227UI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408072142.mVX227UI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408072142.mVX227UI-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/ch341.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/navman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/qcaux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-serial-simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
>> ERROR: modpost: "zap_vma_ptes" [drivers/infiniband/core/ib_core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
