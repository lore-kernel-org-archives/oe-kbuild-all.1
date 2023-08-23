Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275AFC152
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692800134; x=1724336134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JnCZjLK+rj3cz9wTMkJV2VLhxW8FumQh+AlMNzRTk6k=;
  b=gIjRbGPkP7HpwsDkVAnIz30B0l/+DCbdDKEqS/X1DdF+bap5eFmIt91d
   t+E6nxnMxRuRdJZRe974KO8FvuqZiNE1KU0proS63bs0aSt/nOk0ZJ2SE
   ju8NZhQdDrsCeYyBktaUrafGKPexH7iXp+u24yKURlfV+3lkiFm27+6yS
   mEUk5dexxyFV9aFHTJEqWnEEFfVuYRKnj9hNM5IZhFn8UTVbezAolEOuS
   2N23s2SQViovrPHS7lNoNQDmCcGb3uypMK/kYW1CvjTaUjB0+Zf7tSrth
   GJft5QWssFOSvKATfWi3m6tBweSw2MhEdOGpbOX9mdD61Wk6mm24c5n2C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374144774"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="374144774"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 07:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="771740332"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="771740332"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Aug 2023 07:15:30 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYodu-0001Ga-0U;
	Wed, 23 Aug 2023 14:15:30 +0000
Date: Wed, 23 Aug 2023 22:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: Stanley Chang <stanley_chang@realtek.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Stanley Chang <stanley_chang@realtek.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] extcon: add Realtek DHC RTD SoC Type-C driver
Message-ID: <202308232214.4VvP0avv-lkp@intel.com>
References: <20230822102846.4683-1-stanley_chang@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822102846.4683-1-stanley_chang@realtek.com>

Hi Stanley,

kernel test robot noticed the following build errors:

[auto build test ERROR on chanwoo-extcon/extcon-next]
[also build test ERROR on linus/master v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanley-Chang/dt-bindings-extcon-Add-Realtek-DHC-RTD-SoC-Type-C/20230822-183332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-next
patch link:    https://lore.kernel.org/r/20230822102846.4683-1-stanley_chang%40realtek.com
patch subject: [PATCH v1 1/2] extcon: add Realtek DHC RTD SoC Type-C driver
config: loongarch-randconfig-r053-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232214.4VvP0avv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232214.4VvP0avv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232214.4VvP0avv-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/extcon/extcon-rtk-type-c.o: in function `.L394':
>> extcon-rtk-type-c.c:(.text+0x2a18): undefined reference to `usb_debug_root'
>> loongarch64-linux-ld: extcon-rtk-type-c.c:(.text+0x2a1c): undefined reference to `usb_debug_root'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
