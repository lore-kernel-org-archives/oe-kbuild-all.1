Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC5A60862
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 May 2023 04:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684989531; x=1716525531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=touC5IOjo1jHwg2zFGr7Y/4lKdsWTOROGSLNb0BU/FQ=;
  b=Rf9Ox3WDojYmoNUC0pynKReC2cN8dIR012ahtIdGeQgYIdK5c1O1Z+Pd
   PMkwN1htblOuDPgvbQ5oyaNS9hKasrkoDI6GraSFDKdFlrZ/RczFebTXo
   sTtCOJtxIAlmSkE9yjNsVtKBaUpLHsldjQzs+mP9/1q3pn4/siDSPqpKV
   mgVWB8JJrsk33Ot66cSXhqfMcSGIP23J8h9bDqgbc+vSSGm2F5I4zAcuz
   gnxMpN5RauWBbUNBmJudZeZ15Odb20p93jlX5rS2z9vq2mYSB36o7SlXR
   UWpeH9KNN8hG8zDSdWhMS8+mKtuRTuj79I6qvgMAguzjAaEZUGEDZUjp/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="419498744"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="419498744"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 21:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="951301312"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="951301312"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 May 2023 21:38:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q22kD-000FSB-0q;
	Thu, 25 May 2023 04:38:33 +0000
Date: Thu, 25 May 2023 12:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 6243/9999] drivers/mtd/mtdchar.c:717: Error:
 unrecognized opcode `csrs sstatus,s2'
Message-ID: <202305251132.4xsvsmbl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="t2BeR/0bYevrNdMo"
Content-Disposition: inline


--t2BeR/0bYevrNdMo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   3f57fb8b1bd06b277556601133823bec370d723f
commit: 75ed985bd6c8ac1d4e673e93ea9d96c9908c1d37 [6243/9999] mtd: require write permissions for locking and badblock ioctls
config: riscv-randconfig-r042-20230524
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=75ed985bd6c8ac1d4e673e93ea9d96c9908c1d37
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 75ed985bd6c8ac1d4e673e93ea9d96c9908c1d37
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/mtd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305251132.4xsvsmbl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/mtdchar.c: Assembler messages:
   drivers/mtd/mtdchar.c:430: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/mtd/mtdchar.c:430: Error: unrecognized opcode `csrc sstatus,a3'
   drivers/mtd/mtdchar.c:709: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/mtd/mtdchar.c:709: Error: unrecognized opcode `csrc sstatus,a3'
>> drivers/mtd/mtdchar.c:717: Error: unrecognized opcode `csrs sstatus,s2'
>> drivers/mtd/mtdchar.c:717: Error: unrecognized opcode `csrc sstatus,s2'
   drivers/mtd/mtdchar.c:718: Error: unrecognized opcode `csrs sstatus,s2'
   drivers/mtd/mtdchar.c:718: Error: unrecognized opcode `csrc sstatus,s2'
   drivers/mtd/mtdchar.c:719: Error: unrecognized opcode `csrs sstatus,s2'
   drivers/mtd/mtdchar.c:719: Error: unrecognized opcode `csrc sstatus,s2'


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
https://github.com/intel/lkp-tests/wiki

--t2BeR/0bYevrNdMo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/riscv 4.19.190 Kernel Configuration
#

#
# Compiler: riscv64-linux-gcc (GCC) 12.1.0
#
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_IRQ_WORK=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
CONFIG_GENERIC_IRQ_MULTI_HANDLER=y
CONFIG_GENERIC_CLOCKEVENTS=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
# CONFIG_MEMCG_SWAP is not set
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
# CONFIG_DEBUG_BLK_CGROUP is not set
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
# CONFIG_PID_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_ANON_INODES=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_BPF=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
# CONFIG_PRINTK is not set
CONFIG_BUG=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
# CONFIG_EPOLL is not set
# CONFIG_SIGNALFD is not set
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_ADVISE_SYSCALLS=y
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_BPF_SYSCALL=y
# CONFIG_USERFAULTFD is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_COMPAT_BRK=y
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
CONFIG_64BIT=y
CONFIG_RISCV=y
CONFIG_MMU=y
CONFIG_ZONE_DMA32=y
CONFIG_PAGE_OFFSET=0xffffffff80000000
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_RWSEM_GENERIC_SPINLOCK=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_PGTABLE_LEVELS=3

#
# Platform type
#
# CONFIG_ARCH_RV32I is not set
CONFIG_ARCH_RV64I=y
CONFIG_CMODEL_MEDLOW=y
# CONFIG_CMODEL_MEDANY is not set
CONFIG_MAXPHYSMEM_2GB=y
# CONFIG_SMP is not set
CONFIG_TUNE_GENERIC=y
CONFIG_RISCV_ISA_C=y
CONFIG_RISCV_ISA_A=y

#
# supported PMU type
#
CONFIG_RISCV_BASE_PMU=y

#
# Kernel type
#
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
CONFIG_HZ_300=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=300

#
# Bus support
#
# CONFIG_PCI is not set

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set

#
# Power management options
#
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_PM_GENERIC_DOMAINS_OF=y

#
# General architecture-dependent options
#
CONFIG_HAVE_64BIT_ALIGNED_ACCESS=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_HAVE_CLK=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_CLONE_BACKWARDS=y
# CONFIG_REFCOUNT_FULL is not set

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_PLUGIN_HOSTCC=""
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_CMDLINE_PARSER=y
CONFIG_BLK_WBT=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_WBT_SQ is not set
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
CONFIG_ACORN_PARTITION_CUMANA=y
CONFIG_ACORN_PARTITION_EESOX=y
# CONFIG_ACORN_PARTITION_ICS is not set
# CONFIG_ACORN_PARTITION_ADFS is not set
# CONFIG_ACORN_PARTITION_POWERTEC is not set
# CONFIG_ACORN_PARTITION_RISCIX is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
# CONFIG_AMIGA_PARTITION is not set
# CONFIG_ATARI_PARTITION is not set
# CONFIG_MAC_PARTITION is not set
# CONFIG_MSDOS_PARTITION is not set
CONFIG_LDM_PARTITION=y
CONFIG_LDM_DEBUG=y
CONFIG_SGI_PARTITION=y
CONFIG_ULTRIX_PARTITION=y
# CONFIG_SUN_PARTITION is not set
# CONFIG_KARMA_PARTITION is not set
# CONFIG_EFI_PARTITION is not set
# CONFIG_SYSV68_PARTITION is not set
CONFIG_CMDLINE_PARTITION=y
CONFIG_BLK_MQ_VIRTIO=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_CFQ=y
# CONFIG_CFQ_GROUP_IOSCHED is not set
# CONFIG_DEFAULT_DEADLINE is not set
CONFIG_DEFAULT_CFQ=y
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED="cfq"
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
# CONFIG_COREDUMP is not set

#
# Memory Management options
#
CONFIG_FLATMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_NO_BOOTMEM=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_MIGRATION=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CLEANCACHE is not set
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_AREAS=7
CONFIG_ZSWAP=y
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
# CONFIG_PGTABLE_MAPPING is not set
# CONFIG_ZSMALLOC_STAT is not set
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_FRAME_VECTOR=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_NET is not set

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_STANDALONE is not set
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_ALLOW_DEV_COREDUMP is not set
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=16
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8

#
# Bus devices
#
# CONFIG_QCOM_EBI2 is not set
# CONFIG_SIMPLE_PM_BUS is not set
# CONFIG_GNSS is not set
CONFIG_MTD=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
CONFIG_MTD_CMDLINE_PARTS=y
# CONFIG_MTD_OF_PARTS is not set
CONFIG_MTD_AR7_PARTS=y
CONFIG_MTD_BCM63XX_PARTS=y

#
# Partition parsers
#
CONFIG_MTD_PARSER_TRX=y
CONFIG_MTD_SHARPSL_PARTS=y

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
CONFIG_NFTL=y
# CONFIG_NFTL_RW is not set
# CONFIG_INFTL is not set
CONFIG_RFD_FTL=y
CONFIG_SSFDC=y
# CONFIG_SM_FTL is not set
CONFIG_MTD_OOPS=y
CONFIG_MTD_SWAP=y
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
CONFIG_MTD_CFI_BE_BYTE_SWAP=y
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_OTP is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
# CONFIG_MTD_PHYSMAP_COMPAT is not set
# CONFIG_MTD_PHYSMAP_OF is not set
# CONFIG_MTD_SC520CDP is not set
CONFIG_MTD_NETSC520=y
CONFIG_MTD_TS5500=y
# CONFIG_MTD_GPIO_ADDR is not set
# CONFIG_MTD_PLATRAM is not set
# CONFIG_MTD_LATCH_ADDR is not set

#
# Self-contained MTD device drivers
#
CONFIG_MTD_SLRAM=y
CONFIG_MTD_PHRAM=y
# CONFIG_MTD_MTDRAM is not set
CONFIG_MTD_BLOCK2MTD=y

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# CONFIG_MTD_ONENAND is not set
# CONFIG_MTD_NAND is not set

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# CONFIG_MTD_SPI_NOR is not set
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
CONFIG_MTD_UBI_GLUEBI=y
# CONFIG_MTD_UBI_BLOCK is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
# CONFIG_OF_OVERLAY is not set
CONFIG_PARPORT=y
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
CONFIG_NVME_CORE=y
# CONFIG_NVME_MULTIPATH is not set
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
CONFIG_NVME_TARGET=y
CONFIG_NVME_TARGET_LOOP=y
CONFIG_NVME_TARGET_FC=y
CONFIG_NVME_TARGET_FCLOOP=y

#
# Misc devices
#
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
# CONFIG_DUMMY_IRQ is not set
# CONFIG_ICS932S401 is not set
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_QCOM_COINCELL is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=y
# CONFIG_SENSORS_BH1770 is not set
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
CONFIG_DS1682=y
# CONFIG_USB_SWITCH_FSA9480 is not set
# CONFIG_SRAM is not set
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=y
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_LEGACY=y
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_IDT_89HPESX=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_ALTERA_STAPL=y

#
# Intel MIC & related support
#

#
# Intel MIC Bus Driver
#

#
# SCIF Bus Driver
#

#
# VOP Bus Driver
#

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
CONFIG_ECHO=y

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_MQ_DEFAULT=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
CONFIG_CHR_DEV_ST=y
# CONFIG_CHR_DEV_OSST is not set
# CONFIG_CHR_DEV_SG is not set
# CONFIG_CHR_DEV_SCH is not set
# CONFIG_SCSI_ENCLOSURE is not set
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
# CONFIG_SCSI_SAS_ATA is not set
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=y
CONFIG_SCSI_LOWLEVEL=y
CONFIG_ISCSI_BOOT_SYSFS=y
# CONFIG_SCSI_HISI_SAS is not set
CONFIG_SCSI_UFSHCD=y
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
CONFIG_SCSI_DEBUG=y
CONFIG_SCSI_VIRTIO=y
CONFIG_SCSI_LOWLEVEL_PCMCIA=y
CONFIG_SCSI_DH=y
# CONFIG_SCSI_DH_RDAC is not set
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# CONFIG_SCSI_OSD_INITIATOR is not set
CONFIG_ATA=y
# CONFIG_ATA_VERBOSE_ERROR is not set
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI_PLATFORM is not set
CONFIG_AHCI_IMX=y
CONFIG_AHCI_CEVA=y
# CONFIG_AHCI_QORIQ is not set
CONFIG_SATA_GEMINI=y
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_SATA_HIGHBANK=y
# CONFIG_SATA_MV is not set
CONFIG_SATA_RCAR=y

#
# PATA SFF controllers with BMDMA
#

#
# PIO-only SFF controllers
#
# CONFIG_PATA_PLATFORM is not set

#
# Generic fallback / legacy drivers
#
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=y
# CONFIG_MD_RAID0 is not set
CONFIG_MD_RAID1=y
# CONFIG_MD_RAID10 is not set
# CONFIG_MD_RAID456 is not set
CONFIG_MD_MULTIPATH=y
# CONFIG_MD_FAULTY is not set
CONFIG_BCACHE=y
CONFIG_BCACHE_DEBUG=y
CONFIG_BCACHE_CLOSURES_DEBUG=y
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=y
# CONFIG_DM_MQ_DEFAULT is not set
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=y
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=y
CONFIG_DM_PERSISTENT_DATA=y
CONFIG_DM_UNSTRIPED=y
CONFIG_DM_CRYPT=y
# CONFIG_DM_SNAPSHOT is not set
# CONFIG_DM_THIN_PROVISIONING is not set
CONFIG_DM_CACHE=y
CONFIG_DM_CACHE_SMQ=y
# CONFIG_DM_WRITECACHE is not set
CONFIG_DM_ERA=y
CONFIG_DM_MIRROR=y
# CONFIG_DM_RAID is not set
# CONFIG_DM_ZERO is not set
CONFIG_DM_MULTIPATH=y
CONFIG_DM_MULTIPATH_QL=y
CONFIG_DM_MULTIPATH_ST=y
CONFIG_DM_DELAY=y
# CONFIG_DM_UEVENT is not set
# CONFIG_DM_FLAKEY is not set
CONFIG_DM_VERITY=y
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=y
CONFIG_DM_LOG_WRITES=y
CONFIG_DM_INTEGRITY=y
CONFIG_DM_ZONED=y
CONFIG_TARGET_CORE=y
CONFIG_TCM_IBLOCK=y
CONFIG_TCM_FILEIO=y
CONFIG_TCM_PSCSI=y
CONFIG_LOOPBACK_TARGET=y
CONFIG_SBP_TARGET=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
CONFIG_FIREWIRE_SBP2=y

#
# Input device support
#
# CONFIG_INPUT is not set

#
# Hardware I/O ports
#
# CONFIG_SERIO is not set
# CONFIG_GAMEPORT is not set

#
# Character devices
#
# CONFIG_TTY is not set
# CONFIG_DEVMEM is not set
# CONFIG_DEVKMEM is not set
CONFIG_SERIAL_DEV_BUS=y
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
# CONFIG_IPMI_DEVICE_INTERFACE is not set
# CONFIG_IPMI_SI is not set
# CONFIG_IPMI_SSIF is not set
CONFIG_IPMI_WATCHDOG=y
CONFIG_IPMI_POWEROFF=y
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
CONFIG_ASPEED_BT_IPMI_BMC=y
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
# CONFIG_HW_RANDOM_VIRTIO is not set
# CONFIG_HW_RANDOM_STM32 is not set
CONFIG_HW_RANDOM_MESON=y
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y

#
# PCMCIA character devices
#
# CONFIG_RAW_DRIVER is not set
# CONFIG_TCG_TPM is not set
# CONFIG_XILLYBUS is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_GPMUX is not set
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=y
# CONFIG_I2C_MUX_PINCTRL is not set
CONFIG_I2C_MUX_REG=y
CONFIG_I2C_DEMUX_PINCTRL=y
# CONFIG_I2C_MUX_MLXCPLD is not set
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#
# CONFIG_I2C_HIX5HD2 is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_ASPEED=y
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM_IPROC is not set
# CONFIG_I2C_BRCMSTB is not set
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
# CONFIG_I2C_EFM32 is not set
CONFIG_I2C_EMEV2=y
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_IMG=y
# CONFIG_I2C_IMX_LPI2C is not set
CONFIG_I2C_JZ4780=y
CONFIG_I2C_KEMPLD=y
CONFIG_I2C_LPC2K=y
CONFIG_I2C_MESON=y
# CONFIG_I2C_MT65XX is not set
CONFIG_I2C_OCORES=y
CONFIG_I2C_OWL=y
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_QCOM_GENI=y
CONFIG_I2C_RIIC=y
# CONFIG_I2C_RK3X is not set
CONFIG_I2C_SH_MOBILE=y
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_STM32F4=y
# CONFIG_I2C_STM32F7 is not set
CONFIG_I2C_SUN6I_P2WI=y
CONFIG_I2C_SYNQUACER=y
CONFIG_I2C_UNIPHIER=y
CONFIG_I2C_UNIPHIER_F=y
CONFIG_I2C_VERSATILE=y
# CONFIG_I2C_XILINX is not set
CONFIG_I2C_XLP9XX=y
CONFIG_I2C_RCAR=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_PARPORT_LIGHT is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_FSI=y
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_DEBUG_CORE is not set
CONFIG_I2C_DEBUG_ALGO=y
# CONFIG_I2C_DEBUG_BUS is not set
# CONFIG_SPI is not set
CONFIG_SPMI=y
CONFIG_SPMI_MSM_PMIC_ARB=y
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y
# CONFIG_PPS is not set

#
# PTP clock support
#

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AS3722=y
CONFIG_PINCTRL_AMD=y
CONFIG_PINCTRL_DA850_PUPD=y
# CONFIG_PINCTRL_LPC18XX is not set
CONFIG_PINCTRL_MCP23S08=y
CONFIG_PINCTRL_RZA1=y
# CONFIG_PINCTRL_SINGLE is not set
# CONFIG_PINCTRL_SX150X is not set
# CONFIG_PINCTRL_PALMAS is not set
# CONFIG_PINCTRL_INGENIC is not set
# CONFIG_PINCTRL_OCELOT is not set
CONFIG_PINCTRL_OWL=y
CONFIG_PINCTRL_S900=y
CONFIG_PINCTRL_ASPEED=y
# CONFIG_PINCTRL_ASPEED_G4 is not set
CONFIG_PINCTRL_ASPEED_G5=y
CONFIG_PINCTRL_BCM281XX=y
# CONFIG_PINCTRL_IPROC_GPIO is not set
CONFIG_PINCTRL_CYGNUS_MUX=y
# CONFIG_PINCTRL_NSP_GPIO is not set
CONFIG_PINCTRL_NS2_MUX=y
# CONFIG_PINCTRL_NSP_MUX is not set
CONFIG_PINCTRL_BERLIN=y
CONFIG_PINCTRL_AS370=y
CONFIG_PINCTRL_BERLIN_BG4CT=y
CONFIG_PINCTRL_PXA=y
# CONFIG_PINCTRL_PXA25X is not set
CONFIG_PINCTRL_PXA27X=y
# CONFIG_PINCTRL_APQ8064 is not set
# CONFIG_PINCTRL_APQ8084 is not set
# CONFIG_PINCTRL_IPQ4019 is not set
# CONFIG_PINCTRL_IPQ8064 is not set
# CONFIG_PINCTRL_IPQ8074 is not set
# CONFIG_PINCTRL_MSM8660 is not set
# CONFIG_PINCTRL_MSM8960 is not set
# CONFIG_PINCTRL_MDM9615 is not set
# CONFIG_PINCTRL_MSM8X74 is not set
# CONFIG_PINCTRL_MSM8916 is not set
# CONFIG_PINCTRL_MSM8994 is not set
# CONFIG_PINCTRL_MSM8996 is not set
# CONFIG_PINCTRL_MSM8998 is not set
CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
# CONFIG_PINCTRL_QCOM_SSBI_PMIC is not set
# CONFIG_PINCTRL_SDM845 is not set
CONFIG_PINCTRL_SPRD=y
CONFIG_PINCTRL_SPRD_SC9860=y
CONFIG_PINCTRL_STM32=y
# CONFIG_PINCTRL_STM32F429 is not set
# CONFIG_PINCTRL_STM32F469 is not set
# CONFIG_PINCTRL_STM32F746 is not set
CONFIG_PINCTRL_STM32F769=y
# CONFIG_PINCTRL_STM32H743 is not set
# CONFIG_PINCTRL_STM32MP157 is not set
# CONFIG_PINCTRL_TI_IODELAY is not set
CONFIG_PINCTRL_UNIPHIER=y
CONFIG_PINCTRL_UNIPHIER_LD4=y
CONFIG_PINCTRL_UNIPHIER_PRO4=y
CONFIG_PINCTRL_UNIPHIER_SLD8=y
# CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
CONFIG_PINCTRL_UNIPHIER_PXS2=y
# CONFIG_PINCTRL_UNIPHIER_LD6B is not set
CONFIG_PINCTRL_UNIPHIER_LD11=y
CONFIG_PINCTRL_UNIPHIER_LD20=y
# CONFIG_PINCTRL_UNIPHIER_PXS3 is not set

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MT2701=y
# CONFIG_PINCTRL_MT8135 is not set
# CONFIG_PINCTRL_MT8127 is not set
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT7622 is not set
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT6397 is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_ASPEED is not set
CONFIG_GPIO_ATH79=y
CONFIG_GPIO_RASPBERRYPI_EXP=y
CONFIG_GPIO_BCM_KONA=y
CONFIG_GPIO_BRCMSTB=y
CONFIG_GPIO_CLPS711X=y
# CONFIG_GPIO_DWAPB is not set
CONFIG_GPIO_EIC_SPRD=y
CONFIG_GPIO_EM=y
CONFIG_GPIO_FTGPIO010=y
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_HLWD is not set
# CONFIG_GPIO_INGENIC is not set
# CONFIG_GPIO_IOP is not set
CONFIG_GPIO_LPC18XX=y
# CONFIG_GPIO_MB86S7X is not set
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_MPC8XXX=y
# CONFIG_GPIO_MT7621 is not set
CONFIG_GPIO_PMIC_EIC_SPRD=y
CONFIG_GPIO_RCAR=y
# CONFIG_GPIO_SPRD is not set
CONFIG_GPIO_SYSCON=y
# CONFIG_GPIO_TEGRA is not set
CONFIG_GPIO_TEGRA186=y
# CONFIG_GPIO_TS4800 is not set
CONFIG_GPIO_UNIPHIER=y
CONFIG_GPIO_XILINX=y
CONFIG_GPIO_XLP=y
# CONFIG_GPIO_ZX is not set

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
CONFIG_GPIO_ADNP=y
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
CONFIG_GPIO_PCA953X=y
# CONFIG_GPIO_PCA953X_IRQ is not set
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
CONFIG_GPIO_TS4900=y

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
# CONFIG_GPIO_BD9571MWV is not set
CONFIG_GPIO_DA9052=y
# CONFIG_GPIO_DA9055 is not set
CONFIG_GPIO_KEMPLD=y
# CONFIG_GPIO_LP3943 is not set
# CONFIG_GPIO_LP873X is not set
CONFIG_GPIO_LP87565=y
# CONFIG_GPIO_MADERA is not set
CONFIG_GPIO_PALMAS=y
CONFIG_GPIO_RC5T583=y
CONFIG_GPIO_STMPE=y
CONFIG_GPIO_TPS65910=y
CONFIG_GPIO_TPS65912=y
CONFIG_GPIO_TWL4030=y
CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2482=y
CONFIG_W1_MASTER_MXC=y
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=y

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
CONFIG_W1_SLAVE_SMEM=y
# CONFIG_W1_SLAVE_DS2405 is not set
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
# CONFIG_W1_SLAVE_DS28E04 is not set
CONFIG_W1_SLAVE_DS28E17=y
# CONFIG_POWER_AVS is not set
# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_PDA_POWER is not set
CONFIG_GENERIC_ADC_BATTERY=y
CONFIG_MAX8925_POWER=y
CONFIG_TEST_POWER=y
# CONFIG_BATTERY_88PM860X is not set
CONFIG_CHARGER_ADP5061=y
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_DS2760=y
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_LEGO_EV3=y
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=y
# CONFIG_BATTERY_BQ27XXX is not set
CONFIG_BATTERY_DA9030=y
CONFIG_BATTERY_DA9052=y
CONFIG_BATTERY_DA9150=y
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_BATTERY_TWL4030_MADC=y
CONFIG_CHARGER_PCF50633=y
CONFIG_BATTERY_RX51=y
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_TWL4030 is not set
CONFIG_CHARGER_LP8727=y
# CONFIG_CHARGER_LP8788 is not set
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
# CONFIG_CHARGER_LTC3651 is not set
CONFIG_CHARGER_MAX14577=y
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
# CONFIG_CHARGER_MAX77693 is not set
# CONFIG_CHARGER_MAX8998 is not set
CONFIG_CHARGER_QCOM_SMBB=y
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_SMB347=y
CONFIG_CHARGER_TPS65217=y
CONFIG_BATTERY_GAUGE_LTC2941=y
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
CONFIG_CHARGER_RT9455=y
# CONFIG_HWMON is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_OF=y
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
# CONFIG_CLOCK_THERMAL is not set
CONFIG_DEVFREQ_THERMAL=y
# CONFIG_THERMAL_EMULATION is not set
# CONFIG_HISI_THERMAL is not set
# CONFIG_IMX_THERMAL is not set
CONFIG_QORIQ_THERMAL=y
CONFIG_SPEAR_THERMAL=y
CONFIG_ROCKCHIP_THERMAL=y
CONFIG_RCAR_THERMAL=y
CONFIG_RCAR_GEN3_THERMAL=y
# CONFIG_KIRKWOOD_THERMAL is not set
CONFIG_DOVE_THERMAL=y
# CONFIG_ARMADA_THERMAL is not set
CONFIG_DA9062_THERMAL=y

#
# ACPI INT340X thermal drivers
#
CONFIG_MTK_THERMAL=y

#
# Broadcom thermal drivers
#
CONFIG_BCM2835_THERMAL=y
CONFIG_BRCMSTB_THERMAL=y
CONFIG_BCM_NS_THERMAL=y

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=y
# CONFIG_TI_THERMAL is not set
CONFIG_OMAP3_THERMAL=y
# CONFIG_OMAP4_THERMAL is not set
# CONFIG_OMAP5_THERMAL is not set
# CONFIG_DRA752_THERMAL is not set

#
# Samsung thermal drivers
#
CONFIG_EXYNOS_THERMAL=y
# CONFIG_TANGO_THERMAL is not set
CONFIG_QCOM_SPMI_TEMP_ALARM=y
CONFIG_GENERIC_ADC_THERMAL=y

#
# Qualcomm thermal drivers
#
# CONFIG_ZX2967_THERMAL is not set
# CONFIG_UNIPHIER_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_SYSFS=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
# CONFIG_DA9052_WATCHDOG is not set
CONFIG_DA9055_WATCHDOG=y
# CONFIG_DA9063_WATCHDOG is not set
CONFIG_DA9062_WATCHDOG=y
CONFIG_GPIO_WATCHDOG=y
CONFIG_GPIO_WATCHDOG_ARCH_INITCALL=y
CONFIG_MENF21BMC_WATCHDOG=y
# CONFIG_TANGOX_WATCHDOG is not set
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
CONFIG_ASM9260_WATCHDOG=y
CONFIG_AT91RM9200_WATCHDOG=y
CONFIG_AT91SAM9X_WATCHDOG=y
CONFIG_SAMA5D4_WATCHDOG=y
CONFIG_CADENCE_WATCHDOG=y
CONFIG_FTWDT010_WATCHDOG=y
CONFIG_S3C2410_WATCHDOG=y
CONFIG_DW_WATCHDOG=y
CONFIG_EP93XX_WATCHDOG=y
CONFIG_OMAP_WATCHDOG=y
# CONFIG_DAVINCI_WATCHDOG is not set
CONFIG_RN5T618_WATCHDOG=y
CONFIG_SUNXI_WATCHDOG=y
# CONFIG_NPCM7XX_WATCHDOG is not set
CONFIG_TWL4030_WATCHDOG=y
CONFIG_STMP3XXX_RTC_WATCHDOG=y
# CONFIG_NUC900_WATCHDOG is not set
# CONFIG_TS4800_WATCHDOG is not set
CONFIG_TS72XX_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_MAX77620_WATCHDOG=y
CONFIG_IMX2_WDT=y
CONFIG_RETU_WATCHDOG=y
CONFIG_MOXART_WDT=y
CONFIG_SIRFSOC_WATCHDOG=y
# CONFIG_ST_LPC_WATCHDOG is not set
CONFIG_TEGRA_WATCHDOG=y
CONFIG_QCOM_WDT=y
CONFIG_MESON_GXBB_WATCHDOG=y
CONFIG_MESON_WATCHDOG=y
CONFIG_MEDIATEK_WATCHDOG=y
CONFIG_DIGICOLOR_WATCHDOG=y
# CONFIG_LPC18XX_WATCHDOG is not set
# CONFIG_ATLAS7_WATCHDOG is not set
# CONFIG_RENESAS_WDT is not set
CONFIG_RENESAS_RZAWDT=y
# CONFIG_ASPEED_WATCHDOG is not set
# CONFIG_UNIPHIER_WATCHDOG is not set
CONFIG_RTD119X_WATCHDOG=y
CONFIG_SPRD_WATCHDOG=y
# CONFIG_SC520_WDT is not set
CONFIG_KEMPLD_WDT=y
CONFIG_BCM47XX_WDT=y
CONFIG_BCM2835_WDT=y
CONFIG_BCM_KONA_WDT=y
# CONFIG_BCM_KONA_WDT_DEBUG is not set
CONFIG_BCM7038_WDT=y
# CONFIG_IMGPDC_WDT is not set
CONFIG_MPC5200_WDT=y
# CONFIG_MV64X60_WDT is not set
CONFIG_MEN_A21_WDT=y
CONFIG_UML_WATCHDOG=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_SOC=y
# CONFIG_BCMA_DRIVER_MIPS is not set
CONFIG_BCMA_SFLASH=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_ACT8945A is not set
# CONFIG_MFD_SUN4I_GPADC is not set
# CONFIG_MFD_AS3711 is not set
CONFIG_MFD_AS3722=y
CONFIG_PMIC_ADP5520=y
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=y
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_CROS_EC is not set
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
CONFIG_MFD_CS47L35=y
# CONFIG_MFD_CS47L85 is not set
# CONFIG_MFD_CS47L90 is not set
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=y
# CONFIG_MFD_EXYNOS_LPASS is not set
# CONFIG_MFD_MC13XXX_I2C is not set
CONFIG_MFD_MXS_LRADC=y
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_MFD_HI6421_PMIC=y
CONFIG_MFD_HI655X_PMIC=y
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
CONFIG_MFD_KEMPLD=y
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77620 is not set
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=y
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6397=y
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
# CONFIG_PCF50633_ADC is not set
CONFIG_PCF50633_GPIO=y
CONFIG_MFD_PM8XXX=y
# CONFIG_MFD_SPMI_PMIC is not set
CONFIG_MFD_RT5033=y
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_RK808 is not set
# CONFIG_MFD_RN5T618 is not set
CONFIG_MFD_SEC_CORE=y
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
CONFIG_MFD_SKY81452=y
# CONFIG_MFD_SMSC is not set
CONFIG_ABX500_CORE=y
# CONFIG_AB3100_CORE is not set
CONFIG_MFD_STMPE=y

#
# STMicroelectronics STMPE Interface Drivers
#
# CONFIG_STMPE_I2C is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=y
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TI_LP87565=y
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_MFD_TPS80031 is not set
CONFIG_TWL4030_CORE=y
# CONFIG_MFD_TWL4030_AUDIO is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TC3589X is not set
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
CONFIG_MFD_STW481X=y
CONFIG_MFD_ROHM_BD718XX=y
# CONFIG_MFD_STM32_LPTIMER is not set
CONFIG_MFD_STM32_TIMERS=y
# CONFIG_RAVE_SP_CORE is not set
CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM8607=y
CONFIG_REGULATOR_ACT8865=y
# CONFIG_REGULATOR_AD5398 is not set
CONFIG_REGULATOR_ANATOP=y
# CONFIG_REGULATOR_AS3722 is not set
# CONFIG_REGULATOR_BD718XX is not set
# CONFIG_REGULATOR_BD9571MWV is not set
# CONFIG_REGULATOR_DA903X is not set
CONFIG_REGULATOR_DA9052=y
CONFIG_REGULATOR_DA9055=y
CONFIG_REGULATOR_DA9062=y
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_GPIO is not set
CONFIG_REGULATOR_HI6421=y
# CONFIG_REGULATOR_HI6421V530 is not set
CONFIG_REGULATOR_HI655X=y
CONFIG_REGULATOR_ISL9305=y
# CONFIG_REGULATOR_ISL6271A is not set
# CONFIG_REGULATOR_LM363X is not set
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP873X=y
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP87565=y
# CONFIG_REGULATOR_LP8788 is not set
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX8649=y
# CONFIG_REGULATOR_MAX8660 is not set
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8925=y
CONFIG_REGULATOR_MAX8952=y
# CONFIG_REGULATOR_MAX8973 is not set
CONFIG_REGULATOR_MAX8998=y
CONFIG_REGULATOR_MAX77686=y
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6323=y
# CONFIG_REGULATOR_MT6380 is not set
CONFIG_REGULATOR_MT6397=y
CONFIG_REGULATOR_PALMAS=y
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCF50633=y
# CONFIG_REGULATOR_PFUZE100 is not set
CONFIG_REGULATOR_PV88060=y
# CONFIG_REGULATOR_PV88080 is not set
# CONFIG_REGULATOR_PV88090 is not set
# CONFIG_REGULATOR_QCOM_RPMH is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RT5033=y
# CONFIG_REGULATOR_S2MPA01 is not set
# CONFIG_REGULATOR_S2MPS11 is not set
CONFIG_REGULATOR_S5M8767=y
# CONFIG_REGULATOR_SC2731 is not set
CONFIG_REGULATOR_SKY81452=y
# CONFIG_REGULATOR_STM32_VREFBUF is not set
CONFIG_REGULATOR_STW481X_VMMC=y
CONFIG_REGULATOR_SY8106A=y
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS62360=y
CONFIG_REGULATOR_TPS65023=y
# CONFIG_REGULATOR_TPS6507X is not set
# CONFIG_REGULATOR_TPS65132 is not set
# CONFIG_REGULATOR_TPS65217 is not set
CONFIG_REGULATOR_TPS65910=y
# CONFIG_REGULATOR_TPS65912 is not set
CONFIG_REGULATOR_TWL4030=y
CONFIG_REGULATOR_UNIPHIER=y
CONFIG_REGULATOR_VCTRL=y
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
CONFIG_MEDIA_SUPPORT=y

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_MEDIA_CONTROLLER=y
CONFIG_VIDEO_DEV=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_V4L2=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
# CONFIG_V4L2_FLASH_LED_CLASS is not set
CONFIG_V4L2_FWNODE=y

#
# Media drivers
#
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_CEC_PLATFORM_DRIVERS is not set

#
# Supported MMC/SDIO adapters
#
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_VMALLOC=y

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# I2C Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_TVAUDIO=y
CONFIG_VIDEO_TDA7432=y
# CONFIG_VIDEO_TDA9840 is not set
CONFIG_VIDEO_TEA6415C=y
CONFIG_VIDEO_TEA6420=y
CONFIG_VIDEO_MSP3400=y
CONFIG_VIDEO_CS3308=y
CONFIG_VIDEO_CS5345=y
CONFIG_VIDEO_CS53L32A=y
CONFIG_VIDEO_TLV320AIC23B=y
# CONFIG_VIDEO_UDA1342 is not set
# CONFIG_VIDEO_WM8775 is not set
# CONFIG_VIDEO_WM8739 is not set
CONFIG_VIDEO_VP27SMPX=y
# CONFIG_VIDEO_SONY_BTF_MPX is not set

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
CONFIG_VIDEO_ADV7183=y
CONFIG_VIDEO_ADV748X=y
CONFIG_VIDEO_ADV7604=y
CONFIG_VIDEO_ADV7604_CEC=y
CONFIG_VIDEO_ADV7842=y
CONFIG_VIDEO_ADV7842_CEC=y
# CONFIG_VIDEO_BT819 is not set
CONFIG_VIDEO_BT856=y
CONFIG_VIDEO_BT866=y
CONFIG_VIDEO_KS0127=y
# CONFIG_VIDEO_ML86V7667 is not set
# CONFIG_VIDEO_AD5820 is not set
CONFIG_VIDEO_AK7375=y
# CONFIG_VIDEO_DW9714 is not set
# CONFIG_VIDEO_DW9807_VCM is not set
CONFIG_VIDEO_SAA7110=y
CONFIG_VIDEO_SAA711X=y
CONFIG_VIDEO_TC358743=y
CONFIG_VIDEO_TC358743_CEC=y
CONFIG_VIDEO_TVP514X=y
CONFIG_VIDEO_TVP5150=y
# CONFIG_VIDEO_TVP7002 is not set
CONFIG_VIDEO_TW2804=y
CONFIG_VIDEO_TW9903=y
CONFIG_VIDEO_TW9906=y
CONFIG_VIDEO_TW9910=y
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=y
CONFIG_VIDEO_CX25840=y

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=y
CONFIG_VIDEO_SAA7185=y
CONFIG_VIDEO_ADV7170=y
CONFIG_VIDEO_ADV7175=y
CONFIG_VIDEO_ADV7343=y
# CONFIG_VIDEO_ADV7393 is not set
CONFIG_VIDEO_ADV7511=y
# CONFIG_VIDEO_ADV7511_CEC is not set
# CONFIG_VIDEO_AD9389B is not set
CONFIG_VIDEO_AK881X=y
CONFIG_VIDEO_THS8200=y

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=y
CONFIG_VIDEO_IMX258=y
CONFIG_VIDEO_IMX274=y
CONFIG_VIDEO_OV2640=y
CONFIG_VIDEO_OV2659=y
CONFIG_VIDEO_OV2680=y
CONFIG_VIDEO_OV2685=y
# CONFIG_VIDEO_OV5640 is not set
CONFIG_VIDEO_OV5645=y
# CONFIG_VIDEO_OV5647 is not set
CONFIG_VIDEO_OV6650=y
CONFIG_VIDEO_OV5670=y
# CONFIG_VIDEO_OV5695 is not set
CONFIG_VIDEO_OV7251=y
# CONFIG_VIDEO_OV772X is not set
CONFIG_VIDEO_OV7640=y
# CONFIG_VIDEO_OV7670 is not set
# CONFIG_VIDEO_OV7740 is not set
CONFIG_VIDEO_OV9650=y
# CONFIG_VIDEO_OV13858 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_MT9M032 is not set
# CONFIG_VIDEO_MT9M111 is not set
CONFIG_VIDEO_MT9P031=y
# CONFIG_VIDEO_MT9T001 is not set
CONFIG_VIDEO_MT9T112=y
# CONFIG_VIDEO_MT9V011 is not set
CONFIG_VIDEO_MT9V032=y
CONFIG_VIDEO_MT9V111=y
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_NOON010PC30 is not set
# CONFIG_VIDEO_M5MOLS is not set
CONFIG_VIDEO_RJ54N1=y
# CONFIG_VIDEO_S5K6AA is not set
# CONFIG_VIDEO_S5K6A3 is not set
# CONFIG_VIDEO_S5K4ECGX is not set
CONFIG_VIDEO_S5K5BAF=y
# CONFIG_VIDEO_SMIAPP is not set
CONFIG_VIDEO_ET8EK8=y

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
CONFIG_VIDEO_LM3560=y
CONFIG_VIDEO_LM3646=y

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=y
# CONFIG_VIDEO_UPD64083 is not set

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=y

#
# SDR tuner chips
#

#
# Miscellaneous helper chips
#
CONFIG_VIDEO_THS7303=y
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_I2C=y

#
# Sensors used on soc_camera driver
#

#
# SPI helper chips
#

#
# Customise DVB Frontends
#

#
# Tools to develop new frontends
#

#
# Graphics support
#
CONFIG_IMX_IPUV3_CORE=y
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DEBUG_MM=y
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=y
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
# CONFIG_DRM_I2C_SIL164 is not set
CONFIG_DRM_I2C_NXP_TDA998X=y
CONFIG_DRM_I2C_NXP_TDA9950=y

#
# ACP (Audio CoProcessor) Configuration
#

#
# AMD Library routines
#
# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_RCAR_DW_HDMI is not set
# CONFIG_DRM_RCAR_LVDS is not set
CONFIG_DRM_VIRTIO_GPU=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_ARM_VERSATILE=y
CONFIG_DRM_PANEL_LVDS=y
CONFIG_DRM_PANEL_SIMPLE=y
CONFIG_DRM_PANEL_ILITEK_ILI9881C=y
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=y
# CONFIG_DRM_PANEL_JDI_LT070ME05000 is not set
CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=y
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
# CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
CONFIG_DRM_PANEL_SHARP_LS043T1LE01=y
CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
CONFIG_DRM_CDNS_DSI=y
# CONFIG_DRM_DUMB_VGA_DAC is not set
# CONFIG_DRM_LVDS_ENCODER is not set
CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=y
# CONFIG_DRM_NXP_PTN3460 is not set
CONFIG_DRM_PARADE_PS8622=y
# CONFIG_DRM_SIL_SII8620 is not set
CONFIG_DRM_SII902X=y
CONFIG_DRM_SII9234=y
CONFIG_DRM_THINE_THC63LVD1024=y
CONFIG_DRM_TOSHIBA_TC358767=y
CONFIG_DRM_TI_TFP410=y
# CONFIG_DRM_I2C_ADV7511 is not set
CONFIG_DRM_V3D=y
CONFIG_DRM_ARCPGU=y
CONFIG_DRM_MXS=y
CONFIG_DRM_MXSFB=y
# CONFIG_DRM_TINYDRM is not set
CONFIG_DRM_PL111=y
CONFIG_DRM_TVE200=y
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CLPS711X is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_TMIO is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_GOLDFISH is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_OMAP2 is not set
CONFIG_BACKLIGHT_LCD_SUPPORT=y
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_GENERIC=y
CONFIG_BACKLIGHT_LM3533=y
# CONFIG_BACKLIGHT_DA903X is not set
CONFIG_BACKLIGHT_DA9052=y
# CONFIG_BACKLIGHT_MAX8925 is not set
# CONFIG_BACKLIGHT_PM8941_WLED is not set
CONFIG_BACKLIGHT_ADP5520=y
CONFIG_BACKLIGHT_ADP8860=y
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_88PM860X is not set
CONFIG_BACKLIGHT_PCF50633=y
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_PANDORA=y
# CONFIG_BACKLIGHT_SKY81452 is not set
CONFIG_BACKLIGHT_TPS65217=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
# CONFIG_LOGO is not set
# CONFIG_SOUND is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
# CONFIG_UWB is not set
# CONFIG_MMC is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=y
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
CONFIG_LEDS_AAT1290=y
CONFIG_LEDS_AS3645A=y
# CONFIG_LEDS_BCM6328 is not set
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3533 is not set
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=y
CONFIG_LEDS_LM3601X=y
# CONFIG_LEDS_MT6323 is not set
# CONFIG_LEDS_GPIO is not set
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=y
# CONFIG_LEDS_LP5521 is not set
# CONFIG_LEDS_LP5523 is not set
# CONFIG_LEDS_LP5562 is not set
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_LP8788=y
CONFIG_LEDS_LP8860=y
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_DA903X=y
CONFIG_LEDS_DA9052=y
# CONFIG_LEDS_REGULATOR is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_ADP5520 is not set
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_MAX77693=y
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_OT200=y
CONFIG_LEDS_KTD2692=y
CONFIG_LEDS_IS31FL319X=y
# CONFIG_LEDS_IS31FL32XX is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
# CONFIG_LEDS_SYSCON is not set
CONFIG_LEDS_PM8058=y
CONFIG_LEDS_MLXREG=y
# CONFIG_LEDS_USER is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_DISK=y
CONFIG_LEDS_TRIGGER_MTD=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
CONFIG_LEDS_TRIGGER_CPU=y
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
# CONFIG_LEDS_TRIGGER_CAMERA is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_ACCESSIBILITY=y
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
CONFIG_RTC_DEBUG=y
# CONFIG_RTC_NVMEM is not set

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
# CONFIG_RTC_INTF_DEV is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=y
CONFIG_RTC_DRV_ABB5ZES3=y
CONFIG_RTC_DRV_ABX80X=y
CONFIG_RTC_DRV_BRCMSTB=y
# CONFIG_RTC_DRV_AS3722 is not set
CONFIG_RTC_DRV_DS1307=y
CONFIG_RTC_DRV_DS1307_CENTURY=y
CONFIG_RTC_DRV_DS1374=y
CONFIG_RTC_DRV_DS1374_WDT=y
# CONFIG_RTC_DRV_DS1672 is not set
CONFIG_RTC_DRV_HYM8563=y
CONFIG_RTC_DRV_LP8788=y
CONFIG_RTC_DRV_MAX6900=y
# CONFIG_RTC_DRV_MAX8907 is not set
# CONFIG_RTC_DRV_MAX8925 is not set
CONFIG_RTC_DRV_MAX8998=y
CONFIG_RTC_DRV_MAX77686=y
CONFIG_RTC_DRV_RS5C372=y
CONFIG_RTC_DRV_ISL1208=y
# CONFIG_RTC_DRV_ISL12022 is not set
CONFIG_RTC_DRV_ISL12026=y
CONFIG_RTC_DRV_X1205=y
# CONFIG_RTC_DRV_PCF8523 is not set
CONFIG_RTC_DRV_PCF85063=y
CONFIG_RTC_DRV_PCF85363=y
# CONFIG_RTC_DRV_PCF8563 is not set
CONFIG_RTC_DRV_PCF8583=y
CONFIG_RTC_DRV_M41T80=y
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=y
# CONFIG_RTC_DRV_TWL4030 is not set
CONFIG_RTC_DRV_PALMAS=y
CONFIG_RTC_DRV_TPS65910=y
CONFIG_RTC_DRV_RC5T583=y
CONFIG_RTC_DRV_S35390A=y
CONFIG_RTC_DRV_FM3130=y
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=y
CONFIG_RTC_DRV_RX8025=y
# CONFIG_RTC_DRV_EM3027 is not set
CONFIG_RTC_DRV_RV8803=y
CONFIG_RTC_DRV_S5M=y

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=y
# CONFIG_RTC_DRV_PCF2127 is not set
# CONFIG_RTC_DRV_RV3029C2 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_DS1286=y
CONFIG_RTC_DRV_DS1511=y
# CONFIG_RTC_DRV_DS1553 is not set
CONFIG_RTC_DRV_DS1685_FAMILY=y
# CONFIG_RTC_DRV_DS1685 is not set
# CONFIG_RTC_DRV_DS1689 is not set
CONFIG_RTC_DRV_DS17285=y
# CONFIG_RTC_DRV_DS17485 is not set
# CONFIG_RTC_DRV_DS17885 is not set
CONFIG_RTC_DRV_DS1742=y
CONFIG_RTC_DRV_DS2404=y
# CONFIG_RTC_DRV_DA9052 is not set
# CONFIG_RTC_DRV_DA9055 is not set
CONFIG_RTC_DRV_DA9063=y
CONFIG_RTC_DRV_STK17TA8=y
CONFIG_RTC_DRV_M48T86=y
CONFIG_RTC_DRV_M48T35=y
# CONFIG_RTC_DRV_M48T59 is not set
CONFIG_RTC_DRV_MSM6242=y
CONFIG_RTC_DRV_BQ4802=y
CONFIG_RTC_DRV_RP5C01=y
# CONFIG_RTC_DRV_V3020 is not set
CONFIG_RTC_DRV_SC27XX=y
# CONFIG_RTC_DRV_SPEAR is not set
# CONFIG_RTC_DRV_PCF50633 is not set
# CONFIG_RTC_DRV_NUC900 is not set
CONFIG_RTC_DRV_ZYNQMP=y

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_ASM9260=y
# CONFIG_RTC_DRV_DAVINCI is not set
CONFIG_RTC_DRV_DIGICOLOR=y
# CONFIG_RTC_DRV_OMAP is not set
CONFIG_RTC_DRV_S3C=y
CONFIG_RTC_DRV_EP93XX=y
# CONFIG_RTC_DRV_VR41XX is not set
CONFIG_RTC_DRV_AT91RM9200=y
CONFIG_RTC_DRV_AT91SAM9=y
CONFIG_RTC_DRV_GENERIC=y
# CONFIG_RTC_DRV_VT8500 is not set
CONFIG_RTC_DRV_SUN6I=y
# CONFIG_RTC_DRV_SUNXI is not set
# CONFIG_RTC_DRV_TX4939 is not set
CONFIG_RTC_DRV_MV=y
CONFIG_RTC_DRV_ARMADA38X=y
# CONFIG_RTC_DRV_FTRTC010 is not set
# CONFIG_RTC_DRV_COH901331 is not set
CONFIG_RTC_DRV_STMP=y
CONFIG_RTC_DRV_JZ4740=y
# CONFIG_RTC_DRV_LPC24XX is not set
CONFIG_RTC_DRV_LPC32XX=y
CONFIG_RTC_DRV_PM8XXX=y
# CONFIG_RTC_DRV_TEGRA is not set
CONFIG_RTC_DRV_SNVS=y
CONFIG_RTC_DRV_MOXART=y
CONFIG_RTC_DRV_MT6397=y
CONFIG_RTC_DRV_MT7622=y
# CONFIG_RTC_DRV_XGENE is not set
CONFIG_RTC_DRV_R7301=y
CONFIG_RTC_DRV_STM32=y
CONFIG_RTC_DRV_RTD119X=y

#
# HID Sensor RTC drivers
#
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_AUXDISPLAY=y
CONFIG_HD44780=y
CONFIG_IMG_ASCII_LCD=y
CONFIG_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
CONFIG_CHARLCD=y
CONFIG_UIO=y
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_UIO_PRUSS is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_MMIO=y
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y

#
# Microsoft Hyper-V guest support
#
CONFIG_STAGING=y
# CONFIG_COMEDI is not set

#
# IIO staging drivers
#

#
# Accelerometers
#

#
# Analog to digital converters
#
# CONFIG_AD7606 is not set

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=y
CONFIG_ADT7316_I2C=y

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
# CONFIG_AD7152 is not set
CONFIG_AD7746=y

#
# Direct Digital Synthesis
#

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set

#
# Active energy metering IC
#
# CONFIG_ADE7854 is not set

#
# Resolver to digital converters
#

#
# Speakup console speech
#
# CONFIG_STAGING_MEDIA is not set

#
# Android
#
CONFIG_STAGING_BOARD=y
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
CONFIG_COMMON_CLK_XLNX_CLKWZRD=y
CONFIG_MOST=y
CONFIG_MOST_CDEV=y
# CONFIG_MOST_VIDEO is not set
CONFIG_MOST_DIM2=y
CONFIG_MOST_I2C=y
CONFIG_GREYBUS=y
# CONFIG_GREYBUS_BOOTROM is not set
CONFIG_GREYBUS_LIGHT=y
CONFIG_GREYBUS_LOG=y
# CONFIG_GREYBUS_LOOPBACK is not set
# CONFIG_GREYBUS_POWER is not set
CONFIG_GREYBUS_RAW=y
CONFIG_GREYBUS_VIBRATOR=y
# CONFIG_GREYBUS_BRIDGED_PHY is not set
CONFIG_GREYBUS_ARCHE=y
CONFIG_BCM_VIDEOCORE=y
CONFIG_BCM2835_VCHIQ=y
# CONFIG_VIDEO_BCM2835 is not set

#
# Gasket devices
#
# CONFIG_XIL_AXIS_FIFO is not set
# CONFIG_EROFS_FS is not set
CONFIG_CHROME_PLATFORMS=y
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
# CONFIG_COMMON_CLK_VERSATILE is not set
CONFIG_CLK_HSDK=y
CONFIG_COMMON_CLK_MAX77686=y
CONFIG_COMMON_CLK_MAX9485=y
# CONFIG_COMMON_CLK_HI655X is not set
CONFIG_COMMON_CLK_SCMI=y
CONFIG_COMMON_CLK_SCPI=y
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI514=y
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_SI570 is not set
CONFIG_COMMON_CLK_CDCE706=y
CONFIG_COMMON_CLK_CDCE925=y
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_GEMINI is not set
CONFIG_COMMON_CLK_ASPEED=y
# CONFIG_COMMON_CLK_S2MPS11 is not set
CONFIG_COMMON_CLK_AXI_CLKGEN=y
CONFIG_CLK_QORIQ=y
CONFIG_COMMON_CLK_XGENE=y
# CONFIG_COMMON_CLK_PALMAS is not set
# CONFIG_COMMON_CLK_OXNAS is not set
CONFIG_COMMON_CLK_VC5=y
CONFIG_CLK_ACTIONS=y
# CONFIG_CLK_OWL_S700 is not set
CONFIG_CLK_OWL_S900=y
# CONFIG_CLK_BCM_63XX is not set
CONFIG_CLK_BCM_KONA=y
CONFIG_COMMON_CLK_IPROC=y
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
CONFIG_CLK_BCM_NSP=y
# CONFIG_CLK_BCM_NS2 is not set
CONFIG_CLK_BCM_SR=y
# CONFIG_COMMON_CLK_HI3516CV300 is not set
# CONFIG_COMMON_CLK_HI3519 is not set
CONFIG_COMMON_CLK_HI3660=y
# CONFIG_COMMON_CLK_HI3798CV200 is not set
CONFIG_COMMON_CLK_HI6220=y
# CONFIG_RESET_HISI is not set
# CONFIG_STUB_CLK_HI6220 is not set
# CONFIG_STUB_CLK_HI3660 is not set
CONFIG_COMMON_CLK_BOSTON=y
# CONFIG_COMMON_CLK_KEYSTONE is not set

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
CONFIG_COMMON_CLK_MT6797=y
CONFIG_COMMON_CLK_MT6797_MMSYS=y
# CONFIG_COMMON_CLK_MT6797_IMGSYS is not set
CONFIG_COMMON_CLK_MT6797_VDECSYS=y
CONFIG_COMMON_CLK_MT6797_VENCSYS=y
CONFIG_COMMON_CLK_MT7622=y
CONFIG_COMMON_CLK_MT7622_ETHSYS=y
CONFIG_COMMON_CLK_MT7622_HIFSYS=y
CONFIG_COMMON_CLK_MT7622_AUDSYS=y
# CONFIG_COMMON_CLK_MT8135 is not set
CONFIG_COMMON_CLK_MT8173=y
# CONFIG_COMMON_CLK_QCOM is not set
# CONFIG_SPMI_PMIC_CLKDIV is not set
CONFIG_CLK_RENESAS=y
# CONFIG_CLK_RENESAS_LEGACY is not set
CONFIG_CLK_EMEV2=y
# CONFIG_CLK_RZA1 is not set
# CONFIG_CLK_R8A73A4 is not set
# CONFIG_CLK_R8A7740 is not set
CONFIG_CLK_R8A7743=y
CONFIG_CLK_R8A7745=y
# CONFIG_CLK_R8A77470 is not set
# CONFIG_CLK_R8A7778 is not set
CONFIG_CLK_R8A7779=y
# CONFIG_CLK_R8A7790 is not set
CONFIG_CLK_R8A7791=y
CONFIG_CLK_R8A7792=y
# CONFIG_CLK_R8A7794 is not set
# CONFIG_CLK_R8A7795 is not set
# CONFIG_CLK_R8A7796 is not set
CONFIG_CLK_R8A77965=y
CONFIG_CLK_R8A77970=y
CONFIG_CLK_R8A77980=y
CONFIG_CLK_R8A77990=y
CONFIG_CLK_R8A77995=y
# CONFIG_CLK_R9A06G032 is not set
CONFIG_CLK_SH73A0=y
# CONFIG_CLK_RCAR_GEN2 is not set
CONFIG_CLK_RCAR_GEN2_CPG=y
CONFIG_CLK_RCAR_GEN3_CPG=y
# CONFIG_CLK_RCAR_USB2_CLOCK_SEL is not set
CONFIG_CLK_RENESAS_CPG_MSSR=y
CONFIG_CLK_RENESAS_CPG_MSTP=y
CONFIG_CLK_RENESAS_DIV6=y
CONFIG_COMMON_CLK_SAMSUNG=y
CONFIG_EXYNOS_ARM64_COMMON_CLK=y
# CONFIG_EXYNOS_AUDSS_CLK_CON is not set
# CONFIG_S3C2410_COMMON_CLK is not set
# CONFIG_S3C2412_COMMON_CLK is not set
# CONFIG_S3C2443_COMMON_CLK is not set
CONFIG_SPRD_COMMON_CLK=y
# CONFIG_SPRD_SC9860_CLK is not set
# CONFIG_SUNXI_CCU is not set
# CONFIG_COMMON_CLK_TI_ADPLL is not set
CONFIG_CLK_UNIPHIER=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
CONFIG_BCM2835_TIMER=y
CONFIG_BCM_KONA_TIMER=y
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
CONFIG_FTTMR010_TIMER=y
CONFIG_MESON6_TIMER=y
CONFIG_OWL_TIMER=y
CONFIG_SUN4I_TIMER=y
# CONFIG_SUN5I_HSTIMER is not set
CONFIG_VT8500_TIMER=y
CONFIG_NPCM7XX_TIMER=y
CONFIG_CADENCE_TTC_TIMER=y
CONFIG_ASM9260_TIMER=y
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_ATLAS7_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_PRIMA2_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_ARMV7M_SYSTICK is not set
CONFIG_ATMEL_ST=y
CONFIG_CLKSRC_SAMSUNG_PWM=y
# CONFIG_FSL_FTM_TIMER is not set
CONFIG_OXNAS_RPS_TIMER=y
# CONFIG_MTK_TIMER is not set
# CONFIG_SPRD_TIMER is not set
CONFIG_CLKSRC_JCORE_PIT=y
CONFIG_SH_TIMER_CMT=y
CONFIG_SH_TIMER_MTU2=y
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
CONFIG_EM_TIMER_STI=y
CONFIG_CLKSRC_PXA=y
# CONFIG_H8300_TMR8 is not set
# CONFIG_H8300_TMR16 is not set
# CONFIG_H8300_TPU is not set
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_ATCPIT100_TIMER is not set
CONFIG_RISCV_TIMER=y
CONFIG_MAILBOX=y
CONFIG_IMX_MBOX=y
# CONFIG_PLATFORM_MHU is not set
# CONFIG_ROCKCHIP_MBOX is not set
# CONFIG_ALTERA_MBOX is not set
CONFIG_HI3660_MBOX=y
CONFIG_HI6220_MBOX=y
CONFIG_MAILBOX_TEST=y
# CONFIG_QCOM_APCS_IPC is not set
# CONFIG_BCM_PDC_MBOX is not set
CONFIG_MTK_CMDQ_MBOX=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
CONFIG_IOMMU_IO_PGTABLE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST=y
CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST=y
CONFIG_IOMMU_DEBUGFS=y
# CONFIG_QCOM_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_QCOM_GLINK_NATIVE=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
# CONFIG_RPMSG_VIRTIO is not set

#
# SOC (System On Chip) specific Drivers
#
# CONFIG_OWL_PM_DOMAINS is not set

#
# Amlogic SoC drivers
#
CONFIG_MESON_GX_SOCINFO=y
CONFIG_MESON_GX_PM_DOMAINS=y
# CONFIG_MESON_MX_SOCINFO is not set
# CONFIG_AT91_SOC_ID is not set

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BRCMSTB is not set

#
# NXP/Freescale QorIQ SoC drivers
#

#
# i.MX SoC drivers
#
# CONFIG_IMX7_PM_DOMAINS is not set

#
# MediaTek SoC drivers
#
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=y
# CONFIG_MTK_SCPSYS is not set

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_GENI_SE=y
CONFIG_QCOM_RPMH=y
CONFIG_SOC_RENESAS=y
CONFIG_SYSC_R8A7743=y
CONFIG_SYSC_R8A7745=y
CONFIG_SYSC_R8A77470=y
# CONFIG_SYSC_R8A7779 is not set
# CONFIG_SYSC_R8A7790 is not set
CONFIG_SYSC_R8A7791=y
CONFIG_SYSC_R8A7792=y
CONFIG_SYSC_R8A7794=y
# CONFIG_SYSC_R8A7795 is not set
# CONFIG_SYSC_R8A7796 is not set
# CONFIG_SYSC_R8A77965 is not set
CONFIG_SYSC_R8A77970=y
CONFIG_SYSC_R8A77980=y
# CONFIG_SYSC_R8A77990 is not set
# CONFIG_SYSC_R8A77995 is not set
CONFIG_RST_RCAR=y
CONFIG_SYSC_RCAR=y
CONFIG_ROCKCHIP_GRF=y
# CONFIG_ROCKCHIP_PM_DOMAINS is not set
# CONFIG_SOC_SAMSUNG is not set
CONFIG_SOC_TI=y
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# CONFIG_XILINX_VCU is not set
# CONFIG_SOC_ZTE is not set
CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_MAX14577=y
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_PALMAS=y
CONFIG_EXTCON_QCOM_SPMI_MISC=y
# CONFIG_EXTCON_RT8973A is not set
# CONFIG_EXTCON_SM5502 is not set
# CONFIG_EXTCON_USB_GPIO is not set
CONFIG_MEMORY=y
CONFIG_JZ4780_NEMC=y
# CONFIG_SAMSUNG_MC is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
CONFIG_IIO_SW_TRIGGER=y

#
# Accelerometers
#
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=y
CONFIG_BMA180=y
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_DA280=y
# CONFIG_DA311 is not set
CONFIG_DMARD06=y
CONFIG_DMARD09=y
# CONFIG_DMARD10 is not set
# CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
# CONFIG_IIO_ST_ACCEL_3AXIS is not set
CONFIG_KXSD9=y
# CONFIG_KXSD9_I2C is not set
CONFIG_KXCJK1013=y
# CONFIG_MC3230 is not set
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7660=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=y
CONFIG_MXC4005=y
CONFIG_MXC6255=y
# CONFIG_STK8312 is not set
CONFIG_STK8BA50=y

#
# Analog to digital converters
#
CONFIG_AD7291=y
CONFIG_AD799X=y
CONFIG_ASPEED_ADC=y
# CONFIG_AT91_SAMA5D2_ADC is not set
# CONFIG_BCM_IPROC_ADC is not set
CONFIG_CC10001_ADC=y
# CONFIG_DA9150_GPADC is not set
CONFIG_ENVELOPE_DETECTOR=y
CONFIG_EXYNOS_ADC=y
CONFIG_MXS_LRADC_ADC=y
# CONFIG_HX711 is not set
CONFIG_INA2XX_ADC=y
CONFIG_IMX7D_ADC=y
CONFIG_LP8788_ADC=y
CONFIG_LPC18XX_ADC=y
CONFIG_LPC32XX_ADC=y
CONFIG_LTC2471=y
# CONFIG_LTC2485 is not set
CONFIG_LTC2497=y
# CONFIG_MAX1363 is not set
CONFIG_MAX9611=y
CONFIG_MCP3422=y
CONFIG_MEDIATEK_MT6577_AUXADC=y
CONFIG_MESON_SARADC=y
CONFIG_NAU7802=y
CONFIG_PALMAS_GPADC=y
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_PM8XXX_XOADC=y
# CONFIG_QCOM_SPMI_IADC is not set
# CONFIG_QCOM_SPMI_VADC is not set
CONFIG_RCAR_GYRO_ADC=y
CONFIG_SC27XX_ADC=y
CONFIG_SPEAR_ADC=y
CONFIG_SD_ADC_MODULATOR=y
# CONFIG_STM32_ADC_CORE is not set
CONFIG_STM32_DFSDM_CORE=y
# CONFIG_STM32_DFSDM_ADC is not set
CONFIG_TI_ADC081C=y
CONFIG_TI_ADS1015=y
# CONFIG_TI_AM335X_ADC is not set
CONFIG_TWL4030_MADC=y
# CONFIG_TWL6030_GPADC is not set
# CONFIG_VF610_ADC is not set
CONFIG_XILINX_XADC=y

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=y

#
# Amplifiers
#

#
# Chemical Sensors
#
# CONFIG_ATLAS_PH_SENSOR is not set
CONFIG_BME680=y
CONFIG_BME680_I2C=y
CONFIG_CCS811=y
# CONFIG_IAQCORE is not set
# CONFIG_VZ89X is not set

#
# Hid Sensor IIO Common
#
CONFIG_IIO_MS_SENSORS_I2C=y

#
# SSP Sensor Common
#
CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Counters
#
# CONFIG_STM32_LPTIMER_CNT is not set

#
# Digital to analog converters
#
CONFIG_AD5064=y
# CONFIG_AD5380 is not set
# CONFIG_AD5446 is not set
# CONFIG_AD5593R is not set
# CONFIG_AD5696_I2C is not set
CONFIG_DPOT_DAC=y
CONFIG_DS4424=y
# CONFIG_LPC18XX_DAC is not set
# CONFIG_M62332 is not set
CONFIG_MAX517=y
CONFIG_MAX5821=y
# CONFIG_MCP4725 is not set
CONFIG_STM32_DAC=y
CONFIG_STM32_DAC_CORE=y
CONFIG_TI_DAC5571=y
CONFIG_VF610_DAC=y

#
# IIO dummy driver
#
CONFIG_IIO_SIMPLE_DUMMY=y
# CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#

#
# Phase-Locked Loop (PLL) frequency synthesizers
#

#
# Digital gyroscope sensors
#
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
CONFIG_IIO_ST_GYRO_3AXIS=y
CONFIG_IIO_ST_GYRO_I2C_3AXIS=y
CONFIG_ITG3200=y

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=y
CONFIG_MAX30100=y
# CONFIG_MAX30102 is not set

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
CONFIG_DHT11=y
CONFIG_HDC100X=y
# CONFIG_HTS221 is not set
CONFIG_HTU21=y
CONFIG_SI7005=y
# CONFIG_SI7020 is not set

#
# Inertial measurement units
#
# CONFIG_BMI160_I2C is not set
# CONFIG_KMX61 is not set
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=y
# CONFIG_IIO_ST_LSM6DSX is not set

#
# Light sensors
#
# CONFIG_ADJD_S311 is not set
CONFIG_AL3320A=y
CONFIG_APDS9300=y
# CONFIG_APDS9960 is not set
CONFIG_BH1750=y
# CONFIG_BH1780 is not set
CONFIG_CM32181=y
CONFIG_CM3232=y
# CONFIG_CM3323 is not set
CONFIG_CM3605=y
CONFIG_CM36651=y
CONFIG_GP2AP020A00F=y
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_SENSORS_ISL29028=y
CONFIG_ISL29125=y
# CONFIG_JSA1212 is not set
# CONFIG_RPR0521 is not set
# CONFIG_SENSORS_LM3533 is not set
# CONFIG_LTR501 is not set
CONFIG_LV0104CS=y
CONFIG_MAX44000=y
CONFIG_OPT3001=y
CONFIG_PA12203001=y
CONFIG_SI1133=y
# CONFIG_SI1145 is not set
CONFIG_STK3310=y
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
CONFIG_TCS3414=y
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=y
# CONFIG_TSL2583 is not set
CONFIG_TSL2772=y
# CONFIG_TSL4531 is not set
# CONFIG_US5182D is not set
CONFIG_VCNL4000=y
# CONFIG_VEML6070 is not set
CONFIG_VL6180=y
CONFIG_ZOPT2201=y

#
# Magnetometer sensors
#
CONFIG_AK8974=y
CONFIG_AK8975=y
CONFIG_AK09911=y
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
# CONFIG_MAG3110 is not set
# CONFIG_MMC35240 is not set
# CONFIG_IIO_ST_MAGN_3AXIS is not set
# CONFIG_SENSORS_HMC5843_I2C is not set

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set

#
# Inclinometer sensors
#

#
# Triggers - standalone
#
# CONFIG_IIO_HRTIMER_TRIGGER is not set
CONFIG_IIO_INTERRUPT_TRIGGER=y
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
CONFIG_IIO_STM32_TIMER_TRIGGER=y
CONFIG_IIO_TIGHTLOOP_TRIGGER=y
CONFIG_IIO_SYSFS_TRIGGER=y

#
# Digital potentiometers
#
# CONFIG_AD5272 is not set
CONFIG_DS1803=y
# CONFIG_MCP4018 is not set
CONFIG_MCP4531=y
CONFIG_TPL0102=y

#
# Digital potentiostats
#
CONFIG_LMP91000=y

#
# Pressure sensors
#
CONFIG_ABP060MG=y
CONFIG_BMP280=y
CONFIG_BMP280_I2C=y
CONFIG_HP03=y
# CONFIG_MPL115_I2C is not set
CONFIG_MPL3115=y
# CONFIG_MS5611 is not set
CONFIG_MS5637=y
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=y
CONFIG_T5403=y
# CONFIG_HP206C is not set
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y

#
# Lightning sensors
#

#
# Proximity and distance sensors
#
# CONFIG_ISL29501 is not set
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_RFD77402=y
CONFIG_SRF04=y
CONFIG_SX9500=y
# CONFIG_SRF08 is not set

#
# Resolver to digital converters
#

#
# Temperature sensors
#
# CONFIG_MLX90614 is not set
# CONFIG_MLX90632 is not set
CONFIG_TMP006=y
CONFIG_TMP007=y
CONFIG_TSYS01=y
# CONFIG_TSYS02D is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_ARM_GIC_MAX_NR=1
CONFIG_JCORE_AIC=y
# CONFIG_TS4800_IRQ is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
CONFIG_SIFIVE_PLIC=y
# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_ATH79=y
# CONFIG_RESET_AXS10X is not set
CONFIG_RESET_BERLIN=y
CONFIG_RESET_HSDK=y
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_PISTACHIO is not set
CONFIG_RESET_QCOM_AOSS=y
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_STM32MP157 is not set
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_UNIPHIER=y
# CONFIG_RESET_UNIPHIER_USB3 is not set
# CONFIG_RESET_ZYNQ is not set
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y
# CONFIG_FMC is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_PHY_LPC18XX_USB_OTG=y
# CONFIG_PHY_XGENE is not set
CONFIG_PHY_CYGNUS_PCIE=y
CONFIG_BCM_KONA_USB2_PHY=y
# CONFIG_PHY_BCM_NS_USB2 is not set
CONFIG_PHY_NS2_USB_DRD=y
# CONFIG_PHY_BRCM_SATA is not set
CONFIG_PHY_BCM_SR_PCIE=y
# CONFIG_PHY_HI6220_USB is not set
CONFIG_PHY_HISTB_COMBPHY=y
# CONFIG_PHY_HISI_INNO_USB2 is not set
CONFIG_PHY_LANTIQ_RCU_USB2=y
CONFIG_ARMADA375_USBCLUSTER_PHY=y
# CONFIG_PHY_MVEBU_CP110_COMPHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_ATH79_USB=y
# CONFIG_PHY_QCOM_QMP is not set
# CONFIG_PHY_QCOM_QUSB2 is not set
# CONFIG_PHY_RALINK_USB is not set
CONFIG_PHY_RCAR_GEN3_USB3=y
# CONFIG_PHY_ROCKCHIP_PCIE is not set
CONFIG_PHY_ROCKCHIP_TYPEC=y
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
# CONFIG_PHY_EXYNOS_PCIE is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
CONFIG_PHY_STIH407_USB=y
CONFIG_PHY_STM32_USBPHYC=y
CONFIG_OMAP_CONTROL_PHY=y
# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# CONFIG_RAS is not set

#
# Android
#
# CONFIG_ANDROID is not set
# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_IMX_IIM=y
# CONFIG_NVMEM_IMX_OCOTP is not set
CONFIG_NVMEM_LPC18XX_EEPROM=y
CONFIG_NVMEM_LPC18XX_OTP=y
CONFIG_NVMEM_MXS_OCOTP=y
# CONFIG_MTK_EFUSE is not set
# CONFIG_QCOM_QFPROM is not set
# CONFIG_ROCKCHIP_EFUSE is not set
CONFIG_NVMEM_BCM_OCOTP=y
# CONFIG_UNIPHIER_EFUSE is not set
CONFIG_NVMEM_VF610_OCOTP=y
# CONFIG_MESON_MX_EFUSE is not set
CONFIG_NVMEM_SNVS_LPGPR=y
# CONFIG_SC27XX_EFUSE is not set

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_DUMMY is not set
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=y
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_GTH=y
CONFIG_INTEL_TH_STH=y
# CONFIG_INTEL_TH_MSU is not set
# CONFIG_INTEL_TH_PTI is not set
CONFIG_INTEL_TH_DEBUG=y
# CONFIG_FPGA is not set
CONFIG_FSI=y
CONFIG_FSI_NEW_DEV_NODE=y
CONFIG_FSI_MASTER_GPIO=y
# CONFIG_FSI_MASTER_HUB is not set
CONFIG_FSI_SCOM=y
# CONFIG_FSI_SBEFIFO is not set
CONFIG_TEE=y

#
# TEE drivers
#
CONFIG_PM_OPP=y
CONFIG_SIOX=y
# CONFIG_SIOX_BUS_GPIO is not set
# CONFIG_SLIMBUS is not set

#
# File systems
#
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
CONFIG_EXT3_FS=y
# CONFIG_EXT3_FS_POSIX_ACL is not set
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_USE_FOR_EXT2=y
# CONFIG_EXT4_FS_POSIX_ACL is not set
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_ENCRYPTION is not set
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
CONFIG_REISERFS_CHECK=y
# CONFIG_REISERFS_FS_XATTR is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=y
# CONFIG_XFS_QUOTA is not set
CONFIG_XFS_POSIX_ACL=y
# CONFIG_XFS_RT is not set
# CONFIG_XFS_ONLINE_SCRUB is not set
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=y
CONFIG_BTRFS_FS=y
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
CONFIG_BTRFS_DEBUG=y
CONFIG_BTRFS_ASSERT=y
CONFIG_BTRFS_FS_REF_VERIFY=y
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
CONFIG_F2FS_FS_SECURITY=y
CONFIG_F2FS_CHECK_FS=y
# CONFIG_F2FS_FS_ENCRYPTION is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_FS_DAX is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
# CONFIG_FILE_LOCKING is not set
CONFIG_FS_ENCRYPTION=y
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_QUOTA is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
CONFIG_FSCACHE=y
CONFIG_FSCACHE_DEBUG=y
CONFIG_CACHEFILES=y
CONFIG_CACHEFILES_DEBUG=y

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
# CONFIG_ZISOFS is not set
CONFIG_UDF_FS=y

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
CONFIG_FAT_DEFAULT_UTF8=y
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
CONFIG_ADFS_FS=y
# CONFIG_ADFS_FS_RW is not set
CONFIG_AFFS_FS=y
# CONFIG_ECRYPT_FS is not set
CONFIG_HFS_FS=y
CONFIG_HFSPLUS_FS=y
# CONFIG_BEFS_FS is not set
CONFIG_BFS_FS=y
CONFIG_EFS_FS=y
# CONFIG_JFFS2_FS is not set
CONFIG_UBIFS_FS=y
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
# CONFIG_UBIFS_FS_LZO is not set
# CONFIG_UBIFS_FS_ZLIB is not set
# CONFIG_UBIFS_ATIME_SUPPORT is not set
CONFIG_UBIFS_FS_XATTR=y
# CONFIG_UBIFS_FS_ENCRYPTION is not set
CONFIG_UBIFS_FS_SECURITY=y
# CONFIG_CRAMFS is not set
# CONFIG_SQUASHFS is not set
CONFIG_VXFS_FS=y
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
CONFIG_HPFS_FS=y
CONFIG_QNX4FS_FS=y
CONFIG_QNX6FS_FS=y
# CONFIG_QNX6FS_DEBUG is not set
CONFIG_ROMFS_FS=y
# CONFIG_ROMFS_BACKED_BY_BLOCK is not set
# CONFIG_ROMFS_BACKED_BY_MTD is not set
CONFIG_ROMFS_BACKED_BY_BOTH=y
CONFIG_ROMFS_ON_BLOCK=y
CONFIG_ROMFS_ON_MTD=y
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
CONFIG_PSTORE_LZ4_COMPRESS=y
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
CONFIG_PSTORE_ZSTD_COMPRESS=y
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
CONFIG_PSTORE_RAM=y
CONFIG_SYSV_FS=y
# CONFIG_UFS_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
# CONFIG_NLS_ISO8859_8 is not set
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
CONFIG_NLS_ISO8859_5=y
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=y
# CONFIG_NLS_MAC_CENTEURO is not set
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=y

#
# Security options
#
CONFIG_KEYS=y
CONFIG_PERSISTENT_KEYRINGS=y
# CONFIG_BIG_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=y
CONFIG_ASYNC_XOR=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_WORKQUEUE=y
CONFIG_CRYPTO_CRYPTD=y
# CONFIG_CRYPTO_MCRYPTD is not set
CONFIG_CRYPTO_AUTHENC=y

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=y
# CONFIG_CRYPTO_AEGIS128L is not set
# CONFIG_CRYPTO_AEGIS256 is not set
# CONFIG_CRYPTO_MORUS640 is not set
# CONFIG_CRYPTO_MORUS1280 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
# CONFIG_CRYPTO_RMD128 is not set
# CONFIG_CRYPTO_RMD160 is not set
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_TGR192 is not set
CONFIG_CRYPTO_WP512=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
# CONFIG_CRYPTO_TEA is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_PICOXCELL is not set
CONFIG_CRYPTO_DEV_EXYNOS_RNG=y
# CONFIG_CRYPTO_DEV_S5P is not set
# CONFIG_CRYPTO_DEV_ATMEL_AUTHENC is not set
CONFIG_CRYPTO_DEV_ATMEL_AES=y
# CONFIG_CRYPTO_DEV_ATMEL_TDES is not set
CONFIG_CRYPTO_DEV_ATMEL_SHA=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
# CONFIG_CRYPTO_DEV_QCE is not set
CONFIG_CRYPTO_DEV_QCOM_RNG=y
# CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
# CONFIG_CRYPTO_DEV_MEDIATEK is not set
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
CONFIG_CRYPTO_DEV_CCREE=y
CONFIG_CRYPTO_DEV_HISI_SEC=y
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_BITREVERSE=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_STMP_DEVICE=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
# CONFIG_XZ_DEC_ARM is not set
# CONFIG_XZ_DEC_ARMTHUMB is not set
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_BCH=y
CONFIG_BCH_CONST_PARAMS=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_HAVE_GENERIC_DMA_COHERENT=y
CONFIG_DMA_DIRECT_OPS=y
CONFIG_SWIOTLB=y
CONFIG_SGL_ALLOC=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_CLZ_TAB=y
# CONFIG_CORDIC is not set
CONFIG_DDR=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_SPLIT=y
CONFIG_SG_POOL=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
# CONFIG_PARMAN is not set
# CONFIG_STRING_SELFTEST is not set

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4

#
# Compile-time checks and compiler options
#
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_PAGE_OWNER is not set
CONFIG_DEBUG_FS=y
# CONFIG_HEADERS_CHECK is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_POISONING=y
# CONFIG_PAGE_POISONING_NO_SANITY is not set
# CONFIG_PAGE_POISONING_ZERO is not set
# CONFIG_DEBUG_PAGE_REF is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
CONFIG_DEBUG_OBJECTS_TIMERS=y
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_DEBUG_SLAB is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=1
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
CONFIG_WQ_WATCHDOG=y
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_TRACE_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
CONFIG_DEBUG_KOBJECT=y
# CONFIG_DEBUG_KOBJECT_RELEASE is not set
# CONFIG_DEBUG_BUGVERBOSE is not set
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PI_LIST is not set
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
# CONFIG_RCU_PERF_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_PREEMPTIRQ_EVENTS is not set
CONFIG_IRQSOFF_TRACER=y
CONFIG_SCHED_TRACER=y
# CONFIG_HWLAT_TRACER is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
CONFIG_TRACEPOINT_BENCHMARK=y
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_TRACE_EVAL_MAP_FILE=y
CONFIG_TRACING_EVENTS_GPIO=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=y
CONFIG_TEST_LIST_SORT=y
CONFIG_TEST_SORT=y
CONFIG_BACKTRACE_SELF_TEST=y
CONFIG_RBTREE_TEST=y
# CONFIG_INTERVAL_TREE_TEST is not set
CONFIG_ATOMIC64_SELFTEST=y
CONFIG_TEST_HEXDUMP=y
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
CONFIG_TEST_BITMAP=y
# CONFIG_TEST_BITFIELD is not set
CONFIG_TEST_UUID=y
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_IDA is not set
CONFIG_FIND_BIT_BENCHMARK=y
CONFIG_TEST_FIRMWARE=y
CONFIG_TEST_UDELAY=y
# CONFIG_MEMTEST is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_SAMPLES is not set
CONFIG_UBSAN=y
CONFIG_UBSAN_ALIGNMENT=y
# CONFIG_CMDLINE_BOOL is not set
CONFIG_EARLY_PRINTK=y

--t2BeR/0bYevrNdMo--
