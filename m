Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B0663A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678354883; x=1709890883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jwRLJbfRGYwNNXhfJdqYn+S+a1Hf2BS6gfpA6vrPyR4=;
  b=c9Gjv4gmZvEviC0CTFhlCckqkfUxrMWcWqXrGFskJmqXxS99aX6lwkRw
   GdeYqaHPbseLNBNZE2jrT70csr5NP1S+INcYF42KMxg3OdeWVs96FPVH1
   ayb3px/Ck4ZGMcmCkjiDj2/mkHDKaJ85G16Ngunm30Dq18GFlEtV5pbtU
   gf7nchv5pSYfT3iy0T52jwGrPxxjRnYZdeG47SUD+/+8R+7JLzO9PD9H0
   mQM8vHRoCpkbhuqB29dD+fRzo5jc1A28SZQf6N3C62SLmmNI7sRU18V77
   QNOvS+e43iezm4KhUGgeQk0nl4xiA9JerNKBY6MGmC2eosV5CghR/bIYn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="422673521"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="422673521"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 01:41:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="923165578"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="923165578"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Mar 2023 01:41:20 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paClz-0002r3-1Y;
	Thu, 09 Mar 2023 09:41:19 +0000
Date: Thu, 9 Mar 2023 17:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>,
	Juxin Gao <gaojuxin@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 995/2428] kismet: WARNING: unmet direct
 dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
Message-ID: <202303091728.UUe6LWye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2c6433e9294b6d0f4d8f08c3c70a3eac434d3ec8
commit: 7944d3b7fe86067509751473aa917fdfd662d92c [995/2428] gpio: loongson: add gpio driver support
config: x86_64-kismet-CONFIG_MFD_STMFX-CONFIG_PINCTRL_STMFX-0-0 (https://download.01.org/0day-ci/archive/20230309/202303091728.UUe6LWye-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7944d3b7fe86067509751473aa917fdfd662d92c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7944d3b7fe86067509751473aa917fdfd662d92c
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_MFD_STMFX --selectors CONFIG_PINCTRL_STMFX -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091728.UUe6LWye-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
   .config:4930:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - GPIO_LOONGSON_64BIT [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (LOONGARCH || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for MFD_STMFX
     Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]
   
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
     Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
     Selected by [y]:
     - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
