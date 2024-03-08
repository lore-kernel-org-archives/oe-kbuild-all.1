Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8C11D699
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709937427; cv=none; b=JlSd34FQ0GlxwkPO64zSJ5H/AcTKlpL2xd+JxeIv4YQ8h2mJXntl/tBX0OQWKvZn92pgXQeb4WTljrAn/SwuXS+4GdeUu8/tFcMZxjy9yW7DP67xTPg1ZOZpBeLTi5RCsR4NY43k1wWyoXdhiqUDSZ1b1hFvR+abFQjzAPfj29k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709937427; c=relaxed/simple;
	bh=i1AWGzqaMYr0m/78c7B5WiixN1nITdHa7jCRvOT2MO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MsyYqpoQ5eEz9q5fQq7uanZjTODiK1MWqOYSJkb7ECheiCkG7JvS4fuZKyoWOYFVFkBUxmvV5yuNtNG+1yEth4OMBYfiTjLnxuNY1gDfTEKcMSVEc/uo4nLy7CRjQhwQjkyPa2rM07caukt61x0ofbayVPqXaqGV7aqBmUwyAls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZ9L3O6M; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZ9L3O6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709937425; x=1741473425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i1AWGzqaMYr0m/78c7B5WiixN1nITdHa7jCRvOT2MO0=;
  b=KZ9L3O6Md+axDidc4BeTD7y1Rng/rsOHuWwKY/3WdziKOu5Tvtp+HpYA
   0o0svA1/Vu5m03ps/pBf525Ua4Jf/qVDCbI8+hl0bLgLkoEdfxD/7G0Fx
   1pb/qJeTZ4btaKYcNFQ3B47PVP5pUyBjXx4gN+3WFBv6TmNspTdjIzB1d
   mPRfplBzqj94SMfjeUOb47XskiW2gLo3SgO11tkiflMzZB9P/F/YEMouc
   9dTyG4v4MZuHQJmFIcOlhhuBxCHWoPjB5nJrW4ZIuqgZlNm665qVkgM22
   9uhrRlJReugNeCa/WhNV4iaATbP8mv3cLisD78mJq7tgrcY7SPxfODVwg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="8428470"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="8428470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 14:37:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="15191654"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Mar 2024 14:37:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riipp-0006lT-1W;
	Fri, 08 Mar 2024 22:37:01 +0000
Date: Sat, 9 Mar 2024 06:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stffrdhrn:or1k-fpu-regs 1/1] make[5]: *** No rule to make target
 'arch/openrisc/kernel/fpu.o', needed by 'arch/openrisc/kernel/built-in.a'.
Message-ID: <202403090641.BRmOQDbA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stffrdhrn/linux.git or1k-fpu-regs
head:   723143ca525b2e2933b3a8886a3b9964f6c68fb6
commit: 723143ca525b2e2933b3a8886a3b9964f6c68fb6 [1/1] openrisc: Move FPU state out of pt_regs
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240309/202403090641.BRmOQDbA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090641.BRmOQDbA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090641.BRmOQDbA-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[5]: *** [scripts/Makefile.build:243: arch/openrisc/kernel/traps.o] Error 1
   make[5]: *** [scripts/Makefile.build:243: arch/openrisc/kernel/signal.o] Error 1
>> make[5]: *** No rule to make target 'arch/openrisc/kernel/fpu.o', needed by 'arch/openrisc/kernel/built-in.a'.
   make[5]: Target 'arch/openrisc/kernel/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
