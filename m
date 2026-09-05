Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA352B2D7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 04:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788584222; cv=none; b=HwvlZrJAEHoEwflL7kFhNdN4gjEMhhwydWILPRB1ijtR4qRnksgfGZf6pcyI0B7Kxku9ImE2qmBAGrbk9nr2FAOvrfejlDbunSAcZP4NZh6M0q1jVezB9QSSWATaamJ9igGb6hhG+36ej99N3k6Cmlb9edqiJLD6yHDgWIFbdW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788584222; c=relaxed/simple;
	bh=9CGu77sF3RFvm+uiVvZ87T9TATziZDgaHRDq3s65nHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sysJEDbjeoYoqRUuTOWFwv7kRkThe4xGmqhhP3q7jj7xTvqmVDITJBhUUceGwkwri8XabIFYqoZLjXWd4bCDTTFJH/Mk9SwBpuphTEairqgCOup/oh4+KYZwHGb4mrza2WOWnqOsG2b81PSt8vUJnl2+kdCyWdGsup1RTxLAYMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juwMIvfV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juwMIvfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788584221; x=1820120221;
  h=date:from:to:cc:subject:message-id;
  bh=9CGu77sF3RFvm+uiVvZ87T9TATziZDgaHRDq3s65nHk=;
  b=juwMIvfV5abb83ZnbpIauW9kG98KcWYaIu/iFYtt6RmSj/lKc2evW87w
   SXVcjjRYArOT+wc49jzRhwyURztg0EqVG69Qfw5uWgfYIgT2Jl7SwsMnY
   AHzNQIKO8LXXGpn+vomS2nUBJmSr8PDYs+RTTyxkJQLEyCLMnh6+dzTi9
   yKTOs9Qmo21OlW2Z6x51RAazODGyXYtSz6UfInquPC6P/UbAsDvaLoW10
   tIJ58EBqWkbO3EtP/pb5FpztYxDt/taZ1kkBOPrEslDvmwly7gKGOahyd
   SVBiFQCZJHbvO6AmHvohjXsAQUKqokfgqtCnsoX8XP11EiHSA4JlyIhJp
   w==;
X-CSE-ConnectionGUID: r5FyPUUKSmyoFECGfPxVzQ==
X-CSE-MsgGUID: kX6VyvkYTZijxjDSUsOtaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106599174"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="106599174"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 21:57:00 -0700
X-CSE-ConnectionGUID: EVBFyfoLSgOIzd1EvKtO0A==
X-CSE-MsgGUID: t3NDUPKURBOq6VZdmQT3WQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Sep 2026 21:56:59 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2iSW-0000000003H-1yCg;
	Sat, 05 Sep 2026 04:56:56 +0000
Date: Sat, 05 Sep 2026 12:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Timber <dxdt@dev.snart.me>
Cc: oe-kbuild-all@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Subject: [linux-next:master 3361/4370] fs/exfat/super.c:78:undefined
 reference to `__udivdi3'
Message-ID: <202609051257.z3X2SpAD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
commit: f26dc8d89fc52fe105abb626f39eea3ec226b956 [3361/4370] exfat: update percent_in_use field when updating volume flags
config: i386-randconfig-052-20250512 (https://download.01.org/0day-ci/archive/20260905/202609051257.z3X2SpAD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051257.z3X2SpAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051257.z3X2SpAD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/exfat/super.o: in function `exfat_calc_perc_in_use':
>> fs/exfat/super.c:78:(.text+0x6eb): undefined reference to `__udivdi3'


vim +78 fs/exfat/super.c

    71	
    72	static inline __u8 exfat_calc_perc_in_use(const struct exfat_sb_info *sbi)
    73	{
    74		const unsigned long long total_clus = EXFAT_DATA_CLUSTER_COUNT(sbi);
    75		unsigned long long ret = sbi->used_clusters;
    76	
    77		ret *= 100;
  > 78		ret /= total_clus;
    79		return (__u8)ret;
    80	}
    81	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
