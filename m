Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE7133CD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682172229; x=1713708229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ot3RQKlomQt+r4F3drYuypFQOpxIZEMuEhIL13MTO9M=;
  b=iI9dG0q/8aKec5/Ti3DkiBex9GYYSH/t6ntTFPhIPZ/rYeYMz7/YOZ9J
   6UUVThpe5a8OFRYbFUcoL0GDk5CgUZoXBuJ1fN6gwIIMWBKzNGD8F6vEB
   uEl0avtkL2hd+WQUjtul0C+HtTq8VudlIiHeyrMPRXBO9pdakYnDGCtPO
   JcFOUHlEOf4NHXbWRElEKHhSmXf9IHSb8Kl3S4SGJo9buG9JyUpP2onYR
   HV3MoFpp8jG26H7JnK2ruNY3kUfuGhW7PtJxDEKYMa0f/OdpXlcFDMeF8
   Z24JfuZu+xLoc7uTBCPWYmC6zevLzd4TCfJu02aN9i0MUE/PPvrHduEdJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="346178112"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="346178112"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 07:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="804044519"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="804044519"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2023 07:03:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqDq4-000hKM-34;
	Sat, 22 Apr 2023 14:03:44 +0000
Date: Sat, 22 Apr 2023 22:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Sagar Dharia <sdharia@codeaurora.org>,
	Girish Mahadevan <girishm@codeaurora.org>,
	Douglas Anderson <dianders@chromium.org>,
	Evan Green <evgreen@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14 6579/9354]
 drivers/i2c/busses/i2c-qcom-geni.c:153:9: sparse: sparse: cast removes
 address space '<asn:2>' of expression
Message-ID: <202304222232.97xm7b8H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: 0f34acf24e539173f42bfc60c8d072876f6dea60 [6579/9354] FROMLIST: i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller
config: m68k-randconfig-s051-20230416 (https://download.01.org/0day-ci/archive/20230422/202304222232.97xm7b8H-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/0f34acf24e539173f42bfc60c8d072876f6dea60
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14
        git checkout 0f34acf24e539173f42bfc60c8d072876f6dea60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/i2c/busses/ sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222232.97xm7b8H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-qcom-geni.c:153:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:156:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:161:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:166:21: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:167:22: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:168:22: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:169:24: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:170:19: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:174:25: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:175:25: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:177:25: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:178:25: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:213:18: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:214:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:215:20: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:216:20: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:217:15: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:240:25: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:259:31: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:280:25: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:283:33: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:291:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:295:25: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:298:25: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:326:23: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:338:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:341:23: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:353:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:356:23: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:373:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:409:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c:423:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/i2c/busses/i2c-qcom-geni.c: note: in included file:
   include/linux/qcom-geni-se.h:328:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/linux/qcom-geni-se.h:270:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/linux/qcom-geni-se.h:270:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/linux/qcom-geni-se.h:251:15: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/linux/qcom-geni-se.h:357:15: sparse: sparse: cast removes address space '<asn:2>' of expression

vim +153 drivers/i2c/busses/i2c-qcom-geni.c

   147	
   148	static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
   149	{
   150		const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
   151		u32 val;
   152	
 > 153		writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
   154	
   155		val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
   156		writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
   157	
   158		val = itr->t_high_cnt << HIGH_COUNTER_SHFT;
   159		val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
   160		val |= itr->t_cycle_cnt;
   161		writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
