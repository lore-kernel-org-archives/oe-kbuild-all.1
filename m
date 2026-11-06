Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946467;
	b=VDZmQdtoyFicmgjgnwfPuTvxU2eZKDwi/qdsSGai3/HWIgbep3/01WyYYYKjKwT4nTvE
	 z3EPbqIHeHd6UR7DcfiQZPwbiTo3zC+waZufOdoll5QFF2D54CXT/iyez2JOFl9wGOO0o
	 GJV+bGAtOjnX12qy+F3bRomaCY5H8H+Ll31GsRXMerxviTW66aXnbwR7hyNonOc3CuQwH
	 kTUOLaPDIOdR+O5umznujf1cWzTy+W0WCbx45WxN6+IEBxA2022WymEUfmvmI2TWg6Y3E
	 PzUlb2YFXZ7fD3H7f5ekEdTGyaRwhAtWafURkZ9bRh8KvAvl+qJymWyV6EuVrFyuM+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946467;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HmkPZ3kpTRrtMUknVi2xUKv7awaAAVna2oOL6C5zdQA=;
	b=kq0sXgGOL4X5HyS5D0D9/fIStACY+o+RIJBxR4ms+mywwfmw2bhO5EKkTO2+d3lNDN7u
	 A/D/NKz/0nriJ9N66WiyPC0kEMJgq1o4QBXpFfweuhTGAr38sgc4ev4TSS6Co7FL+iDVj
	 oU6XzxbVQx6Y1jzbxuA7xxvLeoQR2vH26IrWvf0kSGvW6FvK+BvOjxhGIfV/JXlPvKbLj
	 dJvA7uXxOgl5vNklyT5GUu2qJSOUGiDu33/J24arCCxWl4iJwMldkOTYVXa+VV57iZ+Qc
	 2ADQKloBRA9byrfAKCQAbIDOtSNlQrMPSyTdq/lcL+dQIlKuQ8TltQ1fRblmKM07t2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O3wBiKdE;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA85B606A328
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 06:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA85B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O3wBiKdE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793946465; x=1825482465;
  h=date:from:to:cc:subject:message-id;
  bh=oBtzRRreByzCD/OhJa2+VcYv9jfWPMssyB/+edY2RuU=;
  b=O3wBiKdExwRkEag6VnH8uEwx9ufRtkEa0n87De4HR7GxipQKRVua9dWW
   tSkB3mnt58OY63fNsb5DDLn7oKR1k/4TFS6x0sTNFukUMpi9aX5lrCdLO
   TPhmwQxf3ZLQ9O/kMeGrslZD31aTnSJWTSSAorRrzXr6wiJq7RmeJ7vFw
   jswdacDHTBfzub+y5XiUvosxNRT+dQO9Z9pyh3tdCQQ6vUnpaUHOVwXJ4
   6DoSB1S+PNJieVtSdn3l79OW4QlBP++5fvMMZ7IcpWsyVn5Rg8UL+hZfg
   djgmnRG1hiF5pXoV6ZxmsUJWD0TDQ0yy9DaUNzWG+DiWpPWR6aQZvm0I2
   w==;
X-CSE-ConnectionGUID: wxi6WpPbSLeDT+nE2OChvg==
X-CSE-MsgGUID: 08lyVMG0R4qpeypA2siHag==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2642507"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2642507"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 22:27:45 -0800
X-CSE-ConnectionGUID: hDYr/cSoQkuklX62jjrFEA==
X-CSE-MsgGUID: vaRVau78Q7mblLVv745D4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7106081"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2026 22:27:43 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPDQL-00000000A6N-0gZl;
	Fri, 06 Nov 2026 06:27:41 +0000
Date: Fri, 06 Nov 2026 07:27:12 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] WARNING: modpost: module
 f2fs uses symbol dma_buf_vunmap_unlocked from namespace DMA_BUF, but does not
 import it.
Message-ID: <202611060747.n70OKXIX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c92f8749be90ce4097c06978a735a607836aba33
commit: 4f89cba389563d156f55da6d344d5d9a16055d33 [0/2] ANDROID: f2fs: add F2FS_IOC_LOAD_DMABUF
config: i386-randconfig-2003-20261106 (https://download.01.org/0day-ci/archive/20261106/202611060747.n70OKXIX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060747.n70OKXIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060747.n70OKXIX-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> WARNING: modpost: module f2fs uses symbol dma_buf_vunmap_unlocked from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module f2fs uses symbol dma_buf_end_cpu_access from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module f2fs uses symbol dma_buf_begin_cpu_access from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module f2fs uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module f2fs uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module f2fs uses symbol dma_buf_vmap_unlocked from namespace DMA_BUF, but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
