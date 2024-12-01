Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2E33086
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733077768; cv=none; b=HyL4jj2CgEkPLzoGP8plNSCa+pFEt1PCDvvxoj8s2Fomhl5cPjiCF/NdGB5yV7mrQGkN+sIOydA3UMA6IvDqoLFne7qeDJyLpGHXMNzTDmHmNSUqUQaUTH2RTmAQXE2ZvrpDUxDNYI4ICwYXLgKRk8ksmwGrOegU4ZhTN5b8w7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733077768; c=relaxed/simple;
	bh=wYd/k4Fo5JSt2ct/UUT4qHTZtql1O48nyXGoTWSvAS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/eieS1r6EqeAdvaRrSdaVC7Usc171faNu5aww87XHYDx3V8YwrsSp7vgTTZaGRQV2RqSi2tAcxscCocGKNcnamU6iyMRO23IDDHWMfaeAFT9sKGOpV/1cGul/XPdZnggFgSgpSkNXIgR3f+6YhOPMmm4hVXM5O5BD4h799MDHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASSEzVO3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASSEzVO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733077765; x=1764613765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wYd/k4Fo5JSt2ct/UUT4qHTZtql1O48nyXGoTWSvAS4=;
  b=ASSEzVO37VqqfNX89h7mY3NFTyBd1Ubf+Kbkd+BZnjpWK9O36hGm6une
   PMoPIS1WKS8EST/zkapUNhLeoydhETTBL/NCXEBXBHHFpVoWkKn9/2JNc
   FJyNfhp48Coal+xb0GGmZa8lkCVoGJJBYtwkkaoN/NzhJZRmOjN79PcaT
   9p70YAu+2H97ADh8rxO3WtTGfQ7FhLAtcjvfCfnQDO0j1CCXQmZIyWDVx
   01gJRT5izHlrT5Nl/YEkg55iHSOOZAJ/Tcb+vwIKHKJzYFZc+qkyGNxC/
   piml734U/HQ9/unMl+BXnC4AZsWMp725AmF9qKTDs+MA0KXobG7kzWV7u
   g==;
X-CSE-ConnectionGUID: cioRwqi8RDid5RkaNR+2yQ==
X-CSE-MsgGUID: pyfd/51/RumH9ZsEDorRVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33176736"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33176736"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 10:29:24 -0800
X-CSE-ConnectionGUID: B9AUeWi8Q1S3Nu0T47Rnlw==
X-CSE-MsgGUID: iBsm3d/1TEGxvH18E45c/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97679581"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2024 10:29:25 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHoh7-0001lB-1s;
	Sun, 01 Dec 2024 18:29:21 +0000
Date: Mon, 2 Dec 2024 02:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1298/1298]
 drivers/video/fbdev/core/fbcon.o: warning: objtool: missing symbol for
 section .exit.text
Message-ID: <202412020207.XDv7sxtE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: bedb38fc917527e7a6a7e5a0ecedd44690fab167 [1298/1298] fbcon: Only defer console takeover if the current console driver is the dummycon
config: x86_64-buildonly-randconfig-006-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020207.XDv7sxtE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020207.XDv7sxtE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020207.XDv7sxtE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_exit':
   drivers/video/fbdev/core/fbcon.c:3663:21: warning: variable 'pending' set but not used [-Wunused-but-set-variable]
    3663 |                 int pending = 0;
         |                     ^~~~~~~
   drivers/video/fbdev/core/fbcon.o: warning: objtool: con2fb_release_oldinfo.constprop.0()+0x108: sibling call from callable instruction with modified stack frame
   drivers/video/fbdev/core/fbcon.o: warning: objtool: set_con2fb_map()+0x303: sibling call from callable instruction with modified stack frame
   drivers/video/fbdev/core/fbcon.o: warning: objtool: fbcon_fb_registered()+0x1a2: sibling call from callable instruction with modified stack frame
   drivers/video/fbdev/core/fbcon.o: warning: objtool: fbcon_init()+0x702: sibling call from callable instruction with modified stack frame
   drivers/video/fbdev/core/fbcon.o: warning: objtool: fbcon_event_notify()+0x12b: sibling call from callable instruction with modified stack frame
   drivers/video/fbdev/core/fbcon.o: warning: objtool: fbcon_switch()+0x7f2: sibling call from callable instruction with modified stack frame
>> drivers/video/fbdev/core/fbcon.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
