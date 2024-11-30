Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E8B224FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 02:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732933825; cv=none; b=tTKJXLhobYG8jX9PMEhwMb3BmPnKu4+J58CgIGFQZRY6nWKLS51CsDGOAzRKt/Lw3j2Ar1SgPxmN5JmYjLHS7ER7Vuecs0uxXYprONuRWFUtJrUFDNzlTTo3CxrLrbLD6jQQc9i0ARjwDuTi0HNR8sgOMaprWCuf9ejYmpAmAt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732933825; c=relaxed/simple;
	bh=QTTzkZOC5MBVdCuadILcBtuFm4pszBJTnpD249ArpeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsPP3yY/KPs4wDY6QwB+xAhDrkkZqBqKSd6ElUBy7brOjH3nkkr1rDboBrv3sAr4hoFPNWDNtR4ZBPicR2pMOtoGtvByU3xFcMG25IGjnT0ckcgD9f8PZvCTeNT6e43c01yrX6dCxEGu0VvdDeQzSoyvdwo8Iim8NQymMJGn2gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAcksueG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAcksueG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732933822; x=1764469822;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QTTzkZOC5MBVdCuadILcBtuFm4pszBJTnpD249ArpeA=;
  b=kAcksueGJL8WE+dHfIFSCUGEnnqdfdi1NfHzi0z62tXijF0a9ixe8cqx
   0i/Cpgi62QBgDWan2odAgOHqcQyDpWktwQFQ2BIWT0QO/YRF4PLq/MPfj
   CSyu0ndbhrvFWz+CpQd18jBUMCR7MQ1ipXP8hBIKA/nRMiNxLlzJ9D232
   iBND4cblDYO4hm6cY7KXECln+zAoFNs6pFk5XuBrL1iRHvZRxU5wkxs32
   RwzpxRmIEkgKIWfW1ItbGSs7RNla35EZEHbkV+hMN2iwTxH8sQf+B6KDF
   XB53FUwAawsXd0ozyGLswkfPp3G5TMg8V2GW+sNA0+wyXfaNbHaDdOFnm
   w==;
X-CSE-ConnectionGUID: 3QoqIpiFS6WlbeTBmVEyzQ==
X-CSE-MsgGUID: d5WfGbfYTW+A7LSc5h5jeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32526276"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="32526276"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 18:30:22 -0800
X-CSE-ConnectionGUID: uVEm4WtUTciVvL2pT+q+bA==
X-CSE-MsgGUID: x9PUayGlTWuTK2Tk70Es5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="93082941"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Nov 2024 18:30:20 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHDFA-00001t-0E;
	Sat, 30 Nov 2024 02:30:06 +0000
Date: Sat, 30 Nov 2024 10:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ilpo =?unknown-8bit?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: drivers/platform/x86/x86-android-tablets/other.c:605:12: sparse:
 sparse: symbol 'crystal_cove_pwrsrc_psy' was not declared. Should it be
 static?
Message-ID: <202411301001.1glTy7Xm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: 06f876def3469b44737df6c2efe6dd811838c9e7 platform/x86: x86-android-tablets: Add support for Vexia EDU ATLA 10 tablet
date:   3 weeks ago
config: i386-randconfig-061-20241130 (https://download.01.org/0day-ci/archive/20241130/202411301001.1glTy7Xm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301001.1glTy7Xm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301001.1glTy7Xm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/x86-android-tablets/other.c:605:12: sparse: sparse: symbol 'crystal_cove_pwrsrc_psy' was not declared. Should it be static?
>> drivers/platform/x86/x86-android-tablets/other.c:612:28: sparse: sparse: symbol 'vexia_edu_atla10_ulpmc_node' was not declared. Should it be static?

vim +/crystal_cove_pwrsrc_psy +605 drivers/platform/x86/x86-android-tablets/other.c

   600	
   601	/*
   602	 * Vexia EDU ATLA 10 tablet, Android 4.2 / 4.4 + Guadalinex Ubuntu tablet
   603	 * distributed to schools in the Spanish Andalucía region.
   604	 */
 > 605	const char * const crystal_cove_pwrsrc_psy[] = { "crystal_cove_pwrsrc" };
   606	
   607	static const struct property_entry vexia_edu_atla10_ulpmc_props[] = {
   608		PROPERTY_ENTRY_STRING_ARRAY("supplied-from", crystal_cove_pwrsrc_psy),
   609		{ }
   610	};
   611	
 > 612	const struct software_node vexia_edu_atla10_ulpmc_node = {
   613		.properties = vexia_edu_atla10_ulpmc_props,
   614	};
   615	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
