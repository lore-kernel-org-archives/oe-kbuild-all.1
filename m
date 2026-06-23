Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BD1C8EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 23:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782257633; cv=none; b=bBTMmVqkFH6OQBf2SgNJ20C2qZAKFCDI+7zpYSwEovZgy2GAt6xPiUrbDteiP6lXTyKQihohThVXEoYBl7EghYzTnQ2N4CPu+6MgauI6LsRJbdy9UiH0pmuCESeGmIqSqAgsiIJizROi9EJpJeC0HcKSY8BbxwTSmyWPTfFfycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782257633; c=relaxed/simple;
	bh=JU0IkF7ehh0u3N6iSHlnu3nSoRY36m7MkhSgyuwoUr8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CL6HiUBg3Y9fiQFYIerAMUCUnhlJMmyM/9RCHW9hN8H4Lm6ugL+JMVr0YXRNtRa07LHQQUbqotYzaVhm0eArmG0hGkvvwJewGX5PMcbx3s4w+GKGYlIqxXMngCQvDUKtbzkpWwgI5qu02t1AZ6hH37CLzOWW12qg3GUsXiWVoKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSF5dCxn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSF5dCxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782257632; x=1813793632;
  h=date:from:to:cc:subject:message-id;
  bh=JU0IkF7ehh0u3N6iSHlnu3nSoRY36m7MkhSgyuwoUr8=;
  b=YSF5dCxnd1c91c06eL7eZUkaaEYYgg9x2Kkt0Tem0p3it61g0zHyVbBl
   8rtOZSvhnHHxCDTPRexm24Uc3pXGjFRDfu2uwDbYgs1IOnY69l2h58g1Q
   q0xipQOF5O/sd7m0oTjdiSyQnUey6kh+4R9Qu6YXOYxMPPHEYCZWYbLZU
   F16u0ygaZZ050V/7IiuVSWcwJeZ7ibVl2avC8yz/80ExJlyRGA1I5wsDr
   qfOxrZgM+fbfZp0u0vIWEi2tPdgD5kT+g8fS6fvstSW8p053IO+WelZHU
   /B1OzM3CrMmUSOApnDZfkPPk3SXXhFzJ6NgsZDusWzRf3wLOlQHLlYiqA
   A==;
X-CSE-ConnectionGUID: rrwzqAHdToSNlebGa1CwMg==
X-CSE-MsgGUID: 24j15aX5RKyLgPg1657M3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93665140"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="93665140"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 16:33:51 -0700
X-CSE-ConnectionGUID: 6XUasZVIR0OC6TmhLAV7gQ==
X-CSE-MsgGUID: yw3Uj6jZR7CFkLrWuG8BNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="273350550"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jun 2026 16:33:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcAcl-000000002xh-36Uo;
	Tue, 23 Jun 2026 23:33:47 +0000
Date: Wed, 24 Jun 2026 07:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 14/36] drivers/ptp/ptp_vmclock.c:78:18:
 error: '__int128' is not supported on this target
Message-ID: <202606240749.dzX3DmsF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   759e4e4e18f43902ea6f66c481a45175490cad0c
commit: de40e94c2ee6a5610211cba9e82eb50db165e6d1 [14/36] ptp: ptp_vmclock: Replace get_cycles() usage
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260624/202606240749.dzX3DmsF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240749.dzX3DmsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240749.dzX3DmsF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c: In function 'mul_u64_u64_shr_add_u64':
>> drivers/ptp/ptp_vmclock.c:78:18: error: '__int128' is not supported on this target
      78 |         unsigned __int128 res = (unsigned __int128)delta * period;
         |                  ^~~~~~~~
   drivers/ptp/ptp_vmclock.c:78:43: error: '__int128' is not supported on this target
      78 |         unsigned __int128 res = (unsigned __int128)delta * period;
         |                                           ^~~~~~~~
   drivers/ptp/ptp_vmclock.c:82:23: warning: right shift count >= width of type [-Wshift-count-overflow]
      82 |         *res_hi = res >> 64;
         |                       ^~


vim +/__int128 +78 drivers/ptp/ptp_vmclock.c

20503272422693d David Woodhouse 2024-10-06  62  
20503272422693d David Woodhouse 2024-10-06  63  #define VMCLOCK_FIELD_PRESENT(_c, _f)			  \
20503272422693d David Woodhouse 2024-10-06  64  	(le32_to_cpu((_c)->size) >= (offsetof(struct vmclock_abi, _f) +	\
20503272422693d David Woodhouse 2024-10-06  65  				     sizeof((_c)->_f)))
20503272422693d David Woodhouse 2024-10-06  66  
20503272422693d David Woodhouse 2024-10-06  67  /*
20503272422693d David Woodhouse 2024-10-06  68   * Multiply a 64-bit count by a 64-bit tick 'period' in units of seconds >> 64
20503272422693d David Woodhouse 2024-10-06  69   * and add the fractional second part of the reference time.
20503272422693d David Woodhouse 2024-10-06  70   *
20503272422693d David Woodhouse 2024-10-06  71   * The result is a 128-bit value, the top 64 bits of which are seconds, and
20503272422693d David Woodhouse 2024-10-06  72   * the low 64 bits are (seconds >> 64).
20503272422693d David Woodhouse 2024-10-06  73   */
20503272422693d David Woodhouse 2024-10-06  74  static uint64_t mul_u64_u64_shr_add_u64(uint64_t *res_hi, uint64_t delta,
20503272422693d David Woodhouse 2024-10-06  75  					uint64_t period, uint8_t shift,
20503272422693d David Woodhouse 2024-10-06  76  					uint64_t frac_sec)
20503272422693d David Woodhouse 2024-10-06  77  {
20503272422693d David Woodhouse 2024-10-06 @78  	unsigned __int128 res = (unsigned __int128)delta * period;
20503272422693d David Woodhouse 2024-10-06  79  
20503272422693d David Woodhouse 2024-10-06  80  	res >>= shift;
20503272422693d David Woodhouse 2024-10-06  81  	res += frac_sec;
20503272422693d David Woodhouse 2024-10-06  82  	*res_hi = res >> 64;
20503272422693d David Woodhouse 2024-10-06  83  	return (uint64_t)res;
20503272422693d David Woodhouse 2024-10-06  84  }
20503272422693d David Woodhouse 2024-10-06  85  

:::::: The code at line 78 was first introduced by commit
:::::: 20503272422693d793b84f88bf23fe4e955d3a33 ptp: Add support for the AMZNC10C 'vmclock' device

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
