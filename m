Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992F23F8D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711105283; cv=none; b=M+pg8Ir9AKHvY6s0AfKOgyvjlP7LyYNEtlHQ5635bvTFoq+VqdTuBQO7EIirh5MJ/6JKsQqg/2I/OXVWEgDriyZ3QxRqeaOLUDse3yugp/RYSZ/LSR7bHpwdfMzvCmFujsT0pBeCcvdkcXNb86UtlgxNkHU4YBj6V2+WEe5tuko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711105283; c=relaxed/simple;
	bh=Ld571bQDN8POx1+3gn3dSre3KIDf6//3QvYgO4U+bvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JBsDZ3CA3h3TSBCLcAngYdswikPBnnUQvW0bOnckaqLACBClLuCwPAMkknHRfZkeXnTmKeHc23U4BWz6vo+Wcsuqy3LK1iyVbGPrw7xYmw8cQ+9GN3ek78VfQLaFRTccyVzDKZOFmuxYsFAnIO2FoKicYVYxdWX1SdQvDCvoYd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LU7YUseU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LU7YUseU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711105281; x=1742641281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ld571bQDN8POx1+3gn3dSre3KIDf6//3QvYgO4U+bvg=;
  b=LU7YUseUm1nDj0OGSDQ/O/gs1UVFKCy3ufd+kZVyxrgV8crQcNMiGR3b
   q4q6L0isMbpLxr1ThoIXBziQ8X3+OOUCXjrZHA0iqQb5hWL+jcw6Iw5aS
   PNhhaDudP4PrKAByBUbBfg25o4ZR7ivQp4IRNuMZYZYmt2rURP0Om+Tst
   cwVmHw8XBq0gBPglCKgL1gsVsA2dZosVr7ddLuF5Dqxj7lnIdugj0epx+
   0WJXSm3uEVm0mkEQMgQO4pyIX3E5d505zbeRgPN/rgZnk1CK29fgzIEo/
   3YG99Z45U4Hz9ut04BmVStpMroM168m8VTAEo/4nWx2xWE8807cEhRHjm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6086245"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6086245"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:01:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="45875641"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Mar 2024 04:01:20 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnceD-000KFf-2g;
	Fri, 22 Mar 2024 11:01:17 +0000
Date: Fri, 22 Mar 2024 19:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 21/20118] ld.lld: error: undefined
 symbol: create_function_device
Message-ID: <202403221833.JCqFuzhH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   609541ba1afdca9e914cbef5ba00d3f5a32fd22a
commit: 1983276ceb62da2dda057c83fe676916b51fe939 [21/20118] ANDROID: usb: gadget: f_audio_source: New gadget driver for audio output
config: x86_64-randconfig-011-20240321 (https://download.01.org/0day-ci/archive/20240322/202403221833.JCqFuzhH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403221833.JCqFuzhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403221833.JCqFuzhH-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: ./arch/x86/kernel/vmlinux.lds:164: at least one side of the expression must be absolute
   ld.lld: error: ./arch/x86/kernel/vmlinux.lds:165: at least one side of the expression must be absolute
>> ld.lld: error: undefined symbol: create_function_device
   >>> referenced by f_audio_source.c:1028 (drivers/usb/gadget/function/f_audio_source.c:1028)
   >>>               drivers/usb/gadget/function/f_audio_source.o:(audio_source_alloc_inst) in archive built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
