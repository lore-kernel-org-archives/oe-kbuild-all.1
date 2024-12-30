Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2A1A2397
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549085; cv=none; b=G875TwUYhFNxHX/ryLLuYZb/UuMqY66zvJkvJLGHwqHkhkId8Bxt7necQ7wwgCl5hqWLPso5rEgT9D20ndWDJpVUw5ZR0KIYcnxhks+zsAHn9qyCJEU0P9ShEWndPvBM3AeE+2oyReN3c7hy2xnWeoDrXANK4wJ/NDrwe2f2V/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549085; c=relaxed/simple;
	bh=5ajLzXH3Hv0qO6ZNr913B2uN0obz6pYwLHivMOKZPCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d3tG28fnS6nHskxG0gfnfbL9v0tIKKkK8z1712iAedfy/RebweyRV7W1gKwYY5RUA0gRtgvzovM0sYwAQ53JJTtwV6Ii/b8FIgxbcH9Uog50YAIr6gQOdmF/7ZBGyOWof+HNTPEo5Fa9fr/EizuiMj0EazKhL3HfaIABwhuFjVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTP5qqko; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTP5qqko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735549083; x=1767085083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ajLzXH3Hv0qO6ZNr913B2uN0obz6pYwLHivMOKZPCE=;
  b=fTP5qqkoQVgRJjqYenH/rD0+IwSvaqCoLmz73rCMHnkvrZa2WKX8E1kY
   npO23yiH6vWT/P2VkXkKInOhDB70lGUXNK6/NSJTvQ+bXWVfHZ7W9kWGm
   C+nva7y6lGKgz8DBzOUYEmH8YWVanSIOoCZajrXUc+Q5IQNXNuRWtF1q/
   A1qS70TbxKYpvAJHP2ZdC1pUpdnetknmqTpim42mAWNlGHWtr9K9yiJaw
   dM4ClKVuA98e0ExKQ0TkzLcwvVRLAVSpFMW7X8NUDom2AlzudWzrejAZV
   vAhFCJzqIP/b1+iS9C2Fum8RWqF8FLQOaM29WMyuj68dW+ksPddk4U4nA
   g==;
X-CSE-ConnectionGUID: /ff0qvS5TcKLN09QVnHQLg==
X-CSE-MsgGUID: FLY/D97WRxCQvw2+yd3k4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="47199662"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="47199662"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 00:57:54 -0800
X-CSE-ConnectionGUID: Vbs2w7hFTtmYgAzaEMN+QQ==
X-CSE-MsgGUID: VF3XUFolRP+fpHbOziSi/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="101250946"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Dec 2024 00:57:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSBax-0005ZO-0I;
	Mon, 30 Dec 2024 08:57:51 +0000
Date: Mon, 30 Dec 2024 16:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/15] ld.lld: error:
 drivers/acpi/acpi_extlog.o <inline asm>:26:3: unknown directive
Message-ID: <202412301635.3jk15iKu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   dc2f57f443345aeea3a66a9ebf744b0217983df4
commit: cfdf8d569aaf1f10ecfb184b23c3a0ebbb675c14 [13/15] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: x86_64-randconfig-123-20241230 (https://download.01.org/0day-ci/archive/20241230/202412301635.3jk15iKu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412301635.3jk15iKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412301635.3jk15iKu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/acpi/acpi_extlog.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $377{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/thermal/intel/intel_tcc_cooling.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $206{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/thermal/intel/intel_tcc_cooling.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $418{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel/tpmi_power_domains.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $84{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $1904{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel/uncore-frequency/uncore-frequency.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $1568{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel/uncore-frequency/uncore-frequency.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $1569{:u32}, %rax
   ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
