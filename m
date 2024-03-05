Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0026A111A5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 01:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709601335; cv=none; b=a4kRO/MzjUgKrZRdB8IdJdjIWcEJEPL8WWtnGWijJf5rTteUUrz7imTrBe6JSO6UkL4zzdew8oCDxwsqnxcpfY90qv8/IFy43s/9Y9gOJ/sJpQxtQm1KZsYEQNzvNvY8QVYEinkZwA2mxMamGcHZS10/INELhiIjp6kTyae/kwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709601335; c=relaxed/simple;
	bh=fTo4tvmjCrnFJz7Kca6eiWy7QNWGe0FERd7UV/xLQSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FbHbn1twVRopGrDcRx3SVpG9QY/y49GhJ+SJYVCissoRDtywPEiHRAsZu1S0h8ExDtmgH448QtJrPPqGl/J/VSo/MwczgSn/zxKq3fVi/ohm2KcDtD9/SyN+3Al2YI35eMSx6VmcrQiDF2wTbNLjd//9Q9eyCAPv5yaqOQoO3q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eO/ueZx8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eO/ueZx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709601334; x=1741137334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fTo4tvmjCrnFJz7Kca6eiWy7QNWGe0FERd7UV/xLQSk=;
  b=eO/ueZx8Yvgi08F7ao3I0FX8IjgoWP8NMhuC8xLgVVrlqfwVB98I3Aj9
   J/b2mr/GelnQf/9N2Z0aHCy8ZkVMItSIHFvq4O87DKyVrjObzdg3F/PlO
   4sc7iDxww3Ja8znILbV3UZrV/092uF9VyyGe6mht+IyplvowGkJyZ3tlm
   bco2kug2i+/22Wb+aIcDZcs3lRwdLUefB9j40bVhU24M3N/pN+uRJ/TXX
   DAp9lEelKNKZw3fuDQ2/tpUyVP1h4zEJ3VKtv0Ne0HCnZ89Jxbcw065i/
   kPITe1IP1Tdo9CAs4qxw8lc3FH+8iQx4ffithejgHSOY0gqr9tCW2BBpP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3988344"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="3988344"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 17:15:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="40178906"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2024 17:15:27 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhJOu-0002tJ-0b;
	Tue, 05 Mar 2024 01:15:24 +0000
Date: Tue, 5 Mar 2024 09:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/arm64/mm/fault.c:743:17: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202403050915.jpFHhHQY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: e55f6ef6b718005b3cac70670420798aaf0174c3 ampere/arm64: Add a fixup handler for alignment faults in aarch64 code
date:   2 years, 8 months ago
config: arm64-randconfig-r131-20240303 (https://download.01.org/0day-ci/archive/20240305/202403050915.jpFHhHQY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403050915.jpFHhHQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050915.jpFHhHQY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/mm/fault.c:416:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int @@
   arch/arm64/mm/fault.c:416:24: sparse:     expected restricted vm_fault_t
   arch/arm64/mm/fault.c:416:24: sparse:     got int
   arch/arm64/mm/fault.c:424:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int @@
   arch/arm64/mm/fault.c:424:32: sparse:     expected restricted vm_fault_t
   arch/arm64/mm/fault.c:424:32: sparse:     got int
   arch/arm64/mm/fault.c:426:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int @@
   arch/arm64/mm/fault.c:426:32: sparse:     expected restricted vm_fault_t
   arch/arm64/mm/fault.c:426:32: sparse:     got int
   arch/arm64/mm/fault.c:434:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int @@
   arch/arm64/mm/fault.c:434:24: sparse:     expected restricted vm_fault_t
   arch/arm64/mm/fault.c:434:24: sparse:     got int
   arch/arm64/mm/fault.c:554:13: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/arm64/mm/fault.c:554:13: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/arm64/mm/fault.c:616:39: sparse: sparse: restricted vm_fault_t degrades to integer
>> arch/arm64/mm/fault.c:743:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> * @@     got void * @@
   arch/arm64/mm/fault.c:743:17: sparse:     expected void volatile [noderef] <asn:2> *
   arch/arm64/mm/fault.c:743:17: sparse:     got void *

vim +743 arch/arm64/mm/fault.c

   730	
   731	static int align_dc_zva(unsigned long addr, struct pt_regs *regs)
   732	{
   733		int bs = read_cpuid(DCZID_EL0) & 0xf;
   734		int sz = 1 << (bs + 2);
   735	
   736		addr &= ~(sz - 1);
   737		if (is_ttbr0_addr(addr)) {
   738			for (; sz; sz--) {
   739				if (align_store(addr, 1, 0))
   740					return 1;
   741			}
   742		} else
 > 743			memset_io((void *)addr, 0, sz);
   744		return 0;
   745	}
   746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
