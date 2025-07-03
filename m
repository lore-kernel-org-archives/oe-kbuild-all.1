Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9938C11
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 01:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751505611; cv=none; b=ozdKRvSuS8yiY6AtKqr8mR5Pu26uLrnG69Ls48pxYkmOlx+5pW+Sola5tF9IMq+1h3cli28Hsz1SYLPaQrHVsFWSilsdz37B1L2jImtvplWMoB1gZqgtJYRAkNQRaFnoPqrg1K5UXyd6+vHFg92kmtOmoJo24c7SHpkKFpvGvio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751505611; c=relaxed/simple;
	bh=dK3SJJiPgp39PLHCpcJ4uxNAZ/s8VzYq0DG9Q7dyegA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fm3zYvjTCOMUygK+ng69Cziv1xQt6UZLcpsAHPEIfoHJKuoi4Pc0CQykKynw/qnt6NlXn6nzQe1iRf5PYoYC0UlJKS17ALDFS06T7MJmL+xR89UHobs8E07akkXrP1xLpYWVSMbD/s6jekYlpGMHsYlDrH/gPp8GLrKlutAssd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WauDojFh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WauDojFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751505609; x=1783041609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dK3SJJiPgp39PLHCpcJ4uxNAZ/s8VzYq0DG9Q7dyegA=;
  b=WauDojFhNf1QK+b5A2hq8m3ygUd5oEbyS0t6lMB83iQHxEFWi9k4lBYM
   ojcq3oAjCDFzUpCF0DUbDlJwreyqyX/IBi8xtTxFE6zPvxFLFT1GI9LCh
   V4y7UDjKQqx4BoirxHSTDMe3tl0pTG9c0/sieXp0tDTGPrF29E/W4F3W/
   lPvY1Em4qj+ldUppdBh1re0ECrbxF6Zpb50uhoXpBc2ia0mxlvNRbg61g
   icc1C5lpL7WcyhMZN34FSUO0YO9d6M7sh3y2wFCI0ZpqRfztJu6imEmId
   kKNL/e4PCxociQexjGSBU/cdd98GXVfeKqVzyY5+jf4KwdWSbUCIpmBT7
   A==;
X-CSE-ConnectionGUID: 7E/BBoLASWiJrj+JUNz8mg==
X-CSE-MsgGUID: UnX30ByOReOzE8HbM5oJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64063365"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="64063365"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 18:20:08 -0700
X-CSE-ConnectionGUID: MjbeSIDGQeC+LFyYiMgjUg==
X-CSE-MsgGUID: fB5Nk4LvSoWMskUEhhDX0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="154585318"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2025 18:20:07 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX8cP-0000NZ-1N;
	Thu, 03 Jul 2025 01:20:05 +0000
Date: Thu, 3 Jul 2025 03:19:30 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605]
 drivers/pci/hotplug/pciehp_core.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202507030314.c8FttoWL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Keith,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: 58d584102f06f870f118644f1022c751e015e7bb [1605/1605] PCI: portdrv: Initialize service drivers directly
config: x86_64-buildonly-randconfig-2004-20250501 (https://download.01.org/0day-ci/archive/20250703/202507030314.c8FttoWL-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030314.c8FttoWL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030314.c8FttoWL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/hotplug/pciehp_core.c:214: warning: Function parameter or member 'ctrl' not described in 'pciehp_check_presence'
>> drivers/pci/hotplug/pciehp_core.o: warning: objtool: missing symbol for section .init.text
--
   drivers/pci/pcie/aer.c:217: warning: Function parameter or member 'str' not described in 'pcie_ecrc_get_policy'
>> drivers/pci/pcie/aer.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
