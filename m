Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6EE3B79C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717940175; cv=none; b=rCOsjlelESZ95Sg7G+wjcIqYTEcS6yN3JvWv8kyym0QiSg49dtPbkPaFp6BzwSlwmPO7PT1qVt3ncWBAXJ8Swpp5NDmsGWa1CZNhKbirHw47uLqfp78UU3dEYfUmGA2Ckef5DgDXX46xUzvzIUMQThJe6JlTK+Z4QR+YwmKFhB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717940175; c=relaxed/simple;
	bh=BROH+i90f00AK+7Wi2Y0I3nVxqIFfXC2hWdbufbOzwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DISpoljDCRHtvbE78hh/vVllbLjgRC6YXlnd2FEHQlePtp63wlKotVq4m8TrnpH2ov9U2wOWSOHJ/0NMACtCQFNJ+dwdPA1mQlGJzgzD0+dy1gRMUSes9+RKB2j2uN/dB4UWnR5GJlhH2IUaZEDkVLoyKEzkt8AWiLv4zFT6JOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OA4O0gyc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OA4O0gyc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717940173; x=1749476173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BROH+i90f00AK+7Wi2Y0I3nVxqIFfXC2hWdbufbOzwk=;
  b=OA4O0gycio0OBYo5oZr2pQNVUakRiQzTvDbmNo5FXwEGeklU+kwByQR2
   LlM7EkahWPqYHsKy6uWMh95j+upzNyFnTkGBt9ca/fFVC3L5PjhpZ0U+F
   Mz13zDJEUOzlI0jv5jvRhwa/zWgQKwvnOIN4c1f2rdpBuKpDFR6JQslaJ
   Bzsk1uIetHH08o0Cyj6ZrIH6PtW0JhS3953clIzyYW7kJrFGRkUL2LkDz
   qrS1DZTT0IROJqLHBnthIh5fNqs3cD0YkDM1ol+hVRQEMBan9eRE+agAa
   OvVisjjPJXBnzrybNUwhRX07cbyK3JyHM6kZvH6Uif90KKHxCnCzngbzU
   g==;
X-CSE-ConnectionGUID: qeTqaqwFQPuvYqjRvcDJDg==
X-CSE-MsgGUID: KQcQcTXOTwusEZugzhfJrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32148029"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="32148029"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 06:36:11 -0700
X-CSE-ConnectionGUID: uMg0RbMmRpe2gDbXZeDrHw==
X-CSE-MsgGUID: DVrKVlkWSHW9JCID+62lsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="38930197"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jun 2024 06:36:10 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGIiO-0001FT-0C;
	Sun, 09 Jun 2024 13:36:08 +0000
Date: Sun, 9 Jun 2024 21:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rt-rebase 848/979] sparc-linux-ld:
 drivers/irqchip/irq-renesas-rzg2l.o:undefined reference to
 `platform_irqchip_probe'
Message-ID: <202406092108.zcHTWxlW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rt-rebase
head:   9de69a0c701bb413c105caf0be1dd5cf574866f9
commit: e01882099c5b16d7e67093579e2f1906c1a495ba [848/979] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
config: sparc-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240609/202406092108.zcHTWxlW-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406092108.zcHTWxlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406092108.zcHTWxlW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/kernel/head_32.o: in function `current_pc':
   head_32.o:(.head.text+0x5040): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
   arch/sparc/kernel/head_32.o: in function `halt_notsup':
   head_32.o:(.head.text+0x5100): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
   arch/sparc/kernel/head_32.o: in function `leon_init':
   head_32.o:(.init.text+0xa4): relocation truncated to fit: R_SPARC_WDISP22 against symbol `leon_smp_cpu_startup' defined in .text section in arch/sparc/kernel/trampoline_32.o
   arch/sparc/kernel/process_32.o:(.fixup+0x4): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/process_32.o:(.fixup+0xc): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x0): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x8): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x10): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x18): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x20): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
   arch/sparc/kernel/signal_32.o:(.fixup+0x28): additional relocation overflows omitted from the output
   sparc-linux-ld: drivers/irqchip/irq-renesas-rzg2l.o: in function `rzg2l_irqc_init':
   irq-renesas-rzg2l.c:(.text+0x1c0): undefined reference to `of_irq_parse_one'
>> sparc-linux-ld: drivers/irqchip/irq-renesas-rzg2l.o:(.data+0x0): undefined reference to `platform_irqchip_probe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
