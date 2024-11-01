Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18A43F9C5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 04:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730435771; cv=none; b=bD6QVeQIs+D1J5i3+drU6uGJUUDWmzJUnH713L+Dx7NpXfuIO6mYf2pYR6c0TL+YDJSF/FOPomS7/eH+nvuKEGcf/DdyjLKTdAKVDg3R9EIL9lZqNWrhrVIByDMGVp7KqhWPL9RCboZFRKu5MUzTepGiD0e2Cxg/sr1Nj9vlaSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730435771; c=relaxed/simple;
	bh=6HV0Zp0reaZhynlagCPMwThPrigNLwlNEio+Cj1DHN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AnvGY4aGVO35OwRSo+U6qxITrsH1IHcz0SAPJHat+fd6/7LFMnZ7f4/WkDvGxyPR5n34amryxWobwEEQkQZr6nfBMo77z7Cc7UZCpFLGOqCcVBfddlFe33D1toezM0qPYPkict0zcBhSx9D+ZEnVHR3ExVpykKVvvaxVUGn94S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8EPySJH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8EPySJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730435769; x=1761971769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6HV0Zp0reaZhynlagCPMwThPrigNLwlNEio+Cj1DHN8=;
  b=F8EPySJH+gbRZ/1At1s6APytQ5pQh5po9FtuUZTTEiDLq1AyALRvXguy
   IBBVVU+ZVRlyd1P7x7QRhgF7Y8GqADfYAqOev8GJt3xj7YH4bu+0ieT+Q
   0GgqdvQZaL60PbojEX1FXM0TMk5/rz1Q+kdSUXPGubBGu2gMl0NwJ3oxa
   yMNSvOz/enAhyFNL5WHnuYwk+6iS+KZmRvsaUV096AeC3H2S/tUsaxK85
   ouuqLTd/vpnjcYafTvJW3tSljgFA/MtPc6mvYbx37x/No0bhtpRuwma55
   gMzn9/8JgPyHdmdg9Bj6FStn6vhv9vlTl4tJbFAveFFc2ZHN6dPkeajeZ
   w==;
X-CSE-ConnectionGUID: 9Vn8SoYVS0Sy6q5H9oF3Eg==
X-CSE-MsgGUID: g9cBFKhRS2ysDsnh6FL9ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41298487"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41298487"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:36:09 -0700
X-CSE-ConnectionGUID: VTMx/GcjT4mE/7jmcaE50g==
X-CSE-MsgGUID: bQqGa3oQSUaweKByKJOkKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82975417"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2024 21:36:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6jOH-000h8d-01;
	Fri, 01 Nov 2024 04:36:05 +0000
Date: Fri, 1 Nov 2024 12:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19549/30000]
 arch/arm64/kernel/cpufeature.c:1729:13: warning: no previous prototype for
 'early_pbha_init'
Message-ID: <202411011254.Q328bGAB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8c742fc5ad4aebf865be0fa53ebdbf26f0991e2c
commit: f43933b3f947a7f9314ec8d704c6ae01041dbbba [19549/30000] arm64: cpufeature: Enable PBHA for stage1 early via FDT
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241101/202411011254.Q328bGAB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011254.Q328bGAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011254.Q328bGAB-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c:1627:6: warning: no previous prototype for 'update_pbha_perf_only_bit' [-Wmissing-prototypes]
    1627 | void update_pbha_perf_only_bit(const u8 *bits, int cnt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:1729:13: warning: no previous prototype for 'early_pbha_init' [-Wmissing-prototypes]
    1729 | void __init early_pbha_init(void)
         |             ^~~~~~~~~~~~~~~


vim +/early_pbha_init +1729 arch/arm64/kernel/cpufeature.c

  1728	
> 1729	void __init early_pbha_init(void)
  1730	{
  1731		void *fdt;
  1732		int node;
  1733		const u8 *prop;
  1734		int size;
  1735	
  1736		spin_lock(&pbha_dt_lock);
  1737	
  1738		fdt = get_early_fdt_ptr();
  1739		if (!fdt)
  1740			goto unlock;
  1741	
  1742		node = fdt_path_offset(fdt, "/cpus");
  1743		if (node < 0)
  1744			goto unlock;
  1745	
  1746		prop = fdt_getprop(fdt, node, "arm,pbha-performance-only", &size);
  1747		if (!prop)
  1748			goto unlock;
  1749	
  1750		if (!cpu_has_pbha())
  1751			goto unlock;
  1752	
  1753		update_pbha_perf_only_bit(prop, size);
  1754		enable_pbha_inner();
  1755	
  1756		pbha_enabled = true;
  1757	
  1758	unlock:
  1759		spin_unlock(&pbha_dt_lock);
  1760	}
  1761	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
