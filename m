Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329762AD10
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 01:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778896044; cv=none; b=neWnqpFVETojCjbHxB9sIcSe5F/p1+1+3tF6Ts8lxto1rxG7NiwMUK6fho6IlYEkvfLnRBg5lBqkBvicJt5z7gBN53k4//vzgTtmPrB2dp/Ub+YBW0xYhR/JkwlFA82qhZARXUopb459uWxO5j9jtVsH1aNfOQ9Ht/uGWT6d7jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778896044; c=relaxed/simple;
	bh=tyth93Q1Eo8RL9GIFEXixnEJ3RYZ0iSaBZ+L6dVVCYY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SRghZ0ThXKynkCUbm+60l5Cpk1+T7kykzIZ3xUIKQFFM5zfMKlXFTVk+j761qOcMtJlkPFyJflAVLuU4C14K0mPxSxZzjKAf8v1D4jk63+ChKTwBo8Kbx8PBtIcvUSSpPpdW7HEXRMPTNcfjcZNOFosJppgTazzRqGPJwQRy+QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFCCs+tj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFCCs+tj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778896042; x=1810432042;
  h=date:from:to:cc:subject:message-id;
  bh=tyth93Q1Eo8RL9GIFEXixnEJ3RYZ0iSaBZ+L6dVVCYY=;
  b=PFCCs+tjE7TlmHmwGKTHnmSayX23zo8cl5T5cXfWXI9883EiXSQ83+5p
   PD+4YdHMg2u4FxLprm4fdeMSl/fcDuOghGxvUUHrUlO7cVTEz+PTELVqu
   oV+IsKuKWyMYQJMhUP9tO2JUJLBHYn/ouXUe4FHcWgbi5XP6cAQC2KmGF
   BM4D+tV9JhO/etL5wyolxZNo/9yYMk61/nzVKy1h7IQk7tScNpyOrcXFs
   29TYEVHwuonp74BLwrRICpOH/KMJsqLPPLzXGRA4CMKTqwRxKAEwRWlSz
   bNEfpd5cnE4lCtvA11fAOejRXeMUyiDdVoXZfzyCug48ur+/H7WtjFYMw
   Q==;
X-CSE-ConnectionGUID: 2Al+6QCwSfuMR6Md+4FcvQ==
X-CSE-MsgGUID: jUHz+3koTmih4PBcGM5/8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83709323"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="83709323"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 18:47:21 -0700
X-CSE-ConnectionGUID: tNcNgOJxRcGGVQw8+kMINg==
X-CSE-MsgGUID: 0oUIxrTtTGuiCEtwDjBc7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="240683418"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2026 18:47:20 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO47a-000000009AJ-0Fx5;
	Sat, 16 May 2026 01:47:18 +0000
Date: Sat, 16 May 2026 03:46:24 +0200
From: kernel test robot <lkp@intel.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ld:
 drivers/crypto/atmel-ecc.o:drivers/crypto/atmel-i2c.h:108: multiple
 definition of `atmel_i2c_sha_rsp_size';
 drivers/crypto/atmel-i2c.o:drivers/crypto/atmel-i2c.h:108: first defined here
Message-ID: <202605160354.CNUCpqeg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Lothar-Rubusch/crypto-atmel-introduce-shared-I2C-client-management/20260515-091536
head:   e09306dbec1d5953ab1b13b3edeecde6e9fae54a
commit: e09306dbec1d5953ab1b13b3edeecde6e9fae54a crypto: atmel - add SHA256 ahash support
date:   24 hours ago
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260516/202605160354.CNUCpqeg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160354.CNUCpqeg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160354.CNUCpqeg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/crypto/atmel-ecc.o:drivers/crypto/atmel-i2c.h:108: multiple definition of `atmel_i2c_sha_rsp_size'; drivers/crypto/atmel-i2c.o:drivers/crypto/atmel-i2c.h:108: first defined here
   ld: drivers/crypto/atmel-sha204a.o:drivers/crypto/atmel-i2c.h:108: multiple definition of `atmel_i2c_sha_rsp_size'; drivers/crypto/atmel-i2c.o:drivers/crypto/atmel-i2c.h:108: first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
