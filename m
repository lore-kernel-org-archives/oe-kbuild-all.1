Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7262F43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 04:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734064405; cv=none; b=OKHLGAF0tA0hAXcYg4/L84YaRIMu+kAQ1lfH2eK61E5Uyog3WvR2lqauPefI5lUcx3HFF8y+Zn20jbIFk7ttZHeHd8uRtX+I63WMRGpA2UdryTV0AFYXytXU9iCaO5bBxT765+7LUdwsEcKhYZi20YifRKpWQYElNYsn03LvKOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734064405; c=relaxed/simple;
	bh=/nLzofFDe595JdyoP9b3iEw2Y2s8lSMfLaYDhyN11bE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=burLF6ZwaIdFk399L5te8uJi8PcCHUktCptknW6FS3Lq37dkV17FH5k4Ibr7FCkG0WRTdSwbTrzmEVf3mUGGSW+vz+afezBE6NNAth0JrTwd0pJZOyZ1i1LWk+XGAYC5uThiyKCcWcYTQVf0ilZAD+8thEot6ZaA0j2F8h6Tk6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REAart7M; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REAart7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734064403; x=1765600403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/nLzofFDe595JdyoP9b3iEw2Y2s8lSMfLaYDhyN11bE=;
  b=REAart7Mpu3542CDC56opsgdR/0FVJoDiySPTCxcSz5B3Vx7ANKZo4B7
   7GV6dg653iUTfgaQ9Xpwjhsya0/qlvDAunPj3oiCw2xXZBOKWw/uM4C6y
   /pbX7wcj4nPsV3DVQpOS2pUoqUvneQGAR0nJ5OLcaQUhNavNBQK4VGDxv
   IE1AaAT0+ZREO34VqmHCqItA7vTIERZVzUzh+d3li7FPDILcVB7m0HfOJ
   Ldj4WbmlU4whnWHVgLCicB8Re1pM0/B6x61TJA7/PMP00spwU2upOO2Kq
   o0j3bA5WCXuGjAQgV5ok7AjVL31PxxF3yp0NVYx6Aq/sLuMmqWqoUTwnF
   w==;
X-CSE-ConnectionGUID: 48tBwcTnQ7KV6SP7bN72TA==
X-CSE-MsgGUID: vavG6ofWSDa5Sbvl3fOfVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37354296"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="37354296"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 20:33:22 -0800
X-CSE-ConnectionGUID: jGlgtKaKQm+6dXqhMOR+fw==
X-CSE-MsgGUID: w8D2VmmkSempqN1Qlnehrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="101286561"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2024 20:33:21 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLxMd-000Bhh-1e;
	Fri, 13 Dec 2024 04:33:19 +0000
Date: Fri, 13 Dec 2024 12:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 6399/30000] cc1: error:
 '-fsanitize=shadow-call-stack' requires '-ffixed-x18'
Message-ID: <202412131259.KN2mknwg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sami,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: 332eaac720a2ecaa3227b70cc792a1698cafdfb9 [6399/30000] FROMLIST: arm64: implement Shadow Call Stack
config: arm64-randconfig-003-20241212 (https://download.01.org/0day-ci/archive/20241213/202412131259.KN2mknwg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131259.KN2mknwg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131259.KN2mknwg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: '-fsanitize=shadow-call-stack' requires '-ffixed-x18'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
