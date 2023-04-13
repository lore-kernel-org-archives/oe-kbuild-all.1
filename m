Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213086AB4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 14:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681394835; x=1712930835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ez3KbXHwJ9un/JM6BUnwLbVu0WyVe1ItBGMJ5hOu+nw=;
  b=OriKGfM7HehrhdFI/rNVEcwmqJb8wG10NA3vTMRqDW85wo+uUO6ESA+w
   N3RCcqh9pW+U0uVqoyTCsmYjSFGvvOzx1NR1U9AZb3+A005sa1AUNp7fH
   0qzUdePjTsERocAMoIdklWF5s0H4DrT8Gob+ajokxbmTx0FeZ24UXN39M
   u9d4rKH8zwyWoAsSGOUUfeFggnB2h92zK6sH0vFotMM3Bc6Q7VkMOgxMR
   HuvTW7JkO3mbs2M/ipVPZyxfuVVQTg7SxYErb7LGrJRm0ndMavOJAcef7
   yQDkRbXATSp7hjZRciB2rECf9lwbeJ4/DYwzGokRoEWXTwdBTa1xAx2IA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="409359207"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="409359207"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 06:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="833154338"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="833154338"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2023 06:34:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmx69-000YiF-2q;
	Thu, 13 Apr 2023 13:34:49 +0000
Date: Thu, 13 Apr 2023 21:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 14/14] phy: qcom-qmp: Register as a typec switch for
 orientation detection
Message-ID: <202304132100.DVPOVbGn-lkp@intel.com>
References: <20230413113438.1577658-15-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413113438.1577658-15-bryan.odonoghue@linaro.org>

Hi Bryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus robh/for-next broonie-regulator/for-next linus/master v6.3-rc6 next-20230412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230413-193753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230413113438.1577658-15-bryan.odonoghue%40linaro.org
patch subject: [PATCH v5 14/14] phy: qcom-qmp: Register as a typec switch for orientation detection
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304132100.DVPOVbGn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9ce533fddd1468cd6acf3abeae8c01d6d8a02d57
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230413-193753
        git checkout 9ce533fddd1468cd6acf3abeae8c01d6d8a02d57
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304132100.DVPOVbGn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-qmp-combo.c: In function 'qmp_combo_typec_switch_set':
>> drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3383:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    3383 |         int ret = 0;
         |             ^~~


vim +/ret +3383 drivers/phy/qualcomm/phy-qcom-qmp-combo.c

  3376	
  3377	#if IS_ENABLED(CONFIG_PHY_QCOM_QMP_TYPEC)
  3378	static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
  3379					      enum typec_orientation orientation)
  3380	{
  3381		struct qmp_combo *qmp = typec_switch_get_drvdata(sw);
  3382		struct phy *dp_phy = qmp->dp_phy;
> 3383		int ret = 0;
  3384	
  3385		dev_dbg(qmp->dev, "Toggling orientation current %d requested %d\n",
  3386			qmp->orientation, orientation);
  3387	
  3388		qmp->orientation = orientation;
  3389	
  3390		if (orientation == TYPEC_ORIENTATION_NONE) {
  3391			if (qmp->init_count)
  3392				ret = qmp_combo_dp_power_off(dp_phy);
  3393		} else {
  3394			if (!qmp->init_count)
  3395				ret = qmp_combo_dp_power_on(dp_phy);
  3396		}
  3397	
  3398		return 0;
  3399	}
  3400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
