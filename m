Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73F638F64C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131629; cv=none; b=cNFq6SPlCKdcZHTg1eNuoXro7dW5GuFyPA1xZKbZW9AAV4ZUwXbfuM1tBoaTpMfTsOpiFXFAB+8azozMLW5gApci5syxpJxYHYlvNRPXGbhG+km8Z/faeuSupHDLtEt95jGmILLGT9w37FVlEfU6HBCh9wiKJK8d4aZVLJVZdCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131629; c=relaxed/simple;
	bh=S4C3AP5DVRy/1IzF8N501/lFx/vZjuIigYsfHS55IZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d0i7x9QbDe+Gfy1FhYxsRGSW849Hfpmqrqo6Xq85aXYiUWxcBzLmbsxR4l7vdgo572Tn8/Qfoj8TM9ZoJDQF0Et6updZvC+tMPN8MjaZwhEkrA44TVeSIegBjTOoM1AEeGaJ9fWJbe3TK9Krx5VrbLFE7CLxqcvLLjAbNimTPOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1E4nDmP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1E4nDmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779131627; x=1810667627;
  h=date:from:to:cc:subject:message-id;
  bh=S4C3AP5DVRy/1IzF8N501/lFx/vZjuIigYsfHS55IZk=;
  b=l1E4nDmPfIAJv5RKvoGc2nN1DnKWRlBT3DvFAv2t94s25J9+zuI7XzER
   x4Fjh1yPZ/gwRfIZQVT5IwmnhJ4u9PEL5HeFE8OGuaWEcYCH8/V0uhaXh
   +2WTbzrMtRk+VeLI+5q2LT+aCdbDK7RUXnL5AZJsAxxGeGskwxxOm4sbf
   +RZcdea9GxgOuL4DqvajPYS4iSDVTgp+/7lzoT8zHJBEpKZ1MgX+r0FLz
   nUhpBJ6eKA65i2wCIoOS9PEjdKNsBE9zn8maBL1hMUdC3Y8JQkfRbE4se
   8C04kPZtZUuYxHIN7QeRexC5MAfT2NO/wX6g8Funa4RmzNTZTziRu0moA
   A==;
X-CSE-ConnectionGUID: Fgq/Zp3/ROuX/gaOPHyN+g==
X-CSE-MsgGUID: 0ufjfahNSna9/L34BQaKAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79961299"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79961299"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 12:13:43 -0700
X-CSE-ConnectionGUID: pWYds0gERmSWmTHzhD9i+A==
X-CSE-MsgGUID: S8nu+GXbS+qPj1P189+1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="239387289"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 May 2026 12:13:42 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP3PG-000000003Ig-3vo1;
	Mon, 18 May 2026 19:13:38 +0000
Date: Tue, 19 May 2026 03:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 43/43] aarch64-linux-ld:
 timekeeping.c:undefined reference to `ntp_get_time_state'
Message-ID: <202605190309.XAUNaxmr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   123146665ac9426e106557f5c14f8743b128a6b2
commit: 123146665ac9426e106557f5c14f8743b128a6b2 [43/43] kernel/time: Add /dev/vmclock_host miscdev
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260519/202605190309.XAUNaxmr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190309.XAUNaxmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190309.XAUNaxmr-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_adjust.constprop.0':
   timekeeping.c:(.text+0x818): undefined reference to `ntp_get_status'
>> aarch64-linux-ld: timekeeping.c:(.text+0x820): undefined reference to `ntp_get_time_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
