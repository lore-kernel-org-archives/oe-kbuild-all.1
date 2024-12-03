Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342471547F0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 03:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733197707; cv=none; b=SBcpuGO2pzpNNLVQ51WQD7vAc3G+y0XMGdiSVKKAuEB4IymWaPxs+h9gQkY5ZI+phn2x3G79nWxe3vEl56mG8bh6pjXZd6zYUKMOgrt9EBJOYDWG2bVvr2upobtQlfrshOJrtH+sZvbQXfJ6rg9bbDUgLvDIyvpoDweiBRfUIQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733197707; c=relaxed/simple;
	bh=IYiDkZTRyWFF1uSOcEsvqntwztP6zpi9XN1tI7fWaBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ULwrSbILzKCgsvE8CfvBIH9B799T6JY/1dWduAcgzr8WgjqPcXvggC20Ou5JjgDgoze6imbeN4SvLIafXWhRt4pS9MxZwh4iOh3GIco7YqPFE+saI9f8faJrTrHMabuuuu7jA6q8v8IRfrc9KzoeBJnldwrfNo7vh/FZOhmdzwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOfDcOla; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOfDcOla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733197705; x=1764733705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IYiDkZTRyWFF1uSOcEsvqntwztP6zpi9XN1tI7fWaBI=;
  b=QOfDcOlaCOlcLL4kz5wOVcNR9heTOitxvSrWV4cp4obX7htknKf+36z0
   DjtOC/c8XkYHtyOgIaZ2eB/jEGga7S84Wc+j78ZauDGwXJt0J9gTfFAQS
   NC1vR88PfkQ8ODqYpIs+6kZBy1xdcGBJ5CTZ8lltHWgmn6Ok27P7ZCuPK
   6YrXPO5XAH+RJ5sZDiz2nq/933oPfrSoqcxV3Cvobh9yxGYCz1k9AC1bx
   90DVqptlV7xY0eaTd8j476tSdYAg6hTu2vlZu3C0aYNTr3Iix/gGvTMYD
   /Pc4KHzaOnTGeZ+RVcDJbhsqzzH3ImI93r9sjS8aRp+SRWgM57Wyr/88r
   w==;
X-CSE-ConnectionGUID: SUz7vtxwTKacj+eZByqqpw==
X-CSE-MsgGUID: oRA9yctORj2a2rfbwNKqcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37329901"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="37329901"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 19:48:24 -0800
X-CSE-ConnectionGUID: oZLGLR9XQ6qFrY7DWtNgag==
X-CSE-MsgGUID: x5npJ9cTTriYGSA+7aa0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93391659"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Dec 2024 19:48:23 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIJtd-000035-0Z;
	Tue, 03 Dec 2024 03:48:21 +0000
Date: Tue, 3 Dec 2024 11:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for
 'ubcore_rearm_jfc'
Message-ID: <202412031140.FvR8Uwop-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   020e0507954f21291b7b3a0a280128270a0d8959
commit: ad84f0a92e3fe282d8280d8c45f8d5b8aab1a2b4 [2516/2516] ub: ubcore add event api and add jetty and event api impls to compile
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031140.FvR8Uwop-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031140.FvR8Uwop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031140.FvR8Uwop-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for 'ubcore_rearm_jfc' [-Wmissing-prototypes]
      26 | int ubcore_rearm_jfc(struct ubcore_jfc *jfc, bool solicited_only)
         |     ^~~~~~~~~~~~~~~~


vim +/ubcore_rearm_jfc +26 drivers/ub/urma/ubcore/ubcore_dp.c

    25	
  > 26	int ubcore_rearm_jfc(struct ubcore_jfc *jfc, bool solicited_only)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
