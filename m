Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40A7D31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 06:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676528060; x=1708064060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jNEWnXSNCQVo4YEsOwIWMR28b16sYamtZ8k+PJvskmQ=;
  b=dc2dSFuh8deOEFkqM70rUV8JZwlYexdxqlC1wAsmIMnNpUoAPMVi1/SD
   ZeY+xVkwPTUmD63IB9y8TA0/+b5zBSWfVjD2/u3sHsuOXr0OqCtzMMlXW
   QjidX5pZZe6diJgNSV9nW05bYod/UbuspmxAdbuNis493HGgUbrH4RZuz
   xrb+afq0ADyTKM7LzUEnR+MSyxMm4+Nncl4kkTWeMVIS+rMQLZvttA4sf
   D5w3kctqvniD1Oy0nmbhLvpI439f/+7d/juyV2xLqgEm3KkTKGHbnnXo+
   1PdABVr6ElaZtss6F1yjmcC8wsKy12oKEb4SfZlWsYaZLDQkDfbsGXHNd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="333800056"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="333800056"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 22:14:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758805296"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="758805296"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Feb 2023 22:14:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSXX8-000A45-0d;
	Thu, 16 Feb 2023 06:14:18 +0000
Date: Thu, 16 Feb 2023 14:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 2/2] ld: kernel/time/hrtimer.c:531:
 undefined reference to `tick_sched_timer'
Message-ID: <202302161418.ckbQxTzl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/dyn_hrtimer
head:   6c6c32845db34e033bf1818442388e4287074f1e
commit: 6c6c32845db34e033bf1818442388e4287074f1e [2/2] HACK: Only expire tick_sched_timer and run hrtimers via wheel
config: x86_64-randconfig-a013-20230213 (https://download.01.org/0day-ci/archive/20230216/202302161418.ckbQxTzl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=6c6c32845db34e033bf1818442388e4287074f1e
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern timers/dyn_hrtimer
        git checkout 6c6c32845db34e033bf1818442388e4287074f1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161418.ckbQxTzl-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `__hrtimer_next_event_base':
   kernel/time/hrtimer.c:527: undefined reference to `tick_sched_timer'
>> ld: kernel/time/hrtimer.c:531: undefined reference to `tick_sched_timer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
