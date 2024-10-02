Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207111C36
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 01:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727834387; cv=none; b=QaHrRD8PZAInmH8qVzitf/MZvk0n2A8J/UK5w0T5wXCuys6ZTF5Kr/a1gqJf6g39HWqhFSlsxs8MeXn+tkeGx5ULj74jM0qReSXMLKVGEX/sLCnyMz8K1CYICl+4KIOwx8kCpPCnG7D6WozpAE/lbQdsHItr3A3P5lHiPHn2TBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727834387; c=relaxed/simple;
	bh=FTx+NIaVs91s/Wu1KCPg25XmsDqE/Kg6XhF1GaJdgDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pH2FL0tnzWETWMbef99pXjBJt5ZhmEiyFIDcnJA8dbTZ4Ea8Du+E7UprUKJ4b9pN0IEE7RnHntXEQbtNvPS+uCKn/umq307iobiIPa57HgnPoJG57avAiqP+P/wAYdjWf5ywtD+PdIRGhmb5GGFi3eGrfZGG2uBDsyQ7Rottw2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhwI+cy/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhwI+cy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727834386; x=1759370386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTx+NIaVs91s/Wu1KCPg25XmsDqE/Kg6XhF1GaJdgDg=;
  b=mhwI+cy/K8X747z88TSjpNICXp2TgLJYahxRmCC7I8hZhiE2u/OYXxwb
   FLja3mO5ZBhk59WgiP3H/xYYNqHKcaXLFcREACoCZ9mJ+VQ5/rMqwWkxE
   Y9XuozwLRpYI+givwzIcjJUUOZa4KrVhCobydMHV8tKBgciKtGqjWX/ip
   S2II7z6xTh9sNc12AyQ175Ik7A4stPD/jYtue1ImgtY+hV848mPe1R0G1
   6VInz2dmaz6U5SEg5bfIJ1aAEJck+XDuyiEg/y7TqhrUUcR35S9CZ8NOY
   42bhgx+pUfTzyUB24DtmdivvA/MtO+QF039EdAZy7zpUb3TRrOF/2yaE9
   Q==;
X-CSE-ConnectionGUID: pvqJZzpuRVulhqulTesq6w==
X-CSE-MsgGUID: C7Llr2UISIeplpcuV7RwgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30784648"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="30784648"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 18:59:43 -0700
X-CSE-ConnectionGUID: AKokru84Rl6tr2xGYHTjNQ==
X-CSE-MsgGUID: DkdpCe7vRBqdrI3NQf6+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="78276254"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Oct 2024 18:59:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svoeR-000RQN-24;
	Wed, 02 Oct 2024 01:59:39 +0000
Date: Wed, 2 Oct 2024 09:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Esben Haabendal <esben@geanix.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 8/20]
 drivers/pinctrl/freescale/pinctrl-imx1.c:17:9: warning: "PC" redefined
Message-ID: <202410020940.wGISlWfV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Esben,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   d1c7bf9cb31a8e3868c5eaf3ec05b79aba4d2e33
commit: a55222b7a1327fabad71e1e61661077ab66bb98d [8/20] pinctrl: freescale: enable use with COMPILE_TEST
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241002/202410020940.wGISlWfV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020940.wGISlWfV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020940.wGISlWfV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/freescale/pinctrl-imx1.c:17:9: warning: "PC" redefined
      17 | #define PC      2
         |         ^~
   In file included from arch/loongarch/include/asm/processor.h:17,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from drivers/pinctrl/freescale/pinctrl-imx1.c:8:
   arch/loongarch/include/uapi/asm/ptrace.h:25:9: note: this is the location of the previous definition
      25 | #define PC              (GPR_END + 2)
         |         ^~
--
>> drivers/pinctrl/freescale/pinctrl-imx27.c:21:9: warning: "PC" redefined
      21 | #define PC 2
         |         ^~
   In file included from arch/loongarch/include/asm/processor.h:17,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/pinctrl/freescale/pinctrl-imx27.c:13:
   arch/loongarch/include/uapi/asm/ptrace.h:25:9: note: this is the location of the previous definition
      25 | #define PC              (GPR_END + 2)
         |         ^~


vim +/PC +17 drivers/pinctrl/freescale/pinctrl-imx1.c

4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  13  
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  14  #define PAD_ID(port, pin)	((port) * 32 + (pin))
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  15  #define PA	0
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  16  #define PB	1
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03 @17  #define PC	2
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  18  #define PD	3
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  19  

:::::: The code at line 17 was first introduced by commit
:::::: 4877e51ed791ac0098471d547f9f8f84c147e1c6 pinctrl: Add i.MX1 pincontrol driver

:::::: TO: Alexander Shiyan <shc_work@mail.ru>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
