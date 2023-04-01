Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EA28F64
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 20:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680381700; x=1711917700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9R0KaVGdKQKmMbSC9pmT7EQxV3s6mJlNtyMRuWmlyaw=;
  b=FPY23hklIjlVjHUHHTNGYKIaksKJHup+mPMNnZnMrWERBdb/LEOAP6lK
   8cTtq82NOzt/57HtM6bAFCuuy4lSaD2AGYtCMvIGfg0FTCsHE5C1B5emr
   p97KIsSe6bh+6XVN6JfI+WHdPPUW85Q/cY2fBah1/48sv4OqoQchuiu1k
   sstNwDhQ9Xtb1UGqImfSBJpXJeyNwM70vcK5qaN0RP/xZEEiAegSrYALS
   yxppmkwtSM1cIpHafnOAeJO6zsbmB6EozCtEfl+vqsZrSknFVVqKT3k8L
   VNbhbIedB/pX6u8hQ4phTijp4tt4Rl0mQ7+EJVuEOvqAG77kOlTIErP20
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404431736"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="404431736"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 13:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="685494400"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="685494400"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Apr 2023 13:41:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pii2c-000N1h-1H;
	Sat, 01 Apr 2023 20:41:38 +0000
Date: Sun, 2 Apr 2023 04:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v15 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <202304020410.A86IBNES-lkp@intel.com>
References: <20230330071203.286972-2-conor.dooley@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330071203.286972-2-conor.dooley@microchip.com>

Hi Conor,

I love your patch! Yet something to improve:

[auto build test ERROR on thierry-reding-pwm/for-next]
[also build test ERROR on linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/pwm-add-microchip-soft-ip-corePWM-driver/20230330-151415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git for-next
patch link:    https://lore.kernel.org/r/20230330071203.286972-2-conor.dooley%40microchip.com
patch subject: [PATCH v15 1/2] pwm: add microchip soft ip corePWM driver
config: arm-randconfig-c041-20230402 (https://download.01.org/0day-ci/archive/20230402/202304020410.A86IBNES-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/703dc5c3f6c78464be383c1fa31ecfb3ad683d84
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Conor-Dooley/pwm-add-microchip-soft-ip-corePWM-driver/20230330-151415
        git checkout 703dc5c3f6c78464be383c1fa31ecfb3ad683d84
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020410.A86IBNES-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: arm-linux-gnueabi-ld: DWARF error: could not find abbrev number 57
   drivers/pwm/pwm-microchip-core.o: in function `mchp_core_pwm_apply_locked':
>> pwm-microchip-core.c:(.text+0x20a): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
