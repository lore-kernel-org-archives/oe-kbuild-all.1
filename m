Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDBF2045B8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738703766; cv=none; b=peNLNFMZvoydOZnN95lwDmtbw/GGjSRs2INKm4baqoW5Pe5rgQnflqiBTt/uflj7HrLOgzKumODTs4cEwmR+xfO4gc9M0E4rD62zIuwRV7o2el9QrDkRBMbhL1DWUQdUAE8m/j33xXDiWLsTlQKstK2b4oUbCK9AyfhCL4fRyl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738703766; c=relaxed/simple;
	bh=3LyEuAtP86pmkq+I9eLiNnkoAQw9HV/6WzQbkI8tPVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i1uiAFZfo5Jk+t1Vq0CqY2ClgH9s/k9itJsrlEXetChzMUm43VWIkznl9g1zjVRp8BJ9tqADkpJ4ASLjlczF+/HEY4gF/NomQSoqMwsPRfyLcWFFTZtyr2hRveROMZqFv/nmpm0VpMv/sXSW58EmMHaGYAXHnBHyYpcoQ7fiJoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWKhbBt3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWKhbBt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738703761; x=1770239761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3LyEuAtP86pmkq+I9eLiNnkoAQw9HV/6WzQbkI8tPVQ=;
  b=KWKhbBt3NBje7WbL+5I8DNAzVN5Lp0C3Zj0cbDxa1I8D6s5EY3Cv5ceJ
   U95PjgERdDOWhdZXAJ6jToEoS6MLFdqfLS23l53tK7Wctfa3wWyYTlXDv
   YkL+yOK6jGVPGAHKlHNFSBNZ20XRvG7ofsBlqfQpVoHw/aL0mvOPzaW6y
   wHq0TeUca9F8UtVLJF6fN9Jvd2V3aRvbJeaTLS2niJ1qmgPdnbl72iDIS
   PtZBXRJY1iKNrkb401A9akELm+jtFqCIwPrHK2TgSeBJK3D9Q7+pTWZ01
   qYUxByDtymJ8J9YIvuRt5HjN+nvihBerPMVOCfSVh42+PLE8l9TGzYtAv
   Q==;
X-CSE-ConnectionGUID: NkbpX6Y9TEeMQXEefhAfWA==
X-CSE-MsgGUID: 61Ba2t+US5iFDLp39VGIkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56674724"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="56674724"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 13:15:58 -0800
X-CSE-ConnectionGUID: KBntiWN6SnW2wg5jaL+H5Q==
X-CSE-MsgGUID: 74JGoMaPSve8Wb/fSNZoeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147920201"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Feb 2025 13:15:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfQGw-000t17-1M;
	Tue, 04 Feb 2025 21:15:54 +0000
Date: Wed, 5 Feb 2025 05:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 21/23]
 lib/kunit/uapi-preinit.c:44:1: warning: control reaches end of non-void
 function
Message-ID: <202502050514.pKKnOj7I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   c5dc664800bcb374e0ea3bcb152167b8dc1715c0
commit: 843542230b45c042286f208e66c0c473f03abd99 [21/23] kunit: uapi: Introduce preinit executable
config: x86_64-buildonly-randconfig-004-20250205 (https://download.01.org/0day-ci/archive/20250205/202502050514.pKKnOj7I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050514.pKKnOj7I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050514.pKKnOj7I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/kunit/uapi-preinit.c: In function 'main':
>> lib/kunit/uapi-preinit.c:44:1: warning: control reaches end of non-void function [-Wreturn-type]
      44 | }
         | ^


vim +44 lib/kunit/uapi-preinit.c

    26	
    27	int main(int argc, char **argv, char **envp)
    28	{
    29		int ret;
    30	
    31		ret = setup_api_mount("/proc", "proc");
    32		if (ret)
    33			exit_failure("mount /proc", ret);
    34		ret = setup_api_mount("/sys", "sysfs");
    35		if (ret)
    36			exit_failure("mount /sys", ret);
    37		ret = setup_api_mount("/dev", "devtmpfs");
    38		if (ret && ((ret == -ENODEV) == IS_ENABLED(CONFIG_DEVTMPFS)))
    39			exit_failure("mount /dev", ret);
    40	
    41		ret = execve(argv[0], argv, envp);
    42		if (ret)
    43			exit_failure("execve", ret);
  > 44	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
