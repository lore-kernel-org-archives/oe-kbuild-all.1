Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC10F443C25
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309970; cv=none; b=gSHdDGr+mTvM4AH7EAKSQX4MeRUaJuW63kmkQcEuzDrrl+7z/xE4iFZPkKrGcbWaMXTbJ3qzZKcYjRtMUZ3kjoGFLZqbeDSPG4iX5n6fveeKmKoDQwYjv0C2ofSL3PDzxcSZalxnAh35H6+ddlm3dYA6A+xh/HMIN4uslK6aSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309970; c=relaxed/simple;
	bh=sVr/eYBdgW99KQUs4KkLbuQsi9wLgKXZtC584qSPwjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fja0zVi7yPd+zGcgGLm1AHvfrvSGV07FiP/fqbhC7tsjWFRxTAWsWSz4uVojneTXlFM/7x4JgUSVliKYXLnJkUalRhMhSR8q3wdHe/3G5HD+4uekSoEjTM+Lf+KpmOyJMGLBPVilYFztsclsVCFDr4EMvccXYlf+0jiPPJqcqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xl25GG9t; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xl25GG9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309969; x=1823845969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVr/eYBdgW99KQUs4KkLbuQsi9wLgKXZtC584qSPwjE=;
  b=Xl25GG9t9PwvqDgrgUGaF2/If9WnWbw5UrFpNlP8I5GvQvdD/4MhyfnC
   DBlzKVWrdww964+SbWEURtm8yD7i7cL+5zD8F6/IOZfFoY/t7+kQEERo4
   9ErDWI8J+tpmu0QavFBbUHX9cReG+wxVPIIsVfk7zauiSI7kGq1jOvldi
   MV94L9gqSP1J8Dxa9E8r0Dr0D+VHaVG/DG0n0r1cenHQ5CX3aRhi5j8bI
   6y3fSLjCmw9dqdDFqemd2V3de0elY+b+9HwtejXYCesgbySC7Ymvxl6tr
   MkbXJQ7ctSbQP7vPoFSABHhBmv3kjnldZlnIGURyOzkDNQATw8FI+E96T
   w==;
X-CSE-ConnectionGUID: bmgAqsRtQNiiMlWqOeljkw==
X-CSE-MsgGUID: 5V4rjk32R4aG2yVntGSDtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916700"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916700"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:40 -0700
X-CSE-ConnectionGUID: cMz99gBfSM+xDrHMIoeN0A==
X-CSE-MsgGUID: PL9F2tqNRtSSXaENmidEYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340815"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xc-0s3O;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:49:12 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 17/42] ERROR:
 modpost: kernel/time/time_tests.ko: symbol '__mulsi3' undefined!
Message-ID: <202610171933.J4bFOfL8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   05acd46dd396d3295e8549703282d6738a792eb0
commit: ad328e6174b70b26aacfdb1fd6d784b7ba54502f [17/42] timekeeping: Add a test for auxiliary to monotonic clock conversions
config: nios2-randconfig-2001-20261017 (https://download.01.org/0day-ci/archive/20261017/202610171933.J4bFOfL8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171933.J4bFOfL8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171933.J4bFOfL8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: kernel/locking/test-ww_mutex.ko: symbol '__mulsi3' undefined!
ERROR: modpost: kernel/rcu/rcutorture.ko: symbol '__mulsi3' undefined!
ERROR: modpost: kernel/rcu/rcuscale.ko: symbol '__mulsi3' undefined!
ERROR: modpost: kernel/rcu/refscale.ko: symbol '__mulsi3' undefined!
ERROR: modpost: kernel/time/test_udelay.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: kernel/time/time_tests.ko: symbol '__mulsi3' undefined!
ERROR: modpost: kernel/resource_kunit.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/ext4/ext4-test.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/nls/nls_euc-jp.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/fuse/virtiofs.ko: symbol '__mulsi3' undefined!
WARNING: modpost: suppressed 1063 unresolved symbol warnings because there were too many)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
