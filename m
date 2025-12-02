Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF041C71
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 01:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764640193; cv=none; b=Jt9ZpV8a+NARL/EPlyPOANu1TOX7dwD2zL+8yBB6PKYApznjzRsVLjF1lMxNOMJveF58PfeWTbOEdJmLfuNo3B/4SiBzpdl3nvkmZrd3fLm3Hq2J0PeMTH0nSVjIPpTjIfTtlq/ny4PfCwusNeIsAnnXK9xaNSv+JH0f4PMlVy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764640193; c=relaxed/simple;
	bh=HLpO6V4scfrhVLtCZ3+43BuHl21eaHun41YjRDzhvsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJJGcWij6b+R98FLnGDETQ7T77Bzk912uGNcG+sKs0YSeujxAoMp3Oh1JW5Nq7k6u6uEKA4/m6LmONn3uRi1X9yR0uMHwklG59E0110BzdLgPGFFkoPcRPd0DNXOI7XXfuQENzeUHqDZegxDxQOxGV2ooYinANTaLHgprq1Bhtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYE09jsW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYE09jsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764640192; x=1796176192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HLpO6V4scfrhVLtCZ3+43BuHl21eaHun41YjRDzhvsc=;
  b=WYE09jsWkThHpYAK9EvpMWrfqK/0Zkg9g4CoBsWEDB7Pa0/ueJN3lK8R
   6tk6l3TSiRhCjdk1ANUeiifRD6C9p+nTnM+vRlWstw54baGqSUDMetWy0
   Id/6+YdvJ1Fubf2ZlH3blUv7XkHy8QNt1kMT3/SrITiyL6lOUpj1b023u
   y4HCC5z6PCqj/ErwdAtJfJkS03GMCa5uRbK1U9kGYq4ITTM7gPPKotbG5
   B8Qb6O6ijNYUTUbbfxUgF4Iy+ZoFTHNKekg1nnhtkt7E4X84PDSEMYUav
   V8QV6OHCxdGpS+jiaVzfUp73lls2SjExG4ACiaTZv458Cf6Xg7eVmSrv5
   g==;
X-CSE-ConnectionGUID: pOzDrZDtSg2Y7PMi4IXbVw==
X-CSE-MsgGUID: +Sj1Wn0GTEOI9rFUC+7TSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65783285"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="65783285"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:49:51 -0800
X-CSE-ConnectionGUID: 3WbDpWlbTFS3E3Sn1bM7Rw==
X-CSE-MsgGUID: tmMkto6sRYuEoabrOUu0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="217566758"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Dec 2025 17:49:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQFWV-000000009Ix-1cz8;
	Tue, 02 Dec 2025 01:49:47 +0000
Date: Tue, 2 Dec 2025 09:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>
Subject: [linux-next:master 7344/13171] error[E0609]: no field `dev` on type
 `pwm_chip`
Message-ID: <202512020957.PqnHfe7C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: e03724aac758f71c6cda208ea3d1afd0bbb6d9aa [7344/13171] pwm: Add Rust driver for T-HEAD TH1520 SoC
config: um-randconfig-r133-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020957.PqnHfe7C-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020957.PqnHfe7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020957.PqnHfe7C-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `dev` on type `pwm_chip`
   --> rust/kernel/pwm.rs:301:74
   |
   301 |         let c_chip_ptr = unsafe { container_of!(dev, bindings::pwm_chip, dev) };
   |                                                                          ^^^
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `pwm_chip`
   --> rust/kernel/pwm.rs:301:74
   |
   301 |         let c_chip_ptr = unsafe { container_of!(dev, bindings::pwm_chip, dev) };
   |                                                                          ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `npwm` on type `pwm_chip`
   --> rust/kernel/pwm.rs:542:35
   |
   542 |         unsafe { (*self.as_raw()).npwm }
   |                                   ^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `atomic` on type `pwm_chip`
   --> rust/kernel/pwm.rs:548:35
   |
   548 |         unsafe { (*self.as_raw()).atomic }
   |                                   ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `pwm_chip`
   --> rust/kernel/pwm.rs:560:69
   |
   560 |         unsafe { device::Device::from_raw(&raw mut (*self.as_raw()).dev) }
   |                                                                     ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `pwm_chip`
   --> rust/kernel/pwm.rs:610:32
   |
   610 |         unsafe { (*c_chip_ptr).dev.release = Some(Adapter::<T>::release_callback); }
   |                                ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `ops` on type `pwm_chip`
   --> rust/kernel/pwm.rs:615:32
   |
   615 |         unsafe { (*c_chip_ptr).ops = Adapter::<T>::VTABLE.as_raw(); }
   |                                ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `pwm_chip`
   --> rust/kernel/pwm.rs:635:64
   |
   635 |         unsafe { bindings::get_device(&raw mut (*self.0.get()).dev); }
   |                                                                ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dev` on type `pwm_chip`
   --> rust/kernel/pwm.rs:644:62
   |
   644 |         unsafe { bindings::put_device(&raw mut (*c_chip_ptr).dev); }
   |                                                              ^^^ unknown field
   |
   = note: available field is: `_address`

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
