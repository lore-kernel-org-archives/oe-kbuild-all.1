Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808616DC12
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 18:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736014934; cv=none; b=SRjCZ+k8VpXpTA2qEt0lserveNoX6TiRS78oh9YO+jMViN6/WoKnrj8YVVKdnlS06WSVNUR8ZjLPX9wDzHmyMMPMEJ2BmND7mDkcK5UFPEsglq9/ESJZZ1JFWGcwUWn57biPRkJS/JYssGl7g05jjyii0ZQ2r/e+EvQlgthGfMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736014934; c=relaxed/simple;
	bh=eoGedivqBOd3CYFESDynnQLHKO4weHf/kdUb3nFuceU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojEUodnfHWN/ragnil945eR4tmcXJJmRWo23hya7tyqMcVC8/29Sbvo/UHlrkoAj7cRf4kmBoISJO/p8r2pNNkbGMivxSK4hwS8rdvf7X2KFIpYPb7l5n7GQd0ozZ12e0XaeyDMn1qJqyUzwGucPIA8io+22lr4aRVjVlMoauOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgJLJHMo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgJLJHMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736014932; x=1767550932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eoGedivqBOd3CYFESDynnQLHKO4weHf/kdUb3nFuceU=;
  b=BgJLJHMoDO5lj127M21CfbzhhjhG9mYZjAoQG9b+juTg3gsZy26CfbkX
   9l1T6gg+sY6iULTXSAEdQZ3z49NiZ3KyQ691TSUjwhJeTY8vXr+dZa01n
   St64gfDSRgHNCfdz+ClIH4CT7aAOaf9eL16rRZ1siTtsrbGHmAX6zgMXT
   WonclXkh8sCBnH2NMMbaTAnDSFdZY8iyFFCmcvYRgCzjKNqckiw1c9Zis
   kSNoqcSdwImTuD5mxQO5SdcIcOzCqcea6LKkgO9ME3s38L1YVopy27g5b
   CNgC6XuqDbiglfZnVtltN+m6tVvJPnBdwmkgFRD90CQAgZfIw/C9K1NIT
   A==;
X-CSE-ConnectionGUID: 5u1HbZIfT7ObDGLwAFN2dw==
X-CSE-MsgGUID: rTkWAumxRDSsRtouYGRhgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="53766182"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="53766182"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 10:22:11 -0800
X-CSE-ConnectionGUID: cXZxQnLDT4mFlFeu7aQ4PQ==
X-CSE-MsgGUID: z+PedO+GQEegpRXbKHsQWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="106908765"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jan 2025 10:22:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU8ml-000B7z-2U;
	Sat, 04 Jan 2025 18:22:07 +0000
Date: Sun, 5 Jan 2025 02:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/firmware/broadcom/bcm47xx_nvram.c:41: warning: Function
 parameter or struct member 'nvram' not described in 'bcm47xx_nvram_is_valid'
Message-ID: <202501050206.0tkkbpjW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 0a24b51a3264a3f942a75025ea5ff6133c8989b0 firmware: bcm47xx_nvram: add helper checking for NVRAM
date:   3 years, 10 months ago
config: parisc-randconfig-c44-20220907 (https://download.01.org/0day-ci/archive/20250105/202501050206.0tkkbpjW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050206.0tkkbpjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050206.0tkkbpjW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/broadcom/bcm47xx_nvram.c:41: warning: Function parameter or struct member 'nvram' not described in 'bcm47xx_nvram_is_valid'
   drivers/firmware/broadcom/bcm47xx_nvram.c:61: warning: Function parameter or struct member 'flash_start' not described in 'bcm47xx_nvram_find_and_copy'
   drivers/firmware/broadcom/bcm47xx_nvram.c:61: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_find_and_copy'


vim +41 drivers/firmware/broadcom/bcm47xx_nvram.c

    36	
    37	/**
    38	 * bcm47xx_nvram_is_valid - check for a valid NVRAM at specified memory
    39	 */
    40	static bool bcm47xx_nvram_is_valid(void __iomem *nvram)
  > 41	{
    42		return ((struct nvram_header *)nvram)->magic == NVRAM_MAGIC;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
