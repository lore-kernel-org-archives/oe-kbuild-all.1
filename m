Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55D51C07
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 02:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685585271; x=1717121271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/RPT7WVgLy9wbZbhUMHSbAsiMonHbJ1SUGk+ha68Is=;
  b=UCYPsYKSZ8TqwJlu4ZJ6QMGxVGEYzjTekNJL5geSL9pRfOdxXYiIPUaf
   vGPHGUqi3tukEe0pB72Mus2wmn+e1RrQhiEFdy6PUrxUvRCbmR/b23ye6
   jLvhKkpG8DtJ2R4IZcGRxHXryBS3PYKE7iP5MJxdQKa3HeRxtUPbu8IVG
   ni/4VZg05F/r48ZOFno2miKAYdA+NkxgZOZOEIoFS1ay8CqMoF5QPaAlY
   +GQQuj/HWwpThhgG1cbZQJ6gW3LZNO9SSqeqykLNteNuMUnDSnpp7/PWC
   5Y9LvvkmwGbH+Q02gq5d0XQz9kakbroG3ivjoyfbZ8Rf/M/Qal6Jt5jyB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="357822556"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="357822556"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 19:07:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="736889284"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="736889284"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 May 2023 19:07:49 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4XjA-0001mJ-16;
	Thu, 01 Jun 2023 02:07:48 +0000
Date: Thu, 1 Jun 2023 10:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning:
 '__value' is used uninitialized
Message-ID: <202306011000.ZhaGBCqy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   8509e7bb5765732d005befcd277ade73a5df3760
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230601/202306011000.ZhaGBCqy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 3b23f836c2ec0541aea62823eeed7f2bbe88dc43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/platform/img/vxe-vxd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011000.ZhaGBCqy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_int.h:24,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:41:
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:34:
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h: In function 'vxd_set_reconpictcmds':
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:70:9: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      70 |         REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, type); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:559:9: note: in expansion of macro 'REGIO_WRITE_FIELD_LITE'
     559 |         REGIO_WRITE_FIELD_LITE(pict_cmds[VDECFW_CMD_CODED_PICTURE],
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:70:9: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      70 |         REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, type); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:563:9: note: in expansion of macro 'REGIO_WRITE_FIELD_LITE'
     563 |         REGIO_WRITE_FIELD_LITE(pict_cmds[VDECFW_CMD_CODED_PICTURE],
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:607:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     607 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_OPERATING_MODE],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:613:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     613 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_OPERATING_MODE],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:769:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     769 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:773:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     773 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h: In function 'vxd_set_altpictcmds':
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:864:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     864 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:869:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     869 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h: In function 'vxd_getscalercmds':
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:925:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     925 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:931:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     931 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1014:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1014 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_OUTPUT_SIZE],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1019:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1019 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_OUTPUT_SIZE],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1025:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1025 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_HORIZONTAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1029:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1029 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_HORIZONTAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1034:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1034 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_HORIZONTAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1038:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1038 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_HORIZONTAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1044:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1044 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_VERTICAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1048:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1048 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_VERTICAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1053:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1053 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_VERTICAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1057:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1057 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_VERTICAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~


vim +/__value +42 drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h

841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  18  
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  19  #define IMG_ASSERT(expected) \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  20  	((void)((expected) || \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  21  	       (pr_err("Assertion failed: %s, file %s, line %d\n", \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  22  			   #expected, __FILE__, __LINE__), dump_stack(), 0)))
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  23  
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  24  /* This macro is used to extract a field from a register. */
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  25  #define REGIO_READ_FIELD(regval, group, reg, field)     \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  26  	(((regval) & group ## _ ## reg ## _ ## field ## _MASK) >> \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  27  	 group ## _ ## reg ## _ ## field ## _SHIFT)
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  28  
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  29  #if (defined WIN32 || defined __linux__) && !defined NO_REGIO_CHECK_FIELD_VALUE
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  30  /*
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  31   * Only provide register field range checking for Windows and
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  32   * Linux builds
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  33   * Simple range check that ensures that if bits outside the valid field
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  34   * range are set, that the provided value is at least consistent with a
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  35   * negative value (i.e.: all top bits are set to 1).
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  36   * Cannot perform more comprehensive testing without knowing
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  37   * whether field
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  38   * should be interpreted as signed or unsigned.
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  39   */
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  40  #define REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, value, type) \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  41  	{ \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25 @42  		type __value = value; \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  43  		unsigned int temp = (unsigned int)(__value); \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  44  		if (temp > group ## _ ## reg ## _ ## field ## _LSBMASK) { \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  45  			IMG_ASSERT((((unsigned int)__value) & \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  46  			(unsigned int)~(group ## _ ## reg ## _ ## field ## _LSBMASK)) == \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  47  			(unsigned int)~(group ## _ ## reg ## _ ## field ## _LSBMASK));  \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  48  		}                                                       \
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  49  	}
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  50  #else
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  51  #define REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, value, type)
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  52  #endif
841453852a3fd2 drivers/media/platform/vxe-vxd/decoder/reg_io2.h Sidraya 2023-04-25  53  

:::::: The code at line 42 was first introduced by commit
:::::: 841453852a3fd2dd842f5dab95af7fa3521a1ae5 v4l: vxd-dec: Add firmware interface and core Registers headers

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
