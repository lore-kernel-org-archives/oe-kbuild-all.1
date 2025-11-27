Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C861AF0BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 21:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764278196; cv=none; b=aZSZ9suSocWRp5kRPKv59AuLUFCMIU1upKOEVqDr/JqPBUi8H79rPMr6KVlYAkz9JxNenzB14h830j/XkwoxoSyLVM1/pYJdG9LEYOBCAVtGzpmPoKRkI6FKdgY1ZEGpvXc03TbjAr8Sv6OWSYwOfHlh+ylsM16gnmvBR5ChkE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764278196; c=relaxed/simple;
	bh=Z8yRS/8uLbrkQovvsyzvIKf9f4VSimhwx3jiuJ2z1DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnIKPhgQg1hzkGSID+a7ktU3Je68oGlH6aC1nkoTW6w9MV3ec+37wdMPGHyRidVTeNy1GoWvz5sr7QxkfdI05J8+Gk7Ybi+TGB31q2XP82EM9GEkLPam6D/Zdsvor6jaaaOn4OP2F10X5FIw2197w2dk0KNWK/FCeV1Ly59KDY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ryjosn+F; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ryjosn+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764278194; x=1795814194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8yRS/8uLbrkQovvsyzvIKf9f4VSimhwx3jiuJ2z1DY=;
  b=Ryjosn+FrpR7S9ZISdq0DA8RRQQzESP/aVO29Zoan2n/Bai8SGLcnG5A
   2F5Hwq5psc5pLABPfgia6btFF0dIqDk8lNf6uK4gwGU/r4zO7ZRsnSMZW
   8krzHYbiT6lZ0Akk74vs8RiyRHC1DrrHyRHu9BwjK+jkvyV0dVjfDoRE+
   wSm9bY0wCg0EJO1fkiYXK0s+Pm2BQjMoEkfHyIujBplhkGkLw10orGNSG
   +2/J7+P79Y9MjqgXid2ISjquxHK1FQAujgFl9jsG6xcatjKuF80wLIcS8
   E/2cjlqW8pJ5MAvX6nRszzrzid8/03unJcS9pOwXEi+X9aOXpeU9oYXnt
   Q==;
X-CSE-ConnectionGUID: BW4P29DkQAW3nW2LbDotpA==
X-CSE-MsgGUID: 1G8mXQK2RpyfS4KSoNxNKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66354075"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66354075"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 13:16:33 -0800
X-CSE-ConnectionGUID: NYCz+KypSvaQO9MKMYljHw==
X-CSE-MsgGUID: afuLrXIwTJySzQEtKJTcsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193110605"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2025 13:16:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOjLq-000000005gv-369a;
	Thu, 27 Nov 2025 21:16:30 +0000
Date: Fri, 28 Nov 2025 05:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH can-next v8 16/17] can: raw: instantly reject unsupported
 CAN frames
Message-ID: <202511280531.YnWW2Rxc-lkp@intel.com>
References: <20251126-canxl-v8-16-e7e3eb74f889@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-canxl-v8-16-e7e3eb74f889@pengutronix.de>

Hi Marc,

kernel test robot noticed the following build errors:

[auto build test ERROR on ab084f0b8d6d2ee4b1c6a28f39a2a7430bdfa7f0]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Kleine-Budde/can-dev-can_get_ctrlmode_str-use-capitalized-ctrlmode-strings/20251126-182121
base:   ab084f0b8d6d2ee4b1c6a28f39a2a7430bdfa7f0
patch link:    https://lore.kernel.org/r/20251126-canxl-v8-16-e7e3eb74f889%40pengutronix.de
patch subject: [PATCH can-next v8 16/17] can: raw: instantly reject unsupported CAN frames
config: arm64-randconfig-004-20251128 (https://download.01.org/0day-ci/archive/20251128/202511280531.YnWW2Rxc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280531.YnWW2Rxc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280531.YnWW2Rxc-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: net/can/raw.o: in function `raw_check_txframe':
>> raw.c:(.text+0x16d4): undefined reference to `safe_candev_priv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
