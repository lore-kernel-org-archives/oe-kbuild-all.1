Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC932F7F1C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 20:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786826247; cv=none; b=krD3ujbamCzowRtWn/ghH5NVtjcC9NE7yGBIVbqvu42/skeZAFsnovSpe/QWB6y8MEODs3L+hcZfpfaZkNO601IrE4euvmFIgyJ0Hvb+YSWDJ30ZBTKGINJE3gfFROF3M+kd8JLKBzOHhKMGkqrhnBCWif19RlL7ShYAvPYzlEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786826247; c=relaxed/simple;
	bh=lvEX6cmW2sjPnyQlWMggkiYzdPGWBJi3WK5bJal/dp8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K9jKqBOIRoS89UhbEI0RPg9Ps+FjFGJ9EHQ/ItO5cqiiBHJq1ECXbrBneBiBzqe+/BPbTe+daXpJS6UZi3j//4D0DhNik56+W/XDfYCRFp544u5zP0N/LbLPBfS+4QYAjONbUAMO8KZnIkbJjAvkxcFyYKKodnKxIo7vwrhXYMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzA6kL9o; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzA6kL9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786826244; x=1818362244;
  h=date:from:to:cc:subject:message-id;
  bh=lvEX6cmW2sjPnyQlWMggkiYzdPGWBJi3WK5bJal/dp8=;
  b=YzA6kL9oDdyAVoOqsbX85GLynupvmZgbzZ+X0G/ucaXKxTNQY3cPuvHd
   A7yklQdw+ZhC3n5yzEqTQNWDpCFJTKwd57wb6MZzgiXif9c3UFQB7G/Pj
   wk6VnrRyxsEfZuoGIILQunyRnGMyz8MbKsHo8lz+tV2yOIbDRun2y6mQb
   zFcS+qLkZPNm3ms2gxhAd0siqb+aWAv53bPFilB2mBWAaoZ3c/WohgL4B
   7CU2/GaqTZL3DQ5gpx5MKAwRQV0PmSgOCd3GqQlROG+S67e+ki68O9m/7
   t5COJibldCXvhkoSnytAdrq0AAT+v21dv9SW+PHAjSym3GmrLyQixxeAn
   Q==;
X-CSE-ConnectionGUID: K0l4iqVTS8yHD6e6u3Gd3A==
X-CSE-MsgGUID: jVEkWeSNQCmyVTbQ97IRRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="97953251"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="97953251"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 13:37:23 -0700
X-CSE-ConnectionGUID: wnHcRPanRViC51UgYNq+aA==
X-CSE-MsgGUID: 5b9HqwtKSBSr6iGwHjOzZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="266529288"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Aug 2026 13:37:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvL83-00000000cTC-44P6;
	Sat, 15 Aug 2026 20:37:19 +0000
Date: Sun, 16 Aug 2026 04:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 0/1]
 fs/f2fs/segment.c:30:26: sparse: sparse: symbol 'android_sec_entries' was not
 declared. Should it be static?
Message-ID: <202608160442.qfOFD7wh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   50220a73d59e604d08d071d9b7aa0d93d24c5f4b
commit: 4ea0204a025e9f56b124429ffcc9fc8ee19c834c [0/1] Revert "ANDROID: Avoid ABI Breakage"
config: i386-randconfig-061 (https://download.01.org/0day-ci/archive/20260816/202608160442.qfOFD7wh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160442.qfOFD7wh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160442.qfOFD7wh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/segment.c:30:26: sparse: sparse: symbol 'android_sec_entries' was not declared. Should it be static?

vim +/android_sec_entries +30 fs/f2fs/segment.c

9a7f143ab52935 Changman Lee 2013-11-15  29  
5332b127bbfa4d Daeho Jeong  2026-04-07 @30  struct android_sec_entry *android_sec_entries;
5332b127bbfa4d Daeho Jeong  2026-04-07  31  

:::::: The code at line 30 was first introduced by commit
:::::: 5332b127bbfa4d100eb1782e11cedfe8592d3535 ANDROID: f2fs: fix android_sec_entries duplication in header

:::::: TO: Daeho Jeong <daehojeong@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
