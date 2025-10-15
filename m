Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D8325486
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552632; cv=none; b=tUdPpbkhoTw47wh+FKC5pTfbQWFwDc6/kZE8sz4gGTiywClykSjLn3NlM4JuKGmBJ3Bk+qPXEShqkLYxbWkuITQ2aCCrbDDKitIG3GinzSGq4oBxp54ftXUL8pBDH6RgijlcllVu3eKrY3vvKjiYJu6U/CZuuO1Eop6+FggS5co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552632; c=relaxed/simple;
	bh=E3d1DBqC/oIEfIYOaGywi2U5DX5WXJXxiNkjW8A8ILY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7tvV2mWLNLKXkH0KWG+U2W8OmCw6MxFj6VD1X4HYTPgSwdbSqvxIvUZdglidR5Rir0EdO59Di2vC7ILIPWc1s9aFDVgrv7pwgw8lGCsVl5/eHouQiRfSKMhUJkV9WoZqcA49GPWPCDI1M9C9LRt3qoo6LwryrP8l3EpGT2/6NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPEYCIj0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPEYCIj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760552631; x=1792088631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E3d1DBqC/oIEfIYOaGywi2U5DX5WXJXxiNkjW8A8ILY=;
  b=ZPEYCIj0HEvn0TFBYV0e/3O6Mil5IMS1aQuyMF/NnGixsQ5lN/w/7fn9
   kcNhTAWFZldvTvGw86sw8NoghTXcY0jwI8q/N19TIGy5DtBkwDO2jPNmp
   z1jxjA3iUrIDUXMezaG9Y0NWKG4GssDiamgB41wklGOfGw8I48rh27S5+
   /8xVzGkg2gyMH2h6nHUq49Jo+eTZ6chziPQegeDf0/0KEVOqGefye5492
   b1rgE/cf550+YYJxyLiLGxJoOEYRvG6OaKMNuoSkG0S1Ud6dDo5iU7gV+
   798TUwGf4SNasFHp1f3RDaQ8C95sbc5KzirUPlLrajhMYCBQaUq2Y82mH
   Q==;
X-CSE-ConnectionGUID: RaM9cXlQSCmXvVxfGckANg==
X-CSE-MsgGUID: ds7pINglThuXrMeHnJ6roQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85355504"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="85355504"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 11:23:50 -0700
X-CSE-ConnectionGUID: US63NYpIQeydNTcjAk/tbw==
X-CSE-MsgGUID: dZvfnEG1RS+qzsF/70vCxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="219395798"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2025 11:23:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v96A6-000471-13;
	Wed, 15 Oct 2025 18:23:46 +0000
Date: Thu, 16 Oct 2025 02:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/midr-cleanup 8/9]
 drivers/char/hw_random/cavium-rng-vf.c:41:54: error: 'MIDR_THUNDERX_83XX'
 undeclared
Message-ID: <202510160222.oBv5HILT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/midr-cleanup
head:   f2e8e371703f9c36884aff77c5ab53806d02f44f
commit: 672f85a0895129c591e4ccf1d1ee35f12dc2d6a7 [8/9] WIP: arm64: cputype: Delete unused MIDR definitions
config: arm64-randconfig-002-20251015 (https://download.01.org/0day-ci/archive/20251016/202510160222.oBv5HILT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160222.oBv5HILT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160222.oBv5HILT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/hw_random/cavium-rng-vf.c: In function 'is_octeontx':
>> drivers/char/hw_random/cavium-rng-vf.c:41:54: error: 'MIDR_THUNDERX_83XX' undeclared (first use in this function)
      41 |         if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
         |                                                      ^~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cavium-rng-vf.c:41:54: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/char/hw_random/cavium-rng-vf.c:44:54: error: 'MIDR_THUNDERX_81XX' undeclared (first use in this function)
      44 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
         |                                                      ^~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/cavium-rng-vf.c:47:54: error: 'MIDR_THUNDERX' undeclared (first use in this function)
      47 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
         |                                                      ^~~~~~~~~~~~~


vim +/MIDR_THUNDERX_83XX +41 drivers/char/hw_random/cavium-rng-vf.c

cc2f1908c6b8f6 Omer Khaliq   2016-08-23  38  
680efb33546be8 Sunil Goutham 2021-10-29  39  static inline bool is_octeontx(struct pci_dev *pdev)
680efb33546be8 Sunil Goutham 2021-10-29  40  {
680efb33546be8 Sunil Goutham 2021-10-29 @41  	if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
680efb33546be8 Sunil Goutham 2021-10-29  42  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  43  				    MIDR_CPU_VAR_REV(3, 0)) ||
680efb33546be8 Sunil Goutham 2021-10-29 @44  	    midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
680efb33546be8 Sunil Goutham 2021-10-29  45  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  46  				    MIDR_CPU_VAR_REV(3, 0)) ||
680efb33546be8 Sunil Goutham 2021-10-29 @47  	    midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
680efb33546be8 Sunil Goutham 2021-10-29  48  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  49  				    MIDR_CPU_VAR_REV(3, 0)))
680efb33546be8 Sunil Goutham 2021-10-29  50  		return true;
680efb33546be8 Sunil Goutham 2021-10-29  51  
680efb33546be8 Sunil Goutham 2021-10-29  52  	return false;
680efb33546be8 Sunil Goutham 2021-10-29  53  }
680efb33546be8 Sunil Goutham 2021-10-29  54  

:::::: The code at line 41 was first introduced by commit
:::::: 680efb33546be8960ccbb2f4e0e43034d9c93b30 hwrng: cavium - Check health status while reading random data

:::::: TO: Sunil Goutham <sgoutham@marvell.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
