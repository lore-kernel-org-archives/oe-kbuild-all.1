Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF314A23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 02:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676082775; x=1707618775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=laIb2lif01Pkd22ZvIqNil28RsXxXAmzcBC4NVe5N9o=;
  b=B/GSaoUV0+m+rn/X3Zev5dha4vRIdK5aXFhXSCx9tREdg/0nkZrpwpd3
   JmNcg+ozpgZ0swwM7VPf5SXxm4RL6b0zTq271f/t+ND7h0ucW8RmaJYqQ
   EJcb+j3pBDGyGkePfRGbzboR24L+mJLK18ycoL79LeKItyJviGLf1HMIF
   JrIwyDRy8I3pTyj9niE6s0IUokIlF+ufZcKV0qaN1owt98Nr77BDeS1Gy
   8wj5I9sG3091fXZZDmhYM6ECl4yykoiZ7R7xhSRpuggJf196QN4mgEjFj
   m/guA9569TEYOHnjrtIKg1Q/bXvVoWZEgPCRoE56oM/Bz6DnXeI0GEBuy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="329205015"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="329205015"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 18:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="731914571"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="731914571"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Feb 2023 18:32:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQfh6-0006BN-2r;
	Sat, 11 Feb 2023 02:32:52 +0000
Date: Sat, 11 Feb 2023 10:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] power: reset: add Odroid Go Ultra poweroff driver
Message-ID: <202302111012.OpGvbab1-lkp@intel.com>
References: <20230126-b4-odroid-go-ultra-poweroff-v3-1-0a7fd3d5c4b3@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126-b4-odroid-go-ultra-poweroff-v3-1-0a7fd3d5c4b3@linaro.org>

Hi Neil,

I love your patch! Yet something to improve:

[auto build test ERROR on 38d2b86a665b5e86371a1a30228bce259aa6c101]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/power-reset-add-Odroid-Go-Ultra-poweroff-driver/20230210-180559
base:   38d2b86a665b5e86371a1a30228bce259aa6c101
patch link:    https://lore.kernel.org/r/20230126-b4-odroid-go-ultra-poweroff-v3-1-0a7fd3d5c4b3%40linaro.org
patch subject: [PATCH v3] power: reset: add Odroid Go Ultra poweroff driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230211/202302111012.OpGvbab1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f7c8ef7b6c2a6c706640a6d1afe097d08f9dac00
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Neil-Armstrong/power-reset-add-Odroid-Go-Ultra-poweroff-driver/20230210-180559
        git checkout f7c8ef7b6c2a6c706640a6d1afe097d08f9dac00
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111012.OpGvbab1-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/power/reset/odroid-go-ultra-poweroff.o: in function `odroid_go_ultra_poweroff_probe':
>> odroid-go-ultra-poweroff.c:(.text.odroid_go_ultra_poweroff_probe+0x78): undefined reference to `i2c_find_device_by_fwnode'
>> powerpc-linux-ld: odroid-go-ultra-poweroff.c:(.text.odroid_go_ultra_poweroff_probe+0xf4): undefined reference to `i2c_find_device_by_fwnode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
