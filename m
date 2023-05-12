Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A0DA3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 03:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683863559; x=1715399559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wt3BtFE4YCmTjQ8LqDYQjSom81uXldE5Jj3hfElChlI=;
  b=T6+FtTyDzqxrUUhCXfm3tZnYf2SpFhf599EMqOgrhDp+aBJg4Gdtz9cF
   ks/E4qM24NzLXvxcGjKvvSYzusB5C5yrc5nhiIerDEm6YNmIfajZiwc/f
   BN8RKiym7TSL8+x+BohwDXISTWiots0u22wBPeGAJi+ICMKhEYRoSSYWU
   xE3jsjt2/egsKzydqACZVAH+3kkLlIbrPOQrNXxr/PNrPKjK9AFacbMIa
   aH+YhEKv7toyF+CdoNlabhqluYOrdwbA1F3fIUHF0hGDf9ydgnEuaJbq4
   3QIRw+D23VM3HZeWDziDliI3owgr8Gp4/HA+iV2OUbc2Ezsm0B1gA7qtv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="437027725"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="437027725"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 20:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="769629427"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="769629427"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 May 2023 20:52:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxJpa-0004TJ-2K;
	Fri, 12 May 2023 03:52:34 +0000
Date: Fri, 12 May 2023 11:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 6243/9999] drivers/mtd/mtdchar.c:717: Error:
 unrecognized opcode `csrs sstatus,s3'
Message-ID: <202305121141.fJeFfOvi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: 75ed985bd6c8ac1d4e673e93ea9d96c9908c1d37 [6243/9999] mtd: require write permissions for locking and badblock ioctls
config: riscv-buildonly-randconfig-r006-20230511 (https://download.01.org/0day-ci/archive/20230512/202305121141.fJeFfOvi-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=75ed985bd6c8ac1d4e673e93ea9d96c9908c1d37
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 75ed985bd6c8ac1d4e673e93ea9d96c9908c1d37
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/mtd/ net/atm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121141.fJeFfOvi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/mtdchar.c: Assembler messages:
   drivers/mtd/mtdchar.c:430: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/mtd/mtdchar.c:430: Error: unrecognized opcode `csrc sstatus,a3'
   drivers/mtd/mtdchar.c:709: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/mtd/mtdchar.c:709: Error: unrecognized opcode `csrc sstatus,a3'
>> drivers/mtd/mtdchar.c:717: Error: unrecognized opcode `csrs sstatus,s3'
>> drivers/mtd/mtdchar.c:717: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/mtd/mtdchar.c:718: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/mtd/mtdchar.c:718: Error: unrecognized opcode `csrc sstatus,s3'
   drivers/mtd/mtdchar.c:719: Error: unrecognized opcode `csrs sstatus,s3'
   drivers/mtd/mtdchar.c:719: Error: unrecognized opcode `csrc sstatus,s3'


vim +717 drivers/mtd/mtdchar.c

e99d8b089a6c6f Brian Norris       2011-09-09   644  
969e57adc2589a Artem Bityutskiy   2011-12-23   645  static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
^1da177e4c3f41 Linus Torvalds     2005-04-16   646  {
f1a28c02843efc Thomas Gleixner    2006-05-30   647  	struct mtd_file_info *mfi = file->private_data;
f1a28c02843efc Thomas Gleixner    2006-05-30   648  	struct mtd_info *mtd = mfi->mtd;
^1da177e4c3f41 Linus Torvalds     2005-04-16   649  	void __user *argp = (void __user *)arg;
^1da177e4c3f41 Linus Torvalds     2005-04-16   650  	int ret = 0;
73c619ea0e49c9 Joern Engel        2006-05-30   651  	struct mtd_info_user info;
^1da177e4c3f41 Linus Torvalds     2005-04-16   652  
289c05222172b5 Brian Norris       2011-07-19   653  	pr_debug("MTD_ioctl\n");
^1da177e4c3f41 Linus Torvalds     2005-04-16   654  
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   655  	/*
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   656  	 * Check the file mode to require "dangerous" commands to have write
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   657  	 * permissions.
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   658  	 */
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   659  	switch (cmd) {
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   660  	/* "safe" commands */
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   661  	case MEMGETREGIONCOUNT:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   662  	case MEMGETREGIONINFO:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   663  	case MEMGETINFO:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   664  	case MEMREADOOB:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   665  	case MEMREADOOB64:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   666  	case MEMISLOCKED:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   667  	case MEMGETOOBSEL:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   668  	case MEMGETBADBLOCK:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   669  	case OTPSELECT:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   670  	case OTPGETREGIONCOUNT:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   671  	case OTPGETREGIONINFO:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   672  	case ECCGETLAYOUT:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   673  	case ECCGETSTATS:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   674  	case MTDFILEMODE:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   675  	case BLKPG:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   676  	case BLKRRPART:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   677  		break;
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   678  
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   679  	/* "dangerous" commands */
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   680  	case MEMERASE:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   681  	case MEMERASE64:
75ed985bd6c8ac Michael Walle      2021-03-03   682  	case MEMLOCK:
75ed985bd6c8ac Michael Walle      2021-03-03   683  	case MEMUNLOCK:
75ed985bd6c8ac Michael Walle      2021-03-03   684  	case MEMSETBADBLOCK:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   685  	case MEMWRITEOOB:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   686  	case MEMWRITEOOB64:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   687  	case MEMWRITE:
75ed985bd6c8ac Michael Walle      2021-03-03   688  	case OTPLOCK:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   689  		if (!(file->f_mode & FMODE_WRITE))
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   690  			return -EPERM;
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   691  		break;
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   692  
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   693  	default:
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   694  		return -ENOTTY;
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   695  	}
ab1a602a9cea98 Greg Kroah-Hartman 2020-07-16   696  
^1da177e4c3f41 Linus Torvalds     2005-04-16   697  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   698  	case MEMGETREGIONCOUNT:
^1da177e4c3f41 Linus Torvalds     2005-04-16   699  		if (copy_to_user(argp, &(mtd->numeraseregions), sizeof(int)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   700  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16   701  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   702  
^1da177e4c3f41 Linus Torvalds     2005-04-16   703  	case MEMGETREGIONINFO:
^1da177e4c3f41 Linus Torvalds     2005-04-16   704  	{
b67c5f87c13f39 Zev Weiss          2008-09-01   705  		uint32_t ur_idx;
b67c5f87c13f39 Zev Weiss          2008-09-01   706  		struct mtd_erase_region_info *kr;
bcc98a46eafd38 H Hartley Sweeten  2010-01-15   707  		struct region_info_user __user *ur = argp;
^1da177e4c3f41 Linus Torvalds     2005-04-16   708  
b67c5f87c13f39 Zev Weiss          2008-09-01   709  		if (get_user(ur_idx, &(ur->regionindex)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   710  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16   711  
5e59be1f351b0c Dan Carpenter      2010-09-08   712  		if (ur_idx >= mtd->numeraseregions)
5e59be1f351b0c Dan Carpenter      2010-09-08   713  			return -EINVAL;
5e59be1f351b0c Dan Carpenter      2010-09-08   714  
b67c5f87c13f39 Zev Weiss          2008-09-01   715  		kr = &(mtd->eraseregions[ur_idx]);
b67c5f87c13f39 Zev Weiss          2008-09-01   716  
b67c5f87c13f39 Zev Weiss          2008-09-01  @717  		if (put_user(kr->offset, &(ur->offset))
b67c5f87c13f39 Zev Weiss          2008-09-01   718  		    || put_user(kr->erasesize, &(ur->erasesize))
b67c5f87c13f39 Zev Weiss          2008-09-01   719  		    || put_user(kr->numblocks, &(ur->numblocks)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   720  			return -EFAULT;
b67c5f87c13f39 Zev Weiss          2008-09-01   721  
^1da177e4c3f41 Linus Torvalds     2005-04-16   722  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   723  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   724  
^1da177e4c3f41 Linus Torvalds     2005-04-16   725  	case MEMGETINFO:
a0c5a3944ce121 Vasiliy Kulikov    2010-11-06   726  		memset(&info, 0, sizeof(info));
73c619ea0e49c9 Joern Engel        2006-05-30   727  		info.type	= mtd->type;
73c619ea0e49c9 Joern Engel        2006-05-30   728  		info.flags	= mtd->flags;
73c619ea0e49c9 Joern Engel        2006-05-30   729  		info.size	= mtd->size;
73c619ea0e49c9 Joern Engel        2006-05-30   730  		info.erasesize	= mtd->erasesize;
73c619ea0e49c9 Joern Engel        2006-05-30   731  		info.writesize	= mtd->writesize;
73c619ea0e49c9 Joern Engel        2006-05-30   732  		info.oobsize	= mtd->oobsize;
19fb4341ad7a72 Brian Norris       2011-08-30   733  		/* The below field is obsolete */
19fb4341ad7a72 Brian Norris       2011-08-30   734  		info.padding	= 0;
73c619ea0e49c9 Joern Engel        2006-05-30   735  		if (copy_to_user(argp, &info, sizeof(struct mtd_info_user)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   736  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16   737  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   738  
^1da177e4c3f41 Linus Torvalds     2005-04-16   739  	case MEMERASE:
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   740  	case MEMERASE64:
^1da177e4c3f41 Linus Torvalds     2005-04-16   741  	{
^1da177e4c3f41 Linus Torvalds     2005-04-16   742  		struct erase_info *erase;
^1da177e4c3f41 Linus Torvalds     2005-04-16   743  
95b93a0cd46682 Burman Yan         2006-11-15   744  		erase=kzalloc(sizeof(struct erase_info),GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16   745  		if (!erase)
^1da177e4c3f41 Linus Torvalds     2005-04-16   746  			ret = -ENOMEM;
^1da177e4c3f41 Linus Torvalds     2005-04-16   747  		else {
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   748  			if (cmd == MEMERASE64) {
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   749  				struct erase_info_user64 einfo64;
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   750  
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   751  				if (copy_from_user(&einfo64, argp,
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   752  					    sizeof(struct erase_info_user64))) {
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   753  					kfree(erase);
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   754  					return -EFAULT;
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   755  				}
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   756  				erase->addr = einfo64.start;
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   757  				erase->len = einfo64.length;
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   758  			} else {
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   759  				struct erase_info_user einfo32;
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   760  
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   761  				if (copy_from_user(&einfo32, argp,
^1da177e4c3f41 Linus Torvalds     2005-04-16   762  					    sizeof(struct erase_info_user))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   763  					kfree(erase);
^1da177e4c3f41 Linus Torvalds     2005-04-16   764  					return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16   765  				}
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   766  				erase->addr = einfo32.start;
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   767  				erase->len = einfo32.length;
0dc54e9f33e2fb Kevin Cernekee     2009-04-08   768  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16   769  
7e1f0dc0551b99 Artem Bityutskiy   2011-12-23   770  			ret = mtd_erase(mtd, erase);
^1da177e4c3f41 Linus Torvalds     2005-04-16   771  			kfree(erase);
^1da177e4c3f41 Linus Torvalds     2005-04-16   772  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16   773  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   774  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   775  
^1da177e4c3f41 Linus Torvalds     2005-04-16   776  	case MEMWRITEOOB:
^1da177e4c3f41 Linus Torvalds     2005-04-16   777  	{
^1da177e4c3f41 Linus Torvalds     2005-04-16   778  		struct mtd_oob_buf buf;
977185404046af Kevin Cernekee     2009-04-08   779  		struct mtd_oob_buf __user *buf_user = argp;
^1da177e4c3f41 Linus Torvalds     2005-04-16   780  
977185404046af Kevin Cernekee     2009-04-08   781  		/* NOTE: writes return length to buf_user->length */
977185404046af Kevin Cernekee     2009-04-08   782  		if (copy_from_user(&buf, argp, sizeof(buf)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   783  			ret = -EFAULT;
977185404046af Kevin Cernekee     2009-04-08   784  		else
969e57adc2589a Artem Bityutskiy   2011-12-23   785  			ret = mtdchar_writeoob(file, mtd, buf.start, buf.length,
977185404046af Kevin Cernekee     2009-04-08   786  				buf.ptr, &buf_user->length);
^1da177e4c3f41 Linus Torvalds     2005-04-16   787  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   788  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   789  
^1da177e4c3f41 Linus Torvalds     2005-04-16   790  	case MEMREADOOB:
^1da177e4c3f41 Linus Torvalds     2005-04-16   791  	{
^1da177e4c3f41 Linus Torvalds     2005-04-16   792  		struct mtd_oob_buf buf;
977185404046af Kevin Cernekee     2009-04-08   793  		struct mtd_oob_buf __user *buf_user = argp;
^1da177e4c3f41 Linus Torvalds     2005-04-16   794  
977185404046af Kevin Cernekee     2009-04-08   795  		/* NOTE: writes return length to buf_user->start */
977185404046af Kevin Cernekee     2009-04-08   796  		if (copy_from_user(&buf, argp, sizeof(buf)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   797  			ret = -EFAULT;
977185404046af Kevin Cernekee     2009-04-08   798  		else
969e57adc2589a Artem Bityutskiy   2011-12-23   799  			ret = mtdchar_readoob(file, mtd, buf.start, buf.length,
977185404046af Kevin Cernekee     2009-04-08   800  				buf.ptr, &buf_user->start);
^1da177e4c3f41 Linus Torvalds     2005-04-16   801  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   802  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   803  
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   804  	case MEMWRITEOOB64:
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   805  	{
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   806  		struct mtd_oob_buf64 buf;
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   807  		struct mtd_oob_buf64 __user *buf_user = argp;
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   808  
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   809  		if (copy_from_user(&buf, argp, sizeof(buf)))
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   810  			ret = -EFAULT;
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   811  		else
969e57adc2589a Artem Bityutskiy   2011-12-23   812  			ret = mtdchar_writeoob(file, mtd, buf.start, buf.length,
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   813  				(void __user *)(uintptr_t)buf.usr_ptr,
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   814  				&buf_user->length);
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   815  		break;
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   816  	}
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   817  
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   818  	case MEMREADOOB64:
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   819  	{
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   820  		struct mtd_oob_buf64 buf;
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   821  		struct mtd_oob_buf64 __user *buf_user = argp;
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   822  
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   823  		if (copy_from_user(&buf, argp, sizeof(buf)))
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   824  			ret = -EFAULT;
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   825  		else
969e57adc2589a Artem Bityutskiy   2011-12-23   826  			ret = mtdchar_readoob(file, mtd, buf.start, buf.length,
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   827  				(void __user *)(uintptr_t)buf.usr_ptr,
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   828  				&buf_user->length);
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   829  		break;
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   830  	}
aea7cea9fa9e39 Kevin Cernekee     2009-04-08   831  
e99d8b089a6c6f Brian Norris       2011-09-09   832  	case MEMWRITE:
e99d8b089a6c6f Brian Norris       2011-09-09   833  	{
969e57adc2589a Artem Bityutskiy   2011-12-23   834  		ret = mtdchar_write_ioctl(mtd,
e99d8b089a6c6f Brian Norris       2011-09-09   835  		      (struct mtd_write_req __user *)arg);
e99d8b089a6c6f Brian Norris       2011-09-09   836  		break;
e99d8b089a6c6f Brian Norris       2011-09-09   837  	}
e99d8b089a6c6f Brian Norris       2011-09-09   838  
^1da177e4c3f41 Linus Torvalds     2005-04-16   839  	case MEMLOCK:
^1da177e4c3f41 Linus Torvalds     2005-04-16   840  	{
175428b2b3eeac Harvey Harrison    2008-07-03   841  		struct erase_info_user einfo;
^1da177e4c3f41 Linus Torvalds     2005-04-16   842  
175428b2b3eeac Harvey Harrison    2008-07-03   843  		if (copy_from_user(&einfo, argp, sizeof(einfo)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   844  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16   845  
7799f9ac8d8ff2 Artem Bityutskiy   2011-12-23   846  		ret = mtd_lock(mtd, einfo.start, einfo.length);
^1da177e4c3f41 Linus Torvalds     2005-04-16   847  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   848  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   849  
^1da177e4c3f41 Linus Torvalds     2005-04-16   850  	case MEMUNLOCK:
^1da177e4c3f41 Linus Torvalds     2005-04-16   851  	{
175428b2b3eeac Harvey Harrison    2008-07-03   852  		struct erase_info_user einfo;
^1da177e4c3f41 Linus Torvalds     2005-04-16   853  
175428b2b3eeac Harvey Harrison    2008-07-03   854  		if (copy_from_user(&einfo, argp, sizeof(einfo)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   855  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16   856  
b66005cd3e6f10 Artem Bityutskiy   2011-12-23   857  		ret = mtd_unlock(mtd, einfo.start, einfo.length);
^1da177e4c3f41 Linus Torvalds     2005-04-16   858  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   859  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   860  
9938424f0c4d20 Richard Cochran    2010-06-14   861  	case MEMISLOCKED:
9938424f0c4d20 Richard Cochran    2010-06-14   862  	{
9938424f0c4d20 Richard Cochran    2010-06-14   863  		struct erase_info_user einfo;
9938424f0c4d20 Richard Cochran    2010-06-14   864  
9938424f0c4d20 Richard Cochran    2010-06-14   865  		if (copy_from_user(&einfo, argp, sizeof(einfo)))
9938424f0c4d20 Richard Cochran    2010-06-14   866  			return -EFAULT;
9938424f0c4d20 Richard Cochran    2010-06-14   867  
e95e9786455c11 Artem Bityutskiy   2011-12-23   868  		ret = mtd_is_locked(mtd, einfo.start, einfo.length);
9938424f0c4d20 Richard Cochran    2010-06-14   869  		break;
9938424f0c4d20 Richard Cochran    2010-06-14   870  	}
9938424f0c4d20 Richard Cochran    2010-06-14   871  
5bd34c091a044d Thomas Gleixner    2006-05-27   872  	/* Legacy interface */
^1da177e4c3f41 Linus Torvalds     2005-04-16   873  	case MEMGETOOBSEL:
^1da177e4c3f41 Linus Torvalds     2005-04-16   874  	{
5bd34c091a044d Thomas Gleixner    2006-05-27   875  		struct nand_oobinfo oi;
5bd34c091a044d Thomas Gleixner    2006-05-27   876  
adbbc3bc827eb1 Boris Brezillon    2016-02-03   877  		if (!mtd->ooblayout)
5bd34c091a044d Thomas Gleixner    2006-05-27   878  			return -EOPNOTSUPP;
5bd34c091a044d Thomas Gleixner    2006-05-27   879  
c2b78452a9db43 Boris Brezillon    2016-02-03   880  		ret = get_oobinfo(mtd, &oi);
c2b78452a9db43 Boris Brezillon    2016-02-03   881  		if (ret)
c2b78452a9db43 Boris Brezillon    2016-02-03   882  			return ret;
5bd34c091a044d Thomas Gleixner    2006-05-27   883  
5bd34c091a044d Thomas Gleixner    2006-05-27   884  		if (copy_to_user(argp, &oi, sizeof(struct nand_oobinfo)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   885  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16   886  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   887  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   888  
^1da177e4c3f41 Linus Torvalds     2005-04-16   889  	case MEMGETBADBLOCK:
^1da177e4c3f41 Linus Torvalds     2005-04-16   890  	{
^1da177e4c3f41 Linus Torvalds     2005-04-16   891  		loff_t offs;
^1da177e4c3f41 Linus Torvalds     2005-04-16   892  
^1da177e4c3f41 Linus Torvalds     2005-04-16   893  		if (copy_from_user(&offs, argp, sizeof(loff_t)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   894  			return -EFAULT;
7086c19d07429d Artem Bityutskiy   2011-12-23   895  		return mtd_block_isbad(mtd, offs);
^1da177e4c3f41 Linus Torvalds     2005-04-16   896  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   897  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   898  
^1da177e4c3f41 Linus Torvalds     2005-04-16   899  	case MEMSETBADBLOCK:
^1da177e4c3f41 Linus Torvalds     2005-04-16   900  	{
^1da177e4c3f41 Linus Torvalds     2005-04-16   901  		loff_t offs;
^1da177e4c3f41 Linus Torvalds     2005-04-16   902  
^1da177e4c3f41 Linus Torvalds     2005-04-16   903  		if (copy_from_user(&offs, argp, sizeof(loff_t)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   904  			return -EFAULT;
5942ddbc500d1c Artem Bityutskiy   2011-12-23   905  		return mtd_block_markbad(mtd, offs);
^1da177e4c3f41 Linus Torvalds     2005-04-16   906  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   907  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   908  
31f4233baeaaeb Nicolas Pitre      2005-02-08   909  	case OTPSELECT:
31f4233baeaaeb Nicolas Pitre      2005-02-08   910  	{
31f4233baeaaeb Nicolas Pitre      2005-02-08   911  		int mode;
31f4233baeaaeb Nicolas Pitre      2005-02-08   912  		if (copy_from_user(&mode, argp, sizeof(int)))
31f4233baeaaeb Nicolas Pitre      2005-02-08   913  			return -EFAULT;
f1a28c02843efc Thomas Gleixner    2006-05-30   914  
beb133fc165e12 Brian Norris       2011-08-30   915  		mfi->mode = MTD_FILE_MODE_NORMAL;
f1a28c02843efc Thomas Gleixner    2006-05-30   916  
f1a28c02843efc Thomas Gleixner    2006-05-30   917  		ret = otp_select_filemode(mfi, mode);
f1a28c02843efc Thomas Gleixner    2006-05-30   918  
81dba488792b29 Nicolas Pitre      2005-04-01   919  		file->f_pos = 0;
31f4233baeaaeb Nicolas Pitre      2005-02-08   920  		break;
31f4233baeaaeb Nicolas Pitre      2005-02-08   921  	}
31f4233baeaaeb Nicolas Pitre      2005-02-08   922  
31f4233baeaaeb Nicolas Pitre      2005-02-08   923  	case OTPGETREGIONCOUNT:
31f4233baeaaeb Nicolas Pitre      2005-02-08   924  	case OTPGETREGIONINFO:
31f4233baeaaeb Nicolas Pitre      2005-02-08   925  	{
31f4233baeaaeb Nicolas Pitre      2005-02-08   926  		struct otp_info *buf = kmalloc(4096, GFP_KERNEL);
4b78fc42f3e3f0 Christian Riesch   2014-01-28   927  		size_t retlen;
31f4233baeaaeb Nicolas Pitre      2005-02-08   928  		if (!buf)
31f4233baeaaeb Nicolas Pitre      2005-02-08   929  			return -ENOMEM;
f1a28c02843efc Thomas Gleixner    2006-05-30   930  		switch (mfi->mode) {
beb133fc165e12 Brian Norris       2011-08-30   931  		case MTD_FILE_MODE_OTP_FACTORY:
4b78fc42f3e3f0 Christian Riesch   2014-01-28   932  			ret = mtd_get_fact_prot_info(mtd, 4096, &retlen, buf);
31f4233baeaaeb Nicolas Pitre      2005-02-08   933  			break;
beb133fc165e12 Brian Norris       2011-08-30   934  		case MTD_FILE_MODE_OTP_USER:
4b78fc42f3e3f0 Christian Riesch   2014-01-28   935  			ret = mtd_get_user_prot_info(mtd, 4096, &retlen, buf);
31f4233baeaaeb Nicolas Pitre      2005-02-08   936  			break;
f1a28c02843efc Thomas Gleixner    2006-05-30   937  		default:
87e858a97e8a70 Artem Bityutskiy   2011-12-28   938  			ret = -EINVAL;
f1a28c02843efc Thomas Gleixner    2006-05-30   939  			break;
31f4233baeaaeb Nicolas Pitre      2005-02-08   940  		}
4b78fc42f3e3f0 Christian Riesch   2014-01-28   941  		if (!ret) {
31f4233baeaaeb Nicolas Pitre      2005-02-08   942  			if (cmd == OTPGETREGIONCOUNT) {
4b78fc42f3e3f0 Christian Riesch   2014-01-28   943  				int nbr = retlen / sizeof(struct otp_info);
31f4233baeaaeb Nicolas Pitre      2005-02-08   944  				ret = copy_to_user(argp, &nbr, sizeof(int));
31f4233baeaaeb Nicolas Pitre      2005-02-08   945  			} else
4b78fc42f3e3f0 Christian Riesch   2014-01-28   946  				ret = copy_to_user(argp, buf, retlen);
31f4233baeaaeb Nicolas Pitre      2005-02-08   947  			if (ret)
31f4233baeaaeb Nicolas Pitre      2005-02-08   948  				ret = -EFAULT;
31f4233baeaaeb Nicolas Pitre      2005-02-08   949  		}
31f4233baeaaeb Nicolas Pitre      2005-02-08   950  		kfree(buf);
31f4233baeaaeb Nicolas Pitre      2005-02-08   951  		break;
31f4233baeaaeb Nicolas Pitre      2005-02-08   952  	}
31f4233baeaaeb Nicolas Pitre      2005-02-08   953  
31f4233baeaaeb Nicolas Pitre      2005-02-08   954  	case OTPLOCK:
31f4233baeaaeb Nicolas Pitre      2005-02-08   955  	{
175428b2b3eeac Harvey Harrison    2008-07-03   956  		struct otp_info oinfo;
31f4233baeaaeb Nicolas Pitre      2005-02-08   957  
beb133fc165e12 Brian Norris       2011-08-30   958  		if (mfi->mode != MTD_FILE_MODE_OTP_USER)
31f4233baeaaeb Nicolas Pitre      2005-02-08   959  			return -EINVAL;
175428b2b3eeac Harvey Harrison    2008-07-03   960  		if (copy_from_user(&oinfo, argp, sizeof(oinfo)))
31f4233baeaaeb Nicolas Pitre      2005-02-08   961  			return -EFAULT;
4403dbfb4541d3 Artem Bityutskiy   2011-12-23   962  		ret = mtd_lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
31f4233baeaaeb Nicolas Pitre      2005-02-08   963  		break;
31f4233baeaaeb Nicolas Pitre      2005-02-08   964  	}
31f4233baeaaeb Nicolas Pitre      2005-02-08   965  
7854d3f7495b11 Brian Norris       2011-06-23   966  	/* This ioctl is being deprecated - it truncates the ECC layout */
f1a28c02843efc Thomas Gleixner    2006-05-30   967  	case ECCGETLAYOUT:
f1a28c02843efc Thomas Gleixner    2006-05-30   968  	{
cc26c3cd3d1cf4 Brian Norris       2010-08-24   969  		struct nand_ecclayout_user *usrlay;
cc26c3cd3d1cf4 Brian Norris       2010-08-24   970  
adbbc3bc827eb1 Boris Brezillon    2016-02-03   971  		if (!mtd->ooblayout)
f1a28c02843efc Thomas Gleixner    2006-05-30   972  			return -EOPNOTSUPP;
f1a28c02843efc Thomas Gleixner    2006-05-30   973  
cc26c3cd3d1cf4 Brian Norris       2010-08-24   974  		usrlay = kmalloc(sizeof(*usrlay), GFP_KERNEL);
cc26c3cd3d1cf4 Brian Norris       2010-08-24   975  		if (!usrlay)
cc26c3cd3d1cf4 Brian Norris       2010-08-24   976  			return -ENOMEM;
cc26c3cd3d1cf4 Brian Norris       2010-08-24   977  
c2b78452a9db43 Boris Brezillon    2016-02-03   978  		shrink_ecclayout(mtd, usrlay);
cc26c3cd3d1cf4 Brian Norris       2010-08-24   979  
cc26c3cd3d1cf4 Brian Norris       2010-08-24   980  		if (copy_to_user(argp, usrlay, sizeof(*usrlay)))
cc26c3cd3d1cf4 Brian Norris       2010-08-24   981  			ret = -EFAULT;
cc26c3cd3d1cf4 Brian Norris       2010-08-24   982  		kfree(usrlay);
f1a28c02843efc Thomas Gleixner    2006-05-30   983  		break;
f1a28c02843efc Thomas Gleixner    2006-05-30   984  	}
f1a28c02843efc Thomas Gleixner    2006-05-30   985  
f1a28c02843efc Thomas Gleixner    2006-05-30   986  	case ECCGETSTATS:
f1a28c02843efc Thomas Gleixner    2006-05-30   987  	{
f1a28c02843efc Thomas Gleixner    2006-05-30   988  		if (copy_to_user(argp, &mtd->ecc_stats,
f1a28c02843efc Thomas Gleixner    2006-05-30   989  				 sizeof(struct mtd_ecc_stats)))
f1a28c02843efc Thomas Gleixner    2006-05-30   990  			return -EFAULT;
f1a28c02843efc Thomas Gleixner    2006-05-30   991  		break;
f1a28c02843efc Thomas Gleixner    2006-05-30   992  	}
f1a28c02843efc Thomas Gleixner    2006-05-30   993  
f1a28c02843efc Thomas Gleixner    2006-05-30   994  	case MTDFILEMODE:
f1a28c02843efc Thomas Gleixner    2006-05-30   995  	{
f1a28c02843efc Thomas Gleixner    2006-05-30   996  		mfi->mode = 0;
f1a28c02843efc Thomas Gleixner    2006-05-30   997  
f1a28c02843efc Thomas Gleixner    2006-05-30   998  		switch(arg) {
beb133fc165e12 Brian Norris       2011-08-30   999  		case MTD_FILE_MODE_OTP_FACTORY:
beb133fc165e12 Brian Norris       2011-08-30  1000  		case MTD_FILE_MODE_OTP_USER:
f1a28c02843efc Thomas Gleixner    2006-05-30  1001  			ret = otp_select_filemode(mfi, arg);
f1a28c02843efc Thomas Gleixner    2006-05-30  1002  			break;
f1a28c02843efc Thomas Gleixner    2006-05-30  1003  
beb133fc165e12 Brian Norris       2011-08-30  1004  		case MTD_FILE_MODE_RAW:
fc002e3c320602 Artem Bityutskiy   2011-12-28  1005  			if (!mtd_has_oob(mtd))
f1a28c02843efc Thomas Gleixner    2006-05-30  1006  				return -EOPNOTSUPP;
f1a28c02843efc Thomas Gleixner    2006-05-30  1007  			mfi->mode = arg;
f1a28c02843efc Thomas Gleixner    2006-05-30  1008  
beb133fc165e12 Brian Norris       2011-08-30  1009  		case MTD_FILE_MODE_NORMAL:
f1a28c02843efc Thomas Gleixner    2006-05-30  1010  			break;
f1a28c02843efc Thomas Gleixner    2006-05-30  1011  		default:
f1a28c02843efc Thomas Gleixner    2006-05-30  1012  			ret = -EINVAL;
f1a28c02843efc Thomas Gleixner    2006-05-30  1013  		}
f1a28c02843efc Thomas Gleixner    2006-05-30  1014  		file->f_pos = 0;
f1a28c02843efc Thomas Gleixner    2006-05-30  1015  		break;
f1a28c02843efc Thomas Gleixner    2006-05-30  1016  	}
f1a28c02843efc Thomas Gleixner    2006-05-30  1017  
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1018  	case BLKPG:
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1019  	{
53bb724f94f57b Brian Norris       2015-09-21  1020  		struct blkpg_ioctl_arg __user *blk_arg = argp;
53bb724f94f57b Brian Norris       2015-09-21  1021  		struct blkpg_ioctl_arg a;
53bb724f94f57b Brian Norris       2015-09-21  1022  
53bb724f94f57b Brian Norris       2015-09-21  1023  		if (copy_from_user(&a, blk_arg, sizeof(a)))
53bb724f94f57b Brian Norris       2015-09-21  1024  			ret = -EFAULT;
53bb724f94f57b Brian Norris       2015-09-21  1025  		else
53bb724f94f57b Brian Norris       2015-09-21  1026  			ret = mtdchar_blkpg_ioctl(mtd, &a);
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1027  		break;
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1028  	}
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1029  
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1030  	case BLKRRPART:
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1031  	{
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1032  		/* No reread partition feature. Just return ok */
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1033  		ret = 0;
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1034  		break;
d0f7959e2b708d Roman Tereshonkov  2010-09-17  1035  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1036  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1037  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1038  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1039  } /* memory_ioctl */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1040  

:::::: The code at line 717 was first introduced by commit
:::::: b67c5f87c13f398ec3f4d6b455cb0bbeda8d7ac0 [MTD] mtdchar.c: Fix regression in MEMGETREGIONINFO ioctl()

:::::: TO: Zev Weiss <zevweiss@gmail.com>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
