Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792948620;
	b=DF50RN00dhZZMBwdRNuhRrWT6lE2IuMndx8y803Rk26wYV51O4fTyQIDaXQqOgr1JIvU
	 dEeEZjE2YXEwbNsVFzeuX2fw9WlG/39J3RaPiErUfdiyVnhlsau7xMYEzOrrAQvQj+l8t
	 PBM80pGcSBD0T8WN88Uyu3HwT9R7/x+7ZeSX8AhegrraxZMLIg54ZcDrgYFnEKaWQMNvA
	 gU8V9GRqRjLtItniliHhuZvdfbW1ykFQz68qkrz52qOUB9/qiibEYPjol0KEaK4I8WW9r
	 9WE669bQ0FCY3q3wxgRC9oO13OAuHVx23hQ9MN0SYRRi/fONDTxobdV/eMtFP2zuf+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792948620;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GYWzsxlufXbT8iAC5z1aHl6JZe3Ly098H5BcDoys6v0=;
	b=anfHTHX7ocYRebbZU494qdRNpH0WUbsqC/JciNB5WbThknaSdnwW0ZAKPViADCWko3B5
	 WK1KELOO/QqqDoJ2yHyjgGW6+RcTySKN7fQaTwJmN540SH+Gitk9fKRrD0EMmXSnXq8ny
	 OKVu65UMkZpATBP3ZRCm4yZbOScTykXTHqP1uLgOBwEEWXbC6/INLJXRRk9wwEyK6XOtm
	 /fZU58HepvNtfkx1DIMcSf0KZJ15km3bgjf+mZgmu9dhSiGGs/ZcUjP5cIPni8QYALt+f
	 Rk6FB/G9cT8IrkyVdaMSd6lbcRqbT71e7Xw9H/8tFHPPxUJV0RTZV5wnuM5TnDII93Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hi72OIIs;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB4D606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 17:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFB4D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hi72OIIs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792948619; x=1824484619;
  h=date:from:to:cc:subject:message-id;
  bh=OG1+xDTxBu8zwGjoVKDXe2NXCsGhSJ+Pf31n5zr4kxA=;
  b=hi72OIIskV5cYxalL3r8QAyi2KxY3Fyka/oF4DlzZ7VAnhIm8+3Cq9+o
   0pX2M+q/qchk86TAt4ZgX2adUoVDbm5m3xu62u6lxg0Pd7wK72hLN0Vp8
   Fk8QJB0Szi6N7EmbsQwiUTq9S8S/44LNBkB7YgpbqwVjTbIKPHQ+X3oQC
   kdWC4ZYIwmybdUy7z/IcSwIY7TFKizOjrcKYrJJVVk0eyXNFV6QQ1UEwR
   JR43xzNvU1DLKvPMr3z7vFNI+ct6mF4cg7W/soXTXWxgYSllm9mdhrc3F
   545YA0GmTl6Td7kk7BMuDMQf3obyCVhW3kmdRsb4HDgCuSzW9DuBEvUG8
   g==;
X-CSE-ConnectionGUID: XfzO1vevTragZYqAtmRlgQ==
X-CSE-MsgGUID: tOnT+5gwSEa73KyToP/gtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1648458"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1648458"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 10:16:58 -0700
X-CSE-ConnectionGUID: o95svKiCQ5K6pUDZVpZkJA==
X-CSE-MsgGUID: 1Sxt/nthSsWdg1TV0HGgsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="5836368"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 25 Oct 2026 10:16:57 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL1q2-00000000UyQ-39FW;
	Sun, 25 Oct 2026 17:16:54 +0000
Date: Mon, 26 Oct 2026 01:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-09 0/3]
 drivers/irqchip/irq-meson-gpio.c:125:34: warning: unused variable
 'meson_irq_gpio_matches'
Message-ID: <202610260132.Ir2wmywC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Neil,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-09
head:   65375f3c64f1a4c8b07bc6043c1ca6c7f2170095
commit: 6566f43c59c5787ffd08f9b977452b5f69ddeb39 [0/3] FROMLIST: irqchip: irq-meson-gpio: make it possible to build as a module
config: x86_64-buildonly-randconfig-1002-20261025 (https://download.01.org/0day-ci/archive/20261026/202610260132.Ir2wmywC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610260132.Ir2wmywC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260132.Ir2wmywC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-meson-gpio.c:125:34: warning: unused variable 'meson_irq_gpio_matches' [-Wunused-const-variable]
     125 | static const struct of_device_id meson_irq_gpio_matches[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


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
