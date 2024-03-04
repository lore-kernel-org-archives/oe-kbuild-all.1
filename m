Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4CA59
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 04:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709524929; cv=none; b=tKJ/TQk9sdrZoHBJtAp1QENDRfWrOagTGjMe0No1eiCYSvFMgOQVHD+Y0krk5LN7432zvzNRs1Ufd7Tp/GIRlhx+kH7iirr4jnOwbAxwS3RZ7SvYUcxvpGh38w4kr198QRPxCHGn3WMUJcEmvAQn+/guFoRxDSwxp8x773XjZas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709524929; c=relaxed/simple;
	bh=GJADbr/w2XxbkEf4WEUjskk/Uh7+pxupeJaj3PU3nEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IaqN3JOq9nI5k9ZlLhzr492y92k86XDRH0/UH8wItri5W7yPpNul76Wg/p2eFICP6Qj/7wHO9uXFw5uXXpV7QIa/XvQK9QkaGA7EJG+n4InD0OYMflKTIvTjDvqy1EqrbFSVRgKx/ACHD6U5m/8t+aKbzdQ5iO8npiJlHP4AvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjfS3Gso; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjfS3Gso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709524928; x=1741060928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GJADbr/w2XxbkEf4WEUjskk/Uh7+pxupeJaj3PU3nEc=;
  b=cjfS3Gso368iDrohiL32tnU4B23swlsIh43cUfgs8cW/sAL0qvsUC6vq
   OaAXBaOlXkz1e+nqP4APTH7vL26gX+wy0RutFVrm0EnQJKjSKr2biMWzH
   oaCULH59EAUDyNhkccR5LLG31JpoBa6l+jauaIAQebXX9vKdpXi1rfwue
   LyrxlvhBgMnobEZnOFZQcNo2jKzfLUpseSUWEpwmePq5LpHQW10pnshrZ
   8m3sDXZuMJst15X7uGpK9DTBdBVi7+7jS4pJcrZGzbc2u0SgZn9DL/f0Q
   1i9jH2h05OR/xjYrXg7pwM9GbYMYNlA1VlkMYBnMVixLXAMQutavPzYWK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7770676"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7770676"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 20:02:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9216856"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Mar 2024 20:02:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgzWa-0002KZ-2s;
	Mon, 04 Mar 2024 04:02:00 +0000
Date: Mon, 4 Mar 2024 12:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/arm64/mm/fault.c:743:17: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202403041121.daGsdMBe-lkp@intel.com>
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
config: arm64-randconfig-r131-20240303 (https://download.01.org/0day-ci/archive/20240304/202403041121.daGsdMBe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240304/202403041121.daGsdMBe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403041121.daGsdMBe-lkp@intel.com/

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
