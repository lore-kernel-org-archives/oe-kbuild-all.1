Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A7C2C11EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 02:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766023887; cv=none; b=es09X7dbGWT2J2vAdbNw5QOFJIW66yqiHy3DJQ0qMcEsB3Gtxz/I2B2QEpcC0RnkBuABLrOqQQYAiuyjUCQOL8JoTTI7iKwd2cXoC7spVTDmR/LLqC902QmyGGFaS6jOgzrhar6BdK7ANoWoKjRwNVnRw9/joCBk3NWbkLkcRhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766023887; c=relaxed/simple;
	bh=JrVOdy5AoRDos3Sg0JrGaeOqAb+yjem1AbYTgJ/v1P0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EYVHL1rVaAcmWboELaGpddj0ai6YmGumLH9DGprmSOOTuMBdeJ6I7/9xVYpOJsN+2A5NO40zQx6duIj4PCawhOtoR61F1GDABuntT+0rqDu/nmiWhOVdY+dmvRIcq+aBiLuE71lV8zMLfsv//Xem0QHLA06GwHxFpjnPmlwg/NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQ0PRwuI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQ0PRwuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766023886; x=1797559886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JrVOdy5AoRDos3Sg0JrGaeOqAb+yjem1AbYTgJ/v1P0=;
  b=FQ0PRwuISMpXcnBIF0LAAlAraQ/30Nnzn22D5TRGkW4n+BMxcWYQ2M22
   NFmbkv+G2PNHhwbkiismhW2wlAwhe5jDP3osQmJ2/dKMEPtYeUO4t9VLc
   PFJw0ROOmP+7Q1m7+k4a9OZ7U6kfvqAjDEMAXP3QQ6k1jGrOrTgszDAZR
   CAKDpOEQJmCViBo2Lk2cKwLpKreNf726B+vbVTa0ySK+9FsGLm3Vmn5AO
   ZMrjB5X4rb9JbpHUVDlPI7X50tYDW1phJGc4/BRQwnbeltIUJ43ibF1LX
   vxLVvTEOV5RsVy3kduaO5KBYRKC783UyTmH0l6j+Pi+dRNBjS20qNxoD3
   A==;
X-CSE-ConnectionGUID: hlNQRnqeQRehQAhaAfGRCw==
X-CSE-MsgGUID: mv4AHjnuRt2+BsSkwOqnkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67852533"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67852533"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 18:11:25 -0800
X-CSE-ConnectionGUID: RfowAt2zQXmDBmYlKbOd0A==
X-CSE-MsgGUID: OmCJ8ZWaQZe38zHt63ff5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198354800"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Dec 2025 18:11:24 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW3U9-000000001Rh-3b0U;
	Thu, 18 Dec 2025 02:11:21 +0000
Date: Thu, 18 Dec 2025 10:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [akpm-mm:mm-new 46/101] ERROR: modpost: "arch_enter_lazy_mmu_mode"
 [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
Message-ID: <202512181054.fFRvEL0A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   c224625ec6f8a0476ffffc09807f4d717ba9cc93
commit: ea8fcd8d760d02566427104cf48979a8544eead5 [46/101] mm: add basic tests for lazy_mmu
config: sparc64-randconfig-001-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181054.fFRvEL0A-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181054.fFRvEL0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181054.fFRvEL0A-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "arch_enter_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
>> ERROR: modpost: "arch_leave_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
>> ERROR: modpost: "arch_flush_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
