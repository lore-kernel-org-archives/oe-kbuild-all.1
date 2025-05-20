Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D98F1FFC54
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 17:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747761262; cv=none; b=kUNpIM/+Ht0JRcuQXY5PkSMsgW2pcvnIL1RCjzR+Jfv+PxBiDd9dL7kgsW18NiJCxsi6nIFRSmj3hu1Dp3WtLbchSO+ejdzeDiYIyJGks5nmF9ysM/X/4G4cMIJthNskIoeg04I5n/omyUwqg3cqUScw+SFT59sW2uDadBZ860w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747761262; c=relaxed/simple;
	bh=LVLXeBCW6MUgMychLajjgJCsiVm61oCvyDj5Xp9S2kE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYm5PxhqyDkHiHpNp+WGBH+twA/mY1+1HbIBSn5o9JLRxdD15YjZ1d8ecqfTi6mH1q72SZQHE7yHFwkrNeqBYNCviIZXmoBrKE5OABqjH2Q0HZNwxpa+Sab9+7tbW/KW7DRrsU3rPkemYH7t46DAhhe3XRUqXftGU/suVFbvDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2bTnCje; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2bTnCje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747761257; x=1779297257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LVLXeBCW6MUgMychLajjgJCsiVm61oCvyDj5Xp9S2kE=;
  b=I2bTnCjeEHhngHSTYKiTNe0BHpZyrESLNwBjSQ1hv0VrTATYLIylbMQX
   G9J9qOB7odelmjesi9Rwt7ulFgOaWw7WT78fIa5/HN/7xs7WS39P/uNvQ
   03NIzNMofeor4cJjtwAf2DbecOyQoBUfiDLj4VYSohn3qCCBAyC83Jvlp
   HJp3f3y6usskMWY2TGovUP0X/GZjDcTrNycsc49R1EpUfHgIQng9nvGw8
   KKYHlJwUNHrC0yrDIpcnzSGBgipdd7BKF20Ltk4iPCl/Dkre2L03h7Thl
   /tybSLPKCfdj3qxeF1s2ZN8tkJPFtNUPIQhYc9sEuBKAPXXgU4yInw+Pi
   w==;
X-CSE-ConnectionGUID: nAn6aMPYTAulTu5KL8tpwA==
X-CSE-MsgGUID: SXyO+7W7SWS54H9ujfeNSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67119616"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67119616"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 10:14:14 -0700
X-CSE-ConnectionGUID: 6Wq5BScRRVCXKaOlUoQcXg==
X-CSE-MsgGUID: DheYeMHNRY69I3EfOdPk1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139798555"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 May 2025 10:14:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHQXa-000NPQ-39;
	Tue, 20 May 2025 17:14:10 +0000
Date: Wed, 21 May 2025 01:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] arch/x86/coco/mem.c:27:26:
 warning: function 'virt_to_dma' is not needed and will not be emitted
Message-ID: <202505210135.POIOSWXp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6bec8a39b9738b7a22c1f607634a05ba0986225a
commit: 3edc67069b8dc51b49933536f6dc8fbecc51d858 [11/11] x86/coco: Add cc_decrypted_alloc/free() interfaces
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250521/202505210135.POIOSWXp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210135.POIOSWXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210135.POIOSWXp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/mem.c:27:26: warning: function 'virt_to_dma' is not needed and will not be emitted [-Wunneeded-internal-declaration]
      27 | static inline dma_addr_t virt_to_dma(void *vaddr)
         |                          ^~~~~~~~~~~
   1 warning generated.


vim +/virt_to_dma +27 arch/x86/coco/mem.c

    26	
  > 27	static inline dma_addr_t virt_to_dma(void *vaddr)
    28	{
    29		return phys_to_dma(&mem_pdev->dev, virt_to_phys(vaddr));
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
