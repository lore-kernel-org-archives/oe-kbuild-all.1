Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5B4482FC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 04:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708056019; cv=none; b=f4TUY8kQKnyjE9fHVQ1lKQD1vSnGWRH1xxA83hVlc8PJrPsmlKQO1aTzRlUYCbtrcIVydYzqPrBVY/A+b+b/0sdJwRlFJXb5wnxLNRKIvgKRL15Sn/16AfEaot29rxMYgbCwr8/h7LEkxaLBAaaOo2Tn8rv6tMrVP0SKPDBMb8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708056019; c=relaxed/simple;
	bh=wv/PkRrMZ7fHaZq3dL1qOSuYLYvBafyQ8athXo6pM3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jK6EVWJoYiPwEieBZinBB4hNoA09nEzqTRJdVul5eB6+VD2LKbCSraYh424ctG36766hLf/5kockQSchtrtGmfcOHKJqtFBTF6s1ADXPER73hqqafkY6U6frsk+649USLo0MvmjyuywTwNKiXyY4Famew20ViJ5vsYB9YSR0mnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKJ73iNV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKJ73iNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708056017; x=1739592017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wv/PkRrMZ7fHaZq3dL1qOSuYLYvBafyQ8athXo6pM3k=;
  b=FKJ73iNVvn4rSQjBVblVz4gcbGFr2conqaPEZxZstjMheExX/lEr1B57
   1ZK0Q2O3vK6QheTlXBf2ap/JQTxaZHutjuKuRS6Y1grHyQQRr1pWl639q
   zHpUe4YftQAUzJuNsisuuTiGDSXlUZCRa+zuBo7WLhDc1yDEy3qtQSQPi
   skB8hEr97FhoJZBD66ihRKjO+QV8vAOtcckuXFe9DXWV2nGEdIvdmfe9l
   BT7p/t++/R4zM7xy1tI5BnobE05aahBwgHK7X2Q/RjuKax1CiVe06iYM2
   hyUZwvzSlfY1tnjlRJSXdJfunlXFNkAI8+03L4KVmfMXC5E7vAUsbWGTN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2052329"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="2052329"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 20:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="3715611"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Feb 2024 20:00:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rapOV-0000z1-34;
	Fri, 16 Feb 2024 04:00:11 +0000
Date: Fri, 16 Feb 2024 12:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [linux-next:pending-fixes 326/436] xtensa-linux-ld:
 drivers/gpu/drm/tests/drm_buddy_test.o:undefined reference to `__umoddi3'
Message-ID: <202402161104.YJ096OVa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   a8f5f47b9dc3b207e4d0f7bfcc893907a5047d59
commit: a64056bb5a3215bd31c8ce17d609ba0f4d5c55ea [326/436] drm/tests/drm_buddy: add alloc_contiguous test
config: xtensa-randconfig-002-20240215 (https://download.01.org/0day-ci/archive/20240216/202402161104.YJ096OVa-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402161104.YJ096OVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161104.YJ096OVa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: drivers/gpu/drm/tests/drm_buddy_test.o:(.text+0x6c): undefined reference to `__umoddi3'
   xtensa-linux-ld: drivers/gpu/drm/tests/drm_buddy_test.o: in function `drm_test_buddy_alloc_contiguous':
   drm_buddy_test.c:(.text+0x166): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
