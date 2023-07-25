Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B07619F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690275650; x=1721811650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tnxCFCV/aLbDw+NKc00oca3RQMIZA9zkZYTEMGwv4TU=;
  b=UAYddRgbENj/EwqxGizPj/4iSE28A4olw60tVnHmoejMY5fHRd3YCjiO
   1ZYTlY+obKhJKMTgTriKZBPeMhUhHI6kQIN9qDck/JbSgq0kBmx2fOJsg
   Z1aU4LJ6aiHTEVhRYOLkVjsXJigVcvKJHLGLGaGqN7oWD5bxXuM0s0JIg
   FF6EpGxEo8VuX/0alCAj2MgZvrjjW29OEkmu4nEdkEs0cBMQLH6AYAPnK
   HaOxkG+1/g3K0T4pHQU/obGuneQ9YUDyKmlnj0WYST5R82d8I/sB4blfa
   SHndf+4oCyHIZFIEBA2ZD71vgEXOqbzjEOvPIqlasWPBYZdPzURCVi1zu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="365121846"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="365121846"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 02:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="676158587"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="676158587"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Jul 2023 02:00:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qODuR-000ATc-1Y;
	Tue, 25 Jul 2023 09:00:47 +0000
Date: Tue, 25 Jul 2023 17:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: drivers/clocksource/timer-loongson1-pwm.c:31:1: sparse: sparse:
 symbol 'ls1x_timer_lock' was not declared. Should it be static?
Message-ID: <202307251657.9eVSnR8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0b5547c51827e053cc754db47d3ec3e6c2c451d2
commit: e738521a11f13e40af89f66527e59306c4169782 clocksource/drivers/loongson1: Move PWM timer to clocksource framework
date:   5 weeks ago
config: nios2-randconfig-r093-20230723 (https://download.01.org/0day-ci/archive/20230725/202307251657.9eVSnR8x-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251657.9eVSnR8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251657.9eVSnR8x-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/timer-loongson1-pwm.c:31:1: sparse: sparse: symbol 'ls1x_timer_lock' was not declared. Should it be static?

vim +/ls1x_timer_lock +31 drivers/clocksource/timer-loongson1-pwm.c

    30	
  > 31	DEFINE_RAW_SPINLOCK(ls1x_timer_lock);
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
