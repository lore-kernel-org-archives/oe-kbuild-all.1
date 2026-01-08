Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FE51DF254
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 01:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767835949; cv=none; b=jUGU1oWlPVkDYK9sy8kUPXAhiF8YWiyyRrGeu9oxRCVczsIyC7dkBuhazvxCTHYNUhQsttxA3aeOr96Hw6cCsnZQpfsrwuRHMPtKj+2SH/qKIUn0WjxMwAOMhzC9cAhLUUU8QX0lTCBIKLsRlqOmricx6M9cvkFA7siY1IuNZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767835949; c=relaxed/simple;
	bh=pg9GDeIqX97z7E1v0NV6xMpSraa4aKKejqB0omhGAjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eyRdJ68ufupLPgWTkwvYMxqpJ/3Y5zNG94Me2n2q39JJiVzwdxmiLGz6EsNIGWdmKCgIvMoSAe7bsKCvHruFxw/s9OxGq3spPSXjuWTGsMLtllEi/vhQoNOSwoac/xh/11Kjnsub5or3+0P72Bj2xja1ddaetGa3kBsEObMPj68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZE5A9AwU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZE5A9AwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767835947; x=1799371947;
  h=date:from:to:cc:subject:message-id;
  bh=pg9GDeIqX97z7E1v0NV6xMpSraa4aKKejqB0omhGAjk=;
  b=ZE5A9AwUnzk+yhd0Trsty3fFB//Rv26Ybh7BzclRBZLimdK2Np44kFHL
   IJAZh03avbKRG72H9b1CtPqy5K/IcF8L35AF4ETqmPO08eKgdaOD4vohm
   Z2LmPxYr0CXDl0NIotzdL7YJROIU+lacbH3iwqsNzgE82SmJeIb9GoCh/
   /7FgsZj5uWDyP8Ro/ZFm+h6JUdcuyDMsjnFJKj+A0TKeYhZKdB0Zj4bR5
   4Rjb+2YdS7eIErRw5mAiRT7NYvuoisEXZXZimjckU1YMeuwU4NQUDIHdu
   13amSU9hsCGFlKB+moNjygDCUsHp2H6r/a2L3DVjVliv1hhuuI4FH4y/5
   A==;
X-CSE-ConnectionGUID: 7IqpxTS9TRS6x6gIGHgghg==
X-CSE-MsgGUID: o7ncTOqdQRyTxoQYGovXcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71790002"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="71790002"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 17:32:26 -0800
X-CSE-ConnectionGUID: r79Dd9/aQO+Ks44CIYC82w==
X-CSE-MsgGUID: upZ+2VVLQNOtujLSbnhrmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="203089954"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jan 2026 17:32:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdesw-000000004It-0fF6;
	Thu, 08 Jan 2026 01:32:22 +0000
Date: Thu, 08 Jan 2026 09:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pawel Laszczak <pawell@cadence.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/cdns3/cdnsp-gadget.c:159:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202601080940.6cYiaoCI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
commit: 241e2ce88e5a494be7a5d44c0697592f1632fbee usb: cdnsp: Fix issue with resuming from L1
date:   8 months ago
config: loongarch-randconfig-r132-20260108 (https://download.01.org/0day-ci/archive/20260108/202601080940.6cYiaoCI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080940.6cYiaoCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080940.6cYiaoCI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/cdns3/cdnsp-gadget.c:157:16: sparse: sparse: cast to restricted __le32
>> drivers/usb/cdns3/cdnsp-gadget.c:159:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/usb/cdns3/cdnsp-gadget.c:159:16: sparse:     expected unsigned int [usertype] value
   drivers/usb/cdns3/cdnsp-gadget.c:159:16: sparse:     got restricted __le32 [usertype]

vim +159 drivers/usb/cdns3/cdnsp-gadget.c

   141	
   142	static void cdnsp_set_apb_timeout_value(struct cdnsp_device *pdev)
   143	{
   144		struct cdns *cdns = dev_get_drvdata(pdev->dev);
   145		__le32 __iomem *reg;
   146		void __iomem *base;
   147		u32 offset = 0;
   148		u32 val;
   149	
   150		if (!cdns->override_apb_timeout)
   151			return;
   152	
   153		base = &pdev->cap_regs->hc_capbase;
   154		offset = cdnsp_find_next_ext_cap(base, offset, D_XEC_PRE_REGS_CAP);
   155		reg = base + offset + REG_CHICKEN_BITS_3_OFFSET;
   156	
 > 157		val  = le32_to_cpu(readl(reg));
   158		val = CHICKEN_APB_TIMEOUT_SET(val, cdns->override_apb_timeout);
 > 159		writel(cpu_to_le32(val), reg);
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
