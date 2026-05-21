Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7651033A9CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 05:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342663; cv=none; b=Ro729eIryxUSEF0+CBRlvi63l1fBqgS9KB+aTvNER9WlrQyP4oaTjWHPe+DbX9UjlKV491WdIG1LWGzo65y+GIEx9brlgHFmEgrHPcksAUiDFrGcMrEklfKAThFU7y3uLEKwrvqG/ZVU29Hzsn84sco9E5r23tGIk6Vc2CUrhyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342663; c=relaxed/simple;
	bh=ashRd/wxUSH/gL/ujbGmfYj/KSAY1cOB6WuOCvq7lyA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QmsOI82pUZO0tKyWCBEoIYQC9su+rkZzFgwR6hX1X6eZUCGlKx0CR1WEAwd7wobfq4/EId9MMmdGn5B8iyqJYSDKbX9COezNIBsMZ138FrYyk7kJnLXUV7gklbcUd9NJIcPDHzKD3gZFYh9PPh4UfawkIkxk0rA6bz2TsRkHZYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l80+EBUb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l80+EBUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779342662; x=1810878662;
  h=date:from:to:cc:subject:message-id;
  bh=ashRd/wxUSH/gL/ujbGmfYj/KSAY1cOB6WuOCvq7lyA=;
  b=l80+EBUb65LjtwC/AhMzzUjcaM8ol2SeeZfrJv1Miu0wyGtAQVBWgjLj
   Qxy9aEcVZrEKOZuZUmFkWoVV7ei5lgAXJAZdILkvnYSV+TH1WsEm8f5tY
   CTAdF3meypfZZcgGvE/H1nMHyQWR/PP1FTfxLovuj4YOhWj4yFdtVoXp0
   ulmRhkNeSu30CU3C4smJy+AlR15WBuAuCIudZB67dGcPkZUMarRQx3vWH
   YfbgsOwAXm0hKscpSjhCP1k7hwdvrVrLhb9biPl+oRDVWV9pajjxT2sO0
   PXgOeC1J7FfZ8nqUrofrSKz43gffTDONbF6NQ8zPDAZFIa7v9TB/R6EJv
   w==;
X-CSE-ConnectionGUID: lr4iFZ1MQXCsLH+e7iHDEA==
X-CSE-MsgGUID: 9vqkcPzRTBqY5MrOTp0/LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80236130"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80236130"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:51:00 -0700
X-CSE-ConnectionGUID: kqRNHFsfR6WVjEhZP5sKWQ==
X-CSE-MsgGUID: zexw+vP7QRK55VbTsemzbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="236182951"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2026 22:50:58 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPwJ6-000000004UL-0HjH;
	Thu, 21 May 2026 05:50:56 +0000
Date: Thu, 21 May 2026 13:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 44/44] csky-linux-ld: timekeeping.c:undefined
 reference to `ntp_get_time_state'
Message-ID: <202605211326.GwDXdszM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   0351afde272ddc6e1f1312297a5e084c598ff4b0
commit: 0351afde272ddc6e1f1312297a5e084c598ff4b0 [44/44] kernel/time: Add /dev/vmclock_host miscdev
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211326.GwDXdszM-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211326.GwDXdszM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211326.GwDXdszM-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_adjust.constprop.0':
   timekeeping.c:(.text+0x2638): undefined reference to `ntp_get_status'
>> csky-linux-ld: timekeeping.c:(.text+0x2640): undefined reference to `ntp_get_time_state'
   csky-linux-ld: kernel/time/timekeeping.o: in function `tk_setup_internals.constprop.0':
   timekeeping.c:(.text+0x2978): undefined reference to `ntp_get_status'
   csky-linux-ld: timekeeping.c:(.text+0x297c): undefined reference to `ntp_get_time_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
