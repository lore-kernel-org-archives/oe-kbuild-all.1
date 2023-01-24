Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B400A10F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 10:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674557692; x=1706093692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qi+7SW7aoFGfuHzY4VIkPIPzjEn5SEGmt2fD1eqhmhY=;
  b=ZgvcWQV5rAWGPp5hKg2OHV8YbYeCWoIgrFWx5pRy/XYwX7c9lP9MJsUo
   nLiHJ2weytVinpEVOHA6XVs36hyhxGEvOEC0MSMbWMnxy/kw9yhkN7nzV
   AJ4vRp0EWOnT81NwGdGmqigt1ZB1NaBMdrxa2+YOILeIj/IOd1x6aauNc
   k+e4AtkONmmSW2Tyv/eAxzJmIg7IdSHQ3zOqMSBj3hCOo++04zdAvAo1Y
   nL9aVLOpXfkgYXUsM1tu55r0b/B21Ic72lhI3XQxIhls0KN1KF/WkB7hl
   gl2uEw0EaiSdTiCjc/wjbD3T1gNUVDRhVvX9IKWGmg/3jGCt13YuSE5IJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327527135"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="327527135"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907442406"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="907442406"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2023 02:54:51 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKGx0-0006M0-09;
	Tue, 24 Jan 2023 10:54:50 +0000
Date: Tue, 24 Jan 2023 18:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 91/98] drivers/hwmon/smpro-hwmon.c:378:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202301241811.lybp73Qv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.1
head:   184ecb900ee970854da962d29016b9f7c73f84aa
commit: 01304d618e60d1fed3a5ab7d724d3069a1c1e9b9 [91/98] hwmon: Add Ampere's Altra smpro-hwmon driver
config: riscv-randconfig-r042-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241811.lybp73Qv-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/shenki/linux/commit/01304d618e60d1fed3a5ab7d724d3069a1c1e9b9
        git remote add shenki https://github.com/shenki/linux
        git fetch --no-tags shenki dev-6.1
        git checkout 01304d618e60d1fed3a5ab7d724d3069a1c1e9b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/smpro-hwmon.c:378:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/hwmon/smpro-hwmon.c:378:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +378 drivers/hwmon/smpro-hwmon.c

   359	
   360	static umode_t smpro_is_visible(const void *data, enum hwmon_sensor_types type,
   361					u32 attr, int channel)
   362	{
   363		const struct smpro_hwmon *hwmon = data;
   364		unsigned int value;
   365		int ret;
   366	
   367		switch (type) {
   368		case hwmon_temp:
   369			switch (attr) {
   370			case hwmon_temp_input:
   371			case hwmon_temp_label:
   372			case hwmon_temp_crit:
   373				ret = regmap_read(hwmon->regmap, temperature[channel].reg, &value);
   374				if (ret || value == 0xFFFF)
   375					return 0;
   376			break;
   377			}
 > 378		default:
   379			break;
   380		}
   381	
   382		return 0444;
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
