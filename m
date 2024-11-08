Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AF41BD9FB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 01:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731029624; cv=none; b=HntGt3PeN46/QZc137YbudxWUqdE3bRGRcD/ZzPfRLqGVA+/Sta9sVWmPIZNsx/KLeaaTiepaI8Bnwyu3ITb4XZZrDIIBqYsgJEuXMCcqVgBlhNslMZJXqx4w9D2kFcCU74PAjviKaGGAPwJjXJgWjNe2gMO4AMYJCOs+BKMIo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731029624; c=relaxed/simple;
	bh=Li0cuNZsWMba9AIn8gNb6WmvZ0jP0It6N3xDbZ+8ur0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtXhXvGC1jSN+CYavTmBrGIhzR4NdSYxU5djxWqD7SPxs7MD2RaC1TyI/E96P6fo0q0es0AGbowTzh/UDfvapgubsxsj4ViS17wqB6XlcIGneGknBtH11MiMAi7OrSpoAgi/8n+UdP1k0VQJfZZb8PExxJrRmt7/HISP/MGUYHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEB9cLRc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEB9cLRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731029622; x=1762565622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Li0cuNZsWMba9AIn8gNb6WmvZ0jP0It6N3xDbZ+8ur0=;
  b=ZEB9cLRcneN/XJPZ7AILNmhgA0i6aHWI1Pa2OhtBRpxhgjqQ8rQD4nIL
   zo4SLNqQ9tirorlauprhIBaWHXPvXBY/wYzXyGlu3R7IPvUBuUklmn+I/
   LfRlKzJnhFjia9NKNn/Bm1OMq32h7w+znvtS4ddHlYs330JnVvUH8U6k7
   WyH8kaLGtnDygdsjrEvKJG8wT0KT5RpuT8bFI9VtJc9KioHFBJc7uzNuc
   A4OkNDF5dVwBO6Ut/jVrIVCGVfElNxswpZOBjZ/mq9HwVLHT3CqitcW6s
   J+g9DpQbw9PGekZXXDa4ktA7HPxHMKaBZ6ZtTW9X52lTnbDMZJYNxA1IU
   Q==;
X-CSE-ConnectionGUID: VqlFTp6rSl6TO2tJnKjncg==
X-CSE-MsgGUID: 0ZTAhrEMQ7+PbNMyCWZANA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53465367"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53465367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 17:33:41 -0800
X-CSE-ConnectionGUID: 4yvFXq2uSgWgr2VT06OS8g==
X-CSE-MsgGUID: fE50YisdQlab+x8Mey791w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="86129107"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2024 17:33:41 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9DsY-000qsG-1k;
	Fri, 08 Nov 2024 01:33:38 +0000
Date: Fri, 8 Nov 2024 09:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 9120/10190]
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb:
 /soc@0/geniqup@bc0000/i2c@b84000/typec-mux@8: failed to match any schema
 with compatible: ['parade,ps8830']
Message-ID: <202411080931.2Wgo6hbt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   74741a050b79d31d8d2eeee12c77736596d0a6b2
commit: 019e1ee32fec24a69e3491d27eb0f1bedce12525 [9120/10190] arm64: dts: qcom: x1e001de-devkit: Enable external DP support
config: arm64-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241108/202411080931.2Wgo6hbt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080931.2Wgo6hbt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080931.2Wgo6hbt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4146.11-4156.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/geniqup@bc0000/i2c@b84000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/geniqup@bc0000/i2c@b9c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
   arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
