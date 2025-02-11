Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A981EC016
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262944; cv=none; b=jGf5mYqnUgaZAJUn0S5jLMFkKv7vos78+g0+x2EUO4tiynQxcla3/PA1AcgiFbtoaYTecrZpGRgozZtIc6VVNaldMsrMYq3OOSAQlhC7kAVk/TPDdipVTEQq6gP77HfcMvQDzo6USVlfn9DTaSZHLAVOCFzN0cluyhM2InHPcnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262944; c=relaxed/simple;
	bh=3w4dNFmCd1Mvt3viPiSR4xXFTuXKXy+Mg1y+fjC0BjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqqYhNCZGgE188OS+t2esToX+RmiIGzmbr2ZYX857YUsz0IydXwttnNDwWiXifBak5dh+UKhyrFZT8QJBEJU1cXAKXvhmY9yoPxgBUXjk94Le5f5mLP5bwTeo7BotNA1HEUvxlYHPrWj0qsMo+GmF07yuYqg5+oZJ/iOxOMZuuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7HXpSGl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7HXpSGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739262941; x=1770798941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3w4dNFmCd1Mvt3viPiSR4xXFTuXKXy+Mg1y+fjC0BjQ=;
  b=l7HXpSGlotBC1LDlq7hEUZI6R+0ucANmO0UnDkXwkEiIMvnbjXfHAU9U
   Txdm4phBSEGWpZdiB3uxDbK4vmRQQOk9IvkC9pN0henjdZWM3aaCVgEg+
   VlmCsjzYTL5uHFPy434ysyqGPiGdkJ8biHALfFuRYf3QND+b241NUhyiR
   2LkITrEYflwaKdXRqObtAcKCeMmKOpF7Zy0zUb+3VspkPM1D6jB9PTEKp
   W+zGnadPvZhjeL9t3O+5Bun6GK68aJ7OX/7OuAvYCbi4bJv0m/vGwXotK
   1GwxzwKu6X+WTswbjWAJ5SHPnG5zEXupDHIM1sAqmdUa1oouogGcTcadN
   Q==;
X-CSE-ConnectionGUID: +2SPevLVR4WFrBsJ2NfLWw==
X-CSE-MsgGUID: i9Os1qsURFuA0hccGJBhYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51298793"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51298793"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:35:40 -0800
X-CSE-ConnectionGUID: 4T2/HAi/SkmQ4tJSScM1Xw==
X-CSE-MsgGUID: Hg80YN/WRc6pV5trqF+AKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116529454"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2025 00:35:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thlk1-0013vX-1y;
	Tue, 11 Feb 2025 08:35:37 +0000
Date: Tue, 11 Feb 2025 16:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 33/33] firmware/brcm/brcmfmac43430-sdio.bin:
 warning: ignored by one of the .gitignore files
Message-ID: <202502111608.w4r8KZ4W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   dcb5a245dbe2203ae35f6b1b5cb28929f758008c
commit: dcb5a245dbe2203ae35f6b1b5cb28929f758008c [33/33] [NOT-FOR-UPSTREAM] Add build instructions
config: i386-buildonly-randconfig-004-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111608.w4r8KZ4W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111608.w4r8KZ4W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111608.w4r8KZ4W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> firmware/brcm/brcmfmac43430-sdio.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
