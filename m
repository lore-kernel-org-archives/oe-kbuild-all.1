Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9958E2356C3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748688808; cv=none; b=DAb2BMTzA//eHydYxFES3i8CB68YLs5GSQ+euU8O7mP63hpKuJ2GOSQraVkVQAKlpCrv3HzZK/GZpSiyp8evvazwAXgfXethJMIFKKhb8/NbcoT9tyxhrW1ok+N5Q6XXnblfpn0WkgJYb1rZ/eR+QOrFHq6qiVxCp+GfU7s4q5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748688808; c=relaxed/simple;
	bh=eOltjivOPHuU0/fqaLeCw0rzca/3IYm6vh+STHTTCWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCQYOhEj3Do2qUEMdgAmK8ToQ/BPiuEIkrMVWj2DSmi2PZPFZEBsVPXG1O2d6+zB5l2Hfl715vort6CxM7WuKEpniUonlngW+8bq7O8tqiIZ5kj74L8W91tXd9BdlzZ8g0Z2FfvHV4rEW6SWfJNy116JLuyFH2Dh0m4z5nn06LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnsBQXv3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnsBQXv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748688807; x=1780224807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eOltjivOPHuU0/fqaLeCw0rzca/3IYm6vh+STHTTCWE=;
  b=VnsBQXv3RM1QgFLdUhAY9NxSgrTTaG9AKp2icDJzjAzx5SD9H/MSzMgF
   zAuGl4GF+V2VCb+KWC5SGXM1o4MtcPOSzgKtw70ASr863h3BX13lJwU/8
   mkqGmeRd3sLScZ3q+DTabA35+RA+INCJp160FCznLsDnAF/at9THqCGRJ
   Lhd3MFiILNvO6NL4M5mQTDaCExh9QQAxB38eirm2bUf0ITQHILL1gepvl
   41EA5z/Tco+yvNN5BWQ8SpVIFDOC923O00gGJlvOvKRY/qAPgGuNGYxdQ
   F8mv45WrhBWWKjyqrh1p3JaVk2nvYZ/Otgnl9JKgj66XJY63LjARi1n2s
   g==;
X-CSE-ConnectionGUID: kotWQRFGQKiUJui5X7cnlw==
X-CSE-MsgGUID: uXglOjDnTnSXIE3M7RNn0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68197183"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="68197183"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 03:53:26 -0700
X-CSE-ConnectionGUID: WCRatmUEQEuBCNsL0825pQ==
X-CSE-MsgGUID: ETGjf6BxRi6Lr5rbNMSFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="143961862"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 May 2025 03:53:25 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLJq7-0000zS-0T;
	Sat, 31 May 2025 10:53:23 +0000
Date: Sat, 31 May 2025 18:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-05 1/1]
 drivers/mfd/atmel-flexcom.c:108:32: warning: 'atmel_flexcom_pm_ops' defined
 but not used
Message-ID: <202505311805.ixhvfr3E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-05
head:   b97c62c4e7d1e80fb6a2cb0cb381f03bbcd26a4e
commit: ad52b9890b83ffa7602a23949c2cb0c0d94681e9 [1/1] mfd: atmel-flexcom: Use .resume_noirq
config: i386-buildonly-randconfig-2001-20250503 (https://download.01.org/0day-ci/archive/20250531/202505311805.ixhvfr3E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311805.ixhvfr3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311805.ixhvfr3E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/atmel-flexcom.c:108:32: warning: 'atmel_flexcom_pm_ops' defined but not used [-Wunused-const-variable=]
     108 | static const struct dev_pm_ops atmel_flexcom_pm_ops = {
         |                                ^~~~~~~~~~~~~~~~~~~~


vim +/atmel_flexcom_pm_ops +108 drivers/mfd/atmel-flexcom.c

   107	
 > 108	static const struct dev_pm_ops atmel_flexcom_pm_ops = {
   109		.resume_noirq = atmel_flexcom_resume_noirq,
   110	};
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
