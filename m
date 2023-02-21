Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E2F6FC4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 17:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677000767; x=1708536767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KT0zxTbezNSI+G49OmS5y5rJgZPrYij0DuCB5HTgsGA=;
  b=FIGXRGDJyzzijBeOEXE0tjH4+PMErqiEnkBPvOOxJV2qf79TWNCVTPx8
   l9f+8UiBDSD6bnL3vz3EV9SfRdYEUK2gHHZXtDxvrLguTCNl08E22RH4I
   GqknTPeCKPOJD7S9Q/+uuKRKcs2o4U8UGWHDEncM21+AwiM1z9vroJ4O+
   Bn35QT8qbw8p1+uCW9lm/hNgUa+w0WSh4/Bu4i8LIHC4W7+UVpXD93Bmg
   Xfdd3+0OcsqE/Ug3IR2D+uVg08B0/PXjjAUaAY95I+q0dxdHm5hLdK1D0
   SNjNOppBDoXNuqo9ALA2A4CkGJlGz7QxJ1oGplGtCsoh8+X5Q8qRom7DQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="360176744"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="360176744"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 09:31:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814594425"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="814594425"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 09:31:30 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUWUE-000051-0O;
	Tue, 21 Feb 2023 17:31:30 +0000
Date: Wed, 22 Feb 2023 01:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 58/91] aspeed-sbc.c:undefined reference to
 `arch_debugfs_dir'
Message-ID: <202302220100.RYWXwv0D-lkp@intel.com>
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
commit: 41fc60d981ec602b7330c941e426e94298b98f2c [58/91] ARM: soc: aspeed: Add secure boot controller support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230222/202302220100.RYWXwv0D-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/shenki/linux/commit/41fc60d981ec602b7330c941e426e94298b98f2c
        git remote add shenki https://github.com/shenki/linux
        git fetch --no-tags shenki dev-6.1
        git checkout 41fc60d981ec602b7330c941e426e94298b98f2c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220100.RYWXwv0D-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/soc/aspeed/aspeed-sbc.o: in function `.L3':
>> aspeed-sbc.c:(.init.text+0xdc): undefined reference to `arch_debugfs_dir'
>> loongarch64-linux-ld: aspeed-sbc.c:(.init.text+0xe0): undefined reference to `arch_debugfs_dir'
>> loongarch64-linux-ld: aspeed-sbc.c:(.init.text+0xe0): undefined reference to `arch_debugfs_dir'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
