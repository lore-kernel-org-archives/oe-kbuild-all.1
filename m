Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8D87C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 10:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674470346; x=1706006346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xg09wBXGGQA53SqtMJt4LByzk+1HTcAeJtU8u3CvVsU=;
  b=CAiY6p8TUgemJdx1f4dgEZm085Vgv/Nmtoytg4oQl1A7TQi2COOfOa8w
   xQBAYOZhH1UXEUgBHAR5YUdWgmTbVxeHItrDfBC3I8r9GPe3Sa3p7WPzp
   ZoSy7Bu+U8DHODeLggD4lLijZ4y/e9nsaiUa3Cg36dv4q6HWpE2WqWe2o
   pTUt4JQty50KFCbeFNChYuPl9BtTG0b49eUGwffCfiQnssv8YbKHo4JiV
   Z+n009rNwk+Y1O2A8Z08NYYrs++0UB6qvYp4+3bnkDW+lMSqsCpbl+DS9
   5XzewGbm5dNyMdZOanvcNYRCQDLc/cLY+dD+HsI/XIR/GMnf3MW9XeMNY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="309588881"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="309588881"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 02:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="804038768"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="804038768"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 02:39:04 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJuEB-0005a2-2P;
	Mon, 23 Jan 2023 10:39:03 +0000
Date: Mon, 23 Jan 2023 18:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:vauban-iap 12/14]
 drivers/fpga/microchip-auto-update.c:219:29: warning: format '%x' expects
 argument of type 'unsigned int', but argument 4 has type 'loff_t' {aka 'long
 long int'}
Message-ID: <202301231824.prbiOgH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git vauban-iap
head:   fd52b76880a3e9fc0021fbb176388103755183ac
commit: 6c0fe379cce6d50e8328418b718d1d12c67377bb [12/14] fpga: add PolarFire SoC IAP support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230123/202301231824.prbiOgH4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?id=6c0fe379cce6d50e8328418b718d1d12c67377bb
        git remote add conor https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
        git fetch --no-tags conor vauban-iap
        git checkout 6c0fe379cce6d50e8328418b718d1d12c67377bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/fpga/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from include/linux/fpga/fpga-mgr.h:12,
                    from drivers/fpga/microchip-auto-update.c:10:
   drivers/fpga/microchip-auto-update.c: In function 'mpfs_auto_update_write':
>> drivers/fpga/microchip-auto-update.c:219:29: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'loff_t' {aka 'long long int'} [-Wformat=]
     219 |         dev_info(priv->dev, "Writing the image address (%x) to the flash directory (%x)\n",
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/fpga/microchip-auto-update.c:219:9: note: in expansion of macro 'dev_info'
     219 |         dev_info(priv->dev, "Writing the image address (%x) to the flash directory (%x)\n",
         |         ^~~~~~~~
   drivers/fpga/microchip-auto-update.c:219:86: note: format string is defined here
     219 |         dev_info(priv->dev, "Writing the image address (%x) to the flash directory (%x)\n",
         |                                                                                     ~^
         |                                                                                      |
         |                                                                                      unsigned int
         |                                                                                     %llx


vim +219 drivers/fpga/microchip-auto-update.c

   162	
   163	static int mpfs_auto_update_write(struct fpga_manager *mgr, const char *buf, size_t count)
   164	{
   165		/*
   166		 * No parsing etc of the bitstream is required. The system controller
   167		 * will do all of that itself - including verifying that the bitstream
   168		 * is valid.
   169		 */
   170		struct mpfs_auto_update_priv *priv = mgr->priv;
   171		struct erase_info erase;
   172		char *buffer;
   173		size_t bytes_written = 0, bytes_read = 0;
   174		loff_t directory_address = AUTO_UPDATE_UPGRADE_DIRECTORY;
   175		u64 erase_size = AUTO_UPDATE_DIRECTORY_SIZE;
   176		u32 image_address = AUTO_UPDATE_ADDRESS;
   177		int ret;
   178	
   179		priv->flash = mpfs_sys_controller_get_flash(priv->sys_controller);
   180		if (!priv->flash)
   181			return -EIO;
   182	
   183		erase_size = round_up(erase_size, (u64)priv->flash->erasesize);
   184	
   185		buffer = devm_kzalloc(priv->dev, erase_size, GFP_KERNEL);
   186		if (!buffer)
   187			return -ENOMEM;
   188	
   189		erase.addr = 0x0;
   190		erase.len = erase_size;
   191	
   192		/*
   193		 * We need to write the "SPI DIRECTORY" to the first 1 KiB, telling
   194		 * the system controller where to find the actual bitstream. Since
   195		 * this is spi-nor, we have to read the first eraseblock, erase that
   196		 * portion of the flash, modify the data and then write it back.
   197		 */
   198		ret = mtd_read(priv->flash, 0x0, erase_size, &bytes_read, (u_char *) buffer);
   199		if (ret)
   200			goto out;
   201	
   202		if (bytes_read != erase_size) {
   203			ret = -EIO;
   204			goto out;
   205		}
   206	
   207		ret = mtd_erase(priv->flash, &erase);
   208		if (ret)
   209			goto out;
   210	
   211		/* populate the image address */
   212		memcpy(buffer + AUTO_UPDATE_UPGRADE_DIRECTORY,
   213		       &image_address, AUTO_UPDATE_DIRECTORY_WIDTH);
   214	
   215		/* zero out the next directory so that the system controller doesn't complain */
   216		memset(buffer + AUTO_UPDATE_BLANK_DIRECTORY,
   217		       0x0, AUTO_UPDATE_DIRECTORY_WIDTH);
   218	
 > 219		dev_info(priv->dev, "Writing the image address (%x) to the flash directory (%x)\n",
   220			 image_address, directory_address);
   221	
   222		ret = mtd_write(priv->flash, 0x0, erase_size, &bytes_written, (u_char *)buffer);
   223		if (ret)
   224			goto out;
   225	
   226		if (bytes_written != erase_size) {
   227			ret = -EIO;
   228			goto out;
   229		}
   230	
   231		/*
   232		 * Now the .spi image itself can be written to the flash. Preservation
   233		 * of contents here is not important here, unlike the spi "directory"
   234		 * which must be RMWed.
   235		 */
   236		erase.len = round_up(count, (size_t)priv->flash->erasesize);
   237		erase.addr = AUTO_UPDATE_ADDRESS;
   238	
   239		dev_info(priv->dev, "Erasing the flash at address (%x)\n", image_address);
   240		ret = mtd_erase(priv->flash, &erase);
   241		if (ret)
   242			goto out;
   243	
   244		dev_info(priv->dev, "Writing the image to the flash at address (%x)\n", image_address);
   245		ret = mtd_write(priv->flash, (loff_t) image_address, count, &bytes_written, buf);
   246		if (ret)
   247			goto out;
   248	
   249		if (bytes_written != count)
   250			ret = -EIO;
   251	
   252	out:
   253		devm_kfree(priv->dev, buffer);
   254		return ret;
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
