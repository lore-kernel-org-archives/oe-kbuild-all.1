Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449B316F85D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712329974; cv=none; b=pV695f29X2x0aC5ZFY0MCI88mq9ecBnT8vuigZtlzjfwVrT/sUimQe3dseRlxCyHxBVhRY6x5Bn4oZ4B4aKsdfA4vq9DB88bYoYW8F1ygaT4TXv4qs+5mebfV2NLEmN5kl98dPdqYv7ec/kWEuQqIvOVk72Mpe267IlEQzeeCjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712329974; c=relaxed/simple;
	bh=L+EstHcfYpzRZ/TLP9//CpcXFrDN3YqLhlpvPktxKnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSWKdee2t+UKJFGaPgzyoDCe62ZAJbVGGUzCf2yG+5PS8Wqmy1TduUbTauOMqZPARUhjSzaLrMQt834bNP3KtOWvY02qOD7rdijF7UJg0BvwFCLq7rSMrZDfGR3EL2IoV1AyOoW6uxfWqSw/LMsiL4m49mKXHzvrQ/we8IIhvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYpRAC47; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYpRAC47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712329973; x=1743865973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+EstHcfYpzRZ/TLP9//CpcXFrDN3YqLhlpvPktxKnQ=;
  b=eYpRAC47e1VX55ZnlwE5XCK7K59RxVt7mYoRBsCbV3XtGLUbnFuVZ5i/
   vrWhvoL5K/bDJHAle0mmZbuXBr9rUStO85i0y43tZvFp3YI0+r2TI01KW
   fs6FI3RuGp3zyKC8JMI9xlhM7neZF6OnDkGVcGP2y5lvLvzh2EsOQV34P
   pBkLVqxgNEJ2ydPIde0nnXwOO+5NMjvV4G7uJeeVsrlDk8sxt2OIXN8Jd
   WYvQoJWj4nRgBxqMg9UkTOS//vtiHxwHHQuUnL48CoZ8nQCdVswzr+hCJ
   E9dU2ieH00q9n+8+J6SfUAo47fpRrMur8q6n15oJ8EhL5yXZNj5NSV3/D
   w==;
X-CSE-ConnectionGUID: XXola3oEQB2SK3gjNyzplw==
X-CSE-MsgGUID: QTBs2NQaTaS6X2xNPa8CEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7502539"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7502539"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 08:12:52 -0700
X-CSE-ConnectionGUID: ShImGe+yR0S9fck85jRqSA==
X-CSE-MsgGUID: bC4a0k0GTU2ce6xjuGLv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="23928411"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Apr 2024 08:12:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rslFH-0002OC-2K;
	Fri, 05 Apr 2024 15:12:47 +0000
Date: Fri, 5 Apr 2024 23:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Kolacinski <karol.kolacinski@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	anthony.l.nguyen@intel.com, jesse.brandeburg@intel.com,
	Sergey Temerkhanov <sergey.temerkhanov@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Karol Kolacinski <karol.kolacinski@intel.com>
Subject: Re: [PATCH v6 iwl-next 05/12] ice: Move CGU block
Message-ID: <202404052226.aq0o8qIE-lkp@intel.com>
References: <20240405100648.144756-19-karol.kolacinski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405100648.144756-19-karol.kolacinski@intel.com>

Hi Karol,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0a3074e5b4b523fb60f4ae9fb32bb180ea1fb6ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Karol-Kolacinski/ice-Introduce-ice_ptp_hw-struct/20240405-180941
base:   0a3074e5b4b523fb60f4ae9fb32bb180ea1fb6ef
patch link:    https://lore.kernel.org/r/20240405100648.144756-19-karol.kolacinski%40intel.com
patch subject: [PATCH v6 iwl-next 05/12] ice: Move CGU block
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240405/202404052226.aq0o8qIE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404052226.aq0o8qIE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404052226.aq0o8qIE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_ptp_hw.c: In function 'ice_read_cgu_reg_e82x':
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c:244:25: warning: initialization of 'unsigned int' from 'u32 *' {aka 'unsigned int *'} makes integer from pointer without a cast [-Wint-conversion]
     244 |                 .data = val
         |                         ^~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c:244:25: note: (near initialization for 'cgu_msg.data')
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c: In function 'ice_ptp_reset_ts_memory_quad_e82x':
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:1167:58: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551614' to '4294967294' [-Woverflow]
    1167 |         ice_write_quad_reg_e82x(hw, quad, Q_REG_TS_CTRL, ~Q_REG_TS_CTRL_M);


vim +1167 drivers/net/ethernet/intel/ice/ice_ptp_hw.c

  1155	
  1156	/**
  1157	 * ice_ptp_reset_ts_memory_quad_e82x - Clear all timestamps from the quad block
  1158	 * @hw: pointer to the HW struct
  1159	 * @quad: the quad to read from
  1160	 *
  1161	 * Clear all timestamps from the PHY quad block that is shared between the
  1162	 * internal PHYs on the E822 devices.
  1163	 */
  1164	void ice_ptp_reset_ts_memory_quad_e82x(struct ice_hw *hw, u8 quad)
  1165	{
  1166		ice_write_quad_reg_e82x(hw, quad, Q_REG_TS_CTRL, Q_REG_TS_CTRL_M);
> 1167		ice_write_quad_reg_e82x(hw, quad, Q_REG_TS_CTRL, ~Q_REG_TS_CTRL_M);
  1168	}
  1169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
