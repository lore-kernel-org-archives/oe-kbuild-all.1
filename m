Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA0807
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678344320; x=1709880320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jpw7S1l7j5eHE34VJkEqQaNhuY+AjBh+gt740RUeJGc=;
  b=SXwtAO1M5nbp1kByLPqiMhw/T4KEbZnFH1t9e55/RpdjfJUgB9w0O4ff
   hv6B8SGVaeIk65y8k5OKUrKybkmaHGqF9wlAmX5kGPSMsjNUlxfB5iR5t
   CU7NSRDwlg76bU16WTWN1nmCZskDwG69YjjlccNehM67ftswrHHCBJHrj
   Mw2SclUH5WB/C35T0nIRabilPgLS0nfuttgpAdCykXW6siVQ5I8i7wwHZ
   t9qKSiU3Qq5fLUEAUEFFLPGfKLgPE9LKtoSjqXzym7SoAITgMOEFpSklk
   K2LTT2eW7+PZSR2zuAi1mSKaYM7yf6PNd7t+XgQKXka85z/kIFrL633cr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316026721"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316026721"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 22:45:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741433491"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="741433491"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 22:45:13 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paA1Y-0002ir-2L;
	Thu, 09 Mar 2023 06:45:12 +0000
Date: Thu, 9 Mar 2023 14:44:45 +0800
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
 dependencies detected for GPIO_SYSCON when selected by GPIO_SAMA5D2_PIOBU
Message-ID: <202303091430.hbWEMt4b-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_GPIO_SYSCON-CONFIG_GPIO_SAMA5D2_PIOBU-0-0 (https://download.01.org/0day-ci/archive/20230309/202303091430.hbWEMt4b-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7944d3b7fe86067509751473aa917fdfd662d92c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7944d3b7fe86067509751473aa917fdfd662d92c
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_GPIO_SYSCON --selectors CONFIG_GPIO_SAMA5D2_PIOBU -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091430.hbWEMt4b-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_SYSCON when selected by GPIO_SAMA5D2_PIOBU
   .config:5169:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   .config:12935:warning: symbol value 'ONFIG_NR_CPUS_DEFAUL' invalid for NR_CPUS
   
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - GPIO_LOONGSON_64BIT [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (LOONGARCH || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
     Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
     Selected by [y]:
     - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
