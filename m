Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DD11714A1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743658224; cv=none; b=nvZeTFV5mo8VbNELyc8qcQacZdkD4tiKTNLnBLoaKZB5ryvjFkRoeK3eoLkScOSlSrpNkfuAIJ0qOKS6vYnyTPjv8lAVvuW5fYlN9cY1EGgohblfZgw94cOKIH+XGm0NYFE0xKiI5exFqBzbhD7gg89Ehy2Nx5mT6gu9soUO1T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743658224; c=relaxed/simple;
	bh=nUsxrZ18FHsEJHN5O3GCI3AHDJd4iHDBmHxZycHLdPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drxNU+M2wBTutOWUG3daXLtpqYE/bkzg+lApMWXA0M5q1QjxIY8P4R6besmjFVaX3e3X34vHwVHpbUwizNiubewUmWFNBhyWu58LsYG7FmCXE9/R9ZPD+L6EB9PKAi+RWsgqfCTGM57U6/zyPpnBTkuxDt9NONm0cWUH0L1KTiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMH6+SRt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMH6+SRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743658222; x=1775194222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nUsxrZ18FHsEJHN5O3GCI3AHDJd4iHDBmHxZycHLdPo=;
  b=BMH6+SRtAnRiHCWhL1H31WEXdddkew6uSefypDkz+JcJx/9IVUq6qDRj
   y/t1CD4PxDj+q3rnQKRpT+h4eF01j6u3k7chwtfzAcc+DKUcN4vdcEgMu
   Z2FwYXCcnYXbuJAq9iAoOoGYbi8xRd1pftohFQesIYNyiLRpGtpxtL3YI
   SN6gsdLqkGsmrDWjIqWm+eLJWNDkoi+DFbVu6j65QM/PVd6KzU9wDw+T4
   MJCvm46m0sE/nxS6MZZ2EWfuhHb7LcnbHwcTZ84JO9oN2boUtnRdbLoxT
   d19ddHAc+A/kEJplP0rZcABbyyOLwrUPvT14rahf4C7pTz+fEcNXIGB2P
   A==;
X-CSE-ConnectionGUID: q0/xEHMgRvynm0cQh+y0qg==
X-CSE-MsgGUID: pgIl9poYRcWVnK8cHJRXzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62587134"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="62587134"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 22:30:21 -0700
X-CSE-ConnectionGUID: J1Zerh7NTMidUf/XAdKEwQ==
X-CSE-MsgGUID: jaqKheyURqafBpa6rcVGTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126666677"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Apr 2025 22:30:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0D9e-00006J-2K;
	Thu, 03 Apr 2025 05:30:18 +0000
Date: Thu, 3 Apr 2025 13:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:pwm/for-next 17/18] drivers/pwm/pwm-rcar.c:114:19: error:
 implicit declaration of function 'FIELD_MAX'
Message-ID: <202504031354.VJtxScP5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-next
head:   4fe924e43a5aabe586ab696651c483c25a8a3abb
commit: edd549f4956be84ebd6a3900975544adeb0f3b50 [17/18] pwm: rcar: Improve register calculation
config: arc-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031354.VJtxScP5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031354.VJtxScP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031354.VJtxScP5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pwm/pwm-rcar.c: In function 'rcar_pwm_set_counter':
>> drivers/pwm/pwm-rcar.c:114:19: error: implicit declaration of function 'FIELD_MAX' [-Werror=implicit-function-declaration]
     114 |         if (tmp > FIELD_MAX(RCAR_PWMCNT_CYC0_MASK))
         |                   ^~~~~~~~~
>> drivers/pwm/pwm-rcar.c:117:15: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     117 |         cyc = FIELD_PREP(RCAR_PWMCNT_CYC0_MASK, tmp);
         |               ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_MAX +114 drivers/pwm/pwm-rcar.c

   104	
   105	static int rcar_pwm_set_counter(struct rcar_pwm_chip *rp, int div, u64 duty_ns,
   106					u64 period_ns)
   107	{
   108		unsigned long long tmp;
   109		unsigned long clk_rate = clk_get_rate(rp->clk);
   110		u32 cyc, ph;
   111	
   112		/* div <= 24 == RCAR_PWM_MAX_DIVISION, so the shift doesn't overflow. */
   113		tmp = mul_u64_u64_div_u64(period_ns, clk_rate, (u64)NSEC_PER_SEC << div);
 > 114		if (tmp > FIELD_MAX(RCAR_PWMCNT_CYC0_MASK))
   115			tmp = FIELD_MAX(RCAR_PWMCNT_CYC0_MASK);
   116	
 > 117		cyc = FIELD_PREP(RCAR_PWMCNT_CYC0_MASK, tmp);
   118	
   119		tmp = mul_u64_u64_div_u64(duty_ns, clk_rate, (u64)NSEC_PER_SEC << div);
   120		if (tmp > FIELD_MAX(RCAR_PWMCNT_PH0_MASK))
   121			tmp = FIELD_MAX(RCAR_PWMCNT_PH0_MASK);
   122		ph = FIELD_PREP(RCAR_PWMCNT_PH0_MASK, tmp);
   123	
   124		/* Avoid prohibited setting */
   125		if (cyc == 0 || ph == 0)
   126			return -EINVAL;
   127	
   128		rcar_pwm_write(rp, cyc | ph, RCAR_PWMCNT);
   129	
   130		return 0;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
