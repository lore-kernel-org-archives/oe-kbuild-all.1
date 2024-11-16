Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81531863F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768573; cv=none; b=f1e2zmBP6wNNIDDJg1EY8rnDOKn6RUVZMfi94dGPfxkrxFerZOyRYS6sdrz60If6gXWh2249Eqpd4a1FB17bIUFRoTzGXshiH4+kDeY57C6dw7dvQHiutnir9vS7GQuCtJFNwf7YMmCLUW1le5fFKtjJyR8IX4ejkcJNBXnkLD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768573; c=relaxed/simple;
	bh=Dxx7q3HMOBouvFw415gQ5rA5w5RnLWD2eWLFzh62qXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZJR+NuqrEc/jvPnVn2wtTMAoCCpHoHo2gH5XJFQFeYEAQn2uhFFwkQEJDUmYFYz3JgWmVhEmuLKQb6kFydAO3B3jLJljIwL8/4GZgfb2o+VwtlTN3P90ge6Lc1fr9bj45oLdZ/HC0qMKf0gsGHMK0Ox3fpsA1uolXFeisSBOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/2QeDBS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/2QeDBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768572; x=1763304572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dxx7q3HMOBouvFw415gQ5rA5w5RnLWD2eWLFzh62qXI=;
  b=V/2QeDBSVEv247X/pQR7Aw+4iSsxg+aZCnDYbDerR6nDBIWfq0gRqopz
   lw9Kx1GX88VZNOjeeI8Ksk5Svq2Ih1v0hq3C2GdTL99FSqn2QbKq+4v5X
   fd4o6178Lp9oTmdg+Dt8I+3V8i4OH93RcV2XIU+G1v7/1RUs4cx+Z9hn5
   O3VCzSnLb2lAOXso57OFFyDHYUPBX1AP9eSHsVPCPZU0XsnTEgH+C4FCb
   D1qYRCZTQvP+csSk/6LFnkK1IHouVwlYvaZoD7JO/LtIxYFgIzkUEFxAo
   HXBaQLy1l5E5GS6/O16vTTsB4k7LOMxxFu6M69927qRSo5+vpV5qH3NSb
   g==;
X-CSE-ConnectionGUID: CKyUvepZQnuhWH7pn1scYA==
X-CSE-MsgGUID: BTx7xXNiS06W1Sm7ZN8x1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="49197502"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="49197502"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:49:31 -0800
X-CSE-ConnectionGUID: VKwOsEJKSl2Z4pmLllK3WA==
X-CSE-MsgGUID: xdLCn8gARLOSuqCYif9z+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89589510"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Nov 2024 06:49:30 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCK76-0000hI-1J;
	Sat, 16 Nov 2024 14:49:28 +0000
Date: Sat, 16 Nov 2024 22:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/btree_update.o: warning: objtool:
 flush_new_cached_update+0xc8: stack state mismatch: reg1[22]=-1+0
 reg2[22]=-2-16
Message-ID: <202411160912.cy9SVuWn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cfaaa7d010d1fc58f9717fcc8591201e741d2d49
commit: fd104e2967b766f1151b4c58daa67cbde620b376 bcachefs: bch2_trans_verify_not_unlocked()
date:   6 months ago
config: loongarch-randconfig-002-20241116 (https://download.01.org/0day-ci/archive/20241116/202411160912.cy9SVuWn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411160912.cy9SVuWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411160912.cy9SVuWn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_update.o: warning: objtool: flush_new_cached_update+0xc8: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
