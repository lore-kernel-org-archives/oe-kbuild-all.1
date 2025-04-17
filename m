Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CBF433A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 12:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894167; cv=none; b=nApzS/DFsuZiXdQMz8IHrm8On0NH/qn5P5YHXkjHQBbKmH/JFvWGI++VB/HDzhnm+0dw1jgYz/2hI7Wq7NmlsKStAGO61ScWp7uQQnF9laZrXeBAM3zyALg3zOb0O3lZtRx2kXqfbFq8sYhaffXJXP7bESaKLMW4GtNqywqLUok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894167; c=relaxed/simple;
	bh=74qEGZ4xFFv7cM5tbg0iPmszQGDQP0DoDjArloMuynY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cBPjmd2+5I/qkbujxO2rtamIv7eHtttFxg5sO1mFDMtWst6ZB4vnAwF+8r8GyGaNVMZJX3dPJkzw0jbebe384Idh2RtOvijl9uaoLaYBvPC7u4oiPXTlW/UqzHsuhI7uoQ/zCAymEipV/bVdUy21SEimR871IQlIOfKIQwq5GAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FL4joHpv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FL4joHpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744894166; x=1776430166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74qEGZ4xFFv7cM5tbg0iPmszQGDQP0DoDjArloMuynY=;
  b=FL4joHpvpv9gWhn/Dm3UGK5dw2wk0xVXYXCilrrpQeykm0mkEhqClLBw
   Gz3L8+Q2nA1OhzLQhngOOolvWaZojAt5J23D3FXlh3bdoEgx15lYuecBl
   xkKRIkwiB9+eAtFrV1czRE1oqWuo2ktcAcrivwuSjyM2n1d3HdiK+fHZX
   ZcW2y7aNV3Jx71j7V5wCkq721RlBtkQFQzAm7VZIjDVx4QkwQQ74vwjNJ
   ThibI1e2Vg9198E512Ka2qWunyYx02i1NgqKp/Q/x0DbKaRMWR8gVtO0E
   u3eFBrk7ss8kJeqMjEwmtZAExHA3JeauGTzJ7dahwda9/mMCiuHlJ3EXk
   g==;
X-CSE-ConnectionGUID: 0zYxrbVlQLSCTGAqkmR6nQ==
X-CSE-MsgGUID: 4jGdY1BkRFGySsR8jDPkKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50298716"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="50298716"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 05:49:23 -0700
X-CSE-ConnectionGUID: kBcYY0huRbufBJ/dt+GqwA==
X-CSE-MsgGUID: BHg4UB4sTz6zhemKz+l6wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131105131"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2025 05:49:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5OgB-000Mk4-1B;
	Thu, 17 Apr 2025 12:49:19 +0000
Date: Thu, 17 Apr 2025 20:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 4503/4779] kismet: WARNING: unmet direct
 dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
Message-ID: <202504172017.4RgIYyN3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
commit: 90d80a3dc4fb24446d9d423c1c8967a63f136b0b [4503/4779] gpio: tb10x: enable building the module with COMPILE_TEST=y
config: x86_64-kismet-CONFIG_MFD_STMFX-CONFIG_PINCTRL_STMFX-0-0 (https://download.01.org/0day-ci/archive/20250417/202504172017.4RgIYyN3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504172017.4RgIYyN3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504172017.4RgIYyN3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for MFD_STMFX
     Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
