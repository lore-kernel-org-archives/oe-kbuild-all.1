Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38FB301480
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765443044; cv=none; b=AZZdliBWuCP0dXToKeTAx/tVNOB7wRqssvUDjQPRVGcUO/mFjSKH3KsfhEJxHRC8yiZS7FoXALd6ZDV5HieTFe0KUaoXLP56WZo2I+6hQqcu1m0eSJEdZHrWlxwPJGcNXmGnRUSGFCbfuWXy7ISIk155ZYX/qnrO9yRUQInS5LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765443044; c=relaxed/simple;
	bh=mzlcwFp41SbtXSOygy32mek4BYaHPXAZhTCg8EcteMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bz+FBUyDJccOQSeS2F1aA73cEUGwuJpMKf40r7ZGiU6i+q6fa0vkbi0jQIW3nlQ4/e6CnjmfZqFt+UL2H+b4ury++WoGTFp+LjFaPCfvKwmoFQMQds/m8+qhN/HhtwfpRALDZ07ziJLOMCsn5mXmCdHAUgUsY/Ca3yQxK5ApG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V51cXMI5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V51cXMI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765443043; x=1796979043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mzlcwFp41SbtXSOygy32mek4BYaHPXAZhTCg8EcteMQ=;
  b=V51cXMI5K3db/VpmReqBom0iarp7VHeWjJlDJ47m8isl01to4QCoT4pw
   PU2fCCy8NWEuT/CEyVElNXXBJpzoh2cy2vqhIF0yuhtwa9NugeAt3L61n
   aQeZPCHvTMwRebcTCKr2QYn+9lV8VlIqYw+83S2HXcWh/XWR6rQn0NAEh
   7uFRoR9tuJaD4gehXGptYwcZqpy6glmNNfEHz5reJWHxtpCWThY/FJo5S
   T8s4Vdjw+zXFd4Bjq+BEi8fUtMgJAhBqoflRGxhLUpMRpME9tNWYGA3EA
   A3ozjBES3lfTT1PWntlr+ZzANP6z6mM3ObhPMFAq9vMOsF7ECo4myHAgO
   Q==;
X-CSE-ConnectionGUID: FujijsaHRwC0A1Fmlv0OJw==
X-CSE-MsgGUID: TP21jWnDQ/i2nA1jgoQ7rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92900907"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="92900907"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 00:50:42 -0800
X-CSE-ConnectionGUID: Oc6pqtuOSNqd67tc0mWOTA==
X-CSE-MsgGUID: VdU2CQikSr6m3GKImfaB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201169657"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2025 00:50:41 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTcNj-000000000yS-2MDW;
	Thu, 11 Dec 2025 08:50:39 +0000
Date: Thu, 11 Dec 2025 09:49:43 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] htmldocs:
 Documentation/networking/ip-sysctl.rst:3211: WARNING: Title underline too
 short.
Message-ID: <202512110915.0lehN8tT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 6263012c995d0e8dbc33b8e4d8929550ba237b23 [3534/3534] anolis: bond: broadcast ARP or ND messages to all slaves
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110915.0lehN8tT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110915.0lehN8tT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_pause_stats ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_fec_stats ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_mm_state ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_mm_stats ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_mm_cfg ./include/linux/ethtool.h' failed with return code 1
>> Documentation/networking/ip-sysctl.rst:3211: WARNING: Title underline too short.
--
   ``/proc/sys/net/bonding/*``
   ======================== [docutils]
>> Documentation/networking/ip-sysctl.rst:3211: WARNING: Title underline too short.


vim +3211 Documentation/networking/ip-sysctl.rst

  3203	
  3204	max_dgram_qlen - INTEGER
  3205		The maximum length of dgram socket receive queue
  3206	
  3207		Default: 10
  3208	
  3209	
  3210	``/proc/sys/net/bonding/*``
> 3211	========================
  3212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
