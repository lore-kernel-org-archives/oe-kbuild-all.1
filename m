Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD61D47BD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737691183; cv=none; b=biaC66F5J5LlKmJpe6wiC1eHxGZsf4PuVgme8WTTMWT+0T95skjZTtgJA0kk0Gim3mZM4HZ9VEsBtBCDaBPUOto5tQ+lvlvJ83Be36hAkFQ81URL7VFl4hLVOUyWIaC18eROKrYkpwUg/1I4bxgNXXnWaUVwrGhnoK0Znu/UZoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737691183; c=relaxed/simple;
	bh=pgV8hAFt6dziDv6Tldp0sZQ5g695J9TrDhYjWzbvch4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cx+SGph5PympZzlkT+bR0/VSbk9jejZc18Wd80/mBpdOmisV9J9znp9thFz+ntbSY/ibemM2en5ZhQoE8R9HCQ+AoHZ7gfvholwH2YnCXGAAUYAd6IUvaAuW2YPvApbPVARp12CR8OLRj1YRkdV97kgBSEUULAuljMiiaUVaSMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmFyiFKK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmFyiFKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737691181; x=1769227181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pgV8hAFt6dziDv6Tldp0sZQ5g695J9TrDhYjWzbvch4=;
  b=GmFyiFKKtjXU92/uKub7mNEKmfAucJQExATRNxzfa9ZAXsAzQR9EcYHK
   kVrmyNvS1Zm12UrbGBbyMt1S7wM6I+yGameqh21NbPwto7yYNKlkHhgsM
   7xrSlLoLDf0RYvZP8ZqUW8wUvW10mwVgJpLZQ8+sbBwKx2CQl0/t5FELk
   GwV7LB2C8XFiwj54z7uqSeJEIpWTGsk1RNuew+ceKLqxB2wwObcldI0ia
   2wHQlb4AOn70BrvYw1c30kQ3TAz+1GkifME85dRlKZV1YkKt4ft5Z6eSz
   53nLMXJVAgt0RQQfktDmTyWA/HtcqxGcXJST8MivTauHtjkfNFAIE9HYb
   g==;
X-CSE-ConnectionGUID: MzMcgU3uQMOJcHBhqLXuLA==
X-CSE-MsgGUID: zkrt25aeS/2X/HFE3pLq/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38319251"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38319251"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 19:59:40 -0800
X-CSE-ConnectionGUID: L4WkPuAGQ9O5w44/TD9LHg==
X-CSE-MsgGUID: 8W2dJhZATmqdpoWg95HOYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108091199"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Jan 2025 19:59:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbAr2-000c6c-26;
	Fri, 24 Jan 2025 03:59:36 +0000
Date: Fri, 24 Jan 2025 11:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1665:3-8: No need to set
 .owner here. The core will do it.
Message-ID: <202501241118.cLk6pLFB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e0b1f59142746f74476a03040f745329c8355a7e
commit: 80242c4a9d50e71a4df1b7fa19b922ac88aab22b staging: gpib: Workaround for ppc build failure
date:   7 weeks ago
config: arc-randconfig-r051-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241118.cLk6pLFB-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241118.cLk6pLFB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1665:3-8: No need to set .owner here. The core will do it.

vim +1665 drivers/staging/gpib/fmh_gpib/fmh_gpib.c

8e4841a0888c74 Dave Penkler 2024-09-18  1661  
8e4841a0888c74 Dave Penkler 2024-09-18  1662  static struct platform_driver fmh_gpib_platform_driver = {
8e4841a0888c74 Dave Penkler 2024-09-18  1663  	.driver = {
8e4841a0888c74 Dave Penkler 2024-09-18  1664  		.name = "fmh_gpib",
8e4841a0888c74 Dave Penkler 2024-09-18 @1665  		.owner = THIS_MODULE,
8e4841a0888c74 Dave Penkler 2024-09-18  1666  		.of_match_table = fmh_gpib_of_match,
8e4841a0888c74 Dave Penkler 2024-09-18  1667  	},
8e4841a0888c74 Dave Penkler 2024-09-18  1668  	.probe = &fmh_gpib_platform_probe
8e4841a0888c74 Dave Penkler 2024-09-18  1669  };
8e4841a0888c74 Dave Penkler 2024-09-18  1670  

:::::: The code at line 1665 was first introduced by commit
:::::: 8e4841a0888c74bdcb6ba115d6405206f0c2e8b4 staging: gpib: Add Frank Mori Hess FPGA PCI GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
