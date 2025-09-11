Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9602E6CAA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 21:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626992; cv=none; b=UNsL4uNKCyw4eugGPs0SpQVEA5ARhVFxARpq17zj5I6hSrQu5oyOh/OWv0vO6PvaeO/JJMYS6k2MOf6trcvR6eg510UN5JE5L5IpnVh/xV6YDBvgQN6JUcjb63g7p4Dh/pIFzmKamgZlOtV0VTWMwcSzqfC3t6CO+VSkHX29Qzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626992; c=relaxed/simple;
	bh=3ROeVIPUrlaA9XWzHu9uHMQ5f6ye42LkRCmXj8HKciY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OnETy+RfT/kAU4At9DtkDnT1EmIgNJlK9x6uCh6ayfOBkR+Q/0FGtX73zqOus+iv0hHbXCSp/uGyvBQcZtX710OVWSwGPvz/03uBhN6R61AR7/mXTgPB2JJJHFnYJv+DRsFPbZWkPhjWZBRapVZuU3UhuubH7KgF9oe8x3GEbXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKqzVBt5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKqzVBt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757626991; x=1789162991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ROeVIPUrlaA9XWzHu9uHMQ5f6ye42LkRCmXj8HKciY=;
  b=BKqzVBt5qtf1At/32PVZc8f7Hx9Mw6YLuyfURRaaxa4bsOamGwbWrv0B
   KEAsN5D7+4xn8IJMUc1pctyrVGdexGgqxgPckFffl3mvjOIhEMkPvi+Kw
   s3/BjlRSvWH7ek/+JnBxjaCIQOuaiiOtFqd8wfw2A/xUc5tZxv/kx7oNk
   Cw4rv4Mk2kS769QwpLCY8jAvlIld2vSSWSFQB1ITX5bTRDd05gjdDO50R
   tRmaTACb5wk+Cr3VQjqhji/sU6GKqvjCINjZfnmtatRfGqZ72N1J6JuBJ
   FO/5cDdXlajt2hCQWGp9rcfPkYaKOFNPMg2pX5XsgFAxwYdcILIDCW14i
   w==;
X-CSE-ConnectionGUID: yaziiwbBRcS9kJnanJFU/w==
X-CSE-MsgGUID: 4Z30xWnSQsCxMlyHj3F03A==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71348358"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="71348358"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 14:43:10 -0700
X-CSE-ConnectionGUID: i0hYnMmKTeW5E8e5xhwEYA==
X-CSE-MsgGUID: GFbJGrsCSXSTsWgkRSJ8Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="174242174"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2025 14:43:09 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uwp4N-00000000121-0yjf;
	Thu, 11 Sep 2025 21:43:07 +0000
Date: Thu, 11 Sep 2025 23:42:35 +0200
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cbeznea:linux-next/for-mainline/SSGRLPCSRC-1570/pcie-upstream-v4-trial-2
 2/6] htmldocs: Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
Message-ID: <202509112319.Ne08Hwes-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/claudiubeznea/linux.git linux-next/for-mainline/SSGRLPCSRC-1570/pcie-upstream-v4-trial-2
head:   465d7413b0b6a857426558f213c3036b97c16e2c
commit: 26fb845c1b63b7f375640667a33f096c432f4c18 [2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver
reproduce: (https://download.01.org/0day-ci/archive/20250911/202509112319.Ne08Hwes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509112319.Ne08Hwes-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
