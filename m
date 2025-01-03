Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D37A1BEF6D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735942943; cv=none; b=HBPl+1QQZHhwAN2kG7Q21yHKWw+ybEmkxueDnAPLcGhD5rYugDU0rsnRkFkLwMkqUvr2LWBjsCPnlBXIAdVA/nkBxNOmicdXle9cMkV51sk/SC1zKp5GL2cuWAZ8QNKhGWHWftGjobvwpwSqXBFHDlGhZR9cQzA/ihOUReVVStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735942943; c=relaxed/simple;
	bh=roYZxrc1vzYqG6qqEzQj53GOhadBgwUcMrxKWyPszrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FplKdusoYHyA6SJnxHO6ZTBnaCvoDkYRl2SOUmj0o/qM3MMuNfi9qPVnVB4yNQDWKcEmCTCGmVRGn4b4qhZ59ig4Dj24+HxFctDutpfR0NwyD64H9ytArPSp+/lPAhIRlgpIHoBielRvBvndzx8cMB1sufwgKyo+dHuDDm7qEMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZqQke9J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZqQke9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735942942; x=1767478942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=roYZxrc1vzYqG6qqEzQj53GOhadBgwUcMrxKWyPszrc=;
  b=NZqQke9JqbG24xzC4K3WYO6GMmTBUUcIa1McH7vFWuqVF3hz+0sfVmPG
   El/d3m68AQTNvLbXx0RvhKkLKc/ZD1CdjnCBpIevdc+58rnTUpMyimc1x
   2nhgWNBJaXWitClXKelBFDO8pzopmbpWxrnReH2KNHOlB8f8mfUKs0U+4
   PHPK4WlrnYYY56g4cGUMah4VVNtwfdCLxpfYqH53r25pjUs9t2+DisSRi
   S/H7rbIg1EuG8UvF7AMGUronyeK2CkzvKhxOEHxV/vUkrd4Q2Ku7tqxXS
   uK4vsJmRtBWcrHNcRNScoWMkhUtlxmYxNE/HImFZaDl7oFr5cOVOZzpbz
   Q==;
X-CSE-ConnectionGUID: r6aHujgyQ8iD0myNTA2x2g==
X-CSE-MsgGUID: NbdYRRJ9T22DJxbd8qAddw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39013549"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="39013549"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 14:22:21 -0800
X-CSE-ConnectionGUID: cCO7vorqRKqM9NLPuDYV7A==
X-CSE-MsgGUID: 95NtksqJTnOvsbf/z37uZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="106751318"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jan 2025 14:22:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTq3e-000AMF-2a;
	Fri, 03 Jan 2025 22:22:18 +0000
Date: Sat, 4 Jan 2025 06:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/posix-clock-compat_ioctl 2/2]
 drivers/ptp/ptp_chardev.c:520:38: error: implicit declaration of function
 'compat_ptr'
Message-ID: <202501040604.dLkWdZnt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/posix-clock-compat_ioctl
head:   f1e225f429afb87c0ce2f4494be681216020bd72
commit: f1e225f429afb87c0ce2f4494be681216020bd72 [2/2] posix-clock: Fix compat ioctls
config: powerpc64-randconfig-001-20250104 (https://download.01.org/0day-ci/archive/20250104/202501040604.dLkWdZnt-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040604.dLkWdZnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040604.dLkWdZnt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ptp/ptp_chardev.c: In function 'ptp_compat_ioctl':
>> drivers/ptp/ptp_chardev.c:520:38: error: implicit declaration of function 'compat_ptr' [-Wimplicit-function-declaration]
     520 |                 arg = (unsigned long)compat_ptr(arg);
         |                                      ^~~~~~~~~~


vim +/compat_ptr +520 drivers/ptp/ptp_chardev.c

   509	
   510	#ifdef CONFIG_COMPAT
   511	long ptp_compat_ioctl(struct posix_clock_context *pccontext, unsigned int cmd,
   512			      unsigned long arg)
   513	{
   514		switch (cmd) {
   515		case PTP_ENABLE_PPS:
   516		case PTP_ENABLE_PPS2:
   517			/* These take in scalar arg, do not convert */
   518			break;
   519		default:
 > 520			arg = (unsigned long)compat_ptr(arg);
   521		}
   522	
   523		return ptp_ioctl(pccontext, cmd, arg);
   524	}
   525	#endif
   526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
