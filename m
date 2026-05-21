Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FB9356762
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 05:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342663; cv=none; b=gm4DJ+H/UKNGTeWFTn1MeoWEESAOD/GDYOmSSR/dSkLdachRr4A+T5aDqmxiVAEHKXPYRYMI2aBXzbsGzMGM+qyG7Bk3Q4+tNg9aFrZYjJodYH0wadlmZ54ccy6sD7AjaKVwFG9mN4ZU/i/TKRbjsl3QNCaEMe4RtdkrfuzM8Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342663; c=relaxed/simple;
	bh=yK4Ee9oGPr+2iVRytKMl20/nsWVnBvQvyejI2ERGGmg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dP/nZ3GHOVRCuSJhuZij8lUX8kTlhqS/MqdnGPRgRJpkhd3Gz/Mr1U+dsSnKAQBIJLXRbX4f9lu3O80rOk8V6cBNPZcsJ/dUDcOfcnREYaftCJBt8Zd3taPyBR8yAiUgQAmhftEAdQHImrl/yfbOlYnOIZ1ZMPkUqh2e9cuBZB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/e5QkGL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/e5QkGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779342662; x=1810878662;
  h=date:from:to:cc:subject:message-id;
  bh=yK4Ee9oGPr+2iVRytKMl20/nsWVnBvQvyejI2ERGGmg=;
  b=G/e5QkGLOBczjKpZas2so4sHuE0sBA7aVcFb3ZDcKreFijdYRI3zejsQ
   VsKcBk4s1kOX9n1iGzRbqWs5Hi5ZomAho9dDY5teI2M+bqCsinIEXEH28
   hJzcGgmqaKOMCwd2jlwixcyIZrWt+tK+VcuoXsLoSdEbSR+vrf+K2v0zH
   /gY82SgIOuPr7cYlyU+Kdv3FCWeXMZBJiFqJsl542nNOJGVwN0R8TNSPS
   7VAixbge/SUUydtB613BdBaNfZpZFxZ1jcEeXUN5Lmyx0ssKtZRejJDAV
   bNWs+Lk18y2mm0P+RYFu9xNxeZijV5TlpL270pxjLuxD8tYxlRyUAwwQ7
   A==;
X-CSE-ConnectionGUID: gyMAxoLOQjGbfeccy9PwJQ==
X-CSE-MsgGUID: DQDIxHFxR1yMHTK92yGXIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80236128"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80236128"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:50:59 -0700
X-CSE-ConnectionGUID: M+ly3ZbmQF2dw/1rfoQ8Sw==
X-CSE-MsgGUID: kU1lPXJPRjaO1DwG+9iIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="236182949"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2026 22:50:58 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPwJ6-000000004UH-05VZ;
	Thu, 21 May 2026 05:50:56 +0000
Date: Thu, 21 May 2026 13:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 39/44] undefined reference to `__moddi3'
Message-ID: <202605211351.eEeQALti-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   0351afde272ddc6e1f1312297a5e084c598ff4b0
commit: fef91959721b929cc114e9a4f8f9af4e73ddaa4a [39/44] timekeeping: Drive time_offset skew via per-tick ntp_error transfer
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211351.eEeQALti-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211351.eEeQALti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211351.eEeQALti-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: kernel/time/ntp.o: in function `second_overflow':
>> (.text+0x11e4): undefined reference to `__moddi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
