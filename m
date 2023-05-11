Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C319629
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683817989; x=1715353989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CYwS1hnPPScTC4ISocu0mf0oiKVbuKqK3QeNg9kxNU4=;
  b=djNj+L2S1dYQO2ynWn0uE2mRj1RJn4yjpOelo1Ly95ngIV2se/vUkUVK
   aZNRA5sUvkdR2frbqXdSNgg0cxw7Zy4OMlShM3yYMeSaz0xkHDFJkTFdc
   mliaD0zI8/OCbKkB0W1Z4lloAtWktTLYmSJHMiQ95d0AUJR2+VaUEGmZP
   orvce06dsX5HY9ZOOpo4HzWGQqVi7bKGu6rY5p0P8ZrW5OdFeP1LuZOA6
   +TZaPy5+Y8hL53Zq763jY7LtL2HN5k3rXQG/oDecHLu9DhVWW3ND23Rah
   9mXxulcPQRXBLVyYYXIN15Am1oRR6lbyxbGgWjgWYSTM3qXoHBOvo9P2h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="349366438"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="349366438"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 08:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="844002103"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="844002103"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 May 2023 08:11:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px7x3-00044W-0c;
	Thu, 11 May 2023 15:11:29 +0000
Date: Thu, 11 May 2023 23:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 09/13] arm64: dts: qcom: pm8150b: Add a TCPM
 description
Message-ID: <202305112258.jLqdf6I2-lkp@intel.com>
References: <20230508142308.1656410-10-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508142308.1656410-10-bryan.odonoghue@linaro.org>

Hi Bryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on usb/usb-testing usb/usb-next usb/usb-linus broonie-regulator/for-next linus/master v6.4-rc1 next-20230511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230508-222502
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230508142308.1656410-10-bryan.odonoghue%40linaro.org
patch subject: [PATCH v7 09/13] arm64: dts: qcom: pm8150b: Add a TCPM description
config: arm-randconfig-c034-20230509 (https://download.01.org/0day-ci/archive/20230511/202305112258.jLqdf6I2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3001cd2abadfdfa2c45eadab319af28ee64bb70f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230508-222502
        git checkout 3001cd2abadfdfa2c45eadab319af28ee64bb70f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305112258.jLqdf6I2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
