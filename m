Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8D15A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 02:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677204214; x=1708740214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WdJRb8h9N6CKCKQQOA20NMDqrrMdMGmY21/aZp9GrAs=;
  b=KN7bTK8lrsA93g1Ip34e8wVihEuY8vAqG7Qvwv5I/T0WZGLxeLQoiUr1
   pLOV98Ziet07ck1M0a4Yu1d02F9eSashmHraUpK84GCo8ppLhsXl9LoSs
   sRnwrAK80GEq8dhmoXvV9bJE0re85fxXXIuwEdTkuaiVK4vmWpSl+WXr1
   GJ+5fkb7go1qlFEjM8DiksMAD3Vkp44fg072GldUNZeD53NkNVcsiCdeV
   cIDb1PwMRmq4FsJt36xRFGXO1w4Q8+gyFMGMoQscZHkApUNslBfCcjwm1
   CvhgitjUNq0wYDMkl7yVsS9CvQa4lSTn/RzzPyoWm41flalHigDRCdRI3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="419609473"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="419609473"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 18:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="674757792"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="674757792"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Feb 2023 18:03:32 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVNQp-000229-2t;
	Fri, 24 Feb 2023 02:03:31 +0000
Date: Fri, 24 Feb 2023 10:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.4
 8222/9999] ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains
 a compressed section, but zlib is not available
Message-ID: <202302240918.1k897m3o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lecopzer,

First bad commit (maybe != root cause):

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-5.4
head:   66c3e3ab77a20a24922b9837c635b1164b95aa0f
commit: f4cdc4b7fc591e38fc2b602eb74489d032ec21b6 [8222/9999] FROMLIST: media: Kconfig: Fix DVB_CORE can't be selected as module
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230224/202302240918.1k897m3o-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/f4cdc4b7fc591e38fc2b602eb74489d032ec21b6
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-5.4
        git checkout f4cdc4b7fc591e38fc2b602eb74489d032ec21b6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240918.1k897m3o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smscoreapi.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/sms-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/sms-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/sms-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/sms-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/sms-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/sms-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/sms-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/sms-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/sms-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smsendian.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
--
>> ld.lld: error: drivers/media/common/siano/smsdvb-main.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smsdvb-main.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smsdvb-main.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smsdvb-main.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smsdvb-main.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smsdvb-main.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smsdvb-main.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smsdvb-main.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smsdvb-main.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/common/siano/smsdvb-main.o: contains a compressed section, but zlib is not available
--
>> ld.lld: error: drivers/media/dvb-core/dvbdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dvbdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dvbdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dvbdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dvbdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dvbdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dvbdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dvbdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dvbdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dvbdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dmxdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dmxdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dmxdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dmxdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dmxdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dmxdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dmxdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dmxdev.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-core/dmxdev.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/dvb-core/dvb_demux.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
--
>> ld.lld: error: drivers/media/usb/au0828/au0828-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-i2c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-i2c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-i2c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-i2c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-i2c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-i2c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-i2c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-i2c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-i2c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/au0828/au0828-cards.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
--
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_drv.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_drv.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_drv.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_drv.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_drv.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_drv.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_drv.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_drv.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_drv.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_drv.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_algo.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_algo.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_algo.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_algo.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_algo.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_algo.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_algo.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_algo.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_algo.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stb0899_algo.o: contains a compressed section, but zlib is not available
--
>> ld.lld: error: drivers/media/dvb-frontends/drxd_firm.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_firm.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_firm.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_firm.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_firm.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_firm.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_firm.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxd_hard.o: contains a compressed section, but zlib is not available
--
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_c.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_t.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/cxd2820r_t.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
--
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_sw.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_sw.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_sw.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_sw.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_sw.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_sw.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_sw.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_sw.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_sw.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/stv0900_sw.o: contains a compressed section, but zlib is not available
--
>> ld.lld: error: drivers/media/dvb-frontends/drxk_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxk_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxk_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxk_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxk_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxk_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxk_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxk_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxk_hard.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drxk_hard.o: contains a compressed section, but zlib is not available
--
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-cards.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-core.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/tm6000/tm6000-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
--
>> ld.lld: error: drivers/media/dvb-frontends/drx39xyj/drxj.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drx39xyj/drxj.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drx39xyj/drxj.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drx39xyj/drxj.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drx39xyj/drxj.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drx39xyj/drxj.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drx39xyj/drxj.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drx39xyj/drxj.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drx39xyj/drxj.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/dvb-frontends/drx39xyj/drxj.o: contains a compressed section, but zlib is not available
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
