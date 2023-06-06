Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295DD22E52
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686081251; x=1717617251;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=91PAq7cu9Kv+gLBiR6BobVlNL4RRoUfbq7jh4ki0JVw=;
  b=AGY7qZbmJ4iOsZTNkLwQKI66Fx6xhbEmvxYLjaZFB8jKY6OKrN3Wl2a1
   FmBOKEcrI7EaSqUwJ2CbFDo8tIy1E6sDPwo9hbUhzmQbyZz9WdjH1nXI0
   bVQV5lk2pm4Bbn/LHTbiP/E5CcjPW1y4cY0fCAvjnT+yNLIToOezVAHAf
   VLkJBmuU0CTSyjoJa3IWyEIzw4+BQJsMuHwJDWFFlZFURCHfTMo2osL8q
   3ZU6y4HkJYqruSloca03H1AMG3jokaGTOAFFED4ZUlgnfJpNLFkfJGrA6
   OiJdZZAXMEfoWxYRvbwT8ACE6unR9vBdmKIRghZAfYBnTUjQoapJ1D9sw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359249449"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="359249449"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 12:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="833375954"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="833375954"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Jun 2023 12:54:09 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6ckq-0005ff-2e;
	Tue, 06 Jun 2023 19:54:08 +0000
Date: Wed, 7 Jun 2023 03:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-open-release 45/48] drivers/cdrom/cdrom.c:1166:21:
 sparse: sparse: restricted blk_mode_t degrades to integer
Message-ID: <202306070313.60czFz7L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://git.infradead.org/users/hch/block.git blk-open-release
head:   0c548efe09ba601207bd6bb9fa48cf2dd706bfb3
commit: 54822e562a29c2e2098f70e01d9b1d8a96213d94 [45/48] block: replace fmode_t with a block-specific type for block open flags
config: arm-randconfig-s031-20230606 (https://download.01.org/0day-ci/archive/20230607/202306070313.60czFz7L-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block blk-open-release
        git checkout 54822e562a29c2e2098f70e01d9b1d8a96213d94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/cdrom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070313.60czFz7L-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cdrom/cdrom.c:1166:21: sparse: sparse: restricted blk_mode_t degrades to integer
>> drivers/cdrom/cdrom.c:1166:28: sparse: sparse: restricted fmode_t degrades to integer

vim +1166 drivers/cdrom/cdrom.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  1140  
82b91540ba24a1 Joe Perches        2014-05-04  1141  /* We use the open-option O_NONBLOCK to indicate that the
82b91540ba24a1 Joe Perches        2014-05-04  1142   * purpose of opening is only for subsequent ioctl() calls; no device
82b91540ba24a1 Joe Perches        2014-05-04  1143   * integrity checks are performed.
82b91540ba24a1 Joe Perches        2014-05-04  1144   *
82b91540ba24a1 Joe Perches        2014-05-04  1145   * We hope that all cd-player programs will adopt this convention. It
82b91540ba24a1 Joe Perches        2014-05-04  1146   * is in their own interest: device control becomes a lot easier
82b91540ba24a1 Joe Perches        2014-05-04  1147   * this way.
82b91540ba24a1 Joe Perches        2014-05-04  1148   */
54822e562a29c2 Christoph Hellwig  2023-06-05  1149  int cdrom_open(struct cdrom_device_info *cdi, blk_mode_t mode)
82b91540ba24a1 Joe Perches        2014-05-04  1150  {
82b91540ba24a1 Joe Perches        2014-05-04  1151  	int ret;
82b91540ba24a1 Joe Perches        2014-05-04  1152  
82b91540ba24a1 Joe Perches        2014-05-04  1153  	cd_dbg(CD_OPEN, "entering cdrom_open\n");
82b91540ba24a1 Joe Perches        2014-05-04  1154  
82b91540ba24a1 Joe Perches        2014-05-04  1155  	/* if this was a O_NONBLOCK open and we should honor the flags,
82b91540ba24a1 Joe Perches        2014-05-04  1156  	 * do a quick open without drive/disc integrity checks. */
82b91540ba24a1 Joe Perches        2014-05-04  1157  	cdi->use_count++;
54822e562a29c2 Christoph Hellwig  2023-06-05  1158  	if ((mode & BLK_OPEN_NDELAY) && (cdi->options & CDO_USE_FFLAGS)) {
82b91540ba24a1 Joe Perches        2014-05-04  1159  		ret = cdi->ops->open(cdi, 1);
82b91540ba24a1 Joe Perches        2014-05-04  1160  	} else {
82b91540ba24a1 Joe Perches        2014-05-04  1161  		ret = open_for_data(cdi);
82b91540ba24a1 Joe Perches        2014-05-04  1162  		if (ret)
82b91540ba24a1 Joe Perches        2014-05-04  1163  			goto err;
366ba7c71ef77c Diego Elio Pettenò 2019-11-19  1164  		if (CDROM_CAN(CDC_GENERIC_PACKET))
82b91540ba24a1 Joe Perches        2014-05-04  1165  			cdrom_mmc3_profile(cdi);
82b91540ba24a1 Joe Perches        2014-05-04 @1166  		if (mode & FMODE_WRITE) {
82b91540ba24a1 Joe Perches        2014-05-04  1167  			ret = -EROFS;
82b91540ba24a1 Joe Perches        2014-05-04  1168  			if (cdrom_open_write(cdi))
82b91540ba24a1 Joe Perches        2014-05-04  1169  				goto err_release;
82b91540ba24a1 Joe Perches        2014-05-04  1170  			if (!CDROM_CAN(CDC_RAM))
82b91540ba24a1 Joe Perches        2014-05-04  1171  				goto err_release;
82b91540ba24a1 Joe Perches        2014-05-04  1172  			ret = 0;
82b91540ba24a1 Joe Perches        2014-05-04  1173  			cdi->media_written = 0;
82b91540ba24a1 Joe Perches        2014-05-04  1174  		}
7d8300559cb9b1 Christoph Hellwig  2023-06-04  1175  		cdi->opened_for_data = true;
82b91540ba24a1 Joe Perches        2014-05-04  1176  	}
82b91540ba24a1 Joe Perches        2014-05-04  1177  
82b91540ba24a1 Joe Perches        2014-05-04  1178  	if (ret)
82b91540ba24a1 Joe Perches        2014-05-04  1179  		goto err;
82b91540ba24a1 Joe Perches        2014-05-04  1180  
82b91540ba24a1 Joe Perches        2014-05-04  1181  	cd_dbg(CD_OPEN, "Use count for \"/dev/%s\" now %d\n",
82b91540ba24a1 Joe Perches        2014-05-04  1182  	       cdi->name, cdi->use_count);
82b91540ba24a1 Joe Perches        2014-05-04  1183  	return 0;
82b91540ba24a1 Joe Perches        2014-05-04  1184  err_release:
82b91540ba24a1 Joe Perches        2014-05-04  1185  	if (CDROM_CAN(CDC_LOCK) && cdi->options & CDO_LOCK) {
82b91540ba24a1 Joe Perches        2014-05-04  1186  		cdi->ops->lock_door(cdi, 0);
82b91540ba24a1 Joe Perches        2014-05-04  1187  		cd_dbg(CD_OPEN, "door unlocked\n");
82b91540ba24a1 Joe Perches        2014-05-04  1188  	}
82b91540ba24a1 Joe Perches        2014-05-04  1189  	cdi->ops->release(cdi);
82b91540ba24a1 Joe Perches        2014-05-04  1190  err:
82b91540ba24a1 Joe Perches        2014-05-04  1191  	cdi->use_count--;
82b91540ba24a1 Joe Perches        2014-05-04  1192  	return ret;
82b91540ba24a1 Joe Perches        2014-05-04  1193  }
eeef7565e8ba17 Enze Li            2022-05-15  1194  EXPORT_SYMBOL(cdrom_open);
82b91540ba24a1 Joe Perches        2014-05-04  1195  

:::::: The code at line 1166 was first introduced by commit
:::::: 82b91540ba24a1295c82572b922d50cbcf48fcee cdrom: Remove prototype for open_for_data

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
