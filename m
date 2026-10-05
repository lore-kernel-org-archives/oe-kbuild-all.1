Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D37274641
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 03:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791172680; cv=none; b=T3nrgSsIdY33mFsNAnE8HhH4wrZwaOFafLBeMrXQSQvUQFUuoY5DMGI+gcZvxa21wkXEAi5kUGgAYmX/yS/AFDZsLkVqJYcpSkaL2JysYiozvOBqzCmKEJVZasFnVKrbprCfN5d4MihxmiYtESMdbVuJYIQgw/og5dmCyvfRJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791172680; c=relaxed/simple;
	bh=tUJ7v9J7tH3IHg/uv3mTS+qm3l+C2zk1IhGPn7tDYhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C/aGVm9giARD9OvzzWE8qhD8x3DUGmvxqbpuD0u1FUJ0B+zN+/eOOjtIeYyyEfmx4F0P6mE/i8Ve9fsl/GLUu8An0H56xa1y7PRJhGZcL7fpU65a96HlRrRLrywaIzFsxpfZoiG3GANAbdZk91H4xpL4ljt+IWigFbHvlJbRw7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5j1wZ53; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5j1wZ53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791172678; x=1822708678;
  h=date:from:to:cc:subject:message-id;
  bh=tUJ7v9J7tH3IHg/uv3mTS+qm3l+C2zk1IhGPn7tDYhA=;
  b=R5j1wZ53PJdkfPQWtzSjiKSYp3wAtNOemEbSPpM+RB5JtCsvg8xXoOpM
   uCKy13Sv5gT1FttqaX4C6mkCbcSENHhKaOALjdt+mWUOiOXNqXirronBf
   2ZexQBtuhu/wD6R713LU/tR0rn6JTYSWzpMSGGJOQuV61j2BkAodKcUao
   lG8+dPivrqVUBYelzHhlsNRe3+wYq/i6n5f6Dmc9LcWnAD15pFMq9U2iC
   t/tlXAMpow3+hNkFful8dl35ju7C55Uo82M/YD2loi8Ux7v67UuXJCAyM
   oUo03nfwjabPKqp9MbsuaoQYUpUZmilloRSP/kowQh/GNIf2SRBohYqp/
   Q==;
X-CSE-ConnectionGUID: orNOxdD7QKSwyTTnX6vE/Q==
X-CSE-MsgGUID: wlHMEi1vTGKS+NKSHTUkMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="95649046"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="95649046"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 20:57:58 -0700
X-CSE-ConnectionGUID: EgZWigC1RiSET6mOuH/x1Q==
X-CSE-MsgGUID: F9cwPCptRFCXdRr3W/t5sw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Oct 2026 20:57:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDZpq-00000000VJx-0G7W;
	Mon, 05 Oct 2026 03:57:54 +0000
Date: Mon, 05 Oct 2026 11:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-soak 16/23] Warning:
 kernel/time/ntp.c:99 struct member 'pps_rawring' not described in 'ntp_data'
Message-ID: <202610051140.ICEZtkyQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-soak
head:   eef47b09d53ef553d3089bce6c9a0f6a9c792f29
commit: d988e07afea778f8ca133be682f4d3710ac32736 [16/23] ntp: Select least-delayed of recent pulses as PPS frequency endpoints
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20261005/202610051140.ICEZtkyQ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051140.ICEZtkyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051140.ICEZtkyQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/time/ntp.c:99 struct member 'pps_rawring' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:99 struct member 'pps_rawring_n' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:591 function parameter 'ntpdata' not described in 'ntp_update_skew_delta'
   Warning: kernel/time/ntp.c:591 function parameter 'settle' not described in 'ntp_update_skew_delta'
   Warning: kernel/time/ntp.c:591 expecting prototype for ntp_set_time_offset(). Prototype was for ntp_update_skew_delta() instead
>> Warning: kernel/time/ntp.c:99 struct member 'pps_rawring' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:99 struct member 'pps_rawring_n' not described in 'ntp_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
