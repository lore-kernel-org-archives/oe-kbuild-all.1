Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0518F2D73AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 05:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771997119; cv=none; b=YBtoK9MRYnu/G1XTNhHr/5YxFvHk7C3pA18f1E+OPLrd4EGT9Ctxb4YzTSJvXeIdfKfZqY5TM4mCV+WeSAXjkryhEb3/lGuZArVCyDeRXO4SP9qTnSha8hedricL47Qdl7GzZ9bjr30HvLMnI4BP7VNlpUhckBNNmhmhhC6rubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771997119; c=relaxed/simple;
	bh=tyi1dCK1k5czUw/cMzeXiV+nZxuml+BKLs+wWIgutng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cBPXF2mZawTwFJTUNwvtrxQE0HwaQQPsPXpULXu+nWbTwIn38KJXdywtt6o2ja/jfLgSAd69/Zm+pbe3vNEAUcAVKGWBFmtcsfXku303ZV4TGbahHGCrPtNBn3kcTaCXXtLfIJxnK+fb0iFAxqB0JjHiLfu5RjoLB+lu32BLezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gg8FnI4Q; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gg8FnI4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771997118; x=1803533118;
  h=date:from:to:cc:subject:message-id;
  bh=tyi1dCK1k5czUw/cMzeXiV+nZxuml+BKLs+wWIgutng=;
  b=Gg8FnI4QH0qFVFVVEhilpIAo5Fjat27lA5b15uJwprXC1+lXKQms1uOn
   Nxaoco17l3CDaB9c+0yRfHHzZYt6FKs6f3iKD8Sx5cku4wLNSZft0C3De
   mT+bPMJhNWHRhqTSU252QPkUwwOgxaLJp9MEFyi5N39ODi6mcF70VFjcB
   1BMSY2YVao66FaoQ/nkXAFTOuFox73eNGn+A0/QsvHJWZhywrMlT/Me7x
   Ytf4BLw4eoA6kQxrrUF1brrKBPfRQMmz5KZmOdRNw0TxT/HgKBFO4GpBS
   NXCx1FUx0v+lUhZxQyCivAMh5N2QbjU5n8ibGWdfMP+KT+uLQMuxGjlsb
   A==;
X-CSE-ConnectionGUID: OL1noEmLQGiz+fCCzQ57Tg==
X-CSE-MsgGUID: /ea9oS2ZQOichMhvkPRATQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73098241"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="73098241"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 21:25:17 -0800
X-CSE-ConnectionGUID: 3mK3EV7uRcCh/C+yp2mS/g==
X-CSE-MsgGUID: 7SwDsmfMQIyoQLeQ08FrRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="246684998"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 21:25:15 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv7Ob-000000003z3-1Utn;
	Wed, 25 Feb 2026 05:25:13 +0000
Date: Wed, 25 Feb 2026 13:24:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:for-next/kspp 1/3]
 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:99:undefined reference
 to `__udivmoddi4'
Message-ID: <202602251312.pq8yvrww-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   c471bbfb03f639ea9ec53a4b30ae6cba509eb2d1
commit: a74a57773d43d87ab4cc8ac4fdfa0fa511e43da6 [1/3] drm/amd/ras: Fix type size of remainder argument
config: i386-randconfig-141-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251312.pq8yvrww-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251312.pq8yvrww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251312.pq8yvrww-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/amd/ras/rascore/ras_core.o: in function `ras_core_convert_timestamp_to_time':
>> drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:99:(.text+0x23e): undefined reference to `__udivmoddi4'
>> ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:100:(.text+0x253): undefined reference to `__udivdi3'
>> ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:101:(.text+0x265): undefined reference to `__umoddi3'


vim +99 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c

13c91b5b4378b5 YiPeng Chai 2025-03-17   60  
13c91b5b4378b5 YiPeng Chai 2025-03-17   61  int ras_core_convert_timestamp_to_time(struct ras_core_context *ras_core,
13c91b5b4378b5 YiPeng Chai 2025-03-17   62  			uint64_t timestamp, struct ras_time *tm)
13c91b5b4378b5 YiPeng Chai 2025-03-17   63  {
13c91b5b4378b5 YiPeng Chai 2025-03-17   64  	int days_in_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
25c1e7414b2cab YiPeng Chai 2025-10-17   65  	uint64_t month = 0, day = 0, hour = 0, minute = 0, second = 0;
a74a57773d43d8 Kees Cook   2026-02-12   66  	uint64_t remaining_seconds;
25c1e7414b2cab YiPeng Chai 2025-10-17   67  	uint32_t year = 0;
13c91b5b4378b5 YiPeng Chai 2025-03-17   68  	int seconds_per_day = 24 * 60 * 60;
13c91b5b4378b5 YiPeng Chai 2025-03-17   69  	int seconds_per_hour = 60 * 60;
13c91b5b4378b5 YiPeng Chai 2025-03-17   70  	int seconds_per_minute = 60;
a74a57773d43d8 Kees Cook   2026-02-12   71  	int days;
13c91b5b4378b5 YiPeng Chai 2025-03-17   72  
a74a57773d43d8 Kees Cook   2026-02-12   73  	days = div64_u64_rem(timestamp, seconds_per_day, &remaining_seconds);
13c91b5b4378b5 YiPeng Chai 2025-03-17   74  
13c91b5b4378b5 YiPeng Chai 2025-03-17   75  	/* utc_timestamp follows the Unix epoch */
13c91b5b4378b5 YiPeng Chai 2025-03-17   76  	year = 1970;
13c91b5b4378b5 YiPeng Chai 2025-03-17   77  	while (days >= 365) {
13c91b5b4378b5 YiPeng Chai 2025-03-17   78  		if (IS_LEAP_YEAR(year)) {
13c91b5b4378b5 YiPeng Chai 2025-03-17   79  			if (days < 366)
13c91b5b4378b5 YiPeng Chai 2025-03-17   80  				break;
13c91b5b4378b5 YiPeng Chai 2025-03-17   81  			days -= 366;
13c91b5b4378b5 YiPeng Chai 2025-03-17   82  		} else {
13c91b5b4378b5 YiPeng Chai 2025-03-17   83  			days -= 365;
13c91b5b4378b5 YiPeng Chai 2025-03-17   84  		}
13c91b5b4378b5 YiPeng Chai 2025-03-17   85  		year++;
13c91b5b4378b5 YiPeng Chai 2025-03-17   86  	}
13c91b5b4378b5 YiPeng Chai 2025-03-17   87  
13c91b5b4378b5 YiPeng Chai 2025-03-17   88  	days_in_month[1] += IS_LEAP_YEAR(year);
13c91b5b4378b5 YiPeng Chai 2025-03-17   89  
13c91b5b4378b5 YiPeng Chai 2025-03-17   90  	month = 0;
13c91b5b4378b5 YiPeng Chai 2025-03-17   91  	while (days >= days_in_month[month]) {
13c91b5b4378b5 YiPeng Chai 2025-03-17   92  		days -= days_in_month[month];
13c91b5b4378b5 YiPeng Chai 2025-03-17   93  		month++;
13c91b5b4378b5 YiPeng Chai 2025-03-17   94  	}
13c91b5b4378b5 YiPeng Chai 2025-03-17   95  	month++;
13c91b5b4378b5 YiPeng Chai 2025-03-17   96  	day = days + 1;
13c91b5b4378b5 YiPeng Chai 2025-03-17   97  
13c91b5b4378b5 YiPeng Chai 2025-03-17   98  	if (remaining_seconds) {
13c91b5b4378b5 YiPeng Chai 2025-03-17  @99  		hour = remaining_seconds / seconds_per_hour;
13c91b5b4378b5 YiPeng Chai 2025-03-17 @100  		minute = (remaining_seconds % seconds_per_hour) / seconds_per_minute;
13c91b5b4378b5 YiPeng Chai 2025-03-17 @101  		second = remaining_seconds % seconds_per_minute;
13c91b5b4378b5 YiPeng Chai 2025-03-17  102  	}
13c91b5b4378b5 YiPeng Chai 2025-03-17  103  
13c91b5b4378b5 YiPeng Chai 2025-03-17  104  	tm->tm_year = year;
13c91b5b4378b5 YiPeng Chai 2025-03-17  105  	tm->tm_mon = month;
13c91b5b4378b5 YiPeng Chai 2025-03-17  106  	tm->tm_mday = day;
13c91b5b4378b5 YiPeng Chai 2025-03-17  107  	tm->tm_hour = hour;
13c91b5b4378b5 YiPeng Chai 2025-03-17  108  	tm->tm_min = minute;
13c91b5b4378b5 YiPeng Chai 2025-03-17  109  	tm->tm_sec = second;
13c91b5b4378b5 YiPeng Chai 2025-03-17  110  
13c91b5b4378b5 YiPeng Chai 2025-03-17  111  	return 0;
13c91b5b4378b5 YiPeng Chai 2025-03-17  112  }
13c91b5b4378b5 YiPeng Chai 2025-03-17  113  

:::::: The code at line 99 was first introduced by commit
:::::: 13c91b5b4378b5d08dc9ae9121b1645a0beec0bb drm/amd/ras: Add rascore unified interface function

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
