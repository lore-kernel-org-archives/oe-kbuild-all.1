Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897AE8BE7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 03:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727579593; cv=none; b=VZEdz0jOsnooA2g9SF0CKNvYaPsGH3kOZgG/XWZDTj4olcaM9/hAhY7OzvMTOShuXAvhJ44P3s3yib5HVe0yk20gVu4e9DERnEf1HcahWDezFn/1RTwfqCU06dMe2h9R4a+SnL6dFMHJjDthw0y4Ghe95zB4cOwFdCBeTrqwGKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727579593; c=relaxed/simple;
	bh=JMe+x51OqgnEQqsgSFCPMhvTAGZAop9YOrx8J6sVA7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZVNQqN6z5T3I/MGE7G99L+w/lhVty95vTNu5KtJ7VllWsIVLy4GUt4XlTrPU201D007c21Qb8fksXr6w8rBR27cYTXzsOBgMdb27r+fikk3Go6xbm2aTyQV9YzdC6gyJKPoyJ1p+TPY6OoaQpbnkemVgK6yx3CVtT+Rgi0W9INo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvHoR1gd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvHoR1gd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727579592; x=1759115592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JMe+x51OqgnEQqsgSFCPMhvTAGZAop9YOrx8J6sVA7Y=;
  b=LvHoR1gdAD2m06dJ5z4giyA4LPT20GYJ8ddQEoUmT3E8dQ/yXUorRiZ9
   UJtCscr5lm7T+J7FffdFakMlOO6pyMS2ExXeXn06ALeFa9Q7IBHgQvzHX
   boeUfcI//zHstdodBVxzy3HecaO4zUwKazwLXi53w1+breLWMrSxZDyNL
   ItgsbBCxZWEtfqLz31fP/itKOHkJvl96f/7dNXJ3sJ9CccFnVL0zBVC4Y
   OvAr4AiQIWf7CZ2wQ6xWwqH+Z6ir0gYHURGECzpXGNl4ynQEDTniFfEt7
   8WCfbPSZK3w0yhF4Azlos/13N9b7hs9E947oMFe1YLIhghbEiG4rM2xyc
   A==;
X-CSE-ConnectionGUID: 2G3R6EKGRmKLjTBpg5sp6w==
X-CSE-MsgGUID: wa+NfHnQQCu0WEANrcd5ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26198793"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26198793"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 20:13:11 -0700
X-CSE-ConnectionGUID: +7/ngyP2TrqqCwY23o6DAw==
X-CSE-MsgGUID: /zOZjLZ+QvSy/oMzCX1acg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72505131"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 20:13:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sukMt-000NrF-2v;
	Sun, 29 Sep 2024 03:13:07 +0000
Date: Sun, 29 Sep 2024 11:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 788/966]
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202409291152.grOWsvvo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: eff51e1f1edb73a1f4e749c313be10940c45f7b6 [788/966] arm64: dts: renesas: Add HiHope RZ/G2H board with idk-1110wr display
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240929/202409291152.grOWsvvo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291152.grOWsvvo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291152.grOWsvvo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
