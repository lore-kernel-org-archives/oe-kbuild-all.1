Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95A9325495
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777621116; cv=none; b=tJTcG77r3y03YsqqXaSH+7kDgPkdE2lV90ZvhREc9ASCoUFjkjxleGftDx6zUaS0OqE7JaKc1lBQYiUM+PGoj9yi9oBHe5u3oHM+xv+Dbbc4PEGAoZ03c1e7So95bscpO1s7kDysySqLP46rWKFxtwMTPMkLm2leclJgpPDdfhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777621116; c=relaxed/simple;
	bh=YnuS3CmK5mP4sbZ4JQgfQGdReE+oBJzc7XotgYrnfSw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sNlAr/M9wneMK9+qiJEO/kWM6xS5dVwaQyvw5RYyQM9XtLrSz4oa52qpP0+Taof6EkveE4xy55z5qM/p/O5ZhlXA+8R4TLJPHJ+qGlhPE8mmoT083EdFfhXUdcQshpe4LVA1Yeiq40KNHPWK+HLht1ogu16wjoBPRhTi/VOexdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8ocipVM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8ocipVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777621116; x=1809157116;
  h=date:from:to:cc:subject:message-id;
  bh=YnuS3CmK5mP4sbZ4JQgfQGdReE+oBJzc7XotgYrnfSw=;
  b=X8ocipVM0zbI5kE5BnSGwnJxEWCyKHga4rTLdpfoBY1VHucQ7YPdxSUh
   bdLLt09x70IaHssN8l2K7GSitcn6ugHUtyIcM1+49KlT2KmXV3p0tylRV
   s3FW4u6x0mdkPbpMzoFLHFEHen5GRGNNIcGEWYmQRtlVMR3Z6BhFN11O6
   U7e7q4jqbIKu6RLO/ECGW4mMEJpmNBUT8tGbZjhtju+gzGbmRCguSAEhA
   NngJtq3GSGQpblU9vSZpbUlsDjSkwDGVOunXKVPRtiH2pGYisDmY0NuFx
   FfF1RjTzMxEP7MvfNNU1zXwgWoPIH/35jjX5BxDY+tfK/dtQU+6+EYCCg
   A==;
X-CSE-ConnectionGUID: TD1ClbYjTMqi5g+tnQyr2Q==
X-CSE-MsgGUID: 1CeclIl2QZyF9MKWypxUEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78480247"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="78480247"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 00:38:36 -0700
X-CSE-ConnectionGUID: DP4b35xASO+qM4fraHVQeg==
X-CSE-MsgGUID: aQfw/blsR1Ghqx3eI2fZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="265180907"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 May 2026 00:38:33 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIiSF-000000000Jj-1O57;
	Fri, 01 May 2026 07:38:31 +0000
Date: Fri, 01 May 2026 15:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v7.0.0-net-next-driver-removal-v1 13/18]
 scripts/Makefile.clean:12: drivers/net/ethernet/fujitsu/Makefile: No such
 file or directory
Message-ID: <202605011510.tz5UuHNI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://github.com/lunn/linux.git v7.0.0-net-next-driver-removal-v1
head:   75e17109856eb8e407a19759d3ad750fe3854b63
commit: 9b67496f74c3d885af0541d8c378fd73f8ca2f5d [13/18] drivers: net: fujitsu: fmvj18x: Remove this driver
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260501/202605011510.tz5UuHNI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011510.tz5UuHNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011510.tz5UuHNI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:12: drivers/net/ethernet/fujitsu/Makefile: No such file or directory
>> make[7]: *** No rule to make target 'drivers/net/ethernet/fujitsu/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'drivers/net/ethernet/fujitsu/Makefile'.
   make[6]: *** [scripts/Makefile.clean:61: drivers/net/ethernet/fujitsu] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [scripts/Makefile.clean:61: drivers/net/ethernet] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [scripts/Makefile.clean:61: drivers/net] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [scripts/Makefile.clean:61: drivers] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [Makefile:2144: _clean_.] Error 2
   make[2]: Target 'distclean' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.


vim +12 scripts/Makefile.clean

^1da177e4c3f41 Linus Torvalds  2005-04-16   7  
4f1933620f5714 Paul Smith      2006-03-05   8  PHONY := __clean
^1da177e4c3f41 Linus Torvalds  2005-04-16   9  __clean:
^1da177e4c3f41 Linus Torvalds  2005-04-16  10  
3204a7fb98a3bc Masahiro Yamada 2021-02-28  11  include $(srctree)/scripts/Kbuild.include
a2430b25c31840 Masahiro Yamada 2022-11-19 @12  include $(kbuild-file)
^1da177e4c3f41 Linus Torvalds  2005-04-16  13  

:::::: The code at line 12 was first introduced by commit
:::::: a2430b25c31840a6dcbf95c65415d5fee2984dbc kbuild: add kbuild-file macro

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
