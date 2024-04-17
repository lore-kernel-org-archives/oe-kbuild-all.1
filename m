Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0E139D01
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713349517; cv=none; b=gxD9b8aJnZsvqkhF9fwDAz3xALqFoO+GeFLMQtke2JLzhc/HKET6qDnjvSCCuM005mOidHLYEeuLiGO4wX3cwp+QFLohUXlMvhAyjv/5Kx4k7iQmIkKR0vZlkUmi7cX77U9Ju4JuNtKrsExxbki195eFK7xykJtaSCuArMPy6zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713349517; c=relaxed/simple;
	bh=EOqXtahpbsoryGE0BUSTa5wReMgOaqHEb5j3XJvnewI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g9MqohmHI5GmUaTrfXc7r9u9LPHQrs1C/DoHTjsWIU+IS1LO6me/0IuaG9SO0d+Oik/omUFAYz1YjsetD3SvDkBlv3WRxCKhJJN97HLcgbGsPNMa5ifS/w1AXvkdnIonNp82gerIiCCEe/raEw8ydCnbPyd916wieDwIboTW9H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=capp8SSX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="capp8SSX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713349516; x=1744885516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOqXtahpbsoryGE0BUSTa5wReMgOaqHEb5j3XJvnewI=;
  b=capp8SSX8/mOvNaZqPwCQwoIUoyvmcTk2cxWl94jkLfldwf0ZydCMOFf
   rA+O2sxYVOsRmUgKBZWSgU0chHbi1ZusUDtekqXtTKoVieP5EZ5mllnd/
   uBDa+yc8bVEV7pWhKW05syVDOFl6RoaqlC1w+sqPZsHI0+14RbXko+H3e
   q31mJPusp4UhYrZjqxy0LXMhsPase1PHgDAfAsKgB9h5kKvNDhatvN8LG
   RtYPBwxPOBnynEFOQOb0Vn/3pvfxQZuZ9NvQQCRQuTtHAsNR3Ss1CvJQt
   IXzKz45oJdYNmsjWikzMie7FBpd/hHhCHoOf/YfisWqhBT01O7AxrSH9t
   A==;
X-CSE-ConnectionGUID: 7v8idKutRc+MGRM/4QLFvw==
X-CSE-MsgGUID: r3d43E57SdKatxq5SEiBOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19437320"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="19437320"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 03:25:03 -0700
X-CSE-ConnectionGUID: KGyCi0H1SPe8x9PkIpzSHQ==
X-CSE-MsgGUID: tWEmuXo1TzO3VfiyYXY8bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="53784686"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Apr 2024 03:25:02 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx2TL-0006TY-2e;
	Wed, 17 Apr 2024 10:24:59 +0000
Date: Wed, 17 Apr 2024 18:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 461/472]
 mean_and_variance.c:(.text+0x5a1): dangerous relocation: call8: call target
 out of range
Message-ID: <202404171811.HT80Xokf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   27b0da35e8bf546ce529aca482a974c106d344a0
commit: 6d0d9f2aeeda790e2024d2f47aaa6c3d4b5825ba [461/472] xfs: present wait time statistics
config: xtensa-randconfig-002-20240417 (https://download.01.org/0day-ci/archive/20240417/202404171811.HT80Xokf-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171811.HT80Xokf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171811.HT80Xokf-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: lib/sort.o: in function `eytzinger0_sort_r':
   sort.c:(.text+0x584): multiple definition of `eytzinger0_sort_r'; fs/bcachefs/eytzinger.o:eytzinger.c:(.text+0x244): first defined here
   xtensa-linux-ld: lib/sort.o: in function `eytzinger0_sort':
   sort.c:(.text+0xbb8): multiple definition of `eytzinger0_sort'; fs/bcachefs/eytzinger.o:eytzinger.c:(.text+0x878): first defined here
   xtensa-linux-ld: lib/math/mean_and_variance.o: in function `u128_div':
   mean_and_variance.c:(.text+0x3a4): multiple definition of `u128_div'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x30): first defined here
   xtensa-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_mean':
   mean_and_variance.c:(.text+0x4e4): multiple definition of `mean_and_variance_get_mean'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x170): first defined here
   xtensa-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_variance':
   mean_and_variance.c:(.text+0x5c4): multiple definition of `mean_and_variance_get_variance'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x250): first defined here
   xtensa-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_stddev':
   mean_and_variance.c:(.text+0x700): multiple definition of `mean_and_variance_get_stddev'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x38c): first defined here
   xtensa-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_update':
   mean_and_variance.c:(.text+0x10): multiple definition of `mean_and_variance_weighted_update'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x3c0): first defined here
   xtensa-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_mean':
   mean_and_variance.c:(.text+0x1d4): multiple definition of `mean_and_variance_weighted_get_mean'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x584): first defined here
   xtensa-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_variance':
   mean_and_variance.c:(.text+0x2c4): multiple definition of `mean_and_variance_weighted_get_variance'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x674): first defined here
   xtensa-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_stddev':
   mean_and_variance.c:(.text+0x744): multiple definition of `mean_and_variance_weighted_get_stddev'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x744): first defined here
   lib/sort.o: in function `eytzinger0_sort_r':
   sort.c:(.text+0xb86): dangerous relocation: call8: call target out of range
   lib/math/mean_and_variance.o: in function `mean_and_variance_get_mean':
>> mean_and_variance.c:(.text+0x5a1): dangerous relocation: call8: call target out of range
   lib/math/mean_and_variance.o: in function `mean_and_variance_get_variance':
   mean_and_variance.c:(.text+0x655): dangerous relocation: call8: call target out of range

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
