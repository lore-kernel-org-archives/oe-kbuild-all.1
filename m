Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5B48C1F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765566083; cv=none; b=jdeLjkg3DYANJdyWxOOZdO5qIc6ZobTJ5ruwQ8aoe2YMzJhMV4Z2E9nUjI2tlvzwCF0DPoPYDDziSlxwAFoDi8l/B43ohb1j31h0C0J9KDqwEAwH8lc3OhN0ooSNczUBAZh2wBlQgEBcQD61n5CZLlrb6ecsCyrRobW5CXZ5k2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765566083; c=relaxed/simple;
	bh=9K8HwkMFVl6Vss8wLx7WRIJhtJZ3w9bqHQb4VJeh+hM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ob1z5fZ6bV0WYdGqMaOkPqGVFl86kpL8fHTDFnIwt4W7gyshMEUee6ESj0Jy3ZE4TSa3BAKsRVMEmY72XtWTtj2DoEiHEzeiO1Ez2nGT8ZZSPcjZrK49+5oqObiYBLgaduAci29SWNeRp8RbJFm99jtAlrpxo6HuVkWAP62GoyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+33EdML; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+33EdML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765566082; x=1797102082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9K8HwkMFVl6Vss8wLx7WRIJhtJZ3w9bqHQb4VJeh+hM=;
  b=m+33EdML12VmBluMF8K3wGywS8PNwc0bqJIRDtqWjnRTh+Vq+XuVcAUt
   rjtIA+jLOwlQ9tVv7pgKP4isNefgoAFTB8zI5FoB9ufq/S/eGJYOlCB4b
   EgeO0cvF0Sj+W+fFmk5xgnQ2IlEvWhDfFPdGBZt5K83QqBV3InLqoJBqc
   7kLY5rUWJgeKlojZSLbFEX6xFBPT5N6nGdOnL71H3JjwHjB5cV7Wvr9I2
   jBV0l0EdE35iWq6od2jwCk8esoo3lpCvrsLkS0FjCsD9PhiCzqH9OQXY4
   qSAY/KPdxY91sc19kWK6g7689c3fjxhdKwaYWVx8vUhv4OcD/ktHNTkZj
   A==;
X-CSE-ConnectionGUID: D8gFOIfoTD2FLcPVjOVpKw==
X-CSE-MsgGUID: 80uqwch8TdSx6mjmxMxcXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66563879"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="66563879"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 11:01:21 -0800
X-CSE-ConnectionGUID: lwD5qv1mSfuHq/9ASXSSvg==
X-CSE-MsgGUID: oIhIYU6KQuSNIIeTGtLjpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="220531897"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Dec 2025 11:01:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU8OD-000000006TR-2u5V;
	Fri, 12 Dec 2025 19:01:17 +0000
Date: Sat, 13 Dec 2025 03:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/crypto/ccp/hygon/csv-dev.c:882: warning: Function parameter or
 member 'api_minor' not described in 'user_data_status'
Message-ID: <202512130255.5pbCemhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 518c81d56c055affc71650b1ad1ba7f86e5ee867 [3541/3541] arch/x86/kvm: Support tkm virtualization
config: x86_64-randconfig-101-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130255.5pbCemhg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130255.5pbCemhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130255.5pbCemhg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/csv-dev.c:882: warning: Function parameter or member 'api_major' not described in 'user_data_status'
>> drivers/crypto/ccp/hygon/csv-dev.c:882: warning: Function parameter or member 'api_minor' not described in 'user_data_status'
   drivers/crypto/ccp/hygon/csv-dev.c:882: warning: Function parameter or member 'reserved1' not described in 'user_data_status'


vim +882 drivers/crypto/ccp/hygon/csv-dev.c

   851	
   852	/**
   853	 * struct user_data_status - PLATFORM_STATUS command parameters
   854	 *
   855	 * @major: major API version
   856	 * @minor: minor API version
   857	 * @state: platform state
   858	 * @owner: self-owned or externally owned
   859	 * @chip_secure: ES or MP chip
   860	 * @fw_enc: is this FW is encrypted
   861	 * @fw_sign: is this FW is signed
   862	 * @config_es: platform config flags for csv-es
   863	 * @build: Firmware Build ID for this API version
   864	 * @bl_version_debug: Bootloader VERSION_DEBUG field
   865	 * @bl_version_minor: Bootloader VERSION_MINOR field
   866	 * @bl_version_major: Bootloader VERSION_MAJOR field
   867	 * @guest_count: number of active guests
   868	 * @reserved: should set to zero
   869	 */
   870	struct user_data_status {
   871		uint8_t api_major;		/* Out */
   872		uint8_t api_minor;		/* Out */
   873		uint8_t state;			/* Out */
   874		uint8_t owner : 1,		/* Out */
   875			chip_secure : 1,	/* Out */
   876			fw_enc : 1,		/* Out */
   877			fw_sign : 1,		/* Out */
   878			reserved1 : 4;		/*reserved*/
   879		uint32_t config_es : 1,		/* Out */
   880			build : 31;		/* Out */
   881		uint32_t guest_count;		/* Out */
 > 882	} __packed;
   883	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
