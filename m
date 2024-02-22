Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE078E573
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 06:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708583683; cv=none; b=QVGfaBzx35fCq+QiV3eBaP5MJlWAhSj9YeOv2K56m/sdupn+4UD4zb0U5EvbJySj+RaOSxE0DRCgOgRbbcEcFT7Li7BRDooSWfHbCFmFAWA/h72q3RcWq9gWMUAcubzoXzz50IIiQPg9OrC2IPKdnGVa+gvzDxhiOEfsgvm1v4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708583683; c=relaxed/simple;
	bh=IWc5pOVghQrScM3ECo1u5pGDjUU4hZ6xdtmzVFyIAsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j3OtoQLCrLf9kv6jbok7ovJRLIA5EcgH7GFISHVUYJnjs63LL3FGVOjfR/Z8gL9QTyNDuBtg4aZhHfHA+JYSCZ/a6PoQF1XeVE7YJntuVAkKh23pimH2f/Fi801yINUpV3xtbGatbVXAgxpJ/UAyarp37CATGCr9BjNrwsQ74eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YyOGFgCL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YyOGFgCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708583681; x=1740119681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IWc5pOVghQrScM3ECo1u5pGDjUU4hZ6xdtmzVFyIAsY=;
  b=YyOGFgCL7FSwicdd7YmzwIbyjIheQHDT/x4o/oonzqfUUq/CTIh4BKwq
   BGcAlCZNzspZyQsNgcPMykTmMRV55aTu3BjGCPyK4il4pmrc3LrPivJIP
   QFf6XmnS05sa4SaQ+lVP9CxX3W9YTf7j7Z9clngpESN730LUju1Q2p44S
   1mtVJKAafL8/U+qjk2h5AvR+qn3QXv1QctPoZjTlwVtNEo0SDoMjS2CSo
   DER2GMWMtiMe77DTRKV4w+Pcu/J/Cd14CgGTnF/nsmmGWQuCV4537/j6u
   g5d2uVMg3Z6jjHV6R7kWHk4+TVaEorgYKx/2o9cFv29QwNcN4DTKueupG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2939830"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2939830"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 22:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="10074783"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Feb 2024 22:34:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd2b9-00063A-1D;
	Thu, 22 Feb 2024 06:30:42 +0000
Date: Thu, 22 Feb 2024 14:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5071/21630]
 net/appletalk/sysctl_net_atalk.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202402221413.OLVDezAt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   caea2096c89e8d8cbaffde0d33f3c6d748c4d0c5
commit: 26179c0fe28fb046069105a0069632eb8e36a5ea [5071/21630] appletalk: Fix use-after-free in atalk_proc_exit
config: x86_64-buildonly-randconfig-004-20240220 (https://download.01.org/0day-ci/archive/20240222/202402221413.OLVDezAt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221413.OLVDezAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221413.OLVDezAt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/appletalk/sysctl_net_atalk.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
