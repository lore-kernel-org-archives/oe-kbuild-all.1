Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4A71C8634
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 22:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786653; cv=none; b=W05evBqjKIKEHMj4nz+K+y//6aEoeE+PrAuFYIf/+Nl6cXdl2pceo/euuZoTURksHws3jzFfDytn06AjgpSOtDXgqmJleVQlWUA+TFvcPAi+PSnDxre6MlxajF625c+puEyu2qMIHiVD9cFjwEUm+eEAQTfwN22jofmwmBEIWYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786653; c=relaxed/simple;
	bh=80UMSuDULuLdnAepS3+be3FkXbkVdB0X9voscR4nA6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s69VzzVdFOQ13pTomKnE2HN7NuOtKRfcfHAkxrGkQstmAbiZFPSXv722Ap8bS7ndxE29+M/7AOxYpPP8KFQALnCYX/Dyke5DWXQ2IV6FZzLBIC81YQTLrL8AzXB/Ux6M2ASC6m6hWmjTexQnkgGi9dfZlhnxLrsoi64h1Gh0sbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IY6Niu4Q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IY6Niu4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773786653; x=1805322653;
  h=date:from:to:cc:subject:message-id;
  bh=80UMSuDULuLdnAepS3+be3FkXbkVdB0X9voscR4nA6g=;
  b=IY6Niu4QLcuvs4Usz1UM6S7JgchSbOVHNpqnjPG1x297SG7apDzkUnSD
   VBuhNkbf7NELVb61ONZMK7F+tj1pqQhnTQZ/hfDfign4uiW8wCWKcoqU/
   +1ZgGUt5jqkYJdu5xJqgdULuH/OES99JRqm73ytUGwCq6GIo0P/spQ/UE
   ye5/NYsHkZAnShL/UF+ew5pWB+5DfDcsl9FlIrAloHpCJu0pYrZyBh742
   rdPKJlLBa11VwTW0qYRrrTqD+96/5cczTG0Vod4Cc+JjcLLIN58Ko/a3H
   BXoCER3a/V4iHTgP8B6aWjlpk+bJMhepntNw1w69zJ768xTfcPgCNMJRL
   g==;
X-CSE-ConnectionGUID: e3mnWWJQQ1ObWwR/kPGiPQ==
X-CSE-MsgGUID: kfmPO0PMSD2MdyjVvs1s9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="97443059"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="97443059"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:30:52 -0700
X-CSE-ConnectionGUID: XTaUsrDKTpu/dzYGosUTdg==
X-CSE-MsgGUID: QLSormq7TX2VcfIXBzURGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="227370571"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Mar 2026 15:30:50 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2cw3-0000000027J-1Ssl;
	Tue, 17 Mar 2026 22:30:47 +0000
Date: Wed, 18 Mar 2026 06:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: Senchuan Zhang <zhangsenchuan@eswincomputing.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Manivannan Sadhasivam <mani@kernel.org>,
 Yu Ning <ningyu@eswincomputing.com>,
 Yanghui Ou <ouyanghui@eswincomputing.com>
Subject: [linux-next:master 5071/6828]
 drivers/pci/controller/dwc/pcie-eswin.c:381:1: sparse: sparse: symbol
 'eswin_pcie_pm' was not declared. Should it be static?
Message-ID: <202603180642.1rALz4hC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: cbbe59fa04b5d9f8e11138df4591653f7d2f8351 [5071/6828] PCI: Add ESWIN PCIe Root Complex driver
config: sparc64-randconfig-r122-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180642.1rALz4hC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180642.1rALz4hC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180642.1rALz4hC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/dwc/pcie-eswin.c:381:1: sparse: sparse: symbol 'eswin_pcie_pm' was not declared. Should it be static?

vim +/eswin_pcie_pm +381 drivers/pci/controller/dwc/pcie-eswin.c

   380	
 > 381	DEFINE_NOIRQ_DEV_PM_OPS(eswin_pcie_pm, eswin_pcie_suspend_noirq,
   382				eswin_pcie_resume_noirq);
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
