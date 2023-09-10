Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E10A49
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 20:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694379325; x=1725915325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VTlQ7Avn/wsMkcwD2OrnENNJ1DrZLgE2BLeybRCP/rw=;
  b=b8pB2AEBf+PL99fPKhnQAgeIN2gSuNgUKPpcuXI66wlLM6C224+lmKAw
   9Y8FW5uoSJndS65rdgvAjyZOe6sdn2rdO5hSIVK4KddD2j1JqunENU7dZ
   gjUxbpmggNhZP0tUOku+2CCtC8Sxgkmr9Qj0n6L9bKovH/GEpLX5MjiIU
   NDFSgwBcAj/27OohiWgeNe+jh7q2n3aY+cvTa+v9WFdSXvZf265YATHe2
   8pMyabjdcIsiS5y9r0kqf4+CwjcY7cdjrHPCOfRtVS/ACKApXSfuLZxb6
   qsu0dX/h1tGkOGnjbe+1atPVgn85C23NgWDJ6QMKEnCwRMOWbzBAoLht+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="381744823"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="381744823"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 13:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="989847922"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="989847922"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Sep 2023 13:55:22 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfRSi-0005Od-1L;
	Sun, 10 Sep 2023 20:55:20 +0000
Date: Mon, 11 Sep 2023 04:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: drivers/net/dsa/sja1105/sja1105.o: warning: objtool:
 sja1105_fast_age() falls through to next function sja1105_setup.cold()
Message-ID: <202309110440.cYGeoXqE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1548b060d6f32a00a2f7e2c11328205fb66fc4fa
commit: c27cd083cfb9d392f304657ed00fcde1136704e7 Compiler attributes: GCC cold function alignment workarounds
date:   8 months ago
config: x86_64-buildonly-randconfig-003-20230911 (https://download.01.org/0day-ci/archive/20230911/202309110440.cYGeoXqE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110440.cYGeoXqE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110440.cYGeoXqE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/sja1105/sja1105.o: warning: objtool: sja1105_fast_age() falls through to next function sja1105_setup.cold()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
