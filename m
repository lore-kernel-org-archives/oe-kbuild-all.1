Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A29D1CACDB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729075752; cv=none; b=pmQlwp/vmsBpN9/Ch94YZQbHbrA24/3zz11cA5t1g5Iq2fKCx42PZV7Oiqs8HWxXxx1dc/Xb8/sb3zN6eUcAIYT2s+wAaEt9yUe4eWeFXOhftWkJ0l+cKfCmXqpd1KIAeHU3fbcTK5aZrwom8/TKUcH1lI5wtEp+DuDSMls/Kb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729075752; c=relaxed/simple;
	bh=GVadaHhLcLrtsnROAR0lvUMnMNFCcrfnydA9gx3pUJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pOYRcXuGbaAyqeN17BZVHsxYudV4foi4rY6T2s3PttvYdkHKBQ1ZZBGxttF53iYPb6mkWDzGEA/8QYhZrY97awUYzeywu114oPawNwSkWbqef0D1+Aa4uu0xu47OGGInyqN4ojwhx6/Ko2OekZ9T5m8VyE9i0zOJIWODdMwiTj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JY/L9mMS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JY/L9mMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729075751; x=1760611751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVadaHhLcLrtsnROAR0lvUMnMNFCcrfnydA9gx3pUJA=;
  b=JY/L9mMSCsTIvisFi9TEpkZiXg0PEl0RMbyQZdtuwT/zCjLBUybYrFpm
   yvxjAXcYPQmA6YDcOuGC2YY4Arm06oEe1/H9iLYarDbr1AR8lgGRAm/tR
   xcqrq8JKTjYCWh7tbKoCtcyS8/Gdqg92tCP7p2Zzn1hfRaUyud5lBjj0L
   sDq3cxl1OC8wxNts5smMajUMYgP21ghHjEfUtA9cDWTD+7U1itQJGpMht
   cSewmWkUCJ7aKAlZ/l5nRiPaGa0QedHKsvlHR8/0jblHimZIwGQU0iH9S
   vx9t3lWT2llE3bKm5iYiWSmuc39LCrDOJa7QmSov5W8t0zk5esI5cucAq
   w==;
X-CSE-ConnectionGUID: f4wpoWnYS7CI+Br+ktYqKg==
X-CSE-MsgGUID: 6uIbBZKkRNmHBbHFx1ypyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39094895"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="39094895"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 03:49:10 -0700
X-CSE-ConnectionGUID: Mjsy7hInS72FoNiuhNOl/Q==
X-CSE-MsgGUID: HHx5ug7+RSuabrGFUcfE1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="83268292"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2024 03:49:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t11aT-000KnR-2V;
	Wed, 16 Oct 2024 10:49:05 +0000
Date: Wed, 16 Oct 2024 18:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3] arch/arm/mm/alignment.c:775:25:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202410161818.37zUnmK2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   c0f411fb8c7bae1746892429d7a32ba8ed78e72a
commit: c0f411fb8c7bae1746892429d7a32ba8ed78e72a [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r132-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161818.37zUnmK2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20241016/202410161818.37zUnmK2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161818.37zUnmK2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mm/alignment.c:775:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *ip @@
   arch/arm/mm/alignment.c:775:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:775:25: sparse:     got unsigned int [usertype] *ip
>> arch/arm/mm/alignment.c:790:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] *ip @@
   arch/arm/mm/alignment.c:790:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:790:25: sparse:     got unsigned short [usertype] *ip

vim +775 arch/arm/mm/alignment.c

c2860d43f5dfab George G. Davis   2009-06-04  768  
1bb9fb0a147f9d Russell King      2019-09-06  769  static int alignment_get_arm(struct pt_regs *regs, u32 *ip, u32 *inst)
67e15fa5b487ad Russell King      2019-08-31  770  {
67e15fa5b487ad Russell King      2019-08-31  771  	u32 instr = 0;
67e15fa5b487ad Russell King      2019-08-31  772  	int fault;
67e15fa5b487ad Russell King      2019-08-31  773  
67e15fa5b487ad Russell King      2019-08-31  774  	if (user_mode(regs))
67e15fa5b487ad Russell King      2019-08-31 @775  		fault = get_user(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  776  	else
25f12ae45fc193 Christoph Hellwig 2020-06-17  777  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  778  
67e15fa5b487ad Russell King      2019-08-31  779  	*inst = __mem_to_opcode_arm(instr);
67e15fa5b487ad Russell King      2019-08-31  780  
67e15fa5b487ad Russell King      2019-08-31  781  	return fault;
67e15fa5b487ad Russell King      2019-08-31  782  }
67e15fa5b487ad Russell King      2019-08-31  783  
67e15fa5b487ad Russell King      2019-08-31  784  static int alignment_get_thumb(struct pt_regs *regs, u16 *ip, u16 *inst)
67e15fa5b487ad Russell King      2019-08-31  785  {
67e15fa5b487ad Russell King      2019-08-31  786  	u16 instr = 0;
67e15fa5b487ad Russell King      2019-08-31  787  	int fault;
67e15fa5b487ad Russell King      2019-08-31  788  
67e15fa5b487ad Russell King      2019-08-31  789  	if (user_mode(regs))
67e15fa5b487ad Russell King      2019-08-31 @790  		fault = get_user(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  791  	else
25f12ae45fc193 Christoph Hellwig 2020-06-17  792  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  793  
67e15fa5b487ad Russell King      2019-08-31  794  	*inst = __mem_to_opcode_thumb16(instr);
67e15fa5b487ad Russell King      2019-08-31  795  
67e15fa5b487ad Russell King      2019-08-31  796  	return fault;
67e15fa5b487ad Russell King      2019-08-31  797  }
67e15fa5b487ad Russell King      2019-08-31  798  

:::::: The code at line 775 was first introduced by commit
:::::: 67e15fa5b487adb9b78a92789eeff2d6ec8f5cee ARM: mm: fix alignment handler faults under memory pressure

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
