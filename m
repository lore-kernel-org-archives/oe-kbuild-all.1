Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E420F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 05:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690435911; x=1721971911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B06TGvic068lI0UKfn+8PZIUKsXVaPYV0/YFhorV38o=;
  b=PAXYUF0JQQ9gvk7ri3JIaaRLy81RM+2zH99fHiCu3UFgdnJTYPtoC7KJ
   YDHGmJnBoL+fE7BsbUvePkZed1yTFvVwGUbWmogwQ8KfaibT04ZLFJv0S
   vsgHiKXEHOxwkfsdTDFNdy9/WpCXEmaRthe7anJxbVuHbawpVbi0X/RmT
   5VwNMX9XGouf9fcr98BwAD9OMtNd2t5ShD0WBs4FDpllD7hTZ5iIO0URQ
   goSz9WwWPT8wtZqtgQJk/4fotSyqS+PYMRgebBLTJR4KDggrVYUHvJRQv
   ejE1hmAMOM1kLvwkmpLfQf4cKDmzzgq4l1sgdLGGGKxHctMfCIccErQ9Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="454577884"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="454577884"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726810948"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="726810948"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 22:31:49 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOtaE-0001yF-2j;
	Thu, 27 Jul 2023 05:31:14 +0000
Date: Thu, 27 Jul 2023 13:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 1/2] drivers/watchdog/stm32_iwdg.c:216:34:
 warning: 'stm32_iwdg_of_match' defined but not used
Message-ID: <202307271330.LwupRBXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   683789ff1e1c0a9373ca20daed4bbc700eccc22e
commit: 11b42f6418bd440f99d1816557a31cc529645b6a [1/2] watchdog: Enable more drivers for COMPILE_TEST
config: i386-buildonly-randconfig-r005-20230726 (https://download.01.org/0day-ci/archive/20230727/202307271330.LwupRBXB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271330.LwupRBXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271330.LwupRBXB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/stm32_iwdg.c:216:34: warning: 'stm32_iwdg_of_match' defined but not used [-Wunused-const-variable=]
     216 | static const struct of_device_id stm32_iwdg_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +/stm32_iwdg_of_match +216 drivers/watchdog/stm32_iwdg.c

4332d113c66a6e Yannick Fertre 2017-04-06  215  
c2cf466cca87e2 Ludovic Barre  2018-06-25 @216  static const struct of_device_id stm32_iwdg_of_match[] = {
e9974166a53acc Ludovic Barre  2019-05-03  217  	{ .compatible = "st,stm32-iwdg", .data = &stm32_iwdg_data },
e9974166a53acc Ludovic Barre  2019-05-03  218  	{ .compatible = "st,stm32mp1-iwdg", .data = &stm32mp1_iwdg_data },
c2cf466cca87e2 Ludovic Barre  2018-06-25  219  	{ /* end node */ }
c2cf466cca87e2 Ludovic Barre  2018-06-25  220  };
c2cf466cca87e2 Ludovic Barre  2018-06-25  221  MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
c2cf466cca87e2 Ludovic Barre  2018-06-25  222  

:::::: The code at line 216 was first introduced by commit
:::::: c2cf466cca87e2072bd6616f751f4c385c2ab71e watchdog: stm32: add pclk feature for stm32mp1

:::::: TO: Ludovic Barre <ludovic.barre@st.com>
:::::: CC: Wim Van Sebroeck <wim@linux-watchdog.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
