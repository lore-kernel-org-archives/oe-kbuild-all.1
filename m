Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB6FA34
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xahl1F/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585178; x=1733121178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qcGTDv1hL3kyszllXdke3SRrbh/jMXcCd/YcpqMQ4c8=;
  b=Xahl1F/F5DzU9L253FBgqr1dCQ07Q192dk26TJrHwcHSqI5EU/E5Kord
   tMOguC9DeZ7hUc0rFj77YLd9cF16NDaugl3azY7XZWNxZtmGAhG8REqFa
   1k6Xv4sWgj/QFBP2JMsnVlDVh8QsJzcuwlmVzVpC3J/AGjCUeGRuOrXqj
   wAH0/Km6SyL8JR2qNwgPAF6V/rVOIdK1lGBDJPpYpAr6pHUcJVf6V4dGh
   dpd5exL1k9sIEuzI+lR8ptpoEgTH6HMHVlKci86w2jEHKxoG0fPwZcjOX
   J5xm8Ycjd++ivm2pQtvzK9vXx7bO4plLy+LeB69Un+Zo5pHT1v7K+2EZo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180427"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180427"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081649"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081649"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006Lq-2I;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202312030323.INGDtNZn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 90db9dbedd26ce029f3a0f8d2cbd3a142f452408 kasan, powerpc: don't rename memintrinsics if compiler adds prefixes
date:   8 months ago
config: powerpc64-randconfig-r112-20231120 (https://download.01.org/0day-ci/archive/20231203/202312030323.INGDtNZn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030323.INGDtNZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312030323.INGDtNZn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/char/tpm/tpm_ibmvtpm.c:125:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:125:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:125:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     expected void const *
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     got void [noderef] __iomem *rtce_buf
>> drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     expected void const *
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     got void [noderef] __iomem *rtce_buf
>> drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     expected void *p
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     got void [noderef] __iomem *rtce_buf
   drivers/char/tpm/tpm_ibmvtpm.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:366:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:366:30: sparse:     expected void const *objp
   drivers/char/tpm/tpm_ibmvtpm.c:366:30: sparse:     got void [noderef] __iomem *rtce_buf
   drivers/char/tpm/tpm_ibmvtpm.c:525:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *rtce_buf @@     got void * @@
   drivers/char/tpm/tpm_ibmvtpm.c:525:43: sparse:     expected void [noderef] __iomem *rtce_buf
   drivers/char/tpm/tpm_ibmvtpm.c:525:43: sparse:     got void *
   drivers/char/tpm/tpm_ibmvtpm.c:532:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:532:52: sparse:     expected void *ptr
   drivers/char/tpm/tpm_ibmvtpm.c:532:52: sparse:     got void [noderef] __iomem *rtce_buf
   drivers/char/tpm/tpm_ibmvtpm.c:538:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:538:46: sparse:     expected void const *objp
   drivers/char/tpm/tpm_ibmvtpm.c:538:46: sparse:     got void [noderef] __iomem *rtce_buf

vim +126 drivers/char/tpm/tpm_ibmvtpm.c

132f7629474424 Ashley Lai        2012-08-22   94  
132f7629474424 Ashley Lai        2012-08-22   95  /**
132f7629474424 Ashley Lai        2012-08-22   96   * tpm_ibmvtpm_recv - Receive data after send
93c12f293f8798 Winkler, Tomas    2016-11-23   97   *
132f7629474424 Ashley Lai        2012-08-22   98   * @chip:	tpm chip struct
132f7629474424 Ashley Lai        2012-08-22   99   * @buf:	buffer to read
93c12f293f8798 Winkler, Tomas    2016-11-23  100   * @count:	size of buffer
132f7629474424 Ashley Lai        2012-08-22  101   *
93c12f293f8798 Winkler, Tomas    2016-11-23  102   * Return:
132f7629474424 Ashley Lai        2012-08-22  103   *	Number of bytes read
132f7629474424 Ashley Lai        2012-08-22  104   */
132f7629474424 Ashley Lai        2012-08-22  105  static int tpm_ibmvtpm_recv(struct tpm_chip *chip, u8 *buf, size_t count)
132f7629474424 Ashley Lai        2012-08-22  106  {
9e0d39d8a6a0a8 Christophe Ricard 2016-03-31  107  	struct ibmvtpm_dev *ibmvtpm = dev_get_drvdata(&chip->dev);
132f7629474424 Ashley Lai        2012-08-22  108  	u16 len;
132f7629474424 Ashley Lai        2012-08-22  109  
132f7629474424 Ashley Lai        2012-08-22  110  	if (!ibmvtpm->rtce_buf) {
132f7629474424 Ashley Lai        2012-08-22  111  		dev_err(ibmvtpm->dev, "ibmvtpm device is not ready\n");
132f7629474424 Ashley Lai        2012-08-22  112  		return 0;
132f7629474424 Ashley Lai        2012-08-22  113  	}
132f7629474424 Ashley Lai        2012-08-22  114  
b5666502700855 Ashley Lai        2012-09-12  115  	len = ibmvtpm->res_len;
132f7629474424 Ashley Lai        2012-08-22  116  
b5666502700855 Ashley Lai        2012-09-12  117  	if (count < len) {
132f7629474424 Ashley Lai        2012-08-22  118  		dev_err(ibmvtpm->dev,
37ab03414829e5 Jason Gunthorpe   2013-09-14  119  			"Invalid size in recv: count=%zd, crq_size=%d\n",
b5666502700855 Ashley Lai        2012-09-12  120  			count, len);
132f7629474424 Ashley Lai        2012-08-22  121  		return -EIO;
132f7629474424 Ashley Lai        2012-08-22  122  	}
132f7629474424 Ashley Lai        2012-08-22  123  
132f7629474424 Ashley Lai        2012-08-22  124  	spin_lock(&ibmvtpm->rtce_lock);
b5666502700855 Ashley Lai        2012-09-12 @125  	memcpy((void *)buf, (void *)ibmvtpm->rtce_buf, len);
b5666502700855 Ashley Lai        2012-09-12 @126  	memset(ibmvtpm->rtce_buf, 0, len);
b5666502700855 Ashley Lai        2012-09-12  127  	ibmvtpm->res_len = 0;
132f7629474424 Ashley Lai        2012-08-22  128  	spin_unlock(&ibmvtpm->rtce_lock);
132f7629474424 Ashley Lai        2012-08-22  129  	return len;
132f7629474424 Ashley Lai        2012-08-22  130  }
132f7629474424 Ashley Lai        2012-08-22  131  

:::::: The code at line 126 was first introduced by commit
:::::: b5666502700855a1eb1a15482005b22478b9460e drivers/char/tpm: remove tasklet and cleanup

:::::: TO: Ashley Lai <adlai@linux.vnet.ibm.com>
:::::: CC: Kent Yoder <key@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
