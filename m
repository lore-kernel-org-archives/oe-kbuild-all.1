Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F9374180
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831219; cv=none; b=ciNCnE+u9JTXyQBhlUAov4n6OCU322Dr5AGUrmso2GjwxdVomxwpj7EI48iJyLq2me+vmhWDgQ/H8Lb6ksXvaqNGoEQtY+YOMfzMvzhjwXqTWGlCugt+nPHsb8F3AmNEnfPwq6p3tR844aHfOSmAlNtgfBPpdfJn3AiGckiD+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831219; c=relaxed/simple;
	bh=IN7HZ6soPd52HbNKCGvl2AULky4En60e719BSV2CJzo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HUbQu+NjjEeb6MsEG/u1tIdLdkBtuszZBGwmK947o9EMSGYaO6kQUrixK+NzyAK270TrsNXaT+j6zDwcFungrEOUyCvzKiEGUiG70s71PostKCzeWTmSKj3yGgHmzBbppFjCy17vjWUQWaogUn7OyeJ6JZDFxPm9l+gdANgo4wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdkOYkto; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdkOYkto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768831216; x=1800367216;
  h=date:from:to:cc:subject:message-id;
  bh=IN7HZ6soPd52HbNKCGvl2AULky4En60e719BSV2CJzo=;
  b=EdkOYktolervSgPCynA9i2tfBC0ZQ5b9v/qymlFCI7Z/Mk73UotZkFd8
   Lt40EGvzQci8zp6pP262vNY7ROyBSe0h6RtJCQA9iBtGcnmnQFQQKhAbY
   Ca29iiYG95alUdoqXPWqnLf9hI1MxyEA2Zy879mXizrbZ4+5P/HYSq6YH
   0BAivipK9wu9pXBvwQIxdwjGG12JGf1atJ29Iy8IBwIG9zrmn+r0TtiyO
   EvO7TAWVcUYaOYx6zgMqJ8mbKWao7RP1AQkDy2rw3adeS5xltdX752ZK6
   gbulm2deKF7FM2MTfQRzNd9fKoZb6idM/mEABGeup6ppBXj78TaYsqsuR
   A==;
X-CSE-ConnectionGUID: I/Pup1OeTpSlg1ZKn2Pb3A==
X-CSE-MsgGUID: moiMIB30Rcqi7jpclWjTjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69242099"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69242099"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 06:00:15 -0800
X-CSE-ConnectionGUID: TI2wszaSS4m/44KzE/62Aw==
X-CSE-MsgGUID: GQqExNf8TcmWqsyxu2uCFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205918786"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jan 2026 06:00:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhpne-00000000NrX-21LM;
	Mon, 19 Jan 2026 14:00:10 +0000
Date: Mon, 19 Jan 2026 22:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: arc-linux-ld:
 drivers/pci/controller/cadence/pci-j721e.c:648: undefined reference to
 `cdns_pcie_host_disable'
Message-ID: <202601192149.m9qDmfLW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 1c72774df028429836eec3394212f2921bb830fc PCI: sg2042: Add Sophgo SG2042 PCIe driver
date:   4 months ago
config: arc-randconfig-002-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192149.m9qDmfLW-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601192149.m9qDmfLW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601192149.m9qDmfLW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/pci/controller/cadence/pci-j721e.o: in function `j721e_pcie_remove':
   drivers/pci/controller/cadence/pci-j721e.c:648: undefined reference to `cdns_pcie_host_disable'
>> arc-linux-ld: drivers/pci/controller/cadence/pci-j721e.c:648: undefined reference to `cdns_pcie_host_disable'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
