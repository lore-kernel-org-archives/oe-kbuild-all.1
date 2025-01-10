Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF587214A61
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 19:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736539144; cv=none; b=NZpuckSFdP3Gv/88pk1RO2EWtK1xwVHkno8xiE1RZw98tCL1EsXlKHZl5zWG0ByM6F7kRZX0tJIGQCCy2zeES9vfbJ1O4ZzI9NCmK5fCoWLURxkEUGuxRzc0FL8GI6mViKnqpCwPEKt1au1H3HGdE3Lj6RodtErJHPxn1Qsi1/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736539144; c=relaxed/simple;
	bh=mk15RZNWAF2ECEPWbT+E8DEIfOf83ugHhd6HthDC4Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECYriVhbeP9YfVM1UOAYUYDIffblARP6yi+oJCw8YFyNAgUwrsEAAs091iA4w1iBYGBRdRGTyTolEuRiNkqZdcMXfX8y7GnGTJ9QKOwrSovH/TA3qrighE3FnKS5Y1/DmrUKKTqxao7XDJf3CdXmB4lfaEPh58gzxBisZEvdxs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQy8B2Lr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQy8B2Lr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736539143; x=1768075143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mk15RZNWAF2ECEPWbT+E8DEIfOf83ugHhd6HthDC4Aw=;
  b=LQy8B2Lr9py3aq2HYMu5AZ6zncacElKwO3pF7h0We5DuN2tQ4ov3Z0EO
   /KNfAk+WZGQwqVcvFK3V4EdAskghu4YuBrwt04+Q629SeMpSgmhxf1+ks
   5ciSliS62W/XLES0S6g34c4LKv5a1REAvrMgNxC12oOEFnAIDrPhuQLIU
   PWBVlUZ2S75WljoTaYISAYJmVtLcU4M8X22IYY+la5VvdPLylig4WmNmR
   vXGjm3fJ3f26SwTtoc+t67qgtPYePodIqC5pfTfxCy40MtzAixMFdza5I
   5wRcE5Dp6/sst34ze5WFtWjfvS4xAocmjVYV1o6ST8i+M+KyR39oqSgum
   A==;
X-CSE-ConnectionGUID: 5beI55/mSWinFHynHMEeYg==
X-CSE-MsgGUID: ll0PPNwwTf2tmGAPqzZJXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37006200"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="37006200"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 11:59:03 -0800
X-CSE-ConnectionGUID: +Z8uqQABTBq/wH4kneekfQ==
X-CSE-MsgGUID: eVg+bAurQ9egclFQDZjquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108925131"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2025 11:58:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWL9k-000Jgj-0U;
	Fri, 10 Jan 2025 19:58:56 +0000
Date: Sat, 11 Jan 2025 03:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com, mingo@redhat.com, robh@kernel.org,
	sboyd@kernel.org, ssengar@linux.microsoft.com, tglx@linutronix.de,
	usamaarif642@gmail.com, x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, apais@microsoft.com,
	benhill@microsoft.com, ssengar@microsoft.com,
	sunilmut@microsoft.com, vdso@hexbites.dev
Subject: Re: [PATCH] x86/of: Don't log error on the missing IO-APIC
 unconditionally
Message-ID: <202501110358.e3qQDC6q-lkp@intel.com>
References: <20250109184015.1674388-1-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109184015.1674388-1-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eea6e4b4dfb8859446177c32961c96726d0117be]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/x86-of-Don-t-log-error-on-the-missing-IO-APIC-unconditionally/20250110-024320
base:   eea6e4b4dfb8859446177c32961c96726d0117be
patch link:    https://lore.kernel.org/r/20250109184015.1674388-1-romank%40linux.microsoft.com
patch subject: [PATCH] x86/of: Don't log error on the missing IO-APIC unconditionally
config: i386-randconfig-004-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110358.e3qQDC6q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110358.e3qQDC6q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110358.e3qQDC6q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/devicetree.c:50:13: warning: 'falconfalls_compatible' defined but not used [-Wunused-function]
      50 | static bool falconfalls_compatible(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/falconfalls_compatible +50 arch/x86/kernel/devicetree.c

    49	
  > 50	static bool falconfalls_compatible(void)
    51	{
    52		if (!of_have_populated_dt())
    53			return false;
    54	
    55		return of_flat_dt_is_compatible(
    56				of_get_flat_dt_root(), "intel,falconfalls");
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
