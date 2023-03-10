Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5832F49
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 11:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678446919; x=1709982919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HuenYvK1oTqAt2IQvUgRSYn1H95EixqifwINchc7Xz8=;
  b=TYmodF3QzDGy6IhPQJcX2j3bh3aUBYsTKpa8czTb0d2xBfoPLbRcrFo9
   //VkIk5VR6N2Hlsck82yJ4kyIxGmUHZuObr49fBr0Kh+jE24PjtgX36Aq
   7WulvlCv1WC5Ist53IUPBW2f5YpAvRYKmXMQRCyus4ODwN69QlIfqqqoT
   zpq+7lcgRNEc+Yos1xzF7SgCEio73ZQ6GP81vgwd2CEIN1vgO3fBgSIIY
   ANvR6Gf4E5JZiHArpgBPOXOim4355oHnQQ3zSXm+1gxRC93jcCkQReiCw
   3e11WckX8eFdECocVB4lzzFU2LyMXPTEUnAkEcFakSWdEmfE9SkcH+f+l
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="335402028"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="335402028"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 03:15:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677776009"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="677776009"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Mar 2023 03:15:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paaiQ-0003mt-35;
	Fri, 10 Mar 2023 11:15:14 +0000
Date: Fri, 10 Mar 2023 19:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>,
	Juxin Gao <gaojuxin@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 981/2655]
 drivers/gpio/gpio-loongson-64bit.c:225:3-8: No need to set .owner here. The
 core will do it.
Message-ID: <202303101928.ZsKHeQTK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   24469a0e5052ba01a35a15f104717a82b7a4798b
commit: 7944d3b7fe86067509751473aa917fdfd662d92c [981/2655] gpio: loongson: add gpio driver support
config: loongarch-randconfig-c024-20230308 (https://download.01.org/0day-ci/archive/20230310/202303101928.ZsKHeQTK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101928.ZsKHeQTK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-loongson-64bit.c:225:3-8: No need to set .owner here. The core will do it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
