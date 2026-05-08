Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB9F3101C0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261781; cv=none; b=H8aNF/VFbkLjbh8GtxPqZWPkI3hjYoek+a9Ooco0Y/FQifEX/m2QGiEC2TV91lafbtq6gCk2y2VvxZxU2iFl/EjJVLX4gSCXFPAgtK82jooA6EUKunDQYcGK1wKS1yYFPFTJk0VvBouhi1Af3+20cEI2qIpPeVe0FOKLljThrQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261781; c=relaxed/simple;
	bh=vnGAqxmHMuExQaU2al5I0ubBFN/4aUXYJ1X0/tQzspA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bGuXh2SYO8HTvjK1YemZr//58FgUWOpApQGYOk/GCQhhqMlKKKV2Kp64M5fijlpYZ3U1/Hzo2gAuuBYhd0y/Lnyb8qrSfFwRyLQXatF1GiO+3wUo9Pf71FdWUkz2P1Zn4I/N0LDx9KRxZs0h142uisrlcKPW59pEnvjPZIH2mls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDGOlnEG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDGOlnEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778261781; x=1809797781;
  h=date:from:to:cc:subject:message-id;
  bh=vnGAqxmHMuExQaU2al5I0ubBFN/4aUXYJ1X0/tQzspA=;
  b=VDGOlnEG8wCl9qeXRIQZzzTqyHoMH+1f8s0R/nbJVT73aQu1/HUR2KWZ
   nHZARoUdOu4ZptKc+QVoHcl+1Er9UR9PGvxgemevqe+k5fO0EB5ZbY0Cp
   9M1ZaZ+5wRBhbT7ZJAgsIAQuYnyjEogolqWm4G3bJYbbpwwY/aGLXOO4a
   xPIu0+JMV9zho+pvFgJYJwXjZ8a0fqGkuC3/AI4GUIfs4csOPWPhF9U+0
   YVy0Z5qthk8/HPRSLhPRLefu6jG8UFfe4srzz9DeUag1GUC1aoE3gCYGS
   RFgYsSYmV8TsXlii0mwM8g+V5RHjQL/QYpvsheZJx8EzNHCeWK46exHMc
   g==;
X-CSE-ConnectionGUID: 4Vsp4dMCSnmP3q4lGZEq6g==
X-CSE-MsgGUID: DQMXFAHpRnq14xRZykgbzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89824323"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89824323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 10:36:20 -0700
X-CSE-ConnectionGUID: OqnfuXwBSwiQBFzn3MhvuQ==
X-CSE-MsgGUID: utpdNpk6SD6PLuO46KWTKw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 May 2026 10:36:19 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLP7Y-000000000Jp-2hbK;
	Fri, 08 May 2026 17:36:16 +0000
Date: Sat, 09 May 2026 01:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-io-slots 8/13] io_uring/slot.h:30:19: error:
 two or more data types in declaration specifiers
Message-ID: <202605090121.4mVwBYvN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-io-slots
head:   2bbc5f014e3a6c148a49af38c5f288ee510ca57b
commit: d6bc8cedc57602fd55a789d2d5ecc56d47ef6ded [8/13] io_uring: add registered IO slot infrastructure
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20260509/202605090121.4mVwBYvN-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090121.4mVwBYvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090121.4mVwBYvN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:80:
>> io_uring/slot.h:30:19: error: two or more data types in declaration specifiers
      30 | static inline int int io_unregister_io_slot(struct io_ring_ctx *ctx, void __user *arg)
         |                   ^~~
--
   In file included from io_uring/rw.c:26:
>> io_uring/slot.h:30:19: error: two or more data types in declaration specifiers
      30 | static inline int int io_unregister_io_slot(struct io_ring_ctx *ctx, void __user *arg)
         |                   ^~~
   io_uring/rw.c: In function 'io_uring_classic_poll':
   io_uring/rw.c:1265:24: error: implicit declaration of function 'io_slot_iopoll'; did you mean 'io_do_iopoll'? [-Wimplicit-function-declaration]
    1265 |                 return io_slot_iopoll(req, iob, poll_flags);
         |                        ^~~~~~~~~~~~~~
         |                        io_do_iopoll


vim +30 io_uring/slot.h

    29	
  > 30	static inline int int io_unregister_io_slot(struct io_ring_ctx *ctx, void __user *arg)
    31	{
    32		return -EOPNOTSUPP;
    33	}
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
