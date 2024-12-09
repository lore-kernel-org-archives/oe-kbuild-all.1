Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B12949625
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719842; cv=none; b=GZyWEA2OrRCDAXBJO8etGO+IXdp/p2DNq/4s4QFV31NAjmkApEPY64TL/Z/PVRNqhNuDZsQn08m0zHVDVhDqL2hTL3TwhwXXOosDmYZWlHYJw8dt7N10kDNNsnhT0AzwLAMIJBmDnG7Ejb0ihGuojtk7HkRT/Q8alXWaSumbdlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719842; c=relaxed/simple;
	bh=8pQaewjaYf8VVqyoaQzqewaun1apldU5GFRUb5CLu8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ikutGh5AMCAlvRS0r2lbcwoRHuh2rzv3CRGnioYv5lgzCgaoyAjx9UsLPEWUieFnOklxidDAXVQcnSogtlYB9O7NrzHAHUkzx9Umu77tfkmcwOzmFNlwhcHKN/8fFPZ6OIVeZqvTFWcFPO2EHI21tDRJMC8ZX+DvjBPpHd0m0Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2Eo22BD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2Eo22BD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719841; x=1765255841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pQaewjaYf8VVqyoaQzqewaun1apldU5GFRUb5CLu8g=;
  b=Z2Eo22BD1PlW5Y+m5Gu+0cbMZzlFtNKNN687SOj+Fg8o5WN0tXKu2o+m
   c65iyRhR90svbqysEtTw0S6LhVkM9Z4q5PO708bzsYCRB2nysK1aqjvj4
   ExB+OKVio6TI5fIvhoXpoTgVNS3sVxObyZSP8fgMaWl3qf3pudIGMmBuS
   BqDPEmJiTKHSK78ddezk4QHJ1+D/6ExODJe2hqHe0XkvvtcEUsTvaB2GO
   F9hANk7jI02g8R4OzlrdRkxBV/kWIkxWh1k/Yt2ERL59ePqT9W8VvDl7Y
   vr2VbT+6tt6FE0tI+4C9ETTWkbjq5PUTQS1aFQmCLrQfM7UFGBq5IcqVh
   A==;
X-CSE-ConnectionGUID: qt05zOBWSN+RrD/0IDHmvA==
X-CSE-MsgGUID: H6ssdqVNROqrm4wC/5tRog==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33332744"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33332744"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:50:41 -0800
X-CSE-ConnectionGUID: clDt31+CSFKFu3gyskshpw==
X-CSE-MsgGUID: khRQwzp0Qhe7VfB/3+yygw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94655585"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Dec 2024 20:50:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVjB-0003vr-1v;
	Mon, 09 Dec 2024 04:50:37 +0000
Date: Mon, 9 Dec 2024 12:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jassi Brar <jaswinder.singh@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1321/1321]
 drivers/mailbox/imx-mailbox.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202412090011.eUm2er4P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oleksij,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   faa52e40c08916893e09ba030e616f92e4fc020b
commit: 2bb7005696e2246baa88772341ca032ff09a63cb [1321/1321] mailbox: Add support for i.MX messaging unit
config: x86_64-buildonly-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241209/202412090011.eUm2er4P-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412090011.eUm2er4P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412090011.eUm2er4P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/imx-mailbox.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
