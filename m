Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656920D4FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625850; cv=none; b=OE0hVlSBZTDhD6sleLLjBAoSaFQnyFwaDo639Gmi7pfBziipNNYMTIh0BlYBc3WkIsqTvkbDB+it6edm1xJzZLBEpiRwJ/QMAcvgvIG8LCoP/VyOfp15IYrHmDIzLdNATeFB8JaACmzeHPx5Zm/9lZQP4Z69vqJ29pnIswmuT0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625850; c=relaxed/simple;
	bh=HAp0eZR/ts2PzgEnAiaZ7pAa7AjrdQEfqf9cNyD3mZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=beTlhf+zbYSMt1WKyfddgFoOse1w9/2JOPdtI/SYatUpobGsZg0L/LhhAiQJMA7oxz+qdrWjsGEuRzocT9mKYB1gzyPfI94kirx9UDjq+unz6E6xxB6VJoSMCslBg+DZ5I10agUXCwjhSsuCVygt171n3xND8/+yP5E6xDTXQMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UF/q0Dxg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UF/q0Dxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737625848; x=1769161848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HAp0eZR/ts2PzgEnAiaZ7pAa7AjrdQEfqf9cNyD3mZM=;
  b=UF/q0DxgfNfGZfa4Wvd0fBrBqESa7z5xVb992oGnRNA51mE6v5P5abQd
   FNQtIA/9Lw5QBVvVEw6gSoZUGyhAsbH8WodgIiO6xW3t1+oVcuQrzGKKS
   w1jI8DqcqNNgWkKDR8RF9h0gl02HFXSeOUyGZ96GFO3C7O8vfBZWNaj8M
   PER6+NBuu+GNvtMIbQIFdISLZIjb4jJSAjYIL/lYlA0dsDDy6onI1TMcW
   Iuqp4zera8yci3D/nc07NY+lrbLdaeWhsW6BceYX08xhr4gpDHvdmRtQt
   cHN/SMD/CcSpKcBpEWn+2lz+uFuA8v094NdFYGbmxIkum1QEEbsh1/wdF
   g==;
X-CSE-ConnectionGUID: 9wAVJLcAT4Kk0tAwrYXwvQ==
X-CSE-MsgGUID: 9Vl+6Q5yRlOwpe3AMtb93Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41872958"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="41872958"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 01:50:48 -0800
X-CSE-ConnectionGUID: hs2/OV+sQIOvE9/aZLWftA==
X-CSE-MsgGUID: Cn3PoCLRQbW6Zfwfe2cG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="108016511"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jan 2025 01:50:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tatrG-000b0U-0q;
	Thu, 23 Jan 2025 09:50:42 +0000
Date: Thu, 23 Jan 2025 17:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2441/2441]
 drivers/iommu/intel/perf.c:16: warning: Function parameter or member
 'latency_lock' not described in 'DEFINE_SPINLOCK'
Message-ID: <202501231715.Cah68AnR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 7353116e271727de5994739fce84aa826702d3dc [2441/2441] iommu/vt-d: Add common code for dmar latency performance monitors
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250123/202501231715.Cah68AnR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231715.Cah68AnR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231715.Cah68AnR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/perf.c:16: warning: Function parameter or member 'latency_lock' not described in 'DEFINE_SPINLOCK'


vim +16 drivers/iommu/intel/perf.c

c3c6576b30d64f Lu Baolu 2021-06-10  15  
c3c6576b30d64f Lu Baolu 2021-06-10 @16  static DEFINE_SPINLOCK(latency_lock);
c3c6576b30d64f Lu Baolu 2021-06-10  17  

:::::: The code at line 16 was first introduced by commit
:::::: c3c6576b30d64f9c11400ea0dedd6a33b1f0bf8e iommu/vt-d: Add common code for dmar latency performance monitors

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
