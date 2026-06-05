Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79671315D58
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 23:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780701377; cv=none; b=r4VfgWCr2gxybNoX7YTjdVQ8cJ5hLGU475o9Dun6oZ67CsPGW2gyh/0f8NRR1i1NcQCZKif0G7u23ytFP+Rb425gAE16quBsD+tgjejciY8Wqw03r5U0cMUZ+iZIAHCNkEpSMwQyMLoziBX0qicGyoJB8m5BELRVLbmHrqKyEHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780701377; c=relaxed/simple;
	bh=5CdRWir4ZkeM/KTxhbR9rq4iiR/1jMNC+t+pVRnnLSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rsl9aXFMV/6pDBYBrNIL41j6n3eb1x8tM2ya+oH7SSN1Qapa4vxkh3tQKe6kxM7BARh6shV+oYR3bPY7JSImO43bX1WQf3Q0ODxbqGFIRxdkYFxQCS1macO7alKdz041Y6L3aUfhd5j2JQLsO7Vf1MWvXkRrLugSib9SXurDKEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHWzuVCW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHWzuVCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780701376; x=1812237376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5CdRWir4ZkeM/KTxhbR9rq4iiR/1jMNC+t+pVRnnLSk=;
  b=QHWzuVCWM8trI7YdCP2yiD2VE2FCnLa3amnXvanQzMz9aGzbupkQtSP1
   2f/s2uY3mRYoL9tYMzXFzaUpcnnL8rxDz5MOfkozs3tf5spy0jgjTJzHs
   bVtpos1gpyCfdQPLgTLT/NXZohV7IS2tzlQwXKxeSyUVmlJNZHB6+ZaYl
   8ZUZUYcieX+FvhQ55ZvVgHhi8xAuuEjDRbXUXCzfoN5NkYzD0vjWnpgcp
   a7tRdHfaczI86wS9vaAhAjZYfKgNYOn0hxhcSq/DwgS6VRHzOrWvwK4aK
   Bm4savDByj1wGVF9VfGlqAFx6PaxwgvELNocKHb+DRcRMj+h5YE1A46B2
   w==;
X-CSE-ConnectionGUID: gFEMCFTTS+Om8MYL5d0yBw==
X-CSE-MsgGUID: Xa1HpJpGQ+mFUw18Z7vjqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="99111646"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="99111646"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 16:16:14 -0700
X-CSE-ConnectionGUID: UgY+svFyQQS0DEdBW+gKcw==
X-CSE-MsgGUID: Kbb4itfQR4qO6e60SP132w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="275187350"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jun 2026 16:16:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVdlp-00000000GY8-3tGd;
	Fri, 05 Jun 2026 23:16:09 +0000
Date: Sat, 06 Jun 2026 07:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-arch-clockmodes 2/2] /bin/sh: 1:
 cannot create arch/arc/include/generated/asm/vdso/clocksource.h: Directory
 nonexistent
Message-ID: <202606060754.wwCEEF4h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-arch-clockmodes
head:   1b1c323824ccf946f485c54ed34d3a73a9e92651
commit: 1b1c323824ccf946f485c54ed34d3a73a9e92651 [2/2] vDSO: Make clockmode constants available without CONFIG_GENERIC_GETTIMEOFDAY
config: arc-randconfig-001-20260606 (https://download.01.org/0day-ci/archive/20260606/202606060754.wwCEEF4h-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060754.wwCEEF4h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606060754.wwCEEF4h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: cannot create arch/arc/include/generated/asm/vdso/clocksource.h: Directory nonexistent
   make[3]: *** [scripts/Makefile.asm-headers:78: arch/arc/include/generated/asm/vdso/clocksource.h] Error 2 shuffle=166802907
   make[3]: Target 'all' not remade because of errors.
   make[2]: *** [Makefile:1393: asm-generic] Error 2 shuffle=166802907
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=166802907
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=166802907
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
