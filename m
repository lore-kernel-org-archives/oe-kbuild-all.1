Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BDE2701BF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222941; cv=none; b=i3TR2prcUBPit3YVKaV46b9p22kl0laeZO2cO37yKMTbEl08AXMSqwL9KfpiKelcDrBDYk04k8C4V/VQ1ZzNHdGwpAq19AvKwYUMcFX8HNlbNKL/1xpaiYEfeTrO51p+rcZyoKW+2fkdNlya3nxqKt0QuV2lz+CJMBN/7Vg9r8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222941; c=relaxed/simple;
	bh=EyB6FEHPg5EejcX90oRIDT0yqBDAOBc2luri5mMy+lI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SmgZt2IksMv8G4tK4zEvVxnhZcoXyidHhpeJgaEsYV4pDgNPYgezKuQOuBVPIp1ATR8xiPUdZwzp8Ss9zMT8tCNK04zAkHCjWXrvaG5sYxfif5CWd3Mv59IOD9yRKNE7Cp0B2O/cvrqWRYRkyX5E1oO8PCJX6d+4Wf+Hb296gKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2rt6qW2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2rt6qW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747222939; x=1778758939;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EyB6FEHPg5EejcX90oRIDT0yqBDAOBc2luri5mMy+lI=;
  b=i2rt6qW2hqMmxf+VHSmmlDYnOCZQDhQBuzrdeiV0j8a0O1h+KAlRhvgu
   C6c+P2lcu0fvGlr5XdQY3CxGuejx39+aXUKk1bI6nSf3ex7lvEZsD3GTt
   YOPbQDw5PJ8CJrmYN0nJlAebVjHW55pxL4/K/4V1CEgctqTMCFjho/hcQ
   D4LQka2dRfuXgGDnm9b0lwVVp0vO1Ghkrf5TF4PVOTdkALs93kdXJau6h
   qDkCN9CEaMLPxCIXQ1tkmY3Dre/x98FQN23YHVnpLRFINcr2ZYr6eCZKn
   JgXk2/9uq2tScpofQwDO+W/zsU+bjtMXrMaP1fnBBJzt431B5M91UPvsc
   Q==;
X-CSE-ConnectionGUID: N+74nFJxSfeJWDLXoU3juA==
X-CSE-MsgGUID: wQrMmohSTCe/YIQNkWljQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59747094"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="59747094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 04:42:17 -0700
X-CSE-ConnectionGUID: cIGPQJZERlW+1xrqzmy6dA==
X-CSE-MsgGUID: OJp0eeuJS4ip+EZ9mw55bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138509391"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2025 04:42:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFAV4-000H3l-1i;
	Wed, 14 May 2025 11:42:14 +0000
Date: Wed, 14 May 2025 19:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v5 68/71] include/linux/riscv_sse.h:11:10:
 fatal error: asm/sbi.h: No such file or directory
Message-ID: <202505141938.bixDbR16-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_raid6_rvv_v5
head:   2ae8099f491b2630b000d18222d07551bc2653cb
commit: 774c4e250a9c302151bb8d7b50565c1c228cf3fb [68/71] riscv: Introduce HEST SSE notification handlers
config: x86_64-randconfig-072-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141938.bixDbR16-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141938.bixDbR16-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141938.bixDbR16-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
>> include/linux/riscv_sse.h:11:10: fatal error: asm/sbi.h: No such file or directory
      11 | #include <asm/sbi.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +11 include/linux/riscv_sse.h

15bd664b9b9b8d Clément Léger 2024-12-06   8  
15bd664b9b9b8d Clément Léger 2024-12-06   9  #include <linux/types.h>
15bd664b9b9b8d Clément Léger 2024-12-06  10  #include <linux/linkage.h>
e59035d3c5a1cd Andrew Jones  2025-03-19 @11  #include <asm/sbi.h>
15bd664b9b9b8d Clément Léger 2024-12-06  12  

:::::: The code at line 11 was first introduced by commit
:::::: e59035d3c5a1cd99b4f312b7290a941642a50e64 riscv: Fix arch_sse_init_event

:::::: TO: Andrew Jones <ajones@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
