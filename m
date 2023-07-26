Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE487C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 01:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690334961; x=1721870961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rLrwN231gbRNZwlVTiskoIa513bQnsdAEsRYgBtr61k=;
  b=YTVXKmfX2TeaRDyU+EotGSqX7apiuVUChR+CycaxYRI0MqHZ3RG8ZTKR
   WmwXvbFWKdcoZ1osY63L/TtysnZ/E9oxd3rmX/5Cq3/EoNH1hLj5PRjCR
   GGlrll/DAhdR6/jU6jFPuRxBtiDSzfmzGiirr0pgipLxz9nQ+GA2S4Be+
   1bjC6oR/P9XT9srxSmPWEv3OCUKzqStgyi+EPq9DDHJaDbMvbuosG5+Fp
   d1ISKFBRW8y/SSeHWyuZD4WHbosJlfPkt+SvOssHnundYYE9HY0+dyyy0
   y7qw7nlq6qTCvStvVB6pjf3cvUjT3+Js8uoKkGowuVajBbk1UgJW10BpY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352788253"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="352788253"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 18:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="755980612"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="755980612"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Jul 2023 18:29:19 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOTL4-0000WJ-14;
	Wed, 26 Jul 2023 01:29:18 +0000
Date: Wed, 26 Jul 2023 09:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: drivers/pinctrl/qcom/pinctrl-ipq5018.c:244:27: warning: '_groups'
 defined but not used
Message-ID: <202307260914.AMUMoZ8S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18b44bc5a67275641fb26f2c54ba7eef80ac5950
commit: 405ac045ec730d10e5901d653088b9d67bfaaa80 pinctrl: qcom: allow true compile testing
date:   7 weeks ago
config: i386-buildonly-randconfig-r004-20230726 (https://download.01.org/0day-ci/archive/20230726/202307260914.AMUMoZ8S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260914.AMUMoZ8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260914.AMUMoZ8S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/qcom/pinctrl-ipq5018.c:244:27: warning: '_groups' defined but not used [-Wunused-const-variable=]
     244 | static const char * const _groups[] = {
         |                           ^~~~~~~


vim +/_groups +244 drivers/pinctrl/qcom/pinctrl-ipq5018.c

725d1c8916583f Sricharan Ramabadhran 2023-06-08  243  
725d1c8916583f Sricharan Ramabadhran 2023-06-08 @244  static const char * const _groups[] = {
725d1c8916583f Sricharan Ramabadhran 2023-06-08  245  	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
725d1c8916583f Sricharan Ramabadhran 2023-06-08  246  	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
725d1c8916583f Sricharan Ramabadhran 2023-06-08  247  	"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
725d1c8916583f Sricharan Ramabadhran 2023-06-08  248  	"gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", "gpio28",
725d1c8916583f Sricharan Ramabadhran 2023-06-08  249  	"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
725d1c8916583f Sricharan Ramabadhran 2023-06-08  250  	"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio42",
725d1c8916583f Sricharan Ramabadhran 2023-06-08  251  	"gpio43", "gpio44", "gpio45", "gpio46",
725d1c8916583f Sricharan Ramabadhran 2023-06-08  252  };
725d1c8916583f Sricharan Ramabadhran 2023-06-08  253  

:::::: The code at line 244 was first introduced by commit
:::::: 725d1c8916583f9c09e5f05e5a55dd47fdca61c1 pinctrl: qcom: Add IPQ5018 pinctrl driver

:::::: TO: Sricharan Ramabadhran <quic_srichara@quicinc.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
