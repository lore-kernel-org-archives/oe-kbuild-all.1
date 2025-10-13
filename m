Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94E92ECD11
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 21:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760390529; cv=none; b=lUUNH/LOUFzL81aDg5LDnoQJuWy1r49oPGJagwmnsQ5cKX99LHJeJ+0EH7ujkaTntpAZi6sOI+N8RlJvuDpE9hCtIhMjFAfuAKXPQFMNbH4mZy+x4t6FzrDYVHaA2rmiRigqleqSrXUsI2PaRYC5tjInCHNFaBEzSsd6cuCay8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760390529; c=relaxed/simple;
	bh=6ntnqTOlJedOJehYxMVQ/LA8XCrMmJACkD0OGAldBQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPs9ZkC6PaO5RAKSkqDqngmfURZ5PLlyNcqKNVx7yVgmksNFg0BNXtA5XxwkiyaCGTDrwTiBTeWblJfL/z6eAPoYM5dyF1cs9xXaeQSb46IFhd85WwE9YIUM5ksM+Wh6gl7hmcwsBBtwQQPxc1v6RDAcZviaHq97VK7OHwJDn68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/RaH2h8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/RaH2h8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760390527; x=1791926527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ntnqTOlJedOJehYxMVQ/LA8XCrMmJACkD0OGAldBQE=;
  b=X/RaH2h8lV9MNd3IRg5hD0CFj5EaDijr+JrD6C1QSbYkIz7lJJdV6w3z
   5Ux6k3a2zB5v6oWlMqO0wnor5/Q8Whvm/AYs+kukSYO4E91B8GEMwu3qX
   VfekEBVhwMds0nbyDo8XK5xh1/0U3M1oiLrem2iZDbhikcvwcVguEUO2t
   2qytmbZEX4bfd3mNnjKS/cL33e7q3kIeaTd6NdPoyxgPWn9iYaOma6neB
   MYvkgX4ib8Heq+4UcURXvJAkZR/siFdJd8kDrqpVTC48NpUgMc2tCUJPD
   WnujZEVwcCrP9y6N/IcQZGk7hyCQmvmp6skpn6JpZt5n7VxhnSsxQyqir
   g==;
X-CSE-ConnectionGUID: vCnEO0qnR8uJVUuhjlmdaA==
X-CSE-MsgGUID: QL4mO7otSM+djUNlgd4zOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62581840"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="62581840"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 14:22:04 -0700
X-CSE-ConnectionGUID: YYphuXD0SOStTWE89FxKlA==
X-CSE-MsgGUID: gWKK2VwqTlq10RJ+fdQ5ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="180857835"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Oct 2025 14:22:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8PzT-00025H-1E;
	Mon, 13 Oct 2025 21:21:59 +0000
Date: Tue, 14 Oct 2025 05:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>
Cc: oe-kbuild-all@lists.linux.dev, Vincent Mailhol <mailhol@kernel.org>,
	=?iso-8859-1?Q?St=E9phane?= Grosjean <stephane.grosjean@hms-networks.com>,
	Robert Nawrath <mbro1689@gmail.com>,
	Minh Le <minh.le.aj@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>, linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] can: calc_bittiming: add PWM calculation
Message-ID: <202510140553.qo3f0I9s-lkp@intel.com>
References: <20251013-canxl-netlink-v1-8-f422b7e2729f@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-canxl-netlink-v1-8-f422b7e2729f@kernel.org>

Hi Vincent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb6649f6217c0331b885cf787f1d175963e2a1d2]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol/can-dev-can_dev_dropped_skb-drop-CAN-FD-skbs-if-FD-is-off/20251013-191232
base:   cb6649f6217c0331b885cf787f1d175963e2a1d2
patch link:    https://lore.kernel.org/r/20251013-canxl-netlink-v1-8-f422b7e2729f%40kernel.org
patch subject: [PATCH 8/9] can: calc_bittiming: add PWM calculation
config: riscv-randconfig-001-20251014 (https://download.01.org/0day-ci/archive/20251014/202510140553.qo3f0I9s-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140553.qo3f0I9s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140553.qo3f0I9s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/can/dev.h:18,
                    from net/can/raw.c:53:
   include/linux/can/bittiming.h: In function 'can_calc_pwm':
>> include/linux/can/bittiming.h:204:1: warning: no return statement in function returning non-void [-Wreturn-type]
     204 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=y] && ELF_CORE [=n]
   Selected by [y]:
   - RISCV [=y]


vim +204 include/linux/can/bittiming.h

   200	
   201	static inline int
   202	can_calc_pwm(struct net_device *dev, struct netlink_ext_ack *extack)
   203	{
 > 204	}
   205	#endif /* CONFIG_CAN_CALC_BITTIMING */
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
