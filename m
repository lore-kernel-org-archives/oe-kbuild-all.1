Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179AF14A91
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690279359; x=1721815359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZ2HNuI9cgHE0ChE7bdJgutkhB7O1yi1yHGSmKUhE64=;
  b=HbWp5ESa0u6SDc61V9dQQgk7QEnfR7C24UMPcTkBEoAjsoP25sr92ZYK
   c0djpT7tc7ZZymmG3aZOPK2Igg70WMOljcl0dxo7cVL0hl64SaZ6A/iRw
   3iuxNwPAf7Jc2F2nLJzePk0NHNCurNqzS4ZG/BSAF1Ajfatf6HlpSz4ui
   rnhwII11x2Rmuj4LcT37ScgXUBKTiIlgQKfMsrr7iu496IREFFTQIM0Gj
   11K0xOCfsjsaedYPkfAVQ9xP+tybC0eaK5SB4+PATTbWXsFcrSdour1wQ
   nZrldQY7fNJLCMkafG4hs9SOYYeYf/aGUP3buxfsZ+qcfBEZMKyrfiMq8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="366558532"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="366558532"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 03:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972607891"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="972607891"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 03:02:30 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOEs9-000AWf-2Q;
	Tue, 25 Jul 2023 10:02:29 +0000
Date: Tue, 25 Jul 2023 18:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: pwm-rz-mtu3.c:undefined reference to `clk_rate_exclusive_put'
Message-ID: <202307251752.vLfmmhYm-lkp@intel.com>
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
commit: 254d3a727421ccc935f085eaa9bae51cb6c9df25 pwm: Add Renesas RZ/G2L MTU3a PWM driver
date:   5 weeks ago
config: m68k-randconfig-r035-20230725 (https://download.01.org/0day-ci/archive/20230725/202307251752.vLfmmhYm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251752.vLfmmhYm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251752.vLfmmhYm-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: section .rodata VMA [00002000,009a764f] overlaps section .text VMA [00000400,012a124f]
   m68k-linux-ld: drivers/pwm/pwm-rz-mtu3.o: in function `rz_mtu3_pwm_pm_disable':
>> pwm-rz-mtu3.c:(.text+0x114): undefined reference to `clk_rate_exclusive_put'
   m68k-linux-ld: drivers/pwm/pwm-rz-mtu3.o: in function `rz_mtu3_pwm_probe':
>> pwm-rz-mtu3.c:(.text+0x32c): undefined reference to `clk_rate_exclusive_get'
>> m68k-linux-ld: pwm-rz-mtu3.c:(.text+0x380): undefined reference to `clk_rate_exclusive_put'
   m68k-linux-ld: pwm-rz-mtu3.c:(.text+0x400): undefined reference to `clk_rate_exclusive_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
