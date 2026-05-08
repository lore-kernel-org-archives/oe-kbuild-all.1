Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A5371868
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240889; cv=none; b=iEg1OvwgToi3DZoQvhSalqWNbZhRe++30wzDxvGXq8Sc5f7qRllAiRmEO528oFwh3dN3xeC5ja2RHEqDpuhoNI0xzpWyMBLYKcnZL9CxJD/53KLNReJ5dT+U+6/GE3qNU8Kd3n8Wf5pIUbHR29zLr5GGi1eYzTZpokFWUjmyZwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240889; c=relaxed/simple;
	bh=bb/RTYkAHlbsOYkePn1imxOZ2MZsBvX83vBgpIWeF0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bBpmlGVJF3KNiCF4P7o/JfR4ctSGGfXq0r/qXaw6vPbkr1Gz5ueH5UTLHGSYBFVE8MHBXuDKqkmJk8of7GTMoKBcG43uQiyd/fYKP7bHift7Q4SS/P5wXNlWSdph3g5u0K837T09MxuhC/Z07dCG9ukXs6J+M4ki6nA2WTgs8HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LguCPeBu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LguCPeBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778240887; x=1809776887;
  h=date:from:to:cc:subject:message-id;
  bh=bb/RTYkAHlbsOYkePn1imxOZ2MZsBvX83vBgpIWeF0g=;
  b=LguCPeBufmMPDSInUWDikpEluRYmLTibDT4Pc0NO6fmBngUucqUjCCPQ
   cu71tIC+eG20ikiQHMeKbwADyu/nhkASy7tWABrdWEayiomzGNvWFeX3e
   D5+94V+AAbeDoPpAVcIWQ3a98g0/iZlt0r+E1sSyhwbfteAxPZDMldABH
   0FlplQcB4sec++cTOuR8P5uMaqsHQDa26UMpcK6qUrXCoLgVvcMDwvIR7
   b8jhfSIMsg2PN38ZikHrWR/fQwDNmmh4EapFuf8rmcyIgUcewWb/HY5er
   UcI2KSliUBwpHR+T7TwFPWyIQxwhwehxCBkdek4alRI/Z/Fj0T5Ld00aA
   g==;
X-CSE-ConnectionGUID: LTt0QHmIQ+Ca+ph32lAjdg==
X-CSE-MsgGUID: sP8CHLpvQAqK6mS6jMjblg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78929951"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="78929951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 04:48:06 -0700
X-CSE-ConnectionGUID: OB3tmai0SVK+wPgptFjKDg==
X-CSE-MsgGUID: dk4aVn/PQdyY9ewNtk9wcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="260477103"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 May 2026 04:48:03 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLJgW-00000000081-3Wzq;
	Fri, 08 May 2026 11:48:00 +0000
Date: Fri, 08 May 2026 19:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Henriques <luis@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Miklos Szeredi <mszeredi@redhat.com>
Subject: fs/fuse/dir.c:38:21: sparse: sparse: symbol
 'dentry_tree_work' was not declared. Should it be static?
Message-ID: <202605081928.WWMrMNOu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   917719c412c48687d4a176965d1fa35320ec457c
commit: ab84ad5973869a660ca3ad0c54a2b84d975d47c4 fuse: new work queue to periodically invalidate expired dentries
date:   6 months ago
config: powerpc-randconfig-r122-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081928.WWMrMNOu-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081928.WWMrMNOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate expired dentries")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081928.WWMrMNOu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/dir.c:38:21: sparse: sparse: symbol 'dentry_tree_work' was not declared. Should it be static?

vim +/dentry_tree_work +38 fs/fuse/dir.c

    34	
    35	#define HASH_BITS	5
    36	#define HASH_SIZE	(1 << HASH_BITS)
    37	static struct dentry_bucket dentry_hash[HASH_SIZE];
  > 38	struct delayed_work dentry_tree_work;
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
