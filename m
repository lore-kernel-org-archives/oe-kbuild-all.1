Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA731CF7AF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747549567; cv=none; b=tCuLeKQ+SqE9GT1WHe0XIihEpqAVzyJEGnamlr9WuZdknEUiK4nBdgPPGBOZbwKIOGOb6wXgBn8pz1F8R08oDrsVr2LXcowQ3LsDTprPucoqg/D2GQClrWAk/Q0leKHX9b2TfgjmEPtCl//dyowiw+MP0bGyug8eX7lOD0VLjCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747549567; c=relaxed/simple;
	bh=XctH/vVb7nrGbDSP8x/Gm6EkimQFdYUiDwBXQ3p90ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DI3BPUQt02sGi5w4MsZQoKez8bfUjclogIwi3ijHB0YY0m+O9C3iYG4lrRUEu+OP61f4bqfqiLffkt6psQG8Ycc6HURtG2o7aUnBQukH+vJwiYvT+sggyaGRhtjVuRH2Xuty/XYKdy460tJtX4NODkS35gag+Ds/9t6VXiOQbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHasrp1+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHasrp1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747549564; x=1779085564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XctH/vVb7nrGbDSP8x/Gm6EkimQFdYUiDwBXQ3p90ls=;
  b=NHasrp1++chUyZS4tcwZUO96qzAGHey3GEz/R5gkJ3W5kl4XwsDq8cHg
   OUoeBBDJ6AwuDqc9FXRb1KP1Wl3Hybbg/J8/zwN3WQ6Dgo2Soj0aUIRc7
   7MDMvF2JNj+EqqpIgkt9QuXNA6rB3xZXrYC23D1KN1lkAHIQBCT7TBABv
   U0oMz73WQ9e3G0YAdu9ALJqs9roB8bzQ0oChhr0yuQAjfLKqWqdflG5V6
   Hx2jvoO6z/Do+f7Xi9XztR5jCxEpe5vYg3LuSR2YDcfoZNlml2RB57nd8
   gBCgI9gX9XlfzhhFyzJGXB1n0NIILXp4ax211V8hHTuhRyt267oxbJmuo
   g==;
X-CSE-ConnectionGUID: V5Cy21NyTfqldpCi6CyFCA==
X-CSE-MsgGUID: wc+8x10jT8S7zhhCxzHOag==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="37090113"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="37090113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 23:26:03 -0700
X-CSE-ConnectionGUID: hOhZCdT3TUaOWVCueSQUOA==
X-CSE-MsgGUID: 0U5JqjPbRCm79Tp8adf69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="143938734"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 May 2025 23:26:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGXTD-000KfH-2K;
	Sun, 18 May 2025 06:25:59 +0000
Date: Sun, 18 May 2025 14:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 11283/11779] arm-linux-gnueabi-ld:
 drivers/gpio/gpio-pxa.o:undefined reference to `gpiochip_irq_reqres'
Message-ID: <202505181429.mzyIatOU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: 20117cf426b677e7aced4e7a1b2b37f6080a46dc [11283/11779] gpio: pxa: Make irq_chip immutable
config: arm-am200epdkit_defconfig (https://download.01.org/0day-ci/archive/20250518/202505181429.mzyIatOU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181429.mzyIatOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181429.mzyIatOU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: drivers/gpio/gpio-pxa.o:(.rodata+0x54): undefined reference to `gpiochip_irq_reqres'
>> arm-linux-gnueabi-ld: drivers/gpio/gpio-pxa.o:(.rodata+0x58): undefined reference to `gpiochip_irq_relres'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
