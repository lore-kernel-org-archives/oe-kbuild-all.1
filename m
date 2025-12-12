Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852F2DC78F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765533890; cv=none; b=av8OoC6dUeOFlf0Nrk81hvQ9dpwaSisNFMDTfYFO5kpLwT7AXjr685yYQGKa2J42DsaAwy4+aMJiLwWaOs/Bn6lv7rQ+CFpfzhP0raxdlks0Wcb99DfFsvfnPz5EysPrThdCkFJnCuLgyJJ2z2lhaVMu9aAXmjaKjLmXxiO6jew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765533890; c=relaxed/simple;
	bh=ohy71+GNXvYJaITSfM3yW8SR/Hr3zCzPXjuAjLJwrz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d05HpeBmvSw46WkV3VcvqNqe6sR8duX3NiXv4b3NcElH8DqcaRrejdVCZ/pUlvCdOKwllZvSojQ6QwndcX57PJrppMNVV5r41KUSTAA6ynWJkeGdCWOoRrMqn5BSHqdFcTkOMeVuQsoFdltm9M1caegM6TxGIPuKG20YVMHTlVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAq43lxt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAq43lxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765533888; x=1797069888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ohy71+GNXvYJaITSfM3yW8SR/Hr3zCzPXjuAjLJwrz8=;
  b=SAq43lxtjvXpXFhw9Wxau+yrSQ5rRpQz00Ha1USsAVhRTuNvbxc2nGCt
   OZDOdEmdDJC+WJhb+Z7PuYQeNOAELe2WzZNSMPDozcZf/nbv/6/QIpvRT
   1pKZO1LFTGQouCDGoSiq0JWF+hBT10Hijxg29r9yDTBo1/4RLDQ2mP69u
   jyPtCI4lzhil85QAlzUe57oM57HA+a+vpo1y1VtuL5Yan6CPdiVwcPw3t
   D629QobqJlBu5J1uPYdU8U2WXNl50KIpU3v1tGnHxtKAKi2eIqy3lrsXa
   4ekJ3aYsQyqiZJ0RWhuth2WhyU7zygSrvoV0/a5CYvzuTYWhffy5VZ1Qm
   g==;
X-CSE-ConnectionGUID: 9yQoeOpPSwax1VS/ikzC6w==
X-CSE-MsgGUID: L4GSZlqPTQa50G95k4SS5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85129352"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="85129352"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:04:46 -0800
X-CSE-ConnectionGUID: uaifp94/T8S9uxfqS8Ye1w==
X-CSE-MsgGUID: 0J8UE8v6Qn2+Zh7tb2IIFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="228103657"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 02:04:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU00w-000000005u5-3AQo;
	Fri, 12 Dec 2025 10:04:42 +0000
Date: Fri, 12 Dec 2025 18:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 drivers/irqchip/irq-meson-gpio.c:125:34: warning: unused variable
 'meson_irq_gpio_matches'
Message-ID: <202512121706.H0penFVA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Neil,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   65eb5a4a2e961a9252cefa9936c221b340ba0370
commit: 95d5435480680dc25fa85a8b47d2ef4a5c086ba3 [0/1] FROMLIST: irqchip: irq-meson-gpio: make it possible to build as a module
config: x86_64-buildonly-randconfig-002-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121706.H0penFVA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121706.H0penFVA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121706.H0penFVA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/irqchip/irq-meson-gpio.c:125:34: warning: unused variable 'meson_irq_gpio_matches' [-Wunused-const-variable]
     125 | static const struct of_device_id meson_irq_gpio_matches[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/meson_irq_gpio_matches +125 drivers/irqchip/irq-meson-gpio.c

8f78bd62bdd7a7 Qianggui Song       2019-12-16  124  
215f4cc0fb2086 Jerome Brunet       2017-09-18 @125  static const struct of_device_id meson_irq_gpio_matches[] = {
4e4cb1b183d6e9 Martin Blumenstingl 2017-10-30  126  	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
215f4cc0fb2086 Jerome Brunet       2017-09-18  127  	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
215f4cc0fb2086 Jerome Brunet       2017-09-18  128  	{ .compatible = "amlogic,meson-gxbb-gpio-intc", .data = &gxbb_params },
215f4cc0fb2086 Jerome Brunet       2017-09-18  129  	{ .compatible = "amlogic,meson-gxl-gpio-intc", .data = &gxl_params },
868c4e07533c67 Yixun Lan           2018-04-08  130  	{ .compatible = "amlogic,meson-axg-gpio-intc", .data = &axg_params },
c64a9e804ccf86 Xingyu Chen         2019-06-08  131  	{ .compatible = "amlogic,meson-g12a-gpio-intc", .data = &axg_params },
b2fb4b77994abc Jerome Brunet       2019-08-29  132  	{ .compatible = "amlogic,meson-sm1-gpio-intc", .data = &sm1_params },
8f78bd62bdd7a7 Qianggui Song       2019-12-16  133  	{ .compatible = "amlogic,meson-a1-gpio-intc", .data = &a1_params },
215f4cc0fb2086 Jerome Brunet       2017-09-18  134  	{ }
215f4cc0fb2086 Jerome Brunet       2017-09-18  135  };
215f4cc0fb2086 Jerome Brunet       2017-09-18  136  

:::::: The code at line 125 was first introduced by commit
:::::: 215f4cc0fb208665dd15a524ec57edf4d7e215e6 irqchip/meson: Add support for gpio interrupt controller

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
