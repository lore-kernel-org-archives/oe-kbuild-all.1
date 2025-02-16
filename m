Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5CF18C93C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739699995; cv=none; b=TmljZBubOsvNWzy/HbO6BJxWWqB5fs36XOWSd/8W0654CU5fRCL7p1ybYQCBDi0H+0y7ECzmX5kAgd7UepCHHuRs0RXvljrC80EjTfcm86jEKBgV1cpf9gWypUM6lxy7iMnbJaNsOZA9IYUj+AK/2669b1WBGuljJTzoE8wA7NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739699995; c=relaxed/simple;
	bh=btsQpyHq0530FNdgdjeGeWE+t46oNkljaXfvRXa8yq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TzCrLWmif4yOfm4WVLXOTvy//SwNVLhNARh1KWDHJZU+Y8P4NDOxio1hi0Xc2LqY06a/+LShrFlIRO6nbKWuXp9EbPfFNjkyWwzS/0yB5m/tIRXibNKWrObFftxMpsJQC+UDCzfV9ZRQQ54Cm+r+zXzEIifSmlU4Ua4XlmQUuXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSrmDcnh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSrmDcnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739699992; x=1771235992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=btsQpyHq0530FNdgdjeGeWE+t46oNkljaXfvRXa8yq8=;
  b=mSrmDcnhF9hPgrOMi+72Rqm32kRoSauevnPj4R+jJ8OPiYwKYp5GWfSP
   FGuhEXfTpnIiHyGYs1Nm2LPTzOVbFB+gqtTRb7z9caGjctGuper6Gx0VF
   Ohqo7jInz5W1Xy3Dl+NrsqKRrldfb0z5yU7245Yr+60OREDOR9HppS7n7
   kNqkpdx1o43Lprqm/krQ36EImTJA6XLXtXHIma6VnZsIa4MmXpSao/AKE
   j53TggZFxYIqzVr7qkjZd2c5AjZLr/+X49wFRvxYpneITrd3FXK4+hogx
   vv0tfB3TQZ730sJawZCwfwUNDYwT496GL7ZBt04pZgYF3q3T+74gwVCIi
   w==;
X-CSE-ConnectionGUID: WBCnHaXJRGu8J27CMRWv0w==
X-CSE-MsgGUID: Bb888QkoQs2n/mZcbNzXEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="44051647"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="44051647"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 01:59:51 -0800
X-CSE-ConnectionGUID: v1YepVnLQ0+nwZt+s9o3Ew==
X-CSE-MsgGUID: BKl9hIeSQVSp2kDFkgR9AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="118874834"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Feb 2025 01:59:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjbRE-001Bod-0d;
	Sun, 16 Feb 2025 09:59:48 +0000
Date: Sun, 16 Feb 2025 17:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 5/5]
 drivers/pinctrl/mediatek/mtk-eint.c:431:44: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202502161758.SCH7vpZr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0d96e807079196f870dcef51ecf4bd53fb5472c1
commit: 31b820a4d0880db56871a3a6f3cfb1f0af61c93d [5/5] CHROMIUM: pinctrl: mediatek: Update eint design
config: arm-randconfig-r123-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161758.SCH7vpZr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce: (https://download.01.org/0day-ci/archive/20250216/202502161758.SCH7vpZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161758.SCH7vpZr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/mediatek/mtk-eint.c:431:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *base @@     got void [noderef] __iomem **base @@
   drivers/pinctrl/mediatek/mtk-eint.c:431:44: sparse:     expected void [noderef] __iomem *base
   drivers/pinctrl/mediatek/mtk-eint.c:431:44: sparse:     got void [noderef] __iomem **base
   drivers/pinctrl/mediatek/mtk-eint.c:439:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *base @@     got void [noderef] __iomem **base @@
   drivers/pinctrl/mediatek/mtk-eint.c:439:44: sparse:     expected void [noderef] __iomem *base
   drivers/pinctrl/mediatek/mtk-eint.c:439:44: sparse:     got void [noderef] __iomem **base
--
>> drivers/pinctrl/mediatek/pinctrl-mtk-common.c:1027:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem **base @@     got void [noderef] __iomem * @@
   drivers/pinctrl/mediatek/pinctrl-mtk-common.c:1027:26: sparse:     expected void [noderef] __iomem **base
   drivers/pinctrl/mediatek/pinctrl-mtk-common.c:1027:26: sparse:     got void [noderef] __iomem *

vim +431 drivers/pinctrl/mediatek/mtk-eint.c

e46df235b4e605 Sean Wang   2018-05-21  428  
e46df235b4e605 Sean Wang   2018-05-21  429  int mtk_eint_do_suspend(struct mtk_eint *eint)
e46df235b4e605 Sean Wang   2018-05-21  430  {
e46df235b4e605 Sean Wang   2018-05-21 @431  	mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
e46df235b4e605 Sean Wang   2018-05-21  432  
e46df235b4e605 Sean Wang   2018-05-21  433  	return 0;
e46df235b4e605 Sean Wang   2018-05-21  434  }
8174a8512e3e5a Light Hsieh 2020-04-08  435  EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
e46df235b4e605 Sean Wang   2018-05-21  436  

:::::: The code at line 431 was first introduced by commit
:::::: e46df235b4e605aa4e7609a27c118a1cccd4ff9a pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit

:::::: TO: Sean Wang <sean.wang@mediatek.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
