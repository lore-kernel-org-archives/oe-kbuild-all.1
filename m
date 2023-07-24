Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3D48C15
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 13:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690207082; x=1721743082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TNL8SNf44HdiVQPtoWGEn3diq6by9aPcf5MMkQAYHwI=;
  b=CcweqHTkCct8QWGyCc3+zMCDI0FLuBItrLji/EbKGGj7aE68iliUeZ0J
   rMEiZZo2C0XQAyx3rHhsOIL1JMUJYe4mwlAbdE8LnLoh6LGe+NAG2+Mk9
   h9+Mg0ReTezpGCT9r3efMnfxhKG6RcF/HuAiMN1SQLBQJIZ5ecqLsBE4m
   wtXFU0dPHbihli1rNADSLFqi0Qd09HiTiagGH/haw5QIJUnRgNOqSgRzk
   cEGU2Mhn2oeToy1JuF/9KChdQJSmfdHbSzVXJ02CTqmMQCnrVD7jjS0jT
   0DmUJRGCi3+e2NwSNDS6CTS3ncbd0+EkIg6OferpVQeUIReWKGOzkFKxn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367471381"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="367471381"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 06:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849637008"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="849637008"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Jul 2023 06:57:58 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNw37-0009ke-2z;
	Mon, 24 Jul 2023 13:56:50 +0000
Date: Mon, 24 Jul 2023 21:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: drivers/mtd/nand/raw/sh_flctl.c:512:24: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202307242110.JAXek08p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6eaae198076080886b9e7d57f4ae06fa782f90ef
commit: 548927e0312194167f7ee5de47d50c2036088cce arm64: io: Use asm-generic high level MMIO accessors
date:   1 year, 1 month ago
config: arm64-randconfig-r081-20230723 (https://download.01.org/0day-ci/archive/20230724/202307242110.JAXek08p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242110.JAXek08p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307242110.JAXek08p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mtd/nand/raw/sh_flctl.c:458:16: sparse: sparse: cast to restricted __le32
   drivers/mtd/nand/raw/sh_flctl.c:458:16: sparse: sparse: cast to restricted __le32
   drivers/mtd/nand/raw/sh_flctl.c:458:16: sparse: sparse: cast to restricted __le32
   drivers/mtd/nand/raw/sh_flctl.c:458:16: sparse: sparse: cast to restricted __le32
   drivers/mtd/nand/raw/sh_flctl.c:458:16: sparse: sparse: cast to restricted __le32
   drivers/mtd/nand/raw/sh_flctl.c:458:16: sparse: sparse: cast to restricted __le32
   drivers/mtd/nand/raw/sh_flctl.c:481:26: sparse: sparse: cast to restricted __be32
   drivers/mtd/nand/raw/sh_flctl.c:496:38: sparse: sparse: cast to restricted __be32
>> drivers/mtd/nand/raw/sh_flctl.c:512:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/mtd/nand/raw/sh_flctl.c:512:24: sparse:     expected unsigned int [usertype] value
   drivers/mtd/nand/raw/sh_flctl.c:512:24: sparse:     got restricted __be32 [usertype]
   drivers/mtd/nand/raw/sh_flctl.c:525:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __be32 [usertype] @@
   drivers/mtd/nand/raw/sh_flctl.c:525:24: sparse:     expected unsigned long
   drivers/mtd/nand/raw/sh_flctl.c:525:24: sparse:     got restricted __be32 [usertype]

vim +512 drivers/mtd/nand/raw/sh_flctl.c

6028aa01f759a1d drivers/mtd/nand/sh_flctl.c Yoshihiro Shimoda 2008-10-14  502  
e8a9d8f31c592ee drivers/mtd/nand/sh_flctl.c Bastian Hecht     2012-10-19  503  static void write_fiforeg(struct sh_flctl *flctl, int rlen,
e8a9d8f31c592ee drivers/mtd/nand/sh_flctl.c Bastian Hecht     2012-10-19  504  						unsigned int offset)
6028aa01f759a1d drivers/mtd/nand/sh_flctl.c Yoshihiro Shimoda 2008-10-14  505  {
6028aa01f759a1d drivers/mtd/nand/sh_flctl.c Yoshihiro Shimoda 2008-10-14  506  	int i, len_4align;
e8a9d8f31c592ee drivers/mtd/nand/sh_flctl.c Bastian Hecht     2012-10-19  507  	unsigned long *buf = (unsigned long *)&flctl->done_buff[offset];
6028aa01f759a1d drivers/mtd/nand/sh_flctl.c Yoshihiro Shimoda 2008-10-14  508  
6028aa01f759a1d drivers/mtd/nand/sh_flctl.c Yoshihiro Shimoda 2008-10-14  509  	len_4align = (rlen + 3) / 4;
6028aa01f759a1d drivers/mtd/nand/sh_flctl.c Yoshihiro Shimoda 2008-10-14  510  	for (i = 0; i < len_4align; i++) {
6028aa01f759a1d drivers/mtd/nand/sh_flctl.c Yoshihiro Shimoda 2008-10-14  511  		wait_wfifo_ready(flctl);
e8a9d8f31c592ee drivers/mtd/nand/sh_flctl.c Bastian Hecht     2012-10-19 @512  		writel(cpu_to_be32(buf[i]), FLDTFIFO(flctl));
6028aa01f759a1d drivers/mtd/nand/sh_flctl.c Yoshihiro Shimoda 2008-10-14  513  	}
6028aa01f759a1d drivers/mtd/nand/sh_flctl.c Yoshihiro Shimoda 2008-10-14  514  }
6028aa01f759a1d drivers/mtd/nand/sh_flctl.c Yoshihiro Shimoda 2008-10-14  515  

:::::: The code at line 512 was first introduced by commit
:::::: e8a9d8f31c592eea89f1b0d3fd425e7a96944e88 mtd: sh_flctl: Minor cleanups

:::::: TO: Bastian Hecht <hechtb@googlemail.com>
:::::: CC: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
