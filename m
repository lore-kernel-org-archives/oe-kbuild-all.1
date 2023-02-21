Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5F179C1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677002737; x=1708538737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RUQQv3FoR9NEPMj5YLGWzurvwFdvOZ0X93BMIokDjJ8=;
  b=im7cX2BC7CCialD2l71MNy/LMZ8Nuzuk9g7WgRgUzZh4Obvo3hYP0959
   22FKyhp8rMw4jzMzG9AFRxSFklI0d37E8q4DNJ/ZVr7IPC0aKaUiipq+Y
   sntjZyV04/w9k4BZ63RH/fdr6RzlI1yvZoW9u3028v7P/nUE8q9QI/QHm
   qcbFItXy5aWtTSgk4rEvFuttQSu3Qce+Ds1PptpX9ZqPQTMJMrGTZnCqJ
   9WZyQ5lhqfCGY1bvElTGmrm47jkWlhbAcIWjOvanbakvxGS77f2TdjhpU
   z9XCP+pNPgCvg1Q3IbhQF8YjYtgyV8NsftZABBJFP4alWq5FytJQ6hTL+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="316433316"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="316433316"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 10:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="781093698"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="781093698"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2023 10:03:32 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUWzD-00006t-2H;
	Tue, 21 Feb 2023 18:03:31 +0000
Date: Wed, 22 Feb 2023 02:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 86/92] drivers/hwmon/smpro-hwmon.c:378:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202302220154.EYch2RS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.1
head:   cac6306557586ba4479dab12c3e5efcb67e63388
commit: 046bbab2a36514056930c00f765e3f1719b5102a [86/92] hwmon: Add Ampere's Altra smpro-hwmon driver
config: i386-randconfig-a015-20230220 (https://download.01.org/0day-ci/archive/20230222/202302220154.EYch2RS3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/shenki/linux/commit/046bbab2a36514056930c00f765e3f1719b5102a
        git remote add shenki https://github.com/shenki/linux
        git fetch --no-tags shenki dev-6.1
        git checkout 046bbab2a36514056930c00f765e3f1719b5102a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220154.EYch2RS3-lkp@intel.com/

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
