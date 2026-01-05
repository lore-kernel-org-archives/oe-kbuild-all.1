Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D2C2EB5A1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 11:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612103; cv=none; b=rs0fmvMOqY6m+EbQc5R3r5LvgZuoQNn7NkZtcpnIY4yIQZ/UlIBJ6TRmZOeIGIwMWZd6dsCmEuIKuuzSE6r3tF4P0lbnestLaVOFAALc9s7CN4dIF6flXIlXdaf1Z4gC6J1Mh2e4oCjc7wD+ZPCA4bcov/4ug2iYfZtluQSzTqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612103; c=relaxed/simple;
	bh=mRChb+kUNKbr+2YbItOCS/M6pC6rH08lZG5CE5jrMUM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cc77s7xN+cUNcJbwgnOPYTz9VUSGidGPSZ21eTvvPyKbdtuN3hvHFR/1PQhPvIZEYHN+Vkz/M2DgC7hsriY3WPT/gVNnbh3xH78ZDT4Y57tn9V1o0TEW7kWGNfeArM4+QH2W3FASvqVs8DOtuc+0fMB8agE3WSPQOfWkMlJUYRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiIK6KXH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiIK6KXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767612100; x=1799148100;
  h=date:from:to:cc:subject:message-id;
  bh=mRChb+kUNKbr+2YbItOCS/M6pC6rH08lZG5CE5jrMUM=;
  b=EiIK6KXHCDMYzuDHfQe8i/21w4LjV1NClIw1RbRuGe6LHaLUCdCTdzew
   3+qnTYbGMFydq4AcEjvG9zFXjiTvX836A7e9sUWyfkBlvANUMTehJyP73
   Jg68VPc1c+gWIEVYIexzwsOjnviQFW7zH2ToDGYaKLmfOClcKCHfMKB92
   iGJXgf/vDP9VZeh8yI20IUOG3EorZtAxyDu7l5tjmWhFEtlv7FHJFgfrj
   9OdZgwznkACl1sJP7MwcZUqF1eO40SrwQs/DpSfRQSlY9UcAD85cbbTmO
   ys2bI7yC7hVfkRrcrgW+vIL55GX2HkwI62Ag2yKaHfeZTgeUOY0xLpU4q
   g==;
X-CSE-ConnectionGUID: K7Z+saz6T6SymgrmUGO6ag==
X-CSE-MsgGUID: EUOojjhyTNmYvhcvIh+YNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79610518"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="79610518"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 03:21:39 -0800
X-CSE-ConnectionGUID: Vi7XBYcuT0WNama5E5lPpg==
X-CSE-MsgGUID: c5hFTX/ORRmmMv5f4HQeqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202265152"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jan 2026 03:21:38 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcieV-0000000018n-3IxQ;
	Mon, 05 Jan 2026 11:21:35 +0000
Date: Mon, 05 Jan 2026 12:21:24 +0100
From: kernel test robot <lkp@intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [linux-next:master 3181/3725]
 arch/arm64/boot/dts/qcom/sm8650-qrd.dtb:
 /soc@0/cci@ac16000/i2c-bus@0/sensor@56: failed to match any schema with
 compatible: ['samsung,s5kjn1']
Message-ID: <202601051253.1esp6DUR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f8f97927abf7c12382dddc93a144fc9df7919b77
commit: 328407ba89ae6656c143967ba65465c50150aaf8 [3181/3725] arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 camera sensor
config: arm64-randconfig-2051-20260104 (https://download.01.org/0day-ci/archive/20260105/202601051253.1esp6DUR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601051253.1esp6DUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601051253.1esp6DUR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5086.22-5177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5795.27-5851.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: /soc@0/cci@ac16000/i2c-bus@0/sensor@56: failed to match any schema with compatible: ['samsung,s5kjn1']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
