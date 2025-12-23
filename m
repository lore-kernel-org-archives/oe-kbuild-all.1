Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1BF238166
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766477907; cv=none; b=Vor7fTR77lQ5xrVVUbBrJY7RI0uX8j5p/PAQhEWaX85nZ6Irwt4gSM2+kK44NiXnisYxtRFcspPi+TGjiSSzutD7Xl7/BsTAH8Fhhms9tRep35PCBZPlyePSJgWbtsjfkvBBe8erNcaDm/P1eIYuPyZrNq9LWJl9fYAu0sHNVCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766477907; c=relaxed/simple;
	bh=i5FH68A9+NmIswcKfbkqVtfjqw/t3/Ghx8GrT7XaGb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oFWsAdRG29K1OZmKeaiwt+XgsI+0vTJ1fhdSx5s03kldkgkYsjB7Jm2MLsSypp8P/9qtabIFY55Z4Ga0ElBEAslGn1GLK3gvkbORx0w4D0/X6IbyfXwPof9Jcp00h9eykLVT8XC739ZfXvgS74f0w/QvRB/pXHpYTtcQGsCQcbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbECjQj7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbECjQj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766477906; x=1798013906;
  h=date:from:to:cc:subject:message-id;
  bh=i5FH68A9+NmIswcKfbkqVtfjqw/t3/Ghx8GrT7XaGb4=;
  b=CbECjQj7pewWJeq8x1AwA1hou17gRwLhIRn8vCCl2KWCC/Js1eX0X+YP
   uyqGJW14WyvduBe5Rqct9XXntvE1Td7wyvqCyGiTeUbJMsQ4skgJ9jPIj
   AhXRLqXtGdbpOWr/cpxX9dcvGkukVyGrzNT4CEwJvr8UDWUMZZDJOOhwb
   +0/KGygN3HLggaij/MQB0kLsevioGS3AjsRitAsRXmYD5lhF13YFcexb6
   Dx5ubMWUurRBxcroQLNWAioxlyWone0X5UcvS3wBtyHjEnG5BAMwiUKHv
   7Xu+eF+Me+esyTRltjZadg/a/6s3Wvc6COtFOJfSKbZG1DqPdLu2uiIIo
   A==;
X-CSE-ConnectionGUID: 9V2E5pEBRkmt2bxVcD7gcQ==
X-CSE-MsgGUID: 5DHEK04MRJi4A03xKTrOgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68081847"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68081847"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 00:18:25 -0800
X-CSE-ConnectionGUID: cryWewpqTUeFkTpch7O6nw==
X-CSE-MsgGUID: QO7q/UMmSG2L1AiV/b5YaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204224580"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Dec 2025 00:18:24 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXxb3-000000001dd-2T7Z;
	Tue, 23 Dec 2025 08:18:21 +0000
Date: Tue, 23 Dec 2025 16:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 46/46]
 drivers/usb/cdns3/cdnsp-gadget.c:156:16: sparse: sparse: cast to restricted
 __le32
Message-ID: <202512231645.QE97S3sf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   cb7f87cbf542550ff3ab5312b66ad42c860708ed
commit: 0554dade57dd6d657eba7303b63a8ed93498063d [46/46] usb: cdnsp: Fix issue with resuming from L1
config: x86_64-randconfig-r132-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231645.QE97S3sf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231645.QE97S3sf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231645.QE97S3sf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/cdns3/cdnsp-gadget.c:156:16: sparse: sparse: cast to restricted __le32
>> drivers/usb/cdns3/cdnsp-gadget.c:158:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/usb/cdns3/cdnsp-gadget.c:158:16: sparse:     expected unsigned int val
   drivers/usb/cdns3/cdnsp-gadget.c:158:16: sparse:     got restricted __le32 [usertype]

vim +156 drivers/usb/cdns3/cdnsp-gadget.c

   140	
   141	static void cdnsp_set_apb_timeout_value(struct cdnsp_device *pdev)
   142	{
   143		struct cdns *cdns = dev_get_drvdata(pdev->dev);
   144		__le32 __iomem *reg;
   145		void __iomem *base;
   146		u32 offset = 0;
   147		u32 val;
   148	
   149		if (!cdns->override_apb_timeout)
   150			return;
   151	
   152		base = &pdev->cap_regs->hc_capbase;
   153		offset = cdnsp_find_next_ext_cap(base, offset, D_XEC_PRE_REGS_CAP);
   154		reg = base + offset + REG_CHICKEN_BITS_3_OFFSET;
   155	
 > 156		val  = le32_to_cpu(readl(reg));
   157		val = CHICKEN_APB_TIMEOUT_SET(val, cdns->override_apb_timeout);
 > 158		writel(cpu_to_le32(val), reg);
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
