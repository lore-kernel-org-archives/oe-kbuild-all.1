Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146121F582B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 23:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759275716; cv=none; b=HQk+lzklc3/avzWZ2zmXOjC8EfmCgZWd9iaN3jeLR5VO7DnMsVjWGBlm8mVqiw4tI705DvClbmauy1TUzBL87LytlItVStRA1od4OEjheR5neofcLWg+ZcN7jNPNxl7bvRTA4Bc1m2ivbruSApor6RDd0TQW0l2oU1CVvasow3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759275716; c=relaxed/simple;
	bh=setGPAaMl0szg+/+RCRHRq/BssOrcSKuvvbT1Y7tiuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gnlD00EnxQB5K9b9yRWD+LItuds7z/AkMp7GDh0jBfErd9IFPzZKSx/SKoLHLriPt2rmvx4ZTAMoEvN1s2x4VHdAQnea57RMPGlrgEEcsS4mvr7iZ941pa+W+Izquiv2IWYK6mBNZRDy5yg/D5DeY8GrR1zmLVC2Kz6+uAPcN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfhmdW8J; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfhmdW8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759275714; x=1790811714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=setGPAaMl0szg+/+RCRHRq/BssOrcSKuvvbT1Y7tiuU=;
  b=DfhmdW8J4yMFZiNt23wJBCihtfsEfubaQZv/t+ssxs9fsC1yghBjm54i
   eYIdEYRsS1idsFCDV35ZuUeDwdvXCnh6MUsrf5fklKiS2dVzamFbgB6FZ
   ypoCG7ttufJgK3Ha77X5nvMRGeCw3hsod07kuA4yrxRQPUis66ooRhtEu
   n/5vAZax1OUo9RXS+saTjQX05Rn5qFrunevuWsAbEfEaOaTCvt/NyVw20
   JJAosV+nppHr34DZAN5q3MJ3APlShEWjG+y/3KUkXwBe18F7VGFa/QDAh
   iCCP5HijtPgqQ+DqR0JSQfH8HygGjbN3N7hAc5bwB1TVGgLin2ikhdRq/
   g==;
X-CSE-ConnectionGUID: MrmXz9qDR462epBdX4Km9Q==
X-CSE-MsgGUID: gycI/tt/Rq+zWTXmggynUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60758065"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="60758065"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 16:41:54 -0700
X-CSE-ConnectionGUID: 0EJbzPGIRFal3AHNlcA5pQ==
X-CSE-MsgGUID: IDpywVhfTau8MBoN+bkSeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="183053337"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Sep 2025 16:41:52 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3jyg-0002Z9-17;
	Tue, 30 Sep 2025 23:41:50 +0000
Date: Wed, 1 Oct 2025 07:41:34 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [pci:controller/keystone 3/3] WARNING: modpost: vmlinux: section
 mismatch in reference: ks_pcie_host_init+0x148c (section:
 .text.ks_pcie_host_init) -> hook_fault_code (section: .init.text)
Message-ID: <202510010726.GPljD7FR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/keystone
head:   860daf4ba3c034995bafa4c3756942262a9cd32d
commit: 860daf4ba3c034995bafa4c3756942262a9cd32d [3/3] PCI: keystone: Remove the __init macro from non-initialization functions
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251001/202510010726.GPljD7FR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010726.GPljD7FR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510010726.GPljD7FR-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: ks_pcie_host_init+0x148c (section: .text.ks_pcie_host_init) -> hook_fault_code (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
