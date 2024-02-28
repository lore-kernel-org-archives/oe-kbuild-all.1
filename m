Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC5270023
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 21:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709156718; cv=none; b=c2uCTP/XW/0GM7yuIpEuwkn+6l2i7wx68ZZRZF6l2MMUBWsIhzDLvwTnZA+JYtv7wdumNKLf93t8tTKMWSl6paIGhkR3Xi93kPWwbynw1j3qYfvn+LX75ffyeMgxYuA8UVv4BrHbjQ0ZulCPTv6Tr+/SMUsXw8iQIC3v3QNSljY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709156718; c=relaxed/simple;
	bh=7gciMIl6nsKOv2OlSbuui4cJrScS0sXGAlBun3R/ceM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8RVq6ia2t8lE0XdN2/olhK6ufuF3lfYFvWHnieiUgWa7Jot2OXxPccBfYKShMSdll+e24ph3gScJ8IB13NHrFSGM0eJcXTxxPbc2P3ag4937x1bHdHu502ZwjtQFwBJ4OyaT/xoH6Divsn2ElbLIawxzgCLQrhDkv4nXYrZO5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5tLfpvf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5tLfpvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709156716; x=1740692716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7gciMIl6nsKOv2OlSbuui4cJrScS0sXGAlBun3R/ceM=;
  b=E5tLfpvf/f1ZemmD0JasR92mM3MTIZZUVIXPWTiGYs5+vxFvlHjpKw3l
   79vYcGhmyLYbo3OAwEeZozmD9rzQEz5jIFTl0jfTI50eCO5QwVACIE82v
   vOwUILjYAa6Y/jBTah63b7roG2NzNKg5TJQCEDh43ZQfWV//LicuB/p8U
   i9uycboIohdfdYHYS0fbZgSmCPTdyJw63/yh1jppizlPEYcaqn8um1oEX
   /6mmU8W3V9Odigy9NyPlQew0Pd3kEF850J6DiSMb37motHcNOR0uKGZao
   mIAE+xaWDXTfrdqJpVlxfam5I5mLzLbdAW8Od189SVK5o9iS3UjKmVVa6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14143990"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="14143990"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 13:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="38612850"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Feb 2024 13:45:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfRjk-000CPx-0r;
	Wed, 28 Feb 2024 21:45:12 +0000
Date: Thu, 29 Feb 2024 05:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 149/153] x86.c:undefined reference to
 `__udivdi3'
Message-ID: <202402290557.GirgxQ86-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   fde917bc1af3e1a440ab0cb0d9364f8da25b9e17
commit: f42730edbdb812e13ddfbebed4c49a6f30795433 [149/153] KVM: X86: Add a capability to configure bus frequency for APIC timer
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240229/202402290557.GirgxQ86-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290557.GirgxQ86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290557.GirgxQ86-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/x86.o: in function `kvm_vm_ioctl_enable_cap':
>> x86.c:(.text+0x25c53): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
