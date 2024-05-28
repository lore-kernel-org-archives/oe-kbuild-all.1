Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE2313D8BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 22:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716936679; cv=none; b=Y2ksgg+tjbUE41HtfhIHwduoLGshYrCwqLH6YuIJ/B6PUvts8BUqdMMUYaYoE5rGgb8z8W6zoixtd8ew5IfbVXHkQapjMGdNQ12vX88Bzj3iQ66OOIpdOWQuIKaSPXhkmof3VCSi+BgJ7+AfQI+jAH4tqzBor1Bbba89PfI5lI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716936679; c=relaxed/simple;
	bh=vuJUpsEIJqnYER1EtTahkKITjs5S/RW8AKcQAArHP6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uc7mvte8JtYL9g5oD15j3RhOOAfUWyPjna/8pWY8zBt85SLTQBTzEnkgSf1s1qRxjRonjOAYiRJ0n0aMQImDznVs/hjWRNiTEX4WCiewX7rosCN4+QAAbZBukP2d1AcfggSJ7vkmqvOsMSzIgSYvVQ9BFZnUdTDAztZltMur3Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvaaFGnb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvaaFGnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716936679; x=1748472679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vuJUpsEIJqnYER1EtTahkKITjs5S/RW8AKcQAArHP6E=;
  b=FvaaFGnbVkKlFAo0ffKKlXGYYG6kHB0lm/nUBTJc+kHg73YO4Rn9t+d4
   TALO1GQaE7Jq0l6/iDu+3e52NkwTw2iL89g83IP7ApDzn85pk9pPazm4+
   2eh8//8WEck2Lz3EdyvUgQD4fmBL1WMyGu66ysu+RQ0hXSNoMHGWnvGbB
   jVCekyM0Wkedcxwha7zWcmvNY/J0Vh1o4/ryp5qzSLjS9/8iE3UGHWcxx
   L68G48aD1pNj+H95oD3z+QreQ2DwrKhOp9pYgCA+XVBc8mYknOM3MdatE
   Cxc/FWlfl2w2B79tH1gqzwpjomFaCw42fMac3wGPxwxMshMC9CYYf+jna
   Q==;
X-CSE-ConnectionGUID: Ywe1SiAPRAaZBA11GD1TMA==
X-CSE-MsgGUID: ObCjvk3jQa+IBFAJYWUtaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13497090"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="13497090"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 15:51:17 -0700
X-CSE-ConnectionGUID: x2iob1ykQ8CFYi9k28pSJw==
X-CSE-MsgGUID: RktVTFGESKahDkQPUB6XSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="40047014"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2024 15:50:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC5eh-000Cpv-0k;
	Tue, 28 May 2024 22:50:55 +0000
Date: Wed, 29 May 2024 06:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:mariusz-npem 3/3] drivers/pci/npem.c:363:23: sparse: sparse:
 symbol 'dsm_ops' was not declared. Should it be static?
Message-ID: <202405290643.bDL3GC4x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux mariusz-npem
head:   2fb114bf74eff73c83383cbd1d481584053cb8cd
commit: 2fb114bf74eff73c83383cbd1d481584053cb8cd [3/3] PCI/NPEM: Add _DSM PCIe SSD status LED management
config: x86_64-randconfig-123-20240528 (https://download.01.org/0day-ci/archive/20240529/202405290643.bDL3GC4x-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290643.bDL3GC4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290643.bDL3GC4x-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/npem.c:229:23: sparse: sparse: symbol 'npem_ops' was not declared. Should it be static?
>> drivers/pci/npem.c:363:23: sparse: sparse: symbol 'dsm_ops' was not declared. Should it be static?

vim +/dsm_ops +363 drivers/pci/npem.c

   362	
 > 363	const struct npem_ops dsm_ops = {
   364		.inds = dsm_indications,
   365		.get_active_indications = dsm_get_active_indications,
   366		.set_active_indications = dsm_set_active_indications,
   367	};
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
