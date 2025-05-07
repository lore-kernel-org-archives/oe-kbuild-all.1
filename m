Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E411FECC3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603104; cv=none; b=YIdemWHaa/fwzfWLFAGW3nVS2LY5uonFjzaV/Rd0J62YRcPrJGexbQRU07i5JgzRy7GI9lqrycHugdNhrnXhK7GSnF7/aySr3bpat5XQxdjA9hKT8yE87baGcU/1NRQ9LrAIVaoV/Fb0GXyuCTXzf1XKp6IEkxlDWyV5hcVtbk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603104; c=relaxed/simple;
	bh=VZvMlwvfi/raXvMsECSuh5r7gXpNoNvU6UueTjCep5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EOeBuFM0m5O0BwfohyvMtj1KaF5V/Lxv0NzpAzFwzWQkq8MaWgXgNvstaaB2LDhxGmILUfgJGBr7z1wehbpmLBNWhPEZ0xXiXlNOdfRYvAeQ/3VFlDQc65fyne6yyC+YlL4jBpABWajw6WYnATGmsfz/a9R+2N5HPAIcPTMBwic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYIqqRGa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYIqqRGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746603103; x=1778139103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZvMlwvfi/raXvMsECSuh5r7gXpNoNvU6UueTjCep5U=;
  b=SYIqqRGaXSrQ47WKLoO28ysmSB8gfXsjHO54XLicBXok450RtGTAGhjn
   P2yxK1pD4/0ZeEkSCBFqF8/zUFRV+Yz4q+XlXz51N9pPDayUjkDKpaqZv
   qkh58BidhTHbISqQr4O64RvLqipqrxmokPGzVNxOYROPoHBaKWxpqZe+J
   eqQSlCfJzrAfekK59OnYBwMzLpc0BUXta2Ekw6gW7jDpIkpTYXBMVrMh1
   dYSaiDOjDNERBeJ9rLr/pD6CIH7smLfE8G1YMlQF3atfEYHwzvxLC+Qym
   9JRXgbfrGtTs8nb6m6Iop+klPRUYsceAS25mYcp9HR+ODCUcX+EjnSWOF
   Q==;
X-CSE-ConnectionGUID: 3AJRiPzxSAOyJHfCvEcFVw==
X-CSE-MsgGUID: mCPg72HGRMeQjlJqxRHI7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35944811"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="35944811"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:31:41 -0700
X-CSE-ConnectionGUID: Yow+h6jGSYyWmXoEIgA6Gg==
X-CSE-MsgGUID: HbjxA7hZQBWVcgJmf5N3Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="173064111"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 00:31:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZFi-0007JX-1P;
	Wed, 07 May 2025 07:31:38 +0000
Date: Wed, 7 May 2025 15:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommu_pt_all 45/49]
 drivers/iommu/generic_pt/.kunitconfig_perf: warning: ignored by one of the
 .gitignore files
Message-ID: <202505071551.mKKju1fN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   a255c2979e9631e7bbbba212787fb50347d9d076
commit: dad063986e643de0aa17e02db73b2e20d99e03fd [45/49] iommupt: Add kunit test to benchmark page table operations
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250507/202505071551.mKKju1fN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071551.mKKju1fN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071551.mKKju1fN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/generic_pt/.kunitconfig_perf: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
