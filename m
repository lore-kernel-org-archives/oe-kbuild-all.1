Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114871E493
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725971136; cv=none; b=IZGBSspd7f9PdqNVeLX1ebuL1BeUR7St81JHqVqYYyvmgVLqMDXiGQHq7xtRMA4mXyMqmHPxLfFdh5P64wFgqQmGrf/fLJL4wCHSJlPPNw5U30aAjpeFm1MsFlas0c7vbQD/zJGw/Xt3iJKjvmSljIH75nq1UGWFW7ZGIi9gasg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725971136; c=relaxed/simple;
	bh=JZP+UdzkbVinJADvBNr0Eftg3byq+RVqQVQJY6SwXUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kVnxwqwr2CXTnmSzT7We4pqep7Y0M/361G4NRzb2DZNru2qIGXY2E9VQCf921bn8s54FxcaAMqvH1mKQudvXuwRjNx7Xk7knZLUbMlcxM1kWrZQJ38ELUeAKYCo0Jl+m7UV4tIteGp1x3YYMooqT3LbYIQD1028kF1MXOKAkwzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXHK5xSi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXHK5xSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725971134; x=1757507134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZP+UdzkbVinJADvBNr0Eftg3byq+RVqQVQJY6SwXUQ=;
  b=jXHK5xSibpXdRF3hSkJRecazAoisthcFiuIcf//FzglOf6hAnM1LX/In
   NY54Ucmpzqs+xLNRoDbYMVp5yfZLa/Y2yH2+Kklr2MnCPkHIbXHwLdNeZ
   dtUUOtEuvscXFH958bexGXN7wuygqG/mJvP5iZqBeCYIZX2zlUIPiYi/i
   ZhJio0fATQw/oi8wBb6hfvUpKGP5dUGOMMHyK9KLsWwDlNZWl/UYADXRY
   /PvLMexhrdoNXnV0G9gV6BGkFRNzaDKRLk+mlUrEj0qGcPWBHRLvrrQkg
   0qbwfWt3JpSFVifWrnufwn+HH4cKmN3xi5W3THuYtuSjsEnpj7rpHtZMR
   g==;
X-CSE-ConnectionGUID: CGISYPtXQN2Nka/CtRxdcg==
X-CSE-MsgGUID: mrMf4SpMTNSAnO2sVaIR1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35381307"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="35381307"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 05:25:33 -0700
X-CSE-ConnectionGUID: s5K1w++vSYmjAnDpflskHg==
X-CSE-MsgGUID: qS2vSEqzSCuLoFhZVmoY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="66811202"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2024 05:25:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snzw2-00023a-0Y;
	Tue, 10 Sep 2024 12:25:30 +0000
Date: Tue, 10 Sep 2024 20:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 14/39] sparc64-linux-ld:
 drivers/irqchip/irq-renesas-rzg2l.o:undefined reference to
 `platform_irqchip_probe'
Message-ID: <202409102023.JL7wN61j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   a73978e16f87d704893e4b3a637be257420d43f3
commit: 1a976563ab48d0c37e7ead6ec20f2c85bc094cfe [14/39] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240910/202409102023.JL7wN61j-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409102023.JL7wN61j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409102023.JL7wN61j-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/irqchip/irq-renesas-rzg2l.o: in function `rzg2l_irqc_init':
   irq-renesas-rzg2l.c:(.text+0x5b8): undefined reference to `of_irq_parse_one'
>> sparc64-linux-ld: drivers/irqchip/irq-renesas-rzg2l.o:(.data+0x0): undefined reference to `platform_irqchip_probe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
