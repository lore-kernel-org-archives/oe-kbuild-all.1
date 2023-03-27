Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7883E622
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 03:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679886184; x=1711422184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hZPrhVMdw/0W9GjdD6KrCezj3p1+m7qjbMUTUGRChX4=;
  b=eOasHKoXZZwCUEIepbx4aqIGS+SzADjYh8jQxERquIHODXPbqkBVsSqz
   7VUNLtZmLHLehOp1ON8iAkZRYROydKZcFcCtxFox2QtkMoR/KuYVDmZin
   ALhrH8nQ4uQwaJEvxQeM1Zb4b8WRBP57xjLemzmLmgiEXsK2pXgyxzQl4
   GligG58yVny/fmbRrC8K3AFwRXl728MA80j1mK9mr2lfxmi3r4hwbFgJV
   eF4DRLjpXmlzgG+1q/2/Itfeq52Ssilh82A2ZaMJi6UOX/E9EvhzpGL3X
   +8cwntVY3luy0r4y0uhV6g34oIFg+205LD/aqOHcIIj6pV4P4uVuRyMYd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="341741805"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="341741805"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 20:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="747832213"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="747832213"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Mar 2023 20:03:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgd8P-000HVD-0X;
	Mon, 27 Mar 2023 03:03:01 +0000
Date: Mon, 27 Mar 2023 11:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [linux-next:master 5297/7305]
 drivers/power/supply/generic-adc-battery.c:134:17: error: 'ret' undeclared;
 did you mean 'net'?
Message-ID: <202303271028.9xc7IKeX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   011eb7443621f49ca1e8cdf9c74c215f25019118
commit: 10ec06d3987ba94ee30c7630733b48ca203bbed2 [5297/7305] power: supply: generic-adc-battery: use simple-battery API
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230327/202303271028.9xc7IKeX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=10ec06d3987ba94ee30c7630733b48ca203bbed2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 10ec06d3987ba94ee30c7630733b48ca203bbed2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303271028.9xc7IKeX-lkp@intel.com/

Note: the linux-next/master HEAD 011eb7443621f49ca1e8cdf9c74c215f25019118 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/power/supply/generic-adc-battery.c: In function 'gab_get_property':
>> drivers/power/supply/generic-adc-battery.c:134:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     134 |                 ret = read_channel(adc_bat, psp, &result);
         |                 ^~~
         |                 net
   drivers/power/supply/generic-adc-battery.c:134:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/power/supply/generic-adc-battery.c:134:51: error: 'result' undeclared (first use in this function); did you mean 'mf_result'?
     134 |                 ret = read_channel(adc_bat, psp, &result);
         |                                                   ^~~~~~
         |                                                   mf_result
>> drivers/power/supply/generic-adc-battery.c:136:25: error: label 'err' used but not defined
     136 |                         goto err;
         |                         ^~~~
   drivers/power/supply/generic-adc-battery.c:142:1: error: control reaches end of non-void function [-Werror=return-type]
     142 | }
         | ^
   cc1: some warnings being treated as errors


vim +134 drivers/power/supply/generic-adc-battery.c

e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  121  
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  122  static int gab_get_property(struct power_supply *psy,
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  123  		enum power_supply_property psp, union power_supply_propval *val)
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  124  {
10ec06d3987ba9 drivers/power/supply/generic-adc-battery.c Sebastian Reichel 2023-03-17  125  	struct gab *adc_bat = to_generic_bat(psy);
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  126  
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  127  	switch (psp) {
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  128  	case POWER_SUPPLY_PROP_STATUS:
10ec06d3987ba9 drivers/power/supply/generic-adc-battery.c Sebastian Reichel 2023-03-17  129  		val->intval = adc_bat->status;
10ec06d3987ba9 drivers/power/supply/generic-adc-battery.c Sebastian Reichel 2023-03-17  130  		return 0;
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  131  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  132  	case POWER_SUPPLY_PROP_CURRENT_NOW:
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  133  	case POWER_SUPPLY_PROP_POWER_NOW:
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21 @134  		ret = read_channel(adc_bat, psp, &result);
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  135  		if (ret < 0)
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21 @136  			goto err;
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  137  		val->intval = result;
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  138  		break;
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  139  	default:
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  140  		return -EINVAL;
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  141  	}
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  142  }
e60fea794e6ecb drivers/power/generic-adc-battery.c        anish kumar       2012-09-21  143  

:::::: The code at line 134 was first introduced by commit
:::::: e60fea794e6ecb9ea4df2623c9498412afe31d4d power: battery: Generic battery driver using IIO

:::::: TO: anish kumar <anish198519851985@gmail.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
