Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6053D15666F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 19:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713210300; cv=none; b=BrV45uilaACrSbOulj+Up6+zHhBb5aLU6g0DQ5ou5j//AFbwDTE56DW97Xssg4O2FDwq975J3gy6OD8dvbH/nkSl8ig9PDl9O8xyJ2wSgP7sqc4y6lfPPr9pDgFhV7NVDXTpYEMOoIacdZ9QloW5CX3ZYQPvGQTCkwYsDFPJh00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713210300; c=relaxed/simple;
	bh=VVQUaDMrXq2MF+yRA2rQxDCVmBC4+xiKRGVOaHs8DaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CBQ6+lXUZ/knKtZV7xtE7TdQaGqGo7TdojFPs/lh2p8f4DaVyapIqmg5gOSjULj0lcCabq1cE9D0VJuUH09qu1wWXuBdm+Nrbv/qym/dPfR/NBi34hd/9MV2cBk3MOhShM93RRdDPr7GULND+R66Y5ApsNY+fX+nx6xHIn2kLl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hrs/yois; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hrs/yois"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713210299; x=1744746299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VVQUaDMrXq2MF+yRA2rQxDCVmBC4+xiKRGVOaHs8DaU=;
  b=Hrs/yoisJlF9TrUEB4AJe5nuZAGvT7g5HegPUQTMu6udm1OjOiEQbg9X
   eJNfPZcKeNnoVv8VulgCfk7K3xQ2Dw8sxXuTIdk0Yc8PNCWFhbdwlRw6Z
   FBzO+vFq0B92pakExiBN1cVZZy+1qnq5r44yW4E2ay/duPaIFAuXtK/Fk
   AUd/XTxlhCQnxjtFGnrzUBijmArG4u9U14URMzduzXLrliOJXlAf295kD
   8aySi6543b72LCIycWkSQeA3UqYyIyqzv3AZy/G5B6L11yGOSnWam+I7z
   i1gyp3MyRB0cpSeZtTjD+pLRvqQOFjQxJuGE2Rf2aomGea/Ghy7GTG2tJ
   A==;
X-CSE-ConnectionGUID: VHvLVGDbSpW36Bvd7RZa/A==
X-CSE-MsgGUID: GR0EJ+7wTMm6iP+++u3i8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8788582"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8788582"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 12:44:50 -0700
X-CSE-ConnectionGUID: Ugzzldi6RLmFInjlyojH4w==
X-CSE-MsgGUID: Uu3mm/mvRS2ShX9FmiX4rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="22023864"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Apr 2024 12:44:48 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwSFx-0004bg-2h;
	Mon, 15 Apr 2024 19:44:45 +0000
Date: Tue, 16 Apr 2024 03:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenkuan Wang <Wenkuan.Wang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29355/30000]
 arch/x86/kernel/alternative.c:78:21: sparse: sparse: symbol 'x86nops' was
 not declared. Should it be static?
Message-ID: <202404160310.lPDiksZx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   acea9ae4ff468479f36da39a79938b22666ee087
commit: 8243b036681b074fab34e18024d1ee24c656b432 [29355/30000] x86: Remove dynamic NOP selection
config: x86_64-randconfig-123-20240416 (https://download.01.org/0day-ci/archive/20240416/202404160310.lPDiksZx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160310.lPDiksZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160310.lPDiksZx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/alternative.c:78:21: sparse: sparse: symbol 'x86nops' was not declared. Should it be static?

vim +/x86nops +78 arch/x86/kernel/alternative.c

    77	
  > 78	const unsigned char x86nops[] =
    79	{
    80		BYTES_NOP1,
    81		BYTES_NOP2,
    82		BYTES_NOP3,
    83		BYTES_NOP4,
    84		BYTES_NOP5,
    85		BYTES_NOP6,
    86		BYTES_NOP7,
    87		BYTES_NOP8,
    88	};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
