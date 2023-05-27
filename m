Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75AF9E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685193424; x=1716729424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gk2ucz6GPY2m9ljl99HFDRaHzQpvc4QyfM47+RodnJk=;
  b=lX1iYz2dbyjCO4X3IWgO3VeifhhDdcTGFkhTRjAT5RERfZE+P6i/xLBx
   t51pCYM/9X7lPJp/FaIvKS46ycw+t0WNjYzfL3Hjj8N9GjzaFdhDXIcko
   xfCH6WTX1KOWjKAM+cl2K/3hw2zWwGrGXy9/TtiVmJhgCjtv8Q3HJDlOc
   mUKdf4eRAu1d/YCtdNMZUTh/JIsaV7tLisNOl4jknEq5PRGG45ckG9kZU
   PaQkYyX5qEMk1wiAbNjtZgdLGRlZVOw/XNYlythrFT6/+ja0dwdUR3EHo
   To6aEhz6xG7W5VIic8qG88D9VIc+xOufzu3LmhieGa4X8q4Psx6tGhh+v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="354406302"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="354406302"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 06:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="817855064"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="817855064"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 May 2023 06:17:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2tn4-000JyQ-1r;
	Sat, 27 May 2023 13:17:02 +0000
Date: Sat, 27 May 2023 21:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.3/zen-sauce 3/30] drivers/i2c/busses/i2c-nct6775.c:93:27:
 warning: 'nct6775_device_names' defined but not used
Message-ID: <202305272130.saOvw9AG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.3/zen-sauce
head:   c25bf38649c4d20ae29994b1dadd4e87c3e67bf9
commit: 8642f233725f1bce3860806dfcb037ccca89f838 [3/30] ZEN: Add OpenRGB patches
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230527/202305272130.saOvw9AG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/zen-kernel/zen-kernel/commit/8642f233725f1bce3860806dfcb037ccca89f838
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.3/zen-sauce
        git checkout 8642f233725f1bce3860806dfcb037ccca89f838
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305272130.saOvw9AG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-nct6775.c: In function 'nct6775_access':
   drivers/i2c/busses/i2c-nct6775.c:221:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
     221 |                         tmp_data.byte = data->byte;
         |                         ~~~~~~~~~~~~~~^~~~~~~~~~~~
   drivers/i2c/busses/i2c-nct6775.c:222:17: note: here
     222 |                 case I2C_SMBUS_BYTE:
         |                 ^~~~
   At top level:
>> drivers/i2c/busses/i2c-nct6775.c:93:27: warning: 'nct6775_device_names' defined but not used [-Wunused-const-variable=]
      93 | static const char * const nct6775_device_names[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~


vim +/nct6775_device_names +93 drivers/i2c/busses/i2c-nct6775.c

    91	
    92	/* used to set data->name = nct6775_device_names[data->sio_kind] */
  > 93	static const char * const nct6775_device_names[] = {
    94		"nct6106",
    95		"nct6775",
    96		"nct6776",
    97		"nct6779",
    98		"nct6791",
    99		"nct6792",
   100		"nct6793",
   101		"nct6795",
   102		"nct6796",
   103		"nct6798",
   104	};
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
