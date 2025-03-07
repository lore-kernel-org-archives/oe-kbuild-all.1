Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD59125DF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 01:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741311181; cv=none; b=lx+LiueZAlt6p9Fd1d3oOX5/wbkGMUZwFXJlkNDeey3T1KEhvSlf5YkADu0vbY450bx6PuydFpG+l+sQt9iVy8dwibkBwtaUzas5/8bF5dHTj7qQX6xEdOuvyeSTYfcKcbfFV1hKWhA1VytV8Q93tDbIC2wkFuYIgz3g30CrGXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741311181; c=relaxed/simple;
	bh=h8CBJoFjkhREDrHIpFD7UMFjXr3AXo9LRYU19++XK4E=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJp+Zfn8FN1rRbXitcWQVVBh7Ro+tu9jp6rLTUaOMMkfvVxAa6AurT2iaeEuN9OTv/BSSmVDra/6SaDik2FmNH5K/HBSmr1W3FwyNCcU5KxYakD7ybPQ0rGGFo9tYly9aQkiO/TMCt+sEj9T95wEDqbnwDubpH32oyhLo/C+m8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afUoqKta; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afUoqKta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741311179; x=1772847179;
  h=date:from:cc:subject:message-id:mime-version;
  bh=h8CBJoFjkhREDrHIpFD7UMFjXr3AXo9LRYU19++XK4E=;
  b=afUoqKtauFAzdrfcTmctiuYEFVMtFfQE7ocBN4I8Y9u9qgokgzG/wciB
   y/qDjUs1aE2STPQJdlA48MLpMfYf/TtzFMibCUGhoZY7vQTWxajvIfAin
   VO+kwq9r7uL91KOn3xtLLM6DPa1OtUzH3ug7LalRCodvuWDjSRw4aHOI/
   LbWAtUyx/O7Zwzse3sqUXcgpPSgSKIcA1P5XhlEMOHDfMG4N6cF6O6gLd
   DBvk6AVlE2sVaAfnZj7JMIJRFYjw3n889rC0y4mjD+nndRmIBqGSbj4Kr
   v6Zk1NOFpISCa1Bw5TvevEmb+xHr+j0KwUO4rPT1Wh+dhg3i1T/Y7SMqr
   w==;
X-CSE-ConnectionGUID: bJcJHmYISO6uOWY28iSxJQ==
X-CSE-MsgGUID: Z6dGEUZ7TNO8Bhvel78Dyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52556693"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="52556693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 17:32:58 -0800
X-CSE-ConnectionGUID: erDGNT8SS3ulKv1mZU7wRA==
X-CSE-MsgGUID: Cju/1Ie4RvygNH//CpHCIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="119367478"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 17:32:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqMa7-000Nt4-2P
	for oe-kbuild-all@lists.linux.dev;
	Fri, 07 Mar 2025 01:32:55 +0000
Date: Fri, 7 Mar 2025 09:32:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/scsi/scsi_logging.o: warning: objtool:
 scsi_log_print_sense()+0x247: unreachable instruction
Message-ID: <202503070903.T6pELdy9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 79a4e91d1bb2a411a4ce2baa93680fa707567003 [1/1] device.h: Add __cold to dev_<level> logging functions
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250307/202503070903.T6pELdy9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070903.T6pELdy9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070903.T6pELdy9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_logging.o: warning: objtool: scsi_log_print_sense()+0x247: unreachable instruction
--
>> drivers/misc/pci_endpoint_test.o: warning: objtool: pci_endpoint_test_probe()+0x886: unreachable instruction
--
>> drivers/infiniband/hw/hfi1/chip.o: warning: objtool: hfi1_init_vnic_rsm()+0x34a: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
